
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_I_CALENDARIO_EXOGENA" ("ID_CLNDRIO_EXGNA", "CDGO_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "VGNCIA", "FCHA_DSDE", "FCHA_HSTA", "ULTMO_DGTO_NIT") AS
  select  a.id_clndrio_exgna,
			a.cdgo_clnte,
			a.id_impsto,
			(select m.nmbre_impsto
				from df_c_impuestos m
				   where m.id_impsto = a.id_impsto) nmbre_impsto,
			a.vgncia,
			a.fcha_dsde,
			a.fcha_hsta,
			a.ultmo_dgto_nit
     from  df_i_calendario_exogena a
;

