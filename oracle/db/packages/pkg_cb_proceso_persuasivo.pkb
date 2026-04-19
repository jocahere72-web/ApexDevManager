
  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PKG_CB_PROCESO_PERSUASIVO" as

 procedure prc_rg_proceso_persuasivo(p_cdgo_clnte        in number,
                                      p_id_prcsos_smu_lte in number,
                                      p_id_sjto_impsto    in number default null,
                                      p_id_usrio          in number,
                                      p_id_plntlla        in number default null) as

    v_indcdor_prcsdo          varchar2(1);
    v_prcsar_cbro_prssvo      varchar2(1);
    v_obsrvcion_prcsmnto      clob;
    v_nmro_prcso_prssvo       number;
    v_nmro_lte_prcso_prssvo   number;
    v_id_prcso_prssvo_lte     number;
    v_id_prcsos_prssvo        number;
    v_id_fncnrio              number;
    v_cdgo_orgen_sjto         varchar2(3);
    v_id_acto_tpo             number;
    v_id_prcsos_prssvo_dcmnto number;
    v_id_plntlla              number;
    v_json_dcmnto             clob;
    v_dcmnto                  clob;
    v_nl                      number;
    v_nmbre_up                varchar2(100) := 'pkg_cb_proceso_persuasivo.prc_rg_proceso_persuasivo';
    o_cdgo_rspsta             number;
    o_mnsje_rspsta            varchar2(4000);
    -- o_id_acto                 gn_g_actos.id_acto%type;
    v_error exception;
    v_json_dcmntos_prrsvo clob;
    v_json_envio          clob;
    v_msvo                varchar2(1);
    v_cntdad              number := 0;
    -- v_vgncias_pssvo       number := 0;
    --v_vgncias_simu        number := 0;
    v_mnsje_rspsta varchar2(4000);

  begin

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Entrando a la up:' || v_nmbre_up || ' en ' ||
                          systimestamp,
                          6);

    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'OK';

    -- Inicializacion de variables
    v_id_prcso_prssvo_lte   := 0;
    v_nmro_lte_prcso_prssvo := 0;

    -- Buscar el ID del funcionario asociado al usuario
    begin
      select u.id_fncnrio
        into v_id_fncnrio
        from v_sg_g_usuarios u
       where u.id_usrio = p_id_usrio;
    exception
      when no_data_found then
        o_cdgo_rspsta  := 5;
        o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                          ', al intentar obtener el ID del usuario.';
        raise v_error;
    end;

    if p_id_sjto_impsto is not null then
      begin
        select count(*)
          into v_cntdad
          from cb_g_procesos_persuasivo_json a
         where a.id_prcsos_smu_lte = p_id_prcsos_smu_lte
           and a.id_usrio = p_id_usrio
           and a.indcdor_prcsdo = 'N'
           and a.id_sjto_impsto = p_id_sjto_impsto;
      exception
        when others then
          o_cdgo_rspsta  := 6;
          o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                            ', No se encontraron registros para iniciar proceso persuaivo.';
          raise v_error;
      end;
    else
      begin
        select count(*)
          into v_cntdad
          from cb_g_procesos_persuasivo_json a
         where a.id_prcsos_smu_lte = p_id_prcsos_smu_lte
           and a.id_usrio = p_id_usrio
           and a.indcdor_prcsdo = 'N';
      exception
        when others then
          o_cdgo_rspsta  := 6;
          o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                            ', No se encontraron registros para iniciar proceso persuaivo.';
          raise v_error;
      end;
    end if;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Actos a procesar: ' || ', ' || v_cntdad,
                          6);

     pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up,v_nl, 'p_id_prcsos_smu_lte: ' ||p_id_prcsos_smu_lte,6);
     pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up,v_nl, 'p_id_usrio: ' ||p_id_usrio,6);
     pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up,v_nl, ' p_id_sjto_impsto: ' || p_id_sjto_impsto,6);

    -- Recorrer los sujetos de la poblacion seleccionada
    begin

      for c_sjtos in (select id_prcsos_smu_sjto,
                             id_prcsos_smu_lte,
                             id_sjto,
                             vlor_ttal_dda,
                             id_impsto,
                             id_impsto_sbmpsto,
                             id_sjto_impsto
                        from cb_g_procesos_persuasivo_json a
                       where a.id_prcsos_smu_lte = p_id_prcsos_smu_lte
                         and a.id_usrio = p_id_usrio
                         and a.indcdor_prcsdo = 'N'
                         and (a.id_sjto_impsto = p_id_sjto_impsto or
                             p_id_sjto_impsto is null)) loop
/*
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'Procesando lote : ' || ', ' ||
                              p_id_prcsos_smu_lte || ' y proceso sujeto' ||
                              c_sjtos.id_prcsos_smu_sjto || ', sujeto ' ||
                              c_sjtos.id_sjto,
                              6);
*/
     pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up,v_nl, ' c_sjtos.id_prcsos_smu_sjto: ' || c_sjtos.id_prcsos_smu_sjto,6);
     pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up,v_nl, ' c_sjtos.id_prcsos_smu_lte: ' || c_sjtos.id_prcsos_smu_lte,6);
     pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up,v_nl, ' c_sjtos.id_sjto: ' || c_sjtos.id_sjto,6);
     pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up,v_nl, ' c_sjtos.vlor_ttal_dda: ' || c_sjtos.vlor_ttal_dda,6);
     pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up,v_nl, ' c_sjtos.id_impsto: ' || c_sjtos.id_impsto,6);
     pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up,v_nl, ' c_sjtos.id_impsto_sbmpsto: ' || c_sjtos.id_impsto_sbmpsto,6);
     pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up,v_nl, ' c_sjtos.id_sjto_impsto: ' || c_sjtos.id_sjto_impsto,6);


        -- Validamos si el sujeto ha sido procesado y
        -- obtener el origen del sujeto

        begin
          select indcdor_prcsdo, cdgo_orgn_sjto
            into v_indcdor_prcsdo, v_cdgo_orgen_sjto
            from v_cb_g_procesos_simu_sujeto_persuasivo
           where id_prcsos_smu_sjto = c_sjtos.id_prcsos_smu_sjto
             and id_prcsos_smu_lte = c_sjtos.id_prcsos_smu_lte
             and id_sjto = c_sjtos.id_sjto;
        exception
          when others then
            o_cdgo_rspsta  := 10;
            o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                              ', al validar estado de procesamiento del sujeto.';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ', ' || sqlerrm,
                                  6);
            --registramos la traza
            pkg_cb_proceso_persuasivo.prc_rg_prcsos_prssvo_trza(p_cdgo_clnte,
                                                                c_sjtos.id_prcsos_smu_sjto,
                                                                c_sjtos.id_prcsos_smu_lte,
                                                                c_sjtos.id_sjto,
                                                                null,
                                                                o_mnsje_rspsta,
                                                                systimestamp,
                                                                p_id_usrio,
                                                                null,
                                                                null);

            continue;
        end;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'antes del if con v_indcdor_prcsdo: ' ||
                              v_indcdor_prcsdo,
                              6);

        --El sujeto no ha sido procesado?
        if v_indcdor_prcsdo = 'N' then

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'entró a if con v_indcdor_prcsdo: ' ||
                                v_indcdor_prcsdo,
                                6);

          -- Habilitamos al sujeto para que pueda ser procesado
          v_prcsar_cbro_prssvo := 'S';
          v_obsrvcion_prcsmnto := null;

          -- El sujeto esta apto para realizar cobro persuasivo?
          if v_prcsar_cbro_prssvo = 'S' then

            -- Obtener consecutivo para el numero del proceso persuasivo
            v_nmro_prcso_prssvo := pkg_gn_generalidades.fnc_cl_consecutivo(p_cdgo_clnte,
                                                                           'NCP');

            -- No se ha generado un lote de proceso persuasivo?
            if v_id_prcso_prssvo_lte = 0 then
              -- Obtener un consecutivo para el numero del lote persuasivo.
              v_nmro_lte_prcso_prssvo := pkg_gn_generalidades.fnc_cl_consecutivo(p_cdgo_clnte,
                                                                                 'LPP');

              pkg_cb_proceso_persuasivo.prc_rg_proceso_persuasivo_lote(p_cdgo_clnte            => p_cdgo_clnte,
                                                                       p_nmro_lte_prcso_prssvo => v_nmro_lte_prcso_prssvo,
                                                                       p_id_fncnrio            => v_id_fncnrio,
                                                                       o_id_prcso_prssvo_lte   => v_id_prcso_prssvo_lte,
                                                                       o_cdgo_rspsta           => o_cdgo_rspsta,
                                                                       o_mnsje_rspsta          => o_mnsje_rspsta);

              if v_id_prcso_prssvo_lte is null then
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta,
                                      6);
                raise v_error;
              end if;

            end if;

            if v_cntdad > 1 then
              v_msvo := 'S';
            else
              v_msvo := 'N';
            end if;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  'Procederá a registrar el proceso',
                                  6);
            --registramos el proceso persuasivo
            pkg_cb_proceso_persuasivo.prc_rg_prcsos_prssvo(p_cdgo_clnte          => p_cdgo_clnte,
                                                           p_nmro_prcso          => v_nmro_lte_prcso_prssvo,
                                                           p_vlor_ttal_dda       => c_sjtos.vlor_ttal_dda,--0,
                                                           p_id_fncnrio          => v_id_fncnrio,
                                                           p_id_prcso_prssvo_lte => v_id_prcso_prssvo_lte,
                                                           p_msvo                => v_msvo,
                                                           o_id_prcsos_prssvo    => v_id_prcsos_prssvo,
                                                           o_cdgo_rspsta         => o_cdgo_rspsta,
                                                           o_mnsje_rspsta        => o_mnsje_rspsta);

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  'Salio con proceso: ' ||
                                  v_id_prcsos_prssvo,
                                  6);

            if v_id_prcsos_prssvo is not null then
              begin
                -- Asociar el sujeto al proceso de cobro persuasivo generado
                insert into cb_g_procesos_persuasivo_sjto

                  (id_prcsos_prssvo, cdgo_sjto_orgen, id_sjto_orgen)
                values
                  (v_id_prcsos_prssvo, v_cdgo_orgen_sjto, c_sjtos.id_sjto);
              exception
                when others then
                  rollback;
                  o_cdgo_rspsta  := 25;
                  o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                                    ', al intentar registrar sujeto #' ||
                                    c_sjtos.id_sjto || '.';
                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        null,
                                        v_nmbre_up,
                                        v_nl,
                                        o_mnsje_rspsta || ', ' || sqlerrm,
                                        6);
                  --registramos la traza
                  pkg_cb_proceso_persuasivo.prc_rg_prcsos_prssvo_trza(p_cdgo_clnte,
                                                                      c_sjtos.id_prcsos_smu_sjto,
                                                                      c_sjtos.id_prcsos_smu_lte,
                                                                      c_sjtos.id_sjto,
                                                                      null,
                                                                      o_mnsje_rspsta,
                                                                      systimestamp,
                                                                      p_id_usrio,
                                                                      v_id_prcsos_prssvo,
                                                                      v_nmro_lte_prcso_prssvo);

                  raise v_error;
              end;

              -- Recorrido de los responsables
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    'Recorrido de los responsables',
                                    6);
              begin
                for c_rspsnsbles in (select a.id_prcsos_smu_sjto,
                                            a.cdgo_idntfccion_tpo,
                                            a.idntfccion,
                                            a.nmbre_cmplto,
                                            a.prncpal_s_n,
                                            a.cdgo_tpo_rspnsble,
                                            a.prcntje_prtcpcion,
                                            a.id_pais_ntfccion,
                                            a.id_mncpio_ntfccion,
                                            a.id_dprtmnto_ntfccion,
                                            a.drccion_ntfccion,
                                            a.email,
                                            a.tlfno,
                                            a.cllar,
                                            a.cdgo_orgen_rspnsble
                                       from v_cb_g_procesos_simu_rspnsble a
                                      where a.id_prcsos_smu_sjto =
                                            c_sjtos.id_prcsos_smu_sjto
                                      group by a.id_prcsos_smu_sjto,
                                               a.cdgo_idntfccion_tpo,
                                               a.idntfccion,
                                               a.nmbre_cmplto,
                                               a.prncpal_s_n,
                                               a.cdgo_tpo_rspnsble,
                                               a.prcntje_prtcpcion,
                                               a.id_pais_ntfccion,
                                               a.id_mncpio_ntfccion,
                                               a.id_dprtmnto_ntfccion,
                                               a.drccion_ntfccion,
                                               a.email,
                                               a.tlfno,
                                               a.cllar,
                                               a.cdgo_orgen_rspnsble) loop
                  --registramos los responsables
                  pkg_cb_proceso_persuasivo.prc_rg_proceso_persuasivo_rspsble(p_cdgo_clnte           => p_cdgo_clnte,
                                                                              p_id_prcsos_prssvo     => v_id_prcsos_prssvo,
                                                                              p_cdgo_idntfccion_tpo  => c_rspsnsbles.cdgo_idntfccion_tpo,
                                                                              p_idntfccion           => c_rspsnsbles.idntfccion,
                                                                              p_nmbre_cmplto         => c_rspsnsbles.nmbre_cmplto,
                                                                              p_prncpal_s_n          => c_rspsnsbles.prncpal_s_n,
                                                                              p_cdgo_tpo_rspnsble    => c_rspsnsbles.cdgo_tpo_rspnsble,
                                                                              p_prcntje_prtcpcion    => c_rspsnsbles.prcntje_prtcpcion,
                                                                              p_id_pais_ntfccion     => c_rspsnsbles.id_pais_ntfccion,
                                                                              p_id_dprtmnto_ntfccion => c_rspsnsbles.id_dprtmnto_ntfccion,
                                                                              p_id_mncpio_ntfccion   => c_rspsnsbles.id_mncpio_ntfccion,
                                                                              p_drccion_ntfccion     => c_rspsnsbles.drccion_ntfccion,
                                                                              p_email                => c_rspsnsbles.email,
                                                                              p_tlfno                => c_rspsnsbles.tlfno,
                                                                              p_cllar                => c_rspsnsbles.cllar,
                                                                              o_cdgo_rspsta          => o_cdgo_rspsta,
                                                                              o_mnsje_rspsta         => o_mnsje_rspsta);
                end loop;
                -- FIN Cursor c_rspsnsbles
              exception
                when others then
                  o_cdgo_rspsta  := 31;
                  o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                                    ', al recorrer los responsables.';
                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        null,
                                        v_nmbre_up,
                                        v_nl,
                                        o_mnsje_rspsta || ', ' || sqlerrm,
                                        6);
                  raise v_error;
              end;

              -- Recorrer movimientos
              o_mnsje_rspsta := 'Recorrer movimientos para id_prcsos_smu_sjto' ||
                                c_sjtos.id_prcsos_smu_sjto;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    6);

              --registro de los movimientos
              pkg_cb_proceso_persuasivo.prc_rg_prssvo_mvmntos(p_cdgo_clnte          => p_cdgo_clnte,
                                                              p_id_prcsos_smu_sjto  => c_sjtos.id_prcsos_smu_sjto,
                                                              p_id_prcsos_smu_lte   => c_sjtos.id_prcsos_smu_lte,
                                                              p_id_sjto             => c_sjtos.id_sjto,
                                                              p_id_usrio            => p_id_usrio,
                                                              p_id_prcsos_prssvo    => v_id_prcsos_prssvo,
                                                              p_id_prcso_prssvo_lte => v_nmro_lte_prcso_prssvo,
                                                              o_cdgo_rspsta         => o_cdgo_rspsta,
                                                              o_mnsje_rspsta        => v_mnsje_rspsta);

              if (o_cdgo_rspsta > 0) then
                o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta || ', ' ||
                                  v_mnsje_rspsta || '. ' || sqlerrm;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta,
                                      6);

                raise v_error;
              end if;

            end if;
            -- Buscar el id del tipo de acto a generar y plantilla
            begin
              select a.id_acto_tpo, b.id_plntlla
                into v_id_acto_tpo, v_id_plntlla
                from gn_d_actos_tipo a
                join gn_d_plantillas b
                  on b.id_acto_tpo = a.id_acto_tpo
               where a.cdgo_clnte = p_cdgo_clnte
                 and a.cdgo_acto_tpo in ('OCP', 'NAO')
                 and b.id_plntlla = p_id_plntlla;
            exception
              when others then
                o_cdgo_rspsta  := 34;
                o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                                  ', Se debe escoger una plantilla para el acto antes de iniciar el Proceso Persuasivo.';
                apex_error.add_error(p_message          => o_cdgo_rspsta ||
                                                           ' - ' ||
                                                           o_mnsje_rspsta,
                                     p_display_location => apex_error.c_inline_in_notification);
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ', ' || sqlerrm,
                                      6);
                raise v_error;
            end;

            begin
              --json para la generacion del html
              select json_object('id_prcsos_prssvo' value
                                 v_id_prcsos_prssvo,
                                 'id_acto_tpo' value v_id_acto_tpo)
                into v_json_dcmnto
                from dual;

              o_mnsje_rspsta := 'son para la generacion del html: ' ||
                                v_json_dcmnto;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    6);

              -- Generar la plantilla
              v_dcmnto := pkg_gn_generalidades.fnc_ge_dcmnto(p_xml        => v_json_dcmnto,
                                                             p_id_plntlla => v_id_plntlla);

            exception
              when others then
                o_cdgo_rspsta  := 35;
                o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                                  ', No se pudo generar el docuemnto.';
                apex_error.add_error(p_message          => o_cdgo_rspsta ||
                                                           ' - ' ||
                                                           o_mnsje_rspsta,
                                     p_display_location => apex_error.c_inline_in_notification);
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ', ' || sqlerrm,
                                      6);
                raise v_error;
            end;

            if dbms_lob.getlength(v_dcmnto) = 0 then
              o_cdgo_rspsta  := 88;
              o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                                ', No se generó el html de forma correcta.';
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    6);
              raise v_error;
            end if;

            --registra el documento persuasivo
            pkg_cb_proceso_persuasivo.prc_rg_proceso_persuasivo_dcmnto(p_cdgo_clnte              => p_cdgo_clnte,
                                                                       p_id_prcsos_prssvo        => v_id_prcsos_prssvo,
                                                                       p_id_acto_tpo             => v_id_acto_tpo,
                                                                       p_id_fncnrio              => v_id_fncnrio,
                                                                       p_id_plntlla              => v_id_plntlla,
                                                                       p_dcmnto                  => v_dcmnto,
                                                                       o_id_prcsos_prssvo_dcmnto => v_id_prcsos_prssvo_dcmnto,
                                                                       o_cdgo_rspsta             => o_cdgo_rspsta,
                                                                       o_mnsje_rspsta            => o_mnsje_rspsta);
            if o_cdgo_rspsta <> 0 then
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    6);

              raise v_error;
            end if;

            -- El codigo de origen del sujeto es EXISTENTE EN EL SISTEMA?
            if v_cdgo_orgen_sjto = 'EX' then
              -- Indicar que ya fue procesado el sujeto EXISTENTE
              begin
                update cb_g_procesos_simu_sujeto
                   set indcdor_prcsdo = 'S'
                 where id_prcsos_smu_sjto = c_sjtos.id_prcsos_smu_sjto
                   and id_prcsos_smu_lte = c_sjtos.id_prcsos_smu_lte;
              exception
                when others then
                  o_cdgo_rspsta  := 37;
                  o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                                    ', Al actualizar el estado de proceso persuasivo';
                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        null,
                                        v_nmbre_up,
                                        v_nl,
                                        o_mnsje_rspsta || ', ' || sqlerrm,
                                        6);
                  raise v_error;
              end;
            else
              -- Indicar que ya fue procesado el sujeto INEXISTENTE
              begin
                update cb_g_prcss_sm_sjto_inxstnte
                   set indcdor_prcsdo = 'S'
                 where id_prcsos_smu_sjto_inxstnte =
                       c_sjtos.id_prcsos_smu_sjto
                   and id_prcsos_smu_lte = c_sjtos.id_prcsos_smu_lte;
              exception
                when others then
                  o_cdgo_rspsta  := 38;
                  o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                                    ', Al actualizar el estado de proceso persuasivo';
                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        null,
                                        v_nmbre_up,
                                        v_nl,
                                        o_mnsje_rspsta || ', ' || sqlerrm,
                                        6);
                  raise v_error;
              end;
            end if;
          end if;
          -- end if;

          --generacion del acto
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'Procederá a generar el acto, para id_prcsos_prssvo_dcmnto ' ||
                                v_id_prcsos_prssvo_dcmnto,
                                6);

          if v_id_prcsos_prssvo_dcmnto is not null then
            select json_object(key 'ID_PRCSOS_PRSSVO_DCMNTO' value
                               v_id_prcsos_prssvo_dcmnto,
                               key 'ID_PRCSOS_PRSSVO' value
                               v_id_prcsos_prssvo,
                               key 'ID_ACTO_TPO' value v_id_acto_tpo,
                               key 'CDGO_SJTO_ORGEN' value v_cdgo_orgen_sjto,
                               key 'ID_ACTO' value '',
                               key 'ID_PLNTLLA' value v_id_plntlla,
                               key 'ID_IMPSTO' value c_sjtos.id_impsto,
                               key 'ID_IMPSTO_SBMPSTO' value
                               c_sjtos.id_impsto_sbmpsto,
                               key 'ID_SJTO_IMPSTO' value
                               c_sjtos.id_sjto_impsto)
              into v_json_dcmntos_prrsvo
              from dual;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  v_json_dcmntos_prrsvo,
                                  6);

          else
            o_cdgo_rspsta  := 39;
            o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                              ', al generar el html de los documentos';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ', ' || sqlerrm,
                                  6);
            raise v_error;
          end if;

          if (v_json_dcmntos_prrsvo is null or
             DBMS_LOB.GETLENGTH(v_json_dcmntos_prrsvo) = 0) then
            o_cdgo_rspsta  := 40;
            o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                              ', al generar el json de los documentos';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ', ' || sqlerrm,
                                  6);
            raise v_error;
          else

            begin
              pkg_cb_proceso_persuasivo.prc_gn_documento_persuasivo(p_cdgo_clnte          => p_cdgo_clnte,
                                                                    p_json_dcmntos_prrsvo => v_json_dcmntos_prrsvo,
                                                                    p_id_usrio            => p_id_usrio);
            exception
              when others then
                o_cdgo_rspsta  := 41;
                o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                                  ', falló al ejecutar el proceso pkg_cb_proceso_persuasivo.prc_gn_documento_persuasivo';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ', ' || sqlerrm,
                                      6);
                raise v_error;
            end;
          end if;

          begin
            update cb_g_procesos_persuasivo_json j
               set j.indcdor_prcsdo = 'S'
             where j.id_prcsos_smu_lte = p_id_prcsos_smu_lte
               and j.id_prcsos_smu_sjto = c_sjtos.id_prcsos_smu_sjto
               and j.indcdor_prcsdo = 'N';
          end;
        end if;
      end loop; -- FIN Recorrido de sujetos
    exception
      when others then
        --o_cdgo_rspsta  := 41;
        o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                          ', Falla al recorrer los sujetos. ';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ', ' || sqlerrm,
                              6);
        raise v_error;
    end;
    -- Confirmar transacciones
    commit;

    pkg_cb_proceso_persuasivo.prc_el_prcsos_prssvo_json(p_cdgo_clnte        => p_cdgo_clnte,
                                                        p_id_prcsos_smu_lte => p_id_prcsos_smu_lte,
                                                        o_cdgo_rspsta       => o_cdgo_rspsta,
                                                        o_mnsje_rspsta      => o_mnsje_rspsta);
    --Envío programado
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Proceder¿ a enviar correo envio programado',
                          6);
    begin
      select json_object(key 'p_id_usuario' value p_id_usrio)
        into v_json_envio
        from dual;

      pkg_ma_envios.prc_co_envio_programado(p_cdgo_clnte   => p_cdgo_clnte,
                                            p_idntfcdor    => 'Fin.Oficio.Persuasivo',
                                            p_json_prmtros => v_json_envio);
    exception
      when others then
        o_cdgo_rspsta  := 43;
        o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                          ', Falla al realizar el env¿o programado. ';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ', ' || sqlerrm,
                              6);
    end;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Saliendo de la up ' || v_nmbre_up || ', ' ||
                          systimestamp,
                          6);

  exception
    when v_error then
      rollback;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);
      raise_application_error(-20001, o_mnsje_rspsta);
  end prc_rg_proceso_persuasivo;


  procedure prc_gn_documento_persuasivo(p_cdgo_clnte          in number,
                                        p_json_dcmntos_prrsvo in clob,
                                        p_id_usrio            in number) as

    v_json_actos       clob;
    v_slct_sjto_impsto varchar2(2000);
    v_slct_rspnsble    varchar2(2000);
    v_slct_vgncias     varchar2(2000);
    v_id_acto          number;
    v_json_dcmnto      clob;
    v_gn_d_reportes    gn_d_reportes%rowtype;
    v_blob             blob;
    v_actos_gnrdos     number := 0;
    v_nl               number;
    v_nmbre_up         varchar2(100) := 'pkg_cb_proceso_persuasivo.prc_gn_documento_persuasivo';
    o_cdgo_rspsta      number;
    o_mnsje_rspsta     clob;
    --v_json_envio       clob;
    v_id_usrio_apex number;

    v_id_impsto_sbmpsto number;
    v_id_sjto_impsto    number;

  begin
    --Registramos el nivel del log y el incio del programa
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    insert into muerto
      (n_001, v_001, c_001, t_001)
    values
      (10, 'p_json_dcmntos_prrsvo', p_json_dcmntos_prrsvo, systimestamp);
    commit;

    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'OK';

    if p_json_dcmntos_prrsvo is null or length(p_json_dcmntos_prrsvo) = 0 then
      o_mnsje_rspsta := 'El json de los documentos esta vacio';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta || ', ' || sqlerrm,
                            6);
      raise_application_error(-20001, o_mnsje_rspsta || ', ' || sqlerrm);
    else

      for c_dcmntos_slccndos in (select id_prcsos_prssvo_dcmnto,
                                        id_prcsos_prssvo,
                                        id_acto_tpo,
                                        cdgo_sjto_orgen,
                                        id_acto,
                                        id_plntlla,
                                        id_impsto,
                                        id_impsto_sbmpsto,
                                        id_sjto_impsto
                                   from json_table(p_json_dcmntos_prrsvo,
                                                   '$[*]'
                                                   columns(id_prcsos_prssvo_dcmnto
                                                           number path
                                                           '$.ID_PRCSOS_PRSSVO_DCMNTO',
                                                           id_prcsos_prssvo
                                                           number path
                                                           '$.ID_PRCSOS_PRSSVO',
                                                           id_acto_tpo number path
                                                           '$.ID_ACTO_TPO',
                                                           cdgo_sjto_orgen
                                                           varchar2(3) path
                                                           '$.CDGO_SJTO_ORGEN',
                                                           id_acto number path
                                                           '$.ID_ACTO',
                                                           id_plntlla number path
                                                           '$.ID_PLNTLLA',
                                                           id_impsto number path
                                                           '$.ID_IMPSTO',
                                                           id_impsto_sbmpsto
                                                           number path
                                                           '$.ID_IMPSTO_SBMPSTO',
                                                           id_sjto_impsto
                                                           number path
                                                           '$.ID_SJTO_IMPSTO'))) loop

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              '01 entrando al loop',
                              6);

        if c_dcmntos_slccndos.id_acto is null then

          v_actos_gnrdos := v_actos_gnrdos + 1;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                '02 despues del if',
                                6);

          v_id_impsto_sbmpsto := c_dcmntos_slccndos.id_impsto_sbmpsto;
          v_id_sjto_impsto    := c_dcmntos_slccndos.id_sjto_impsto;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'v_id_impsto_sbmpsto: ' ||
                                v_id_impsto_sbmpsto ||
                                '. v_id_sjto_impsto: ' || v_id_sjto_impsto,
                                6);

          if c_dcmntos_slccndos.id_sjto_impsto is null then
            begin
              select m.id_impsto_sbmpsto, m.id_sjto_impsto
                into v_id_impsto_sbmpsto, v_id_sjto_impsto
                from cb_g_procesos_prssvo_mvmnto m
               where m.id_prcsos_prssvo =
                     c_dcmntos_slccndos.id_prcsos_prssvo
               group by m.id_impsto_sbmpsto, m.id_sjto_impsto;
            exception
              when others then
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      'Error al buscar el id_impsto_sbmpsto e id_sjto_impsto para id_prcsos_prssvo: ' ||
                                      c_dcmntos_slccndos.id_prcsos_prssvo || '. ' ||
                                      sqlerrm,
                                      6);
            end;
          end if;

          v_slct_sjto_impsto := ' select m.id_impsto_sbmpsto,m.id_sjto_impsto ' ||
                                ' from cb_g_procesos_prssvo_mvmnto m ' ||
                                ' where m.estdo = ' || chr(39) || 'A' ||
                                chr(39) || ' and m.id_prcsos_prssvo = ' ||
                                c_dcmntos_slccndos.id_prcsos_prssvo ||
                                ' group by m.id_impsto_sbmpsto,m.id_sjto_impsto';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'v_slct_sjto_impsto: ' ||
                                v_slct_sjto_impsto,
                                6);

          v_slct_rspnsble := ' select idntfccion, prmer_nmbre, sgndo_nmbre, prmer_aplldo, sgndo_aplldo,       ' ||
                             ' cdgo_idntfccion_tpo, drccion_ntfccion, id_pais_ntfccion, id_mncpio_ntfccion,   ' ||
                             ' id_dprtmnto_ntfccion, email, tlfno ' ||
                             ' from cb_g_prcsos_prssvo_rspsble ' ||
                             ' where id_prcsos_prssvo = ' ||
                             c_dcmntos_slccndos.id_prcsos_prssvo;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'v_slct_rspnsble: ' || v_slct_rspnsble,
                                6);

          v_slct_vgncias := ' select b.id_sjto_impsto , b.vgncia,b.id_prdo,ROUND(sum(c.vlor_sldo_cptal),0) as vlor_cptal,ROUND(sum(c.vlor_intres),0) as  vlor_intres' ||
                            ' from cb_g_procesos_prssvo_mvmnto b  ' ||
                            ' join v_gf_g_cartera_x_concepto c on c.cdgo_clnte = b.cdgo_clnte ' ||
                            ' and c.id_impsto = b.id_impsto ' ||
                            ' and c.id_impsto_sbmpsto = b.id_impsto_sbmpsto ' ||
                            ' and c.id_sjto_impsto = b.id_sjto_impsto ' ||
                            ' and c.vgncia = b.vgncia ' ||
                            ' and c.id_prdo = b.id_prdo ' ||
                            ' and c.id_cncpto = b.id_cncpto ' ||
                            ' and c.cdgo_mvmnto_orgn = b.cdgo_mvmnto_orgn ' ||
                            ' and c.id_orgen = b.id_orgen ' ||
                            ' and c.id_mvmnto_fncro = b.id_mvmnto_fncro ' ||
                            ' where b.id_prcsos_prssvo = ' ||
                            c_dcmntos_slccndos.id_prcsos_prssvo ||
                            ' and b.estdo = ' || chr(39) || 'A' || chr(39) ||
                            ' group by  b.id_sjto_impsto , b.vgncia,b.id_prdo';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'v_slct_vgncias: ' || v_slct_vgncias,
                                6);
          -- Preparar JSON de acto a generar
          if c_dcmntos_slccndos.cdgo_sjto_orgen = 'EX' then

            begin
              v_json_actos := pkg_gn_generalidades.fnc_cl_json_acto(p_cdgo_clnte          => p_cdgo_clnte,
                                                                    p_cdgo_acto_orgen     => 'GCP',
                                                                    p_id_orgen            => c_dcmntos_slccndos.id_prcsos_prssvo_dcmnto,
                                                                    p_id_undad_prdctra    => c_dcmntos_slccndos.id_prcsos_prssvo,
                                                                    p_id_acto_tpo         => c_dcmntos_slccndos.id_acto_tpo,
                                                                    p_acto_vlor_ttal      => 0, --v_vlor_ttal_dda,
                                                                    p_cdgo_cnsctvo        => 'GCP',
                                                                    p_fcha_incio_ntfccion => sysdate, -- req. 0024211
                                                                    p_id_usrio            => p_id_usrio,
                                                                    p_slct_sjto_impsto    => v_slct_sjto_impsto,
                                                                    p_slct_vgncias        => v_slct_vgncias,
                                                                    p_slct_rspnsble       => v_slct_rspnsble);
            exception
              when others then
                o_cdgo_rspsta  := 201;
                o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                                  ', error al generar el json de los actos' || v_json_actos || 'ERROR ANDY' ;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ', ' || sqlerrm,
                                      6);
                /*raise_application_error(-20001,
                                        o_mnsje_rspsta || ', ' || sqlerrm);*/
