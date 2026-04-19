
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_INICIAR_COBRO_ICA" (p_cdgo_clnte        number,
                                                 p_id_fncnrio        number,
                                                 p_id_prcsos_smu_lte in out number,
                                                 p_obsrvcion_lte     varchar2,
                                                 o_cdgo_rspsta       out number,
                                                 o_mnsje_rspsta      out varchar2) is

  cursor c1 is
    select a.id_sjto, a.id_sjto_impsto
      from TEMP_IDENTIFICACIONES t
      join v_si_i_sujetos_impuesto a
        on a.id_impsto = p_cdgo_clnte || 2
       and a.idntfccion_sjto = t.idntfccion
      join si_i_personas b
        on b.id_sjto_impsto = a.id_sjto_impsto
      join gi_g_declaraciones c
        on c.id_sjto_impsto = a.id_sjto_impsto
       and c.nmro_cnsctvo = t.vlor
      join v_gf_g_cartera_x_vigencia d
        on d.id_impsto = a.id_impsto
       and d.id_sjto_impsto = a.id_sjto_impsto
       and d.id_prdo = c.id_prdo
       and d.cdgo_mvnt_fncro_estdo = 'NO'
       and d.cdgo_mvmnto_orgn = 'DL'
     where a.id_sjto_estdo = 1
       and d.vlor_sldo_cptal > 0
     group by a.id_sjto, a.id_sjto_impsto
     order by a.id_sjto;

  cursor c2(r_id_sjto_impsto number) is
    select a.id_sjto_impsto,
           b.nmbre_rzon_scial,
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
       and a.id_impsto = p_cdgo_clnte || 2
       and a.id_sjto_impsto = r_id_sjto_impsto
     group by a.id_sjto_impsto,
              b.nmbre_rzon_scial,
              b.cdgo_idntfccion_tpo,
              a.idntfccion_sjto,
              a.id_pais_ntfccion,
              a.id_dprtmnto_ntfccion,
              a.id_mncpio_ntfccion,
              a.drccion_ntfccion,
              a.email;

  cursor c3(r_id_sjto_impsto number) is
    select d.*
      from TEMP_IDENTIFICACIONES t
      join v_si_i_sujetos_impuesto a
        on a.id_impsto = p_cdgo_clnte || 2
       and a.idntfccion_sjto = t.idntfccion
      join si_i_personas b
        on b.id_sjto_impsto = a.id_sjto_impsto
      join gi_g_declaraciones c
        on c.id_sjto_impsto = a.id_sjto_impsto
       and c.nmro_cnsctvo = t.vlor
      join v_gf_g_cartera_x_concepto d
        on d.id_impsto = a.id_impsto
       and d.id_sjto_impsto = a.id_sjto_impsto
       and d.id_prdo = c.id_prdo
       and d.cdgo_mvnt_fncro_estdo = 'NO'
       and d.cdgo_mvmnto_orgn = 'DL'
     where a.id_sjto_estdo = 1
       and d.vlor_sldo_cptal > 0
       and a.id_sjto_impsto = r_id_sjto_impsto
       and not exists (select 1
              from cb_g_procesos_jrdco_mvmnto e
             where e.id_sjto_impsto = a.id_sjto_impsto
               and e.vgncia = d.vgncia
               and e.id_prdo = d.id_prdo)
     order by d.id_sjto_impsto, d.vgncia;

  v_lte_simu          cb_g_procesos_simu_lote.id_prcsos_smu_lte%type;
  v_id_prcso_smu_sjto cb_g_procesos_simu_sujeto.id_prcsos_smu_sjto%type;
  v_deuda_total       number(16, 2);

begin

  if p_id_prcsos_smu_lte = 0 then
    begin
      insert into cb_g_procesos_simu_lote
        (cdgo_clnte, fcha_lte, id_fncnrio, obsrvcion, id_prcso_tpo)
      values
        (p_cdgo_clnte, sysdate, p_id_fncnrio, p_obsrvcion_lte, 2)
      returning id_prcsos_smu_lte into v_lte_simu;
    exception
      when others then
        o_cdgo_rspsta  := 20;
        o_mnsje_rspsta := 'Error al intentar generar el lote.' || SQLERRM;
        return;
    end;
  else
    v_lte_simu := p_id_prcsos_smu_lte;
  end if;

  for r1 in c1 loop
    begin
      insert into cb_g_procesos_simu_sujeto
        (id_prcsos_smu_lte, id_sjto, vlor_ttal_dda, rspnsbles, fcha_ingrso)
      values
        (v_lte_simu, r1.id_sjto, 0, '-', sysdate)
      returning id_prcsos_smu_sjto into v_id_prcso_smu_sjto;
    exception
      when others then
        o_cdgo_rspsta  := 25;
        o_mnsje_rspsta := 'Error al intentar registrar sujeto #' ||
                          r1.id_sjto;
        return;
    end;

    for r2 in c2(r1.id_sjto_impsto) loop
      begin
        insert into cb_g_procesos_simu_rspnsble
          (id_prcsos_smu_sjto,
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
           drccion_ntfccion,
           email)
        values
          (v_id_prcso_smu_sjto,
           r2.cdgo_idntfccion_tpo,
           r2.idntfccion_sjto,
           r2.nmbre_rzon_scial,
           '',
           '.',
           '',
           'S',
           'L',
           0,
           r2.id_pais_ntfccion,
           r2.id_dprtmnto_ntfccion,
           r2.id_mncpio_ntfccion,
           r2.drccion_ntfccion,
           r2.email);
      exception
        when others then
          o_cdgo_rspsta  := 55;
          o_mnsje_rspsta := 'Error mientras se intentaba incluir al responsable con identificacion #' ||
                            r2.idntfccion_sjto;
          continue;
      end;
    end loop;

    v_deuda_total := 0;

    for r3 in c3(r1.id_sjto_impsto) loop
      begin
        insert into cb_g_procesos_smu_mvmnto
          (id_prcsos_smu_sjto,
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
          (v_id_prcso_smu_sjto,
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
      exception
        when others then
          o_cdgo_rspsta  := 50;
          o_mnsje_rspsta := 'Error al intentar registrar datos de la cartera sujeto impuesto: ' ||
                            r3.id_sjto_impsto || ' - vigencia: ' ||
                            r3.vgncia;
          return;
      end;
    end loop;
    update cb_g_procesos_simu_sujeto
       set vlor_ttal_dda = v_deuda_total
     where id_prcsos_smu_sjto = v_id_prcso_smu_sjto;
  end loop;
  p_id_prcsos_smu_lte := v_lte_simu;
  commit;

end jl_iniciar_cobro_ica;
/

