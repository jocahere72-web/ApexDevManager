
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_ENVIAR_EMAIL_PERSUASIVO_ADJUNTO_FIJO" (p_cdgo_clnte number,
                                                                    p_adjuntos   clob) is

  cursor c1 is
    select a.idntfccion,
           a.asnto,
           a.email, -- 'jvargas@infortributos.com' email,
           a.html,
           a.id_envio_prgrmdo,
           a.nmbre
      from temp_enviar_email_persuasivo a
    --  where a.email = 'impuestos@efecty.com.co'
     order by a.email;

  v_valid_email boolean;

  v_cdgo_rspsta number;
  v_rspsta      varchar2(500);

  r_id_envio        number;
  r_id_envio_mdio   number;
  r_id_envio_adjnto number;

  v_html clob;

  v_src_loc bfile;

begin

  for r1 in c1 loop
    v_valid_email := regexp_like(r1.email,
                                 '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

    if v_valid_email then

      pkg_ma_envios.prc_rg_envio(p_cdgo_clnte       => p_cdgo_clnte,
                                 p_id_envio_prgrmdo => r1.id_envio_prgrmdo,
                                 p_fcha_rgstro      => sysdate,
                                 p_fcha_prgrmda     => sysdate,
                                 o_id_envio         => r_id_envio,
                                 o_cdgo_rspsta      => v_cdgo_rspsta,
                                 o_mnsje_rspsta     => v_rspsta);
      if v_cdgo_rspsta = 0 then

        v_html := replace(r1.html, '#NOMBRE#', r1.nmbre);
        v_html := replace(v_html, '#NIT#', r1.idntfccion);

        pkg_ma_envios.prc_rg_envio_mdio(p_id_envio        => r_id_envio,
                                        p_cdgo_envio_mdio => 'EML',
                                        p_dstno           => r1.email,
                                        p_asnto           => r1.asnto,
                                        p_txto_mnsje      => v_html,
                                        o_id_envio_mdio   => r_id_envio_mdio,
                                        o_cdgo_rspsta     => v_cdgo_rspsta,
                                        o_mnsje_rspsta    => v_rspsta);

        FOR attachment_item IN (SELECT *
                                  FROM JSON_TABLE(p_adjuntos,
                                                  '$[*]'
                                                  COLUMNS(file_name
                                                          VARCHAR2(255) PATH
                                                          '$.file_name',
                                                          file_mimetype
                                                          VARCHAR2(255) PATH
                                                          '$.file_mimetype'))) LOOP

          v_src_loc := bfilename('PERSUASIVOS', attachment_item.file_name);

          if dbms_lob.fileexists(v_src_loc) = 1 then
            -- Registrar los adjuntos
            pkg_ma_envios.prc_rg_envio_adjntos(p_id_envio        => r_id_envio,
                                               p_file_blob       => null,
                                               p_file_name       => attachment_item.file_name,
                                               p_file_mimetype   => attachment_item.file_mimetype,
                                               p_file_bfile      => v_src_loc,
                                               o_id_envio_adjnto => r_id_envio_adjnto,
                                               o_cdgo_rspsta     => v_cdgo_rspsta,
                                               o_mnsje_rspsta    => v_rspsta);
          else

            RAISE_APPLICATION_ERROR(-20001,
                                    'Archivo no encontrado: ' ||
                                    attachment_item.file_name);
            dbms_output.put_line('idntfccion : ' || r1.idntfccion ||
                                 ' - Error adjuntar archivo: ' ||
                                 attachment_item.file_name);
          end if;

        END LOOP;

        pkg_ma_envios.prc_rg_envio_estado(p_id_envio_mdio    => r_id_envio_mdio,
                                          p_cdgo_envio_estdo => 'ENC',
                                          o_cdgo_rspsta      => v_cdgo_rspsta,
                                          o_mnsje_rspsta     => v_rspsta);
        commit;
      end if;

    else
      dbms_output.put_line('idntfccion : ' || r1.idntfccion ||
                           ' - Email invalido: ' || r1.email);
    end if;
  end loop;

end jl_enviar_email_persuasivo_adjunto_fijo;
/

