
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SI_C_SUJETOS" ("ID_SJTO", "CDGO_CLNTE", "NMBRE_CLNTE", "NMRO_IDNTFCCION", "IDNTFCCION_SJTO", "IDNTFCCION_ANTRIOR", "ID_PAIS", "NMBRE_PAIS", "ID_DPRTMNTO", "NMBRE_DPRTMNTO", "ID_MNCPIO", "NMBRE_MNCPIO", "DRCCION", "FCHA_INGRSO", "CDGO_PSTAL", "ESTDO_BLQDO_SJTO", "DSC_ESTDO_BLQDO_SJTO") AS
  select a.id_sjto,
        a.cdgo_clnte,
        e.nmbre_clnte,
        e.nmro_idntfccion,
        a.idntfccion as idntfccion_sjto,
        a.idntfccion_antrior,
        a.id_pais,
        b.nmbre_pais,
        a.id_dprtmnto,
        c.nmbre_dprtmnto,
        a.id_mncpio,
        d.nmbre_mncpio,
        a.drccion,
        a.fcha_ingrso,
        a.cdgo_pstal,
        a.estdo_blqdo   estdo_blqdo_sjto,
        decode(a.estdo_blqdo, 'S', 'SI', 'NO') dsc_estdo_blqdo_sjto
    from si_c_sujetos                 a
    join df_s_clientes           e on a.cdgo_clnte 	= e.cdgo_clnte
	left join df_s_paises        b on a.id_pais 	= b.id_pais
	left join df_s_departamentos c on a.id_dprtmnto = c.id_dprtmnto
	left join df_s_municipios    d on a.id_mncpio 	= d.id_mncpio;

