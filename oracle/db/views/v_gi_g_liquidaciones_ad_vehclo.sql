
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_LIQUIDACIONES_AD_VEHCLO" ("ID_LQDCION_AD_VHCLO", "ID_LQDCION", "CDGO_VHCLO_CLSE", "DSCRPCION_VHCLO_CLSE", "CDGO_VHCLO_MRCA", "DSCRPCION_VHCLO_MRCA", "MNSTRIO", "ID_VHCLO_LNEA", "DSCRPCION_VHCLO_LNEA", "CDGO_VHCLO_SRVCIO", "DSCRPCION_VHCLO_SRVCIO", "CLNDRJE", "CPCDAD_CRGA", "CPCDAD_PSJRO", "MDLO", "CDGO_VHCLO_CRRCRIA", "DSCRPCION_VHCLO_CRROCRIA", "CDGO_VHCLO_BLNDJE", "DSCRPCION_VHCLO_BLNDJE", "CDGO_VHCLO_OPRCION", "DSCRPCION_VHCLO_OPRCION", "ID_VHCLO_GRPO", "GRPO", "FRCCION") AS
  select a.id_lqdcion_ad_vhclo
, a.id_lqdcion
, a.cdgo_vhclo_clse
, b.dscrpcion_vhclo_clse
, a.cdgo_vhclo_mrca
, c.dscrpcion_vhclo_mrca
, c.mnstrio
, a.id_vhclo_lnea
, d.dscrpcion_vhclo_lnea
, a.cdgo_vhclo_srvcio
, e.dscrpcion_vhclo_srvcio
, a.clndrje
, a.cpcdad_crga
, a.cpcdad_psjro
, a.mdlo
, a.cdgo_vhclo_crrcria
, f.dscrpcion_vhclo_crrocria
, a.cdgo_vhclo_blndje
, g.dscrpcion_vhclo_blndje
, a.cdgo_vhclo_oprcion
, h.dscrpcion_vhclo_oprcion
, a.id_vhclo_grpo
, i.grpo
,a.frccion
from gi_g_liquidaciones_ad_vehclo a
join df_s_vehiculos_clase b on a.cdgo_vhclo_clse = b.cdgo_vhclo_clse
join df_s_vehiculos_marca c on a.cdgo_vhclo_mrca = c.cdgo_vhclo_mrca
join df_s_vehiculos_linea d on a.id_vhclo_lnea = d.id_vhclo_lnea
left join df_s_vehiculos_servicio e on a.cdgo_vhclo_srvcio = e.cdgo_vhclo_srvcio
left join df_s_vehiculos_carroceria f on a.cdgo_vhclo_crrcria = f.cdgo_vhclo_crrcria
join df_s_vehiculos_blindaje g on a.cdgo_vhclo_blndje = g.cdgo_vhclo_blndje
/* and g.vgncia = (
select extract( year from x.fcha_mtrcla)
from si_i_vehiculos x
join gi_g_liquidaciones y on x.id_sjto_impsto = y.id_sjto_impsto
where y.id_lqdcion = a.id_lqdcion
)*/
left join df_s_vehiculos_operacion h on a.cdgo_vhclo_oprcion = h.cdgo_vhclo_oprcion
join df_s_vehiculos_grupo i on a.id_vhclo_grpo = i.id_vhclo_grpo
;

