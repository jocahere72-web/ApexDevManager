
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_CB_G_CANDIDATOS_PERSUASIVO" ("CDGO_CLNTE", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "IDNTFCCION_SJTO", "ID_SJTO_IMPSTO", "ID_SJTO", "VGNCIA_DSDE", "ID_PRDO_IN", "VGNCIA_HSTA", "ID_PRDO_FN", "SLDO_CRTRA", "CDGO_PRDIO_CLSFCCION", "ID_PRDIO_DSTNO", "CDGO_ESTRTO", "ID_SJTO_TPO", "TPO_PRSNA") AS
  select a.cdgo_clnte,
       a.id_impsto,
       a.id_impsto_sbmpsto,
       c.idntfccion_sjto,
       a.id_sjto_impsto,
       c.id_sjto,
       min(a.vgncia) as vgncia_dsde,
       min(a.id_prdo) as id_prdo_in,
       max(a.vgncia) as vgncia_hsta,
       max(a.id_prdo) as id_prdo_fn,
       sum(a.vlor_sldo_cptal + nvl(a.vlor_intres, 0)) as sldo_crtra,
       f.cdgo_prdio_clsfccion,
       f.id_prdio_dstno,
       f.cdgo_estrto,
       g.id_sjto_tpo,
       g.tpo_prsna
  from v_gf_g_cartera_x_concepto a
  join v_si_i_sujetos_impuesto c
    on a.id_sjto_impsto = c.id_sjto_impsto
    and c.id_sjto_estdo = 1
  join si_i_sujetos_responsable r
    on r.id_sjto_impsto = c.id_sjto_impsto  ----Incluye responsable obligatorio
  join df_i_periodos d
    on a.id_prdo = d.id_prdo
   and a.id_impsto = d.id_impsto
   and a.id_impsto_sbmpsto = d.id_impsto_sbmpsto
   and a.vgncia = d.vgncia
  left join v_si_i_predios f
    on f.id_sjto_impsto = a.id_sjto_impsto
  left join si_i_personas g
    on g.id_sjto_impsto = a.id_sjto_impsto
 where a.cdgo_mvnt_fncro_estdo = 'NO'
 and (a.vlor_sldo_cptal + a.vlor_intres) > 0
   and not exists (select 1
          from cb_g_procesos_jrdco_mvmnto e
         where e.id_impsto = a.id_impsto
           and e.id_impsto_sbmpsto = a.id_impsto_sbmpsto
           and e.id_sjto_impsto = a.id_sjto_impsto
           and e.id_mvmnto_fncro = a.id_mvmnto_fncro
           and e.vgncia = a.vgncia
           and e.id_prdo = a.id_prdo
           and e.id_cncpto = a.id_cncpto)
 group by a.cdgo_clnte,
          a.id_impsto,
          a.id_impsto_sbmpsto,
          c.idntfccion_sjto,
          a.id_sjto_impsto,
          c.id_sjto,
          f.cdgo_prdio_clsfccion,
          f.id_prdio_dstno,
          f.cdgo_estrto,
          g.id_sjto_tpo,
          g.tpo_prsna;

