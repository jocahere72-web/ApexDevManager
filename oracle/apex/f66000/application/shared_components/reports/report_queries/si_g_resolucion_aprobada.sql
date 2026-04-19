prompt --application/shared_components/reports/report_queries/si_g_resolucion_aprobada
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(79329591670977338)
,p_name=>'si_g_resolucion_aprobada '
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Datos cliente',
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'         to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,      ',
'       a.file_mimetype',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) ',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'si_g_resolucion_aprobada '
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(94404832462569373)
,p_shared_query_id=>wwv_flow_api.id(79329591670977338)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Datos cliente',
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'         to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,      ',
'       a.file_mimetype',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) ',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(94405021590569373)
,p_shared_query_id=>wwv_flow_api.id(79329591670977338)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Documento',
'select clob001 as dcmnto',
'        , json_value(:P37_JSON ,''$.rslcion'') rslcion',
'        , json_value(:P37_JSON ,''$.rdccion'') rdccion',
'        , json_value(:P37_JSON ,''$.fcha_rslcion'') fcha_rslcion',
'        , json_value(:P37_JSON ,''$.cdgo_trmte_tpo'')  cdgo_trmte_tpo',
'        , json_value(:P37_JSON ,''$.cdgo_mtcion_clse'') cdgo_mtcion_clse     ',
'from   gn_g_temporal ',
'where  id_ssion = json_value(:P37_JSON ,''$.ssion'')',
'order by id_tmpral'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(94405297772569373)
,p_shared_query_id=>wwv_flow_api.id(79329591670977338)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DISTINCT c.nmbre_trcro as usrio_aplca,',
'nvl((select d.nmbre_trcro from v_sg_g_usuarios d where d.id_usrio = b.id_usrio_rlqda) ,c.nmbre_trcro) usrio_aprba',
'from genesys.si_g_resolucion_aplicada a',
'join genesys.si_g_resolucion_igac_t1 b on b.id_rslcion_aplcda = a.id_rslcion_aplcda',
'and b.RSLCION = a.RSLCION and b.RDCCION = a.RDCCION',
'join genesys.v_sg_g_usuarios c on c.id_usrio = a.id_usrio',
'where a.rslcion =  json_value(:P37_JSON ,''$.rslcion'')',
'',
''))
);
end;
/
