
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_DCLRCNES_NVDAD" ("ID_NVDAD", "ID_DCLRCION", "CDGO_ESTDO", "STADO", "FCHA_NVDAD", "CDGO_TPO", "DSCRPCION_TPO", "VGNCIA_ANT", "VGNCIA_NVO", "NMRO_CNSCTVO", "NMBRE_DCLRCION_USO", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "NMBRE_RZON_SCIAL", "IDNTFCCION", "ID_SJTO_IMPSTO") AS
  select
    a.id_nvdad,
    a.id_dclrcion,
    a.cdgo_estdo,
    ( case
        when a.cdgo_estdo = 'PS' then
          'Registrado'
        when a.cdgo_estdo = 'AP' then
          'Aplicado'
        when a.cdgo_estdo = 'CN' then
          'Cancelado'
      end ) as stado,
    a.fcha_nvdad,
    b.cdgo_tpo,
    b.dscrpcion_tpo,
    c.vgncia_antrior || ' ' || (select e.dscrpcion from df_i_periodos e where c.id_prdo_antrior = e.id_prdo ) as vgncia_ant,
    c.vgncia_nvo || ' ' || (select e.dscrpcion from df_i_periodos e where c.id_prdo_nvo = e.id_prdo) as vgncia_nvo,
    d.nmro_cnsctvo,
    e.nmbre_dclrcion_uso,
    f.id_impsto,
    f.nmbre_impsto,
    g.id_impsto_sbmpsto,
    g.nmbre_impsto_sbmpsto,
    h.nmbre_rzon_scial,
    j.idntfccion,
    d.id_sjto_impsto
  from  gi_g_dclrcnes_nvdad a
  join gi_d_dclrcnes_nvdad_tpo    b on a.id_nvdad_tpo = b.id_nvdad_tpo
  join gi_g_dclrcnes_nvdad_dtlle  c on a.id_nvdad = c.id_nvdad
  join gi_g_declaraciones         d on a.id_dclrcion = d.id_dclrcion
  join gi_d_declaraciones_uso     e on d.id_dclrcion_uso = e.id_dclrcion_uso
  join df_c_impuestos             f on d.id_impsto = f.id_impsto
  join df_i_impuestos_subimpuesto g on d.id_impsto_sbmpsto = g.id_impsto_sbmpsto
  join si_i_personas              h on d.id_sjto_impsto = h.id_sjto_impsto
  join si_i_sujetos_impuesto      i on d.id_sjto_impsto = i.id_sjto_impsto
  join si_c_sujetos               j on i.id_sjto = j.id_sjto
  order by fcha_nvdad desc
;

