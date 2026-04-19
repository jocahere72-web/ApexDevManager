prompt --application/shared_components/reports/report_queries/si_g_novedades_prdio_estrto
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(124644777913711695)
,p_name=>'si_g_novedades_prdio_estrto'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--2. Encabezado y Pie de pagina',
'select 	upper(b.nmbre_clnte)nmbre_clnte,',
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
'from 	df_c_imagenes_cliente a',
'join 	df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'where 	a.cdgo_clnte       = :F_CDGO_CLNTE',
'and 	a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'si_g_novedades_prdio_estrto'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(124864666225114098)
,p_shared_query_id=>wwv_flow_api.id(124644777913711695)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--2. Encabezado y Pie de pagina',
'select 	upper(b.nmbre_clnte)nmbre_clnte,',
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
'from 	df_c_imagenes_cliente a',
'join 	df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'where 	a.cdgo_clnte       = :F_CDGO_CLNTE',
'and 	a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(124864813381114098)
,p_shared_query_id=>wwv_flow_api.id(124644777913711695)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Detalle',
'select  a.idntfccion_sjto,',
'        a.vgncia, ',
'        a.nmro_dcmto_sprte, ',
'        a.fcha_dcmnto_sprte, ',
'        a.obsrvcion, ',
'        a.nmbre_trcro,',
'        decode(indcdor_actlzdo, ''S'', ''Si'', ''No'') actlzdo,',
'        to_char(a.fcha_rgstro , ''dd/mm/yyyy hh24:mi:ss'') fcha_rgstro',
'from    v_si_g_novedades_prdio_estrto a',
'where   trunc(a.fcha_rgstro) between TO_DATE(json_value(:P37_JSON ,''$.fcha_incial''), ''DD/MM/YYYY'') AND TO_DATE(json_value(:P37_JSON ,''$.fcha_fnal''), ''DD/MM/YYYY'')'))
);
end;
/
