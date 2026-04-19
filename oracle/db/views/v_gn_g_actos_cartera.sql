
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GN_G_ACTOS_CARTERA" ("CDGO_CLNTE", "ID_SJTO_IMPSTO", "ID_SJTO", "IDNTFCCION_SJTO", "ID_ACTO_TPO", "CDGO_ACTO_TPO", "ID_ACTO", "NMRO_ACTO", "FCHA_ACTO", "CDGO_MVNT_FNCRO_ESTDO", "VLOR_CPTAL_INCIAL", "VLOR_INTRES_INCIAL", "VLOR_SLDO_TTAL_INCIAL", "VLOR_SLDO_CPTAL", "VLOR_INTRES", "VLOR_SLDO_TTAL") AS
  select a.cdgo_clnte,
       a.id_sjto_impsto,
       a.id_sjto,
       a.idntfccion_sjto,
       a.id_acto_tpo,
       a.cdgo_acto_tpo,
       a.id_acto,
       a.nmro_acto,
       a.fcha_acto,
       listagg(a.cdgo_mvnt_fncro_estdo, ', ') within group(order by a.cdgo_mvnt_fncro_estdo) cdgo_mvnt_fncro_estdo,
       sum(a.vlor_cptal_incial) vlor_cptal_incial,
       sum(a.vlor_intres_incial) vlor_intres_incial,
       sum(a.vlor_sldo_ttal_incial) vlor_sldo_ttal_incial,
       sum(a.vlor_sldo_cptal) vlor_sldo_cptal,
       sum(a.vlor_intres) vlor_intres,
       sum(a.vlor_sldo_ttal) vlor_sldo_ttal
  from (select d.cdgo_clnte,
               i.id_sjto_impsto,
               i.id_sjto,
               i.idntfccion_sjto,
               d.id_acto_tpo,
               b.cdgo_acto_tpo,
               d.id_acto,
               d.nmro_acto,
               d.fcha fcha_acto,
               v.cdgo_mvnt_fncro_estdo,
               sum(t.vlor_cptal) vlor_cptal_incial,
               sum(t.vlor_intres) vlor_intres_incial,
               sum(t.vlor_cptal + t.vlor_intres) vlor_sldo_ttal_incial,
               sum(v.vlor_sldo_cptal) vlor_sldo_cptal,
               sum(v.vlor_intres) vlor_intres,
               sum(v.vlor_sldo_cptal + v.vlor_intres) vlor_sldo_ttal
          from gn_g_actos d
          join gn_g_actos_vigencia t
            on t.id_acto = d.id_acto
          join v_si_i_sujetos_impuesto i
            on i.id_sjto_impsto = t.id_sjto_impsto
           and i.cdgo_clnte = d.cdgo_clnte
          join v_gf_g_cartera_x_vigencia v
            on t.id_sjto_impsto = v.id_sjto_impsto
           and d.cdgo_clnte = v.cdgo_clnte
           and v.id_impsto = i.id_impsto
           and v.vgncia = t.vgncia
           and v.id_prdo = t.id_prdo
           and v.id_sjto_impsto = t.id_sjto_impsto
          join gn_d_actos_tipo b
            on b.id_acto_tpo = d.id_acto_tpo
         group by d.cdgo_clnte,
                  i.id_sjto_impsto,
                  i.id_sjto,
                  i.idntfccion_sjto,
                  d.id_acto_tpo,
                  b.cdgo_acto_tpo,
                  d.id_acto,
                  d.nmro_acto,
                  d.fcha,
                  v.cdgo_mvnt_fncro_estdo) a
 group by a.cdgo_clnte,
          a.id_sjto_impsto,
          a.id_sjto,
          a.idntfccion_sjto,
          a.id_acto_tpo,
          a.cdgo_acto_tpo,
          a.id_acto,
          a.nmro_acto,
          a.fcha_acto
;

