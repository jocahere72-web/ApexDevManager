prompt --application/shared_components/reports/report_queries/fi_g_expdntes_x_prgrma_sbprgrama
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(36502547567155268)
,p_name=>'fi_g_expdntes_x_prgrma_sbprgrama'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
' --1. Encabezado y pir de pagina',
' select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        json_value(:P37_JSON ,''$.fcha_in'' )   as fcha_in,',
'        json_value(:P37_JSON ,''$.fcha_fin'' )  as fcha_fin,',
'        upper(json_value(:P37_JSON ,''$.nmbre_rprte'' )) as nmbre_rprte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'fi_g_expdntes_x_prgrma_sbprgrama'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(36502717374155268)
,p_shared_query_id=>wwv_flow_api.id(36502547567155268)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' --1. Encabezado y pir de pagina',
' select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        json_value(:P37_JSON ,''$.fcha_in'' )   as fcha_in,',
'        json_value(:P37_JSON ,''$.fcha_fin'' )  as fcha_fin,',
'        upper(json_value(:P37_JSON ,''$.nmbre_rprte'' )) as nmbre_rprte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(36502907105155268)
,p_shared_query_id=>wwv_flow_api.id(36502547567155268)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' --2. cantidad de expedientes por programa y subprograma en un rango de fechas',
'     select c.nmbre_prgrma',
'          , d.nmbre_sbprgrma          ',
'          , e.nmbre_rzon_scial',
'          , f.idntfccion_sjto',
'          , a.nmro_expdnte',
'          , b.id_prgrma',
'          , b.id_sbprgrma',
'       from fi_g_fiscalizacion_expdnte  a',
'       join v_fi_g_candidatos           b on a.id_cnddto      = b.id_cnddto       ',
'       join fi_d_programas              c on b.id_prgrma      = c.id_prgrma',
'       join fi_d_subprogramas           d on b.id_sbprgrma    = d.id_sbprgrma',
'       join si_i_personas               e on b.id_sjto_impsto = e.id_sjto_impsto',
'       join v_si_i_sujetos_impuesto     f on b.id_sjto_impsto = f.id_sjto_impsto',
'      where b.cdgo_clnte = :F_CDGO_CLNTE',
'        and trunc(a.fcha_aprtra) between  json_value(:P37_JSON ,''$.fcha_in'' ) and json_value(:P37_JSON ,''$.fcha_fin'' ) ',
'        and c.actvo = ''S''',
'        and d.actvo = ''S''',
'        order by 1,2;'))
);
end;
/
