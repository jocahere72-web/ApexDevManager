
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_GENERAR_RSLCION_EMBRGO" (p_cdgo_clnte number) is
  v_id_acto   gn_g_actos.id_acto%type;
  v_documento clob;
  v_data      varchar2(4000);
  v_dataii    varchar2(4000);
  v_id_rprte  number;
begin

  for c_embrgos in (select c.id_embrgos_rslcion,
                           c.id_embrgos_crtra,
                           c.id_instncia_fljo,
                           c.id_acto,
                           c.id_plntlla
                      from v_mc_g_embargos_resolucion c
                     where to_char(c.fcha_acto, 'yyyymm') = '202410'
                     order by c.nmro_acto asc) loop

    v_data      := '<id_embrgos_crtra>' || c_embrgos.id_embrgos_crtra ||
                   '</id_embrgos_crtra><id_embrgos_rslcion>' ||
                   c_embrgos.id_embrgos_rslcion ||
                   '</id_embrgos_rslcion><id_acto>' || v_id_acto ||
                   '</id_acto>';
    v_documento := pkg_gn_generalidades.fnc_ge_dcmnto(v_data,
                                                      c_embrgos.id_plntlla);

    update mc_g_embargos_resolucion
       set dcmnto_rslcion = v_documento
     where id_embrgos_rslcion = c_embrgos.id_embrgos_rslcion;

    commit;

    select b.id_rprte
      into v_id_rprte
      from mc_g_embargos_resolucion a
      join gn_d_plantillas b
        on b.id_plntlla = a.id_plntlla
     where a.id_embrgos_rslcion = c_embrgos.id_embrgos_rslcion;

    v_dataii := '<data><id_embrgos_rslcion>' ||
                c_embrgos.id_embrgos_rslcion ||
                '</id_embrgos_rslcion></data>';

    -- generar blob de la resoluci?n de embargo
    --prc_rg_blob_acto_embargo(p_cdgo_clnte, c_crtra.id_acto, v_data, v_id_rprte);
    pkg_cb_medidas_cautelares.prc_rg_blob_acto_embargo(p_cdgo_clnte,
                                                       c_embrgos.id_acto,
                                                       v_dataii,
                                                       v_id_rprte);

  end loop;

end jl_generar_rslcion_embrgo;
/

