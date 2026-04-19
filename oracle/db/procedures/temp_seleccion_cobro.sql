
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_SELECCION_COBRO" (p_vgncia_incial number,
                                                 p_vgncia_fnal   number,
                                                 p_agrpar        varchar2,
                                                 p_brrar         varchar2) is

  cursor c1(r_vgncia_dtrmncion number) is
    select t.cdgo_clnte,
           t.id_dtrmncion,
           t.id_sjto_impsto,
           t.idntfccion_sjto
      from v_gi_g_crtra_dtrmncion_agrpado t
     where to_char(t.fcha_dtrmncion, 'yyyy') = r_vgncia_dtrmncion
       and t.cdgo_clnte = 23001
       and t.id_impsto = 230011
       and t.id_impsto_sbmpsto = 2300111
       and t.id_sjto_estdo = 1
          --       and t.fcha_ntfccion >= ADD_MONTHS(TRUNC(SYSDATE), -62) -- notificados antes de 5 años
       and not exists
     (select 1
              from temp_seleccion_iniciar_cobro a
             where a.id_sjto_impsto = t.id_sjto_impsto)
       and t.prptrio NOT IN ('NACION',
                             'NACION MINISTERIO DE DEFENSA DEPA',
                             'NACION HIMAT HIDROLOGIA METEREOLO',
                             'LA NACION',
                             'AGENCIA NACIONAL DE INFRAESTRUCTURA',
                             'LA  NACION',
                             'INCODER INSTITUTO COLOMBIANO DE D',
                             'MUNICIPIO DE MONTERIA')
       and t.idntfccion_rspnsble not in
           ('800096734',
            '8000967341',
            '8000967341-4',
            '800096734-1',
            '891080007-6',
            '891080007',
            '8301223980',
            '830122398',
            '830125996',
            '8301259969',
            '830125996-9',
            '830042321-0',
            '99999116',
            '8001246179');

  cursor c2(r_id_dtrmncion number) is
    select t.id_cncpto,
           t.id_impsto,
           t.id_impsto_sbmpsto,
           t.id_mvmnto_fncro,
           t.id_orgen,
           t.id_prdo,
           t.id_sjto,
           t.id_sjto_impsto,
           t.vgncia,
           t.vlor_intres,
           t.vlor_sldo_cptal,
           t.cdgo_mvmnto_orgn
      from v_gi_g_crtra_dtrmncion_dtlle t
     where t.cdgo_clnte = 23001
       and t.id_impsto = 230011
       and t.id_impsto_sbmpsto = 2300111
       and t.id_dtrmncion = r_id_dtrmncion
       and t.cdgo_mvnt_fncro_estdo = 'NO'
       and t.vlor_sldo_cptal > 0
       and not exists (select 1
              from cb_g_procesos_jrdco_mvmnto m
             where m.id_sjto_impsto = t.id_sjto_impsto
               and m.id_impsto = t.id_impsto
               and m.vgncia = t.vgncia
               and m.id_prdo = t.id_prdo);

  cursor c3(r_vgncia_incial number, r_vgncia_fnal number) is
    select t.cdgo_clnte,
           t.id_dtrmncion,
           t.id_sjto_impsto,
           t.idntfccion_sjto
      from v_gi_g_crtra_dtrmncion_agrpado t
     where to_number(to_char(t.fcha_dtrmncion, 'yyyy')) > r_vgncia_incial
       and to_number(to_char(t.fcha_dtrmncion, 'yyyy')) <= r_vgncia_fnal
       and t.cdgo_clnte = 23001
       and t.id_impsto = 230011
       and t.id_impsto_sbmpsto = 2300111
       and t.vlor_sldo_ttal > 0
          --    and t.fcha_ntfccion >= ADD_MONTHS(TRUNC(SYSDATE), -62) -- notificados antes de 5 años
       and exists (select 1
              from temp_seleccion_iniciar_cobro i
             where i.id_sjto_impsto = t.id_sjto_impsto);
begin
  if p_brrar = 'S' then
    delete from temp_seleccion_iniciar_cobro;
    commit;
  end if;
  for r1 in c1(p_vgncia_incial) loop
    for r2 in c2(r1.id_dtrmncion) loop
      begin
        insert into temp_seleccion_iniciar_cobro
          (cdgo_clnte,
           idntfccion_sjto,
           id_cncpto,
           id_impsto,
           id_impsto_sbmpsto,
           id_mvmnto_fncro,
           id_orgen,
           id_prdo,
           id_sjto,
           id_sjto_impsto,
           vgncia,
           vlor_intres,
           vlor_sldo_cptal,
           cdgo_mvmnto_orgn,
           ID_DTRMNCION)
        values
          (r1.cdgo_clnte,
           r1.idntfccion_sjto,
           r2.id_cncpto,
           r2.id_impsto,
           r2.id_impsto_sbmpsto,
           r2.id_mvmnto_fncro,
           r2.id_orgen,
           r2.id_prdo,
           r2.id_sjto,
           r1.id_sjto_impsto,
           r2.vgncia,
           r2.vlor_intres,
           r2.vlor_sldo_cptal,
           r2.cdgo_mvmnto_orgn,
           R1.ID_DTRMNCION);
      exception
        when others then
          dbms_output.put_line('Error predio: ' || r1.idntfccion_sjto ||
                               ' vigencia: ' || r2.vgncia);
      end;
    end loop;
  end loop;
  commit;

  if p_agrpar = 'S' then

    for r3 in c3(p_vgncia_incial, p_vgncia_fnal) loop
      for r2 in c2(r3.id_dtrmncion) loop
        begin
          insert into temp_seleccion_iniciar_cobro
            (cdgo_clnte,
             idntfccion_sjto,
             id_cncpto,
             id_impsto,
             id_impsto_sbmpsto,
             id_mvmnto_fncro,
             id_orgen,
             id_prdo,
             id_sjto,
             id_sjto_impsto,
             vgncia,
             vlor_intres,
             vlor_sldo_cptal,
             cdgo_mvmnto_orgn,
             ID_DTRMNCION)
          values
            (r3.cdgo_clnte,
             r3.idntfccion_sjto,
             r2.id_cncpto,
             r2.id_impsto,
             r2.id_impsto_sbmpsto,
             r2.id_mvmnto_fncro,
             r2.id_orgen,
             r2.id_prdo,
             r2.id_sjto,
             r3.id_sjto_impsto,
             r2.vgncia,
             r2.vlor_intres,
             r2.vlor_sldo_cptal,
             r2.cdgo_mvmnto_orgn,
             R3.ID_DTRMNCION);
        exception
          when others then
            dbms_output.put_line('Error predio: ' || r3.idntfccion_sjto ||
                                 ' vigencia: ' || r2.vgncia);
        end;
      end loop;
    end loop;
    commit;
  end if;
end temp_seleccion_cobro;
/

