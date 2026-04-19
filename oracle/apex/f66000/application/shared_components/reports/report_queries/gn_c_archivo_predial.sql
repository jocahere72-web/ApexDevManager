prompt --application/shared_components/reports/report_queries/gn_c_archivo_predial
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(52834506277328820)
,p_name=>'gn_c_archivo_predial'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Registros Cargados'' as label ',
'      , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'   from v_gi_g_cinta_igac',
'  where id_prcso_crga = 9',
'union all  ',
'  select ''Predios Cargados'' as label ',
'      , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'   from v_gi_g_cinta_igac',
'  where nmro_orden_igac = ''001'' and ',
'    id_prcso_crga = 9',
'    union all',
'    select ''Predios por Preliquidar'' as label ',
'      , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'  from v_gi_g_cinta_igac',
' where nmro_orden_igac = ''001''',
'   and id_prcso_crga =  9',
'   and estdo_rgstro = ''C'';'))
,p_report_layout_id=>wwv_flow_api.id(54608142587048239)
,p_format=>'PDF'
,p_output_file_name=>'gn_c_archivo_predial'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(72480809025342222)
,p_shared_query_id=>wwv_flow_api.id(52834506277328820)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select count(*) value, ',
'         ''Registros Cargados'' as color, ',
'         ''Tipo de Registros Archivo - '' || file_name as etiqueta',
'    from v_gi_g_cinta_igac where id_prcso_crga = 9',
'group by file_name ',
'   union all ',
'  select count(*) as value,',
'         ''Predios Cargados'' as color,',
'         ''Tipo de Registros Archivo - '' || file_name as etiqueta',
'    from v_gi_g_cinta_igac  ',
'   where nmro_orden_igac = ''001'' ',
'     and id_prcso_crga =  9',
'group by file_name ',
'   union all ',
'  select count(*) as value,',
'         ''Predios por Preliquidar'' as color,',
'         ''Tipo de Registros Archivo - '' || file_name as etiqueta',
'    from v_gi_g_cinta_igac  ',
'   where nmro_orden_igac = ''001'' ',
'     and id_prcso_crga =  9',
'	 and estdo_rgstro = ''C''',
'group by file_name',
'   union all ',
'  select count(*) as value,',
'         ''Predios Preliquidados'' as color,',
'         ''Tipo de Registros Archivo - '' || file_name as etiqueta',
'    from v_gi_g_cinta_igac  ',
'   where nmro_orden_igac = ''001'' ',
'     and id_prcso_crga = 9',
'	 and estdo_rgstro in ( ''P'',''L'')',
'group by file_name',
'   union all ',
'  select distinct b.value,',
'         ''Predios Liquidados'' as color,',
'         ''Tipo de Registros Archivo - '' || file_name as  etiqueta',
'    from v_gi_g_cinta_igac, (select count(*) as value',
'                               from v_gi_g_cinta_igac a',
'                              where a.nmro_orden_igac = ''001'' ',
'                                and a.id_prcso_crga = 9',
'                                and a.estdo_rgstro = ''L'') b',
'     where id_prcso_crga = 9',
'   union all',
'  select c.value - l.value as value ,',
'		 ''Predios Sin liquidar'' as color ,',
'		 c.etiqueta',
'   from (',
'          select count(*) as value ,',
'                 ''Tipo de Registros Archivo - '' || file_name as etiqueta',
'            from v_gi_g_cinta_igac',
'           where nmro_orden_igac = ''001''',
'             and id_prcso_crga   = 9',
'        group by file_name ',
'      ) c',
'   join (',
'          select count(*) as value',
'            from v_gi_g_cinta_igac',
'           where nmro_orden_igac = ''001''',
'             and id_prcso_crga = 9',
'             and estdo_rgstro = ''L''',
'      ) l',
'     on 1 = 1'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(72481065478342222)
,p_shared_query_id=>wwv_flow_api.id(52834506277328820)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*) as value,',
'         ''Predios por Preliquidar'' as color,',
unistr('         ''Preliquidaci\00F3n del Archivo - '' || file_name as etiqueta'),
'    from v_gi_g_cinta_igac  ',
'   where nmro_orden_igac = ''001'' ',
'     and id_prcso_crga =  9',
'	 and estdo_rgstro = ''C''',
'group by file_name',
'   union all ',
'  select count(*) as value,',
'         ''Predios Preliquidados'' as color,',
unistr('         ''Preliquidaci\00F3n del Archivo - '' || file_name as etiqueta'),
'    from v_gi_g_cinta_igac  ',
'   where nmro_orden_igac = ''001'' ',
'     and id_prcso_crga = 9',
'	 and estdo_rgstro in ( ''P'',''L'')',
'group by file_name'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(72481220201342222)
,p_shared_query_id=>wwv_flow_api.id(52834506277328820)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct b.value,',
'         ''Predios Liquidados'' as color,',
unistr('         ''Liquidaci\00F3n del Archivo - '' || file_name as  etiqueta'),
'    from v_gi_g_cinta_igac, (select count(*) as value',
'                               from v_gi_g_cinta_igac a',
'                              where a.nmro_orden_igac = ''001'' ',
'                                and a.id_prcso_crga = 9',
'                                and a.estdo_rgstro = ''L'') b',
'     where id_prcso_crga = 9',
'   union all',
'  select c.value - l.value as value ,',
'		 ''Predios Sin liquidar'' as color ,',
'		 c.etiqueta',
'   from (',
'          select count(*) as value ,',
unistr('                 ''Liquidaci\00F3n del Archivo - '' || file_name as etiqueta'),
'            from v_gi_g_cinta_igac',
'           where nmro_orden_igac = ''001''',
'             and id_prcso_crga   = 9',
'        group by file_name ',
'      ) c',
'   join (',
'          select count(*) as value',
'            from v_gi_g_cinta_igac',
'           where nmro_orden_igac = ''001''',
'             and id_prcso_crga = 9',
'             and estdo_rgstro = ''L''',
'      ) l',
'     on 1 = 1'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(72481463653342222)
,p_shared_query_id=>wwv_flow_api.id(52834506277328820)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,',
'        a.file_mimetype',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) ',
'  where a.cdgo_clnte = 1',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
end;
/
