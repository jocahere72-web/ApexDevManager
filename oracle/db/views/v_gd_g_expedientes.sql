
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GD_G_EXPEDIENTES" ("ID_EXPDNTE", "CDGO_CLNTE", "NMRO_EXPDNTE", "NMBRE_EXPDNTE", "OBSRVCION_EXPDNTE", "FCHA_EXPDNTE", "ACTVO_EXPDNTE", "ID_AREA", "NMBRE_AREA", "ID_PRCSO_CLDAD", "NMBRE_CLDAD", "ACTVO_CLDAD", "ID_PRCSO_SSTMA", "NMBRE_SSTMA", "DSCRPCION_SSTMA", "ID_FNCNRIO_JFE", "ACTVO_SSTMA", "ID_SRIE", "CDGO_SRIE", "NMBRE_SRIE", "OBSRVCION_SRIE", "ACTVO_SRIE", "ID_SBSRIE", "CDGO_SBSRIE", "NMBRE_SBSRIE", "OBSRVCION_SBSRIE", "ACTVO_SBSRIE") AS
  select e.id_expdnte,
	   s.cdgo_clnte,
	   e.nmro_expdnte,
	   e.nmbre nmbre_expdnte,
	   e.obsrvcion obsrvcion_expdnte,
	   e.fcha fcha_expdnte,
	   e.actvo actvo_expdnte,
	   e.id_area,
	   a.nmbre_area,
	   e.id_prcso_cldad,
	   pc.nmbre_prcso nmbre_cldad,
	   pc.actvo actvo_cldad,
	   e.id_prcso_sstma,
	   ps.nmbre	nmbre_sstma,
	   ps.dscrpcion dscrpcion_sstma,
	   ps.id_fncnrio_jfe,
	   ps.actvo actvo_sstma,
	   e.id_srie,
	   s.cdgo_srie,
	   s.nmbre_srie,
	   s.obsrvcion obsrvcion_srie,
	   s.actvo actvo_srie,
	   e.id_sbsrie,
	   sb.cdgo_srie cdgo_sbsrie,
	   sb.nmbre_srie nmbre_sbsrie,
	   sb.obsrvcion obsrvcion_sbsrie,
	   sb.actvo actvo_sbsrie
  from gd_g_expedientes e
  join df_c_areas a
    on a.id_area   = e.id_area
  join df_c_procesos pc
    on pc.id_prcso = e.id_prcso_cldad
   and pc.id_area  = a.id_area
  join df_s_procesos ps
    on ps.id_prcso = e.id_prcso_sstma
  join gd_d_series s
    on s.id_srie   = e.id_srie
left join gd_d_series sb
   on sb.id_srie   = e.id_sbsrie;

