prompt --application/shared_components/reports/report_queries/re_g_rlcion_mes_impsto_bnco
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(28199390712143097)
,p_name=>'re_g_rlcion_mes_impsto_bnco'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       upper(json_value(:P37_JSON,''$.nmbre_rprte'')) as nmbre_rprte,',
'       json_value(:P37_JSON,''$.mes'') as mes',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'re_g_rlcion_mes_impsto_bnco'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(40119322577358602)
,p_shared_query_id=>wwv_flow_api.id(28199390712143097)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       upper(json_value(:P37_JSON,''$.nmbre_rprte'')) as nmbre_rprte,',
'       json_value(:P37_JSON,''$.mes'') as mes',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(40119582551358602)
,p_shared_query_id=>wwv_flow_api.id(28199390712143097)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select to_char(a.fcha_rcdo,''MM'') as nmro_mes',
'         , to_char(a.fcha_rcdo,''Month'') as mes',
'         , c.nmbre_impsto',
'         , c.nmbre_impsto_sbmpsto',
'         , c.dscrpcion_bnco',
'         , b.dscrpcion_cncpto             ',
'         , round(sum(b.vlor_ttal))           as vlor_rcddo',
'      from re_g_recaudos              a',
'      join v_re_g_recaudos_detalle    b on a.id_rcdo        = b.id_rcdo',
'      join v_re_g_recaudos_control    c on a.id_rcdo_cntrol = c.id_rcdo_cntrol',
'     where c.cdgo_clnte              = :F_CDGO_CLNTE',
'       and c.id_impsto               = nvl(json_value(:P37_JSON,''$.id_impsto''),c.id_impsto )',
'       and c.id_bnco                 = nvl(json_value(:P37_JSON,''$.id_bnco''),c.id_bnco )',
'       and to_char(a.fcha_rcdo,''MM'') = nvl(json_value(:P37_JSON,''$.mes''),to_char(a.fcha_rcdo,''MM''))',
'       and a.cdgo_rcdo_estdo         = ''AP'' ',
'     group by to_char(a.fcha_rcdo,''MM'')',
'         , to_char(a.fcha_rcdo,''Month'')',
'         , c.nmbre_impsto',
'         , c.nmbre_impsto_sbmpsto',
'         , c.dscrpcion_bnco',
'         , b.dscrpcion_cncpto',
'     order by 1,2,3,4,5'))
);
end;
/
