
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_CONVENIOS_REVERSION" ("ID_CNVNIO", "ID_CNVNIO_RVRSION", "ID_ACTO", "ID_INSTNCIA_FLJO_HJO", "ID_INSTNCIA_FLJO_PDRE", "ID_SLCTUD", "ID_USRIO", "FCHA_RGSTRO", "FCHA_APLCCION_RVRSION", "ID_USRIO_APLCCION", "IDNTFCCION_SJTO_FRMTDA", "DRCCION", "ID_CNVNIO_TPO", "CDGO_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_SJTO", "IDNTFCCION_SJTO", "NMRO_CNVNIO", "CDGO_CNVNIO_ESTDO", "FCHA_PRMRA_CTA", "VLOR_CTA_INCIAL", "NMRO_CTA", "FCHA_LMTE_CTA_INCIAL", "NMRO_MXMO_CTAS", "ID_SJTO_IMPSTO", "NMRO_RDCDO_DSPLAY", "FCHA_APLCCION_CNVNIO", "DSCRPCION_CNVNIO_ESTDO", "NMRO_ACTO", "NMRO_ACTO_DSPLAY", "DSCRPCION_CNVNIO_TPO", "CDGO_SJTO_TPO", "CDGO_CNVNIO_RVRSION_ESTDO", "DSCRPCION_CNVNIO_RVRSION_ESTDO", "MTVO_RCHZO_RVRSION", "FCHA_RCHZO", "NMBRE_SLCTNTE", "CDGO_IDNTFCCION_TPO_SLCTNTE", "NMRO_IDNTFCCION_SLCTNTE", "DRCCION_NTFCCION", "ID_PAIS_NTFCCION", "NMBRE_PAIS_NTFCCION", "ID_DPRTMNTO_NTFCCION", "NMBRE_DPRTMNTO_NTFCCION", "ID_MNCPIO_NTFCCION", "NMBRE_MNCPIO_NTFCCION", "EMAIL", "TLFNO", "CLLAR", "FCHA_RDCDO") AS
  select a.id_cnvnio,
            a.id_cnvnio_rvrsion,
            a.id_acto,
            a.id_instncia_fljo_hjo,
            a.id_instncia_fljo_pdre,
            a.id_slctud,
            a.id_usrio,
            a.fcha_rgstro,
            a.fcha_aplccion fcha_aplccion_rvrsion,
            a.id_usrio_aplccion,
			b.idntfccion_sjto_frmtda,
			b.drccion,
			b.id_cnvnio_tpo,
			b.cdgo_clnte,
			b.id_impsto,
			b.nmbre_impsto,
			b.id_impsto_sbmpsto,
			b.nmbre_impsto_sbmpsto,
			b.id_sjto,
			b.idntfccion_sjto,
			b.nmro_cnvnio,
			b.cdgo_cnvnio_estdo,
			b.fcha_prmra_cta,
			b.vlor_cta_incial,
			b.nmro_cta,
			b.fcha_lmte_cta_incial,
			b.nmro_mxmo_ctas,
			b.id_sjto_impsto,
			b.nmro_rdcdo_dsplay,
		    b.fcha_aplccion fcha_aplccion_cnvnio,
            c.dscrpcion dscrpcion_cnvnio_estdo,
            k.nmro_acto,
            k.nmro_acto_dsplay,
            j.dscrpcion dscrpcion_cnvnio_tpo,
            j.cdgo_sjto_tpo,
            l.cdgo_cnvnio_rvrsion_estdo,
            l.dscrpcion dscrpcion_cnvnio_rvrsion_estdo,
            a.mtvo_rchzo_rvrsion,
            a.fcha_rchzo,
			i.nmbre_slctnte,
			i.cdgo_idntfccion_tpo				cdgo_idntfccion_tpo_slctnte,
			i.idntfccion						nmro_idntfccion_slctnte,
			i.drccion_ntfccion,
			i.id_pais_ntfccion,
			i.nmbre_pais_ntfccion,
			i.id_dprtmnto_ntfccion,
			i.nmbre_dprtmnto_ntfccion,
			i.id_mncpio_ntfccion,
			i.nmbre_mncpio_ntfccion,
			i.email,
			i.tlfno,
			i.cllar,
			h.fcha_rdcdo
     from gf_g_convenios_reversion	    a
    join v_gf_g_convenios			    b on a.id_cnvnio		            =   b.id_cnvnio
    join gf_d_convenios_estado		    c on b.cdgo_cnvnio_estdo            =   c.cdgo_cnvnio_estdo
	join pq_g_solicitudes			    h on b.id_slctud		            =   h.id_slctud
    join v_pq_g_solicitantes		    i on a.id_slctud		            =   i.id_slctud
    join gf_d_convenios_tipo		    j on j.id_cnvnio_tpo	            =   b.id_cnvnio_tpo
	left join gn_g_actos				k on a.id_acto			            =   k.id_acto
    join gf_d_convenios_rvrsion_estdo   l on a.cdgo_cnvnio_rvrsion_estdo    =   l.cdgo_cnvnio_rvrsion_estdo;

