prompt --application/shared_components/reports/report_queries/ws_g_rprte_acto_cnfcmra
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(133406777315142141)
,p_name=>'ws_g_rprte_acto_cnfcmra'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dcmnto, b.nmro_acto, to_char(b.fcha, ''dd/mm/yyyy'') as fcha_acto ',
'from ws_g_confecamaras_sjto_lte a join gn_g_actos b on a.id_acto = b.id_acto ',
'where a.id_cnfcmra_sjto_lte = json_value(:P37_JSON, ''$.id_cnfcmra_sjto_lte'');'))
,p_format=>'PDF'
,p_output_file_name=>'ws_g_rprte_acto_cnfcmra'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(133406951794142161)
,p_shared_query_id=>wwv_flow_api.id(133406777315142141)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dcmnto, b.nmro_acto, to_char(b.fcha, ''dd/mm/yyyy'') as fcha_acto ',
'from ws_g_confecamaras_sjto_lte a join gn_g_actos b on a.id_acto = b.id_acto ',
'where a.id_cnfcmra_sjto_lte = json_value(:P37_JSON, ''$.id_cnfcmra_sjto_lte'');'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(133407146790142161)
,p_shared_query_id=>wwv_flow_api.id(133406777315142141)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
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
end;
/
