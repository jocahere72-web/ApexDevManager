
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SG_G_APLCCNES_GRPO_DTLLE" ("ID_APLCCION_GRPO_DTLLE", "ID_APLCCION_GRPO", "NMBRE_APLCCION_GRPO", "DSCRPCION", "ID_APLCCION", "NMBRE_APLCCION", "NMRO_APLCCION", "ORDEN", "PGNA_INCIO", "ACTVO", "ACTVO_GRPO") AS
  select a.id_aplccion_grpo_dtlle,
        a.id_aplccion_grpo,
        b.nmbre_aplccion_grpo,
        b.dscrpcion,
        a.id_aplccion,
        c.nmbre_aplccion,
        c.nmro_aplccion,
        c.orden,
		c.pgna_incio,
        a.actvo,
        b.actvo actvo_grpo
   from sg_g_aplccnes_grpo_dtlle	a
   join sg_g_aplicaciones_grupo		b on a.id_aplccion_grpo = b.id_aplccion_grpo
   join sg_g_aplicaciones			c on a.id_aplccion  	= c.id_aplccion
   order by id_aplccion_grpo, c.orden
;

