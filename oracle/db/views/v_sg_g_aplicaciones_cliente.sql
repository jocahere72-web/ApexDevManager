
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SG_G_APLICACIONES_CLIENTE" ("ID_APLCCION_CLNTE", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_APLCCION_GRPO_DTLLE", "ID_APLCCION_GRPO", "ID_APLCCION", "NMBRE_APLCCION_GRPO", "NMBRE_APLCCION", "NMRO_APLCCION", "ORDEN", "PGNA_INCIO", "ACTVO", "DES_ACTVO", "ACTVO_APP", "DES_ACTVO_APP", "USERNAME_DIGITA", "FECHA_DIGITA", "USERNAME_MODIFICA", "FECHA_MODIFICA", "ACTVO_GRPO") AS
  select a.id_aplccion_clnte,
		a.cdgo_clnte,
		c.nmbre_clnte,
		a.id_aplccion_grpo_dtlle,
        b.id_aplccion_grpo,
		b.id_aplccion,
        b.nmbre_aplccion_grpo,
		b.nmbre_aplccion,
		b.nmro_aplccion,
		b.orden,
		b.pgna_incio,
		a.actvo,
		decode(a.actvo, 'S', 'Si', 'No') des_actvo,
		b.actvo actvo_app,
		decode(b.actvo, 'S', 'Si', 'No') des_actvo_app,
		a.username_digita,
		a.fecha_digita,
		a.username_modifica,
		a.fecha_modifica,
    b.actvo_grpo
   from sg_g_aplicaciones_cliente 	a
   join v_sg_g_aplccnes_grpo_dtlle	b on a.id_aplccion_grpo_dtlle = b.id_aplccion_grpo_dtlle
   join df_s_clientes 			c on a.cdgo_clnte = c.cdgo_clnte
;

