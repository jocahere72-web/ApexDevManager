
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MC_G_SOLICITUDES_Y_OFICIOS" ("ID_SLCTD_OFCIO", "ID_EMBRGOS_CRTRA", "ID_ENTDDES", "DSCRPCION", "DRCCION", "CONTACTO_ENTIDAD", "ACTO_SLCTUD", "NMRO_ACTO_SLCTUD", "FCHA_SLCTUD", "ACTO_OFCIO", "NMRO_ACTO_OFCIO", "FCHA_OFCIO", "ACTIVO", "ID_EMBRGOS_RSLCION", "NMRO_RSLCION_EMB", "FCHA_RSLCION_EMB", "ID_EMBRGOS_RSPNSBLE", "NMTCNCO_IDNTFCCION_TPO", "IDNTFCCION", "RSPNSBLE", "DRCCION_NTFCCION", "ID_DSMBRGOS_RSLCION", "DSMBRGDO") AS
  select a.id_slctd_ofcio,
       a.id_embrgos_crtra,
       a.id_entddes,
	   b.dscrpcion,
	   b.drccion,
       b.cntcto as contacto_entidad,
       a.id_acto_slctud as acto_slctud,
       a.nmro_acto_slctud as nmro_acto_slctud,
       a.fcha_slctud as fcha_slctud,
       a.id_acto_ofcio as acto_ofcio,
       a.nmro_acto_ofcio as nmro_acto_ofcio,
       a.fcha_ofcio as fcha_ofcio,
       a.activo,
       a.id_embrgos_rslcion,
       f.nmro_acto as nmro_rslcion_emb,
       f.fcha_acto as fcha_rslcion_emb,
       c.id_embrgos_rspnsble,
       c.nmtcnco_idntfccion_tpo,
       c.idntfccion,
       c.nmbre_cmplto as rspnsble,
       c.drccion_ntfccion,
       c.id_dsmbrgos_rslcion,
       c.dsmbrgdo
from mc_g_solicitudes_y_oficios a
join mc_d_entidades b on a.id_entddes = b.id_entddes and b.actvo = 'S'
left join v_mc_g_embargos_resolucion f on a.id_embrgos_rslcion = f.id_embrgos_rslcion and f.cdgo_estdos_crtra not in ('N')
left join v_mc_g_embargos_responsable c on a.id_embrgos_rspnsble = c.id_embrgos_rspnsble
;

