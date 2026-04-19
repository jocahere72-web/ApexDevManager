
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_ANALISIS_DETERMINACIONES_VIGENCIA" (p_vgncia number) is

  cursor c1 is
    select d.id_dtrmncion,
           d.fcha_dtrmncion,
           a.nmro_acto,
           d.id_sjto_impsto,
           i.idntfccion_sjto,
           i.drccion,
           r.idntfccion,
           r.prmer_nmbre
      from gi_g_determinaciones d
      join gn_g_actos a
        on a.id_acto = d.id_acto
      join v_si_i_sujetos_impuesto i
        on i.id_sjto_impsto = d.id_sjto_impsto
       and i.id_impsto = d.id_impsto
       and i.cdgo_clnte = d.cdgo_clnte
       and i.id_sjto_estdo = 1
      join si_i_sujetos_responsable r
        on r.id_sjto_impsto = d.id_sjto_impsto
       and r.prncpal_s_n = 'S'
     where to_char(d.fcha_dtrmncion, 'YYYY') = p_vgncia
       and d.cdgo_clnte = 23001
       and d.id_impsto = 230011
    --   and d.id_sjto_impsto = 2805567
     order by d.id_dtrmncion;

  cursor c2(r_id_sjto_impsto number, r_id_dtrmncion number) is
    select id_sjto_impsto,
           listagg(vgncia, ', ') within group(order by vgncia) vgncias
      from (select d.id_sjto_impsto, d.vgncia
              from gi_g_determinacion_detalle d
             where d.id_dtrmncion = r_id_dtrmncion
               and d.id_sjto_impsto = r_id_sjto_impsto
             group by d.id_sjto_impsto, d.vgncia)
     group by id_sjto_impsto;

  cursor c3(r_id_sjto_impsto number, r_id_dtrmncion number) is
    select listagg(vgncia, ', ') within group(order by vgncia) vgncias_crtra,
           sum(vlor_sldo_cptal) vlor_sldo_cptal,
           sum(vlor_intres) vlor_intres
      from (select d.id_sjto_impsto,
                   d.vgncia,
                   sum(c.vlor_sldo_cptal) vlor_sldo_cptal,
                   sum(c.vlor_intres) vlor_intres
              from gi_g_determinacion_detalle d
              join v_gf_g_cartera_x_concepto c
                on c.id_sjto_impsto = d.id_sjto_impsto
               and c.vgncia = d.vgncia
               and c.id_prdo = d.id_prdo
               and c.id_cncpto = d.id_cncpto
             where d.id_dtrmncion = r_id_dtrmncion
               and d.id_sjto_impsto = r_id_sjto_impsto
               and c.id_impsto = 230011
               and c.id_impsto_sbmpsto = 2300111
               and c.cdgo_clnte = 23001
               and c.vlor_sldo_cptal > 0
             group by d.id_sjto_impsto, d.vgncia)
     group by id_sjto_impsto;

  cursor c4(r_id_sjto_impsto number, r_id_dtrmncion number) is
    select listagg(vgncia, ', ') within group(order by vgncia) vgncias_prcso
      from (select d.id_sjto_impsto, d.vgncia
              from gi_g_determinacion_detalle d
              join cb_g_prcsos_jrdc_dcmnt_mvnt c
                on c.id_sjto_impsto = d.id_sjto_impsto
               and c.vgncia = d.vgncia
               and c.id_prdo = d.id_prdo
               and c.id_cncpto = d.id_cncpto
             where d.id_dtrmncion = r_id_dtrmncion
               and d.id_sjto_impsto = r_id_sjto_impsto
               and c.id_impsto = 230011
               and c.id_impsto_sbmpsto = 2300111
               and c.cdgo_clnte = 23001
             group by d.id_sjto_impsto, d.vgncia)
     group by id_sjto_impsto;

  v_vgncias_dtrmndas varchar2(100);
  v_vgncias_crtra    varchar2(100);
  v_vlor_sldo_cptal  number;
  v_vlor_intres      number;
  v_vgncias_prcso    varchar2(100);
begin
  delete from temp_analisis_determnaciones;
  for r1 in c1 loop
    for r2 in c2(r1.id_sjto_impsto, r1.id_dtrmncion) loop
      v_vgncias_dtrmndas := r2.vgncias;
    end loop;
    v_vgncias_crtra   := null;
    v_vlor_sldo_cptal := 0;
    v_vlor_intres     := 0;
    for r3 in c3(r1.id_sjto_impsto, r1.id_dtrmncion) loop
      v_vgncias_crtra   := r3.vgncias_crtra;
      v_vlor_sldo_cptal := r3.vlor_sldo_cptal;
      v_vlor_intres     := r3.vlor_intres;
    end loop;
    v_vgncias_prcso := null;

    for r4 in c4(r1.id_sjto_impsto, r1.id_dtrmncion) loop
      v_vgncias_prcso := r4.vgncias_prcso;
    end loop;

    insert into temp_analisis_determnaciones
      (id_sjto_impsto,
       nmro_acto,
       fcha_dtrmncion,
       vgncias_dtrmndas,
       vgncias_crtra,
       crtra_cptal,
       crtra_intres,
       crtra_ttal,
       vgncias_prcso,
       DRCCION,
       RFRNCIA_CTSTRAL,
       ID_PRPTRIO,
       NMBRE_PRPTRIO)
    values
      (r1.id_sjto_impsto,
       r1.nmro_acto,
       r1.fcha_dtrmncion,
       v_vgncias_dtrmndas,
       v_vgncias_crtra,
       v_vlor_sldo_cptal,
       v_vlor_intres,
       v_vlor_sldo_cptal + v_vlor_intres,
       v_vgncias_prcso,
       r1.drccion,
       r1.idntfccion_sjto,
       r1.idntfccion,
       r1.prmer_nmbre);
    commit;
  end loop;

end temp_analisis_determinaciones_vigencia;
/

