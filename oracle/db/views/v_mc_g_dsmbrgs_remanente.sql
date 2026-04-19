
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MC_G_DSMBRGS_REMANENTE" ("ID_DSMBRGOS_RMNTE", "ID_EMBRGO_RMNTE", "NMRO_RSLCN", "FCHA_RSLCN", "NRO_OFICIO", "FCHA_OFCIO", "NRO_PQR", "FCHA_PQR", "CDGO_ESTDO_EMBRGO", "CDGO_TPO_IDNTFCCN_DMNDT", "IDNTFCCION_DMNDTE", "NMBRE_DMNDTE", "ID_FNCNRIO", "ID_INSTNCIA_FLJO", "ID_SLCTUD", "NMRO_RDCDO_DSPLAY", "FCHA_RDCDO") AS
  select   a.id_dsmbrgos_rmnte
        ,a.id_embrgo_rmnte
        ,b.nmro_rslcn
        ,b.fcha_rslcn
        ,b.nro_oficio
        ,to_char(b.fcha_ofcio,'DD/MM/YY')as fcha_ofcio
        ,b.nro_pqr
        ,b.fcha_pqr
        ,decode(b.cdgo_estdo_embrgo, b.cdgo_estdo_embrgo, e.dscrpcion , '-') as cdgo_estdo_embrgo
        ,decode(b.cdgo_tpo_idntfccn_dmndt, b.cdgo_tpo_idntfccn_dmndt, d.dscrpcion_idntfccion_tpo , '-') as cdgo_tpo_idntfccn_dmndt
        ,b.idntfccion_dmndte
        ,b.nmbre_dmndte
        ,a.id_fncnrio
        ,a.id_instncia_fljo
        ,a.id_slctud
        ,c.nmro_rdcdo_dsplay
        ,to_char(c.fcha_rdcdo,'DD/MM/YYYY') as fcha_rdcdo
from mc_g_dsmbrgs_remanente 	a
join mc_g_embargos_remanente 	b 	on a.id_embrgo_rmnte = b.id_embrgos_rmnte
join v_pq_g_solicitudes 		c 	on a.id_slctud = c.id_slctud
join df_s_identificaciones_tipo d 	on d.cdgo_idntfccion_tpo = b.cdgo_tpo_idntfccn_dmndt
join mc_d_remanentes_rspsta 	e 	on e.cdgo_rspsta = b.cdgo_estdo_embrgo;

