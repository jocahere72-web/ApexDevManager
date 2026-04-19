
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_SALDOS_FAVOR_MOVIMIENTO" ("ID_SLDO_FVOR", "OBSRVCION", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "ID_ORGEN", "CDGO_SLDO_FVOR_TPO", "INDCDOR_RCNCDO", "ESTDO", "NMBRE", "FECHA", "SLDO_FVOR_DSPNBLE") AS
  select a.id_sldo_fvor,
       a.obsrvcion,
       a.cdgo_clnte,
       c.nmbre_clnte,
       a.id_impsto,
       d.nmbre_impsto,
       a.id_impsto_sbmpsto,
       e.nmbre_impsto_sbmpsto,
       a.id_sjto_impsto,
       a.id_orgen,
       a.cdgo_sldo_fvor_tpo,
       a.indcdor_rcncdo,
       a.estdo,
       f.nmbre,
       to_char(a.fcha_rgstro, 'dd/MM/YYYY') as fecha,
       a.vlor_sldo_fvor - (sum(nvl(b.vlor_dbe,0)) + sum(nvl(b.vlor_hber,0))) as sldo_fvor_dspnble
from gf_g_saldos_favor a
join gf_d_saldos_favor_tipo           f on a.cdgo_sldo_fvor_tpo = f.cdgo_sldo_fvor_tpo
left join gf_g_saldos_favor_mvimiento b on a.id_sldo_fvor       = b.id_sldo_fvor
left join gf_d_saldos_fvor_mvmnts_tpo g on b.id_mvmnto_tpo      = g.id_sldos_fvor_mvmnto_tpo
left join df_s_clientes               c on a.cdgo_clnte         = c.cdgo_clnte
left join df_c_impuestos              d on a.id_impsto          = d.id_impsto
left join df_i_impuestos_subimpuesto  e on a.id_impsto_sbmpsto  = e.id_impsto_sbmpsto
where g.cdgo_mvmnto in ('C', 'D')
group by a.id_sldo_fvor,
         a.obsrvcion,
         a.cdgo_clnte,
         c.nmbre_clnte,
         a.id_impsto,
         d.nmbre_impsto,
         a.id_impsto_sbmpsto,
         e.nmbre_impsto_sbmpsto,
         a.id_sjto_impsto,
         a.id_orgen,
         a.cdgo_sldo_fvor_tpo,
         a.indcdor_rcncdo,
         a.estdo,
         f.nmbre,
         to_char(a.fcha_rgstro, 'dd/MM/YYYY'),
         a.vlor_sldo_fvor
;

