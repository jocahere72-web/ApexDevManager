
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_FI_G_FISCALIZACION_EXPDNTE" ("CDGO_CLNTE", "ID_FSCLZCION_EXPDNTE", "ID_CNDDTO", "ID_PRGRMA", "ID_SBPRGRMA", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "ID_INSTNCIA_FLJO", "CDGO_EXPDNTE_ESTDO", "ID_EXPDNTE", "FCHA_APRTRA", "FCHA_CRRE", "ID_FNCNRIO", "ID_FSCLZCION_EXPDNTE_PDRE", "NMRO_EXPDNTE") AS
  select
	b.cdgo_clnte,
	a.id_fsclzcion_expdnte ,
	a.id_cnddto ,
	b.id_prgrma,
	b.id_sbprgrma,
	b.id_impsto,
	b.id_impsto_sbmpsto,
	b.id_sjto_impsto,
	a.id_instncia_fljo ,
	a.cdgo_expdnte_estdo ,
	a.id_expdnte ,
	a.fcha_aprtra ,
	a.fcha_crre ,
	a.id_fncnrio ,
	a.id_fsclzcion_expdnte_pdre ,
	a.nmro_expdnte
from fi_g_fiscalizacion_expdnte a
join fi_g_candidatos b on a.id_cnddto = b.id_cnddto;

