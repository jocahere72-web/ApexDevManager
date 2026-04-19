
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MC_G_EMBRGO_REMNTE_DTLLE" ("ID_EMBRGOS_RMNTE", "NMRO_RSLCN", "FCHA_RSLCN", "NRO_OFICIO", "FCHA_OFCIO", "ID_ENTDAD", "NRO_OFCIO_JZGDO", "FCHA_OFCIO_JZGDO", "RDCDO_JZGDO", "CDGO_TPO_PRCSO", "CDGO_TPO_IDNTFCCN_DMNDT", "IDNTFCCION_DMNDTE", "NMBRE_DMNDTE", "NRO_PQR", "FCHA_PQR", "OBSERVACION", "ID_INSTNCIA_FLJO", "ID_FNCNRIO", "ID_SLCTUD", "CDGO_ESTDO_EMBRGO", "NMRO_ACTO", "ID_EMBRGOS_CRTRA", "CNSCTVO_EMBRGO", "ID_EMBRGOS_RSLCION") AS
  select 	 a.id_embrgos_rmnte
        ,a.nmro_rslcn
        ,a.fcha_rslcn
        ,a.nro_oficio
        ,to_char(a.fcha_ofcio,'DD/MM/YY') as fcha_ofcio
        ,decode(a.id_entdad, a.id_entdad, b.nmbre_rzon_scial , '-') as id_entdad
        ,a.nro_ofcio_jzgdo
        ,a.fcha_ofcio_jzgdo
        ,a.rdcdo_jzgdo
        ,decode(a.cdgo_tpo_prcso, a.cdgo_tpo_prcso, x.nmbre_prcso , '-') as cdgo_tpo_prcso
        ,decode(a.cdgo_tpo_idntfccn_dmndt, a.cdgo_tpo_idntfccn_dmndt, d.dscrpcion_idntfccion_tpo , '-') as cdgo_tpo_idntfccn_dmndt
        ,a.idntfccion_dmndte
        ,a.nmbre_dmndte
        ,a.nro_pqr
        ,a.fcha_pqr
        ,a.observacion
        ,a.id_instncia_fljo
        ,a.id_fncnrio
        ,a.id_slctud
        ,decode(a.cdgo_estdo_embrgo, a.cdgo_estdo_embrgo, e.dscrpcion , '-') as cdgo_estdo_embrgo
        ,z.nmro_acto
        ,z.id_embrgos_crtra
        ,z.cnsctvo_embrgo
        ,z.id_embrgos_rslcion
from mc_g_embrgo_remnte_dtlle 	m
join mc_g_embargos_remanente 	a on a.id_embrgos_rmnte 	= m.id_embrgos_rmnte
join mc_d_remanentes_rspsta 	e on e.cdgo_rspsta 			= a.cdgo_estdo_embrgo
join df_s_entidades 			b on b.id_entdad 			= a.id_entdad
join df_s_identificaciones_tipo d on d.cdgo_idntfccion_tpo 	= a.cdgo_tpo_idntfccn_dmndt
join mc_d_procesos_remanente 	x on x.cdgo_tpo_prcso 		= a.cdgo_tpo_prcso
join mc_g_embargos_resolucion 	z on z.id_embrgos_rslcion 	= m.id_embrgos_rslcion;

