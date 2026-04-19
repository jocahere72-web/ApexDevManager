
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_BLOQUEA_CARTERA_PRESCRIPCION" (p_id_prscrpcion number,
                                                             p_id_usrio      number) is
  v_cdgo_rspsta  number;
  v_mnsje_rspsta varchar2(1000);
begin

  for r1 in (select a.id_sjto_impsto,
                    a.id_prscrpcion_sjto_impsto,
                    b.id_mvmnto_fncro
               from gf_g_prscrpcnes_sjto_impsto a
               join gf_g_movimientos_financiero b
                 on b.id_sjto_impsto = a.id_sjto_impsto
              where a.id_prscrpcion = p_id_prscrpcion
                and b.indcdor_mvmnto_blqdo = 'S') loop

    update gf_g_movimientos_financiero a
       set a.indcdor_mvmnto_blqdo  = 'N',
           a.id_mvmnto_trza_blqueo = null,
           a.id_mvmnto_trza_ultma  = null
     where a.id_mvmnto_fncro = r1.id_mvmnto_fncro;

    delete from gf_g_movimientos_traza a
     where a.id_mvmnto_fncro = r1.id_mvmnto_fncro;

  end loop;

  commit;

  pkg_gf_prescripcion.prc_ac_prscrpcion_estdo_blqueo(p_cdgo_clnte           => 23001,
                                                     p_id_prscrpcion        => p_id_prscrpcion,
                                                     p_indcdor_mvmnto_blqdo => 'S',
                                                     p_obsrvcion            => 'BLOQUEO DE CARTERA POR PRESCRIPCION DE VIGENCIA ACEPTADA',
                                                     p_id_usrio             => p_id_usrio,
                                                     o_cdgo_rspsta          => v_cdgo_rspsta,
                                                     o_mnsje_rspsta         => v_mnsje_rspsta);

  dbms_output.put_line(v_cdgo_rspsta || ' ' || v_mnsje_rspsta);
  if v_cdgo_rspsta = 0 then
    update gf_g_prescripciones t
       set t.id_usrio_autrza_rspsta = p_id_usrio,
           t.fcha_autrza_rspsta    =
           (select b.fcha_fin_real
              from gf_g_prescripciones a
              join wf_g_instancias_transicion b
                on b.id_instncia_fljo = a.id_instncia_fljo
             where a.id_prscrpcion = p_id_prscrpcion
               and b.id_fljo_trea_orgen = 326)
     where t.id_prscrpcion = p_id_prscrpcion;
    commit;
  end if;
end prc_bloquea_cartera_prescripcion;
/

