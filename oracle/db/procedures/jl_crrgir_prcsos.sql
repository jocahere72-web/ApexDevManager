
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_CRRGIR_PRCSOS" is
  cursor c1 is
    with anios_individuales as
     (select distinct trim(regexp_substr(vcga.vgncias, '[^,]+', 1, level)) as vgncia,
                      vcga.id_prcsos_jrdco,
                      vcga.idntfccion_sjto,
                      vcga.id_sjto_impsto,
                      vcga.dscrpcion_sjto_estdo,
                      vcga.nmro_mndmnto,
                      vcga.nmro_prcso_jrdco,
                      vcga.id_prptrio,
                      vcga.prptrio,
                      vcga.vlor_sldo_cptal,
                      vcga.vlor_intres,
                      vcga.vlor_sldo_ttal
        from v_cb_g_prcsos_jrdco_crtra_agrpdo vcga
       where vcga.cdgo_clnte = 23001
         and vcga.id_impsto = 230011
         and vcga.id_impsto_sbmpsto = 2300111
         and to_char(vcga.fcha_prcso, 'YYYYMMDD') = '20231213'
         and vcga.vlor_sldo_cptal > 0
         and vcga.id_prcsos_jrdco <> 296042 -- proceso a borrar completamente
      -- and vcga.id_prcsos_jrdco = 292697
      connect by level <= regexp_count(vcga.vgncias, ',') + 1
             and prior sys_guid() is not null
             and prior vcga.vgncias = vcga.vgncias
             and prior vcga.id_prcsos_jrdco = vcga.id_prcsos_jrdco),
    vigencias_filtradas as
     (select ai.id_prcsos_jrdco,
             ai.idntfccion_sjto,
             ai.id_sjto_impsto,
             ai.dscrpcion_sjto_estdo,
             ai.nmro_mndmnto,
             ai.nmro_prcso_jrdco,
             ai.id_prptrio,
             ai.prptrio,
             ai.vlor_sldo_cptal,
             ai.vlor_intres,
             ai.vlor_sldo_ttal,
             listagg(ai.vgncia, ',') within group(order by ai.vgncia) as vigencias,
             listagg(case
                       when exists
                        (select 1
                               from cb_g_procesos_jrdco_mvmnto cjpm
                              where cjpm.vgncia = ai.vgncia
                                and cjpm.id_sjto_impsto = ai.id_sjto_impsto
                                and cjpm.id_prcsos_jrdco <> ai.id_prcsos_jrdco) then
                        ai.vgncia
                     end,
                     ',') within group(order by ai.vgncia) as vigencias_cruzadas,
             listagg(case
                       when not exists
                        (select 1
                               from gi_g_determinacion_detalle d
                              where d.vgncia = ai.vgncia
                                and d.id_sjto_impsto = ai.id_sjto_impsto) then
                        ai.vgncia
                     end,
                     ',') within group(order by ai.vgncia) as vigencias_sin_determinar
        from anios_individuales ai
       group by ai.id_prcsos_jrdco,
                ai.idntfccion_sjto,
                ai.id_sjto_impsto,
                ai.dscrpcion_sjto_estdo,
                ai.nmro_mndmnto,
                ai.nmro_prcso_jrdco,
                ai.id_prptrio,
                ai.prptrio,
                ai.vlor_sldo_cptal,
                ai.vlor_intres,
                ai.vlor_sldo_ttal)
    select id_prcsos_jrdco,
           idntfccion_sjto,
           id_sjto_impsto,
           dscrpcion_sjto_estdo,
           nmro_prcso_jrdco,
           nmro_mndmnto,
           id_prptrio,
           prptrio,
           vlor_sldo_cptal,
           vlor_intres,
           vlor_sldo_ttal,
           vigencias,
           vigencias_cruzadas,
           vigencias_sin_determinar,
           decode(vigencias_cruzadas,
                  null,
                  vigencias_sin_determinar,
                  vigencias_cruzadas ||
                  decode(vigencias_sin_determinar,
                         null,
                         '',
                         ',' || vigencias_sin_determinar)) vigencias_borrar
      from vigencias_filtradas
     where (vigencias_cruzadas is not null or
           vigencias_sin_determinar is not null)
       and exists (select 1
              from temp_citaciones_20231214 k
             where k.proceso = nmro_prcso_jrdco)
     order by nmro_mndmnto;

  cursor c2(r_id_prcsos_jrdco number) is
    select a.id_prcsos_jrdco_dcmnto
      from cb_g_procesos_jrdco_dcmnto a
     where a.id_prcsos_jrdco = r_id_prcsos_jrdco;

  cursor c3(r_id_prcsos_jrdco number) is
    select a.id_prcsos_jrdco_dcmnto
      from cb_g_procesos_jrdco_dcmnto a
     where a.id_prcsos_jrdco = r_id_prcsos_jrdco
       and a.id_acto_tpo = 35; --mandamiento

begin

  for r1 in c1 loop
    dbms_output.put_line('Procesando: ' || r1.idntfccion_sjto);

    --corrección de vigencias
    delete from cb_g_procesos_jrdco_mvmnto a
     where a.id_prcsos_jrdco = r1.id_prcsos_jrdco
       and r1.vigencias_borrar like '%' || a.vgncia || '%';

    for r2 in c2(r1.id_prcsos_jrdco) loop
      delete from cb_g_prcsos_jrdc_dcmnt_mvnt a
       where a.id_prcsos_jrdco_dcmnto = r2.id_prcsos_jrdco_dcmnto
         and r1.vigencias_borrar like '%' || a.vgncia || '%';
    end loop;
    commit;

    for r3 in c3(r1.id_prcsos_jrdco) loop
      --generación del documento
      jl_genera_acto_cobro(p_cdgo_clnte             => 23001,
                           p_id_prcsos_jrdco_dcmnto => r3.id_prcsos_jrdco_dcmnto);
    end loop;
  end loop;

end jl_crrgir_prcsos;
/

