
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_RENTAS_CONTRATO_EXTERNO" ("ID_RNTA_CNTRTO_EXTRNO", "ID", "ID_ENTDAD", "NMBRE_ENTDAD", "NMRO_CNTRTO", "OBJTO", "FCHA_FRMA", "FCHA_INCIO_CNTRTO", "FCHA_FIN", "VLOR_CNTRTO_INCLYE_IVA", "VLOR_CNTRTO_SIN_IVA", "VLOR_IVA", "TPO_CNTRTO", "DRCION_DIAS", "DSCRPCION_FRMA_PGO", "DRCION", "CDGO_DPNDNCIA", "NMBRE_DPNDNCIA", "PRMER_NMBRE", "SGNDO_NMBRE", "PRMER_APLLDO", "SGNDO_APLLDO", "DRCCION", "TLFNO", "CORREO", "TPO_PRSNA", "CDGO_IDNTFCCION_TPO", "NMRO_IDNTFCCION", "CDGO_MNCPIO", "CDGO_DPRTMNTO", "TPO_RGMEN", "JSON", "RSPNSBLE_DE_IVA", "CNSCTVO_RP", "FCHA_RP", "ID_RNTA", "NMRO_RNTA", "ID_SJTO_IMPSTO", "ESTDO", "FCHA_RGSTRO", "INDCDOR_RNTA_PGDA") AS
  select a.id_rnta_cntrto_extrno
		,a.id
		,a.id_entdad
		,(select nmbre_rzon_scial from df_s_entidades where  id_entdad = a.id_entdad)	 nmbre_entdad
		,a.nmro_cntrto
		,a.objto
		,a.fcha_frma
		,a.fcha_incio_cntrto
		,a.fcha_fin
		,a.vlor_cntrto_inclye_iva
		,a.vlor_cntrto_sin_iva
		,a.vlor_iva
		,a.tpo_cntrto
		,a.drcion_dias
		,a.dscrpcion_frma_pgo
		,a.drcion
		,a.cdgo_dpndncia
		,a.nmbre_dpndncia
		,a.prmer_nmbre
		,a.sgndo_nmbre
		,a.prmer_aplldo
		,a.sgndo_aplldo
		,a.drccion
		,a.tlfno
		,a.correo
		,a.tpo_prsna
		,a.cdgo_idntfccion_tpo
		,a.nmro_idntfccion
		,a.cdgo_mncpio
		,a.cdgo_dprtmnto
		,a.tpo_rgmen
		,a.json
		,a.rspnsble_de_iva
		,a.cnsctvo_rp
		,a.fcha_rp
		,a.id_rnta
		,b.nmro_rnta
		,a.id_sjto_impsto
		,a.estdo
		,a.fcha_rgstro
		,decode(b.indcdor_rnta_pgda, 'S', 'SI', 'NO') indcdor_rnta_pgda
from gi_g_rentas_contrato_externo a
	left join gi_g_rentas b on b.id_rnta =  a.id_rnta
;

