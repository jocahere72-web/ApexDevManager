prompt --application/shared_components/reports/report_queries/re_c_bancaria_conceptos_asociados
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(35036508971467316)
,p_name=>'re_c_bancaria_conceptos_asociados '
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('-- Encabezado y Pie de P\00E1gina'),
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'       json_value(:P37_JSON ,''$.fcha_incial'') as fcha_incial,',
'       json_value(:P37_JSON ,''$.fcha_fnal'') as fcha_fnal,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       json_value(:P37_JSON, ''$.nmbre_rprte'') as nmbre_rpte',
'from  df_c_imagenes_cliente a',
'join  df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'re_c_bancaria_conceptos_asociados '
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(45126100120040475)
,p_shared_query_id=>wwv_flow_api.id(35036508971467316)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('-- Encabezado y Pie de P\00E1gina'),
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'       json_value(:P37_JSON ,''$.fcha_incial'') as fcha_incial,',
'       json_value(:P37_JSON ,''$.fcha_fnal'') as fcha_fnal,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       json_value(:P37_JSON, ''$.nmbre_rprte'') as nmbre_rpte',
'from  df_c_imagenes_cliente a',
'join  df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(45126316068040476)
,p_shared_query_id=>wwv_flow_api.id(35036508971467316)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Cuerpo del reporte',
'select  a.dscrpcion_cncpto, ',
'        d.id_bnco,',
'        d.nmbre_bnco, ',
'        d.nmro_cnta,',
'        TRUNC(sum(a.vlor_cptal)) as vlor_cptal, ',
'        TRUNC(sum(a.vlor_intres)) as vlor_intres, ',
'        TRUNC(sum(a.vlor_ttal)) as vlor_ttal',
'from  v_re_g_recaudos_detalle a',
'join  re_g_recaudos_control b on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'join  df_i_cncpto_bncos_cnta c on a.id_cncpto = c.id_cncpto',
'join  v_df_c_bancos_cuenta d on  d.id_bnco_cnta = c.id_bnco_cnta',
'join  df_i_impuestos_acto_concepto e on e.id_impsto_acto_cncpto = a.id_impsto_acto_cncpto',
'join  df_i_impuestos_acto f on f.id_impsto_acto = e.id_impsto_acto',
'where trunc(a.fcha_rcdo) between json_value(:p37_json ,''$.fcha_incial'')',
'                      and json_value(:p37_json ,''$.fcha_fnal'')',
'  and b.id_impsto = nvl(json_value(:p37_json ,''$.id_impsto'' ), b.id_impsto)',
'  and b.id_impsto_sbmpsto = nvl(json_value(:p37_json, ''$.id_impsto_sbmpsto''), b.id_impsto_sbmpsto)',
'  and d.id_bnco = nvl(json_value(:p37_json, ''$.id_bnco''), d.id_bnco)',
'  and e.id_impsto_acto = nvl(json_value(:p37_json, ''$.id_impsto_acto''), e.id_impsto_acto)',
'   and b.cdgo_rcdo_orgen not in (''WS'') --Pagos PSE',
'group by a.dscrpcion_cncpto, d.id_bnco, d.nmbre_bnco, d.nmro_cnta;  '))
);
end;
/
