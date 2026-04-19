
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_BORRAR_PROCESOS_JURIDICOS" (p_id_tpo_acto_mndmnto number DEFAULT 191,
                                                         p_id_tpo_acto_ctcion  number DEFAULT 192) is
  cursor c1 is
    select a.id_prcsos_jrdco
      from temp_mandamientos_ineficaz a
      join cb_g_procesos_juridico c
        on c.id_prcsos_jrdco = a.id_prcsos_jrdco
     where a.envdo is null
       and a.mdda_ctlar is null
       and a.vlor_sldo_cptal > 0
       and (a.brrar <> 'N' or a.brrar is null)
     order by a.id_prcsos_jrdco;

  cursor c2(r_id_prcsos_jrdco number) is
    select a.id_prcsos_jrdco_dcmnto, a.id_acto_tpo, a.id_acto
      from cb_g_procesos_jrdco_dcmnto a
     where a.id_prcsos_jrdco = r_id_prcsos_jrdco;

  cursor c3(r_id_prcsos_smu_lte number) is
    select a.id_prcsos_smu_sjto
      from cb_g_procesos_simu_sujeto a
     where a.id_prcsos_smu_lte = r_id_prcsos_smu_lte
       and exists
     (select 1
              from temp_mandamientos_ineficaz b
             where b.id_sjto = a.id_sjto
               and (b.vigencias_cruzadas is not null or
                   b.vigencias_sin_determinar is not null)
               and not exists
             (select *
                      from MC_G_EMBRGOS_CRT_PRC_JRD c
                     where c.id_prcsos_jrdco = b.id_prcsos_jrdco));

  p_id_prcsos_smu_lte number := 222;

begin
  for r1 in c1 loop

    dbms_output.put_line('Procesando: ' || r1.id_prcsos_jrdco);

    for r2 in c2(r1.id_prcsos_jrdco) loop

      update gn_g_actos a
         set a.id_acto_tpo = decode(r2.id_acto_tpo,
                                    26,
                                    p_id_tpo_acto_ctcion,
                                    35,
                                    p_id_tpo_acto_mndmnto,
                                    35)
       where a.id_acto = r2.id_acto;

      delete from cb_g_prcsos_jrdc_dcmnt_plnt a
       where a.id_prcsos_jrdco_dcmnto = r2.id_prcsos_jrdco_dcmnto;
      delete from cb_g_prcsos_jrdc_dcmnt_mvnt a
       where a.id_prcsos_jrdco_dcmnto = r2.id_prcsos_jrdco_dcmnto;
    end loop;

    delete from cb_g_procesos_juridico_sjto a
     where a.id_prcsos_jrdco = r1.id_prcsos_jrdco;

    delete from cb_g_procesos_jrdco_dcmnto a
     where a.id_prcsos_jrdco = r1.id_prcsos_jrdco;

    delete from cb_g_procesos_jrdco_mvmnto a
     where a.id_prcsos_jrdco = r1.id_prcsos_jrdco;

    delete from cb_g_procesos_jrdco_rspnsble a
     where a.id_prcsos_jrdco = r1.id_prcsos_jrdco;

    delete from cb_g_procesos_juridico a
     where a.id_prcsos_jrdco = r1.id_prcsos_jrdco;

  end loop;
  /*
    for r3 in c3(p_id_prcsos_smu_lte) loop
      delete from cb_g_procesos_smu_mvmnto a
       where a.id_prcsos_smu_sjto = r3.id_prcsos_smu_sjto;
      delete from cb_g_procesos_simu_rspnsble a
       where a.id_prcsos_smu_sjto = r3.id_prcsos_smu_sjto;
      delete from cb_g_procesos_simu_sujeto a
       where a.id_prcsos_smu_sjto = r3.id_prcsos_smu_sjto;
    end loop;
  */
end JL_BORRAR_PROCESOS_JURIDICOS;
/

