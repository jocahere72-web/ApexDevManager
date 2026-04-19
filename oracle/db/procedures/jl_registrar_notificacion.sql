
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_REGISTRAR_NOTIFICACION" (p_id_acto       IN NUMBER,
                                                      p_cdgo_clnte    IN VARCHAR2,
                                                      p_id_ntfccion   IN NUMBER DEFAULT NULL,
                                                      p_id_fncnrio    IN NUMBER,
                                                      p_ID_USRIO      in number,
                                                      p_fcha_ntfccion in date default sysdate,
                                                      -- Parámetros de SALIDA
                                                      o_id_ntfccion      OUT NUMBER, -- El ID de notificación usado o generado
                                                      o_cdgo_rspsta_char out varchar2, -- Salida de prc_rg_notificaciones (o_mnsje_tpo)
                                                      o_mnsje_rspsta     OUT VARCHAR2, -- Salida de ambos paquetes (o_mnsje)
                                                      o_cdgo_rspsta      out number -- Salida de prc_rg_notificacion_puntual (o_cdgo_rspsta)
                                                      ) AS
  v_id_ntfccion       NUMBER;
  v_cdgo_rspsta_char  VARCHAR2(500);
  v_mnsje_rspsta      VARCHAR2(4000);
  v_json_responsables CLOB;
  v_cdgo_rspsta       number;
BEGIN
  v_id_ntfccion := p_id_ntfccion;

  IF v_id_ntfccion IS NULL THEN
    --enviar a notificar
    pkg_nt_notificacion.prc_rg_notificaciones_actos(p_cdgo_clnte => p_cdgo_clnte,
                                                    p_id_acto    => p_id_acto,
                                                    p_id_usrio   => p_ID_USRIO,
                                                    p_id_fncnrio => p_id_fncnrio,
                                                    o_mnsje_tpo  => v_cdgo_rspsta_char,
                                                    o_mnsje      => v_mnsje_rspsta);
    /*
    pkg_nt_notificacion.prc_rg_notificaciones(p_id_ntfccion    => v_id_ntfccion,
                                              p_id_acto        => p_id_acto,
                                              p_cdgo_estdo     => 'NGN',
                                              p_indcdor_ntfcdo => 'N',
                                              p_id_fncnrio     => p_id_fncnrio,
                                              p_cdgo_clnte     => p_cdgo_clnte,
                                              o_mnsje_tpo      => v_cdgo_rspsta_char,
                                              o_mnsje          => v_mnsje_rspsta);*/
  END IF;

  -- Se ejecuta si no hubo un código de respuesta específico (error/éxito) en el primer paso
  IF v_cdgo_rspsta_char IS NULL THEN
    BEGIN
      SELECT json_arrayagg(json_object('ID_ACTO_RSPNSBLE' VALUE
                                       TRIM(r.id_acto_rspnsble)))
        INTO v_json_responsables
        FROM gn_g_actos_responsable r
       WHERE r.id_acto = p_id_acto;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        v_json_responsables := NULL;
    END;

    IF v_json_responsables IS NOT NULL then

      select a.id_ntfccion
        into v_id_ntfccion
        from nt_g_notificaciones a
       where a.id_acto = p_id_acto;

      o_id_ntfccion := v_id_ntfccion;
      --notificar por email
      pkg_nt_notificacion.prc_rg_notificacion_puntual(p_cdgo_clnte          => p_cdgo_clnte,
                                                      p_id_acto             => p_id_acto,
                                                      p_id_ntfccion         => v_id_ntfccion,
                                                      p_fcha_prsntccion     => sysdate,
                                                      p_json_rspnsbles      => v_json_responsables,
                                                      p_id_fncnrio          => p_id_fncnrio,
                                                      p_file_evdncia        => 'no_data.pdf',
                                                      p_cdgo_mdio           => 'CEL',
                                                      p_indcdor_envia_email => 'N',
                                                      o_cdgo_rspsta         => v_cdgo_rspsta,
                                                      o_mnsje_rspsta        => v_mnsje_rspsta);
      if v_cdgo_rspsta = 0 then
        for r1 in (select a.id_ntfccion,
                          a.id_acto,
                          c.id_ntfccion_rspnsble,
                          c.id_ntfcion_mdio_evdncia
                     from nt_g_notificaciones a
                     join nt_g_notificaciones_detalle b
                       on b.id_ntfccion = a.id_ntfccion
                     join nt_g_ntfccnes_rspnsble c
                       on c.id_ntfccion_dtlle = b.id_ntfccion_dtlle
                    where a.id_acto = p_id_acto) loop

          update gn_g_actos a
             set a.fcha_ntfccion = p_fcha_ntfccion
           where a.id_acto = r1.id_acto;

          update nt_g_notificaciones a
             set a.fcha_ntfccion = p_fcha_ntfccion
           where a.id_ntfccion = r1.id_ntfccion;

          update nt_g_ntfccnes_rspnsble a
             set a.fcha_ntfccion = p_fcha_ntfccion
           where a.id_ntfccion_rspnsble = r1.id_ntfccion_rspnsble;

          update nt_g_Medio_Entidad_Evdncia a
             set a.fcha_ntfccion = p_fcha_ntfccion
           where a.id_ntfcion_mdio_evdncia = r1.id_ntfcion_mdio_evdncia;

          update Nt_g_Email a
             set a.fcha_prsntcion = p_fcha_ntfccion
           where a.id_ntfcion_mdio_evdncia = r1.id_ntfcion_mdio_evdncia;

        end loop;
      end if;

    ELSE
      v_mnsje_rspsta     := 'Error: No se pudo obtener o generar un ID de notificación.';
      v_cdgo_rspsta_char := 'ERR_IDNTF';
    END IF;
  END IF;

  o_cdgo_rspsta_char := v_cdgo_rspsta_char;
  o_mnsje_rspsta     := v_mnsje_rspsta;
  o_cdgo_rspsta      := v_cdgo_rspsta;

EXCEPTION
  WHEN OTHERS THEN
    o_id_ntfccion      := v_id_ntfccion;
    o_cdgo_rspsta_char := 'ERR_PROC';
    o_mnsje_rspsta     := 'Error inesperado en prc_gestionar_notificacion: ' ||
                          SQLCODE || ' - ' || SQLERRM;
    o_cdgo_rspsta      := NULL;
END jl_registrar_notificacion;
/

