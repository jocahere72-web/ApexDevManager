
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SG_G_USUARIOS_SUCURSAL" ("ID_USRIO_SCRSAL", "ID_USRIO", "NMBRE_USRIO", "IDNTFCCION_USRIO", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_SJTO_SCRSAL", "ID_SJTO_IMPSTO", "IDNTFCCION", "NMBRE_RZON_SCIAL", "CDGO_SCRSAL", "NMBRE_SCRSAL", "ACTVO", "ESTDO_ACTVO") AS
  select  a.id_usrio_scrsal
		, a.id_usrio
		, b.nmbre_trcro     nmbre_usrio
		, b.idntfccion      idntfccion_usrio
		, a.id_impsto
		, c.nmbre_impsto
	 	, a.id_sjto_scrsal
		, d.id_sjto_impsto
		, d.idntfccion
		, d.nmbre_rzon_scial
		, d.cdgo_scrsal
		, d.nmbre_scrsal
		, a.actvo
		, decode(a.actvo, 'S', 'Sí', 'No') 	  estdo_actvo
from  sg_g_usuarios_sucursal a
		join v_sg_g_usuarios b 			on a.id_usrio = b.id_usrio
		join df_c_impuestos  c 			on a.id_impsto  = c.id_impsto
		join v_si_i_sujetos_sucursal  d on a.id_sjto_scrsal  = d.id_sjto_scrsal;

