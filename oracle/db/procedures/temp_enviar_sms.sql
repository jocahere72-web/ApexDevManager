
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_ENVIAR_SMS" (p_tlfno     VARCHAR2,
                                            p_mnsje     VARCHAR2,
                                            p_tpo_mnsje VARCHAR2) IS

  req utl_http.req;
  res utl_http.resp;
  url VARCHAR2(4000) := 'http://99.0.3.141:8031/api-sms/api/sms';

  buffer  VARCHAR2(32767);
  content CLOB;

  v_rspsta temp_sms.rspsta%type;
  v_id_sms NUMBER;

  l_content_varchar VARCHAR2(32767);
  l_content_length  NUMBER;

  l_error_message VARCHAR2(4000);

BEGIN
  -- Initialize handles to NULL explicitly.
  -- UTL_HTTP procedures are generally safe with uninitialized handles,
  -- but this makes intent clear for cleanup.
  req := NULL;
  res := NULL;

  BEGIN
    -- 1. Construir el JSON
    SELECT JSON_OBJECT('telefono' VALUE p_tlfno, 'mensaje' VALUE p_mnsje)
      INTO content
      FROM dual;

    -- 2. Insertar el intento en la tabla de log
    INSERT INTO temp_sms
      (tpo_mnsje, fcha, tlfno, mnsje)
    VALUES
      (p_tpo_mnsje, SYSTIMESTAMP, p_tlfno, p_mnsje)
    RETURNING id_sms INTO v_id_sms;

    COMMIT;

    -- 3. Preparar la solicitud HTTP
    req := utl_http.begin_request(url, 'POST', 'HTTP/1.1');
    UTL_HTTP.set_body_charset(req, 'UTF-8');
    utl_http.set_header(req, 'User-Agent', 'Mozilla/5.0');
    utl_http.set_header(req,
                        'Content-Type',
                        'application/json; charset=utf-8');

    IF DBMS_LOB.GETLENGTH(content) > 32000 THEN
      l_content_varchar := DBMS_LOB.SUBSTR(content, 32000, 1);
    ELSE
      l_content_varchar := TO_CHAR(content);
    END IF;

    l_content_length := UTL_RAW.LENGTH(UTL_I18N.STRING_TO_RAW(l_content_varchar,
                                                              'AL32UTF8'));
    utl_http.set_header(req, 'Content-Length', l_content_length);

    IF DBMS_LOB.GETLENGTH(content) > 0 THEN
      UTL_HTTP.write_text(req, content);
    END IF;

    -- 4. Obtener la respuesta
    res := utl_http.get_response(req);

    v_rspsta := '';
    BEGIN
      LOOP
        utl_http.read_line(res, buffer);
        IF LENGTH(v_rspsta) + LENGTH(buffer) < 3980 THEN
          v_rspsta := v_rspsta || buffer;
        ELSE
          v_rspsta := SUBSTR(v_rspsta || buffer, 1, 3999);
          EXIT;
        END IF;
      END LOOP;
    EXCEPTION
      WHEN utl_http.end_of_body THEN
        NULL;
    END;

    -- Attempt to close response normally
    BEGIN
      utl_http.end_response(res);
      res := NULL; -- Mark as closed
    EXCEPTION
      WHEN OTHERS THEN
        -- Log or append error if needed, or just ignore if already closed/invalid
        l_error_message := NVL(l_error_message, '') ||
                           '; Err closing res normally: ' || SQLERRM;
        res             := NULL; -- Still ensure it's marked as null for subsequent cleanup
    END;

  EXCEPTION
    WHEN utl_http.request_failed THEN
      l_error_message := 'Request Failed: ' ||
                         UTL_HTTP.GET_DETAILED_SQLERRM;
      v_rspsta        := l_error_message;
    WHEN OTHERS THEN
      l_error_message := 'Error during HTTP operation: ' || SQLCODE ||
                         ' - ' || SQLERRM;
      v_rspsta        := l_error_message;
  END; -- End of main operational block

  BEGIN
    utl_http.end_response(res); -- Attempt to close res if it's still open/valid
  EXCEPTION
    WHEN OTHERS THEN
      NULL; -- Ignore errors (e.g., already closed, null, or invalid handle)
  END;
  res := NULL; -- Ensure res is nullified after attempting closure

  BEGIN
    utl_http.end_request(req); -- Attempt to close req if it's still open/valid
  EXCEPTION
    WHEN OTHERS THEN
      NULL; -- Ignore errors
  END;
  req := NULL; -- Ensure req is nullified

  -- 5. Actualizar el log con la respuesta
  IF v_id_sms IS NOT NULL THEN
    IF v_rspsta IS NULL AND l_error_message IS NOT NULL THEN
      v_rspsta := l_error_message;
    ELSIF v_rspsta IS NULL THEN
      v_rspsta := 'No response data or specific error message captured.';
    END IF;

    UPDATE temp_sms t
       SET t.fcha_rspsta = SYSTIMESTAMP,
           t.rspsta      = SUBSTR(v_rspsta, 1, 4000)
     WHERE t.id_sms = v_id_sms;
    COMMIT;
  ELSIF l_error_message IS NOT NULL THEN
    DBMS_OUTPUT.PUT_LINE('HTTP/Operation Error (temp_sms insert might have failed or was skipped): ' ||
                         l_error_message);
  END IF;

EXCEPTION
  WHEN OTHERS THEN
    BEGIN
      utl_http.end_request(req);
    EXCEPTION
      WHEN OTHERS THEN
        NULL;
    END;

    BEGIN
      utl_http.end_response(res);
    EXCEPTION
      WHEN OTHERS THEN
        NULL;
    END;
    RAISE;
END temp_enviar_sms;
/

