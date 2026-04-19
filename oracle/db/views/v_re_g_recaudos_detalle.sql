
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_RECAUDOS_DETALLE" ("ID_RCDO_CNTROL", "ID_RCDO", "ID_SJTO_IMPSTO", "FCHA_RCDO", "VGNCIA", "PRDO", "ID_PRDO", "ID_CNCPTO", "CDGO_CNCPTO", "DSCRPCION_CNCPTO", "ID_IMPSTO_ACTO_CNCPTO", "VLOR_CPTAL", "VLOR_INTRES", "VLOR_SLDO_FVOR", "VLOR_TTAL") AS
  with w_re_g_recaudos as
 (select a.id_rcdo_cntrol,
         a.id_rcdo,
         a.id_sjto_impsto,
         a.fcha_rcdo,
         a.id_sldo_fvor
    from re_g_recaudos a
   where a.cdgo_rcdo_estdo = 'AP')
select a.id_rcdo_cntrol,
       a.id_rcdo,
       a.id_sjto_impsto,
       a.fcha_rcdo,
       b.vgncia,
       b.prdo,
       b.id_prdo,
       b.id_cncpto,
       b.cdgo_cncpto,
       b.dscrpcion_cncpto,
       b.id_impsto_acto_cncpto,
       b.vlor_cptal,
       b.vlor_intres,
       0 as vlor_sldo_fvor,
       (b.vlor_cptal + b.vlor_intres) as vlor_ttal
  from w_re_g_recaudos a
  join (select a.id_orgen as id_rcdo,
               a.vgncia,
               c.prdo,
               a.id_prdo,
               a.id_cncpto,
               b.cdgo_cncpto,
               b.dscrpcion as dscrpcion_cncpto,
               a.id_impsto_acto_cncpto,
               sum(case
                     when a.cdgo_mvmnto_tpo = 'PC' then
                      a.vlor_hber
                     else
                      0
                   end) as vlor_cptal,
               sum(case
                     when a.cdgo_mvmnto_tpo = 'PI' then
                      a.vlor_hber
                     else
                      0
                   end) as vlor_intres
          from gf_g_movimientos_detalle a
          join df_i_conceptos b
            on a.id_cncpto = b.id_cncpto
          join df_i_periodos c
            on a.id_prdo = c.id_prdo
         where a.cdgo_mvmnto_orgn = 'RE'
           and a.cdgo_mvmnto_tpo in ('PC', 'PI')
         group by a.id_orgen,
                  a.id_cncpto,
                  a.vgncia,
                  c.prdo,
                  a.id_prdo,
                  b.cdgo_cncpto,
                  b.dscrpcion,
                  a.id_impsto_acto_cncpto) b
    on a.id_rcdo = b.id_rcdo
union all
select a.id_rcdo_cntrol,
       a.id_rcdo,
       a.id_sjto_impsto,
       a.fcha_rcdo,
       null as vgncia,
       null as prdo,
       null as id_prdo,
       null as id_cncpto,
       '999' as cdgo_cncpto,
       'SALDO A FAVOR' as dscrpcion_cncpto,
       null as id_impsto_acto_cncpto,
       0 as vlor_cptal,
       0 as vlor_intres,
       b.vlor_sldo_fvor,
       b.vlor_sldo_fvor as vlor_ttal
  from w_re_g_recaudos a
  join gf_g_saldos_favor b
    on a.id_sldo_fvor = b.id_sldo_fvor
union all
select a.id_rcdo_cntrol,
       b.id_rcdo,
       b.id_sjto_impsto,
       b.fcha_rcdo,
       to_number(decode(e.cdgo_cncpto, '999', null, c.vgncia)) as vgncia,
       to_number(decode(e.cdgo_cncpto, '999', null, d.prdo)) as prdo,
       to_number(decode(e.cdgo_cncpto, '999', null, d.id_prdo)) as id_prdo,
       to_number(decode(e.cdgo_cncpto, '999', null, c.id_cncpto)) as id_cncpto,
       e.cdgo_cncpto,
       e.dscrpcion,
       to_number(decode(e.cdgo_cncpto, '999', null, '999')) as id_impsto_acto_cncpto,
       decode(e.cdgo_cncpto, '999', 0, round(c.vlor_aplca_cptal)) vlor_aplca_cptal,
       decode(e.cdgo_cncpto, '999', 0, round(c.vlor_aplca_intres)) vlor_aplca_intres,
       decode(e.cdgo_cncpto, '999', round(c.vlor_aplca_cptal), 0) vlor_sldo_fvor,
       round(c.vlor_aplca_cptal + c.vlor_aplca_intres) vlor_ttal
  from re_g_recaudos_control a
  join re_g_recaudos b
    on b.id_rcdo_cntrol = a.id_rcdo_cntrol
-- and b.id_rcdo = 2289285
  join re_g_recaudos_detalle c
    on c.id_rcdo = b.id_rcdo
  join df_i_periodos d
    on d.id_prdo = c.id_prdo
  join df_i_conceptos e
    on e.id_cncpto = c.id_cncpto
;

