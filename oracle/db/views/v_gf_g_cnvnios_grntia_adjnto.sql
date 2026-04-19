
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_CNVNIOS_GRNTIA_ADJNTO" ("ID_CNVNIO_GRNTIA_ADJNTO", "ID_CNVNIO", "ID_GRNTIA_TPO", "CDGO_GRNTIA_TPO", "DSCRPCION_GRNTIA_TPO", "DSCRPCION_GRNTIA", "ID_CNVNIO_GRNTIA", "DSCRPCION", "FILE_BLOB", "FILE_NAME", "FILE_MIMETYPE") AS
  select a.id_cnvnio_grntia_adjnto,
		b.id_cnvnio,
		b.id_grntia_tpo,
		b.cdgo_grntia_tpo,
		b.dscrpcion_grntia_tpo,
		b.dscrpcion_grntia,
		a.id_cnvnio_grntia,
		a.dscrpcion,
		a.file_blob,
		a.file_name,
		a.file_mimetype
   from gf_g_cnvnios_grntia_adjnto	a
   join v_gf_g_convenios_garantia	b on a.id_cnvnio_grntia = b.id_cnvnio_grntia;

