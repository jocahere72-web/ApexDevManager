
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_FI_G_EXPEDIENTES_ANALISIS" ("ID_EXPDNTE_ANLSIS", "ID_FSCLZCION_EXPDNTE", "ID_PRGRMA", "ID_SBPRGRMA", "CDGO_CLNTE", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_SJTO", "IDNTFCCION_SJTO", "IDNTFCCION_ANTRIOR", "ID_SJTO_IMPSTO", "OBSRVCION", "ID_INSTNCIA_FLJO", "ID_INSTNCIA_FLJO_PDRE", "ID_SLCTUD", "CDGO_RSPTA", "FCHA_RGSTRO", "ID_USRIO_RGSTRO", "NMBRE_USRIO_RGSTRO", "FCHA_APLCO", "ID_USRIO_APLCO", "NMBRE_USRIO_APLCO", "FCHA_RCHZO", "ID_USRIO_RCHZO", "MBRE_USRIO_RCHZO", "OBSRVCION_RCHZO", "NMBRE_SLCTNTE", "CDGO_IDNTFCCION_TPO_SLCTNTE", "NMRO_IDNTFCCION_SLCTNTE", "ID_PAIS_NTFCCION", "NMBRE_PAIS_NTFCCION", "ID_DPRTMNTO_NTFCCION", "NMBRE_DPRTMNTO_NTFCCION", "ID_MNCPIO_NTFCCION", "NMBRE_MNCPIO_NTFCCION", "EMAIL", "TLFNO", "CLLAR", "NMRO_RDCDO", "NMRO_RDCDO_DSPLAY", "ID_ACTO", "CDGO_ACTO_ORGEN", "DSCRPCION_ACTO_ORGEN", "NMRO_ACTO", "NMRO_ACTO_DSPLAY", "INDCDOR_NTFCDO", "FCHA_ACTO") AS
  select  a.id_expdnte_anlsis
    ,a.id_fsclzcion_expdnte
    ,l.id_prgrma
    ,l.id_sbprgrma
    , h.cdgo_clnte
    , a.id_impsto
    , a.id_impsto_sbmpsto
    , c.id_sjto
    , c.idntfccion			idntfccion_sjto
    , c.idntfccion_antrior	idntfccion_antrior
    , d.id_sjto_impsto
    , a.obsrvcion
    , a.id_instncia_fljo
    , a.id_instncia_fljo_pdre
    , a.id_slctud
    , a.cdgo_rspta
    , a.fcha_rgstro
    , a.id_usrio_rgstro
    , f.nmbre_trcro								nmbre_usrio_rgstro
    , a.fcha_aplco
    , a.id_usrio_aplco
    , j.nmbre_trcro			nmbre_usrio_aplco
    , a.fcha_rchzo
    , a.id_usrio_rchzo
    , k.nmbre_trcro	 mbre_usrio_rchzo
    , a.obsrvcion_rchzo
    , g.nmbre_slctnte
    , g.cdgo_idntfccion_tpo	cdgo_idntfccion_tpo_slctnte
    , g.idntfccion	nmro_idntfccion_slctnte
    , g.id_pais_ntfccion
    , g.nmbre_pais_ntfccion
    , g.id_dprtmnto_ntfccion
    , g.nmbre_dprtmnto_ntfccion
    , g.id_mncpio_ntfccion
    , g.nmbre_mncpio_ntfccion
    , g.email
    , g.tlfno
    , g.cllar
    , h.nmro_rdcdo
    , h.nmro_rdcdo_dsplay
    , a.id_acto
    , i.cdgo_acto_orgen
    , i.dscrpcion_acto_orgen
    , i.nmro_acto
    , i.nmro_acto_dsplay
    , i.indcdor_ntfcdo
    , i.fcha fcha_acto
from fi_g_expedientes_analisis 	    a
join fi_g_expndnts_anlsis_dtlle     d   on  a.id_expdnte_anlsis = d.id_expdnte_anlsis
join v_fi_g_fiscalizacion_expdnte   l on a.id_fsclzcion_expdnte = l.id_fsclzcion_expdnte
left join si_i_sujetos_impuesto		b on d.id_sjto_impsto			= b.id_sjto_impsto
left join si_c_sujetos			    c on b.id_sjto			= c.id_sjto
join v_sg_g_usuarios			    f on a.id_usrio_rgstro			= f.id_usrio
left join v_pq_g_solicitantes		g on a.id_slctud				= g.id_slctud
left join v_pq_g_solicitudes		h on a.id_slctud				= h.id_slctud
left join v_gn_g_actos			    i on a.id_acto 					= i.id_acto
left join v_sg_g_usuarios		    j on a.id_usrio_aplco			= j.id_usrio
left join v_sg_g_usuarios		    k on a.id_usrio_rchzo			= k.id_usrio;