--andy
                                        continue;
            end;
          else
            begin
              v_json_actos := pkg_gn_generalidades.fnc_cl_json_acto(p_cdgo_clnte          => p_cdgo_clnte,
                                                                    p_cdgo_acto_orgen     => 'GCP',
                                                                    p_id_orgen            => c_dcmntos_slccndos.id_prcsos_prssvo_dcmnto,
                                                                    p_id_undad_prdctra    => c_dcmntos_slccndos.id_prcsos_prssvo,
                                                                    p_id_acto_tpo         => c_dcmntos_slccndos.id_acto_tpo,
                                                                    p_acto_vlor_ttal      => 0, --v_vlor_ttal_dda,
                                                                    p_cdgo_cnsctvo        => 'GCP',
                                                                    p_fcha_incio_ntfccion => sysdate, -- req. 0024211
                                                                    p_id_usrio            => p_id_usrio,
                                                                    p_slct_rspnsble       => v_slct_rspnsble);
            exception
              when others then
                o_cdgo_rspsta  := 202;
                o_mnsje_rspsta := 'Error' || o_cdgo_rspsta ||
                                  ', error al generar el json de los actos SIN RESPONSABLE Y SIN VIGENCIA';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ', ' || sqlerrm,
                                      6);
                raise_application_error(-20001,
                                        o_mnsje_rspsta || ', ' || sqlerrm);
            end;
          end if;

          if v_json_actos is not null then
            o_mnsje_rspsta := 'Entro al if con el json de los actos';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta,
                                  6);
            -- Generacion del acto
            begin
              pkg_gn_generalidades.prc_rg_acto(p_cdgo_clnte   => p_cdgo_clnte,
                                               p_json_acto    => v_json_actos,
                                               o_cdgo_rspsta  => o_cdgo_rspsta,
                                               o_mnsje_rspsta => o_mnsje_rspsta,
                                               o_id_acto      => v_id_acto);
            exception
              when others then
                o_cdgo_rspsta  := 203;
                o_mnsje_rspsta := 'Error' || o_cdgo_rspsta ||
                                  ', error al generar el acto';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta || ', ' || sqlerrm,
                                      6);

                raise_application_error(-20001,
                                        o_mnsje_rspsta || ', ' || sqlerrm);
            end;

            if o_cdgo_rspsta <> 0 then

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || ', ' || sqlerrm,
                                    6);
              raise_application_error(-20001,
                                      o_mnsje_rspsta || ', ' || sqlerrm);
            end if;
          else
            o_cdgo_rspsta  := 205;
            o_mnsje_rspsta := 'Error al obtener los datos del acto a generar.';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ', ' || sqlerrm,
                                  6);
            raise_application_error(-20001,
                                    o_mnsje_rspsta || ', ' || sqlerrm);
          end if;

          -- Actualizar el id acto a la tabla de documentos
          begin
            update cb_g_procesos_prssvo_dcmnto
               set id_acto = v_id_acto
             where id_prcsos_prssvo_dcmnto =
                   c_dcmntos_slccndos.id_prcsos_prssvo_dcmnto;
          exception
            when others then
              o_cdgo_rspsta  := 206;
              o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                                ', fall¿ al actualizar el acto';
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || ', ' || sqlerrm,
                                    6);
              raise_application_error(-20001,
                                      o_mnsje_rspsta || ', ' || sqlerrm);
          end;

          -- ************ GENERACION DEL REPORTE ******************
          begin
            o_mnsje_rspsta := 'Entrando a validar la sesion';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta,
                                  6);
            if v('APP_SESSION') is null then
              v_id_usrio_apex := pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte                => p_cdgo_clnte,
                                                                                 p_cdgo_dfncion_clnte_ctgria => 'CLN',
                                                                                 p_cdgo_dfncion_clnte        => 'USR');

              apex_session.create_session(p_app_id   => 66000,
                                          p_page_id  => 2,
                                          p_username => v_id_usrio_apex);
            else
              apex_session.attach(p_app_id     => 66000,
                                  p_page_id    => 37,
                                  p_session_id => v('APP_SESSION'));
            end if;
          exception
            when others then
              o_cdgo_rspsta  := 207;
              o_mnsje_rspsta := 'Error' || o_cdgo_rspsta ||
                                ', error al validar la sesion';
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || ', ' || sqlerrm,
                                    6);
              raise_application_error(-20001,
                                      o_mnsje_rspsta || ', ' || sqlerrm);
          end;

          select json_object('id_prcsos_prssvo_dcmnto' value
                             c_dcmntos_slccndos.id_prcsos_prssvo_dcmnto)
            into v_json_dcmnto
            from dual;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                v_json_dcmnto,
                                6);

          --SETEAMOS EN SESSION LOS ITEMS NECESARIOS PARA GENERAR EL ARCHIVO
          begin
            apex_util.set_session_state('P37_JSON', v_json_dcmnto);
            apex_util.set_session_state('F_CDGO_CLNTE', p_cdgo_clnte);
          exception
            when others then
              o_mnsje_rspsta := 'Error 208 al setear los item del reporte a la sesion';
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    6);
              raise_application_error(-20001,
                                      o_mnsje_rspsta || ', ' || sqlerrm);
          end;
          -- Obtenemos Datos del reporte

          begin
            select a.*
              into v_gn_d_reportes
              from gn_d_reportes a
              join gn_d_plantillas b
                on b.id_rprte = a.id_rprte
             where b.id_plntlla = c_dcmntos_slccndos.id_plntlla
               and b.id_acto_tpo = c_dcmntos_slccndos.id_acto_tpo;
          exception
            when others then
              o_cdgo_rspsta  := 209;
              o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                                ', No se encontraron los datos del reporte';
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || ', ' || sqlerrm,
                                    6);
              raise_application_error(-20001,
                                      o_mnsje_rspsta || ', ' || sqlerrm);
          end;

          o_mnsje_rspsta := 'Procede a generar el blob';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                o_mnsje_rspsta,
                                6);

          if (v_gn_d_reportes.nmbre_cnslta is null or
             v_gn_d_reportes.nmbre_plntlla is null or
             v_gn_d_reportes.cdgo_frmto_plntlla is null or
             v_gn_d_reportes.cdgo_frmto_tpo is null) then

            o_cdgo_rspsta  := 211;
            o_mnsje_rspsta := o_cdgo_rspsta ||
                              ' Los par¿metros del reporte estan incompletos. por favor valide';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ',' || sqlerrm,
                                  6);
            raise_application_error(-20001,
                                    o_mnsje_rspsta || ',' || sqlerrm);
          end if;

          --GENERAMOS EL blob
          begin
            v_blob := apex_util.get_print_document(p_application_id     => 66000,
                                                   p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,
                                                   p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,
                                                   p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,
                                                   p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo);
          exception
            when others then
              o_cdgo_rspsta  := 212;
              o_mnsje_rspsta := o_cdgo_rspsta ||
                                ' No se pudo generar el blob';
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || ',' || sqlerrm,
                                    6);
              raise_application_error(-20001,
                                      o_mnsje_rspsta || ', ' || sqlerrm);

          end;
          --validamos la generacion del blob
          if (v_blob is not null and dbms_lob.getlength(v_blob) > 1000) then

            -- Actualiar el acto con el BLOB
            pkg_gn_generalidades.prc_ac_acto(p_file_blob       => v_blob,
                                             p_id_acto         => v_id_acto,
                                             p_ntfccion_atmtca => 'N');

            if v('APP_SESSION') is null then
              v_id_usrio_apex := pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte                => p_cdgo_clnte,
                                                                                 p_cdgo_dfncion_clnte_ctgria => 'CLN',
                                                                                 p_cdgo_dfncion_clnte        => 'USR');

              apex_session.create_session(p_app_id   => 66000,
                                          p_page_id  => 2,
                                          p_username => v_id_usrio_apex);
            else
              --dbms_output.put_line('EXISTE SESION'||v('APP_SESSION'));
              apex_session.attach(p_app_id     => 66000,
                                  p_page_id    => 2,
                                  p_session_id => v('APP_SESSION'));
            end if;

          else
            o_cdgo_rspsta  := 213;
            o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                              ', No se gener¿ el blob para el acto ' ||
                              v_id_acto;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ', ' || sqlerrm,
                                  6);
            raise_application_error(-20001,
                                    o_mnsje_rspsta || ', ' || sqlerrm);
          end if;
        end if;
      end loop;
    end if;

    if v_actos_gnrdos > 0 then
      commit;
      o_mnsje_rspsta := 'Finalizo el procedimeinto.';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);

    else
      rollback;
      o_cdgo_rspsta  := 214;
      o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                        'Los documentos seleccionados ya han sido procesados.';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_cdgo_rspsta || ' - ' || o_mnsje_rspsta ||
                            sqlerrm,
                            6);
    end if;

  end prc_gn_documento_persuasivo;
