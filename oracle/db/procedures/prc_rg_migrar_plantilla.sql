
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_RG_MIGRAR_PLANTILLA" ( p_db_link          in varchar2
                                                   , p_cdgo_clnte_orgen in number
                                                   , p_cdgo_clnte_dstno in number
                                                   , p_bsqda            in varchar2
                                                   , o_cdgo_rspsta      out number
                                                   , o_mnsje_rspsta     out varchar2 )
    as
        v_sql clob;
    begin
        v_sql :=    'declare
                        v_id_plntlla        number := ' || p_bsqda || ';
                        v_cdgo_clnte_o      number := ' || p_cdgo_clnte_orgen || ';
                        v_cdgo_clnte_d      number := ' || p_cdgo_clnte_dstno || ';
                        v_id_plntlla_cnslta number;
                        v_array_cnslta      json_array_t    := json_array_t(''[]'');
                        v_obj_cnslta        json_object_t;

                        r_gn_d_plantillas   gn_d_plantillas%rowtype;
                        r_gn_d_reportes     gn_d_reportes%rowtype;
                        r_gn_d_actos_tipo   gn_d_actos_tipo%rowtype;
                        v_id_rprte          number;
                        v_id_acto_tpo       number;
                        v_id_plntlla_d      number :=0;

                    begin

                        --BUSCAMOS LOS DATOS DE LA PLANTILLA ORIGEN
                        begin
                              select /*+ RESULT_CACHE */
                                     a.*
                                into r_gn_d_plantillas
                                from gn_d_plantillas@'|| p_db_link ||' a
                               where a.cdgo_clnte =  v_cdgo_clnte_o
                                 and a.id_plntlla =  v_id_plntlla;
                        exception
                            when no_data_found then
                                raise_application_error(-20001, ''Error no se encontro la plantilla origen'');
                        end;

                        --BUSCAMOS EL REPORTE ORIGEN
                        begin
                                select /*+ RESULT_CACHE */
                                        a.*
                                into r_gn_d_reportes
                                from gn_d_reportes@'|| p_db_link ||' a
                                where a.id_rprte = r_gn_d_plantillas.id_rprte;
                        exception
                            when no_data_found then
                                raise_application_error(-20001, ''Error no se encontro el reporte de la plantilla origen'');
                        end;

                        --BUSCAMOS EL TIPO DE ACTO ASOCIADO A LA PLANTILLA ORIGEN
                        begin
                                select /*+ RESULT_CACHE */
                                        a.*
                                into r_gn_d_actos_tipo
                                from gn_d_actos_tipo@'|| p_db_link ||' a
                               where a.id_acto_tpo = r_gn_d_plantillas.id_acto_tpo;
                        exception
                            when no_data_found then
                                raise_application_error(-20001, ''Error no se encontro el tipo de acto asociado a la plantilla origen'');
                        end;

                        --CONSULTAMOS SI EXISTE EL TIPO DE ACTO ASOCIADO A LA PLANTILLA DESTINO
                        begin
                            select id_acto_tpo
                              into v_id_acto_tpo
                              from gn_d_actos_tipo
                             where cdgo_acto_tpo = r_gn_d_actos_tipo.cdgo_acto_tpo;
                        exception
                            when no_data_found then
                                --INSERTAMOS EL TIPO DE ACTO
                                begin
                                    insert into gn_d_actos_tipo ( cdgo_clnte                         , cdgo_acto_tpo                            , dscrpcion                   , id_prcso
                                                                , indcdor_ntfccion                   , id_trd_srie_dcmnto_tpo                   , indcdr_ntfccion_atmtca)
                                                         values ( v_cdgo_clnte_d                     , r_gn_d_actos_tipo.cdgo_acto_tpo          , r_gn_d_actos_tipo.dscrpcion , r_gn_d_actos_tipo.id_prcso
                                                                , r_gn_d_actos_tipo.indcdor_ntfccion , 1                                        , r_gn_d_actos_tipo.indcdr_ntfccion_atmtca)
                                    returning id_acto_tpo into v_id_acto_tpo;
                                end;
                        end;

                        --CONSULTAMOS SI EXISTE EL REPORTE ASOCIADO A LA PLANTILLA DESTINO
                        begin
                            select id_rprte
                              into v_id_rprte
                              from gn_d_reportes
                             where lower(nmbre_rprte) = lower(r_gn_d_reportes.nmbre_rprte);
                        exception
                            when no_data_found then
                                --INSERTAMOS EL REPORTE
                                begin
                                    insert into gn_d_reportes ( id_prcso                    , cdgo_rprte_grpo                 , cdgo_frmto_tpo                 , cdgo_frmto_plntlla
                                                              , nmbre_rprte                 , nmbre_plntlla                   ,  nmbre_cnslta                  , indcdor_gnrco                      , actvo)
                                                       values ( r_gn_d_reportes.id_prcso    , r_gn_d_reportes.cdgo_rprte_grpo , r_gn_d_reportes.cdgo_frmto_tpo , r_gn_d_reportes.cdgo_frmto_plntlla
                                                              , r_gn_d_reportes.nmbre_rprte , r_gn_d_reportes.nmbre_plntlla   , r_gn_d_reportes.nmbre_cnslta   , r_gn_d_reportes.indcdor_gnrco      , r_gn_d_reportes.actvo)
                                    returning id_rprte into v_id_rprte;
                                end;
                        end;
                        --CONSULTAMOS SI EXISTE LA PLANTILLA EN EL DESTINO
                        begin
                            select count(1)
                              into v_id_plntlla_d
                              from gn_d_plantillas
                             where lower(dscrpcion) = lower(r_gn_d_plantillas.dscrpcion);
                            if v_id_plntlla_d = 0 then
                                    --MIGRAMOS LAS VARIABLES DE LAS PLANTILLAS
                                    begin
                                        for v in ( select a.*
                                                    from gn_d_plantillas_variable@' || p_db_link || ' a
                                                left join gn_d_plantillas_variable                    b  on b.cdgo_plntlla_vrble = a.cdgo_plntlla_vrble
                                                    where b.cdgo_plntlla_vrble is null
                                                )
                                        loop
                                            insert into gn_d_plantillas_variable( cdgo_plntlla_vrble  , nmbre  , dscrpcion  , tpo  , fncion  )
                                                                          values( v.cdgo_plntlla_vrble, v.nmbre, v.dscrpcion, v.tpo, v.fncion);
                                        end loop;
                                    end;

                                    --MIGRAMOS LA PLANTILLA DINÁMICA
                                    begin
                                        for c in (select a.*
                                                    from gn_d_plantillas@' || p_db_link || ' a
                                            left join gn_d_plantillas                        b on b.id_plntlla = a.id_plntlla
                                                 where a.cdgo_clnte = v_cdgo_clnte_o
                                                    and a.id_plntlla = v_id_plntlla
                                                    and b.id_plntlla is null)
                                        loop
                                            insert into gn_d_plantillas( id_plntlla    , cdgo_clnte     , id_acto_tpo
                                                                        , dscrpcion    , actvo          , dfcto
                                                                        , id_rprte     , fcha_incio     , fcha_fin
                                                                        , id_prcso     , tpo_plntlla    )
                                                                  values( c.id_plntlla , v_cdgo_clnte_d , v_id_acto_tpo
                                                                        , c.dscrpcion  , c.actvo        , c.dfcto
                                                                        , v_id_rprte   , c.fcha_incio   , c.fcha_fin
                                                                        , c.id_prcso   , c.tpo_plntlla);

                                            --MIGRAMOS LA CONSULTAS DE LA PLANTILLA DINÁMICA
                                            for s in (select *
                                                        from gn_d_plantillas_consulta@' || p_db_link || '
                                                    where id_plntlla = v_id_plntlla)
                                            loop
                                                insert into gn_d_plantillas_consulta( id_plntlla  , dscrpcion       , cnslta
                                                                                    , prmtros     , dscrpcion_crta  , tpo_cnslta )
                                                                            values( s.id_plntlla, s.dscrpcion     , s.cnslta
                                                                                    , s.prmtros   , s.dscrpcion_crta, s.tpo_cnslta)
                                                                            returning id_plntlla_cnslta
                                                                                into v_id_plntlla_cnslta;
                                                v_array_cnslta.append(json_object_t(json_object( key ''id_plntlla_cnslta_o''  value s.id_plntlla_cnslta
                                                                                               , key ''id_plntlla_cnslta_d''  value v_id_plntlla_cnslta)));
                                            end loop;

                                            --MIGRAMOS LOS PARRAFOS DE LA  PLANTILLA DINÁMICA
                                            for p in (select *
                                                        from gn_d_plantillas_parrafo@' || p_db_link || '
                                                    where id_plntlla = v_id_plntlla )
                                            loop

                                            for i in 0..v_array_cnslta.get_size -1
                                                loop
                                                    v_obj_cnslta := json_object_t(v_array_cnslta.get(i));
                                                    p.prrfo := replace( p.prrfo
                                                                    , ''<a href="''|| v_obj_cnslta.get_Number(''id_plntlla_cnslta_o'') ||  ''">''
                                                                    , ''<a href="''|| v_obj_cnslta.get_Number(''id_plntlla_cnslta_d'') ||  ''">'');
                                                end loop;
                                                insert into gn_d_plantillas_parrafo( id_plntlla  , dscrpcion  , prrfo  , orden  )
                                                                             values( p.id_plntlla, p.dscrpcion, p.prrfo, p.orden);
                                            end loop;
                                        end loop;
                                    end;
                            else
                                raise_application_error(-20001, ''Ya existe una plantilla con el mismo nombre en el sistema'');
                            end if;
                        end;
                    end;';

        begin
            execute immediate v_sql;
        exception
            when others then
                o_cdgo_rspsta   := 1;
                o_mnsje_rspsta  := o_cdgo_rspsta || '. No se pudo ejecutar la migracion. ERROR => ' || sqlerrm;
                rollback;
        end;
    end prc_rg_migrar_plantilla;
/

