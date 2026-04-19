
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_JG_RGTRAR_NVDAD_PRSNA_RTS" (o_mensaje out varchar2) is

  cursor c1 is
    select *
      from temp_identificaciones_nvdad t
     where not exists (select ''
              from si_g_novedades_persona a
              join si_g_novedades_persona_sjto b
                on a.id_nvdad_prsna = b.ID_NVDAD_PRSNA
             where a.cdgo_nvdad_tpo = 'INS'
               and a.id_usrio_rgstro = 230017
               and t.idntfccion = b.idntfccion)
       and not exists
     (select '' from si_c_sujetos b where b.idntfccion = t.idntfccion);

  --CONSULTA PARA BUSCAR LOS CODIGOS DEL DPTO Y MNCPIO
  /*select a.id_dprtmnto,
        a.cdgo_dprtmnto,
        b.id_mncpio,
        b.cdgo_mncpio,
        a.nmbre_dprtmnto,
        b.nmbre_mncpio
   from df_s_departamentos a
   join df_s_municipios b
     on a.id_dprtmnto = b.id_dprtmnto
  where a.nmbre_dprtmnto = 'HUILA'*/

  /*
   --consulta contribuyentes existentes en sujeto sin novedad persona
  select *
    from temp_identificaciones_nvdad t
   where not exists (select ''
            from si_g_novedades_persona a
            join si_g_novedades_persona_sjto b
              on a.id_nvdad_prsna = b.ID_NVDAD_PRSNA
           where a.cdgo_nvdad_tpo = 'INS'
        and a.id_usrio_rgstro = 230017
        and t.idntfccion = b.idntfccion)
     and  exists
   (select '' from si_c_sujetos b where b.idntfccion = t.idntfccion);

  --consulta contribuyentes existentes en sujeto con novedad persona
  select *
    from temp_identificaciones_nvdad t
   where  exists (select ''
            from si_g_novedades_persona a
            join si_g_novedades_persona_sjto b
              on a.id_nvdad_prsna = b.ID_NVDAD_PRSNA
           where a.cdgo_nvdad_tpo = 'INS'
        and a.id_usrio_rgstro = 230017
        and t.idntfccion = b.idntfccion)
     and  exists
   (select '' from si_c_sujetos b where b.idntfccion = t.idntfccion);

  --consulta contribuyentes no existentes en sujeto sin novedad persona
  select *
    from temp_identificaciones_nvdad t
   where not exists (select ''
            from si_g_novedades_persona a
            join si_g_novedades_persona_sjto b
              on a.id_nvdad_prsna = b.ID_NVDAD_PRSNA
           where a.cdgo_nvdad_tpo = 'INS'
        and a.id_usrio_rgstro = 230017
        and t.idntfccion = b.idntfccion)
     and not exists
   (select '' from si_c_sujetos b where b.idntfccion = t.idntfccion);*/

  v_cdgo_clnte        number := 23001;
  v_id_impsto         number := 230012;
  v_id_impsto_sbmpsto number := 2300122;
  v_pais              number := 5;
  v_id_sjto           number;
  v_id_usrio_sstma    number := 230017;
  v_id_sjto_impsto    number;
  v_obsrvcion         varchar2(50) := 'Se inscribe contribuyente del RTS, de forma masiva';
  v_id_instncia_fljo  number;
  v_id_nvdad_prsna    number;
  v_id_trcro          number;
  v_id_sjto_rspnsble  number;

