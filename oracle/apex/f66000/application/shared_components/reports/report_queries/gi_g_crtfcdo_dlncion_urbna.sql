prompt --application/shared_components/reports/report_queries/gi_g_crtfcdo_dlncion_urbna
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(27598929410181494)
,p_name=>'gi_g_crtfcdo_dlncion_urbna'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. firma Funcionario                           ',
'select a.id_fncnrio',
'     , b.nmbre_trcro',
'     , b.nmbre_crgo',
'     , b.nmbre_ofcna',
'     , b.firma_file_blob',
'     , to_char(sysdate,''MM/YYYY'') as fcha_p',
'     , pkg_gn_generalidades.fnc_ge_dcmnto( p_xml        => :P37_JSON',
'                                         , p_id_plntlla =>  json_value(:P37_JSON, ''$.id_plntlla'')) as html',
'  from gn_d_actos_funcionario_frma a ',
'  join v_df_c_funcionarios         b on a.id_fncnrio = b.id_fncnrio',
' where a.id_acto_tpo = json_value(:P37_JSON, ''$.id_acto_tpo'');'))
,p_format=>'PDF'
,p_output_file_name=>'gi_g_crtfcdo_dlncion_urbna'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(32571707230207027)
,p_shared_query_id=>wwv_flow_api.id(27598929410181494)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. firma Funcionario                           ',
'select a.id_fncnrio',
'	     , b.nmbre_trcro',
'  	     , b.nmbre_crgo',
'  	     , b.nmbre_ofcna',
' 	     , case when frma_tpo = ''MNL'' then ',
'                            null',
'                    else',
'                            pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => b.firma_file_blob ) ',
'               end as firma_file_blob             ',
'  	     , to_char(sysdate,''MM/YYYY'') as fcha_p     ',
'         from gn_d_actos_funcionario_frma a ',
'         join v_df_c_funcionarios         b on a.id_fncnrio = b.id_fncnrio',
'        where a.id_acto_tpo = json_value(:P37_JSON, ''$.id_acto_tpo'');'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(32571920135207027)
,p_shared_query_id=>wwv_flow_api.id(27598929410181494)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--2. HTML',
'	select pkg_gn_generalidades.fnc_ge_dcmnto( p_xml        => :P37_JSON',
'  	                                       , p_id_plntlla =>  json_value(:P37_JSON, ''$.id_plntlla'')) as html',
' 	 from dual;  '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(32572121646207027)
,p_shared_query_id=>wwv_flow_api.id(27598929410181494)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 3. Datos basicos del Reporte',
'  	select upper(b.nmbre_clnte)nmbre_clnte,',
'    	   upper(b.slgan)slgan,',
'  	    pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'  	    to_char(systimestamp, ''DD/MM/YYYY HH:MI AM'') HOY,',
'  	    :F_IP as ipaddr,',
'  	    :F_NMBRE_USRIO as Usuario,       ',
'  	    a.file_mimetype,',
'  	    b.nmro_idntfccion nmro_idntfccion,',
'   	   b.nmbre_dprtmnto',
'  	   from df_c_imagenes_cliente a',
'  	   join v_df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
' 	   where a.cdgo_clnte = :F_CDGO_CLNTE',
' 	   and a.cdgo_imgen_clnte = ''L_E'';',
'      '))
);
end;
/
