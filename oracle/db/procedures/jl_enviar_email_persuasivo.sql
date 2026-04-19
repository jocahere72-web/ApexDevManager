
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_ENVIAR_EMAIL_PERSUASIVO" (p_cdgo_clnte number,
                                                       p_idntfccion varchar2 default null) is

  cursor c1 is
    select a.idntfccion,
           a.asnto,
           lower(trim(a.email)) email, -- 'jlujan@infortributos.com' email, --
           a.html,
           a.id_envio_prgrmdo,
           a.nmbre,
           a.file_name,
           a.file_name_2,
           a.id_sjto_impsto,
           a.id_acto
      from temp_enviar_email_persuasivo a
     where a.idntfccion = p_idntfccion
        or p_idntfccion is null
     order by a.idntfccion;

  v_valid_email boolean;

  v_cdgo_rspsta number;
  v_rspsta      varchar2(500);

  r_id_envio        number;
  r_id_envio_mdio   number;
  r_id_envio_adjnto number;

  v_html clob;

  v_src_loc bfile;
  v_blob    blob;

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

        if r1.file_name is not null then

          v_src_loc := bfilename('LOGS', r1.file_name);

          if dbms_lob.fileexists(v_src_loc) = 1 then
            dbms_lob.open(v_src_loc, dbms_lob.lob_readonly);
            dbms_lob.createtemporary(v_blob, true);

            -- cargar el contenido del archivo
            dbms_lob.loadfromfile(v_blob,
                                  v_src_loc,
                                  dbms_lob.getlength(v_src_loc));

            pkg_ma_envios.prc_rg_envio_adjntos(p_id_envio        => r_id_envio,
                                               p_file_blob       => v_blob,
                                               p_file_name       => r1.file_name,
                                               p_file_mimetype   => 'application/pdf',
                                               o_id_envio_adjnto => r_id_envio_adjnto,
                                               o_cdgo_rspsta     => v_cdgo_rspsta,
                                               o_mnsje_rspsta    => v_rspsta);
          else

            RAISE_APPLICATION_ERROR(-20001,
                                    'Archivo no encontrado: ' ||
                                    r1.file_name);
            dbms_output.put_line('idntfccion : ' || r1.idntfccion ||
                                 ' - Error adjuntar archivo: ' ||
                                 r1.file_name);
          end if;

          dbms_lob.close(v_src_loc);
          dbms_lob.freetemporary(v_blob);

        end if;

        if r1.file_name_2 is not null then

          v_src_loc := bfilename('LOGS', r1.file_name_2);

          if dbms_lob.fileexists(v_src_loc) = 1 then
            dbms_lob.open(v_src_loc, dbms_lob.lob_readonly);
            dbms_lob.createtemporary(v_blob, true);

            -- cargar el contenido del archivo
            dbms_lob.loadfromfile(v_blob,
                                  v_src_loc,
                                  dbms_lob.getlength(v_src_loc));

            pkg_ma_envios.prc_rg_envio_adjntos(p_id_envio        => r_id_envio,
                                               p_file_blob       => v_blob,
                                               p_file_name       => r1.file_name_2,
                                               p_file_mimetype   => 'application/pdf',
                                               o_id_envio_adjnto => r_id_envio_adjnto,
                                               o_cdgo_rspsta     => v_cdgo_rspsta,
                                               o_mnsje_rspsta    => v_rspsta);
          else

            RAISE_APPLICATION_ERROR(-20001,
                                    'Archivo no encontrado: ' ||
                                    r1.file_name_2);
            dbms_output.put_line('idntfccion : ' || r1.idntfccion ||
                                 ' - Error adjuntar archivo: ' ||
                                 r1.file_name_2);
          end if;

          dbms_lob.close(v_src_loc);
          dbms_lob.freetemporary(v_blob);

        end if;

        if v_cdgo_rspsta = 0 then
          update ma_g_envios a
             set a.id_sjto_impsto = r1.id_sjto_impsto,
                 a.id_acto        = r1.id_acto
           where a.id_envio = r_id_envio;

          commit;
          pkg_ma_envios.prc_rg_envio_estado(p_id_envio_mdio    => r_id_envio_mdio,
                                            p_cdgo_envio_estdo => 'ENC',
                                            o_cdgo_rspsta      => v_cdgo_rspsta,
                                            o_mnsje_rspsta     => v_rspsta);
        end if;
      end if;

      commit;
    else
      dbms_output.put_line('idntfccion : ' || r1.idntfccion ||
                           ' - Email invalido: ' || r1.email);
    end if;
  end loop;

end jl_enviar_email_persuasivo;
/

