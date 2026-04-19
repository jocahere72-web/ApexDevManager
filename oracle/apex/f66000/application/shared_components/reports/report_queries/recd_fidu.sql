prompt --application/shared_components/reports/report_queries/recd_fidu
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(71591525187564812)
,p_name=>'recd_fidu'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--CONSULTA RECAUDO DETALLADO PARA FIDUCIA--',
'select to_char(a.fcha_cnclcion, ''DD/MM/YYYY'') fcha_archvo,',
'       b.nmro_lte,',
'       to_char(c.fcha_cnclcion, ''DD/MM/YYYY'') fcha_pago,',
'       c.nmro_dcmnto,',
'       d.cdgo_cncpto,',
'       d.nmbre_cncpto,',
'       c.vlor_rcdo_cncpto,',
'       f.nmbre_bnco,',
'       e.nmro_cnta',
'  from re_g_recaudos_archvo_cnclcn a',
'  join re_g_recaudos_lte_cnclcion b',
'    on b.id_rcdo_archvo_cnclcion = a.id_rcdo_archvo_cnclcion',
'  join re_g_recaudos_cncpto_cnclcn c',
'    on c.id_rcdo_lte_cnclcion = b.id_rcdo_lte_cnclcion',
'  join df_i_conceptos_cnclcion d',
'    on d.id_cncpto_cnclcion = c.id_cncpto_cnclcion',
'  join df_c_bancos_cuenta e',
'    on e.id_bnco_cnta = c.id_bnco_cnta',
'  join df_c_bancos f',
'    on f.id_bnco = e.id_bnco',
' where a.fcha_cnclcion BETWEEN TO_DATE(json_value(:P37_JSON ,''$.fcha_incial''), ''DD/MM/YYYY'') AND TO_DATE(json_value(:P37_JSON ,''$.fcha_fnal''), ''DD/MM/YYYY'')',
'-- to_char(a.fcha_cnclcion, ''YYYYMM'') between (''202301'') and (''202305'')',
' ORDER BY a.fcha_cnclcion, b.nmro_lte, c.nmro_dcmnto, d.cdgo_cncpto'))
,p_format=>'PDF'
,p_output_file_name=>'recd_fidu'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(71591791735564820)
,p_shared_query_id=>wwv_flow_api.id(71591525187564812)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--CONSULTA RECAUDO DETALLADO PARA FIDUCIA--',
'select to_char(a.fcha_cnclcion, ''DD/MM/YYYY'') fcha_archvo,',
'       b.nmro_lte,',
'       to_char(c.fcha_cnclcion, ''DD/MM/YYYY'') fcha_pago,',
'       c.nmro_dcmnto,',
'       d.cdgo_cncpto,',
'       d.nmbre_cncpto,',
'       c.vlor_rcdo_cncpto,',
'       f.nmbre_bnco,',
'       e.nmro_cnta',
'  from re_g_recaudos_archvo_cnclcn a',
'  join re_g_recaudos_lte_cnclcion b',
'    on b.id_rcdo_archvo_cnclcion = a.id_rcdo_archvo_cnclcion',
'  join re_g_recaudos_cncpto_cnclcn c',
'    on c.id_rcdo_lte_cnclcion = b.id_rcdo_lte_cnclcion',
'  join df_i_conceptos_cnclcion d',
'    on d.id_cncpto_cnclcion = c.id_cncpto_cnclcion',
'  join df_c_bancos_cuenta e',
'    on e.id_bnco_cnta = c.id_bnco_cnta',
'  join df_c_bancos f',
'    on f.id_bnco = e.id_bnco',
' where a.fcha_cnclcion BETWEEN TO_DATE(json_value(:P37_JSON ,''$.fcha_incial''), ''DD/MM/YYYY'') AND TO_DATE(json_value(:P37_JSON ,''$.fcha_fnal''), ''DD/MM/YYYY'')',
'-- to_char(a.fcha_cnclcion, ''YYYYMM'') between (''202301'') and (''202305'')',
' ORDER BY a.fcha_cnclcion, b.nmro_lte, c.nmro_dcmnto, d.cdgo_cncpto'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(71591966420564821)
,p_shared_query_id=>wwv_flow_api.id(71591525187564812)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--2. Encabezado y Pie de pagina',
' select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        json_value(:P37_JSON ,''$.fcha_incial'' ) as fcha_incial,',
'        json_value(:P37_JSON ,''$.fcha_fnal'' ) as fcha_fnal,',
'        upper(json_value(:P37_JSON ,''$.nmbre_rprte'' )) as nmbre_rprte, ',
'        (',
'            select cdgo_frmto_tpo',
'              from gn_d_reportes where upper(nmbre_rprte) =  upper(json_value(:P37_JSON ,''$.nmbre_rprte'' ))',
'        ) as frmto',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte       = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
end;
/
