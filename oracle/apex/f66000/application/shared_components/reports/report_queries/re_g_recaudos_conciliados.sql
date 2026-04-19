prompt --application/shared_components/reports/report_queries/re_g_recaudos_conciliados
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(64825925955909235)
,p_name=>'re_g_recaudos_conciliados'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.cdgo_cncpto Codigo,',
'       d.nmbre_cncpto Concepto,',
'       sum(c.vlor_rcdo_cncpto) valor',
'  from re_g_recaudos_cncpto_cnclcn c',
'  join df_i_conceptos_cnclcion d',
'    on d.id_cncpto_cnclcion = c.id_cncpto_cnclcion',
'  join re_g_recaudos_lte_cnclcion a',
'    on a.id_rcdo_lte_cnclcion = c.id_rcdo_lte_cnclcion',
'  join re_g_recaudos_archvo_cnclcn b',
'    on b.id_rcdo_archvo_cnclcion = b.id_rcdo_archvo_cnclcion',
'   and b.estdo_archvo = ''FN''',
' where to_char(c.fcha_cnclcion, ''YYYYMMDD'') between :P_FCHA_INCIO and',
'       :P_FCHA_FIN',
' group by d.cdgo_cncpto, d.nmbre_cncpto',
' order by d.cdgo_cncpto;',
''))
,p_format=>'PDF'
,p_output_file_name=>'re_g_recaudos_conciliados'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(64853752385159707)
,p_shared_query_id=>wwv_flow_api.id(64825925955909235)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1.',
'select e.codigo,',
'       e.concepto,',
'       to_char(e.valor, ''FM$999G999G999G999G999G999G990'') valor,',
'       to_char(sum(e.valor) over(), ''FM$999G999G999G999G999G999G990'') valor_total',
'  from (select d.cdgo_cncpto Codigo,',
'               d.nmbre_cncpto Concepto,',
'               sum(b.vlor_rcdo_cncpto) valor',
'          from re_g_recaudos_archvo_cnclcn c',
'          join re_g_recaudos_lte_cnclcion a',
'            on a.id_rcdo_archvo_cnclcion = c.id_rcdo_archvo_cnclcion',
'          join re_g_recaudos_cncpto_cnclcn b',
'            on b.id_rcdo_lte_cnclcion = a.id_rcdo_lte_cnclcion',
'          join df_i_conceptos_cnclcion d',
'            on d.id_cncpto_cnclcion = b.id_cncpto_cnclcion',
'         where trunc(c.fcha_cnclcion) between json_value(:P37_JSON ,''$.fcha_incial'') and json_value(:P37_JSON ,''$.fcha_fnal'')',
'           and c.estdo_archvo = ''FN''',
'         group by d.cdgo_cncpto, d.nmbre_cncpto) e',
' order by e.codigo',
'',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(64853996267159707)
,p_shared_query_id=>wwv_flow_api.id(64825925955909235)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--2.',
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        upper(json_value(:P37_JSON ,''$.nmbre_rprte'')) nmbre_rpte,        ',
'        json_value(:P37_JSON ,''$.fcha_incial'') fcha_incial,',
'        json_value(:P37_JSON ,''$.fcha_fnal'') fcha_fnal',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
end;
/
