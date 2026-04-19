prompt --application/shared_components/reports/report_queries/reporte_criticas_cinta
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(54255898995963815)
,p_name=>'Reporte Criticas Cinta'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'         to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,',
'      ',
'       a.file_mimetype',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) ',
' where a.cdgo_clnte = 1',
'   and a.cdgo_imgen_clnte = ''L_E'''))
,p_report_layout_id=>wwv_flow_api.id(54613634220154962)
,p_format=>'PDF'
,p_output_file_name=>'Reporte Criticas Cinta'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54847816947394346)
,p_shared_query_id=>wwv_flow_api.id(54255898995963815)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'         to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,',
'      ',
'       a.file_mimetype',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) ',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54848081277394346)
,p_shared_query_id=>wwv_flow_api.id(54255898995963815)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- grafica Registros Enviados vs Predios Cargados',
'select ''Registros Enviados'' AS c_env_vs_carg',
'       ,count(*) as v_env_vs_carg',
'       ,''Registros enviados y Predios Recibidos'' as e_env_vs_carg',
'  from gi_g_cinta_igac ',
' where id_prcso_crga = :P40_ARCHIVO',
'union all ',
'select ''Predios Cargados'' as c_env_vs_carg',
'       ,count(*) as v_env_vs_carg',
'       ,''Registros enviados y Predios Recibidos'' as e_env_vs_carg',
'  from v_gi_g_cinta_igac  ',
' where nmro_orden_igac = ''001'' ',
'   and id_prcso_crga =  :P40_ARCHIVO',
' group by file_name '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54848292892394346)
,p_shared_query_id=>wwv_flow_api.id(54255898995963815)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--grafica Predios por vigencia',
'select count(*) as v_predios_x_vig',
'       ,vgncia as c_predios_x_vig',
'       ,''Predios por vigencia'' as e_predios_x_vig',
'  from v_gi_g_cinta_igac a',
' where a.nmro_orden_igac = ''001'' ',
'   and a.vgncia in ( :P40_VGNCIA, ( :P40_VGNCIA - 1 ) )',
'   and a.cdgo_clnte = :F_CDGO_CLNTE',
' group by vgncia',
' order by 2;',
'',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54848474058394347)
,p_shared_query_id=>wwv_flow_api.id(54255898995963815)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' --Predios Cargados',
'select count(*) as v_predios_cargados',
'  from v_gi_g_cinta_igac  ',
' where nmro_orden_igac = ''001'' ',
'   and id_prcso_crga =  :P40_ARCHIVO',
' group by file_name  '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54848635646394347)
,p_shared_query_id=>wwv_flow_api.id(54255898995963815)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Registros Enviados',
'select count(*) as v_predios_enviados',
'       ,''Registros enviados y Predios Recibidos'' as e_env_vs_carg',
'  from gi_g_cinta_igac ',
' where id_prcso_crga = :P40_ARCHIVO'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54848823037394347)
,p_shared_query_id=>wwv_flow_api.id(54255898995963815)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- grafica Incremento en predios entre vigencia Anterior y Actual',
'select ''Incremento en predios entre vigencia Anterior y Actual'' AS c_incremento_predios',
'       ,sum(case when vgncia = 2018 then incremento',
'                 else -incremento end) AS v_incremento_predios',
'       ,''Consolidado de Registros y Predios Recibidos'' as e_incremento_predios',
'  from (',
'        select count(*) as incremento, vgncia',
'          from v_gi_g_cinta_igac a',
'         where a.nmro_orden_igac = ''001'' ',
'           and a.vgncia in ( :P40_VGNCIA, ( :P40_VGNCIA - 1 ) )',
'           and a.cdgo_clnte = :F_CDGO_CLNTE',
'         group by vgncia',
'       )'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54849003637394347)
,p_shared_query_id=>wwv_flow_api.id(54255898995963815)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Incremento en Predios Nuevos',
'select ''Incremento en Predios Nuevos'' AS c_incrmnto_prdos_n',
'       ,count(*) AS v_incrmnto_prdos_n',
'       ,''Consolidado de Registros y Predios Recibidos'' as e_incrmnto_prdos_n',
'  from v_gi_g_cinta_igac a',
' where a.nmro_orden_igac = ''001''',
'   and a.cdgo_clnte = 1',
'   and a.vgncia = :P40_VGNCIA',
'   and not exists (select ''x''',
'                     from v_gi_g_cinta_igac c',
'                    where c.rfrncia_igac  = a.rfrncia_igac',
'                      and c.cdgo_clnte = 1',
'                      and c.vgncia = (:P40_VGNCIA - 1)',
'                   ) '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54849210970394347)
,p_shared_query_id=>wwv_flow_api.id(54255898995963815)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' --Predios por vigencia actual',
'select count(*) as v_vgnca_act',
'       ,vgncia as c_vgnca_act',
'       ,''Predios por vigencia'' as e_vgnca_act',
'  from v_gi_g_cinta_igac a',
' where a.nmro_orden_igac = ''001'' ',
'   and a.vgncia in (:P40_VGNCIA)',
'   and a.cdgo_clnte = :F_CDGO_CLNTE',
' group by vgncia',
' order by 2;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54849423765394347)
,p_shared_query_id=>wwv_flow_api.id(54255898995963815)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' --Predios por vigencia anterior',
'select count(*) as v_vgnca_ant',
'       ,vgncia as c_vgnca_ant',
'       ,''Predios por vigencia'' as e_vgnca_ant',
'  from v_gi_g_cinta_igac a',
' where a.nmro_orden_igac = ''001'' ',
'   and a.vgncia in ( ( :P40_VGNCIA - 1 ) )',
'   and a.cdgo_clnte = :F_CDGO_CLNTE',
' group by vgncia',
' order by 2;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54849658376394347)
,p_shared_query_id=>wwv_flow_api.id(54255898995963815)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' --Incremento predios entre vigencia anterior y actual Nuevos en la Cinta',
'select ''Incremento Predios entre Vigencia Anterior y Actual Nuevos en la Cinta'' AS e_icrmnto_prds_vig',
'       ,count(*) AS v_icrmnto_prds_vig',
'  from v_gi_g_cinta_igac a',
' where a.nmro_orden_igac = ''001'' ',
'   and a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.vgncia = :P40_VGNCIA',
'   and not exists ( ',
'                   select ''x'' ',
'                     from gi_g_cinta_igac c',
'                     join et_g_procesos_carga b',
'                       on a.id_prcso_crga = b.id_prcso_crga',
'                    where c.rfrncia_igac = a.rfrncia_igac ',
'                      and b.vgncia = (:P40_VGNCIA - 1)',
'                  )',
'   and not exists (',
'                   select ''x'' ',
'                     from v_si_i_sujetos_impuesto d',
'                    where d.idntfccion_sjto = a.rfrncia_igac',
'                      and d.cdgo_clnte = 1',
'                  )'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54849820890394347)
,p_shared_query_id=>wwv_flow_api.id(54255898995963815)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Comparativa predios nuevos, Conservados y Retirados',
'select  ''Tipos de Predios Procesados'' as Etiqueta_tpp,',
'        ''Predios Nuevos'' as Color_tpp',
'        , count(*) as nmro_predios_tpp',
'        , sum(a.avluo_igac) as Avluo_predios_tpp',
'        , REPLACE(ROUND(sum(a.avluo_igac)*100/FNC_CA_AVALUO_ARCHIVO_CARGA(:F_CDGO_CLNTE,:P40_ARCHIVO),4),'','',''.'') AS PORCENTAJE',
'  from v_gi_g_cinta_igac a',
' where a.nmro_orden_igac = ''001''',
'   and a.cdgo_clnte      = :F_CDGO_CLNTE',
'   and a.id_prcso_crga   = :P40_ARCHIVO',
'   and not exists ( ',
'                    select ''x'' ',
'                      from v_si_i_sujetos_impuesto b',
'                     where a.rfrncia_igac = b.idntfccion_sjto',
'                       and b.cdgo_clnte   = :F_CDGO_CLNTE',
'                  )',
'union ',
'select ''Tipos de Predios Procesados'' as Etiqueta_tpp,''Predios Conservan'' as Novedad',
'       , count(*)  as nmro_predios_tpp',
'       , sum(a.avluo_igac)as Avluo_predios_tpp',
'       , REPLACE(ROUND(sum(a.avluo_igac)*100/FNC_CA_AVALUO_ARCHIVO_CARGA(:F_CDGO_CLNTE,:P40_ARCHIVO),4),'','',''.'') AS PORCENTAJE',
'  from v_gi_g_cinta_igac a',
' where a.nmro_orden_igac = ''001''',
'   and a.cdgo_clnte      = :F_CDGO_CLNTE',
'   and a.id_prcso_crga   = :P40_ARCHIVO',
'   and exists ( ',
'                select ''x'' ',
'                  from v_si_i_sujetos_impuesto b',
'                 where b.idntfccion_sjto = a.rfrncia_igac',
'                   and b.cdgo_clnte      = :F_CDGO_CLNTE',
'              )',
'union ',
'select ''Tipos de Predios Procesados'' as Etiqueta_tpp, ''Predios Retirados'' as Novedad',
'       , count(*) as nmro_predios_tpp',
'       , sum(b.avluo_ctstral) as Avluo_predios_tpp',
'       , REPLACE(ROUND(sum(b.avluo_ctstral)*100/FNC_CA_AVALUO_ARCHIVO_CARGA(:F_CDGO_CLNTE,:P40_ARCHIVO),4),'','',''.'') AS PORCENTAJE',
'  from v_si_i_sujetos_impuesto a',
'  join v_si_i_predios b',
'    on a.id_sjto = b.id_sjto',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and not exists ( ',
'                     select ''x'' ',
'                       from v_gi_g_cinta_igac c',
'                      where c.nmro_orden_igac = ''001''',
'                        and c.cdgo_clnte      = :F_CDGO_CLNTE',
'                        and c.id_prcso_crga   = :P40_ARCHIVO',
'                        and c.rfrncia_igac    = a.idntfccion_sjto',
'                  );'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54850037497394347)
,p_shared_query_id=>wwv_flow_api.id(54255898995963815)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Estadisticas individuales predios nuevos',
'select count(*) as nmro_predios_nuevos',
'       ,sum(a.avluo_igac) as Avluo_predios_nuevos',
'       ,REPLACE(ROUND(sum(a.avluo_igac)*100/FNC_CA_AVALUO_ARCHIVO_CARGA(:F_CDGO_CLNTE,:P40_ARCHIVO),4),'','',''.'') AS PORCENTAJE_predios_nuevos',
'  from v_gi_g_cinta_igac a',
' where a.nmro_orden_igac = ''001''',
'   and a.cdgo_clnte      = :F_CDGO_CLNTE',
'   and a.id_prcso_crga   = :P40_ARCHIVO',
'   and not exists (',
'                    select ''x'' ',
'                      from v_si_i_sujetos_impuesto b',
'                     where a.rfrncia_igac = b.idntfccion_sjto',
'                       and b.cdgo_clnte   = :F_CDGO_CLNTE',
'                  )'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54850201952394347)
,p_shared_query_id=>wwv_flow_api.id(54255898995963815)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Estadisticas individuales predios conservados',
'select count(*)  as nmro_predios_CONSERVAN',
'       ,sum(a.avluo_igac)as Avluo_predios_CONSERVAN',
'        ,REPLACE(ROUND(sum(a.avluo_igac)*100/FNC_CA_AVALUO_ARCHIVO_CARGA(:F_CDGO_CLNTE,:P40_ARCHIVO),4),'','',''.'') AS PORCENTAJE_CONSERVAN',
'  from v_gi_g_cinta_igac a',
' where a.nmro_orden_igac = ''001''',
'   and a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_prcso_crga = :P40_ARCHIVO',
'   and exists (',
'                select ''x''',
'                from v_si_i_sujetos_impuesto b',
'                where b.idntfccion_sjto = a.rfrncia_igac',
'                and b.cdgo_clnte = :F_CDGO_CLNTE',
'              )',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54850447944394347)
,p_shared_query_id=>wwv_flow_api.id(54255898995963815)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' --Estadisticas individuales predios retirados',
'select count(*) as nmro_predios_RETIRADOS',
'       ,sum(b.avluo_ctstral) as Avluo_predios_RETIRADOS',
'       ,REPLACE(ROUND(sum(b.avluo_ctstral)*100/FNC_CA_AVALUO_ARCHIVO_CARGA(:F_CDGO_CLNTE,:P40_ARCHIVO),4),'','',''.'') AS PORCENTAJE_RETIRADOS',
'  from v_si_i_sujetos_impuesto a',
'  join v_si_i_predios b on a.id_sjto = b.id_sjto',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and not exists ( ',
'                    select ''x'' ',
'                      from v_gi_g_cinta_igac c',
'                     where c.nmro_orden_igac = ''001''',
'                       and c.cdgo_clnte = :F_CDGO_CLNTE',
'                       and c.id_prcso_crga = :P40_ARCHIVO',
'                       and c.rfrncia_igac = a.idntfccion_sjto',
'                  )'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54850617574394347)
,p_shared_query_id=>wwv_flow_api.id(54255898995963815)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' --Predios conservados activos o inactivos',
'select ''Predios Conservados'' AS e_prds_cnsrvds',
'       ,''Activos'' as c_prds_cnsrvds',
'       ,count(*) as v_prds_cnsrvds',
'  from v_gi_g_cinta_igac a',
' where a.nmro_orden_igac = ''001''',
'   and a.cdgo_clnte    = :F_CDGO_CLNTE',
'   and a.id_prcso_crga = :P40_ARCHIVO',
'   and exists (',
'                select ''x'' ',
'                from v_si_i_sujetos_impuesto b',
'                where b.idntfccion_sjto = a.rfrncia_igac',
'                and b.cdgo_clnte = :F_CDGO_CLNTE',
'                and b.cdgo_sjto_estdo = ''A''',
'              )',
'union',
'--Predios conservados inactivos',
'select ''Predios Conservados'' AS e_prds_cnsrvds',
'       ,''Inactivos'' as c_prds_cnsrvds',
'       ,count(*) as c_prds_cnsrvds',
'  from v_gi_g_cinta_igac a',
' where a.id_prcso_crga   = :P40_ARCHIVO',
'   and a.nmro_orden_igac = ''001''',
'   and exists (',
'                select ''x''',
'                from v_si_i_sujetos_impuesto b',
'                where b.idntfccion_sjto = a.rfrncia_igac',
'                and b.cdgo_clnte = :F_CDGO_CLNTE',
'                and b.cdgo_sjto_estdo = ''I''',
'              )'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54850845808394348)
,p_shared_query_id=>wwv_flow_api.id(54255898995963815)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--predios conservados activos',
'select ''Activos'' as c_conservados_activos',
'       ,count(*) as v_conservados_activos',
'  from v_gi_g_cinta_igac a',
' where a.nmro_orden_igac = ''001''',
'   and a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_prcso_crga = :P40_ARCHIVO',
'   and exists ( ',
'                select ''x'' ',
'                from v_si_i_sujetos_impuesto b',
'                where b.idntfccion_sjto = a.rfrncia_igac',
'                and b.cdgo_clnte = :F_CDGO_CLNTE',
'                and b.cdgo_sjto_estdo = ''A''',
'              )',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54851079205394348)
,p_shared_query_id=>wwv_flow_api.id(54255898995963815)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Predios conservados inactivos',
'select ''Inactivos'' as c_conservados_inactivos',
'       ,count(*) as v_conservados_inactivos',
'  from v_gi_g_cinta_igac a',
' where a.id_prcso_crga   = :P40_ARCHIVO',
'   and a.nmro_orden_igac = ''001''',
'   and exists (',
'                select ''x''',
'                from v_si_i_sujetos_impuesto b',
'                where b.idntfccion_sjto = a.rfrncia_igac',
'                and b.cdgo_clnte = :F_CDGO_CLNTE',
'                and b.cdgo_sjto_estdo = ''I''',
'              )'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54851242283394348)
,p_shared_query_id=>wwv_flow_api.id(54255898995963815)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('--Predios con aval\00FAos mayor a cero'),
unistr('select ''Predios con aval\00FAos mayor a cero'' as predios_avaluo_mayor'),
'       , count(*) as valor_predios_avaluos_mayor',
'  from gi_g_cinta_igac ',
' where id_prcso_crga   = :P40_ARCHIVO',
'   and nmro_orden_igac = ''001''',
'   and avluo_igac      > 0'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54851492422394348)
,p_shared_query_id=>wwv_flow_api.id(54255898995963815)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('--Predios con aval\00FAos igual a cero'),
unistr('select ''Predios con aval\00FAos igual a cero'' as predios_avaluo_cero'),
'        , count(*) as valor_predios_avaluos_cero',
'  from gi_g_cinta_igac ',
' where id_prcso_crga   = :P40_ARCHIVO',
'   and nmro_orden_igac = ''001''',
'   and avluo_igac      = 0'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54851613589394348)
,p_shared_query_id=>wwv_flow_api.id(54255898995963815)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--valor_total_avaluos',
'select sum(avluo_igac)as valor_total_avaluos',
'  from gi_g_cinta_igac c',
' where c.id_prcso_crga   = :P40_ARCHIVO',
'   and c.nmro_orden_igac = ''001'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54851851504394348)
,p_shared_query_id=>wwv_flow_api.id(54255898995963815)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Avaluos de Predios'' as etiqueta_predios_avaluo',
unistr('     ,''Predios con aval\00FAos mayor a cero'' as color_predios_avaluo'),
'     , count(*) as valor_predios_avaluos',
'  from gi_g_cinta_igac ',
' where id_prcso_crga   = :P40_ARCHIVO',
'   and nmro_orden_igac = ''001''',
'   and avluo_igac      > 0',
'   union all',
'   select ''Avaluos de Predios'' as etiqueta_predios_avaluo',
unistr('     ,''Predios con aval\00FAos igual a cero'' as color_predios_avaluo'),
'     , count(*) as valor_predios_avaluos',
'  from gi_g_cinta_igac ',
' where id_prcso_crga   = :P40_ARCHIVO',
'   and nmro_orden_igac = ''001''',
'   and avluo_igac      = 0'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54852039468394348)
,p_shared_query_id=>wwv_flow_api.id(54255898995963815)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--clases de predios',
'select a.clse as "Clase Predio"  ',
'       , count(*) as "No. Predios" ',
'       , sum(a.avluo_igac) as "Total Avaluos" ',
'       , sum( case when a.prdio_nvo = ''S'' ',
'                   then 1',
'                   else 0 ',
'                    end ) as "Nuevos"',
'       , sum( case when a.prdio_nvo = ''S'' ',
'                   then a.avluo_igac',
'                   else 0 ',
'                    end ) as "Total Avaluos Nuevos"',
'  from (   ',
'         select decode( substr( c.rfrncia_igac , 1 , 2 ) , ''00'' , 2 , 1 ) tipo ',
'                , decode( substr( c.rfrncia_igac , 1 , 2 ) , ''00'' , ''Rural'' , ''Urbano'' ) as clse ',
'                , c.avluo_igac ',
'                , nvl( p.prdio_nvo , ''S'' ) as prdio_nvo ',
'           from gi_g_cinta_igac c',
'           left join (',
'                       select ''N'' as prdio_nvo',
'                              , s.idntfccion',
'                         from si_i_predios p',
'                         join si_c_sujetos s',
'                           on p.id_sjto = s.id_sjto',
'                     ) p',
'                  on c.rfrncia_igac  = p.idntfccion',
'               where c.id_prcso_crga   = :P40_ARCHIVO',
'                 and c.nmro_orden_igac = ''001''',
'       ) a',
' group by a.tipo, a.clse',
' order by a.tipo;'))
);
end;
/
