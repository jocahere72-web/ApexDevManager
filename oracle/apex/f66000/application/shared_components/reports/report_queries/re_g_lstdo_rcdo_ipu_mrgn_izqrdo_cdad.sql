prompt --application/shared_components/reports/report_queries/re_g_lstdo_rcdo_ipu_mrgn_izqrdo_cdad
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(137688616004195036)
,p_name=>'re_g_lstdo_rcdo_ipu_mrgn_izqrdo_cdad'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_format=>'PDF'
,p_output_file_name=>'re_g_lstdo_rcdo_ipu_mrgn_izqrdo_cdad'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(137693136415557090)
,p_shared_query_id=>wwv_flow_api.id(137688616004195036)
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
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(137693300903557091)
,p_shared_query_id=>wwv_flow_api.id(137688616004195036)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 1. CONSULTAR RECAUDOS DE PREDIOS DEL MARGEN IZQUIERDO DE LA CIUDAD',
'SELECT',
'    ''R'' || t.idntfccion_sjto as idntfccion_sjto,',
'    b.idntfccion,',
'    b.prmer_nmbre || '' '' || b.prmer_aplldo propietario,',
'    a.drccion,',
'    t.vlor,',
'    trunc(t.fcha_rcdo) fcha_rcdo',
'FROM',
'    v_re_g_recaudos                 t',
'    JOIN si_c_sujetos               a ON t.id_sjto = a.id_sjto',
'    JOIN si_i_sujetos_responsable   b ON t.id_sjto_impsto = b.id_sjto_impsto',
'WHERE',
'    t.id_impsto = ''230011''',
'    AND t.id_impsto_sbmpsto = ''2300111''',
'    AND t.fcha_rcdo BETWEEN TO_DATE(json_value(:P37_JSON ,''$.fcha_incial''), ''DD/MM/YYYY'') AND TO_DATE(json_value(:P37_JSON ,''$.fcha_fnal''), ''DD/MM/YYYY'')',
'    AND substr(t.idntfccion_sjto, 1, 4) = ''0104''',
'    AND t.cdgo_rcdo_estdo = ''AP''',
'    AND b.prncpal_s_n = ''S'' --and t.idntfccion_sjto = ''0104000003800009000000000'' ',
'ORDER BY',
'    t.fcha_rcdo'))
);
end;
/
