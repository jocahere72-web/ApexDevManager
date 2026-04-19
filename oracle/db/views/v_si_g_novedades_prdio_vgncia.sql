
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SI_G_NOVEDADES_PRDIO_VGNCIA" ("ID_NVDAD_PRDIO_VGNCIA", "ID_NVDAD_PRDIO_DTLLE", "VGNCIA", "PRDO", "ID_PRDO", "ID_LQDCION") AS
  select a.id_nvdad_prdio_vgncia
         , a.id_nvdad_prdio_dtlle
         , a.vgncia
         , b.prdo
         , a.id_prdo
		 , a.id_lqdcion
      from si_g_novedades_prdio_vgncia a
 left join df_i_periodos b on a.id_prdo = b.id_prdo;

