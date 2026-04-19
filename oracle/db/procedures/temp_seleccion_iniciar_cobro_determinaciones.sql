
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_SELECCION_INICIAR_COBRO_DETERMINACIONES" (p_brrar varchar2 default 'N') is

  cursor c1 is
    select t.cdgo_clnte,
           t.id_dtrmncion,
           t.id_sjto_impsto,
           t.idntfccion_sjto,
           t.vlor_sldo_cptal,
           t.cdgo_mvnt_fncro_estdo,
           t.id_sjto_estdo,
           a.rowid
      from v_gi_g_crtra_dtrmncion_agrpado t
      join temp_seleccion_cobro_determinaciones a
        on a.rfrncia_ctstral = t.idntfccion_sjto
       and to_char(a.nmro_drtmncion) = t.nmro_acto
     where t.cdgo_clnte = 23001
       and t.id_impsto = 230011
       and t.id_impsto_sbmpsto = 2300111
       and a.obsrvcion is null
       and t.prptrio not in ('NACION',
                             'NACION MINISTERIO DE DEFENSA DEPA',
                             'NACION HIMAT HIDROLOGIA METEREOLO',
                             'LA NACION',
                             'LA  NACION',
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

  --marcar predios excluidos
  cursor c3 is
    select t.cdgo_clnte,
           t.id_dtrmncion,
           t.id_sjto_impsto,
           t.idntfccion_sjto,
           t.vlor_sldo_cptal,
           t.idntfccion_rspnsble,
           t.prptrio,
           a.rowid
      from v_gi_g_crtra_dtrmncion_agrpado t
      join temp_seleccion_cobro_determinaciones a
        on a.rfrncia_ctstral = t.idntfccion_sjto
       and to_char(a.nmro_drtmncion) = t.nmro_acto
     where t.cdgo_clnte = 23001
       and t.id_impsto = 230011
       and t.id_impsto_sbmpsto = 2300111
       and t.id_sjto_estdo = 1
       and (t.prptrio in ('NACION',
                          'NACION MINISTERIO DE DEFENSA DEPA',
                          'NACION HIMAT HIDROLOGIA METEREOLO',
                          'LA NACION',
                          'LA  NACION',
                          'INCODER INSTITUTO COLOMBIANO DE D',
                          'MUNICIPIO DE MONTERIA') or
           t.idntfccion_rspnsble in
           ('800096734',
             '8000967341',
             '8000967341-4',
             '800096734-1',
             '891080007-6',
             '891080007',
             '8301223980',
             '830122398',
             '830042321-0',
             '99999116',
             '8001246179'));

  v_encntro boolean;
begin
  if p_brrar = 'S' then
    delete from temp_seleccion_iniciar_cobro t where t.id_impsto = 230011;
  end if;
  for r1 in c1 loop
    if r1.id_sjto_estdo = 1 then
      if r1.vlor_sldo_cptal > 0 then
        if r1.cdgo_mvnt_fncro_estdo = 'NO' then
          v_encntro := false;
          for r2 in c2(r1.id_dtrmncion) loop
            begin
              v_encntro := true;
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
                 id_dtrmncion)
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
                 r1.id_dtrmncion);
            exception
              when others then
                dbms_output.put_line('Error predio: ' ||
                                     r1.idntfccion_sjto || ' vigencia: ' ||
                                     r2.vgncia);
            end;
          end loop;
          if v_encntro then
            update temp_seleccion_cobro_determinaciones a
               set a.obsrvcion = 'PROCESADO'
             where a.rowid = r1.rowid;
          else
            update temp_seleccion_cobro_determinaciones a
               set a.obsrvcion = 'EN COBRO'
             where a.rowid = r1.rowid;
          end if;
        else
          update temp_seleccion_cobro_determinaciones a
             set a.obsrvcion = 'CONVENIO'
           where a.rowid = r1.rowid;
        end if;
      else
        update temp_seleccion_cobro_determinaciones a
           set a.obsrvcion = 'SIN SALDO'
         where a.rowid = r1.rowid;
      end if;
    else
      update temp_seleccion_cobro_determinaciones a
         set a.obsrvcion = 'PREDIO INACTIVO'
       where a.rowid = r1.rowid;
    end if;
  end loop;

  for r3 in c3 loop
    update temp_seleccion_cobro_determinaciones a
       set a.obsrvcion = 'PREDIO DE: ' || r3.idntfccion_rspnsble || ' ' ||
                         r3.prptrio
     where a.rowid = r3.rowid;
  end loop;
  commit;
end temp_seleccion_iniciar_cobro_determinaciones;
/

