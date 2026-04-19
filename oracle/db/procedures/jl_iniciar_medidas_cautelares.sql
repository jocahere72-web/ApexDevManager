
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_INICIAR_MEDIDAS_CAUTELARES" (p_cdgo_clnte         number,
                                                          p_id_impsto          number,
                                                          p_id_impsto_sbmpsto  number,
                                                          p_lte_smu            in out number,
                                                          p_id_fncnrio         number default 194, --beatriz berrocal
                                                          p_id_tpos_mdda_ctlar number default 2 --financiero
                                                          ) is
  /*
    sql para insertar los datos a aperturar el lote de medidas cautelares con base al proceso de cobro se una
    principalmente para industria

    delete from temp_identificaciones_cautelar;
      insert into temp_identificaciones_cautelar
    select b.idntfccion_sjto,a.nmro_prcso_jrdco from cb_g_procesos_juridico a
    join v_cb_g_procesos_juridico_sjto b on b.id_prcsos_jrdco = a.id_prcsos_jrdco
    where to_char(a.fcha,'yyyymmdd') = '20241203';

    --Cruce con procesos para validacion de cartera y convenios
  select a.*
    from TEMP_IDENTIFICACIONES_CAUTELAR t
    join v_cb_g_prcsos_jrdco_crtra_agrpdo a
      on a.idntfccion_sjto = t.idntfccion
     and a.nmro_prcso_jrdco = t.nmro_prcso_jrdco
   where a.prncpal_s_n = 'S'
   order by a.idntfccion_sjto;

  -- Validacion que los registros existan
  select t.*
    from TEMP_IDENTIFICACIONES_CAUTELAR t
   where not exists (select 1
            from v_cb_g_prcsos_jrdco_crtra_agrpdo a
           where a.idntfccion_sjto = t.idntfccion
             and a.nmro_prcso_jrdco = t.nmro_prcso_jrdco
             and a.prncpal_s_n = 'S')
   order by t.idntfccion;

  --Duplicados
  select t.idntfccion, t.nmro_prcso_jrdco, count(*)
    from TEMP_IDENTIFICACIONES_CAUTELAR t
   group by t.idntfccion, t.nmro_prcso_jrdco
  having count(1) > 1

  --Borrar duplicados
  DELETE
    FROM TEMP_IDENTIFICACIONES_CAUTELAR
   WHERE ROWID NOT IN (SELECT MIN(ROWID)
                         FROM TEMP_IDENTIFICACIONES_CAUTELAR
                        GROUP BY idntfccion, nmro_prcso_jrdco);

  -- Adiciona los sujetos al oficio de embargo
  begin
  for r1 in (select *
               from (select distinct a.id_acto_ofcio,
                                     c.id_sjto_impsto,
                                     c.id_impsto_sbmpsto
                       from mc_g_solicitudes_y_oficios a
                       join mc_g_embargos_cartera b
                         on b.id_embrgos_crtra = a.id_embrgos_crtra
                       join mc_g_embargos_cartera_detalle c
                         on c.id_embrgos_crtra = b.id_embrgos_crtra
                      where to_char(a.fcha_slctud, 'yyyymmdd') = '20250805') d
              where not exists (select 1
                       from gn_g_actos_sujeto_impuesto e
                      where e.id_acto = d.id_acto_ofcio
                      and e.id_sjto_impsto = d.Id_Sjto_Impsto)) loop

       insert into gn_g_actos_sujeto_impuesto
         (id_acto, id_impsto_sbmpsto, id_sjto_impsto)
       values
         (r1.id_acto_ofcio, r1.id_impsto_sbmpsto, r1.id_sjto_impsto);

     end loop;
   end;

    */

  cursor c1 is
    select a.id_sjto, a.id_sjto_impsto, t.nmro_prcso_jrdco
      from temp_identificaciones_cautelar t
      join v_si_i_sujetos_impuesto a
        on a.id_impsto = p_id_impsto
       and a.idntfccion_sjto = t.idntfccion
       and a.id_sjto_estdo = 1
     order by t.idntfccion;

  cursor c2_i(r_id_sjto_impsto number) is
    select b.nmbre_rzon_scial,
           b.cdgo_idntfccion_tpo,
           a.idntfccion_sjto,
           a.id_pais_ntfccion,
           a.id_dprtmnto_ntfccion,
           a.id_mncpio_ntfccion,
           a.drccion_ntfccion,
           a.email
      from v_si_i_sujetos_impuesto a
      join si_i_personas b
        on b.id_sjto_impsto = a.id_sjto_impsto
     where a.cdgo_clnte = p_cdgo_clnte
       and a.id_sjto_impsto = r_id_sjto_impsto
     group by b.nmbre_rzon_scial,
              b.cdgo_idntfccion_tpo,
              a.idntfccion_sjto,
              a.id_pais_ntfccion,
              a.id_dprtmnto_ntfccion,
              a.id_mncpio_ntfccion,
              a.drccion_ntfccion,
              a.email;

  cursor c2_p(r_id_sjto_impsto number) is
    select a.prmer_nmbre,
           a.sgndo_nmbre,
           a.prmer_aplldo,
           a.sgndo_aplldo,
           a.cdgo_idntfccion_tpo,
           a.idntfccion_rspnsble,
           a.prncpal_s_n,
           a.prcntje_prtcpcion,
           a.cdgo_tpo_rspnsble,
           a.id_pais,
           a.id_dprtmnto,
           a.id_mncpio,
           a.drccion
      from v_si_i_sujetos_responsable a
     where a.cdgo_clnte = p_cdgo_clnte
       and a.id_sjto_impsto = r_id_sjto_impsto
       and a.idntfccion_rspnsble <> '0'
     group by a.prmer_nmbre,
              a.sgndo_nmbre,
              a.prmer_aplldo,
              a.sgndo_aplldo,
              a.cdgo_idntfccion_tpo,
              a.idntfccion_rspnsble,
              a.prncpal_s_n,
              a.prcntje_prtcpcion,
              a.cdgo_tpo_rspnsble,
              a.id_pais,
              a.id_dprtmnto,
              a.id_mncpio,
              a.drccion;

  cursor c3(r_id_sjto_impsto number, r_nmro_prcso_jrdco number) is
    select a.cdgo_clnte,
           a.id_impsto,
           a.id_impsto_sbmpsto,
           a.cdgo_mvmnto_orgn,
           a.id_orgen,
           a.id_mvmnto_fncro,
           a.id_sjto_impsto,
           a.vgncia,
           a.id_prdo,
           a.prdo,
           a.id_cncpto,
           a.cdgo_cncpto,
           a.dscrpcion_cncpto,
           a.vlor_sldo_cptal,
           nvl(a.vlor_intres, 0) vlor_intres,
           rownum as num
      from v_gf_g_cartera_x_concepto a
      join si_i_sujetos_impuesto b
        on b.id_sjto_impsto = a.id_sjto_impsto
     where a.cdgo_clnte = p_cdgo_clnte
       and a.id_impsto = p_id_impsto
       and a.id_impsto_sbmpsto = p_id_impsto_sbmpsto
       and b.id_sjto_impsto = r_id_sjto_impsto
       and a.vlor_sldo_cptal > 0
       and a.cdgo_mvnt_fncro_estdo = 'NO'
       and a.indcdor_mvmnto_blqdo = 'N'
       and not exists
     (select 1
              from mc_g_embargos_smu_mvmnto c
             where c.cdgo_clnte = a.cdgo_clnte
               and c.id_impsto = a.id_impsto
               and c.id_impsto_sbmpsto = a.id_impsto_sbmpsto
               and c.id_sjto_impsto = a.id_sjto_impsto
               and c.vgncia = a.vgncia
               and c.id_prdo = a.id_prdo
               and c.id_cncpto = a.id_cncpto
               and c.cdgo_mvmnto_orgn = a.cdgo_mvmnto_orgn
               and c.id_orgen = a.id_orgen
               and c.id_mvmnto_fncro = a.id_mvmnto_fncro
               and exists
             (select 2
                      from mc_g_embargos_simu_lote   d,
                           mc_g_embargos_simu_sujeto e
                     where d.id_embrgos_smu_lte = e.id_embrgos_smu_lte
                       and e.id_embrgos_smu_sjto = c.id_embrgos_smu_sjto))
       and (exists (select 1
                      from cb_g_procesos_jrdco_mvmnto d
                      join cb_g_procesos_juridico e
                        on d.id_prcsos_jrdco = e.id_prcsos_jrdco
                     where e.nmro_prcso_jrdco = r_nmro_prcso_jrdco
                       and a.id_mvmnto_fncro = d.id_mvmnto_fncro
                       and a.vgncia = d.vgncia
                       and a.id_prdo = d.id_prdo
                       and a.id_cncpto = d.id_cncpto));

  v_lte_simu            number;
  v_id_embrgos_smu_sjto number;
  v_deuda_total         number(16, 2);
  v_embrgos_sin_rspnble number;
