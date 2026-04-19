prompt --application/shared_components/reports/report_queries/gf_g_paz_y_slvo
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(59583415809922963)
,p_name=>'gf_g_paz_y_slvo'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select pkg_gn_generalidades.fnc_ge_dcmnto( p_xml        => :P33_JSON',
'                                            , p_id_plntlla =>  112 ) as html            ',
'    from dual;',
''))
,p_report_layout_id=>wwv_flow_api.id(17140434129417362)
,p_format=>'PDF'
,p_output_file_name=>'gf_g_paz_y_slvo'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(17145321219460942)
,p_shared_query_id=>wwv_flow_api.id(59583415809922963)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 1. Pinta HTML de la Plantilla  ',
'select pkg_gn_generalidades.fnc_ge_dcmnto( p_xml        => :P273_JSON',
'                                         , p_id_plntlla =>  json_value(:P273_JSON, ''$.id_rprte'')) as html',
'  from dual;',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(17145530574460942)
,p_shared_query_id=>wwv_flow_api.id(59583415809922963)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 2. Datos basicos del Reporte',
'	select upper(b.nmbre_clnte)nmbre_clnte,',
'		   upper(b.slgan)slgan,',
'			pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'			to_char(systimestamp, ''DD/MM/YYYY HH:MI AM'') HOY,',
'			:F_IP as ipaddr,',
'			:F_NMBRE_USRIO as Usuario,       ',
'			a.file_mimetype,',
'			b.nmro_idntfccion nmro_idntfccion,',
'			b.nmbre_dprtmnto',
'	   from df_c_imagenes_cliente a',
'	   join v_df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'	  where a.cdgo_clnte = :F_CDGO_CLNTE',
'		and a.cdgo_imgen_clnte = ''L_E'';',
'		  '))
);
end;
/
