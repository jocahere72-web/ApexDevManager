prompt --application/shared_components/reports/report_queries/gn_g_oficio_plusvalia
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(105002257597175073)
,p_name=>'gn_g_oficio_plusvalia'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_clnte',
'     , to_char(systimestamp, ''DD/MM/YYYY'') HOY',
'     , :F_IP as ipaddr',
'     , :F_NMBRE_USRIO as Usuario',
'     , pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => b.file_blob ) as lgo_slgan',
'	 , json_value(:P37_JSON, ''$.dcmnto'') as dcmnto',
'  from v_df_s_clientes    a  ',
'  join df_c_imagenes_cliente      b on a.cdgo_clnte     = b.cdgo_clnte and b.cdgo_imgen_clnte = ''L_E''',
'where a.cdgo_clnte = :F_CDGO_CLNTE;'))
,p_format=>'PDF'
,p_output_file_name=>'gn_g_oficio_plusvalia'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(38041461194677800)
,p_shared_query_id=>wwv_flow_api.id(105002257597175073)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- datos encabezado',
'select a.nmbre_clnte',
'     , to_char(systimestamp, ''DD/MM/YYYY'') HOY',
'     , :F_IP as ipaddr',
'     , :F_NMBRE_USRIO as Usuario',
'     , pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => b.file_blob ) as lgo_slgan',
'  from v_df_s_clientes       a  ',
'  join df_c_imagenes_cliente b on a.cdgo_clnte     = b.cdgo_clnte and b.cdgo_imgen_clnte = ''L_E''',
' where a.cdgo_clnte = :F_CDGO_CLNTE;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(38041635049677800)
,p_shared_query_id=>wwv_flow_api.id(105002257597175073)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Funcionarios que firman',
'select b.nmbre_trcro ',
'     , b.nmbre_crgo',
'     , b.nmbre_ofcna',
'  from gn_d_actos_funcionario_frma a',
'  join v_df_c_funcionarios         b on a.id_fncnrio = b.id_fncnrio',
' where a.id_acto_tpo = json_value(:P37_JSON, ''$.id_acto_tpo'')'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(38041844443677800)
,p_shared_query_id=>wwv_flow_api.id(105002257597175073)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Cuerpo del reporte',
'select dcmnto     ',
'     , json_value(:P37_JSON, ''$.cnsctvo'') as cnsctvo',
'     , decode(json_value(:P37_JSON, ''$.cdgo_acto_tpo''),',
'                      ''PGT'',',
'                      ''PL-PT'',',
'                      ''PCR'',',
'                      ''PL-PT-CUS'',',
'                      ''NPP'',',
'                      ''PL-NP'',',
'                      ''ARP'',',
'                      ''AR'',',
'                      ''ALP'',',
'                      ''PL-AL'',',
'                      ''ALV'',',
'                      ''PL-AL-VIS'',',
'                      ''ARV'',',
'                      ''AR-VIS'',',
'                      ''PPP'',',
'                      ''PL-PP'',',
'                      ''NPC'',',
'                      ''PL-NP-CUR'',',
'                      ''ALS'',',
'                      ''PL-AL-SA'',',
'                      ''ARN'',',
'                      ''AR'',',
'                      ''PPT'',',
'                      ''PL-PT'') cdgo_ofcio',
'  from gn_g_oficios',
' where id_ofcio = json_value(:P37_JSON, ''$.id_ofcio'');'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(38042097931677800)
,p_shared_query_id=>wwv_flow_api.id(105002257597175073)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Datos tabla adicional para el oficio no afectacion NP',
'select a.mtrcla_inmblria',
'     , a.idntfccion_sjto ',
'     , a.nmbre_mncpio_ntfccion as mncpio',
'     , a.drccion_ntfccion as drnccion',
'     , a.nmbre_mncpio as ciudad',
'     , trim(to_char(sysdate, ''month''))||'' ''||to_char(sysdate,''dd'') ||'' de ''||to_char(sysdate, ''yyyy'')  as fcha',
'     , a.nmro_idntfccion',
'     , b.dscrpcion_prdio_clsfccion',
'     , json_value(:P37_JSON, ''$.cdgo_acto_tpo'')  as cdgo_acto_tpo',
'  from v_si_i_sujetos_impuesto a',
'  join v_si_i_predios          b on a.id_sjto_impsto = b.id_sjto_impsto',
' where a.id_sjto_impsto = json_value(:P37_JSON, ''$.id_sjto_impsto'');'))
);
end;
/
