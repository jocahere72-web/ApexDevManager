prompt --application/shared_components/reports/report_queries/reporte_de_criticas_cinta_prueba
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(52942424181673006)
,p_name=>'Reporte de Criticas Cinta_PRUEBA'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Registros Enviados'' AS color_c1',
'     , to_char( count(*) ,''999G999G999G999G999G999G990'' ) as valor_c1,',
'     ''Consolidado de Registros y Predios Recibidos'' as etiqueta_c1',
'  from gi_g_cinta_igac ',
' where id_prcso_crga = 10',
'union all ',
'select ''Predios Cargados'' as color,',
'    to_char(count(*),''999G999G999G999G999G999G990'') as valor,',
'    ''Consolidado de Registros y Predios Recibidos'' as etiqueta',
'   from v_gi_g_cinta_igac  ',
'  where nmro_orden_igac = ''001'' ',
'    and id_prcso_crga =  10',
'group by file_name ',
'union all',
' select ''Incremento en predios entre vigencia Anterior y Actual'' AS color, ',
'       to_char(sum(case when vgncia = 2018 then incremento',
'              else -incremento end),''999G999G999G999G999G999G990'') AS valor,',
'              ''Consolidado de Registros y Predios Recibidos'' as etiqueta',
'  from (',
'              select count(*) as incremento, vgncia',
'                from v_gi_g_cinta_igac a',
'               where a.nmro_orden_igac = ''001'' ',
'                 and a.vgncia          in ( 2018, ( 2018 - 1 ) )',
'                 and a.cdgo_clnte      = 1',
'                 group by vgncia',
'         )',
'union all',
'select ''Incremento en Predios Nuevos'' AS color, ',
'       to_char(count(*),''999G999G999G999G999G999G990'') AS valor,',
'       ''Consolidado de Registros y Predios Recibidos'' as etiqueta',
'  from v_gi_g_cinta_igac a',
' where a.nmro_orden_igac = ''001''',
'   and a.cdgo_clnte      = 1',
'   and a.vgncia          = 2018',
'   and not exists (',
'                    select ''x''',
'                     from v_gi_g_cinta_igac c',
'                    where c.rfrncia_igac  = a.rfrncia_igac',
'                      and c.cdgo_clnte      = 1',
'                      and c.vgncia        = (2018 - 1)',
'                   );'))
,p_format=>'PDF'
,p_output_file_name=>'Reporte de Criticas Cinta_PRUEBA'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54513466097590668)
,p_shared_query_id=>wwv_flow_api.id(52942424181673006)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Registros Enviados'' AS color_c1',
'     ,  count(*) as valor_c1,',
'     ''Consolidado de Registros y Predios Recibidos'' as etiqueta_c1',
'  from gi_g_cinta_igac ',
' where id_prcso_crga = 10',
'union all ',
'select ''Predios Cargados'' as color,',
'    count(*) as valor,',
'    ''Consolidado de Registros y Predios Recibidos'' as etiqueta',
'   from v_gi_g_cinta_igac  ',
'  where nmro_orden_igac = ''001'' ',
'    and id_prcso_crga =  10',
'group by file_name ',
'union all',
' select ''Incremento en predios entre vigencia Anterior y Actual'' AS color, ',
'       sum(case when vgncia = 2018 then incremento',
'              else -incremento end) AS valor,',
'              ''Consolidado de Registros y Predios Recibidos'' as etiqueta',
'  from (',
'              select count(*) as incremento, vgncia',
'                from v_gi_g_cinta_igac a',
'               where a.nmro_orden_igac = ''001'' ',
'                 and a.vgncia          in ( 2018, ( 2018 - 1 ) )',
'                 and a.cdgo_clnte      = 1',
'                 group by vgncia',
'         )',
'union all',
'select ''Incremento en Predios Nuevos'' AS color, ',
'       count(*) AS valor,',
'       ''Consolidado de Registros y Predios Recibidos'' as etiqueta',
'  from v_gi_g_cinta_igac a',
' where a.nmro_orden_igac = ''001''',
'   and a.cdgo_clnte      = 1',
'   and a.vgncia          = 2018',
'   and not exists (',
'                    select ''x''',
'                     from v_gi_g_cinta_igac c',
'                    where c.rfrncia_igac  = a.rfrncia_igac',
'                      and c.cdgo_clnte      = 1',
'                      and c.vgncia        = (2018 - 1)',
'                   );'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54513619960590668)
,p_shared_query_id=>wwv_flow_api.id(52942424181673006)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*) as valor_c2, vgncia as color_c2,''Predios por vigencia'' as etiqueta_c2',
'                from v_gi_g_cinta_igac a',
'               where a.nmro_orden_igac = ''001'' ',
'                 and a.vgncia          in ( 2018, ( 2018 - 1 ) )',
'                 and a.cdgo_clnte      = 1',
'                 group by vgncia',
'                 order by 2;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54513830991590668)
,p_shared_query_id=>wwv_flow_api.id(52942424181673006)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Registros Enviados'' AS color_c1',
'     ,  count(*) as valor_c1,',
'     ''Registros enviados y Predios Recibidos'' as etiqueta_c1',
'  from gi_g_cinta_igac ',
' where id_prcso_crga = 10',
'union all ',
'select ''Predios Cargados'' as color,',
'    count(*) as valor,',
'    ''Registros enviados y Predios Recibidos'' as etiqueta',
'   from v_gi_g_cinta_igac  ',
'  where nmro_orden_igac = ''001'' ',
'    and id_prcso_crga =  10',
'group by file_name '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54514070603590668)
,p_shared_query_id=>wwv_flow_api.id(52942424181673006)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Predios Cargados'' as color_pc,',
'    count(*) as valor_pc,',
'    ''Consolidado de Registros y Predios Recibidos'' as etiqueta_pc',
'   from v_gi_g_cinta_igac  ',
'  where nmro_orden_igac = ''001'' ',
'    and id_prcso_crga =  10',
'group by file_name '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54514225965590668)
,p_shared_query_id=>wwv_flow_api.id(52942424181673006)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Incremento en predios entre vigencia Anterior y Actual'' AS color_ip, ',
'       sum(case when vgncia = 2018 then incremento',
'              else -incremento end) AS valor_ip,',
'              ''Consolidado de Registros y Predios Recibidos'' as etiqueta_ip',
'  from (',
'              select count(*) as incremento, vgncia',
'                from v_gi_g_cinta_igac a',
'               where a.nmro_orden_igac = ''001'' ',
'                 and a.vgncia          in ( 2018, ( 2018 - 1 ) )',
'                 and a.cdgo_clnte      = 1',
'                 group by vgncia',
'         )'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54514473528590668)
,p_shared_query_id=>wwv_flow_api.id(52942424181673006)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Incremento en Predios Nuevos'' AS color_ipn, ',
'       count(*) AS valor_ipn,',
'       ''Consolidado de Registros y Predios Recibidos'' as etiqueta_ipn',
'  from v_gi_g_cinta_igac a',
' where a.nmro_orden_igac = ''001''',
'   and a.cdgo_clnte      = 1',
'   and a.vgncia          = 2018',
'   and not exists (',
'                    select ''x''',
'                     from v_gi_g_cinta_igac c',
'                    where c.rfrncia_igac  = a.rfrncia_igac',
'                      and c.cdgo_clnte      = 1',
'                      and c.vgncia        = (2018 - 1))',
'                   '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54514658672590668)
,p_shared_query_id=>wwv_flow_api.id(52942424181673006)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  ''Predios Nuevos'' as Novedad',
'         , to_char( count(*) ,''999G999G999G999G999G999G990'') as "No. Predios"',
unistr('         , to_char( sum(a.avluo_igac),''999G999G999G999G999G999G990'') as "Total Aval\00FAos"'),
'      from v_gi_g_cinta_igac a',
'     where a.nmro_orden_igac = ''001''',
'       and a.cdgo_clnte      = 1',
'       and a.id_prcso_crga   = 10',
'       and not exists ( ',
'                            select ''x'' ',
'                              from v_si_i_sujetos_impuesto b',
'                             where a.rfrncia_igac = b.idntfccion_sjto',
'                               and b.cdgo_clnte   = 1',
'                       )',
'    union ',
'    select ''Predios Conservan'' as Novedad',
'         , to_char( count(*) ,''999G999G999G999G999G999G990'') as "No. Predios"',
unistr('         , to_char( sum(a.avluo_igac),''999G999G999G999G999G999G990'') as "Total Aval\00FAos"'),
'      from v_gi_g_cinta_igac a',
'     where a.nmro_orden_igac = ''001''',
'       and a.cdgo_clnte      = 1',
'       and a.id_prcso_crga   = 10',
'       and exists ( ',
'                        select ''x'' ',
'                          from v_si_i_sujetos_impuesto b',
'                         where b.idntfccion_sjto = a.rfrncia_igac',
'                           and b.cdgo_clnte      = 1',
'                   )',
'    union ',
'    select ''Predios Retirados'' as Novedad',
'         , to_char( count(*) ,''999G999G999G999G999G999G990'') as "No. Predios"',
unistr('         , to_char( sum(b.avluo_ctstral),''999G999G999G999G999G999G990'') as "Total Aval\00FAos"'),
'      from v_si_i_sujetos_impuesto a',
'      join v_si_i_predios b',
'        on a.id_sjto = b.id_sjto',
'     where a.cdgo_clnte = 1',
'       and not exists ( ',
'                         select ''x'' ',
'                           from v_gi_g_cinta_igac c',
'                          where c.nmro_orden_igac = ''001''',
'                            and c.cdgo_clnte      = 1',
'                            and c.id_prcso_crga   = 10',
'                            and c.rfrncia_igac    = a.idntfccion_sjto',
'                      )'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54514822028590668)
,p_shared_query_id=>wwv_flow_api.id(52942424181673006)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Registros Enviados'' AS color_c1',
'     ,  count(*) as valor_c1,',
'     ''Consolidado de Registros y Predios Recibidos'' as etiqueta_c1',
'  from gi_g_cinta_igac ',
' where id_prcso_crga = 10'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54515070593590668)
,p_shared_query_id=>wwv_flow_api.id(52942424181673006)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*) as valor_vig_act, vgncia as color_vig_act,''Predios por vigencia'' as etiqueta_vig_act',
'                from v_gi_g_cinta_igac a',
'               where a.nmro_orden_igac = ''001'' ',
'                 and a.vgncia          in ( 2018)',
'                 and a.cdgo_clnte      = 1',
'                 group by vgncia',
'                 order by 2;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54515213878590669)
,p_shared_query_id=>wwv_flow_api.id(52942424181673006)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*) as valor_vig_ant, vgncia as color_vig_ant,''Predios por vigencia'' as etiqueta_vig_ant',
'                from v_gi_g_cinta_igac a',
'               where a.nmro_orden_igac = ''001'' ',
'                 and a.vgncia          in ( ( 2018 - 1 ) )',
'                 and a.cdgo_clnte      = 1',
'                 group by vgncia',
'                 order by 2;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54515412904590669)
,p_shared_query_id=>wwv_flow_api.id(52942424181673006)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Incremento Predios entre Vigencia Anterior y Actual Nuevos en la Cinta'' AS etiqueta_ipva, ',
'       count(*) AS valor_ipva',
'  from v_gi_g_cinta_igac a',
' where a.nmro_orden_igac = ''001'' ',
'   and a.cdgo_clnte      = 1',
'   and a.vgncia          = 2018',
'   and not exists ( ',
'                    select ''x'' ',
'                          from gi_g_cinta_igac c',
'                          join et_g_procesos_carga b',
'                            on a.id_prcso_crga = b.id_prcso_crga',
'                         where c.rfrncia_igac = a.rfrncia_igac ',
'                           and b.vgncia = (2018 - 1)',
'                   )',
'   and not exists (',
'                    select ''x'' ',
'                      from v_si_i_sujetos_impuesto d',
'                     where d.idntfccion_sjto = a.rfrncia_igac',
'                       and d.cdgo_clnte      = 1',
'                  )'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54515688998590669)
,p_shared_query_id=>wwv_flow_api.id(52942424181673006)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  ''Tipos de Predios Procesados'' as Etiqueta_tpp,',
'''Predios Nuevos'' as Color_tpp',
'         , count(*) as nmro_predios_tpp',
'         , sum(a.avluo_igac) as Avluo_predios_tpp',
'         , REPLACE(ROUND(sum(a.avluo_igac)*100/FNC_CA_AVALUO_ARCHIVO_CARGA(1,10),4),'','',''.'') AS PORCENTAJE',
'      from v_gi_g_cinta_igac a',
'     where a.nmro_orden_igac = ''001''',
'       and a.cdgo_clnte      = 1',
'       and a.id_prcso_crga   = 10',
'       and not exists ( ',
'                            select ''x'' ',
'                              from v_si_i_sujetos_impuesto b',
'                             where a.rfrncia_igac = b.idntfccion_sjto',
'                               and b.cdgo_clnte   = 1',
'                       )',
'    union ',
'    select ''Tipos de Predios Procesados'' as Etiqueta_tpp,''Predios Conservan'' as Novedad',
'         , count(*)  as nmro_predios_tpp',
'         , sum(a.avluo_igac)as Avluo_predios_tpp',
'         , REPLACE(ROUND(sum(a.avluo_igac)*100/FNC_CA_AVALUO_ARCHIVO_CARGA(1,10),4),'','',''.'') AS PORCENTAJE',
'      from v_gi_g_cinta_igac a',
'     where a.nmro_orden_igac = ''001''',
'       and a.cdgo_clnte      = 1',
'       and a.id_prcso_crga   = 10',
'       and exists ( ',
'                        select ''x'' ',
'                          from v_si_i_sujetos_impuesto b',
'                         where b.idntfccion_sjto = a.rfrncia_igac',
'                           and b.cdgo_clnte      = 1',
'                   )',
'    union ',
'    select ''Tipos de Predios Procesados'' as Etiqueta_tpp, ''Predios Retirados'' as Novedad',
'         , count(*) as nmro_predios_tpp',
'         , sum(b.avluo_ctstral) as Avluo_predios_tpp',
'         , REPLACE(ROUND(sum(b.avluo_ctstral)*100/FNC_CA_AVALUO_ARCHIVO_CARGA(1,10),4),'','',''.'') AS PORCENTAJE',
'      from v_si_i_sujetos_impuesto a',
'      join v_si_i_predios b',
'        on a.id_sjto = b.id_sjto',
'     where a.cdgo_clnte = 1',
'       and not exists ( ',
'                         select ''x'' ',
'                           from v_gi_g_cinta_igac c',
'                          where c.nmro_orden_igac = ''001''',
'                            and c.cdgo_clnte      = 1',
'                            and c.id_prcso_crga   = 10',
'                            and c.rfrncia_igac    = a.idntfccion_sjto',
'                      );'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54515843349590669)
,p_shared_query_id=>wwv_flow_api.id(52942424181673006)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   count(*) as nmro_predios_nuevos',
'         , sum(a.avluo_igac) as Avluo_predios_nuevos',
'         , REPLACE(ROUND(sum(a.avluo_igac)*100/FNC_CA_AVALUO_ARCHIVO_CARGA(1,10),4),'','',''.'') AS PORCENTAJE_predios_nuevos',
'      from v_gi_g_cinta_igac a',
'     where a.nmro_orden_igac = ''001''',
'       and a.cdgo_clnte      = 1',
'       and a.id_prcso_crga   = 10',
'       and not exists ( ',
'                            select ''x'' ',
'                              from v_si_i_sujetos_impuesto b',
'                             where a.rfrncia_igac = b.idntfccion_sjto',
'                               and b.cdgo_clnte   = 1',
'                       )'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54516076163590669)
,p_shared_query_id=>wwv_flow_api.id(52942424181673006)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*)  as nmro_predios_CONSERVAN',
'         , sum(a.avluo_igac)as Avluo_predios_CONSERVAN',
'         , REPLACE(ROUND(sum(a.avluo_igac)*100/FNC_CA_AVALUO_ARCHIVO_CARGA(1,10),4),'','',''.'') AS PORCENTAJE_CONSERVAN',
'      from v_gi_g_cinta_igac a',
'     where a.nmro_orden_igac = ''001''',
'       and a.cdgo_clnte      = 1',
'       and a.id_prcso_crga   = 10',
'       and exists ( ',
'                        select ''x'' ',
'                          from v_si_i_sujetos_impuesto b',
'                         where b.idntfccion_sjto = a.rfrncia_igac',
'                           and b.cdgo_clnte      = 1',
'                   )'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54516218768590669)
,p_shared_query_id=>wwv_flow_api.id(52942424181673006)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*) as nmro_predios_RETIRADOS',
'         , sum(b.avluo_ctstral) as Avluo_predios_RETIRADOS',
'         , REPLACE(ROUND(sum(b.avluo_ctstral)*100/FNC_CA_AVALUO_ARCHIVO_CARGA(1,10),4),'','',''.'') AS PORCENTAJE_RETIRADOS',
'      from v_si_i_sujetos_impuesto a',
'      join v_si_i_predios b',
'        on a.id_sjto = b.id_sjto',
'     where a.cdgo_clnte = 1',
'       and not exists ( ',
'                         select ''x'' ',
'                           from v_gi_g_cinta_igac c',
'                          where c.nmro_orden_igac = ''001''',
'                            and c.cdgo_clnte      = 1',
'                            and c.id_prcso_crga   = 10',
'                            and c.rfrncia_igac    = a.idntfccion_sjto',
'                      )'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54516496416590669)
,p_shared_query_id=>wwv_flow_api.id(52942424181673006)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Predios Conservados'' AS etiqueta',
'     , ''Activos'' as color',
'     , count(*) as value',
'  from v_gi_g_cinta_igac a',
' where a.nmro_orden_igac = ''001''',
'   and a.cdgo_clnte    = 1',
'   and a.id_prcso_crga = 10',
'   and exists ( ',
'                  select ''x'' ',
'                    from v_si_i_sujetos_impuesto b',
'                   where b.idntfccion_sjto = a.rfrncia_igac',
'                     and b.cdgo_clnte      = 1',
'                     and b.cdgo_sjto_estdo = ''A''',
'              )',
'union',
'--Predios conservados inactivos',
'select ''Predios Conservados'' AS etiqueta',
'      , ''Inactivos'' as color',
'      , count(*) as card_value ',
'  from v_gi_g_cinta_igac a',
' where a.id_prcso_crga   = 10',
'   and a.nmro_orden_igac = ''001''',
'   and exists ( ',
'                  select ''x'' ',
'                    from v_si_i_sujetos_impuesto b',
'                   where b.idntfccion_sjto = a.rfrncia_igac',
'                     and b.cdgo_clnte      = 1',
'                     and b.cdgo_sjto_estdo = ''I''',
'              )'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54516624721590669)
,p_shared_query_id=>wwv_flow_api.id(52942424181673006)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Activos'' as color_conservados_activos',
'     , count(*) as valor_conservados_activos',
'  from v_gi_g_cinta_igac a',
' where a.nmro_orden_igac = ''001''',
'   and a.cdgo_clnte    = 1',
'   and a.id_prcso_crga = 10',
'   and exists ( ',
'                  select ''x'' ',
'                    from v_si_i_sujetos_impuesto b',
'                   where b.idntfccion_sjto = a.rfrncia_igac',
'                     and b.cdgo_clnte      = 1',
'                     and b.cdgo_sjto_estdo = ''A''',
'              )'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54516834339590669)
,p_shared_query_id=>wwv_flow_api.id(52942424181673006)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Inactivos'' as conservados_inactivos',
'      , count(*) as valor_conservados_inactivos ',
'  from v_gi_g_cinta_igac a',
' where a.id_prcso_crga   = 10',
'   and a.nmro_orden_igac = ''001''',
'   and exists ( ',
'                  select ''x'' ',
'                    from v_si_i_sujetos_impuesto b',
'                   where b.idntfccion_sjto = a.rfrncia_igac',
'                     and b.cdgo_clnte      = 1',
'                     and b.cdgo_sjto_estdo = ''I''',
'              )'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54517072840590669)
,p_shared_query_id=>wwv_flow_api.id(52942424181673006)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Avaluos de Predios'' as etiqueta_predios_avaluo',
unistr('     ,''Predios con aval\00FAos mayor a cero'' as color_predios_avaluo'),
'     , count(*) as valor_predios_avaluos',
'  from gi_g_cinta_igac ',
' where id_prcso_crga   = 10',
'   and nmro_orden_igac = ''001''',
'   and avluo_igac      > 0',
'   union all',
'   select ''Avaluos de Predios'' as etiqueta_predios_avaluo',
unistr('     ,''Predios con aval\00FAos igual a cero'' as color_predios_avaluo'),
'     , count(*) as valor_predios_avaluos',
'  from gi_g_cinta_igac ',
' where id_prcso_crga   = 10',
'   and nmro_orden_igac = ''001''',
'   and avluo_igac      = 0'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54517236911590669)
,p_shared_query_id=>wwv_flow_api.id(52942424181673006)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''Predios con aval\00FAos mayor a cero'' as predios_avaluo_mayor'),
'     , count(*) as valor_predios_avaluos_mayor',
'  from gi_g_cinta_igac ',
' where id_prcso_crga   = 10',
'   and nmro_orden_igac = ''001''',
'   and avluo_igac      > 0'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54517414289590670)
,p_shared_query_id=>wwv_flow_api.id(52942424181673006)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''Predios con aval\00FAos igual a cero'' as predios_avaluo_cero'),
'     , count(*) as valor_predios_avaluos_cero',
'  from gi_g_cinta_igac ',
' where id_prcso_crga   = 10',
'   and nmro_orden_igac = ''001''',
'   and avluo_igac      = 0'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(54517671405590670)
,p_shared_query_id=>wwv_flow_api.id(52942424181673006)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sum(avluo_igac)as valor_total_avaluos',
'  from gi_g_cinta_igac c',
' where c.id_prcso_crga   = 10',
'   and c.nmro_orden_igac = ''001'''))
);
end;
/
