prompt --application/shared_components/reports/report_queries/re_g_infmes_gnral_ica
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(6963375350052844)
,p_name=>'re_g_infmes_gnral_ica'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.idntfccion_sjto',
'      ,a.drccion',
'      ,b.dscrpcion_tpo_prsna',
'      ,c.nmbre_impsto',
'      ,d.nmbre_impsto_sbmpsto',
'      ,b.nmbre_sjto_tpo',
'      ,a.idntfccion_antrior_frmtda',
'      ,a.dscrpcion_sjto_estdo',
'      ,nvl(a.email,''-'')  email',
'      ,nvl(a.tlfno,''-'')  tlfno',
'      ,b.nmbre_rzon_scial',
'from v_si_i_sujetos_impuesto        a',
'join v_si_i_personas                b on a.id_sjto_impsto       = b.id_sjto_impsto',
'join df_c_impuestos                 c on a.id_impsto            = c.id_impsto',
'join df_i_impuestos_subimpuesto     d on c.id_impsto            = d.id_impsto',
'where a.cdgo_clnte       = :F_CDGO_CLNTE      ',
' and a.id_impsto         = json_value( :P37_JSON, ''$.id_impsto'')',
' and d.id_impsto_sbmpsto = nvl(json_value(:P37_JSON, ''$.id_impsto_sbmpsto''), d.id_impsto_sbmpsto)',
' and a.cdgo_sjto_estdo   = nvl(json_value(:P37_JSON, ''$.cdgo_sjto_estdo''), a.cdgo_sjto_estdo)',
' and b.id_sjto_tpo       = nvl(json_value(:P37_JSON, ''$.tpo_rgmen''), b.id_sjto_tpo)',
' and trunc(a.fcha_rgstro) between json_value(:P37_JSON, ''$.fcha_incial'') and  json_value(:P37_JSON, ''$.fcha_fnal'') ',
'order by a.email, a.tlfno asc'))
,p_report_layout_id=>wwv_flow_api.id(6963084288051561)
,p_format=>'PDF'
,p_output_file_name=>'re_g_infmes_gnral_ica'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(6963598855052861)
,p_shared_query_id=>wwv_flow_api.id(6963375350052844)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.idntfccion_sjto',
'      ,a.drccion',
'      ,b.dscrpcion_tpo_prsna',
'      ,c.nmbre_impsto',
'      ,d.nmbre_impsto_sbmpsto',
'      ,b.nmbre_sjto_tpo',
'      ,a.idntfccion_antrior_frmtda',
'      ,a.dscrpcion_sjto_estdo',
'      ,nvl(a.email,''-'')  email',
'      ,nvl(a.tlfno,''-'')  tlfno',
'      ,b.nmbre_rzon_scial',
'from v_si_i_sujetos_impuesto        a',
'join v_si_i_personas                b on a.id_sjto_impsto       = b.id_sjto_impsto',
'join df_c_impuestos                 c on a.id_impsto            = c.id_impsto',
'join df_i_impuestos_subimpuesto     d on c.id_impsto            = d.id_impsto',
'where a.cdgo_clnte       = :F_CDGO_CLNTE      ',
' and a.id_impsto         = json_value( :P37_JSON, ''$.id_impsto'')',
' and d.id_impsto_sbmpsto = nvl(json_value(:P37_JSON, ''$.id_impsto_sbmpsto''), d.id_impsto_sbmpsto)',
' and a.cdgo_sjto_estdo   = nvl(json_value(:P37_JSON, ''$.cdgo_sjto_estdo''), a.cdgo_sjto_estdo)',
' and b.id_sjto_tpo       = nvl(json_value(:P37_JSON, ''$.tpo_rgmen''), b.id_sjto_tpo)',
' and trunc(a.fcha_rgstro) between json_value(:P37_JSON, ''$.fcha_incial'') and  json_value(:P37_JSON, ''$.fcha_fnal'') ',
'order by a.email, a.tlfno asc'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(6963725605052905)
,p_shared_query_id=>wwv_flow_api.id(6963375350052844)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''dd/mm/yyy'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,',
'         a.file_mimetype,',
'         json_value(:P37_JSON, ''$.nmbre_rprte'') nmbre_rprte,',
'         json_value(:P37_JSON, ''$.fcha_incial'') fcha_incial, ',
'         json_value(:P37_JSON, ''$.fcha_fnal'') fcha_fnal',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) ',
'  where  a.cdgo_clnte = :F_CDGO_CLNTE ',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
end;
/
