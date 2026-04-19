prompt --application/shared_components/reports/report_queries/gf_g_paz_y_slvo
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(25652320248998518)
,p_name=>'gf_g_paz_y_slvo'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pkg_gn_generalidades.fnc_ge_dcmnto( p_xml        => :P37_JSON',
'                                         , p_id_plntlla =>  json_value(:P37_JSON, ''$.id_rprte'')) as html',
'  from dual;',
''))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_paz_y_slvo'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(110724435643325918)
,p_shared_query_id=>wwv_flow_api.id(25652320248998518)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Consulta 1',
'select pkg_gn_generalidades.fnc_ge_dcmnto( p_xml        => :P37_JSON',
'                                         , p_id_plntlla =>  json_value(:P37_JSON, ''$.id_rprte'')) as html',
'  from dual;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(110724645267325918)
,p_shared_query_id=>wwv_flow_api.id(25652320248998518)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Consulta 2',
'-- Datos basicos del Reporte',
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
'    and a.cdgo_imgen_clnte = ''L_E'';'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(110724852541325918)
,p_shared_query_id=>wwv_flow_api.id(25652320248998518)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Consulta 3',
'select trim(APEX_WEB_SERVICE.BLOB2CLOBBASE64(f_bmp2jpg',
'    (zt_qr.f_qr_as_bmp(''https://monteria.taxationsmart.co/ords/f?p=150000:56:::::F_CDGO_CLNTE,P56_ID_SJTO_IMPSTO,P56_ID_PZ_SLVO:23001,'' || json_value(:P37_JSON, ''$.id_sjto_impsto'') || '','' || json_value(:P37_JSON, ''$.id_pz_slvo''), ''M'', ''N'')',
'                                 ))',
'                                    ) as QR ',
'from dual;'))
);
end;
/
