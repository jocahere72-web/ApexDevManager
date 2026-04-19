prompt --application/shared_components/reports/report_queries/gf_g_paz_y_slvo_pblcdad_ext_vsal
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(61792436044390807)
,p_name=>'gf_g_paz_y_slvo_pblcdad_ext_vsal'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select pkg_gn_generalidades.fnc_ge_dcmnto( p_xml        => :P37_JSON',
'                                         , p_id_plntlla =>  json_value(:P37_JSON, ''$.id_rprte'')) as html',
'  from dual;'))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_paz_y_slvo_pblcdad_ext_vsal'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(61792653303390809)
,p_shared_query_id=>wwv_flow_api.id(61792436044390807)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select pkg_gn_generalidades.fnc_ge_dcmnto( p_xml        => :P37_JSON',
'                                         , p_id_plntlla =>  json_value(:P37_JSON, ''$.id_rprte'')) as html',
'  from dual;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(61792845707390809)
,p_shared_query_id=>wwv_flow_api.id(61792436044390807)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 2. Datos basicos del Reporte',
'  select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'      pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'      to_char(systimestamp, ''DD/MM/YYYY HH:MI AM'') HOY,',
'      :F_IP as ipaddr,',
'      :F_NMBRE_USRIO as Usuario,       ',
'      a.file_mimetype,',
'      b.nmro_idntfccion nmro_idntfccion,',
'      b.nmbre_dprtmnto',
'     from df_c_imagenes_cliente a',
'     join v_df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'    where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(61793095565390809)
,p_shared_query_id=>wwv_flow_api.id(61792436044390807)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select pkg_gn_generalidades.fnc_ge_dcmnto( p_xml        => :P37_JSON',
'                                         , p_id_plntlla =>  json_value(:P37_JSON, ''$.id_rprte'')) as html',
'  from dual;'))
);
end;
/
