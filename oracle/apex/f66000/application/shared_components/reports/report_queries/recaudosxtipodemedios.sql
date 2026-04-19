prompt --application/shared_components/reports/report_queries/recaudosxtipodemedios
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(50617139283404286)
,p_name=>'recaudosxtipodemedios'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'a.dscrpcion_orgen  "MEDIO DE PAGO",',
'count(*) "NUMERO DE PAGOS",',
'sum(b.vlor) "VALOR DE PAGADO",',
'sum (d.vlor_hber) "DESCUENTO"',
'from v_re_g_recaudos_control a',
'join re_g_recaudos b on b.id_rcdo_cntrol = a.id_rcdo_cntrol',
'join re_g_documentos c on c.id_dcmnto = b.id_orgen',
'join re_g_documentos_detalle d on c.id_dcmnto = d.id_dcmnto',
'where b.fcha_rcdo between to_date(''01,08,2023'',''dd,mm,yyyy'')  and to_date(''31,08,2023'',''dd,mm,yyyy'')',
'and b.cdgo_rcdo_estdo = ''AP''',
'--and a.id_impsto = 230011',
'group by a.cdgo_rcdo_orgen, a.dscrpcion_orgen;'))
,p_format=>'PDF'
,p_output_file_name=>'recaudosxtipodemedios'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(50668664614896135)
,p_shared_query_id=>wwv_flow_api.id(50617139283404286)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'a.dscrpcion_orgen AS "MEDIO DE PAGO",',
'COUNT(*) AS "NUMERO DE PAGOS",',
'SUM (b.vlor) AS "VALOR DE PAGADO",',
'SUM(d.vlor_hber) AS "DESCUENTO"',
'from v_re_g_recaudos_control a',
'join re_g_recaudos b on b.id_rcdo_cntrol = a.id_rcdo_cntrol',
'join re_g_documentos c on c.id_dcmnto = b.id_orgen',
'join re_g_documentos_detalle d on c.id_dcmnto = d.id_dcmnto',
'where b.fcha_rcdo BETWEEN TO_DATE(json_value(:P37_JSON ,''$.fcha_incial''), ''DD/MM/YYYY'') AND TO_DATE(json_value(:P37_JSON ,''$.fcha_fnal''), ''DD/MM/YYYY'')',
'and b.cdgo_rcdo_estdo = ''AP''',
' and a.id_impsto = nvl( json_value(:P37_JSON ,''$.id_impsto'' ) , a.id_impsto )',
' and a.id_impsto_sbmpsto = nvl( json_value(:P37_JSON ,''$.id_impsto_sbmpsto'' ) , a.id_impsto_sbmpsto )',
'group by a.cdgo_rcdo_orgen, a.dscrpcion_orgen;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(50668822678896135)
,p_shared_query_id=>wwv_flow_api.id(50617139283404286)
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
