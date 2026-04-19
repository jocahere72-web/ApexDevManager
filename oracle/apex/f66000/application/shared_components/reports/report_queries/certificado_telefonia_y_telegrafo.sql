prompt --application/shared_components/reports/report_queries/certificado_telefonia_y_telegrafo
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(19806453285532097)
,p_name=>'certificado_telefonia_y_telegrafo'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--- Consulta 1',
'select upper(b.nmbre_clnte) nmbre_clnte,',
'       upper(b.slgan) slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64(p_blob => a.file_blob) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'       a.file_mimetype',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b',
'    on (a.cdgo_clnte = b.cdgo_clnte)',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E'';'))
,p_xml_structure=>'STANDARD'
,p_report_layout_id=>wwv_flow_api.id(19806203519530893)
,p_format=>'PDF'
,p_output_file_name=>'certificado_telefonia_y_telegrafo'
,p_content_disposition=>'ATTACHMENT'
);
end;
/