/*
procedure prc_gn_documento_persuasivo(p_cdgo_clnte          in number,
                                        p_json_dcmntos_prrsvo in clob,
                                        p_id_usrio            in number) as

    v_json_actos       clob;
    v_slct_sjto_impsto varchar2(2000);
    v_slct_rspnsble    varchar2(2000);
    v_slct_vgncias     varchar2(2000);
    v_id_acto          number;
    v_json_dcmnto      clob;
    v_gn_d_reportes    gn_d_reportes%rowtype;
    v_blob             blob;
    v_actos_gnrdos     number := 0;
    v_nl               number;
    v_nmbre_up         varchar2(100) := 'pkg_cb_proceso_persuasivo.prc_gn_documento_persuasivo';
    o_cdgo_rspsta      number;
    o_mnsje_rspsta     clob;
    v_id_usrio_apex    number;

    v_id_impsto_sbmpsto number;
    v_id_sjto_impsto    number;
    -- [TRAZA] Variable para contar registros sin sjto_impsto encontrado
    v_cnt_sjto_impsto   number := 0;

  begin
    -- Registramos el nivel del log y el inicio del programa
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);

    insert into muerto
      (n_001, v_001, c_001, t_001)
    values
      (10, 'p_json_dcmntos_prrsvo', p_json_dcmntos_prrsvo, systimestamp);
    commit;

    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'OK';

    -- [TRAZA] Longitud del JSON recibido
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Longitud p_json_dcmntos_prrsvo: ' || nvl(length(p_json_dcmntos_prrsvo), 0),
                          6);

    if p_json_dcmntos_prrsvo is null or length(p_json_dcmntos_prrsvo) = 0 then
      o_mnsje_rspsta := 'El json de los documentos esta vacio';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta || ', ' || sqlerrm,
                            6);
      raise_application_error(-20001, o_mnsje_rspsta || ', ' || sqlerrm);
    else

      for c_dcmntos_slccndos in (select id_prcsos_prssvo_dcmnto,
                                        id_prcsos_prssvo,
                                        id_acto_tpo,
                                        cdgo_sjto_orgen,
                                        id_acto,
                                        id_plntlla,
                                        id_impsto,
                                        id_impsto_sbmpsto,
                                        id_sjto_impsto
                                   from json_table(p_json_dcmntos_prrsvo,
                                                   '$[*]'
                                                   columns(id_prcsos_prssvo_dcmnto
                                                           number path
                                                           '$.ID_PRCSOS_PRSSVO_DCMNTO',
                                                           id_prcsos_prssvo
                                                           number path
                                                           '$.ID_PRCSOS_PRSSVO',
                                                           id_acto_tpo number path
                                                           '$.ID_ACTO_TPO',
                                                           cdgo_sjto_orgen
                                                           varchar2(3) path
                                                           '$.CDGO_SJTO_ORGEN',
                                                           id_acto number path
                                                           '$.ID_ACTO',
                                                           id_plntlla number path
                                                           '$.ID_PLNTLLA',
                                                           id_impsto number path
                                                           '$.ID_IMPSTO',
                                                           id_impsto_sbmpsto
                                                           number path
                                                           '$.ID_IMPSTO_SBMPSTO',
                                                           id_sjto_impsto
                                                           number path
                                                           '$.ID_SJTO_IMPSTO'))) loop

        -- [TRAZA] Inicio de iteraci¿n con todos los valores del cursor
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              '01 Inicio iteracion loop |' ||
                              ' id_prcsos_prssvo_dcmnto=' || c_dcmntos_slccndos.id_prcsos_prssvo_dcmnto ||
                              ' | id_prcsos_prssvo=' || c_dcmntos_slccndos.id_prcsos_prssvo ||
                              ' | id_acto_tpo=' || c_dcmntos_slccndos.id_acto_tpo ||
                              ' | cdgo_sjto_orgen=' || c_dcmntos_slccndos.cdgo_sjto_orgen ||
                              ' | id_acto=' || c_dcmntos_slccndos.id_acto ||
                              ' | id_plntlla=' || c_dcmntos_slccndos.id_plntlla ||
                              ' | id_impsto=' || c_dcmntos_slccndos.id_impsto ||
                              ' | id_impsto_sbmpsto=' || c_dcmntos_slccndos.id_impsto_sbmpsto ||
                              ' | id_sjto_impsto=' || c_dcmntos_slccndos.id_sjto_impsto,
                              6);

        if c_dcmntos_slccndos.id_acto is null then

          v_actos_gnrdos := v_actos_gnrdos + 1;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                '02 id_acto es null, procediendo a generar. v_actos_gnrdos=' || v_actos_gnrdos,
                                6);

          -- Inicializamos con los valores del JSON
          v_id_impsto_sbmpsto := c_dcmntos_slccndos.id_impsto_sbmpsto;
          v_id_sjto_impsto    := c_dcmntos_slccndos.id_sjto_impsto;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                '03 Valores iniciales del JSON - v_id_impsto_sbmpsto: ' ||
                                nvl(to_char(v_id_impsto_sbmpsto), 'NULL') ||
                                ' | v_id_sjto_impsto: ' ||
                                nvl(to_char(v_id_sjto_impsto), 'NULL'),
                                6);

          -- ============================================================
          -- CONTROL: Si id_sjto_impsto viene nulo, lo buscamos en la tabla
          -- ============================================================
          if c_dcmntos_slccndos.id_sjto_impsto is null then

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  '04 id_sjto_impsto es NULL en el JSON, consultando cb_g_procesos_prssvo_mvmnto para id_prcsos_prssvo=' ||
                                  c_dcmntos_slccndos.id_prcsos_prssvo,
                                  6);

            -- [FIX] Controlamos NO_DATA_FOUND y TOO_MANY_ROWS de forma independiente
            -- para evitar que el ORA-01403 rompa el flujo del procedimiento
            begin
              select m.id_impsto_sbmpsto, m.id_sjto_impsto
                into v_id_impsto_sbmpsto, v_id_sjto_impsto
                from cb_g_procesos_prssvo_mvmnto m
               where m.id_prcsos_prssvo =
                     c_dcmntos_slccndos.id_prcsos_prssvo
               group by m.id_impsto_sbmpsto, m.id_sjto_impsto;

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    '04a Valores obtenidos de cb_g_procesos_prssvo_mvmnto - v_id_impsto_sbmpsto: ' ||
                                    nvl(to_char(v_id_impsto_sbmpsto), 'NULL') ||
                                    ' | v_id_sjto_impsto: ' ||
                                    nvl(to_char(v_id_sjto_impsto), 'NULL'),
                                    6);

            exception
              when no_data_found then
                -- [FIX] ORA-01403: No hay movimientos activos para este proceso.
                -- Se registra en log y se contin¿a con el siguiente documento.
                v_cnt_sjto_impsto := v_cnt_sjto_impsto + 1;
                o_cdgo_rspsta  := 200;
                o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                                  ': No se encontr¿ id_impsto_sbmpsto / id_sjto_impsto' ||
                                  ' en cb_g_procesos_prssvo_mvmnto para id_prcsos_prssvo=' ||
                                  c_dcmntos_slccndos.id_prcsos_prssvo ||
                                  ' (ORA-01403: no data found). Se omite este documento.';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta,
                                      6);
                -- Restamos el contador porque no se proces¿ realmente
                v_actos_gnrdos := v_actos_gnrdos - 1;
                continue; -- Saltar al siguiente documento del loop

              when too_many_rows then
                -- [FIX] El GROUP BY retorn¿ m¿s de una combinaci¿n: ambig¿edad de datos.
                -- Se registra en log y se contin¿a con el siguiente documento.
                v_cnt_sjto_impsto := v_cnt_sjto_impsto + 1;
                o_cdgo_rspsta  := 200;
                o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                                  ': Se encontraron m¿ltiples combinaciones de id_impsto_sbmpsto / id_sjto_impsto' ||
                                  ' en cb_g_procesos_prssvo_mvmnto para id_prcsos_prssvo=' ||
                                  c_dcmntos_slccndos.id_prcsos_prssvo ||
                                  ' (ORA-01422: too many rows). Se omite este documento.';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta,
                                      6);
                v_actos_gnrdos := v_actos_gnrdos - 1;
                continue;

              when others then
                -- Cualquier otro error inesperado en esta b¿squeda
                o_cdgo_rspsta  := 200;
                o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                                  ': Error inesperado al buscar id_impsto_sbmpsto / id_sjto_impsto' ||
                                  ' para id_prcsos_prssvo=' ||
                                  c_dcmntos_slccndos.id_prcsos_prssvo ||
                                  ' | SQLCODE=' || sqlcode ||
                                  ' | SQLERRM=' || sqlerrm;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta,
                                      6);
                v_actos_gnrdos := v_actos_gnrdos - 1;
                continue;
            end;

          end if; -- fin if id_sjto_impsto is null

          -- [TRAZA] Verificaci¿n final de valores antes de construir los SELECT din¿micos
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                '05 Valores definitivos para SQL din¿mico - v_id_impsto_sbmpsto: ' ||
                                nvl(to_char(v_id_impsto_sbmpsto), 'NULL') ||
                                ' | v_id_sjto_impsto: ' ||
                                nvl(to_char(v_id_sjto_impsto), 'NULL'),
                                6);

          v_slct_sjto_impsto := ' select m.id_impsto_sbmpsto,m.id_sjto_impsto ' ||
                                ' from cb_g_procesos_prssvo_mvmnto m ' ||
                                ' where m.estdo = ' || chr(39) || 'A' ||
                                chr(39) || ' and m.id_prcsos_prssvo = ' ||
                                c_dcmntos_slccndos.id_prcsos_prssvo ||
                                ' group by m.id_impsto_sbmpsto,m.id_sjto_impsto';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                '06 v_slct_sjto_impsto: ' || v_slct_sjto_impsto,
                                6);

          v_slct_rspnsble := ' select idntfccion, prmer_nmbre, sgndo_nmbre, prmer_aplldo, sgndo_aplldo,       ' ||
                             ' cdgo_idntfccion_tpo, drccion_ntfccion, id_pais_ntfccion, id_mncpio_ntfccion,   ' ||
                             ' id_dprtmnto_ntfccion, email, tlfno ' ||
                             ' from cb_g_prcsos_prssvo_rspsble ' ||
                             ' where id_prcsos_prssvo = ' ||
                             c_dcmntos_slccndos.id_prcsos_prssvo;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                '07 v_slct_rspnsble: ' || v_slct_rspnsble,
                                6);

          v_slct_vgncias := ' select b.id_sjto_impsto , b.vgncia,b.id_prdo,sum(c.vlor_sldo_cptal) as vlor_cptal,sum(c.vlor_intres) as  vlor_intres' ||
                            ' from cb_g_procesos_prssvo_mvmnto b  ' ||
                            ' join v_gf_g_cartera_x_concepto c on c.cdgo_clnte = b.cdgo_clnte ' ||
                            ' and c.id_impsto = b.id_impsto ' ||
                            ' and c.id_impsto_sbmpsto = b.id_impsto_sbmpsto ' ||
                            ' and c.id_sjto_impsto = b.id_sjto_impsto ' ||
                            ' and c.vgncia = b.vgncia ' ||
                            ' and c.id_prdo = b.id_prdo ' ||
                            ' and c.id_cncpto = b.id_cncpto ' ||
                            ' and c.cdgo_mvmnto_orgn = b.cdgo_mvmnto_orgn ' ||
                            ' and c.id_orgen = b.id_orgen ' ||
                            ' and c.id_mvmnto_fncro = b.id_mvmnto_fncro ' ||
                            ' where b.id_prcsos_prssvo = ' ||
                            c_dcmntos_slccndos.id_prcsos_prssvo ||
                            ' and b.estdo = ' || chr(39) || 'A' || chr(39) ||
                            ' group by  b.id_sjto_impsto , b.vgncia,b.id_prdo';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                '08 v_slct_vgncias: ' || v_slct_vgncias,
                                6);

          -- ============================================================
          -- Preparar JSON del acto seg¿n cdgo_sjto_orgen
          -- ============================================================
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                '09 cdgo_sjto_orgen=' || c_dcmntos_slccndos.cdgo_sjto_orgen ||
                                ' | Procediendo a llamar fnc_cl_json_acto',
                                6);

          if c_dcmntos_slccndos.cdgo_sjto_orgen = 'EX' then

            begin
              v_json_actos := pkg_gn_generalidades.fnc_cl_json_acto(p_cdgo_clnte          => p_cdgo_clnte,
                                                                    p_cdgo_acto_orgen     => 'GCP',
                                                                    p_id_orgen            => c_dcmntos_slccndos.id_prcsos_prssvo_dcmnto,
                                                                    p_id_undad_prdctra    => c_dcmntos_slccndos.id_prcsos_prssvo,
                                                                    p_id_acto_tpo         => c_dcmntos_slccndos.id_acto_tpo,
                                                                    p_acto_vlor_ttal      => 0,
                                                                    p_cdgo_cnsctvo        => 'GCP',
                                                                    p_fcha_incio_ntfccion => sysdate,
                                                                    p_id_usrio            => p_id_usrio,
                                                                    p_slct_sjto_impsto    => v_slct_sjto_impsto,
                                                                    p_slct_vgncias        => v_slct_vgncias,
                                                                    p_slct_rspnsble       => v_slct_rspnsble);

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    '09a fnc_cl_json_acto (EX) retorn¿. Longitud v_json_actos=' ||
                                    nvl(length(v_json_actos), 0),
                                    6);
            exception
              when others then
                o_cdgo_rspsta  := 201;
                o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                                  ', error al generar el json de los actos (EX)' ||
                                  ' | SQLCODE=' || sqlcode ||
                                  ' | SQLERRM=' || sqlerrm;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta,
                                      6);
                raise_application_error(-20001, o_mnsje_rspsta);
            end;

          else

            begin
              v_json_actos := pkg_gn_generalidades.fnc_cl_json_acto(p_cdgo_clnte          => p_cdgo_clnte,
                                                                    p_cdgo_acto_orgen     => 'GCP',
                                                                    p_id_orgen            => c_dcmntos_slccndos.id_prcsos_prssvo_dcmnto,
                                                                    p_id_undad_prdctra    => c_dcmntos_slccndos.id_prcsos_prssvo,
                                                                    p_id_acto_tpo         => c_dcmntos_slccndos.id_acto_tpo,
                                                                    p_acto_vlor_ttal      => 0,
                                                                    p_cdgo_cnsctvo        => 'GCP',
                                                                    p_fcha_incio_ntfccion => sysdate,
                                                                    p_id_usrio            => p_id_usrio,
                                                                    p_slct_rspnsble       => v_slct_rspnsble);

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    '09b fnc_cl_json_acto (no EX) retorn¿. Longitud v_json_actos=' ||
                                    nvl(length(v_json_actos), 0),
                                    6);
            exception
              when others then
                o_cdgo_rspsta  := 202;
                o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                                  ', error al generar el json de los actos (no EX)' ||
                                  ' | SQLCODE=' || sqlcode ||
                                  ' | SQLERRM=' || sqlerrm;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta,
                                      6);
                raise_application_error(-20001, o_mnsje_rspsta);
            end;

          end if;

          -- ============================================================
          -- Generaci¿n del acto
          -- ============================================================
          if v_json_actos is not null then

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  '10 v_json_actos no es null. Procediendo a prc_rg_acto',
                                  6);

            begin
              pkg_gn_generalidades.prc_rg_acto(p_cdgo_clnte   => p_cdgo_clnte,
                                               p_json_acto    => v_json_actos,
                                               o_cdgo_rspsta  => o_cdgo_rspsta,
                                               o_mnsje_rspsta => o_mnsje_rspsta,
                                               o_id_acto      => v_id_acto);

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    '10a prc_rg_acto ejecutado - o_cdgo_rspsta=' || o_cdgo_rspsta ||
                                    ' | o_mnsje_rspsta=' || o_mnsje_rspsta ||
                                    ' | v_id_acto=' || nvl(to_char(v_id_acto), 'NULL'),
                                    6);
            exception
              when others then
                o_cdgo_rspsta  := 203;
                o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                                  ', error al generar el acto' ||
                                  ' | SQLCODE=' || sqlcode ||
                                  ' | SQLERRM=' || sqlerrm;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      o_mnsje_rspsta,
                                      6);
                raise_application_error(-20001, o_mnsje_rspsta);
            end;

            if o_cdgo_rspsta <> 0 then
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    '10b prc_rg_acto retorn¿ error - o_cdgo_rspsta=' ||
                                    o_cdgo_rspsta || ' | ' || o_mnsje_rspsta,
                                    6);
              raise_application_error(-20001, o_mnsje_rspsta || ', ' || sqlerrm);
            end if;

          else
            o_cdgo_rspsta  := 205;
            o_mnsje_rspsta := 'Error al obtener los datos del acto a generar.';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ', ' || sqlerrm,
                                  6);
            raise_application_error(-20001, o_mnsje_rspsta || ', ' || sqlerrm);
          end if;

          -- ============================================================
          -- Actualizar el id_acto en la tabla de documentos
          -- ============================================================
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                '11 Actualizando cb_g_procesos_prssvo_dcmnto con v_id_acto=' ||
                                nvl(to_char(v_id_acto), 'NULL') ||
                                ' para id_prcsos_prssvo_dcmnto=' ||
                                c_dcmntos_slccndos.id_prcsos_prssvo_dcmnto,
                                6);

          begin
            update cb_g_procesos_prssvo_dcmnto
               set id_acto = v_id_acto
             where id_prcsos_prssvo_dcmnto =
                   c_dcmntos_slccndos.id_prcsos_prssvo_dcmnto;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  '11a UPDATE ejecutado - filas afectadas=' || sql%rowcount,
                                  6);
          exception
            when others then
              o_cdgo_rspsta  := 206;
              o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                                ', fall¿ al actualizar el acto' ||
                                ' | SQLCODE=' || sqlcode ||
                                ' | SQLERRM=' || sqlerrm;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    6);
              raise_application_error(-20001, o_mnsje_rspsta);
          end;

          -- ============================================================
          -- GENERACION DEL REPORTE
          -- ============================================================
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                '12 Iniciando generaci¿n del reporte. Validando sesi¿n APEX',
                                6);

          begin
            if v('APP_SESSION') is null then
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    '12a APP_SESSION es NULL, creando sesi¿n APEX nueva',
                                    6);

              v_id_usrio_apex := pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte                => p_cdgo_clnte,
                                                                                 p_cdgo_dfncion_clnte_ctgria => 'CLN',
                                                                                 p_cdgo_dfncion_clnte        => 'USR');

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    '12b v_id_usrio_apex=' || nvl(to_char(v_id_usrio_apex), 'NULL'),
                                    6);

              apex_session.create_session(p_app_id   => 66000,
                                          p_page_id  => 2,
                                          p_username => v_id_usrio_apex);

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    '12c Sesi¿n APEX creada para app=66000 page=2 user=' || v_id_usrio_apex,
                                    6);
            else
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    '12d APP_SESSION existe=' || v('APP_SESSION') || ', haciendo attach page=37',
                                    6);

              apex_session.attach(p_app_id     => 66000,
                                  p_page_id    => 37,
                                  p_session_id => v('APP_SESSION'));
            end if;
          exception
            when others then
              o_cdgo_rspsta  := 207;
              o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                                ', error al validar la sesion APEX' ||
                                ' | SQLCODE=' || sqlcode ||
                                ' | SQLERRM=' || sqlerrm;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    6);
              raise_application_error(-20001, o_mnsje_rspsta);
          end;

          select json_object('id_prcsos_prssvo_dcmnto' value
                             c_dcmntos_slccndos.id_prcsos_prssvo_dcmnto)
            into v_json_dcmnto
            from dual;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                '13 v_json_dcmnto generado: ' || v_json_dcmnto,
                                6);

          -- Seteamos en session los items necesarios para generar el archivo
          begin
            apex_util.set_session_state('P37_JSON', v_json_dcmnto);
            apex_util.set_session_state('F_CDGO_CLNTE', p_cdgo_clnte);

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  '13a Session state seteado - P37_JSON y F_CDGO_CLNTE=' || p_cdgo_clnte,
                                  6);
          exception
            when others then
              o_mnsje_rspsta := 'Error 208 al setear los items del reporte a la sesion' ||
                                ' | SQLCODE=' || sqlcode ||
                                ' | SQLERRM=' || sqlerrm;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    6);
              raise_application_error(-20001, o_mnsje_rspsta);
          end;

          -- Obtenemos datos del reporte
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                '14 Buscando reporte en gn_d_reportes para id_plntlla=' ||
                                c_dcmntos_slccndos.id_plntlla ||
                                ' | id_acto_tpo=' || c_dcmntos_slccndos.id_acto_tpo,
                                6);

          begin
            select a.*
              into v_gn_d_reportes
              from gn_d_reportes a
              join gn_d_plantillas b
                on b.id_rprte = a.id_rprte
             where b.id_plntlla = c_dcmntos_slccndos.id_plntlla
               and b.id_acto_tpo = c_dcmntos_slccndos.id_acto_tpo;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  '14a Reporte encontrado - nmbre_cnslta=' || v_gn_d_reportes.nmbre_cnslta ||
                                  ' | nmbre_plntlla=' || v_gn_d_reportes.nmbre_plntlla ||
                                  ' | cdgo_frmto_plntlla=' || v_gn_d_reportes.cdgo_frmto_plntlla ||
                                  ' | cdgo_frmto_tpo=' || v_gn_d_reportes.cdgo_frmto_tpo,
                                  6);
          exception
            when others then
              o_cdgo_rspsta  := 209;
              o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                                ', No se encontraron los datos del reporte' ||
                                ' para id_plntlla=' || c_dcmntos_slccndos.id_plntlla ||
                                ' | id_acto_tpo=' || c_dcmntos_slccndos.id_acto_tpo ||
                                ' | SQLCODE=' || sqlcode ||
                                ' | SQLERRM=' || sqlerrm;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    6);
              raise_application_error(-20001, o_mnsje_rspsta);
          end;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                '15 Validando par¿metros del reporte',
                                6);

          if (v_gn_d_reportes.nmbre_cnslta is null or
             v_gn_d_reportes.nmbre_plntlla is null or
             v_gn_d_reportes.cdgo_frmto_plntlla is null or
             v_gn_d_reportes.cdgo_frmto_tpo is null) then

            o_cdgo_rspsta  := 211;
            o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                              ' Los par¿metros del reporte estan incompletos.' ||
                              ' nmbre_cnslta=' || nvl(v_gn_d_reportes.nmbre_cnslta, 'NULL') ||
                              ' | nmbre_plntlla=' || nvl(v_gn_d_reportes.nmbre_plntlla, 'NULL') ||
                              ' | cdgo_frmto_plntlla=' || nvl(v_gn_d_reportes.cdgo_frmto_plntlla, 'NULL') ||
                              ' | cdgo_frmto_tpo=' || nvl(v_gn_d_reportes.cdgo_frmto_tpo, 'NULL');
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta,
                                  6);
            raise_application_error(-20001, o_mnsje_rspsta);
          end if;

          -- Generamos el BLOB
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                '16 Generando BLOB con apex_util.get_print_document' ||
                                ' | nmbre_cnslta=' || v_gn_d_reportes.nmbre_cnslta ||
                                ' | nmbre_plntlla=' || v_gn_d_reportes.nmbre_plntlla,
                                6);

          begin
            v_blob := apex_util.get_print_document(p_application_id     => 66000,
                                                   p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,
                                                   p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,
                                                   p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,
                                                   p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo);

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  '16a BLOB generado - longitud=' ||
                                  nvl(dbms_lob.getlength(v_blob), 0),
                                  6);
          exception
            when others then
              o_cdgo_rspsta  := 212;
              o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                                ' No se pudo generar el blob' ||
                                ' | SQLCODE=' || sqlcode ||
                                ' | SQLERRM=' || sqlerrm;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    6);
              continue;
          end;

          -- Validamos la generaci¿n del BLOB
          if (v_blob is not null and dbms_lob.getlength(v_blob) > 5000) then

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  '17 BLOB v¿lido. Actualizando acto con BLOB. v_id_acto=' || v_id_acto,
                                  6);

            pkg_gn_generalidades.prc_ac_acto(p_file_blob       => v_blob,
                                             p_id_acto         => v_id_acto,
                                             p_ntfccion_atmtca => 'N');

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  '17a prc_ac_acto ejecutado correctamente para v_id_acto=' || v_id_acto,
                                  6);

            if v('APP_SESSION') is null then
              v_id_usrio_apex := pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte                => p_cdgo_clnte,
                                                                                 p_cdgo_dfncion_clnte_ctgria => 'CLN',
                                                                                 p_cdgo_dfncion_clnte        => 'USR');

              apex_session.create_session(p_app_id   => 66000,
                                          p_page_id  => 2,
                                          p_username => v_id_usrio_apex);

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    '17b Sesi¿n APEX re-creada post BLOB. user=' || v_id_usrio_apex,
                                    6);
            else
              apex_session.attach(p_app_id     => 66000,
                                  p_page_id    => 2,
                                  p_session_id => v('APP_SESSION'));

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    '17c Sesi¿n APEX re-attached post BLOB. session=' || v('APP_SESSION'),
                                    6);
            end if;

          else
            o_cdgo_rspsta  := 213;
            o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                              ', No se gener¿ el blob para el acto ' || v_id_acto ||
                              ' | Longitud blob=' || nvl(dbms_lob.getlength(v_blob), 0);
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta,
                                  6);
            continue;
          end if;

        else
          -- [TRAZA] El documento ya tiene id_acto asignado
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'SKIP - id_prcsos_prssvo_dcmnto=' ||
                                c_dcmntos_slccndos.id_prcsos_prssvo_dcmnto ||
                                ' ya tiene id_acto=' || c_dcmntos_slccndos.id_acto ||
                                ', se omite.',
                                6);
        end if; -- fin if id_acto is null

      end loop;
    end if;

    -- ============================================================
    -- Cierre y commit/rollback
    -- ============================================================
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'FIN loop - v_actos_gnrdos=' || v_actos_gnrdos ||
                          ' | v_cnt_sjto_impsto_omitidos=' || v_cnt_sjto_impsto,
                          6);

    if v_actos_gnrdos > 0 then
      commit;
      o_mnsje_rspsta := 'Finalizo el procedimiento. v_actos_gnrdos=' || v_actos_gnrdos;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);
    else
      rollback;
      o_cdgo_rspsta  := 214;
      o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                        ' Los documentos seleccionados ya han sido procesados.' ||
                        ' v_cnt_sjto_impsto_omitidos=' || v_cnt_sjto_impsto;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_cdgo_rspsta || ' - ' || o_mnsje_rspsta,
                            6);
    end if;

  end prc_gn_documento_persuasivo;*/
  function fnc_cl_parametro_configuracion(p_cdgo_clnte     in number,
                                          p_cdgo_cnfgrcion in varchar2)
    return clob is
    v_vlor clob;
  begin

    begin
      select vlor
        into v_vlor
        from cb_d_process_prssvo_cnfgrcn
       where cdgo_clnte = p_cdgo_clnte
         and cdgo_cnfgrcion = p_cdgo_cnfgrcion;
    exception
      when others then
        v_vlor := null;
    end;

    return v_vlor;

  end fnc_cl_parametro_configuracion;

  procedure prc_gn_archvo_excel(p_cdgo_clnte   in number,
                                p_nmro_lte     in number,
                                p_fcha_lte     in date,
                                o_file_blob    out blob,
                                o_cdgo_rspsta  out number,
                                o_mnsje_rspsta out varchar2) as

    v_nl         number;
    v_nmbre_up   varchar2(100) := 'pkg_cb_proceso_persuasivo.prc_gn_archvo_excel';
    v_num_fla    number := 5; -- numero de filas del excel
    v_bfile      bfile; -- apuntador del documento en disco
    v_directorio clob := 'TS_GUIAS'; -- directorio donde caera el archivo
    v_file_name  varchar2(3000); -- nombre del archivo
    --v_file_blob   blob;
    v_borderId    number;
    v_nmbre_clnte varchar2(1000);
    v_slgan       varchar2(1000);
    v_nit         varchar2(1000);
    v_error       exception;

  begin

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Entrando a la up ' || v_nmbre_up || ', ' ||
                          systimestamp,
                          6);

    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'OK';

    -- datos del cliente
    begin
      select upper(nmbre_clnte), nmro_idntfccion, upper(slgan)
        into v_nmbre_clnte, v_nit, v_slgan
        from df_s_clientes
       where cdgo_clnte = p_cdgo_clnte;
    exception
      when no_data_found then
        o_cdgo_rspsta  := 10;
        o_mnsje_rspsta := 'No se encontraron datos del cliente.';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_cdgo_rspsta || ' - ' || o_mnsje_rspsta ||
                              sqlerrm,
                              6);
        raise v_error;
      when too_many_rows then
        o_cdgo_rspsta  := 11;
        o_mnsje_rspsta := 'Se encontraron registros duplicados del cliente.';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_cdgo_rspsta || ' - ' || o_mnsje_rspsta ||
                              sqlerrm,
                              6);
        raise v_error;
      when others then
        o_cdgo_rspsta  := 12;
        o_mnsje_rspsta := 'Error al consultar datos del cliente.';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_cdgo_rspsta || ' - ' || o_mnsje_rspsta ||
                              sqlerrm,
                              6);
        raise v_error;
    end;

    --v_file_blob := empty_blob(); -- inicializacion del blob
    v_file_name := 'Estadisticas_Persuasivo_' || p_nmro_lte || '.xlsx'; -- nombre del archivo

    -- crear una hoja
    as_xlsx.new_sheet('hoja1');

    --borde para las celdas
    v_borderId := as_xlsx.get_border('thin', 'thin', 'thin', 'thin');

    -- combinamos celdas
    as_xlsx.mergecells(1, 1, 14, 1); -- cliente
    as_xlsx.mergecells(1, 2, 14, 2); -- nit
    as_xlsx.mergecells(1, 3, 14, 3); -- nombre del reporte

    -- estilos de encabezado
    as_xlsx.cell(1,
                 1,
                 v_nmbre_clnte,
                 p_alignment   => as_xlsx.get_alignment(p_horizontal => 'center'),
                 p_fontid      => as_xlsx.get_font('Calibri',
                                                   p_bold     => true,
                                                   p_fontsize => 12));

    as_xlsx.cell(1,
                 2,
                 'Nit. ' || v_nit,
                 p_alignment => as_xlsx.get_alignment(p_horizontal => 'center'),
                 p_fontid => as_xlsx.get_font('Calibri',
                                              p_bold     => true,
                                              p_fontsize => 12));
    as_xlsx.cell(1,
                 3,
                 'ESTADISTICOS COBRO PERSUASIVO LOTE ' || P_NMRO_LTE,
                 p_alignment => as_xlsx.get_alignment(p_horizontal => 'center'),
                 p_fontid => as_xlsx.get_font('Calibri',
                                              p_bold     => true,
                                              p_fontsize => 12));

    -- alinear fila 6 del excel y crear filtro
    as_xlsx.set_row(p_row       => 4,
                    p_alignment => as_xlsx.get_alignment(p_horizontal => 'center',
                                                         p_vertical   => 'center'),
                    p_fontid    => as_xlsx.get_font('Calibri',
                                                    p_bold     => true,
                                                    p_fontsize => 11),
                    p_borderId  => v_borderId);

    as_xlsx.cell(1,
                 v_num_fla,
                 'IDENTIFICACION SUJETO',
                 p_alignment            => as_xlsx.get_alignment(p_horizontal => 'center'),
                 p_fontid               => as_xlsx.get_font('Calibri',
                                                            p_bold     => true,
                                                            p_fontsize => 12),
                 p_borderId             => v_borderId);
    as_xlsx.set_column_width(1, 20);
    as_xlsx.cell(2,
                 v_num_fla,
                 'MATRICULA',
                 p_alignment => as_xlsx.get_alignment(p_horizontal => 'center'),
                 p_fontid    => as_xlsx.get_font('Calibri',
                                                 p_bold     => true,
                                                 p_fontsize => 12),
                 p_borderId  => v_borderId);
    as_xlsx.set_column_width(2, 40);
    as_xlsx.cell(3,
                 v_num_fla,
                 'DEPARTAMENTO',
                 p_alignment   => as_xlsx.get_alignment(p_horizontal => 'center'),
                 p_fontid      => as_xlsx.get_font('Calibri',
                                                   p_bold     => true,
                                                   p_fontsize => 12),
                 p_borderId    => v_borderId);
    as_xlsx.set_column_width(3, 20);
    as_xlsx.cell(4,
                 v_num_fla,
                 'MUNICIPIO',
                 p_alignment => as_xlsx.get_alignment(p_horizontal => 'center'),
                 p_fontid    => as_xlsx.get_font('Calibri',
                                                 p_bold     => true,
                                                 p_fontsize => 12),
                 p_borderId  => v_borderId);
    as_xlsx.set_column_width(4, 20);
    as_xlsx.cell(5,
                 v_num_fla,
                 'DIRECCION',
                 p_alignment => as_xlsx.get_alignment(p_horizontal => 'center'),
                 p_fontid    => as_xlsx.get_font('Calibri',
                                                 p_bold     => true,
                                                 p_fontsize => 12),
                 p_borderId  => v_borderId);
    as_xlsx.set_column_width(5, 20);
    as_xlsx.cell(6,
                 v_num_fla,
                 'TIPO IDENTIFICACION RESPONSABLE',
                 p_alignment                      => as_xlsx.get_alignment(p_horizontal => 'center'),
                 p_fontid                         => as_xlsx.get_font('Calibri',
                                                                      p_bold     => true,
                                                                      p_fontsize => 12),
                 p_borderId                       => v_borderId);
    as_xlsx.set_column_width(6, 20);
    as_xlsx.cell(7,
                 v_num_fla,
                 'IDENTIFICACION RESPONSABLE',
                 p_alignment                 => as_xlsx.get_alignment(p_horizontal => 'center'),
                 p_fontid                    => as_xlsx.get_font('Calibri',
                                                                 p_bold     => true,
                                                                 p_fontsize => 12),
                 p_borderId                  => v_borderId);
    as_xlsx.set_column_width(7, 10);

    as_xlsx.cell(8,
                 v_num_fla,
                 'RESPONSABLE',
                 p_alignment  => as_xlsx.get_alignment(p_horizontal => 'center'),
                 p_fontid     => as_xlsx.get_font('Calibri',
                                                  p_bold     => true,
                                                  p_fontsize => 12),
                 p_borderId   => v_borderId);
    as_xlsx.set_column_width(8, 10);

    as_xlsx.cell(9,
                 v_num_fla,
                 'VIGENCIA',
                 p_alignment => as_xlsx.get_alignment(p_horizontal => 'center'),
                 p_fontid    => as_xlsx.get_font('Calibri',
                                                 p_bold     => true,
                                                 p_fontsize => 12),
                 p_borderId  => v_borderId);
    as_xlsx.set_column_width(9, 10);

    as_xlsx.cell(10,
                 v_num_fla,
                 'PERIODO',
                 p_alignment => as_xlsx.get_alignment(p_horizontal => 'center'),
                 p_fontid    => as_xlsx.get_font('Calibri',
                                                 p_bold     => true,
                                                 p_fontsize => 12),
                 p_borderId  => v_borderId);
    as_xlsx.set_column_width(10, 10);

    as_xlsx.cell(11,
                 v_num_fla,
                 'SALDO CAPITAL',
                 p_alignment    => as_xlsx.get_alignment(p_horizontal => 'center'),
                 p_fontid       => as_xlsx.get_font('Calibri',
                                                    p_bold     => true,
                                                    p_fontsize => 12),
                 p_borderId     => v_borderId);
    as_xlsx.set_column_width(11, 10);

    as_xlsx.cell(12,
                 v_num_fla,
                 'SALDO INTERES',
                 p_alignment    => as_xlsx.get_alignment(p_horizontal => 'center'),
                 p_fontid       => as_xlsx.get_font('Calibri',
                                                    p_bold     => true,
                                                    p_fontsize => 12),
                 p_borderId     => v_borderId);
    as_xlsx.set_column_width(12, 10);

    as_xlsx.cell(13,
                 v_num_fla,
                 'SALDO TOTAL',
                 p_alignment  => as_xlsx.get_alignment(p_horizontal => 'center'),
                 p_fontid     => as_xlsx.get_font('Calibri',
                                                  p_bold     => true,
                                                  p_fontsize => 12),
                 p_borderId   => v_borderId);
    as_xlsx.set_column_width(13, 10);

    as_xlsx.cell(14,
                 v_num_fla,
                 'VALOR RECAUDADO',
                 p_alignment      => as_xlsx.get_alignment(p_horizontal => 'center'),
                 p_fontid         => as_xlsx.get_font('Calibri',
                                                      p_bold     => true,
                                                      p_fontsize => 12),
                 p_borderId       => v_borderId);
    as_xlsx.set_column_width(14, 10);

    for datos in (select b.idntfccion_sjto,
                         b.mtrcla_inmblria,
                         b.nmbre_dprtmnto,
                         b.nmbre_mncpio,
                         b.drccion,
                         t.dscrpcion_idntfccion_tpo,
                         d.idntfccion,
                         d.prmer_nmbre || ' ' || d.sgndo_nmbre || ' ' ||
                         d.prmer_aplldo || ' ' || d.sgndo_aplldo as responsable,
                         c.id_sjto_impsto,
                         c.vgncia,
                         c.prdo,
                         sum(nvl(c.vlor_sldo_cptal, 0)) as vlor_sldo_cptal,
                         sum(nvl(c.vlor_intres, 0)) as vlor_intres,
                         sum(nvl(c.vlor_sldo_cptal, 0) +
                             nvl(c.vlor_intres, 0)) as vlor_ttal,
                         sum(nvl(g.vlor_hber, 0)) as recaudo
                    from v_gf_g_cartera_x_concepto c
                    join v_si_i_sujetos_impuesto b
                      on b.id_sjto_impsto = c.id_sjto_impsto
                     and b.id_sjto_estdo = 1
                    join si_i_sujetos_responsable d
                      on d.id_sjto_impsto = b.id_sjto_impsto
                     and d.prncpal_s_n = 'S'
                    join df_s_identificaciones_tipo t
                      on t.cdgo_idntfccion_tpo = d.cdgo_idntfccion_tpo
                    join cb_g_procesos_prssvo_mvmnto e
                      on e.id_sjto_impsto = c.id_sjto_impsto
                     and e.id_mvmnto_fncro = c.id_mvmnto_fncro
                     and e.vgncia = c.vgncia
                     and e.id_prdo = c.id_prdo
                    join cb_g_procesos_persuasivo f
                      on f.id_prcsos_prssvo = e.id_prcsos_prssvo
                    left join gf_g_movimientos_detalle g
                      on g.id_mvmnto_fncro = c.id_mvmnto_fncro
                     and g.fcha_mvmnto >= f.fcha_prcso
                     and g.cdgo_mvmnto_orgn = 'RE'
                     and g.cdgo_mvmnto_tpo in ('PC', 'PI')
                   where f.id_prcso_prssvo_lte =
                         nvl(P_NMRO_LTE, f.id_prcso_prssvo_lte)
                     AND (trunc(f.fcha_prcso) = P_FCHA_LTE OR
                         P_FCHA_LTE IS NULL)
                     AND c.cdgo_mvnt_fncro_estdo != 'AN'
                   group by b.idntfccion_sjto,
                            b.mtrcla_inmblria,
                            b.nmbre_dprtmnto,
                            b.nmbre_mncpio,
                            b.drccion,
                            t.dscrpcion_idntfccion_tpo,
                            d.idntfccion,
                            d.prmer_nmbre || ' ' || d.sgndo_nmbre || ' ' ||
                            d.prmer_aplldo || ' ' || d.sgndo_aplldo,
                            c.id_sjto_impsto,
                            c.vgncia,
                            c.prdo
                   order by b.idntfccion_sjto,
                            b.mtrcla_inmblria,
                            b.nmbre_dprtmnto,
                            b.nmbre_mncpio,
                            b.drccion,
                            t.dscrpcion_idntfccion_tpo,
                            d.idntfccion,
                            d.prmer_nmbre || ' ' || d.sgndo_nmbre || ' ' ||
                            d.prmer_aplldo || ' ' || d.sgndo_aplldo,
                            c.id_sjto_impsto,
                            c.vgncia,
                            c.prdo) loop

      v_num_fla := v_num_fla + 1;
      as_xlsx.cell(1,
                   v_num_fla,
                   datos.idntfccion_sjto,
                   p_alignment           => as_xlsx.get_alignment(p_horizontal => 'center'),
                   p_borderId            => v_borderId);

      as_xlsx.cell(2,
                   v_num_fla,
                   datos.mtrcla_inmblria,
                   p_alignment           => as_xlsx.get_alignment(p_horizontal => 'left'),
                   p_borderId            => v_borderId);

      as_xlsx.cell(3,
                   v_num_fla,
                   datos.nmbre_dprtmnto,
                   p_alignment          => as_xlsx.get_alignment(p_horizontal => 'center'),
                   p_borderId           => v_borderId);

      as_xlsx.cell(4,
                   v_num_fla,
                   datos.nmbre_mncpio,
                   p_alignment        => as_xlsx.get_alignment(p_horizontal => 'right'),
                   p_borderId         => v_borderId);

      as_xlsx.cell(5,
                   v_num_fla,
                   datos.drccion,
                   p_alignment   => as_xlsx.get_alignment(p_horizontal => 'center'),
                   p_borderId    => v_borderId);

      as_xlsx.cell(6,
                   v_num_fla,
                   datos.dscrpcion_idntfccion_tpo,
                   p_alignment                    => as_xlsx.get_alignment(p_horizontal => 'right'),
                   p_borderId                     => v_borderId);

      as_xlsx.cell(7,
                   v_num_fla,
                   datos.idntfccion,
                   p_alignment      => as_xlsx.get_alignment(p_horizontal => 'center'),
                   p_borderId       => v_borderId);

      as_xlsx.cell(8,
                   v_num_fla,
                   datos.responsable,
                   p_alignment       => as_xlsx.get_alignment(p_horizontal => 'center'),
                   p_borderId        => v_borderId);

      as_xlsx.cell(9,
                   v_num_fla,
                   datos.vgncia,
                   p_alignment  => as_xlsx.get_alignment(p_horizontal => 'center'),
                   p_borderId   => v_borderId);

      as_xlsx.cell(10,
                   v_num_fla,
                   datos.prdo,
                   p_alignment => as_xlsx.get_alignment(p_horizontal => 'center'),
                   p_borderId  => v_borderId);

      as_xlsx.cell(11,
                   v_num_fla,
                   datos.vlor_sldo_cptal,
                   p_alignment           => as_xlsx.get_alignment(p_horizontal => 'center'),
                   p_borderId            => v_borderId);

      as_xlsx.cell(12,
                   v_num_fla,
                   datos.vlor_intres,
                   p_alignment       => as_xlsx.get_alignment(p_horizontal => 'center'),
                   p_borderId        => v_borderId);

      as_xlsx.cell(13,
                   v_num_fla,
                   datos.vlor_ttal,
                   p_alignment     => as_xlsx.get_alignment(p_horizontal => 'center'),
                   p_borderId      => v_borderId);

      as_xlsx.cell(14,
                   v_num_fla,
                   datos.recaudo,
                   p_alignment   => as_xlsx.get_alignment(p_horizontal => 'center'),
                   p_borderId    => v_borderId);

    end loop;

    as_xlsx.save(v_directorio, v_file_name);

    -- cargar el archivo blob
    dbms_lob.createtemporary(lob_loc => o_file_blob,
                             cache   => true,
                             dur     => dbms_lob.call);

    dbms_lob.open(o_file_blob, dbms_lob.lob_readwrite);

    v_bfile := bfilename(v_directorio, v_file_name);
    dbms_lob.fileopen(v_bfile, dbms_lob.file_readonly);
    dbms_lob.loadfromfile(o_file_blob,
                          v_bfile,
                          dbms_lob.getlength(v_bfile));
    dbms_lob.fileclose(v_bfile);

    dbms_lob.close(o_file_blob);

    -- mensaje de salida
    o_mnsje_rspsta := 'El archivo fue generado exitosamente';

  exception
    when v_error then

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'Error: ' || o_mnsje_rspsta || sqlerrm,
                            6);
      raise;
  end prc_gn_archvo_excel;

