prompt --application/shared_components/reports/report_queries/gn_g_ofcio_no_afctcion
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(4389713680818210)
,p_name=>'gn_g_ofcio_no_afctcion'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.idntfccion_sjto',
'     , a.mtrcla_inmblria',
'     , b.prmer_nmbre || '' ''|| b.sgndo_nmbre || '' ''|| b.prmer_aplldo || '' ''|| b.sgndo_aplldo as nmbre_rspnsble',
'     , b.cdgo_idntfccion_tpo || '' - '' || b.idntfccion as idntfccion_rspnsble',
'     , initcap(a.nmbre_mncpio) as nmbre_mncpio',
'     , to_char(sysdate, ''month'') as mes ',
'     , to_char(sysdate, ''DD'') as dia',
'     , to_char(sysdate, ''YYYY'') as anio',
'     , json_value(:P37_JSON, ''$.cnsctvo'') as cnsctvo',
'     , a.nmbre_clnte',
'     , to_char(systimestamp, ''DD/MM/YYYY'') HOY',
'     , :F_IP as ipaddr',
'     , :F_NMBRE_USRIO as Usuario',
'     , pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => c.file_blob ) as lgo_slgan',
'  from v_si_i_sujetos_impuesto    a',
'  join si_i_sujetos_responsable   b on b.id_sjto_impsto = a.id_sjto_impsto',
'  join df_c_imagenes_cliente      c on a.cdgo_clnte     = c.cdgo_clnte and c.cdgo_imgen_clnte = ''L_E''',
'where a.id_sjto_impsto = json_value(:P37_JSON, ''$.id_sjto_impsto'')',
''))
,p_format=>'PDF'
,p_output_file_name=>'gn_g_ofcio_no_afctcion'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(4398105527295513)
,p_shared_query_id=>wwv_flow_api.id(4389713680818210)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.idntfccion_sjto',
'     , a.mtrcla_inmblria',
'     , b.prmer_nmbre || '' ''|| b.sgndo_nmbre || '' ''|| b.prmer_aplldo || '' ''|| b.sgndo_aplldo as nmbre_rspnsble',
'     , b.cdgo_idntfccion_tpo || '' - '' || b.idntfccion as idntfccion_rspnsble',
'     , initcap(a.nmbre_mncpio) as nmbre_mncpio',
'     , to_char(sysdate, ''month'') as mes ',
'     , to_char(sysdate, ''DD'') as dia',
'     , to_char(sysdate, ''YYYY'') as anio',
'     , json_value(:P37_JSON, ''$.cnsctvo'') as cnsctvo',
'     , a.nmbre_clnte',
'     , to_char(systimestamp, ''DD/MM/YYYY'') HOY',
'     , :F_IP as ipaddr',
'     , :F_NMBRE_USRIO as Usuario',
'     , pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => c.file_blob ) as lgo_slgan',
'  from v_si_i_sujetos_impuesto    a',
'  join si_i_sujetos_responsable   b on b.id_sjto_impsto = a.id_sjto_impsto',
'  join df_c_imagenes_cliente      c on a.cdgo_clnte     = c.cdgo_clnte and c.cdgo_imgen_clnte = ''L_E''',
'where a.id_sjto_impsto = json_value(:P37_JSON, ''$.id_sjto_impsto'')',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(4398381336295513)
,p_shared_query_id=>wwv_flow_api.id(4389713680818210)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' -- Firmas por tipo de documento',
' select c.nmbre_trcro',
'      , c.nmbre_crgo',
'      , c.id_trcro',
'   from gd_d_documentos_tipo_firma a',
'   join gd_d_documentos_tipo       b on a.id_dcmnto_tpo = b.id_dcmnto_tpo',
'   join v_df_c_funcionarios        c on a.id_fncnario   = c.id_fncnrio ',
'  where a.id_dcmnto_tpo = json_value(:P37_JSON, ''$.id_dcmnto_tpo'');'))
);
end;
/
