
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_NT_G_NOTFCCNES_ACTA_PP" ("CIUDAD", "DIA_SEMANA", "DIA", "MES", "ANO", "HORA", "FUNCIONARIO", "FUNC_ID", "CARGO", "TIPO_ID", "NUMERO_ID", "NOMBRE", "TIPO_RESPONSABLE", "TP", "TIPO_ACTO", "ACTO", "FECHA_ACTO", "ESCUDO") AS
  select cl.nmbre_mncpio ciudad,
       to_char(systimestamp, 'Day') dia_semana,
       to_char(systimestamp, 'dd') dia,
       to_char(systimestamp, 'Month') mes,
       to_char(systimestamp, 'yyyy') ano,
       to_char(systimestamp, 'hh:mm:ss a.m.') hora,
       fn.nmbre_trcro funcionario,
       fn.idntfccion func_id,
       fn.nmbre_crgo cargo,
       ti.nmtcnco_idntfccion_tpo tipo_id,
       pp.nmro_idntfccion numero_id,
       (pp.prmer_nmbre || ' ' || pp.sgndo_nmbre || ' ' || pp.prmer_aplldo || ' ' ||
       pp.sgndo_aplldo) nombre,
       tr.dscrpcion_rspnsble_tpo tipo_responsable,
       pp.nmro_trjeta_prfsnal tp,
       nt.dscrpcion_acto_tpo tipo_acto,
       nt.nmro_acto acto,
       nt.fcha fecha_Acto,
       cl.escdo escudo
  from v_df_s_clientes             cl,
       v_df_c_funcionarios         fn,
       df_s_responsables_tipo      tr,
       df_s_identificaciones_tipo  ti,
       nt_g_presentacion_personal  pp,
       nt_g_ntfccnes_rspnsble      nr,
       nt_g_notificaciones_detalle nd,
       v_nt_g_notfccnes_gn_g_actos nt
 where tr.cdgo_rspnsble_tpo = 'P'
   and ti.cdgo_idntfccion_tpo = pp.cdgo_idntfccion_tpo
   and pp.id_ntfcion_mdio_evdncia = nr.id_ntfcion_mdio_evdncia
   and nr.id_fncnrio = fn.id_fncnrio
   and nr.id_ntfccion_dtlle = nd.id_ntfccion_dtlle
   and nd.id_ntfccion = nt.id_ntfccion
   and cl.cdgo_clnte=nt.cdgo_clnte;