procedure prc_gn_envio_email(
    p_cdgo_clnte   in number,
    p_json_actos   in clob,
    o_cdgo_rspsta  out number,
    o_mnsje_rspsta out varchar2
) as
    v_nl               number;
    v_nmbre_up         varchar2(100) := 'pkg_cb_proceso_persuasivo.prc_gn_envio_email';
    v_json_parametros  clob;
    v_actos_procesados number := 0;
    v_actos_fallidos   number := 0;
    v_paso             varchar2(100); -- Variable para identificar d¿nde falla
begin
    v_paso          := 'Inicio del procedimiento';
    o_cdgo_rspsta   := 0;
    o_mnsje_rspsta  := 'Envio realizado.';

    -- 1. Obtener nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl,
        '--- INICIO PROCESO --- Paso: ' || v_paso, 6);

    -- 2. Validar formato del JSON
    v_paso := 'Validando formato JSON de entrada';
    if not json_exists(p_json_actos, '$[*].ID_ACTO') then
        o_cdgo_rspsta  := 10;
        o_mnsje_rspsta := 'Error en ' || v_paso || ': El JSON no tiene el formato esperado (falta ID_ACTO).';
        return;
    end if;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl,
        'JSON validado correctamente. Contenido: ' || dbms_lob.substr(p_json_actos, 2000, 1), 6);

    -- 3. Recorrer los actos
    v_paso := 'Iniciando cursor de actos';
    for actos in (
        select id_acto, email, id_prcsos_prssvo_rspnsble
        from json_table(p_json_actos, '$[*]'
            columns (
                id_acto number                              path '$.ID_ACTO',
                email   varchar2(255)                       path '$.EMAIL',
                id_prcsos_prssvo_rspnsble   varchar2(255)   path '$.ID_PRCSOS_PRSSVO_RSPNSBLE'

            )
        )
    ) loop

        begin
            v_paso := 'Procesando Acto ID: ' || actos.id_acto;

            if actos.email is not null then
                -- A. Generar JSON de par¿metros
                v_paso := 'Generando JSON para Acto: ' || actos.id_acto;
                v_json_parametros := json_object(
                                        key 'P_ID_ACTO'                       value actos.id_acto,
                                        key 'EMAIL'                           value actos.email,
                                        key 'P_ID_PRCSOS_PRSSVO_RSPNSBLE'     value actos.id_prcsos_prssvo_rspnsble
                                     );

                -- B. Llamada al paquete de env¿os
                v_paso := 'Llamando prc_co_envio_programado para Acto: ' || actos.id_acto;
                pkg_ma_envios.prc_co_envio_programado(
                    p_cdgo_clnte     => p_cdgo_clnte,
                    p_idntfcdor      => 'PRSSVO',
                    p_json_prmtros   => v_json_parametros,
                    p_id_sjto_impsto => null,
                    p_id_acto        => actos.id_acto
                );

                v_actos_procesados := v_actos_procesados + 1;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl,
                    'Exito: Acto ' || actos.id_acto || ' programado.', 6);

            else
                -- Caso: Email nulo
                v_actos_fallidos := v_actos_fallidos + 1;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl,
                    'Advertencia: No hay email para el acto: ' || actos.id_acto, 6);
            end if;

        exception
            when others then
                v_actos_fallidos := v_actos_fallidos + 1;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl,
                    'ERROR en bucle. Paso: [' || v_paso || ']. Error: ' || sqlerrm, 6);
                -- No detenemos el proceso, continuamos con el siguiente acto
        end;

    end loop;

    -- 4. Finalizaci¿n
    v_paso := 'Finalizando y haciendo commit';
    commit;

    o_mnsje_rspsta := 'Proceso terminado. Exitosos: ' || v_actos_procesados ||
                      ', Fallidos: ' || v_actos_fallidos;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl,
        '--- FIN PROCESO --- ' || o_mnsje_rspsta, 6);

exception
    when others then
        rollback;
        o_cdgo_rspsta  := 99;
        o_mnsje_rspsta := 'Error cr¿tico en ' || v_paso || ': ' || sqlerrm;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl,
            'FATAL: ' || o_mnsje_rspsta || ' - ' || dbms_utility.format_error_backtrace, 6);
