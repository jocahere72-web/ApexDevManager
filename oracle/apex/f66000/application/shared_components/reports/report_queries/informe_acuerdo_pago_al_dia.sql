prompt --application/shared_components/reports/report_queries/informe_acuerdo_pago_al_dia
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(22798033698618112)
,p_name=>'informe_acuerdo_pago_al_dia'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select n001  orden',
'        , c001  nmbre_impsto',
'        , c002  cntdad_acrdos',
'        , c003  dscrpcion',
'        , trim(to_char(c004, ''999G999G999G999G999''))  ttal_cptal_ap',
'        , trim(to_char(c005, ''999G999G999G999G999''))  ttal_intres_ap',
'        , trim(to_char(c006, ''999G999G999G999G999''))  ttal_ap',
'     from gn_g_temporal ',
'    where id_ssion = :APP_SESSION',
'      and n001 between 1 and 2',
' order by nmbre_impsto',
'        , orden',
'        , dscrpcion;'))
,p_xml_structure=>'STANDARD'
,p_report_layout_id=>wwv_flow_api.id(22797801308617930)
,p_format=>'PDF'
,p_output_file_name=>'informe_acuerdo_pago_al_dia'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22798215212618114)
,p_shared_query_id=>wwv_flow_api.id(22798033698618112)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select n001  orden',
'        , c001  nmbre_impsto',
'        , c002  cntdad_acrdos',
'        , c003  dscrpcion',
'        , trim(to_char(c004, ''999G999G999G999G999''))  ttal_cptal_ap',
'        , trim(to_char(c005, ''999G999G999G999G999''))  ttal_intres_ap',
'        , trim(to_char(c006, ''999G999G999G999G999''))  ttal_ap',
'     from gn_g_temporal ',
'    where id_ssion = :APP_SESSION',
'      and n001 between 1 and 2',
' order by nmbre_impsto',
'        , orden',
'        , dscrpcion;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22798404528618115)
,p_shared_query_id=>wwv_flow_api.id(22798033698618112)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select n001  orden',
'        , c001  nmbre_impsto',
'        , c002  cntdad_acrdos',
'        , c003  dscrpcion',
'        , trim(to_char(c004, ''999G999G999G999G999''))  ttal_cptal_ap',
'        , trim(to_char(c005, ''999G999G999G999G999''))  ttal_intres_ap',
'        , trim(to_char(c006, ''999G999G999G999G999''))  ttal_ap',
'     from gn_g_temporal ',
'    where id_ssion = :APP_SESSION',
'      and n001 = 3',
' order by nmbre_impsto',
'        , orden',
'        , dscrpcion;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22798690641618115)
,p_shared_query_id=>wwv_flow_api.id(22798033698618112)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select upper(b.nmbre_clnte)nmbre_clnte',
'        , upper(b.slgan)slgan',
'        , pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan',
'        , to_char(systimestamp, ''DD/MM/YYYY HH:MM:SS AM'') HOY',
'        , :F_IP as ipaddr',
'        , :F_NMBRE_USRIO        as Usuario     ',
'        , a.file_mimetype',
'        , json_value(:P37_JSON ,''$.fcha_incial'' )          as fcha_incial',
'        , json_value(:P37_JSON ,''$.fcha_fnal'' )            as fcha_fnal',
'        , upper(json_value(:P37_JSON ,''$.nmbre_rprte'' ))   as nmbre_rprte',
'     from df_c_imagenes_cliente a',
'     join df_s_clientes         b on a.cdgo_clnte = b.cdgo_clnte ',
'    where a.cdgo_clnte          = :F_CDGO_CLNTE',
'      and a.cdgo_imgen_clnte    = ''L_E'''))
);
end;
/
