
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GN_G_ADJUNTOS" ("ID_ADJNTO", "CDGO_PRCSO", "NMBRE_PRCSO", "ID_ADJNTO_TPO", "DSCRPCION", "CDGO_ORGEN_TPO", "ID_ORGEN", "FCHA_RGSTRO", "OBSRVCION", "FILE_NAME", "FILE_MIMETYPE", "FILE_BFILE", "FILE_BLOB", "ID_USRIO") AS
  select
	a.id_adjnto,
	a.cdgo_prcso,
	b.nmbre_prcso,
	a.id_adjnto_tpo,
	c.dscrpcion,
	a.cdgo_orgen_tpo,
	a.id_orgen,
	a.fcha_rgstro,
	a.obsrvcion,
	a.file_name,
	a.file_mimetype,
	a.file_bfile,
	a.file_blob,
	a.id_usrio
from gn_g_adjuntos 		a
join df_c_procesos 		b on b.cdgo_prcso = a.cdgo_prcso
join gn_d_adjuntos_tipo c on c.id_adjnto_tpo = a.id_adjnto_tpo;