begin
  for r1 in c1 loop

    --Insertamos en sujetos
    begin

      insert into si_c_sujetos
        (cdgo_clnte,
         idntfccion,
         idntfccion_antrior,
         id_pais,
         id_dprtmnto,
         id_mncpio,
         drccion,
         fcha_ingrso,
         estdo_blqdo)
      values
        (v_cdgo_clnte,
         r1.idntfccion,
         r1.idntfccion,
         v_pais,
         r1.id_dpto,
         r1.id_mncpio,
         r1.drccion,
         sysdate,
         'N')
      returning id_sjto into v_id_sjto;
    exception
      when others then
        o_mensaje := 'Error insertando en si_c_sujetos - ' || sqlerrm;
        rollback;
        raise;
    end;

    --Insertamos en sujeto impuesto

    begin
      insert into si_i_sujetos_impuesto
        (id_sjto,
         id_impsto,
         estdo_blqdo,
         id_pais_ntfccion,
         id_dprtmnto_ntfccion,
         id_mncpio_ntfccion,
         drccion_ntfccion,
         email,
         tlfno,
         fcha_rgstro,
         id_usrio,
         id_sjto_estdo,
         fcha_ultma_nvdad)
      values
        (v_id_sjto,
         v_id_impsto,
         'N',
         v_pais,
         r1.id_dpto,
         r1.id_mncpio,
         r1.drccion,
         r1.email,
         r1.tlfno,
         systimestamp,
         v_id_usrio_sstma,
         3,
         systimestamp)
      returning id_sjto_impsto into v_id_sjto_impsto;

    exception
      when others then
        o_mensaje := 'Error insertando en si_i_sujetos_impuesto - ' ||
                     sqlerrm;
        rollback;
        raise;
    end;

    --Insertamos en personas
    begin
      insert into si_i_personas
        (id_sjto_impsto, cdgo_idntfccion_tpo, tpo_prsna, nmbre_rzon_scial)
      values
        (v_id_sjto_impsto, 'N', 'N', r1.rzon_scial);

    exception
      when others then
        o_mensaje := 'Error insertando en si_i_personas - ' || sqlerrm;
        rollback;
        raise;
    end;

    --Insertamos en tercero
    begin
      select id_trcro
        into v_id_trcro
        from si_c_terceros
       where cdgo_clnte = v_cdgo_clnte
         and idntfccion = r1.idntfccion_rspnsble
       FETCH NEXT 1 ROWS ONLY;
    exception
      when no_data_found then
        begin
          insert into si_c_terceros
            (cdgo_clnte,
             cdgo_idntfccion_tpo,
             idntfccion,
             prmer_nmbre,
             drccion,
             id_pais,
             id_dprtmnto,
             id_mncpio,
             drccion_ntfccion,
             id_pais_ntfccion,
             id_dprtmnto_ntfccion,
             id_mncpio_ntfccion,
             email,
             tlfno,
             indcdor_cntrbynte,
             indcdr_fncnrio)
          values
            (v_cdgo_clnte,
             'N',
             r1.idntfccion_rspnsble,
             r1.nmbre_rprsntnte_lgal,
             r1.drccion,
             v_pais,
             r1.id_dpto,
             r1.id_mncpio,
             r1.drccion,
             v_pais,
             r1.id_dpto,
             r1.id_mncpio,
             r1.email,
             r1.tlfno,
             'N',
             'N')
          returning id_trcro into v_id_trcro;
        exception
          when others then
            o_mensaje := 'Error insertando en si_c_terceros - ' || sqlerrm;
            rollback;
            raise;
        end;
    end;

    --Insertamos el responsable
    begin
      insert into si_i_sujetos_responsable
        (id_sjto_impsto,
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
         tlfno,
         id_trcro,
         orgen_dcmnto)
      values
        (v_id_sjto_impsto,
         'N',
         r1.idntfccion_rspnsble,
         r1.nmbre_rprsntnte_lgal,
         '.',
         'S',
         'P',
         v_pais,
         r1.id_dpto,
         r1.id_mncpio,
         r1.drccion,
         r1.tlfno,
         v_id_trcro,
         '1');
    exception
      when others then
        o_mensaje := 'Error insertando en si_i_sujetos_responsable - ' ||
                     sqlerrm;
        rollback;
        raise;
    end;

    begin
      -- Se crea la instancia del flujo
      insert into wf_g_instancias_flujo
        (id_fljo,
         fcha_incio,
         fcha_fin_plnda,
         fcha_fin_optma,
         id_usrio,
         estdo_instncia)
      values
        (5, sysdate, sysdate, sysdate, v_id_usrio_sstma, 'FINALIZADA')
      returning id_instncia_fljo into v_id_instncia_fljo;

      -- Se crea la instancia de Tipo de Novedades
      insert into wf_g_instancias_transicion
        (id_instncia_fljo,
         id_fljo_trea_orgen,
         fcha_incio,
         fcha_fin_plnda,
         FCHA_FIN_OPTMA,
         FCHA_FIN_REAL,
         id_usrio,
         id_estdo_trnscion)
      values
        (v_id_instncia_fljo,
         21,
         sysdate,
         sysdate,
         sysdate,
         sysdate,
         v_id_usrio_sstma,
         3);

      -- se crea la instancia Gestion de Sujeto
      insert into wf_g_instancias_transicion
        (id_instncia_fljo,
         id_fljo_trea_orgen,
         fcha_incio,
         fcha_fin_plnda,
         FCHA_FIN_OPTMA,
         FCHA_FIN_REAL,
         id_usrio,
         id_estdo_trnscion)
      values
        (v_id_instncia_fljo,
         22,
         sysdate,
         sysdate,
         sysdate,
         sysdate,
         v_id_usrio_sstma,
         3);

      -- se crea la instancia Adjuntos y Observacion
      insert into wf_g_instancias_transicion
        (id_instncia_fljo,
         id_fljo_trea_orgen,
         fcha_incio,
         fcha_fin_plnda,
         FCHA_FIN_OPTMA,
         FCHA_FIN_REAL,
         id_usrio,
         id_estdo_trnscion)
      values
        (v_id_instncia_fljo,
         18,
         sysdate,
         sysdate,
         sysdate,
         sysdate,
         v_id_usrio_sstma,
         3);

      -- se crea la instancia de Registro de Novedad
      insert into wf_g_instancias_transicion
        (id_instncia_fljo,
         id_fljo_trea_orgen,
         fcha_incio,
         fcha_fin_plnda,
         FCHA_FIN_OPTMA,
         FCHA_FIN_REAL,
         id_usrio,
         id_estdo_trnscion)
      values
        (v_id_instncia_fljo,
         20,
         sysdate,
         sysdate,
         sysdate,
         sysdate,
         v_id_usrio_sstma,
         3);

      -- se crea la instancia de Aprobacion / Rechazo Novedad
      insert into wf_g_instancias_transicion
        (id_instncia_fljo,
         id_fljo_trea_orgen,
         fcha_incio,
         fcha_fin_plnda,
         FCHA_FIN_OPTMA,
         FCHA_FIN_REAL,
         id_usrio,
         id_estdo_trnscion)
      values
        (v_id_instncia_fljo,
         19,
         sysdate,
         sysdate,
         sysdate,
         sysdate,
         v_id_usrio_sstma,
         3);

    exception
      when others then
        o_mensaje := 'Error creando la instacia y las transiciones - ' ||
                     sqlerrm;
        rollback;
        raise;
    end;
    --Insertamos la novedad persona
    begin
      insert into si_g_novedades_persona
        (cdgo_clnte,
         id_impsto,
         id_impsto_sbmpsto,
         id_sjto_impsto,
         obsrvcion,
         id_instncia_fljo,
         fcha_rgstro,
         id_usrio_rgstro,
         fcha_aplco,
         id_usrio_aplco,
         id_fljo_trea,
         cdgo_nvdad_tpo,
         cdgo_nvdad_prsna_estdo)
      values
        (v_cdgo_clnte,
         v_id_impsto,
         v_id_impsto_sbmpsto,
         v_id_sjto_impsto,
         v_obsrvcion,
         v_id_instncia_fljo,
         systimestamp,
         v_id_usrio_sstma,
         sysdate,
         v_id_usrio_sstma,
         19,
         'INS',
         'APL')
      returning id_nvdad_prsna into v_id_nvdad_prsna;

    exception
      when others then
        o_mensaje := 'Error insertando en si_g_novedades_persona - ' ||
                     sqlerrm;
        rollback;
        raise;
    end;

    --Insertamos en novedades persona sujeto
    begin
      insert into si_g_novedades_persona_sjto
        (cdgo_idntfccion_tpo,
         idntfccion,
         prmer_nmbre,
         prmer_aplldo,
         nmbre_rzon_scial,
         drccion,
         id_pais,
         id_dprtmnto,
         id_mncpio,
         drccion_ntfccion,
         id_pais_ntfccion,
         id_dprtmnto_ntfccion,
         id_mncpio_ntfccion,
         email,
         tlfno,
         fcha_incio_actvddes,
         id_nvdad_prsna,
         tpo_prsna)
      values
        ('N',
         r1.idntfccion,
         r1.nmbre_rprsntnte_lgal,
         '.',
         r1.rzon_scial,
         r1.drccion,
         v_pais,
         r1.id_dpto,
         r1.id_mncpio,
         r1.drccion,
         v_pais,
         r1.id_dpto,
         r1.id_mncpio,
         r1.email,
         r1.tlfno,
         sysdate,
         v_id_nvdad_prsna,
         'N');

    exception
      when others then
        o_mensaje := 'Error insertando en si_g_novedades_persona_sjto - ' ||
                     sqlerrm;
        rollback;
        raise;
    end;

    -- Se craa la novedad persona responsable
    begin
      insert into si_g_novddes_prsna_rspnsble
        (id_nvdad_prsna,
         id_sjto_rspnsble,
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
         email,
         tlfno,
         id_trcro,
         actvo,
         estdo)
      values
        (v_id_nvdad_prsna,
         v_id_sjto_rspnsble,
         'N',
         r1.idntfccion_rspnsble,
         r1.nmbre_rprsntnte_lgal,
         '.',
         'S',
         'L',
         v_pais,
         r1.id_dpto,
         r1.id_mncpio,
         r1.drccion,
         r1.email,
         r1.tlfno,
         v_id_trcro,
         'S',
         'NUEVO');
    exception
      when others then
        o_mensaje := 'Error insertando en si_g_novddes_prsna_rspnsble - ' ||
                     sqlerrm;
        rollback;
        raise;
    end;

  end loop;
  commit;
  o_mensaje := 'Se registraron las novedades de RTS exitosamente';
end temp_jg_rgtrar_nvdad_prsna_rts;
/

