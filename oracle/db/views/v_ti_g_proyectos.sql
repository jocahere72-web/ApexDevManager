
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_TI_G_PROYECTOS" ("ID_PRYCTO", "NMTCNCO", "NMBRE_PRYCTO", "DSCRPCION", "ID_SPNSOR", "NMBRE_SPNSOR", "ID_DRCTOR", "NMBRE_DRCTOR", "OBJTVO", "ACTVO", "ESTDO_ACTVO") AS
  select
	a.id_prycto,
	a.nmtcnco,
	a.nmbre nmbre_prycto,
	a.dscrpcion,
	a.id_spnsor,
	b.nmbre_trcro nmbre_spnsor,
	a.id_drctor,
	c.nmbre_trcro nmbre_drctor,
	a.objtvo,
	a.actvo,
	case
				when a.actvo='S' then 'SI'
				when a.actvo='N' then 'NO'
	end as estdo_actvo

	from ti_g_proyectos				a
	join v_sg_g_usuarios			b	on a.id_spnsor = b.id_usrio
	left join v_sg_g_usuarios		c	on a.id_drctor = c.id_usrio;

