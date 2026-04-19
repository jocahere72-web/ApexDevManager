
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SI_I_SUJETOS_SUCURSAL" ("ID_SJTO_SCRSAL", "ID_SJTO", "ID_SJTO_IMPSTO", "IDNTFCCION", "NMBRE_RZON_SCIAL", "CDGO_SCRSAL", "NMBRE_SCRSAL", "DRCCION_SCRSAL", "ID_DPRTMNTO_SCRSAL", "NMBRE_DPRTMNTO_SCRSAL", "ID_MNCPIO_SCRSAL", "NMBRE_MNCPIO_SCRSAL", "TLFNO_SCRSAL", "CLLAR_SCRSAL", "EMAIL_SCRSAL", "ACTVO_SCRSAL", "ESTDO_ACTVO") AS
  select  a.id_sjto_scrsal
 		, a.id_sjto
		, a.id_sjto_impsto
		, b.idntfccion
        , c.nmbre_rzon_scial
		, a.cdgo_scrsal             cdgo_scrsal
		, a.nmbre                   nmbre_scrsal
		, a.drccion                 drccion_scrsal
		, a.id_dprtmnto_ntfccion    id_dprtmnto_scrsal
		, d.nmbre_dprtmnto 			nmbre_dprtmnto_scrsal
		, a.id_mncpio_ntfccion      id_mncpio_scrsal
		, e.nmbre_mncpio			nmbre_mncpio_scrsal
		, a.tlfno                   tlfno_scrsal
		, a.cllar                   cllar_scrsal
		, a.email                   email_scrsal
		, a.actvo                   actvo_scrsal
		, decode(a.actvo, 'S', 'Sí', 'No') 	 estdo_actvo
  from si_i_sujetos_sucursal a
		join si_c_sujetos               b on a.id_sjto              = b.id_sjto
        join si_i_personas              c on a.id_sjto_impsto       = c.id_sjto_impsto
  		left join df_s_departamentos    d on a.id_dprtmnto_ntfccion = d.id_dprtmnto
		left join df_s_municipios       e on a.id_mncpio_ntfccion   = e.id_mncpio;

