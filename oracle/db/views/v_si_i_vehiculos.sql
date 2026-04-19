
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SI_I_VEHICULOS" ("ID_VHCLO", "ID_SJTO_IMPSTO", "CDGO_VHCLO_CLSE", "DSCRPCION_VHCLO_CLSE", "CDGO_VHCLO_MRCA", "DSCRPCION_VHCLO_MRCA", "ID_VHCLO_LNEA", "DSCRPCION_VHCLO_LNEA", "NMRO_MTRCLA", "FCHA_MTRCLA", "CDGO_VHCLO_SRVCIO", "DSCRPCION_VHCLO_SRVCIO", "VLOR_CMRCIAL", "FCHA_CMPRA", "AVLUO", "CLNDRJE", "CPCDAD_CRGA", "CPCDAD_PSJRO", "CDGO_VHCLO_CRRCRIA", "DSCRPCION_VHCLO_BLNDJE", "DSCRPCION_VHCLO_CRROCRIA", "NMRO_CHSIS", "NMRO_MTOR", "MDLO", "CDGO_VHCLO_CMBSTBLE", "DSCRPCION_VHCULO_CMBSTBLE", "NMRO_DCLRCION_IMPRTCION", "FCHA_IMPRTCION", "ID_ORGNSMO_TRNSTO", "NMBRE_ORGNSMO_TRNSTO", "CDGO_VHCLO_BLNDJE", "CDGO_VHCLO_CTGTRIA", "DSCRPCION_VHCLO_CTGTRIA", "CDGO_VHCLO_OPRCION", "DSCRPCION_VHCLO_OPRCION", "ID_ASGRDRA", "NMBRE_ASGRDRA", "NMRO_SOAT", "FCHA_VNCMNTO_SOAT", "CDGO_VHCLO_TRNSMSION", "DSCRPCION_VHCLO_TRNSMSION") AS
  select a.id_vhclo,
a.id_sjto_impsto,
a.cdgo_vhclo_clse,
c.dscrpcion_vhclo_clse,
a.cdgo_vhclo_mrca,
d.dscrpcion_vhclo_mrca,
a.id_vhclo_lnea,
e.dscrpcion_vhclo_lnea,
a.nmro_mtrcla,
a.fcha_mtrcla,
a.cdgo_vhclo_srvcio,
f.dscrpcion_vhclo_srvcio,
a.vlor_cmrcial,
a.fcha_cmpra,
a.avluo,
a.clndrje,
a.cpcdad_crga,
a.cpcdad_psjro,
a.cdgo_vhclo_crrcria,
t.dscrpcion_vhclo_blndje,
g.dscrpcion_vhclo_crrocria,
a.nmro_chsis,
a.nmro_mtor,
a.mdlo,
a.cdgo_vhclo_cmbstble,
h.dscrpcion_vhculo_cmbstble,
a.nmro_dclrcion_imprtcion,
a.fcha_imprtcion,
a.id_orgnsmo_trnsto,
i.nmbre_orgnsmo_trnsto,
a.cdgo_vhclo_blndje,
a.cdgo_vhclo_ctgtria,
k.dscrpcion_vhclo_ctgtria,
a.cdgo_vhclo_oprcion,
l.dscrpcion_vhclo_oprcion,
a.id_asgrdra,
m.nmbre_asgrdra,
a.nmro_soat,
a.fcha_vncmnto_soat,
a.cdgo_vhclo_trnsmsion,
n.dscrpcion_vhclo_trnsmsion
from si_i_vehiculos a
join si_i_sujetos_impuesto o on a.id_sjto_impsto = o.id_sjto_impsto
join si_c_sujetos b on o.id_sjto = b.id_sjto
join df_s_vehiculos_clase c on a.cdgo_vhclo_clse = c.cdgo_vhclo_clse
join df_s_vehiculos_marca d on a.cdgo_vhclo_mrca = d.cdgo_vhclo_mrca
join df_s_vehiculos_linea e on a.id_vhclo_lnea = e.id_vhclo_lnea
join df_s_vehiculos_blindaje t on t.cdgo_vhclo_blndje = a.cdgo_vhclo_blndje
left join df_s_vehiculos_servicio f on a.cdgo_vhclo_srvcio = f.cdgo_vhclo_srvcio
left join df_s_vehiculos_carroceria g on a.cdgo_vhclo_crrcria = g.cdgo_vhclo_crrcria
left join df_s_organismos_transito i on a.id_orgnsmo_trnsto = i.id_orgnsmo_trnsto
left join df_s_vehiculos_categoria k on a.cdgo_vhclo_ctgtria = k.cdgo_vhclo_ctgtria
left join df_s_vehiculos_operacion l on a.cdgo_vhclo_oprcion = l.cdgo_vhclo_oprcion
left join df_s_aseguradoras m on a.id_asgrdra = m.id_asgrdra
left join df_s_vehiculos_transmision n on a.cdgo_vhclo_trnsmsion = n.cdgo_vhclo_trnsmsion
left join df_s_vehiculos_combustible h on a.cdgo_vhclo_cmbstble = h.cdgo_vhclo_cmbstble
;