end prc_gn_envio_email;

  procedure prc_gn_documento_persuasivo_job(p_cdgo_clnte          in number,
                                            p_json_dcmntos_prrsvo in clob,
                                            p_id_usrio            in number,
                                            o_cdgo_rspsta         out number,
                                            o_mnsje_rspsta        out varchar2) as

    v_nl        number;
    v_nmbre_up  varchar2(100) := 'pkg_cb_proceso_persuasivo.prc_gn_documento_persuasivo_job';
    v_nmbre_job varchar2(100);
    v_error     exception;
    v_estado    varchar2(50);

  begin
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Entrando a la up ' || v_nmbre_up || ', ' ||
                          systimestamp,
                          6);

    -- Se crea el Job
    begin
      v_nmbre_job := 'GENESYS.IT_CB_GN_DCMNTOS_PRSSVO';
      -- Se le asignan al job los par¿metros para ejecutarse
      DBMS_SCHEDULER.set_attribute(name      => v_nmbre_job,
                                   attribute => 'job_action',
                                   value     => 'pkg_cb_proceso_persuasivo.prc_gn_documento_persuasivo');

      DBMS_SCHEDULER.set_attribute(name      => v_nmbre_job,
                                   attribute => 'number_of_arguments',
                                   value     => 3);

      DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE(job_name          => v_nmbre_job,
                                            argument_position => 1,
                                            argument_value    => p_cdgo_clnte);

      DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE(job_name          => v_nmbre_job,
                                            argument_position => 2,
                                            argument_value    => p_json_dcmntos_prrsvo);

      DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE(job_name          => v_nmbre_job,
                                            argument_position => 3,
                                            argument_value    => p_id_usrio);

      -- Se habilita el job
      dbms_scheduler.enable(name => v_nmbre_job);

      -- Verificar estado del job
      begin


        select state
          into v_estado
          from user_scheduler_jobs
         where job_name = v_nmbre_job;
      exception
        when others then
          o_cdgo_rspsta  := 100;
          o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                            ', Problemas al ejecutar el job ' ||
                            v_nmbre_job;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ', ' || sqlerrm,
                                6);
          raise v_error;
      end;
       if (v_estado = 'SCHEDULED' or v_estado = 'RUNNING') then
   --   if v_estado = 'RUNNING' then
        o_cdgo_rspsta  := 0;
        o_mnsje_rspsta := 'El proceso de generaci¿n de los actos ha iniciado, se le informar¿ al finalizar';
      else
        o_cdgo_rspsta  := 10;
        o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                          ', Problemas al ejecutar el job ' || v_nmbre_job;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ', ' || sqlerrm,
                              6);
        raise v_error;
      end if;

    exception
      when others then
        o_cdgo_rspsta  := 50;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          ' Error al crear o ejecutar el job: ';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ', ' || sqlerrm,
                              6);
        raise v_error;
    end; -- Fin creaci¿n y ejecuci¿n del Job

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Saliendo de la up ' || ', ' || v_nmbre_up || ', ' ||
                          systimestamp,
                          6);

  exception
    when v_error then
      rollback;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);
      return;
  end prc_gn_documento_persuasivo_job;

  procedure prc_rg_slccion_cndtos(p_cdgo_clnte   in number,
                                  p_json_prmtros in clob,
                                  p_id_fncnrio   in number,
                                  p_id_usrio     in number,
                                  p_nmro_rgstros in number) as

    v_nl       number;
    v_nmbre_up varchar2(100) := 'pkg_cb_proceso_persuasivo.prc_rg_slccion_cndtos';
    -- v_nmbre_job varchar2(100);
    v_error exception;

    o_email        varchar2(500);
    o_cdgo_rspsta  number;
    o_mnsje_rspsta varchar2(4000);

    v_id_impsto         number;
    v_id_impsto_sbmpsto number;
    v_vgncia_dsde       number;
    v_vgncia_hsta       number;
    v_dda_dsde          number;
    v_dda_hsta          number;
    v_id_prdo_fn        number;
    v_id_prdo_in        number;
    v_id_lte            number;
    v_id_usrio          number;
    v_cdgo_clnte        number := p_cdgo_clnte;
    v_id_prcso_smu_sjto number;
    v_json_parametros   CLOB;
    v_vldo_slccion      varchar2(1);
    v_slccion           number := 0;
    v_cdgo_clse         df_s_predios_clasificacion.cdgo_prdio_clsfccion%type;
    v_id_prdio_dstno    df_i_predios_destino.id_prdio_dstno%type;
    v_cdgo_estrto       si_i_predios.cdgo_estrto%type;
    v_cdgo_sjto_tpo     df_i_sujetos_tipo.cdgo_sjto_tpo%type;
    v_id_sjto_tpo       df_i_sujetos_tipo.id_sjto_tpo%type;
    v_tpo_prsna         si_i_personas.tpo_prsna%type;

  begin

        o_cdgo_rspsta  := 0;
        o_mnsje_rspsta := 'Seleccion realizada con ¿xito';

        v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'Entrando a la up ' || v_nmbre_up || ', ' || systimestamp, 6);

        -- validaci¿n del json de entrada
        if p_json_prmtros is null or length(p_json_prmtros) = 0 then
            o_cdgo_rspsta  := 10;
            o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                            ', No se recibieron par¿metros de busqueda';

            pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, o_mnsje_rspsta, 6);
            raise v_error;
        else
            pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, p_json_prmtros, 6);
        end if;

    -- obtener par¿metros desde el json
    begin
      select id_impsto,
             id_impsto_sbmpsto,
             vgncia_dsde,
             vgncia_hsta,
             dda_dsde,
             dda_hsta,
             id_prdo_in,
             id_prdo_fn,
             cdgo_clse,
             id_prdio_dstno,
             cdgo_estrto,
             tpo_prsna,
             cdgo_sjto_tpo
        into v_id_impsto,
             v_id_impsto_sbmpsto,
             v_vgncia_dsde,
             v_vgncia_hsta,
             v_dda_dsde,
             v_dda_hsta,
             v_id_prdo_in,
             v_id_prdo_fn,
             v_cdgo_clse,
             v_id_prdio_dstno,
             v_cdgo_estrto,
             v_tpo_prsna,
             v_cdgo_sjto_tpo
        from json_table(p_json_prmtros,
                        '$[*]'
                        columns(id_impsto number path '$.id_impsto',
                                id_impsto_sbmpsto number path
                                '$.id_impsto_sbmpsto',
                                vgncia_dsde number path '$.vgncia_dsde',
                                vgncia_hsta number path '$.vgncia_hsta',
                                dda_dsde number path '$.dda_dsde',
                                dda_hsta number path '$.dda_hsta',
                                id_prdo_in number path '$.id_prdo_in',
                                id_prdo_fn number path '$.id_prdo_fn',
                                cdgo_clse varchar2 path '$.cdgo_clse',
                                id_prdio_dstno number path '$.id_prdio_dstno',
                                cdgo_estrto varchar2 path '$.cdgo_estrto',
                                tpo_prsna varchar2 path '$.tpo_prsna',
                                cdgo_sjto_tpo varchar2 path '$.cdgo_sjto_tpo'));
    exception
      when others then
        o_cdgo_rspsta  := 11;
        o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                          ', Error al obtener los par¿metros del JSON';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ', ' || sqlerrm,
                              6);
        raise v_error;
    end;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Parametros: ' || v_id_impsto || ',' ||
                          v_id_impsto_sbmpsto || ',' || v_vgncia_dsde || ',' ||
                          v_vgncia_hsta || ',' || v_dda_dsde || ',' ||
                          v_dda_hsta,
                          6);
    --creamos el lote
    begin
      insert into cb_g_procesos_simu_lote
        (cdgo_clnte, fcha_lte, id_fncnrio, obsrvcion, id_prcso_tpo)
      values
        (p_cdgo_clnte,
         sysdate,
         p_id_fncnrio,
         'Registro de lote persuasivo',
         1)
      returning id_prcsos_smu_lte into v_id_lte;
    exception
      when others then
        o_cdgo_rspsta  := 12;
        o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                          ', Error al insertar el lote persuasivo';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ', ' || sqlerrm,
                              6);
        raise v_error;
    end;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Inserto lote ' || ', ' || v_id_lte,
                          6);

    if v_cdgo_sjto_tpo is not null then
      begin
        select id_sjto_tpo
          into v_id_sjto_tpo
          from df_i_sujetos_tipo
         where cdgo_sjto_tpo = v_cdgo_sjto_tpo;
      exception
        when others then
          v_id_sjto_tpo  := null;
          o_cdgo_rspsta  := 12;
          o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                            ', Error al consultar el sujeto tipo';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ', ' || sqlerrm,
                                6);
      end;
    else
      v_id_sjto_tpo := null;
    end if;
    --buscamos los candidatos de acuerdo a los criterios de busqueda recibidos
    for slcndos in (select a.cdgo_clnte,
                           a.id_impsto,
                           a.id_impsto_sbmpsto,
                           a.idntfccion_sjto,
                           a.id_sjto_impsto,
                           a.id_sjto,
                           a.vgncia_dsde,
                           a.id_prdo_in,
                           a.vgncia_hsta,
                           a.id_prdo_fn,
                           a.sldo_crtra
                      from v_cb_g_candidatos_persuasivo a
                     where a.id_impsto = v_id_impsto
                       and a.id_impsto_sbmpsto = v_id_impsto_sbmpsto
                       and (v_vgncia_dsde is null or
                           a.vgncia_dsde >= v_vgncia_dsde)
                       and (v_vgncia_hsta is null or
                           a.vgncia_hsta <= v_vgncia_hsta)
                       and (a.cdgo_prdio_clsfccion =
                           nvl(v_cdgo_clse, a.cdgo_prdio_clsfccion) or
                           a.cdgo_prdio_clsfccion is null)
                       and (a.id_prdio_dstno =
                           nvl(v_id_prdio_dstno, a.id_prdio_dstno) or
                           a.id_prdio_dstno is null)
                       and (a.cdgo_estrto =
                           nvl(v_cdgo_estrto, a.cdgo_estrto) or
                           a.cdgo_estrto is null)
                       and a.sldo_crtra >= v_dda_dsde
                       and (a.id_prdo_in >= v_id_prdo_in or
                           v_id_prdo_in is null)
                       and (v_id_prdo_fn <= v_id_prdo_fn or
                           v_id_prdo_fn is null)
                       and (a.tpo_prsna = nvl(v_tpo_prsna, a.tpo_prsna) or
                           v_tpo_prsna is null)
                       and (a.id_sjto_tpo =
                           nvl(v_id_sjto_tpo, a.id_sjto_tpo) or
                           v_id_sjto_tpo is null)
                     order by a.sldo_crtra desc) loop

      if (v_id_lte is not null) then
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'insertamos los candidatos en el lote ' || ', ' ||
                              v_id_lte,
                              6);
        --insertamos los candidatos en el lote
        begin
          insert into cb_g_procesos_simu_sujeto
            (id_prcsos_smu_lte,
             id_sjto,
             vlor_ttal_dda,
             rspnsbles,
             fcha_ingrso,
             id_impsto,
             id_impsto_sbmpsto)
          values
            (v_id_lte,
             slcndos.id_sjto,
             slcndos.sldo_crtra,
             '-',
             sysdate,
             slcndos.id_impsto,
             slcndos.id_impsto_sbmpsto)
          returning id_prcsos_smu_sjto into v_id_prcso_smu_sjto;
        exception
          when others then
            o_cdgo_rspsta  := 13;
            o_mnsje_rspsta := 'Error al intentar registrar sujeto ' ||
                              slcndos.id_sjto;

            pkg_sg_log.prc_rg_log(6,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ', ' || sqlerrm,
                                  6);
            raise v_error;
        end;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'sujeto insertado: ' || v_id_prcso_smu_sjto,
                              6);
      end if;
      --Buscamos los responsables
      for responsables in (select a.prmer_nmbre,
                                  a.sgndo_nmbre,
                                  a.prmer_aplldo,
                                  a.sgndo_aplldo,
                                  a.cdgo_idntfccion_tpo,
                                  a.idntfccion_rspnsble,
                                  a.prncpal_s_n,
                                  a.prcntje_prtcpcion,
                                  a.cdgo_tpo_rspnsble,
                                  NVL(a.id_pais, NVL(b.id_pais, d.id_pais)) AS id_pais,
                                  NVL(a.id_dprtmnto,NVL(b.id_dprtmnto, d.id_dprtmnto)) AS id_dprtmnto,
                                  NVL(a.id_mncpio, NVL(b.id_mncpio, d.id_mncpio)) AS id_mncpio,
                                  NVL(a.drccion, NVL(b.drccion, 'Sin Direcci¿n')) AS drccion

                             from v_si_i_sujetos_responsable a
                             join v_si_i_sujetos_impuesto b
                               on b.id_sjto_impsto = a.id_sjto_impsto
                             left join df_s_clientes d
                              ON d.cdgo_clnte = a.cdgo_clnte
                            where a.cdgo_clnte = p_cdgo_clnte
                              and a.id_sjto_impsto = slcndos.id_sjto_impsto
                              group by
                              a.prmer_nmbre,
                                     a.sgndo_nmbre,
                                     a.prmer_aplldo,
                                     a.sgndo_aplldo,
                                     a.cdgo_idntfccion_tpo,
                                     a.idntfccion_rspnsble,
                                     a.prncpal_s_n,
                                     a.prcntje_prtcpcion,
                                     a.cdgo_tpo_rspnsble,
                                     NVL(a.id_pais, NVL(b.id_pais, d.id_pais)) ,
                                   NVL(a.id_dprtmnto,NVL(b.id_dprtmnto, d.id_dprtmnto)),
                                   NVL(a.id_mncpio, NVL(b.id_mncpio, d.id_mncpio)),
                                   NVL(a.drccion, NVL(b.drccion, 'Sin Direcci¿n'))) loop
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
             drccion_ntfccion)
          values
            (v_id_prcso_smu_sjto,
             responsables.cdgo_idntfccion_tpo,
             responsables.idntfccion_rspnsble,
             responsables.prmer_nmbre,
             responsables.sgndo_nmbre,
             responsables.prmer_aplldo,
             responsables.sgndo_aplldo,
             responsables.prncpal_s_n,
             responsables.cdgo_tpo_rspnsble,
             responsables.prcntje_prtcpcion,
             responsables.id_pais,
             responsables.id_dprtmnto,
             responsables.id_mncpio,
             responsables.drccion);
        exception
          when others then
            o_cdgo_rspsta  := 14;
            o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                              ', al intentar registrar el responsable ' ||
                              responsables.idntfccion_rspnsble;
            raise v_error;
        end;
      end loop;
      --Insertamos los movimientos
      for mvmntos in (select id_sjto_impsto,
                             vgncia,
                             id_prdo,
                             id_cncpto,
                             vlor_sldo_cptal,
                             vlor_intres,
                             cdgo_clnte,
                             id_impsto,
                             id_impsto_sbmpsto,
                             cdgo_mvmnto_orgn,
                             id_orgen,
                             id_mvmnto_fncro
                        from gf_g_mvmntos_cncpto_cnslddo a
                       where a.id_impsto = slcndos.id_impsto
                         and a.id_impsto_sbmpsto = slcndos.id_impsto_sbmpsto
                         and a.id_sjto_impsto = slcndos.id_sjto_impsto
                         and a.vgncia between slcndos.vgncia_dsde and
                             slcndos.vgncia_hsta
                         and a.id_prdo between slcndos.id_prdo_in and
                             slcndos.id_prdo_fn
                         and a.vlor_sldo_cptal >= v_dda_dsde
                         and a.vlor_sldo_cptal <= v_dda_hsta
                         and not exists
                       (select 1
                                from cb_g_procesos_jrdco_mvmnto e
                               where e.id_impsto = a.id_impsto
                                 and e.id_impsto_sbmpsto =
                                     a.id_impsto_sbmpsto
                                 and e.id_sjto_impsto = a.id_sjto_impsto
                                 and e.id_mvmnto_fncro = a.id_mvmnto_fncro
                                 and e.vgncia = a.vgncia
                                 and e.id_prdo = a.id_prdo
                                 and e.id_cncpto = a.id_cncpto)
                       order by id_sjto_impsto, vgncia, id_prdo, id_cncpto) loop

        --Se valida que no exista una prescripcion sin aplicar
        -- para la vigencia y periodo seleccionado, si la funcion retorna S
        -- no se selecciona la vigencia para este candidato
        begin
          v_vldo_slccion := pkg_cb_proceso_persuasivo.fnc_vl_estdo_prscrpcion_vgncia(p_id_sjto_impsto => mvmntos.id_sjto_impsto,
                                                                                     p_vgncia         => mvmntos.vgncia,
                                                                                     p_id_prdo        => mvmntos.id_prdo);
        exception
          when others then
            o_cdgo_rspsta  := 133;
            o_mnsje_rspsta := 'Exception al validar la vigencia ' ||
                              mvmntos.vgncia || '-' || mvmntos.id_prdo ||
                              ', para prescripci¿n ';

            pkg_sg_log.prc_rg_log(6,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ', ' || sqlerrm,
                                  6);
            continue;
        end;

        if v_vldo_slccion = 'N' then
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
               id_mvmnto_fncro,
               id_prcsos_smu_lte)
            values
              (v_id_prcso_smu_sjto,
               mvmntos.id_sjto_impsto,
               mvmntos.vgncia,
               mvmntos.id_prdo,
               mvmntos.id_cncpto,
               mvmntos.vlor_sldo_cptal,
               mvmntos.vlor_intres,
               mvmntos.cdgo_clnte,
               mvmntos.id_impsto,
               mvmntos.id_impsto_sbmpsto,
               mvmntos.cdgo_mvmnto_orgn,
               mvmntos.id_orgen,
               mvmntos.id_mvmnto_fncro,
               v_id_lte);
          exception
            when others then
              o_cdgo_rspsta  := 15;
              o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                                ', Error al intentar registrar datos de la cartera sujeto impuesto: ' ||
                                mvmntos.id_sjto_impsto || ' - vigencia: ' ||
                                mvmntos.vgncia;
              continue;
          end;
        end if;
      end loop;
      v_slccion := v_slccion + 1;
      if p_nmro_rgstros > 0 then
        exit when v_slccion = p_nmro_rgstros;
      end if;
    end loop;
    commit;
    --Envio programado
    begin
      select u.id_usrio, u.email
        into v_id_usrio, o_email
        from v_sg_g_usuarios u
       where u.id_usrio = p_id_usrio;
    exception
      when others then
        o_cdgo_rspsta  := 17;
        o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                          ', No se encontr¿ datos para el env¿o programado';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ', ' || o_mnsje_rspsta,
                              6);
    end;

    -- Actualiza Alcaba envio programado
    BEGIN

      select json_object(key 'p_id_usuario' value v_id_usrio,
                         key 'p_id_lte' value v_id_lte)
        into v_json_parametros
        from dual;

      pkg_ma_envios.prc_co_envio_programado(p_cdgo_clnte   => v_cdgo_clnte,
                                            p_idntfcdor    => 'SLCCION_PRS',
                                            p_json_prmtros => v_json_parametros);

    EXCEPTION
      WHEN OTHERS THEN
        o_cdgo_rspsta  := 10;
        o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                          ', Error en los envios programados';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              'v_nmbre_up',
                              v_nl,
                              o_mnsje_rspsta || ', ' || sqlerrm,
                              6);
    END;
    --Finaliza Alcaba

  exception
    when v_error then
      rollback;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);
      return;
  end prc_rg_slccion_cndtos;

  procedure prc_rg_proceso_persuasivo_job(p_cdgo_clnte        in number,
                                          p_id_prcsos_smu_lte in number,
                                          p_id_sjto_impsto    in number default null,
                                          p_id_usrio          in number,
                                          p_id_plntlla        in number default null,
                                          o_cdgo_rspsta       out number,
                                          o_mnsje_rspsta      out varchar2) as

    v_nl       number;
    v_nmbre_up varchar2(100) := 'pkg_cb_proceso_persuasivo.prc_rg_proceso_persuasivo_job';

    v_error exception;
    -- o_cdgo_rspsta  number;
    -- o_mnsje_rspsta varchar2(4000);
    v_job_state VARCHAR2(50);
    v_msvo      number := 0;

  begin

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Entrando a la up ' || v_nmbre_up || ', ' ||
                          systimestamp,
                          6);

    o_mnsje_rspsta := 'p_cdgo_clnte: ' || p_cdgo_clnte || ',' ||
                      'p_id_usuario: ' || p_id_usrio || ',' || 'p_msvo: ' ||
                      v_msvo || ',' || 'p_id_plntlla: ' || p_id_plntlla;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          o_mnsje_rspsta,
                          6);

    begin

      DBMS_SCHEDULER.set_attribute(name      => 'IT_RG_PRCSOS_PRSSVOS',
                                   attribute => 'job_action',
                                   value     => 'pkg_cb_proceso_persuasivo.prc_rg_proceso_persuasivo');

      DBMS_SCHEDULER.set_attribute(name      => 'IT_RG_PRCSOS_PRSSVOS',
                                   attribute => 'number_of_arguments',
                                   value     => 5);

      DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE(job_name          => 'IT_RG_PRCSOS_PRSSVOS',
                                            argument_position => 1,
                                            argument_value    => p_cdgo_clnte);

      DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE(job_name          => 'IT_RG_PRCSOS_PRSSVOS',
                                            argument_position => 2,
                                            argument_value    => p_id_prcsos_smu_lte);

      DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE(job_name          => 'IT_RG_PRCSOS_PRSSVOS',
                                            argument_position => 3,
                                            argument_value    => p_id_sjto_impsto);

      DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE(job_name          => 'IT_RG_PRCSOS_PRSSVOS',
                                            argument_position => 4,
                                            argument_value    => p_id_usrio);

      DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE(job_name          => 'IT_RG_PRCSOS_PRSSVOS',
                                            argument_position => 5,
                                            argument_value    => p_id_plntlla);

      o_mnsje_rspsta := 'Antes de ejecutar el job';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);
      -- Deshabilitar y habilitar el job para reiniciar su estado
      DBMS_SCHEDULER.DISABLE('IT_RG_PRCSOS_PRSSVOS');
      DBMS_SCHEDULER.ENABLE('IT_RG_PRCSOS_PRSSVOS');
      o_mnsje_rspsta := 'despu¿s de ejecutar el job';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);
      -- Verificar el estado del job
      select state
        into v_job_state
        from user_scheduler_jobs
       where job_name = 'IT_RG_PRCSOS_PRSSVOS';

      if (v_job_state = 'SCHEDULED' or v_job_state = 'RUNNING') then
        o_cdgo_rspsta  := 0;
        o_mnsje_rspsta := 'El proceso de registro se realiz¿ exitosamente';
        --    o_mnsje_rspsta := 'El job fue habilitado correctamente.';
      else
        o_cdgo_rspsta  := 1;
        o_mnsje_rspsta := 'El job no se habilit¿ correctamente. Estado: ' ||
                          v_job_state;
        raise v_error;
      end if;

    exception
      when others then
        o_cdgo_rspsta  := 100;
        o_mnsje_rspsta := 'Exception ' || o_cdgo_rspsta ||
                          ', presentada al ejecutar IT_RG_PRCSOS_PRSSVOS, ' ||
                          sqlerrm;
        raise v_error;
    end;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          o_mnsje_rspsta,
                          6);

  exception
    when v_error then
      rollback;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);
      return;
  end prc_rg_proceso_persuasivo_job;

  /*procedure prc_gn_documento_persuasivo_msvo(p_cdgo_clnte    in number,
                                             p_id_lte_prssvo in number) as

    v_nl       number;
    v_nmbre_up varchar2(100) := 'pkg_cb_proceso_persuasivo.prc_gn_documento_persuasivo_msvo';

    v_error        exception;
    o_cdgo_rspsta  number;
    o_mnsje_rspsta varchar2(4000);
    v_job_state    VARCHAR2(50);

  begin

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Entrando a la up ' || v_nmbre_up || ', ' ||
                          systimestamp,
                          6);
  exception
    when v_error then
      rollback;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);
      return;
  end prc_gn_documento_persuasivo_msvo;*/

  procedure prc_rg_seleccion_cnddts_archvo(p_cdgo_clnte    in number,
                                         p_id_prcso_crga in number,
                                         p_id_lte        in number,
                                         o_cdgo_rspsta   out number,
                                         o_mnsje_rspsta  out varchar2) as

		e_no_encuentra_lote   exception;
		e_no_archivo_excel    exception;
		v_et_g_procesos_carga et_g_procesos_carga%rowtype;
		v_cdgo_prcso          varchar2(3);
		v_sldo_ttal_crtra     number;
		--v_id_sjto_impsto      number;
		v_id_prcsos_smu_sjto number;
		v_id_usrio           number;
		-- LOG
		v_error    exception;
		v_nl       number;
		v_nmbre_up varchar2(70) := 'pkg_cb_proceso_persuasivo.prc_rg_seleccion_cnddts_archvo';

  begin

        v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'Entrando a la up ' || v_nmbre_up || ', ' || systimestamp, 6);

        o_cdgo_rspsta  := 0;
        o_mnsje_rspsta := 'OK';

        -- Si no se especifica un lote
        if p_id_lte is null then
            o_cdgo_rspsta  := 4;
            o_mnsje_rspsta := '' || o_cdgo_rspsta || '. No se especific¿ un lote';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, o_mnsje_rspsta || ', ' || sqlerrm, 6);
            raise v_error;
        end if;

        -- ****************** INICIO ETL ***************************************************
        begin
            select a.*
                into v_et_g_procesos_carga
            from et_g_procesos_carga a
            where id_prcso_crga = p_id_prcso_crga;
        exception
            when others then
                o_cdgo_rspsta  := 5;
                o_mnsje_rspsta := '' || o_cdgo_rspsta ||
                              '.Error al consultar informacion de carga en ETL';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, o_mnsje_rspsta || ', ' || sqlerrm, 6);
                raise v_error;
        end;

        -- Cargar archivo al directorio
        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'Cargar archivo ' || v_et_g_procesos_carga.file_name || ' al directorio', 6);
        begin
          pk_etl.prc_carga_archivo_directorio(p_file_blob => v_et_g_procesos_carga.file_blob,
                                              p_file_name => v_et_g_procesos_carga.file_name);
        exception
            when others then
                o_cdgo_rspsta  := 66;
                o_mnsje_rspsta := '' || o_cdgo_rspsta ||
                                  '.Error al cargar el archivo al directorio ETL';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, o_mnsje_rspsta || ', ' || sqlerrm, 6);
                raise v_error;
        end;

        -- Ejecutar proceso de ETL para cargar a tabla intermedia
        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'cargar a tabla intermedia ', 6);
        begin
            pk_etl.prc_carga_intermedia_from_dir(p_cdgo_clnte    => p_cdgo_clnte,
                                                 p_id_prcso_crga => p_id_prcso_crga);
        exception
            when others then
                o_cdgo_rspsta  := 67;
                o_mnsje_rspsta := '' || o_cdgo_rspsta ||
                                  '.Error al cargar el archivo a tabla intermedia';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, o_mnsje_rspsta || ', ' || sqlerrm, 6);
                raise v_error;
        end;

        -- Cargar datos a Gestion
        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'Cargar datos a Gestion ', 6);

        begin
            pk_etl.prc_carga_gestion(p_cdgo_clnte    => p_cdgo_clnte,
                                     p_id_prcso_crga => p_id_prcso_crga);
        exception
            when others then
                o_cdgo_rspsta  := 68;
                o_mnsje_rspsta := '' || o_cdgo_rspsta ||
                                  '.Error al cargar el archivo a gesti¿n';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, o_mnsje_rspsta || ', ' || sqlerrm, 6);
                raise v_error;
        end;

        -- ****************** FIN ETL ******************************************************
        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'finaliz¿ carga etl, p_id_prcso_crga - ' || p_id_prcso_crga, 6);

        begin
            select cdgo_prcso
                into v_cdgo_prcso
            from v_gn_g_candidatos_carga_prssvo
            where id_prcso_crga = p_id_prcso_crga
            and id_lte_prcso = p_id_lte
            and rownum <= 1;
        exception
            when others then
                o_cdgo_rspsta  := 10;
                o_mnsje_rspsta := '' || o_cdgo_rspsta ||
                                  ' Error al validar el proceso que realiza la carga. ' ||
                                  sqlerrm;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, o_mnsje_rspsta || ', ' || sqlerrm, 6);
                raise v_error;
        end;

        begin
            select u.id_usrio
                into v_id_usrio
            from cb_g_procesos_simu_lote l
            join v_sg_g_usuarios u on u.id_fncnrio = l.id_fncnrio
            where l.id_prcsos_smu_lte = p_id_lte
            and rownum = 1;
        exception
            when others then
                o_cdgo_rspsta  := 10;
                o_mnsje_rspsta := '' || o_cdgo_rspsta ||
                                  ' Error al validar el usuario del lote. '||p_id_lte ||
                                  ' - '||sqlerrm;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, o_mnsje_rspsta || ', ' || sqlerrm, 6);
                raise v_error;
        end;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'v_cdgo_prcso - ' || v_cdgo_prcso, 6);

        if v_cdgo_prcso = 'PRS' then

            begin
                -- 3. Se inactivan los sujetos (que no han sido procesados) en el lote que
                -- no se encuentren en la informaci¿n cargada del archivo.
                --delete from cb_g_procesos_simu_sujeto a
                update cb_g_procesos_simu_sujeto a
                   set a.actvo = 'N'
                 where a.id_prcsos_smu_lte = p_id_lte
                   and a.indcdor_prcsdo = 'N'
                   and a.actvo = 'S'
                   and not exists (select 1
                                      from v_gn_g_candidatos_carga_prssvo c
                                      join si_c_sujetos d on d.idntfccion = c.idntfccion
                                     where d.id_sjto = a.id_sjto
                                       and c.id_prcso_crga = p_id_prcso_crga
                                       and c.id_lte_prcso = p_id_lte
                                       and c.cdgo_prcso = v_cdgo_prcso);
            exception
                when others then
                    rollback;
                    o_cdgo_rspsta  := 15;
                    o_mnsje_rspsta := o_cdgo_rspsta ||
                                    '-Error al intentar eliminar los sujetos que no estan en el archivo cargado.';
                    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, o_mnsje_rspsta || ', ' || sqlerrm, 6);
                    raise v_error;
            end;

            -- Activa sujetos que vinieron en el Excel y Est¿n INACTIVOS en el Lote
            for c_sjtos_archvo in (select d.id_sjto
                                   from v_gn_g_candidatos_carga_prssvo c
                                   join si_c_sujetos d on d.idntfccion = c.idntfccion
                                   where c.id_prcso_crga = p_id_prcso_crga
                                   and c.id_lte_prcso = p_id_lte
                                   and c.cdgo_prcso = v_cdgo_prcso
                                   and exists (select 1
                                                from cb_g_procesos_simu_sujeto j
                                                where j.id_sjto = d.id_sjto
                                                and j.id_prcsos_smu_lte = c.id_lte_prcso
                                                and j.actvo = 'N'
                                                and j.indcdor_prcsdo = 'N'))
            loop
                -- Los que esten inactivos pero vinieron en el archivo
                -- se vuelven a activar
                begin
                    update cb_g_procesos_simu_sujeto a
                        set a.actvo = 'S'
                    where a.id_prcsos_smu_lte = p_id_lte
                    and a.id_sjto = c_sjtos_archvo.id_sjto
                    and a.indcdor_prcsdo = 'N'
                    and a.actvo = 'N';
                exception
                    when others then
                        o_cdgo_rspsta  := 16;
                        o_mnsje_rspsta := o_cdgo_rspsta ||
                                          '-Error al intentar activar los sujetos que estan en el archivo cargado.';
                        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, o_mnsje_rspsta || ', ' || sqlerrm, 6);
                        continue;
                end;

            end loop;

            -- INSERTAR en el Lote ... los Nuevos Sujeto que vinieron
            --en el Excel y No estaban en el Lote

            for c_sjtos_archvo in (select distinct c.idntfccion,
                                          min(c.vgncia_dsde) vgncia_dsde,
                                          min(c.prdo_incial) prdo_incial,
                                          max(c.vgncia_hsta) vgncia_hsta,
                                          max(c.prdo_incial) prdo_final,
                                          d.id_sjto,
                                          e.id_sjto_impsto,
                                          c.id_impsto,
                                          c.id_impsto_sbmpsto
                                   from v_gn_g_candidatos_carga_prssvo c
                                   join si_c_sujetos d on d.idntfccion = c.idntfccion
                                   join si_i_sujetos_impuesto e on e.id_sjto = d.id_sjto
                                                                and e.id_impsto = c.id_impsto
                                                                and e.id_sjto_estdo = 1
                                   where c.id_prcso_crga = p_id_prcso_crga
                                   and c.id_lte_prcso = p_id_lte
                                   and c.cdgo_prcso = v_cdgo_prcso
                                   and not exists (select 1
                                                from cb_g_procesos_simu_sujeto j
                                                where j.id_sjto = d.id_sjto
                                                and j.id_prcsos_smu_lte = c.id_lte_prcso)
                                   group by c.idntfccion, d.id_sjto, e.id_sjto_impsto, c.id_impsto, c.id_impsto_sbmpsto)
            loop
                -- incluimos Sujetos
                -- Incluir Responsables
                -- Incluir Movimientos Financieros

                begin
					select nvl(sum(f.vlor_sldo_cptal + f.vlor_intres), 0)
						into v_sldo_ttal_crtra
					from v_gf_g_cartera_x_concepto f
					where f.cdgo_clnte = p_cdgo_clnte
					and f.id_impsto = c_sjtos_archvo.id_impsto
					and f.id_impsto_sbmpsto = c_sjtos_archvo.id_impsto_sbmpsto
					and f.id_sjto_impsto = c_sjtos_archvo.id_sjto_impsto
					and f.vgncia between c_sjtos_archvo.vgncia_dsde and c_sjtos_archvo.vgncia_hsta
					--and f.id_prdo between c_sjtos_archvo.prdo_incial and c_sjtos_archvo.prdo_final
                    and f.cdgo_mvnt_fncro_estdo != 'AN'
					and (f.vlor_sldo_cptal + f.vlor_intres) > 0;

				exception
					when others then
						o_cdgo_rspsta  := 18;
						o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta || ' al validar saldo en cartera para el sujeto '||c_sjtos_archvo.idntfccion;
						pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, o_mnsje_rspsta || ', ' || sqlerrm, 6);
						continue;
				end;
				-- FIN <Validar cartera>
				-- SI tiene cartera proseguimos
				if v_sldo_ttal_crtra > 0 then
					-- 1. Incluir sujeto
					pkg_cb_proceso_persuasivo.prc_rg_simu_sujeto(p_cdgo_clnte         => p_cdgo_clnte,
                                                                 p_id_prcsos_smu_lte  => p_id_lte,
                                                                 p_id_sjto            => c_sjtos_archvo.id_sjto,
                                                                 p_vlor_ttal_dda      => v_sldo_ttal_crtra,
                                                                 p_id_impsto          => c_sjtos_archvo.id_impsto,
                                                                 p_id_impsto_sbmpsto  => c_sjtos_archvo.id_impsto_sbmpsto,
                                                                 p_id_usrio           => v_id_usrio,
                                                                 p_idntfccion         => c_sjtos_archvo.idntfccion,
                                                                 o_id_prcsos_smu_sjto => v_id_prcsos_smu_sjto,
                                                                 o_cdgo_rspsta        => o_cdgo_rspsta,
                                                                 o_mnsje_rspsta       => o_mnsje_rspsta);

					if v_id_prcsos_smu_sjto is null then
                        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'No se registr¿ el sujeto '||c_sjtos_archvo.idntfccion, 6);
                        continue;
                    end if;

                    -- 2. Incluir responsables
					pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'Insertando responsables', 6);

					--insertar responsables
                    pkg_cb_proceso_persuasivo.prc_rg_simu_responsable(p_cdgo_clnte         => p_cdgo_clnte,
                                                                      p_id_sjto_impsto     => c_sjtos_archvo.id_sjto_impsto,
                                                                      p_id_prcso_crga      => p_id_prcso_crga,
                                                                      p_id_lte_prcso       => p_id_lte,
                                                                      p_id_prcsos_smu_sjto => v_id_prcsos_smu_sjto,
                                                                      p_idntfccion_sjto    => c_sjtos_archvo.idntfccion,
                                                                      p_id_usrio           => v_id_usrio,
                                                                      p_id_sjto            => c_sjtos_archvo.id_sjto,
                                                                      o_cdgo_rspsta        => o_cdgo_rspsta,
                                                                      o_mnsje_rspsta       => o_mnsje_rspsta);

					if o_cdgo_rspsta <> 0 then
                        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'No se registraron los responsables para el sujeto '||c_sjtos_archvo.idntfccion, 6);
                        pkg_cb_proceso_persuasivo.prc_el_simu_sujeto(p_id_prcsos_smu_sjto => v_id_prcsos_smu_sjto,
                                                                     p_id_prcsos_smu_lte  => p_id_lte);
                        continue;
                    end if;

					-- 3. Insertar los movimientos
					pkg_cb_proceso_persuasivo.prc_rg_simu_movimientos(p_cdgo_clnte         => p_cdgo_clnte,
                                                                      p_id_impsto          => c_sjtos_archvo.id_impsto,
                                                                      p_id_impsto_sbmpsto  => c_sjtos_archvo.id_impsto_sbmpsto,
                                                                      p_id_sjto_impsto     => c_sjtos_archvo.id_sjto_impsto,
                                                                      p_vgncia_dsde        => c_sjtos_archvo.vgncia_dsde,
                                                                      p_vgncia_hsta        => c_sjtos_archvo.vgncia_hsta,
                                                                      p_id_prcsos_smu_sjto => v_id_prcsos_smu_sjto,
                                                                      p_id_prcsos_smu_lte  => p_id_lte,
                                                                      p_idntfccion_sjto    => c_sjtos_archvo.idntfccion,
                                                                      p_id_usrio           => v_id_usrio,
                                                                      o_cdgo_rspsta        => o_cdgo_rspsta,
                                                                      o_mnsje_rspsta       => o_mnsje_rspsta);

                   if o_cdgo_rspsta <> 0 then
                        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'No se registraron los movimientos para el sujeto '||c_sjtos_archvo.idntfccion, 6);
                        pkg_cb_proceso_persuasivo.prc_el_simu_sujeto(p_id_prcsos_smu_sjto => v_id_prcsos_smu_sjto,
                                                                     p_id_prcsos_smu_lte  => p_id_lte);
                        continue;
                    end if;

               /* else
					o_cdgo_rspsta  := 22;
					o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta || 'El sujeto ' ||
									c_sjtos_archvo.id_sjto ||
									', no tiene saldo en cartera.';
					--insertamos en la traza
					pkg_cb_proceso_persuasivo.prc_rg_prcsos_prssvo_trza(p_cdgo_clnte          => p_cdgo_clnte,
																	    p_id_prcsos_smu_sjto  => v_id_prcsos_smu_sjto,
																	    p_id_prcsos_smu_lte   => p_id_lte,
																	    p_id_sjto             => c_sjtos_archvo.id_sjto,
																	    p_idntfccion_sjto     => null,
																	    p_prcsos_perssvo_trza => o_mnsje_rspsta || ', ' || sqlerrm,
																	    p_fcha_prcso          => systimestamp,
																	    p_id_usrio            => v_id_usrio,
																	    p_id_prcsos_prssvo    => null,
																	    p_id_prcso_prssvo_lte => null);

					pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, o_mnsje_rspsta || ', ' || sqlerrm, 6);

                    continue;

				end if; */

                else
                    o_cdgo_rspsta  := 22;
                    o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta || ' El sujeto ' ||
                                    c_sjtos_archvo.id_sjto ||
                                    ', no tiene saldo en cartera.';
                    --insertamos en la traza
                    pkg_cb_proceso_persuasivo.prc_rg_prcsos_prssvo_trza(p_cdgo_clnte          => p_cdgo_clnte,
                                                                        p_id_prcsos_smu_sjto  => v_id_prcsos_smu_sjto,
                                                                        p_id_prcsos_smu_lte   => p_id_lte,
                                                                        p_id_sjto             => c_sjtos_archvo.id_sjto,
                                                                        p_idntfccion_sjto    => c_sjtos_archvo.idntfccion,
                                                                        p_prcsos_perssvo_trza => o_mnsje_rspsta || ', ' || sqlerrm,
                                                                        p_fcha_prcso          => systimestamp,
                                                                        p_id_usrio            => v_id_usrio,
                                                                        p_id_prcsos_prssvo    => null,
                                                                        p_id_prcso_prssvo_lte => null);

                    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, o_mnsje_rspsta || ', ' || sqlerrm, 6);

                    continue;

                end if;

			end loop;
		end if;
		pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'Saliendo de la up ' || v_nmbre_up || '. ' || systimestamp, 6);
	exception
		when v_error then
			rollback;
			pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, o_mnsje_rspsta, 6);
			return;
	end prc_rg_seleccion_cnddts_archvo;

  function fnc_vl_estdo_prscrpcion_vgncia(p_id_sjto_impsto in number,
                                          p_vgncia         in number,
                                          p_id_prdo        in number)
    return varchar2 as
    v_count number := 0;
  begin
    begin
      select 1
        into v_count
        from gf_g_prscrpcnes_vgncia b
        join GF_G_PRSCRPCNES_SJTO_IMPSTO c
          on c.id_prscrpcion_sjto_impsto = b.id_prscrpcion_sjto_impsto
       where c.id_sjto_impsto = p_id_sjto_impsto
         and b.vgncia = p_vgncia
         and b.id_prdo = p_id_prdo;
    exception
      when no_data_found then
        return 'N';
      when others then
        return 'N';
    end;

    if v_count > 0 then
      return 'S';
    end if;

  end fnc_vl_estdo_prscrpcion_vgncia;

  procedure prc_rg_proceso_persuasivo_json(p_cdgo_clnte   in number,
                                           p_json_datos   in clob,
                                           p_id_usrio     in number,
                                           o_cdgo_rspsta  out number,
                                           o_mnsje_rspsta out varchar2) as

    v_nl       number;
    v_nmbre_up varchar2(100) := 'pkg_cb_proceso_persuasivo.prc_rg_proceso_persuasivo_json';
    v_error    exception;
    v_exste    number;

  begin
    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'Registro realizado con ¿xito';

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Entrando a la up ' || v_nmbre_up || ', ' ||
                          systimestamp,
                          6);

    for c_sjtos in (select id_prcsos_smu_sjto,
                           id_prcsos_smu_lte,
                           id_sjto,
                           idntfccion,
                           to_number(replace(replace(vlor_ttal_dda, '$', ''),
                                             '.',
                                             ''),
                                     '9999999999999D99') as vlor_ttal_dda,
                           id_prcso_tpo,
                           id_sjto_impsto,
                           id_impsto,
                           id_impsto_sbmpsto
                      from json_table(p_json_datos,
                                      '$[*]'
                                      columns(id_prcsos_smu_sjto varchar2(50) path
                                              '$.ID_PRCSOS_SMU_SJTO',
                                              id_prcsos_smu_lte varchar2(50) path
                                              '$.ID_PRCSOS_SMU_LTE',
                                              id_sjto varchar2(50) path
                                              '$.ID_SJTO',
                                              idntfccion varchar2(50) path
                                              '$.IDNTFCCION',
                                              vlor_ttal_dda varchar2(50) path
                                              '$.VLOR_TTAL_DDA',
                                              id_prcso_tpo number path
                                              '$.ID_PRCSO_TPO',
                                              id_sjto_impsto number path
                                              '$.ID_SJTO_IMPSTO',
                                              id_impsto number path
                                              '$.ID_IMPSTO',
                                              id_impsto_sbmpsto number path
                                              '$.ID_IMPSTO_SBMPSTO'))) loop

      v_exste := 0;
      begin
        select count(id_prcsos_smu_sjto)
          into v_exste
          from cb_g_procesos_persuasivo_json
         where id_prcsos_smu_lte = c_sjtos.id_prcsos_smu_lte
           and id_prcsos_smu_sjto = c_sjtos.id_prcsos_smu_sjto
           and indcdor_prcsdo = 'N';
      exception
        when others then
          v_exste := 0;
      end;

      if v_exste = 0 then

        begin
          insert into cb_g_procesos_persuasivo_json
            (id_prcsos_smu_sjto,
             id_sjto,
             vlor_ttal_dda,
             idntfccion,
             id_prcsos_smu_lte,
             id_prcso_tpo,
             id_usrio,
             indcdor_prcsdo,
             id_impsto,
             id_impsto_sbmpsto,
             id_sjto_impsto)
          values
            (c_sjtos.id_prcsos_smu_sjto,
             c_sjtos.id_sjto,
             c_sjtos.vlor_ttal_dda,
             c_sjtos.idntfccion,
             c_sjtos.id_prcsos_smu_lte,
             c_sjtos.id_prcso_tpo,
             p_id_usrio,
             'N',
             c_sjtos.id_impsto,
             c_sjtos.id_impsto_sbmpsto,
             c_sjtos.id_sjto_impsto);
        exception
          when others then
            o_cdgo_rspsta  := 10;
            o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                              ', Fall¿ al registrar en cb_g_procesos_persuasivo_json';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ', ' || sqlerrm,
                                  6);
            raise v_error;
        end;
      end if;
    end loop;
    commit;
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Saliendo de la up ' || v_nmbre_up || ', ' ||
                          systimestamp,
                          6);
  exception
    when v_error then
      rollback;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);
  end prc_rg_proceso_persuasivo_json;

  procedure prc_gn_blob_prssvo(p_cdgo_clnte   in number,
                               p_json_actos   in clob,
                               p_id_usrio     in number,
                               o_cdgo_rspsta  out number,
                               o_mnsje_rspsta out varchar2) as

    v_nmbre_up varchar2(100) := 'pkg_cb_proceso_persuasivo.prc_gn_blob_prssvo';
    v_nl       number;
    --o_mnsje_rspsta  varchar2(4000);
    v_id_usrio_apex number;
    --o_cdgo_rspsta   number;
    v_json_dcmnto   CLOB;
    v_blob          blob;
    v_gn_d_reportes gn_d_reportes%rowtype;
    v_id_acto       number;
    v_error         exception;
    v_id_dcmnto     number := 0;

  begin

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Entrando a la up ' || v_nmbre_up || ', ' ||
                          p_id_usrio || '-' || systimestamp,
                          6);

    for actos in (select id_prcsos_prssvo_dcmnto,
                         id_prcsos_prssvo,
                         id_acto_tpo,
                         cdgo_sjto_orgen,
                         id_acto,
                         id_plntlla
                    from json_table(p_json_actos,
                                    '$[*]'
                                    columns(id_prcsos_prssvo_dcmnto number path
                                            '$.ID_PRCSOS_PRSSVO_DCMNTO',
                                            id_prcsos_prssvo number path
                                            '$.ID_PRCSOS_PRSSVO',
                                            id_acto_tpo number path
                                            '$.ID_ACTO_TPO',
                                            cdgo_sjto_orgen varchar2(50) path
                                            '$.CDGO_SJTO_ORGEN',
                                            id_acto number path '$.ID_ACTO',
                                            id_plntlla number path
                                            '$.ID_PLNTLLA'))) loop

      v_id_dcmnto := 0;
      begin
        Select count(a.id_dcmnto)
          into v_id_dcmnto
          from gd_g_documentos a
          join gn_g_actos b
            on b.id_dcmnto = a.id_dcmnto
         where b.id_acto = actos.id_acto;
      exception
        when no_data_found then
          v_id_dcmnto := 0;
        when others then
          v_id_dcmnto := 0;
      end;

      if v_id_dcmnto = 0 then
        begin
          update gn_g_actos
             set id_dcmnto = null, indcdor_ntfccion = 'N'
           where id_acto = actos.id_acto
             and id_acto_tpo = actos.id_acto_tpo;
        exception
          when others then
            o_cdgo_rspsta  := 10;
            o_mnsje_rspsta := ' No se pudo actualizar  gn_g_actos';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ',' || sqlerrm,
                                  6);
        end;
      end if;

      -- ************ GENERACION DEL REPORTE ******************
      begin
        o_mnsje_rspsta := 'Entrando a validar la sesion';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);
        if v('APP_SESSION') is null then
          v_id_usrio_apex := pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte                => p_cdgo_clnte,
                                                                             p_cdgo_dfncion_clnte_ctgria => 'CLN',
                                                                             p_cdgo_dfncion_clnte        => 'USR');

          apex_session.create_session(p_app_id   => 66000,
                                      p_page_id  => 2,
                                      p_username => v_id_usrio_apex);
        else
          apex_session.attach(p_app_id     => 66000,
                              p_page_id    => 37,
                              p_session_id => v('APP_SESSION'));
        end if;
      exception
        when others then
          o_cdgo_rspsta  := 101;
          o_mnsje_rspsta := 'Error' || o_cdgo_rspsta ||
                            ', error al validar la sesion';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ', ' || sqlerrm,
                                6);
          raise v_error;
      end;

      select json_object('id_prcsos_prssvo_dcmnto' value
                         actos.id_prcsos_prssvo_dcmnto)
        into v_json_dcmnto
        from dual;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'v_json_dcmnto: ' || v_json_dcmnto,
                            6);

      --SETEAMOS EN SESSION LOS ITEMS NECESARIOS PARA GENERAR EL ARCHIVO
      begin
        apex_util.set_session_state('P37_JSON', v_json_dcmnto);
        apex_util.set_session_state('F_CDGO_CLNTE', p_cdgo_clnte);
      exception
        when others then
          o_mnsje_rspsta := 'Error 102 al setear los item del reporte a la sesion';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ', ' || sqlerrm,
                                6);
          raise v_error;
      end;
      -- Obtenemos Datos del reporte

      begin
        select a.*
          into v_gn_d_reportes
          from gn_d_reportes a
          join gn_d_plantillas b
            on b.id_rprte = a.id_rprte
         where b.id_plntlla = actos.id_plntlla
           and b.id_acto_tpo = actos.id_acto_tpo;
      exception
        when others then
          o_cdgo_rspsta  := 16;
          o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                            ', No se encontraron los datos del reporte';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ', ' || sqlerrm,
                                6);
          raise v_error;
      end;

      o_mnsje_rspsta := 'Procede a generar el blob';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);

      --GENERAMOS EL DOCUMENTO
      begin
        v_blob := apex_util.get_print_document(p_application_id     => 66000,
                                               p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,
                                               p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,
                                               p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,
                                               p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo);
      exception
        when others then
          o_cdgo_rspsta  := 103;
          o_mnsje_rspsta := o_cdgo_rspsta || ' No se pudo generar el blob';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ',' || sqlerrm,
                                6);
          raise v_error;

      end;
      -- Actualiar el acto con el BLOB
      if (v_blob is not null and dbms_lob.getlength(v_blob) > 1000) then
        o_mnsje_rspsta := 'Seguimos actualizando el acto';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);

        begin
          pkg_gn_generalidades.prc_ac_acto(p_id_acto         => actos.id_acto,
                                           p_ntfccion_atmtca => 'N',
                                           p_file_blob       => v_blob);
        exception
          when others then
            o_cdgo_rspsta  := 18;
            o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                              ', No se pudo actualizar el acto ' ||
                              actos.id_acto;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ', ' || sqlerrm,
                                  6);
            raise v_error;
        end;

        if v('APP_SESSION') is null then
          v_id_usrio_apex := pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte                => p_cdgo_clnte,
                                                                             p_cdgo_dfncion_clnte_ctgria => 'CLN',
                                                                             p_cdgo_dfncion_clnte        => 'USR');

          apex_session.create_session(p_app_id   => 66000,
                                      p_page_id  => 2,
                                      p_username => v_id_usrio_apex);
        else
          apex_session.attach(p_app_id     => 66000,
                              p_page_id    => 2,
                              p_session_id => v('APP_SESSION'));
        end if;

        o_cdgo_rspsta := 0;

      else
        o_cdgo_rspsta  := 17;
        o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                          ', No se gener¿ el blob para el acto ' ||
                          v_id_acto;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ', ' || sqlerrm,
                              6);
        raise v_error;
      end if;
    end loop;
    o_mnsje_rspsta := 'Generacion de blob existosa';

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          o_mnsje_rspsta,
                          6);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Saliendo de la up ' || v_nmbre_up || ', ' ||
                          systimestamp,
                          6);
  exception
    when v_error then
      rollback;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta || ', ' || sqlerrm,
                            6);
      return;
  end prc_gn_blob_prssvo;

  procedure prc_rg_slccion_cndtos_pntal(p_cdgo_clnte        in cb_g_procesos_simu_lote.cdgo_clnte%type,
                                        p_lte_simu          in cb_g_procesos_simu_lote.id_prcsos_smu_lte%type,
                                        p_id_impsto         in number,
                                        p_id_impsto_sbmpsto in number,
                                        p_sjto_id           in si_c_sujetos.id_sjto%type,
                                        p_id_usrio          in sg_g_usuarios.id_usrio%type,
                                        p_json_movimientos  in clob,
                                        p_obsrvcion_lte     in cb_g_procesos_simu_lote.obsrvcion%type,
                                        p_id_prcso_tpo      in number,
                                        p_cdgo_orgen_sjto   in varchar2,
                                        p_id_prcso_crga     in number default 0,
                                        p_lte_nvo           out cb_g_procesos_simu_lote.id_prcsos_smu_lte%type,
                                        o_cdgo_rspsta       out number,
                                        o_mnsje_rspsta      out varchar2) as

    v_nl       number;
    v_nmbre_up varchar2(100) := 'pkg_cb_proceso_persuasivo.prc_rg_slccion_cndtos_pntal';
    v_error    exception;

    v_lte_simu                    cb_g_procesos_simu_lote.id_prcsos_smu_lte%type := 0;
    v_id_prcso_smu_sjto           cb_g_procesos_simu_sujeto.id_prcsos_smu_sjto%type;
    v_existe_tercero              varchar(1);
    v_deuda_total                 number(16, 2);
    v_id_fncnrio                  cb_g_procesos_simu_lote.id_fncnrio%type;
    v_nmbre_fncnrio               v_sg_g_usuarios.nmbre_trcro%type;
    v_cnsctvo_inxstntes           df_c_consecutivos.vlor%type;
    v_cdgo_orgen_sjto             varchar2(3);
    v_id_prcsos_smu_sjto_inxstnte cb_g_prcss_sm_sjto_inxstnte.id_prcsos_smu_sjto_inxstnte%type;
    v_slccnar_sjto                varchar2(1);
    v_nmbre_cmplto                varchar2(200);

    type t_sjtos_inxstntes is record(
      cdgo_idntfccion_tpo varchar2(3),
      idntfccion          varchar2(25),
      prmer_nmbre         varchar2(500),
      sgndo_nmbre         varchar2(100),
      prmer_aplldo        varchar2(100),
      sgndo_aplldo        varchar2(100),
      rzon_scial          varchar2(200),
      drccion_ntfccion    varchar2(100),
      email               varchar2(320),
      tlfno               varchar2(50),
      cllar               varchar2(50));
    v_id_sjto number;

    type r_sjtos_inxstntes is table of t_sjtos_inxstntes;
    v_sjtos_inxstntes r_sjtos_inxstntes;

  begin

    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'Seleccion realizada con ¿xito';

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Entrando a la up ' || v_nmbre_up || ', ' ||
                          systimestamp,
                          6);

    v_cdgo_orgen_sjto := p_cdgo_orgen_sjto;
    v_lte_simu        := p_lte_simu;

    v_slccnar_sjto := 'S';

    v_id_sjto := JSON_VALUE(p_json_movimientos, '$[0].id_sjto');

    begin
      select u.id_fncnrio, u.nmbre_trcro
        into v_id_fncnrio, v_nmbre_fncnrio
        from v_sg_g_usuarios u
       where u.id_usrio = p_id_usrio;
    exception
      when others then
        o_cdgo_rspsta  := 10;
        o_mnsje_rspsta := 'Error al intetar obtener el funcionario.';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' ' || sqlerrm,
                              6);
        raise v_error;
    end;

    if v_cdgo_orgen_sjto = 'NE' then
      --Verifica si el sujeto inexistente existe en la tabla et_g_procesos_intermedia
      begin
        select /*+ RESULT_CACHE */
         a.clumna1  as cdgo_idntfccion_tpo,
         a.clumna2  as idntfccion,
         a.clumna5  as prmer_nmbre,
         a.clumna6  as sgndo_nmbre,
         a.clumna3  as prmer_aplldo,
         a.clumna4  as sgndo_aplldo,
         a.clumna7  as rzon_scial,
         a.clumna8  as drccion_ntfccion,
         a.clumna11 as email,
         a.clumna9  as tlfno,
         a.clumna10 as cllar
          bulk collect
          into v_sjtos_inxstntes
          from et_g_procesos_intermedia a
         where a.id_prcso_crga = p_id_prcso_crga;
      exception
        when no_data_found then
          o_cdgo_rspsta  := 11;
          o_mnsje_rspsta := '' || o_cdgo_rspsta ||
                            ' El proceso de cargue de sujetos inexistentes#' ||
                            p_id_prcso_crga || ', no existe en el sistema.';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' ' || sqlerrm,
                                6);
          raise v_error;
      end;
    end if;

    --se valida que el lote este o no nulo
    --en caso de estar nulo, se cree un nuevo lote
    if v_lte_simu is null or v_lte_simu = 0 then

      -- Registrar el lote
      begin
        insert into cb_g_procesos_simu_lote
          (cdgo_clnte, fcha_lte, id_fncnrio, obsrvcion, id_prcso_tpo)
        values
          (p_cdgo_clnte,
           sysdate,
           v_id_fncnrio,
           p_obsrvcion_lte,
           p_id_prcso_tpo)
        returning id_prcsos_smu_lte into v_lte_simu;
      exception
        when others then
          o_cdgo_rspsta  := 12;
          o_mnsje_rspsta := '' || o_cdgo_rspsta ||
                            ' Error al intentar generar el lote. ';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' ' || sqlerrm,
                                6);
          raise v_error;
      end;
    end if;

    p_lte_nvo := v_lte_simu;

    --Se verifica si el origen del sujeto es existente en la base de datos
    if v_cdgo_orgen_sjto = 'EX' then
      --SE REALIZA INSERCION del SUJETO EN EL LOTE
      begin
        insert into cb_g_procesos_simu_sujeto
          (id_prcsos_smu_lte,
           id_sjto,
           vlor_ttal_dda,
           rspnsbles,
           fcha_ingrso,
           id_impsto,
           id_impsto_sbmpsto)
        values
          (v_lte_simu,
           v_id_sjto,
           0,
           '-',
           sysdate,
           p_id_impsto,
           p_id_impsto_sbmpsto)
        returning id_prcsos_smu_sjto into v_id_prcso_smu_sjto;
      exception
        when others then
          o_cdgo_rspsta  := 13;
          o_mnsje_rspsta := '' || o_cdgo_rspsta ||
                            ' Error al intentar registrar sujeto #' ||
                            p_sjto_id;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' ' || sqlerrm,
                                6);
          raise v_error;
      end;

      --SE REALIZA CONSULTA PARA INSERTAR LOS RESPONSABLES
      --QUE ESTAN ASOCIADOS AL SUJETO
      for responsables in (SELECT  a.prmer_nmbre,
                                   a.sgndo_nmbre,
                                   a.prmer_aplldo,
                                   a.sgndo_aplldo,
                                   a.cdgo_idntfccion_tpo,
                                   a.idntfccion_rspnsble,
                                   a.prncpal_s_n,
                                   a.prcntje_prtcpcion,
                                   a.cdgo_tpo_rspnsble,
                                   -- Din¿mico: A -> C -> Configuraci¿n del Cliente
                                   NVL(a.id_pais, NVL(c.id_pais, d.id_pais)) AS id_pais,
                                   NVL(a.id_dprtmnto, NVL(c.id_dprtmnto, d.id_dprtmnto)) AS id_dprtmnto,
                                   NVL(a.id_mncpio, NVL(c.id_mncpio, d.id_mncpio)) AS id_mncpio,
                                   NVL(a.drccion, NVL(c.drccion, 'Sin Direcci¿n')) AS drccion,
                                   a.email
                            FROM v_si_i_sujetos_responsable a
                            JOIN si_c_sujetos b
                              ON a.id_sjto = b.id_sjto
                            JOIN v_si_i_sujetos_impuesto c
                              ON a.id_sjto_impsto = c.id_sjto_impsto
                            LEFT JOIN df_s_clientes d
                              ON d.cdgo_clnte = a.cdgo_clnte
                            WHERE a.cdgo_clnte = p_cdgo_clnte
                              AND a.id_sjto = v_id_sjto
                            GROUP BY a.prmer_nmbre,
                                     a.sgndo_nmbre,
                                     a.prmer_aplldo,
                                     a.sgndo_aplldo,
                                     a.cdgo_idntfccion_tpo,
                                     a.idntfccion_rspnsble,
                                     a.prncpal_s_n,
                                     a.prcntje_prtcpcion,
                                     a.cdgo_tpo_rspnsble,
                                     NVL(a.id_pais, NVL(c.id_pais, d.id_pais)),
                                     NVL(a.id_dprtmnto, NVL(c.id_dprtmnto, d.id_dprtmnto)),
                                     NVL(a.id_mncpio, NVL(c.id_mncpio, d.id_mncpio)),
                                     NVL(a.drccion, NVL(c.drccion, 'Sin Direcci¿n')),
                                     a.email) loop
        v_existe_tercero := 'N';

        if v_existe_tercero = 'N' then

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
               responsables.cdgo_idntfccion_tpo,
               responsables.idntfccion_rspnsble,
               responsables.prmer_nmbre,
               responsables.sgndo_nmbre,
               responsables.prmer_aplldo,
               responsables.sgndo_aplldo,
               responsables.prncpal_s_n,
               responsables.cdgo_tpo_rspnsble,
               responsables.prcntje_prtcpcion,
               responsables.id_pais,
               responsables.id_dprtmnto,
               responsables.id_mncpio,
               responsables.drccion,
               responsables.email);
          exception
            when others then
              o_cdgo_rspsta  := 14;
              o_mnsje_rspsta := '' || o_cdgo_rspsta ||
                                ' Error al intentar registrar el responsable ' ||
                                responsables.idntfccion_rspnsble;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta || ' ' || sqlerrm,
                                    6);
              raise v_error;
          end;
        end if;

      end loop;

    elsif v_cdgo_orgen_sjto = 'NE' then
      -- Si el origen del sujeto no existe en la base de datos
      for i in 1 .. v_sjtos_inxstntes.count loop

        --Registrar sujetos inexistentes
        begin
          v_cnsctvo_inxstntes := pkg_gn_generalidades.fnc_cl_consecutivo(p_cdgo_clnte,
                                                                         'CSI');

          insert into cb_g_prcss_sm_sjto_inxstnte
            (id_prcsos_smu_lte,
             id_sjto_inxstnte,
             vlor_ttal_dda,
             rspnsbles,
             fcha_ingrso,
             id_cnslta_rgla,
             indcdor_prcsdo)
          values
            (v_lte_simu, v_cnsctvo_inxstntes, 0, '-', systimestamp, 0, 'N')
          returning id_prcsos_smu_sjto_inxstnte into v_id_prcsos_smu_sjto_inxstnte;
        exception
          when others then
            o_cdgo_rspsta  := 15;
            o_mnsje_rspsta := '' || o_cdgo_rspsta ||
                              'Error al intentar registrar sujeto inexistente #' ||
                              v_cnsctvo_inxstntes;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' ' || sqlerrm,
                                  6);
            raise v_error;
        end;

        if v_sjtos_inxstntes(i).prmer_nmbre = '.' THEN
          v_nmbre_cmplto := v_sjtos_inxstntes(i).rzon_scial;
        else
          v_nmbre_cmplto := trim(trim(v_sjtos_inxstntes(i).prmer_nmbre) || ' ' ||
                                 trim(nvl(v_sjtos_inxstntes(i).sgndo_nmbre,
                                          '')) || ' ' ||
                                 trim(nvl(replace(v_sjtos_inxstntes(i).prmer_aplldo,
                                                  '.',
                                                  ''),
                                          '')) || ' ' ||
                                 trim(nvl(v_sjtos_inxstntes(i).sgndo_aplldo,
                                          '')));
        end if;

        begin
          insert into cb_g_prcss_simu_rspnsbl_inx
            (id_prcsos_smu_sjto_inxstnte,
             cdgo_idntfccion_tpo,
             idntfccion,
             prmer_nmbre,
             sgndo_nmbre,
             prmer_aplldo,
             sgndo_aplldo,
             id_pais_ntfccion,
             id_dprtmnto_ntfccion,
             id_mncpio_ntfccion,
             drccion_ntfccion,
             email,
             tlfno,
             cllar,
             prncpal_s_n,
             cdgo_tpo_rspnsble)
          values
            (v_id_prcsos_smu_sjto_inxstnte,
             v_sjtos_inxstntes            (i).cdgo_idntfccion_tpo,
             v_sjtos_inxstntes            (i).idntfccion,
             v_nmbre_cmplto,
             v_sjtos_inxstntes            (i).sgndo_nmbre,
             v_sjtos_inxstntes            (i).prmer_aplldo,
             v_sjtos_inxstntes            (i).sgndo_aplldo,
             null,
             null,
             null,
             v_sjtos_inxstntes            (i).drccion_ntfccion,
             v_sjtos_inxstntes            (i).email,
             v_sjtos_inxstntes            (i).tlfno,
             v_sjtos_inxstntes            (i).cllar,
             'S',
             null);
        exception
          when others then
            o_cdgo_rspsta  := 16;
            o_mnsje_rspsta := '' || o_cdgo_rspsta ||
                              ' Error al intentar registrar sujeto responsables inexistente #' ||
                              v_cnsctvo_inxstntes;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' ' || sqlerrm,
                                  6);
            raise v_error;
        end;
      end loop;

      -- Actualizamos Estado de Proceso del archivo de inexistentes cargado
      begin
        update et_g_procesos_carga
           set cdgo_prcso_estdo = 'FI', indcdor_prcsdo = 'S'
         where id_prcso_crga = p_id_prcso_crga;
      exception
        when others then
          o_cdgo_rspsta  := 17;
          o_mnsje_rspsta := '' || o_cdgo_rspsta ||
                            ' Error al actualiar et_g_procesos_carga. ';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' ' || sqlerrm,
                                6);
          raise v_error;
      end;
    end if;

    if v_cdgo_orgen_sjto = 'EX' then

      v_deuda_total := 0;

      -- RECORREMOS EL PARAMETRO "p_json_movimientos" QUE CONTIENE LOS DATOS del LA CARTERA del SUJETO --
      for movimientos in (select sujeto_impsto,
                                 vigencia,
                                 id_periodo,
                                 id_concepto,
                                 valor_capital,
                                 valor_interes,
                                 cdgo_clnte,
                                 id_impsto,
                                 id_impsto_sbmpsto,
                                 cdgo_mvmnto_orgn,
                                 id_orgen,
                                 id_mvmnto_fncro
                            from json_table((select p_json_movimientos
                                              from dual),
                                            '$[*]'
                                            columns(sujeto_impsto number path
                                                    '$.id_sjto_impsto',
                                                    vigencia number path
                                                    '$.vgncia',
                                                    id_periodo number path
                                                    '$.prdo',
                                                    id_concepto number path
                                                    '$.id_cncpto',
                                                    valor_capital number path
                                                    '$.vlor_sldo_cptal',
                                                    valor_interes number path
                                                    '$.vlor_intres',
                                                    cdgo_clnte number path
                                                    '$.cdgo_clnte',
                                                    id_impsto number path
                                                    '$.id_impsto',
                                                    id_impsto_sbmpsto number path
                                                    '$.id_impsto_sbmpsto',
                                                    cdgo_mvmnto_orgn varchar2 path
                                                    '$.cdgo_mvmnto_orgn',
                                                    id_orgen number path
                                                    '$.id_orgen',
                                                    id_mvmnto_fncro number path
                                                    '$.id_mvmnto_fncro'))) loop

        --SE INSERTAN LOS DATOS DE LA CARTERA ASOCIADA AL SUJETO
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
             id_mvmnto_fncro,
             id_prcsos_smu_lte

             )
          values
            (v_id_prcso_smu_sjto,
             movimientos.sujeto_impsto,
             movimientos.vigencia,
             movimientos.id_periodo,
             movimientos.id_concepto,
             movimientos.valor_capital,
             movimientos.valor_interes,
             movimientos.cdgo_clnte,
             movimientos.id_impsto,
             movimientos.id_impsto_sbmpsto,
             movimientos.cdgo_mvmnto_orgn,
             movimientos.id_orgen,
             movimientos.id_mvmnto_fncro,
             v_lte_simu);
        exception
          when others then
            o_cdgo_rspsta  := 18;
            o_mnsje_rspsta := '' || o_cdgo_rspsta ||
                              ' Error al intentar registrar datos de la cartera sujeto impuesto: ' ||
                              movimientos.sujeto_impsto || ' - vigencia: ' ||
                              movimientos.vigencia;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || ' ' || sqlerrm,
                                  6);
            raise v_error;
        end;

        v_deuda_total := v_deuda_total + (nvl(movimientos.valor_capital, 0) +
                         nvl(movimientos.valor_interes, 0));

      end loop;

      update cb_g_procesos_simu_sujeto
         set vlor_ttal_dda = v_deuda_total
       where id_prcsos_smu_sjto = v_id_prcso_smu_sjto;

    end if;

    if v_slccnar_sjto = 'S' then
      commit;
    else
      rollback;
    end if;

  exception
    when v_error then
      rollback;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);
      return;
  end prc_rg_slccion_cndtos_pntal;

  procedure prc_rg_prcsos_prssvo_trza(p_cdgo_clnte          in number,
                                      p_id_prcsos_smu_sjto  in number,
                                      p_id_prcsos_smu_lte   in number,
                                      p_id_sjto             in number,
                                      p_idntfccion_sjto     in varchar2,
                                      p_prcsos_perssvo_trza in clob,
                                      p_fcha_prcso          in date,
                                      p_id_usrio            in number,
                                      p_id_prcsos_prssvo    in number,
                                      p_id_prcso_prssvo_lte in number) as

    v_nl           number;
    v_nmbre_up     varchar2(100) := 'pkg_cb_proceso_persuasivo.prc_rg_prcsos_prssvo_trza';
    v_error        exception;
    o_cdgo_rspsta  number;
    o_mnsje_rspsta varchar2(4000);

  begin

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Entrando a la up:' || v_nmbre_up || ' en ' ||
                          systimestamp,
                          6);

    begin
      insert into cb_g_procesos_persuasivo_traza
        (id_prcsos_smu_sjto,
         id_prcsos_smu_lte,
         id_sjto,
         prcsos_perssvo_trza,
         fcha_prcso,
         id_usrio,
         id_prcsos_prssvo,
         id_prcso_prssvo_lte,
         idntfccion_sjto)
      values
        (p_id_prcsos_smu_sjto,
         p_id_prcsos_smu_lte,
         p_id_sjto,
         p_prcsos_perssvo_trza,
         p_fcha_prcso,
         p_id_usrio,
         p_id_prcsos_prssvo,
         p_id_prcso_prssvo_lte,
         p_idntfccion_sjto);
    exception
      when others then
        o_cdgo_rspsta  := 10;
        o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                          ', No se pudo insertar la traza. ';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'o_mnsje_rspsta' || sqlerrm,
                              6);
        raise v_error;
    end;

    update cb_g_procesos_simu_sujeto
       set indcdor_prcsdo = 'E'
     where id_prcsos_smu_sjto = p_id_prcsos_smu_sjto
       and id_prcsos_smu_lte = p_id_prcsos_smu_lte;

    update cb_g_procesos_persuasivo_json a
       set a.indcdor_prcsdo = 'E'
     where a.id_prcsos_smu_lte = p_id_prcsos_smu_lte
       and a.id_prcsos_smu_sjto = p_id_prcsos_smu_sjto;

    commit;
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Saliendo de la up:' || v_nmbre_up || ' en ' ||
                          systimestamp,
                          6);
  exception
    when v_error then
      rollback;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);
      return;
  end prc_rg_prcsos_prssvo_trza;

  procedure prc_rg_prssvo_mvmntos(p_cdgo_clnte          in number,
                                  p_id_prcsos_smu_sjto  in number,
                                  p_id_prcsos_smu_lte   in number,
                                  p_id_sjto             in number,
                                  p_id_usrio            in number,
                                  p_id_prcsos_prssvo    in number,
                                  p_id_prcso_prssvo_lte in number,
                                  o_cdgo_rspsta         out number,
                                  o_mnsje_rspsta        out varchar2) as

    v_nl       number;
    v_nmbre_up varchar2(100) := 'pkg_cb_proceso_persuasivo.prc_rg_prssvo_mvmntos';

    v_sldo_crtra       number;
    v_crtra_prcso      number;
    v_crtra_prscrpcion varchar2(1);
    v_obsrvcion        clob;
    v_error            exception;

  begin

    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'Se registr¿ la cartera con ¿xito';

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Entrando a ' || v_nmbre_up || ', con ' ||
                          p_id_prcsos_smu_sjto || ', ' || systimestamp,
                          6);
    --Recorremos los movimientos de cb_g_procesos_smu_mvmnto
    for movimientos in (select *
                          from cb_g_procesos_smu_mvmnto
                         where id_prcsos_smu_sjto = p_id_prcsos_smu_sjto) loop

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'Procesando sujeto ' ||
                            movimientos.id_sjto_impsto || ', vigencia' ||
                            movimientos.vgncia || ', periodo ' ||
                            movimientos.id_prdo || ', concepto ' ||
                            movimientos.id_cncpto,
                            6);

      --validamos si aun existe saldo en cartera
      v_sldo_crtra := 0;
      begin
        select sum(c.vlor_sldo_cptal + c.vlor_intres)
          into v_sldo_crtra
          from v_gf_g_cartera_x_concepto c
         where c.id_impsto = movimientos.id_impsto
           and c.id_impsto_sbmpsto = movimientos.id_impsto_sbmpsto
           and c.id_sjto_impsto = movimientos.id_sjto_impsto
           and c.vgncia = movimientos.vgncia
           and c.id_prdo = movimientos.id_prdo
           and c.id_cncpto = movimientos.id_cncpto
           and c.cdgo_mvnt_fncro_estdo != 'AN';


      exception
        when no_data_found then
          v_sldo_crtra := 0;
        when others then
          o_cdgo_rspsta  := 2;
          o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                            ', Presentado al consultar la cartera del sujeto ' ||
                            movimientos.id_sjto_impsto || ', y vigencia ' ||
                            movimientos.vgncia || ', ' || sqlerrm;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                o_mnsje_rspsta,
                                6);
          raise v_error;
      end;
      --validamos que la vigencia no se encuentre en proceso juridico
      v_crtra_prcso := 0;
      begin
        select 1
          into v_crtra_prcso
          from cb_g_procesos_jrdco_mvmnto d
         where d.id_impsto = movimientos.id_impsto
           and d.id_impsto_sbmpsto = movimientos.id_impsto_sbmpsto
           and d.id_sjto_impsto = movimientos.id_sjto_impsto
           and d.vgncia = movimientos.vgncia
           and d.id_prdo = movimientos.id_prdo
           and d.id_cncpto = movimientos.id_cncpto;
      exception
        when no_data_found then
          v_crtra_prcso := 0;
        when others then
          o_cdgo_rspsta  := 3;
          o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                            ', Presentado al consultar la cartera del sujeto ' ||
                            movimientos.id_sjto_impsto || ', y vigencia ' ||
                            movimientos.vgncia || ', ' || sqlerrm;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                o_mnsje_rspsta,
                                6);
          raise v_error;
      end;
      --Validamos que la vigencia no este en proceso de prescripcion
      v_crtra_prscrpcion := 'N';
      v_crtra_prscrpcion := pkg_cb_proceso_persuasivo.fnc_vl_estdo_prscrpcion_vgncia(p_id_sjto_impsto => movimientos.id_sjto_impsto,
                                                                                     p_vgncia         => movimientos.vgncia,
                                                                                     p_id_prdo        => movimientos.id_prdo);

      if (v_sldo_crtra > 0 and v_crtra_prcso = 0 and
         v_crtra_prscrpcion = 'N') then
        --insertamos la vigencia en cb_g_procesos_prssvo_mvmnto
        begin
          insert into cb_g_procesos_prssvo_mvmnto
            (id_prcsos_prssvo,
             id_sjto_impsto,
             vgncia,
             id_prdo,
             id_cncpto,
             cdgo_clnte,
             id_impsto,
             id_impsto_sbmpsto,
             cdgo_mvmnto_orgn,
             id_orgen,
             id_mvmnto_fncro,
             estdo)
          values
            (p_id_prcsos_prssvo,
             movimientos.id_sjto_impsto,
             movimientos.vgncia,
             movimientos.id_prdo,
             movimientos.id_cncpto,
             movimientos.cdgo_clnte,
             movimientos.id_impsto,
             movimientos.id_impsto_sbmpsto,
             movimientos.cdgo_mvmnto_orgn,
             movimientos.id_orgen,
             movimientos.id_mvmnto_fncro,
             'A');
        exception
          when others then
            o_cdgo_rspsta  := 1;
            o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                              ', fall¿ al registrar los movimeintos para ' ||
                              movimientos.id_sjto_impsto || ' y vigencia ' ||
                              movimientos.vgncia || ', ' || sqlerrm;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta,
                                  6);
            --registramos el error en la traza
            pkg_cb_proceso_persuasivo.prc_rg_prcsos_prssvo_trza(p_cdgo_clnte          => p_cdgo_clnte,
                                                                p_id_prcsos_smu_sjto  => p_id_prcsos_smu_sjto,
                                                                p_id_prcsos_smu_lte   => p_id_prcsos_smu_lte,
                                                                p_id_sjto             => p_id_sjto,
                                                                p_idntfccion_sjto     => null,
                                                                p_prcsos_perssvo_trza => o_mnsje_rspsta,
                                                                p_fcha_prcso          => systimestamp,
                                                                p_id_usrio            => p_id_usrio,
                                                                p_id_prcsos_prssvo    => p_id_prcsos_prssvo,
                                                                p_id_prcso_prssvo_lte => p_id_prcso_prssvo_lte);

            continue;
        end;
      else
        if v_sldo_crtra = 0 then
          v_obsrvcion := 'No existe saldo en cartera para el sujeto impuesto ' ||
                         movimientos.id_sjto_impsto || ' y la vigencia ' ||
                         movimientos.vgncia;
        elsif v_crtra_prcso > 0 then
          v_obsrvcion := 'Para el sujeto impuesto ' ||
                         movimientos.id_sjto_impsto || ' y vigencia ' ||
                         movimientos.vgncia ||
                         ', existe un proceso juridico en curso';
        elsif v_crtra_prscrpcion = 'S' then
          v_obsrvcion := 'Para el sujeto impuesto ' ||
                         movimientos.id_sjto_impsto || ' y vigencia ' ||
                         movimientos.vgncia ||
                         ', existe un proceso de prescripci¿n en curso';
        end if;
        --registramos el error en la traza
        pkg_cb_proceso_persuasivo.prc_rg_prcsos_prssvo_trza(p_cdgo_clnte          => p_cdgo_clnte,
                                                            p_id_prcsos_smu_sjto  => p_id_prcsos_smu_sjto,
                                                            p_id_prcsos_smu_lte   => p_id_prcsos_smu_lte,
                                                            p_id_sjto             => p_id_sjto,
                                                            p_idntfccion_sjto     => null,
                                                            p_prcsos_perssvo_trza => v_obsrvcion,
                                                            p_fcha_prcso          => systimestamp,
                                                            p_id_usrio            => p_id_usrio,
                                                            p_id_prcsos_prssvo    => p_id_prcsos_prssvo,
                                                            p_id_prcso_prssvo_lte => p_id_prcso_prssvo_lte);

      end if;

    end loop;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Saliendo de ' || v_nmbre_up || ', ' ||
                          systimestamp,
                          6);
  exception
    when v_error then
      rollback;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);
  end prc_rg_prssvo_mvmntos;

  procedure prc_rg_prcsos_prssvo(p_cdgo_clnte          in number,
                                 p_nmro_prcso          in number,
                                 p_vlor_ttal_dda       in number,
                                 p_id_fncnrio          in number,
                                 p_id_prcso_prssvo_lte in number,
                                 p_msvo                in varchar2,
                                 o_id_prcsos_prssvo    out number,
                                 o_cdgo_rspsta         out number,
                                 o_mnsje_rspsta        out varchar2) as

    v_nl       number;
    v_nmbre_up varchar2(100) := 'pkg_cb_proceso_persuasivo.prc_rg_prcsos_prssvo';
    v_error    exception;

  begin

    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'Se registr¿ la cartera con ¿xito';

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Entrando a ' || v_nmbre_up || ', ' || p_cdgo_clnte || p_nmro_prcso || p_vlor_ttal_dda|| p_id_prcso_prssvo_lte||
                          systimestamp,
                          6);
    begin
      -- Generar el proceso persuasivo
      insert into cb_g_procesos_persuasivo
        (cdgo_clnte,
         nmro_prcso,
         fcha_prcso,
         vlor_ttal_dda,
         cdgo_prcso_estdo,
         id_fncnrio,
         msvo,
         id_prcso_prssvo_lte)
      values
        (p_cdgo_clnte,
         p_nmro_prcso,
         sysdate,
         p_vlor_ttal_dda,
         'A',
         p_id_fncnrio,
         p_msvo,
         p_id_prcso_prssvo_lte)
      returning id_prcsos_prssvo into o_id_prcsos_prssvo;
    exception
      when others then
        rollback;
        o_cdgo_rspsta  := 20;
        o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                          ', al intentar registrar proceso ';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ', ' || sqlerrm,
                              6);

        raise v_error;
    end;

  exception
    when v_error then
      rollback;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);

  end prc_rg_prcsos_prssvo;

  procedure prc_el_prcsos_prssvo_json(p_cdgo_clnte        in number,
                                      p_id_prcsos_smu_lte in number,
                                      o_cdgo_rspsta       out number,
                                      o_mnsje_rspsta      out varchar2) as

    v_nl       number;
    v_nmbre_up varchar2(100) := 'pkg_cb_proceso_persuasivo.prc_rg_slccion_cndtos_pntal';
    v_error    exception;

  begin
    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'Proceso realizado con ¿xito';

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Entrando a la up ' || v_nmbre_up || ', ' ||
                          systimestamp,
                          6);

    begin
      delete cb_g_procesos_persuasivo_json
       where id_prcsos_smu_lte = p_id_prcsos_smu_lte;
    exception
      when others then
        o_cdgo_rspsta  := 1;
        o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                          ', no se pudo borrar el registro. ' || sqlerrm;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);
        raise v_error;
    end;

    commit;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Saliendo de la up ' || v_nmbre_up || '. ' ||
                          systimestamp,
                          6);
  exception
    when v_error then
      rollback;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);
  end prc_el_prcsos_prssvo_json;

  procedure prc_rg_proceso_persuasivo_lote(p_cdgo_clnte            in number,
                                           p_nmro_lte_prcso_prssvo in number,
                                           p_id_fncnrio            in number,
                                           o_id_prcso_prssvo_lte   out number,
                                           o_cdgo_rspsta           out number,
                                           o_mnsje_rspsta          out varchar2) as

    v_nl       number;
    v_nmbre_up varchar2(100) := 'pkg_cb_proceso_persuasivo.prc_rg_proceso_persuasivo_lote';
    v_error    exception;

  begin
    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'proceso realizado con ¿xito';

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Entrando a la up ' || v_nmbre_up || ', ' ||
                          systimestamp,
                          6);

    begin
      insert into cb_g_procesos_persuasvo_lte
        (cdgo_clnte, cnsctvo_lte, fcha_lte, obsrvcion_lte, id_fncnrio)
      values
        (p_cdgo_clnte,
         p_nmro_lte_prcso_prssvo,
         trunc(sysdate),
         'Lote de proceso persuasivo de fecha ' ||
         to_char(sysdate, 'yyyymmdd hh24:mm:ss'),
         p_id_fncnrio)
      returning id_prcso_prssvo_lte into o_id_prcso_prssvo_lte;
    exception
      when others then
        o_cdgo_rspsta  := 10;
        o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                          ', al intentar registrar lote persuasivo. ' ||
                          sqlerrm;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);
        raise v_error;
    end;

  exception
    when v_error then
      rollback;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);
  end prc_rg_proceso_persuasivo_lote;

  procedure prc_rg_proceso_persuasivo_dcmnto(p_cdgo_clnte              in number,
                                             p_id_prcsos_prssvo        in number,
                                             p_id_acto_tpo             in number,
                                             p_id_fncnrio              in number,
                                             p_id_plntlla              in number,
                                             p_dcmnto                  in clob,
                                             o_id_prcsos_prssvo_dcmnto out number,
                                             o_cdgo_rspsta             out number,
                                             o_mnsje_rspsta            out varchar2) as

    v_nl       number;
    v_nmbre_up varchar2(100) := 'pkg_cb_proceso_persuasivo.prc_rg_proceso_persuasivo_dcmnto';
    v_error    exception;

  begin
    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'proceso realizado con ¿xito';

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Entrando a la up ' || v_nmbre_up || ', ' ||
                          systimestamp,
                          6);

    begin
      insert into cb_g_procesos_prssvo_dcmnto
        (id_prcsos_prssvo,
         id_acto_tpo,
         fcha_rgstro,
         funcionario_firma,
         id_acto,
         id_acto_rqrdo,
         actvo,
         id_plntlla,
         dcmnto)
      values
        (p_id_prcsos_prssvo,
         p_id_acto_tpo,
         sysdate,
         p_id_fncnrio,
         null,
         null,
         'S',
         p_id_plntlla,
         p_dcmnto)
      returning id_prcsos_prssvo_dcmnto into o_id_prcsos_prssvo_dcmnto;
    exception
      when others then
        o_cdgo_rspsta  := 10;
        o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                          ', Error al intentar insertar documento de cobro persuasivo. ' ||
                          sqlerrm;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);
        raise v_error;
    end;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Saliendo de la up ' || v_nmbre_up || ', ' ||
                          systimestamp,
                          6);

  exception
    when v_error then
      rollback;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);
  end prc_rg_proceso_persuasivo_dcmnto;

  procedure prc_rg_proceso_persuasivo_rspsble(p_cdgo_clnte           in number,
                                              p_id_prcsos_prssvo     in number,
                                              p_cdgo_idntfccion_tpo  in varchar2,
                                              p_idntfccion           in varchar2,
                                              p_nmbre_cmplto         in varchar2,
                                              p_prncpal_s_n          in varchar2,
                                              p_cdgo_tpo_rspnsble    in varchar2,
                                              p_prcntje_prtcpcion    in varchar2,
                                              p_id_pais_ntfccion     in number,
                                              p_id_dprtmnto_ntfccion in number,
                                              p_id_mncpio_ntfccion   in number,
                                              p_drccion_ntfccion     in varchar2,
                                              p_email                in varchar2,
                                              p_tlfno                in varchar2,
                                              p_cllar                in varchar2,
                                              o_cdgo_rspsta          out number,
                                              o_mnsje_rspsta         out varchar2) as

    v_nl       number;
    v_nmbre_up varchar2(100) := 'pkg_cb_proceso_persuasivo.prc_rg_proceso_persuasivo_rspsble';
    v_error    exception;

  begin
    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'proceso realizado con ¿xito';

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Entrando a la up ' || v_nmbre_up || ', ' ||
                          systimestamp,
                          6);

    begin
      insert into cb_g_prcsos_prssvo_rspsble
        (id_prcsos_prssvo,
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
         email,
         tlfno,
         cllar,
         actvo)
      values
        (p_id_prcsos_prssvo,
         p_cdgo_idntfccion_tpo,
         p_idntfccion,
         p_nmbre_cmplto,
         '.',
         '.',
         '.',
         p_prncpal_s_n,
         p_cdgo_tpo_rspnsble,
         p_prcntje_prtcpcion,
         p_id_pais_ntfccion,
         p_id_dprtmnto_ntfccion,
         p_id_mncpio_ntfccion,
         p_drccion_ntfccion,
         p_email,
         p_tlfno,
         p_cllar,
         'S');
    exception
      when others then
        o_cdgo_rspsta  := 30;
        o_mnsje_rspsta := 'Error ' || o_cdgo_rspsta ||
                          ', al intentar registrar responsables. ' ||
                          sqlerrm;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);
        raise v_error;
    end;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Saliendo de la up ' || v_nmbre_up || ', ' ||
                          systimestamp,
                          6);

  exception
    when v_error then
      rollback;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);
  end prc_rg_proceso_persuasivo_rspsble;

  --Procedimiento que registra un archivo de candidatos para persuasivo
  --etl en la tabla et_g_procesos_carga AC 2025-01-16
  --Proceso 21
  procedure prc_rg_procesos_carga(p_cdgo_clnte        in number,
                                  p_id_crga           in number,
                                  p_id_impsto         in number,
                                  p_id_impsto_sbmpsto in number,
                                  p_vgncia            in number,
                                  p_id_prdo           in number,
                                  p_file_blob         in blob,
                                  p_file_name         in varchar2,
                                  p_file_mimetype     in varchar2,
                                  p_lneas_encbzdo     in number,
                                  p_id_usrio          in number,
                                  p_cdgo_prcso_estdo  in varchar2,
                                  p_id_adtria         in number default null,
                                  o_id_prcso_crga     out number,
                                  o_cdgo_rspsta       out number,
                                  o_mnsje_rspsta      out varchar2) as

    v_nmbre_up varchar2(200) := 'pkg_cb_proceso_persuasivo.prc_rg_procesos_carga';
    v_nl       number;
    v_error    exception;

  begin

    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'Registro exitoso.';

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Entrando a la up ' || v_nmbre_up || ', ' ||
                          systimestamp,
                          6);

    begin
      insert into et_g_procesos_carga
        (id_crga,
         cdgo_clnte,
         id_impsto,
         vgncia,
         file_blob,
         file_name,
         file_mimetype,
         cdgo_prcso_estdo,
         id_adtria,
         lneas_encbzdo,
         lneas_rsmen,
         id_impsto_sbmpsto,
         id_prdo,
         fcha_rgstro,
         id_usrio,
         indcdor_prcsdo,
         id_prcso_crga_pdre)
      values
        (p_id_crga,
         p_cdgo_clnte,
         p_id_impsto,
         p_vgncia,
         p_file_blob,
         p_file_name,
         p_file_mimetype,
         p_cdgo_prcso_estdo,
         p_id_adtria,
         p_lneas_encbzdo,
         0,
         p_id_impsto_sbmpsto,
         p_id_prdo,
         systimestamp,
         p_id_usrio,
         'N',
         null)
      returning id_prcso_crga into o_id_prcso_crga;
    exception
      when others then
        o_cdgo_rspsta  := 10;
        o_mnsje_rspsta := 'Error en 21-' || o_cdgo_rspsta ||
                          '. No fue posible insertar el registro. ' ||
                          sqlerrm;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);
        raise v_error;
    end;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Saliendo de la up ' || v_nmbre_up ||
                          ', con o_id_prcso_crga: ' || o_id_prcso_crga || '. ' ||
                          systimestamp,
                          6);
  exception
    when v_error then
      rollback;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);
      return;
  end prc_rg_procesos_carga;

  procedure prc_rg_actlza_rspnsble_prssvo(p_cdgo_clnte    in number,
                                          p_id_prcso_crga in number,
                                          p_id_lte        in number,
                                          o_cdgo_rspsta   out number,
                                          o_mnsje_rspsta  out varchar2) as

    v_nmbre_up varchar2(200) := 'pkg_cb_proceso_persuasivo.prc_rg_actlza_rspnsble_prssvo';
    v_nl       number;
    v_error    exception;

    v_et_g_procesos_carga et_g_procesos_carga%rowtype;

  begin
    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'Registro exitoso.';

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'Entrando a la up ' || v_nmbre_up || ', ' || systimestamp || p_id_prcso_crga,6);
    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'p_id_prcso_crga: ' || p_id_prcso_crga,6);
    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'p_id_lte: ' || p_id_lte,6);

    begin
      select a.*
        into v_et_g_procesos_carga
        from et_g_procesos_carga a
       where id_prcso_crga = p_id_prcso_crga;
    exception
      when others then
        o_cdgo_rspsta  := 2001;
        o_mnsje_rspsta := '' || o_cdgo_rspsta ||
                          ', Error al consultar informacion de carga en ETL';
        raise v_error;
    end;

    -- Cargar archivo al directorio

    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'Llamado a pk_etl.prc_carga_archivo_directorio '|| systimestamp ,6);


    pk_etl.prc_carga_archivo_directorio(p_file_blob => v_et_g_procesos_carga.file_blob,
                                        p_file_name => v_et_g_procesos_carga.file_name);

    -- Ejecutar proceso de ETL para cargar a tabla intermedia

    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'pk_etl.prc_carga_intermedia_from_dir '|| systimestamp ,6);

    pk_etl.prc_carga_intermedia_from_dir(p_cdgo_clnte    => p_cdgo_clnte,
                                         p_id_prcso_crga => p_id_prcso_crga);

    -- Cargar datos a Gestion

     pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'pk_etl.prc_carga_gestion '|| systimestamp ,6);

    pk_etl.prc_carga_gestion(p_cdgo_clnte    => p_cdgo_clnte,
                             p_id_prcso_crga => p_id_prcso_crga);

    -- ****************** FIN ETL **********************************

    pkg_cb_proceso_persuasivo.prc_ac_prcso_simu_rspnsbles(p_cdgo_clnte   => p_cdgo_clnte,
                                                          p_nmro_lte     => p_id_lte,
                                                          p_id_prcso_crga=> p_id_prcso_crga,
                                                          o_cdgo_rspsta  => o_cdgo_rspsta,
                                                          o_mnsje_rspsta => o_mnsje_rspsta);

    if (o_cdgo_rspsta <> 0) then
      raise v_error;
    end if;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Saliendo de la up ' || v_nmbre_up || ', ' ||
                          systimestamp,
                          6);
  exception
    when v_error then
      rollback;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);
      return;
  end prc_rg_actlza_rspnsble_prssvo;

  procedure prc_ac_prcso_simu_rspnsbles(p_cdgo_clnte   in number,
                                        p_nmro_lte     in mc_g_actualizar_cnddtos.clmuna16%type,
                                        p_id_prcso_crga in mc_g_actualizar_cnddtos.ID_PRCSO_CRGA%type,
                                        o_cdgo_rspsta  out number,
                                        o_mnsje_rspsta out varchar2) as

    v_nmbre_up varchar2(200) := 'pkg_cb_proceso_persuasivo.prc_ac_prcso_simu_rspnsbles';
    v_nl       number;
    v_error    exception;


    cursor c_act_sjto(p_nmro_lte mc_g_actualizar_cnddtos.clmuna16%type,
                      p_id_prcso_crga mc_g_actualizar_cnddtos.ID_PRCSO_CRGA%type) is
      select clumna1  as identificacion_sujeto,
             clumna2  as tipo,
             clumna3  as identificacion,
             clumna4  as tipo_responsable,
             clumna5  as primer_nombre,
             clumna6  as segundo_nombre,
             clumna7  as primer_apellido,
             clumna8  as segundo_apellido,
             clumna9  as pais,
             clumna10 as dpto,
             clumna11 as municipio,
             clumna12 as direccion,
             clumna13 as telefono,
             clumna14 as celular,
             clumna15 as email,
             clmuna16 as idlote
        from mc_g_actualizar_cnddtos
       where clmuna16 = p_nmro_lte
         and id_prcso_crga = p_id_prcso_crga
         and indcdor_prcsdo <> 'E';

    cursor c_duplicados(p_nmro_lte in mc_g_actualizar_cnddtos.clmuna16%type) is
      select count(*) conteo, clumna3 identificador
        from mc_g_actualizar_cnddtos
       where clmuna16 = p_nmro_lte
       group by clumna3
      having count(*) > 1;

    v_counter         number := 0; -- contador para los commits
    v_commit_interval number := 100; -- intervalo de commit

  begin

    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'Registro exitoso.';

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,  null,  v_nmbre_up,  v_nl, 'Entrando a la up ' || v_nmbre_up || ', ' ||  systimestamp,  6);

    -- depueraci¿n de duplicados
    /*for reg in c_duplicados(p_nmro_lte) loop
      update mc_g_actualizar_cnddtos
         set indcdor_prcsdo = 'E'
       where clumna3 = reg.identificador;
    end loop;*/

    -- procesamiento de registros
    for reg in c_act_sjto(p_nmro_lte, p_id_prcso_crga) loop
      begin
        update cb_g_procesos_simu_rspnsble
           set cdgo_idntfccion_tpo  = reg.tipo,
               prmer_nmbre          = reg.primer_nombre,
               sgndo_nmbre          = reg.segundo_nombre,
               prmer_aplldo         = reg.primer_apellido,
               sgndo_aplldo         = reg.segundo_apellido,
               id_pais_ntfccion     = to_number(reg.pais),
               id_dprtmnto_ntfccion = to_number(reg.dpto),
               id_mncpio_ntfccion   = to_number(reg.municipio),
               drccion_ntfccion     = reg.direccion,
               email                = reg.email,
               tlfno                = reg.telefono,
               cllar                = reg.celular,
               prncpal_s_n          = reg.tipo_responsable,
               cdgo_tpo_rspnsble    = reg.tipo_responsable
         where idntfccion = reg.identificacion;

        -- incrementa el contador y hace commit si se alcanza el intervalo
        v_counter := v_counter + 1;
        if v_counter >= v_commit_interval then
          commit;
          v_counter := 0; -- reiniciar el contador
        end if;

        -- verificar si el registro fue actualizado
        if sql%rowcount = 0 then
          o_cdgo_rspsta  := 2101;
          o_mnsje_rspsta := '' || o_cdgo_rspsta ||
                            ', No se encontr¿ registro para actualizar con identificacion: ' ||
                            reg.identificacion;
        else
          o_cdgo_rspsta  := 0;
          o_mnsje_rspsta := '' || o_cdgo_rspsta ||
                            'registro actualizado para identificacion: ' ||
                            reg.identificacion;
        end if;

      exception
        when others then
          o_cdgo_rspsta  := 2102;
          o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta ||
                            '. al actualizar identificacion: ' ||
                            reg.identificacion || ' - ' || sqlerrm;
          raise v_error;
      end;
    end loop;
    commit;
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Saliendo de la up ' || v_nmbre_up || ', ' ||
                          systimestamp,
                          6);
  exception
    when v_error then
      rollback;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);
      return;
  end prc_ac_prcso_simu_rspnsbles;

    procedure prc_rg_simu_sujeto(p_cdgo_clnte         in number,
                                 p_id_prcsos_smu_lte  in number,
                                 p_id_sjto            in number,
                                 p_vlor_ttal_dda      in number,
                                 p_id_impsto          in number,
                                 p_id_impsto_sbmpsto  in number,
                                 p_id_usrio           in number,
                                 p_idntfccion         in varchar2,
                                 o_id_prcsos_smu_sjto out number,
                                 o_cdgo_rspsta        out number,
                                 o_mnsje_rspsta       out varchar2) as

        v_nl       number;
		v_nmbre_up varchar2(70) := 'pkg_cb_proceso_persuasivo.prc_rg_simu_sujeto';

    begin
        o_cdgo_rspsta := 0;
        o_mnsje_rspsta := 'Sujeto registrado con ¿xito.';

        v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'Entrando a la up ' || v_nmbre_up || ', ' || systimestamp, 6);

        begin
            insert into cb_g_procesos_simu_sujeto
              (id_prcsos_smu_lte,
               id_sjto,
               vlor_ttal_dda,
               rspnsbles,
               fcha_ingrso,
               indcdor_prcsdo,
               id_impsto,
               id_impsto_sbmpsto)
            values
              (p_id_prcsos_smu_lte,
               p_id_sjto,
               p_vlor_ttal_dda,
               '-',
               systimestamp,
               'N',
               p_id_impsto,
               p_id_impsto_sbmpsto)
            returning id_prcsos_smu_sjto into o_id_prcsos_smu_sjto;
        exception
            when others then
                o_cdgo_rspsta  := 19;
                o_mnsje_rspsta := 'Error al intentar incluir sujeto en el lote de selecci¿n. ' || sqlerrm;
                --insertamos en la traza
                pkg_cb_proceso_persuasivo.prc_rg_prcsos_prssvo_trza(p_cdgo_clnte          => p_cdgo_clnte,
                                                                    p_id_prcsos_smu_sjto  => null,
                                                                    p_id_prcsos_smu_lte   => p_id_prcsos_smu_lte,
                                                                    p_id_sjto             => p_id_sjto,
                                                                    p_idntfccion_sjto     => p_idntfccion,
                                                                    p_prcsos_perssvo_trza => o_mnsje_rspsta,
                                                                    p_fcha_prcso          => systimestamp,
                                                                    p_id_usrio            => p_id_usrio,
                                                                    p_id_prcsos_prssvo    => null,
                                                                    p_id_prcso_prssvo_lte => null);
                pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, o_mnsje_rspsta || ', ' || sqlerrm, 6);
        end;
    end prc_rg_simu_sujeto;

    procedure prc_rg_simu_responsable(p_cdgo_clnte         in number,
                                      p_id_sjto_impsto     in number,
                                      p_id_prcso_crga      in number,
                                      p_id_lte_prcso       in number,
                                      p_id_prcsos_smu_sjto in number,
                                      p_idntfccion_sjto    in number,
                                      p_id_usrio           in number,
                                      p_id_sjto            in number,
                                      o_cdgo_rspsta        out number,
                                      o_mnsje_rspsta       out varchar2) as

        v_nmro_rgstros number := 0;
        v_nl       number;
		v_nmbre_up varchar2(70) := 'pkg_cb_proceso_persuasivo.prc_rg_simu_responsable';

    begin

        v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'Entrando a la up ' || v_nmbre_up || ', ' || systimestamp, 6);

        for c_rspnsbles in ( select a.prmer_nmbre,
                                    a.sgndo_nmbre,
                                    a.prmer_aplldo,
                                    a.sgndo_aplldo,
                                    a.cdgo_idntfccion_tpo,
                                    a.idntfccion_rspnsble,
                                    a.prncpal_s_n,
                                    a.prcntje_prtcpcion,
                                    a.cdgo_tpo_rspnsble,
                                    decode(a.id_pais,
                                            null,
                                            c.id_pais,
                                            c.id_pais_ntfccion) as id_pais_ntfccion,
                                    decode(a.id_dprtmnto,
                                            null,
                                            c.id_dprtmnto_ntfccion,
                                            c.id_dprtmnto) as id_dprtmnto_ntfccion,
                                    decode(a.id_mncpio,
                                            null,
                                            c.id_mncpio,
                                            c.id_mncpio_ntfccion) as id_mncpio_ntfccion,
                                    decode(a.drccion,
                                            null,
                                            c.drccion_ntfccion,
                                            c.drccion) as drccion_ntfccion,
                                    nvl(b.email, a.email) email
                            from v_si_i_sujetos_responsable a
                            join gn_g_candidatos_carga_prssvo b on b.idntfccion = a.idntfccion_sjto
                                                                    and b.id_prcso_crga = p_id_prcso_crga
                                                                    and b.id_lte_prcso = p_id_lte_prcso
                            join v_si_i_sujetos_impuesto c on c.id_sjto_impsto = a.id_sjto_impsto
                            where a.id_sjto_impsto = p_id_sjto_impsto
                            group by a.prmer_nmbre,
                                     a.sgndo_nmbre,
                                     a.prmer_aplldo,
                                     a.sgndo_aplldo,
                                     a.cdgo_idntfccion_tpo,
                                     a.idntfccion_rspnsble,
                                     a.prncpal_s_n,
                                     a.prcntje_prtcpcion,
                                     a.cdgo_tpo_rspnsble,
                                     decode(a.id_pais,
                                           null,
                                           c.id_pais,
                                           c.id_pais_ntfccion),
                                     decode(a.id_dprtmnto,
                                           null,
                                           c.id_dprtmnto_ntfccion,
                                           c.id_dprtmnto),
                                     decode(a.id_mncpio,
                                           null,
                                           c.id_mncpio,
                                           c.id_mncpio_ntfccion),
                                     decode(a.drccion,
                                           null,
                                           c.drccion_ntfccion,
                                           c.drccion),
                                     b.email,
                                     a.email)
        loop
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
                     email,
                     id_prcsos_smu_lte)
                values
                    (p_id_prcsos_smu_sjto,
                     c_rspnsbles.cdgo_idntfccion_tpo,
                     c_rspnsbles.idntfccion_rspnsble,
                     c_rspnsbles.prmer_nmbre,
                     c_rspnsbles.sgndo_nmbre,
                     c_rspnsbles.prmer_aplldo,
                     c_rspnsbles.sgndo_aplldo,
                     c_rspnsbles.prncpal_s_n,
                     c_rspnsbles.cdgo_tpo_rspnsble,
                     c_rspnsbles.prcntje_prtcpcion,
                     c_rspnsbles.id_pais_ntfccion,
                     c_rspnsbles.id_dprtmnto_ntfccion,
                     c_rspnsbles.id_mncpio_ntfccion,
                     c_rspnsbles.drccion_ntfccion,
                     c_rspnsbles.email,
                     p_id_lte_prcso);
            exception
                when others then
                    o_cdgo_rspsta  := 20;
                    o_mnsje_rspsta := 'Error No. ' || o_cdgo_rspsta || ', mientras se intentaba incluir al responsable con identificaci¿n # ' ||c_rspnsbles.idntfccion_rspnsble;
                    --insertamos en la traza
                    pkg_cb_proceso_persuasivo.prc_rg_prcsos_prssvo_trza(p_cdgo_clnte          => p_cdgo_clnte,
                                                                        p_id_prcsos_smu_sjto  => p_id_prcsos_smu_sjto,
                                                                        p_id_prcsos_smu_lte   => p_id_lte_prcso,
                                                                        p_id_sjto             => p_id_sjto,
                                                                        p_idntfccion_sjto     => p_idntfccion_sjto,
                                                                        p_prcsos_perssvo_trza => o_mnsje_rspsta || ', ' || sqlerrm,
                                                                        p_fcha_prcso          => systimestamp,
                                                                        p_id_usrio            => p_id_usrio,
                                                                        p_id_prcsos_prssvo    => null,
                                                                        p_id_prcso_prssvo_lte => null);
                    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, o_mnsje_rspsta || ', ' || sqlerrm, 6);
                    continue;
            end;
            v_nmro_rgstros := v_nmro_rgstros + 1;
        end loop;

        if v_nmro_rgstros > 0 then
            o_cdgo_rspsta := 0;
            o_mnsje_rspsta := 'Registro de responsables exitoso.';
        else
            o_cdgo_rspsta := -20078;
            o_mnsje_rspsta := 'No fue posible el Registro de los responsables.';
        end if;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'Saliendo de la up ' || v_nmbre_up || ', ' || systimestamp, 6);
    end prc_rg_simu_responsable;

    procedure prc_rg_simu_movimientos(p_cdgo_clnte         in number,
                                      p_id_impsto          in number,
                                      p_id_impsto_sbmpsto  in number,
                                      p_id_sjto_impsto     in number,
                                      p_vgncia_dsde        in number,
                                      p_vgncia_hsta        in number,
                                      p_id_prcsos_smu_sjto in number,
                                      p_id_prcsos_smu_lte  in number,
                                      p_idntfccion_sjto    in varchar2,
                                      p_id_usrio           in number,
                                      o_cdgo_rspsta        out number,
                                      o_mnsje_rspsta       out varchar2) as

        v_nmro_rgstros number := 0;
        v_nl       number;
		v_nmbre_up varchar2(70) := 'pkg_cb_proceso_persuasivo.prc_rg_simu_movimientos';

    begin

        v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'Entrando a la up ' || v_nmbre_up || ', ' || systimestamp, 6);

        for c_mvmntos in (select id_sjto_impsto,
                                 vgncia,
                                 id_prdo,
                                 id_cncpto,
                                 vlor_sldo_cptal,
                                 vlor_intres,
                                 cdgo_clnte,
                                 id_impsto,
                                 id_impsto_sbmpsto,
                                 cdgo_mvmnto_orgn,
                                 id_orgen,
                                 id_mvmnto_fncro
                          from v_gf_g_cartera_x_concepto
                          where cdgo_clnte = p_cdgo_clnte
                          and id_impsto = p_id_impsto
                          and id_impsto_sbmpsto = p_id_impsto_sbmpsto
                          and id_sjto_impsto = p_id_sjto_impsto
                          and vgncia between p_vgncia_dsde and p_vgncia_hsta
                          and (vlor_sldo_cptal + vlor_intres) > 0
                          and cdgo_mvnt_fncro_estdo = 'NO' -- Cartera Normalizada
                        )
        loop

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
                     id_mvmnto_fncro,
                     id_prcsos_smu_lte)
                values
                    (p_id_prcsos_smu_sjto,
                     c_mvmntos.id_sjto_impsto,
                     c_mvmntos.vgncia,
                     c_mvmntos.id_prdo,
                     c_mvmntos.id_cncpto,
                     c_mvmntos.vlor_sldo_cptal,
                     c_mvmntos.vlor_intres,
                     c_mvmntos.cdgo_clnte,
                     c_mvmntos.id_impsto,
                     c_mvmntos.id_impsto_sbmpsto,
                     c_mvmntos.cdgo_mvmnto_orgn,
                     c_mvmntos.id_orgen,
                     c_mvmntos.id_mvmnto_fncro,
                     p_id_prcsos_smu_lte);
            exception
                when others then
                    o_cdgo_rspsta  := 21;
                    o_mnsje_rspsta := 'Error mientras se intentaba incluir movimientos de cartera al sujeto #' || p_id_prcsos_smu_sjto;
                    --insertamos en la traza
                    pkg_cb_proceso_persuasivo.prc_rg_prcsos_prssvo_trza(p_cdgo_clnte          => p_cdgo_clnte,
                                                                        p_id_prcsos_smu_sjto  => p_id_prcsos_smu_sjto,
                                                                        p_id_prcsos_smu_lte   => p_id_prcsos_smu_lte,
                                                                        p_id_sjto             => null,
                                                                        p_idntfccion_sjto     => p_idntfccion_sjto,
                                                                        p_prcsos_perssvo_trza => o_mnsje_rspsta || ', ' || sqlerrm,
                                                                        p_fcha_prcso          => systimestamp,
                                                                        p_id_usrio            => p_id_usrio,
                                                                        p_id_prcsos_prssvo    => null,
                                                                        p_id_prcso_prssvo_lte => null);
                    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, o_mnsje_rspsta || ', ' || sqlerrm, 6);
                    continue;
            end;
            v_nmro_rgstros := v_nmro_rgstros + 1;
        end loop;

        if v_nmro_rgstros > 0 then
            o_cdgo_rspsta := 0;
            o_mnsje_rspsta := 'Registro de movimientos exitoso.';
        else
            o_cdgo_rspsta := -20079;
            o_mnsje_rspsta := 'No fue posible el Registro de los movimientos.';
        end if;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nl, 'Saliendo de la up ' || v_nmbre_up || ', ' || systimestamp, 6);
    end prc_rg_simu_movimientos;

    procedure prc_el_simu_sujeto(p_id_prcsos_smu_sjto in number,
                                 p_id_prcsos_smu_lte  in number) as

        PRAGMA autonomous_transaction;

    begin
        delete cb_g_procesos_smu_mvmnto where id_prcsos_smu_sjto = p_id_prcsos_smu_sjto and id_prcsos_smu_lte = p_id_prcsos_smu_lte;
        delete cb_g_procesos_simu_rspnsble where id_prcsos_smu_sjto = p_id_prcsos_smu_sjto and id_prcsos_smu_lte = p_id_prcsos_smu_lte;
        delete cb_g_procesos_simu_sujeto where id_prcsos_smu_sjto = p_id_prcsos_smu_sjto and id_prcsos_smu_lte = p_id_prcsos_smu_lte;
        commit;
    end prc_el_simu_sujeto;

end pkg_cb_proceso_persuasivo;
/

