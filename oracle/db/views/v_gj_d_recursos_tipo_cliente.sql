
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GJ_D_RECURSOS_TIPO_CLIENTE" ("ID_RCRSO_TIPO_CLNTE", "CDGO_RCRSO_TPO", "DSCRPCION_RCRSO_TPO", "CDGO_CLNTE", "UNDAD_DRCION", "DRCION", "DIA_TPO", "UNDAD_DRCION_PR", "DRCION_PR", "DIA_TPO_PR", "A_I_R", "ACTVO") AS
  select a.id_rcrso_tipo_clnte,
		 a.cdgo_rcrso_tpo,
		 b.dscrpcion as dscrpcion_rcrso_tpo,
		 a.cdgo_clnte,
		 a.undad_drcion,
		 a.drcion,
		 a.dia_tpo,
		 a.undad_drcion_pr,
		 a.drcion_pr,
		 a.dia_tpo_pr,
		 a.a_i_r,
		 a.actvo
  from gj_d_recursos_tipo_cliente 	a
  left join gj_d_recursos_tipo 		b on a.cdgo_rcrso_tpo = b.cdgo_rcrso_tpo
;