begin

  --se valida que el lote este o no nulo para en caso de estar nulo o 0 se cree un nuevo lote
  if p_lte_smu = 0 or p_lte_smu is null then

    insert into mc_g_embargos_simu_lote
      (cdgo_clnte, fcha_lte, id_fncnrio, id_tpos_mdda_ctlar)
    values
      (p_cdgo_clnte, sysdate, p_id_fncnrio, p_id_tpos_mdda_ctlar)
    returning id_embrgos_smu_lte into v_lte_simu;
  else
    v_lte_simu := p_lte_smu;
  end if;

  for r1 in c1 loop
    v_id_embrgos_smu_sjto := null;
    insert into mc_g_embargos_simu_sujeto
      (id_embrgos_smu_lte, id_sjto, vlor_ttal_dda, fcha_ingrso)
    values
      (v_lte_simu, r1.id_sjto, 0, sysdate)
    returning id_embrgos_smu_sjto into v_id_embrgos_smu_sjto;

    --responsables
    if p_id_impsto = p_cdgo_clnte || 1 then
      --predial
      for r2 in c2_p(r1.id_sjto_impsto) loop
        insert into mc_g_embargos_simu_rspnsble
          (id_embrgos_smu_sjto,
           cdgo_idntfccion_tpo,
           idntfccion,
           prmer_nmbre,
           sgndo_nmbre,
           prmer_aplldo,
           sgndo_aplldo,
           prncpal_s_n,
           cdgo_tpo_rspnsble,
           prcntje_prtcpcion,
           id_pais_ntfccion,
           id_dprtmnto_ntfccion,
           id_mncpio_ntfccion,
           drccion_ntfccion)
        values
          (v_id_embrgos_smu_sjto,
           r2.cdgo_idntfccion_tpo,
           r2.idntfccion_rspnsble,
           r2.prmer_nmbre,
           r2.sgndo_nmbre,
           r2.prmer_aplldo,
           r2.sgndo_aplldo,
           r2.prncpal_s_n,
           r2.cdgo_tpo_rspnsble,
           r2.prcntje_prtcpcion,
           r2.id_pais,
           r2.id_dprtmnto,
           r2.id_mncpio,
           r2.drccion);
      end loop;

    elsif p_id_impsto = p_cdgo_clnte || 2 then
      --industria
      for r2 in c2_i(r1.id_sjto_impsto) loop
        insert into mc_g_embargos_simu_rspnsble
          (id_embrgos_smu_sjto,
           cdgo_idntfccion_tpo,
           idntfccion,
           prmer_nmbre,
           prmer_aplldo,
           prncpal_s_n,
           cdgo_tpo_rspnsble,
           id_pais_ntfccion,
           id_dprtmnto_ntfccion,
           id_mncpio_ntfccion,
           drccion_ntfccion,
           email)
        values
          (v_id_embrgos_smu_sjto,
           r2.cdgo_idntfccion_tpo,
           r2.idntfccion_sjto,
           r2.nmbre_rzon_scial,
           '.',
           'S',
           'L',
           r2.id_pais_ntfccion,
           r2.id_dprtmnto_ntfccion,
           r2.id_mncpio_ntfccion,
           r2.drccion_ntfccion,
           r2.email);
      end loop;
    end if;
    v_deuda_total := 0;
    --cartera
    for r3 in c3(r1.id_sjto_impsto, r1.nmro_prcso_jrdco) loop
      insert into mc_g_embargos_smu_mvmnto
        (id_embrgos_smu_sjto,
         id_sjto_impsto,
         vgncia,
         id_prdo,
         id_cncpto,
         vlor_cptal,
         vlor_intres,
         cdgo_clnte,
         id_impsto,
         id_impsto_sbmpsto,
         cdgo_mvmnto_orgn,
         id_orgen,
         id_mvmnto_fncro)
      values
        (v_id_embrgos_smu_sjto,
         r3.id_sjto_impsto,
         r3.vgncia,
         r3.id_prdo,
         r3.id_cncpto,
         r3.vlor_sldo_cptal,
         r3.vlor_intres,
         r3.cdgo_clnte,
         r3.id_impsto,
         r3.id_impsto_sbmpsto,
         r3.cdgo_mvmnto_orgn,
         r3.id_orgen,
         r3.id_mvmnto_fncro);

      v_deuda_total := v_deuda_total +
                       (r3.vlor_sldo_cptal + r3.vlor_intres);
    end loop;
    update mc_g_embargos_simu_sujeto
       set vlor_ttal_dda = v_deuda_total
     where id_embrgos_smu_sjto = v_id_embrgos_smu_sjto;
    commit;
  end loop;

  select count(*)
    into v_embrgos_sin_rspnble
    from mc_g_embargos_simu_sujeto a
   where not exists (select 1
            from mc_g_embargos_simu_rspnsble b
           where b.id_embrgos_smu_sjto = a.id_embrgos_smu_sjto)
     and a.id_embrgos_smu_lte = v_lte_simu;

  dbms_output.put_line('Embargos sin responsables: ' ||
                       v_embrgos_sin_rspnble);

  select count(*)
    into v_embrgos_sin_rspnble
    from mc_g_embargos_simu_sujeto a
   where not exists (select 1
            from mc_g_embargos_smu_mvmnto b
           where b.id_embrgos_smu_sjto = a.id_embrgos_smu_sjto)
     and a.id_embrgos_smu_lte = v_lte_simu;

  dbms_output.put_line('Embargos sin cartera: ' || v_embrgos_sin_rspnble);

  if p_id_impsto = p_cdgo_clnte || 1 then
    jl_vlda_pgo_cta_prte_lte_ctlar(p_id_embrgos_smu_lte => v_lte_simu);
  end if;
  p_lte_smu := v_lte_simu;

end jl_iniciar_medidas_cautelares;
/

