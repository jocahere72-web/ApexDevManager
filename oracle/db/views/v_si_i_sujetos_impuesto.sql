
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SI_I_SUJETOS_IMPUESTO" ("ID_SJTO_IMPSTO", "ID_SJTO", "CDGO_CLNTE", "NMBRE_CLNTE", "NMRO_IDNTFCCION", "IDNTFCCION_SJTO", "IDNTFCCION_SJTO_FRMTDA", "IDNTFCCION_ANTRIOR", "IDNTFCCION_ANTRIOR_FRMTDA", "MTRCLA_INMBLRIA", "ID_PAIS", "NMBRE_PAIS", "ID_DPRTMNTO", "NMBRE_DPRTMNTO", "ID_MNCPIO", "NMBRE_MNCPIO", "DRCCION", "FCHA_INGRSO", "FCHA_CNCLCION", "FCHA_ULTMA_NVDAD", "CDGO_PSTAL", "ESTDO_BLQDO_SJTO", "DSC_ESTDO_BLQDO_SJTO", "ID_IMPSTO", "NMBRE_IMPSTO", "CDGO_SJTO_TPO", "DSCRPCION_SJTO_TPO", "ID_SJTO_ESTDO", "CDGO_SJTO_ESTDO", "DSCRPCION_SJTO_ESTDO", "ESTDO_BLQDO_SJTO_IMPSTO", "DESC_ESTDO_BLQDO_SJTO_IMPSTO", "ID_PAIS_NTFCCION", "NMBRE_PAIS_NTFCCION", "ID_DPRTMNTO_NTFCCION", "NMBRE_DPRTMNTO_NTFCCION", "ID_MNCPIO_NTFCCION", "NMBRE_MNCPIO_NTFCCION", "DRCCION_NTFCCION", "EMAIL", "TLFNO", "FCHA_RGSTRO", "ID_USRIO", "ICNO", "INDCDOR_SJTO_MGRDO") AS
  select a.id_sjto_impsto
		, a.id_sjto
		, b.cdgo_clnte
		, (select n.nmbre_clnte from df_s_clientes n where b.cdgo_clnte = n.cdgo_clnte )					nmbre_clnte
		, (select n.nmro_idntfccion from df_s_clientes n where b.cdgo_clnte = n.cdgo_clnte) 				nmro_idntfccion
		, b.idntfccion																						idntfccion_sjto
		, b.idntfccion_sjto_frmtda
		, b.idntfccion_antrior
		, b.idntfccion_antrior_frmtda
		, (select i.mtrcla_inmblria from si_i_predios i where a.id_sjto_impsto = i.id_sjto_impsto)			mtrcla_inmblria
		, b.id_pais
		, (select f.nmbre_pais from df_s_paises f where b.id_pais= f.id_pais)								nmbre_pais
		, b.id_dprtmnto
		, (select g.nmbre_dprtmnto from df_s_departamentos g where b.id_dprtmnto = g.id_dprtmnto) 			nmbre_dprtmnto
		, b.id_mncpio
		, (select h.nmbre_mncpio from df_s_municipios h where b.id_mncpio= h.id_mncpio) 					nmbre_mncpio
		, b.drccion
		, b.fcha_ingrso
		, a.fcha_cnclcion
		, a.fcha_ultma_nvdad
		, b.cdgo_pstal
		, b.estdo_blqdo																						estdo_blqdo_sjto
		, decode(b.estdo_blqdo, 'S', 'SI', 'NO') 															dsc_estdo_blqdo_sjto
		, a.id_impsto
		, c.nmbre_impsto
		, c.cdgo_sjto_tpo
		, (select d.dscrpcion_sjto_tpo from df_s_sujetos_tipo d where c.cdgo_sjto_tpo = d.cdgo_sjto_tpo)	dscrpcion_sjto_tpo
		, a.id_sjto_estdo
		, (select e.cdgo_sjto_estdo from df_s_sujetos_estado e where a.id_sjto_estdo = e.id_sjto_estdo ) 	cdgo_sjto_estdo
		, (select e.dscrpcion_sjto_estdo from df_s_sujetos_estado e where a.id_sjto_estdo = e.id_sjto_estdo) dscrpcion_sjto_estdo
		, a.estdo_blqdo     																				estdo_blqdo_sjto_impsto
		, decode(a.estdo_blqdo, 'S', 'Si', 'No')															desc_estdo_blqdo_sjto_impsto
		, a.id_pais_ntfccion
		, (select f.nmbre_pais from df_s_paises f where a.id_pais_ntfccion = f.id_pais)						nmbre_pais_ntfccion
		, a.id_dprtmnto_ntfccion
		, (select g.nmbre_dprtmnto from df_s_departamentos g where a.id_dprtmnto_ntfccion = g.id_dprtmnto)	nmbre_dprtmnto_ntfccion
		, a.id_mncpio_ntfccion
		, (select h.nmbre_mncpio from df_s_municipios h where a.id_mncpio_ntfccion= h.id_mncpio)			nmbre_mncpio_ntfccion
		, a.drccion_ntfccion
		, a.email
		, a.tlfno
		, a.fcha_rgstro
		, a.id_usrio
		, (select c.icno from df_c_impuestos c where a.id_impsto = c.id_impsto) 							icno
		, b.indcdor_mgrdo indcdor_sjto_mgrdo
	 from si_i_sujetos_impuesto a
	 join si_c_sujetos 			b on a.id_sjto		= b.id_sjto
	 join df_c_impuestos		c on a.id_impsto	= c.id_impsto;

