
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_GENERAR_RSLCION_DESEMBRGO" (p_cdgo_clnte          number,
                                                         p_id_dsmbrgos_rslcion number,
                                                         p_rgnrar_html         varchar2 default 'N') is
  v_id_acto   gn_g_actos.id_acto%type;
  v_documento clob;
  v_data      varchar2(4000);
  v_dataii    varchar2(4000);
  v_id_rprte  number;
begin

  for c_dsmbrgos in (select c.id_dsmbrgos_rslcion,
                            a.id_embrgos_crtra,
                            c.id_instncia_fljo,
                            c.id_acto,
                            c.id_plntlla
                       from v_mc_g_desembargos_resolucion c
                       join mc_g_desembargos_cartera a
                         on a.id_dsmbrgos_rslcion = c.id_dsmbrgos_rslcion
                      where c.id_dsmbrgos_rslcion = p_id_dsmbrgos_rslcion
                      order by c.nmro_acto asc) loop

    if p_rgnrar_html = 'S' then
      v_documento := pkg_gn_generalidades.fnc_ge_dcmnto('{"id_embrgos_crtra":' ||
                                                        c_dsmbrgos.id_embrgos_crtra ||
                                                        ',"id_dsmbrgos_rslcion":' ||
                                                        c_dsmbrgos.id_dsmbrgos_rslcion ||
                                                        ',"id_acto":' ||
                                                        v_id_acto || '}',
                                                        c_dsmbrgos.id_plntlla);

      update mc_g_desembargos_resolucion
         set dcmnto_dsmbrgo = v_documento
       where id_dsmbrgos_rslcion = c_dsmbrgos.id_dsmbrgos_rslcion;

    end if;

    select b.id_rprte
      into v_id_rprte
      from mc_g_desembargos_resolucion a
      join gn_d_plantillas b
        on b.id_plntlla = a.id_plntlla
     where a.id_dsmbrgos_rslcion = c_dsmbrgos.id_dsmbrgos_rslcion;

    v_dataii := '<data><id_dsmbrgos_rslcion>' ||
                c_dsmbrgos.id_dsmbrgos_rslcion ||
                '</id_dsmbrgos_rslcion></data>';

    -- generar blob de la resoluci?n de embargo
    --prc_rg_blob_acto_embargo(p_cdgo_clnte, c_crtra.id_acto, v_data, v_id_rprte);
    pkg_cb_medidas_cautelares.prc_rg_blob_acto_embargo(p_cdgo_clnte,
                                                       c_dsmbrgos.id_acto,
                                                       v_dataii,
                                                       v_id_rprte);

    commit;

  end loop;

end jl_generar_rslcion_desembrgo;
/

