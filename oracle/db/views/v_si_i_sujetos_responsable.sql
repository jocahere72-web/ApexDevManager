
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SI_I_SUJETOS_RESPONSABLE" ("ID_SJTO_RSPNSBLE", "ID_SJTO_IMPSTO", "ID_SJTO", "CDGO_CLNTE", "NMBRE_CLNTE", "NMRO_IDNTFCCION", "IDNTFCCION_SJTO", "IDNTFCCION_ANTRIOR", "ID_PAIS", "NMBRE_PAIS", "ID_DPRTMNTO", "NMBRE_DPRTMNTO", "ID_MNCPIO", "NMBRE_MNCPIO", "DRCCION", "FCHA_INGRSO", "FCHA_CNCLCION", "FCHA_ULTMA_NVDAD", "CDGO_PSTAL", "ESTDO_BLQDO_SJTO", "DSC_ESTDO_BLQDO_SJTO", "CDGO_IDNTFCCION_TPO", "DSCRPCION_IDNTFCCION_TPO", "IDNTFCCION_RSPNSBLE", "PRMER_NMBRE", "SGNDO_NMBRE", "PRMER_APLLDO", "SGNDO_APLLDO", "NMBRE_RZON_SCIAL", "PRNCPAL_S_N", "CDGO_TPO_RSPNSBLE", "PRCNTJE_PRTCPCION", "ORGEN_DCMNTO", "ACTVO", "EMAIL", "ID_SJTO_ESTDO") AS
  select a.id_sjto_rspnsble,
        a.id_sjto_impsto,
        b.id_sjto,
        b.cdgo_clnte,
        b.nmbre_clnte,
        b.nmro_idntfccion,
        b.idntfccion_sjto,
        b.idntfccion_antrior,
        b.id_pais,
        b.nmbre_pais,
        b.id_dprtmnto,
        b.nmbre_dprtmnto,
        b.id_mncpio,
        b.nmbre_mncpio,
        b.drccion,
        b.fcha_ingrso,
        d.fcha_cnclcion,
        d.fcha_ultma_nvdad,
        b.cdgo_pstal,
        b.estdo_blqdo_sjto,
        b.dsc_estdo_blqdo_sjto,
        a.cdgo_idntfccion_tpo,
        c.dscrpcion_idntfccion_tpo,
        a.idntfccion idntfccion_rspnsble,
        a.prmer_nmbre,
        a.sgndo_nmbre,
        a.prmer_aplldo,
        a.sgndo_aplldo,
        case
            when a.cdgo_idntfccion_tpo = 'N' then
                 a.prmer_nmbre
            else
                nvl2(a.sgndo_nmbre, a.prmer_nmbre
                                    || ' '
                                    || a.sgndo_nmbre, a.prmer_nmbre)
                || ' '
                || nvl2(a.sgndo_aplldo, a.prmer_aplldo
                                        || ' '
                                        || a.sgndo_aplldo, a.prmer_aplldo)
        end nmbre_rzon_scial,
        a.prncpal_s_n,
        a.cdgo_tpo_rspnsble,
        a.prcntje_prtcpcion,
        a.orgen_dcmnto,
        a.actvo,
        a.email,
        d.id_sjto_estdo
    from si_i_sujetos_responsable     a
    join si_i_sujetos_impuesto        d on a.id_sjto_impsto      = d.id_sjto_impsto
    join v_si_c_sujetos               b on d.id_sjto             = b.id_sjto
    join df_s_identificaciones_tipo   c on a.cdgo_idntfccion_tpo = c.cdgo_idntfccion_tpo;

