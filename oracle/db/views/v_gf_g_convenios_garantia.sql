
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_CONVENIOS_GARANTIA" ("ID_CNVNIO_GRNTIA", "ID_CNVNIO", "ID_GRNTIA_TPO", "CDGO_GRNTIA_TPO", "DSCRPCION_GRNTIA_TPO", "DSCRPCION_GRNTIA") AS
  select a.id_cnvnio_grntia,
		a.id_cnvnio,
		a.id_grntia_tpo,
		b.cdgo_grntia_tpo,
		b.dscrpcion			dscrpcion_grntia_tpo,
		a.dscrpcion			dscrpcion_grntia
   from gf_g_convenios_garantia a
   join gf_d_garantias_tipo		b on a.id_grntia_tpo = b.id_grntia_tpo;

