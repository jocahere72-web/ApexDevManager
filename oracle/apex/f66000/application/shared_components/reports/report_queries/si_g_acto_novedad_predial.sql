prompt --application/shared_components/reports/report_queries/si_g_acto_novedad_predial
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(123464736109316337)
,p_name=>'si_g_acto_novedad_predial'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,',
'        a.file_mimetype',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'si_g_acto_novedad_predial'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(123481803872940481)
,p_shared_query_id=>wwv_flow_api.id(123464736109316337)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,',
'        a.file_mimetype',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(123482052726940481)
,p_shared_query_id=>wwv_flow_api.id(123464736109316337)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select txto_dcmnto  ',
'  from si_g_novedades_predio_dtlle',
' where id_nvdad_prdio_dtlle = json_value( :P2_XML , ''$.id_nvdad_prdio_dtlle'') '))
);
end;
/
