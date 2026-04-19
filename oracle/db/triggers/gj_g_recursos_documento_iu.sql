
  CREATE OR REPLACE EDITIONABLE TRIGGER "GJ_G_RECURSOS_DOCUMENTO_IU"
  for insert or update on gj_g_recursos_documento
  compound trigger  d number;

  v_html         clob;
  v_tmno         number;
  o_cdgo_mnsje   number;
  o_mnsje_rspsta varchar2(4000);
  v_cdgo_rspsta  number;
  v_mnsje_rspsta varchar2(4000);
  nmbre_up       varchar2(100);
  nmbre_up_2     varchar2(100);
  v_cdgo_clnte   number;

  before each row is
  begin
    if inserting then
      if :new.id_rcrso_dcmnto is null then
        d                    := sq_gj_g_recursos_documento.nextval();
        :new.id_rcrso_dcmnto := d;
      end if;
    end if;
    if :new.txto_dcmnto <> :old.txto_dcmnto then
      --Actualizar las particiones en el detalle
      v_html := :new.txto_dcmnto;

      if pkg_gn_generalidades.fnc_vl_html(p_html => v_html) = true then
        -- Generamos las particiones
        v_tmno         := 10000;
        v_cdgo_rspsta  := null;
        v_mnsje_rspsta := null;
        nmbre_up       := 'pkg_gn_generalidades.prc_html_dividir';
        nmbre_up_2     := 'pkg_gn_generalidades.fnc_vl_html';

        --v_html := pkg_gn_generalidades.fnc_html_escape(p_html => v_html);

        begin
          update gj_g_recursos_documento
             set txto_dcmnto = v_html
           where id_rcrso_dcmnto = :new.id_rcrso_dcmnto;
        exception
          when others then
            o_mnsje_rspsta := 'Problemas al actualizar el documento' ||
                              ' , ' || sqlerrm;
            pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  0,
                                  o_mnsje_rspsta,
                                  6);
        end;

        begin
          select cdgo_clnte
            into v_cdgo_clnte
            from df_s_clientes
           where actvo = 'S';
        exception
          when no_data_found then
            o_mnsje_rspsta := 'Problemas al consultar el cliente' || ' , ' ||
                              sqlerrm;
            pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  0,
                                  o_mnsje_rspsta,
                                  6);
        end;
        begin

          pkg_gn_generalidades.prc_html_dividir(p_html => v_html,
                                                p_tmno => v_tmno,
                                                /*p_id_aplccion   => nv('APP_ID'),
                                                                                                                                                                                                                        p_id_pgna       => nv('APP_PAGE_ID'),
                                                                                                                                                                                                                        p_id_username   => v('APP_USER'),*/
                                                o_cdgo_mnsje   => v_cdgo_rspsta,
                                                o_mnsje_rspsta => v_mnsje_rspsta);

          if v_cdgo_rspsta > 0 then
            o_mnsje_rspsta := v_cdgo_rspsta || ': ' ||
                              'Problemas al dividir el documento' || ' - ' ||
                              v_mnsje_rspsta || ' , ' || sqlerrm;
            pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  0,
                                  o_mnsje_rspsta,
                                  6);
          else
            --Se eliminan las porciones del acto
            begin
              delete from gj_g_recursos_documento_det a
               where a.id_rcrso_dcmnto = :new.id_rcrso_dcmnto;
            exception
              when others then
                o_mnsje_rspsta := 'No se pudo eliminar el datalle del documento id_rcrso_dcmnto ' ||
                                  :new.id_rcrso_dcmnto;
                pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                                      null,
                                      nmbre_up,
                                      0,
                                      o_mnsje_rspsta || ',' || sqlerrm,
                                      6);
            end;
            --Insertamos el detalle del documento
            for c_dcmnto_dtlle in (select n001 as orden, clob001 as dcmnto
                                     from apex_collections
                                    where collection_name = 'DATOS'
                                    order by orden) loop
              insert into gj_g_recursos_documento_det
                (id_rcrso_dcmnto, orden, dcmnto)
              values
                (:new.id_rcrso_dcmnto,
                 c_dcmnto_dtlle.orden,
                 c_dcmnto_dtlle.dcmnto);
            end loop;
          end if;
        end;
      else
        o_mnsje_rspsta := 'Problemas al validar el nuevo documento' ||
                          ' , ' || sqlerrm;
        pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                              null,
                              nmbre_up_2,
                              0,
                              o_mnsje_rspsta,
                              6);
      end if;
    end if;
  end before each row;
end;


/
ALTER TRIGGER "GJ_G_RECURSOS_DOCUMENTO_IU" ENABLE;

