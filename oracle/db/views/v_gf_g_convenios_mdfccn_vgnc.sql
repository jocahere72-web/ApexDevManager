
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_CONVENIOS_MDFCCN_VGNC" ("ID_CNVNIO_MDFCCN_VGNCIA", "ID_CNVNIO_MDFCCION", "VGNCIA", "ID_PRDO", "PRDO") AS
  select a.id_cnvnio_mdfccn_vgncia,
		a.id_cnvnio_mdfccion,
		a.vgncia,
		a.id_prdo,
		c.prdo
   from gf_g_convenios_mdfccn_vgnc 		a
   join v_gf_g_convenios_modificacion	b on a.id_cnvnio_mdfccion = b.id_cnvnio_mdfccion
   join df_i_periodos 					c on a.id_prdo = c.id_prdo;

