prompt --application/shared_components/reports/report_queries/gf_dt_especificación_archivo_1
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(77414214563533414)
,p_name=>unistr('gf_dt_especificaci\00F3n_archivo_1')
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        (select upper(nmbre_impsto) from v_gi_g_determinaciones_lote m where m.id_dtrmncion_lte = :P63_ID_DTRMNCION_LTE )nmbre_impsto',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E''',
''))
,p_report_layout_id=>wwv_flow_api.id(77439589519558442)
,p_format=>'PDF'
,p_output_file_name=>unistr('gf_dt_especificaci\00F3n_archivo_1')
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(104770577880520424)
,p_shared_query_id=>wwv_flow_api.id(77414214563533414)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        (select upper(nmbre_impsto) from v_gi_g_determinaciones_lote m where m.id_dtrmncion_lte = :P63_ID_DTRMNCION_LTE )nmbre_impsto',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E''',
''))
);
end;
/
