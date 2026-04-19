prompt --application/shared_components/reports/report_queries/mc_g_ofcio_rslcn_embrgo_rmnte
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(3689132170913904)
,p_name=>'mc_g_ofcio_rslcn_embrgo_rmnte'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte) nmbre_clnte,',
'       upper(b.slgan) slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64(p_blob => a.file_blob) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       (select c.nmbre_trcro',
'          from v_sg_g_usuarios c',
'         where c.id_usrio = :F_ID_USRIO) as Usuario,',
'       a.file_mimetype',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b',
'    on (a.cdgo_clnte = b.cdgo_clnte)',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E'''))
,p_xml_structure=>'STANDARD'
,p_format=>'PDF'
,p_output_file_name=>'mc_g_ofcio_rslcn_embrgo_rmnte'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(3689419226915674)
,p_shared_query_id=>wwv_flow_api.id(3689132170913904)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte) nmbre_clnte,',
'       upper(b.slgan) slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64(p_blob => a.file_blob) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       (select c.nmbre_trcro',
'          from v_sg_g_usuarios c',
'         where c.id_usrio = :F_ID_USRIO) as Usuario,',
'       a.file_mimetype',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b',
'    on (a.cdgo_clnte = b.cdgo_clnte)',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(3689525350915675)
,p_shared_query_id=>wwv_flow_api.id(3689132170913904)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dcmnto from mc_g_embrg_remnte_dcmnto where id_embrgos_rmnte = json_value(:P37_JSON, ''$.id_embrgo_rmnte'')',
''))
);
end;
/
