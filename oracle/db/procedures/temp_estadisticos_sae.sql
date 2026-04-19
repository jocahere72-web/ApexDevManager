
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_ESTADISTICOS_SAE" is

  cursor c1 is
    select t.*
      from TEMP_PREDIOS_SAE t
     where t.id_sjto_impsto is not null
     order by t.mtrcla;

  cursor c2(r_id_sjto_impsto varchar2,
            r_fcha_pryccion  date,
            r_vgncia         number) is
    select id_sjto_impsto,
           LISTAGG(vgncia, ', ') WITHIN GROUP(ORDER BY vgncia) vgncias,
           sum(vlor_sldo_cptal) vlor_sldo_cptal,
           sum(vlor_intres) vlor_intres
      from (select a.vgncia,
                   r_id_sjto_impsto id_sjto_impsto,
                   sum(a.vlor_sldo_cptal) vlor_sldo_cptal,
                   sum(a.vlor_intres) vlor_intres
              from (select *
                      from pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto(23001,
                                                                                230011,
                                                                                2300111,
                                                                                r_id_sjto_impsto,
                                                                                r_fcha_pryccion)) a
             where a.vlor_ttal > 0
               and a.cdgo_mvnt_fncro_estdo = 'NO'
               and a.vgncia <= r_vgncia
             group by a.vgncia)
     group by id_sjto_impsto;

  cursor c3(r_id_sjto_impsto varchar2,
            r_fcha_pryccion  date,
            r_vgncia         number) is
    select id_sjto_impsto,
           LISTAGG(vgncia, ', ') WITHIN GROUP(ORDER BY vgncia) vgncias,
           sum(vlor_sldo_cptal) vlor_sldo_cptal,
           sum(vlor_intres) vlor_intres
      from (select a.vgncia,
                   r_id_sjto_impsto id_sjto_impsto,
                   sum(a.vlor_sldo_cptal) vlor_sldo_cptal,
                   sum(a.vlor_intres) vlor_intres
              from (select *
                      from pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto(23001,
                                                                                230011,
                                                                                2300111,
                                                                                r_id_sjto_impsto,
                                                                                r_fcha_pryccion)) a
             where a.vlor_ttal > 0
               and a.cdgo_mvnt_fncro_estdo = 'NO'
               and a.vgncia > r_vgncia
             group by a.vgncia)
     group by id_sjto_impsto;

begin

  for r1 in c1 loop
    --sitpr001('Procesando predio: ' || r1.id_sjto_impsto, 'PREDIOS_SAE.TXT');
    for r2 in c2(r1.id_sjto_impsto,
                 r1.fcha_mdda_ctlar,
                 to_char(r1.fcha_mdda_ctlar, 'yyyy')) loop
      update temp_predios_sae t
         set t.vgncias_antes     = r2.vgncias,
             t.vlor_cptal_antes  = r2.vlor_sldo_cptal,
             t.vlor_intres_antes = r2.vlor_intres
       where t.id_sjto_impsto = r1.id_sjto_impsto;
    end loop;

    for r3 in c3(r1.id_sjto_impsto,
                 sysdate,
                 to_char(r1.fcha_mdda_ctlar, 'yyyy')) loop
      if r1.prdctvo = 'SI' then
        update temp_predios_sae t
           set t.vgncias_dspues     = r3.vgncias,
               t.vlor_cptal_dspues  = r3.vlor_sldo_cptal,
               t.vlor_intres_dspues = r3.vlor_intres
         where t.id_sjto_impsto = r1.id_sjto_impsto;
      else
        update temp_predios_sae t
           set t.vgncias_dspues     = r3.vgncias,
               t.vlor_cptal_dspues  = r3.vlor_sldo_cptal,
               t.vlor_intres_dspues = 0
         where t.id_sjto_impsto = r1.id_sjto_impsto;
      end if;
    end loop;
    commit;
  end loop;

end TEMP_ESTADISTICOS_SAE;
/

