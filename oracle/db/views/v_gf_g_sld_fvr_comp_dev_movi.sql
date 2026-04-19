
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_SLD_FVR_COMP_DEV_MOVI" ("ID_SLDO_FVOR", "ID_SJTO_IMPSTO", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "SALDO_FAVOR", "OBSRVCION", "NMBRE_IMPSTO", "NMBRE_SLDO_FVOR_TPO") AS
  select "ID_SLDO_FVOR","ID_SJTO_IMPSTO","ID_IMPSTO","ID_IMPSTO_SBMPSTO","SALDO_FAVOR","OBSRVCION","NMBRE_IMPSTO","NMBRE_SLDO_FVOR_TPO"
from (
select a.id_sldo_fvor,
       a.id_sjto_impsto,
       a.id_impsto,
       a.id_impsto_sbmpsto,
       a.vlor_sldo_fvor - (sum(nvl(d.vlor_cmpnscion,0))+sum(nvl(e.vlor_dvlcion,0))) saldo_favor,
       a.obsrvcion,
       f.nmbre_impsto,
       f.nmbre_sldo_fvor_tpo
from gf_g_saldos_favor                   a
join v_pq_g_solicitudes                  b   on   a.id_sjto_impsto = b.id_sjto_impsto
join gf_g_saldos_favor_solicitud         g   on   b.id_slctud      = g.id_slctud
left join gf_g_sldos_fvor_slctud_dtll    c   on   a.id_sldo_fvor   = c.id_sldo_fvor
left join gf_g_sldos_fvr_cmpnscn_dtll    d   on   a.id_sldo_fvor   = d.id_sldo_fvor
left join gf_g_sldos_fvr_dvlcion_dtll    e   on   a.id_sldo_fvor   = e.id_sldo_fvor
left join v_gf_g_saldos_favor            f   on   a.id_sldo_fvor   = f.id_sldo_fvor
where c.indcdor_rcncdo = 'S' and a.vlor_sldo_fvor > 0
group by a.id_sldo_fvor,
         a.vlor_sldo_fvor,
         a.obsrvcion,
         a.id_sjto_impsto,
         a.id_impsto,
         a.id_impsto_sbmpsto,
         f.nmbre_impsto,
         f.nmbre_sldo_fvor_tpo) l where l.saldo_favor > 0
;

