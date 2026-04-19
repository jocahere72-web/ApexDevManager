prompt --application/shared_components/reports/report_queries/re_g_documentos_gnrdos_x_usrio
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(18117702324350396)
,p_name=>'re_g_documentos_gnrdos_x_usrio'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
' -- 1. Encabezado y pir de pagina',
' select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY HH:MI:SS AM'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        json_value(:P37_JSON ,''$.fcha_in'' )   as fcha_in,',
'        json_value(:P37_JSON ,''$.fcha_fin'' )  as fcha_fin,',
'        upper(json_value(:P37_JSON ,''$.nmbre_rprte'' )) as nmbre_rprte,',
'        :F_NMBRE_USRIO as nmbre_usrio',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'re_g_documentos_gnrdos_x_usrio'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(60963254215995055)
,p_shared_query_id=>wwv_flow_api.id(18117702324350396)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' -- 1. Encabezado y pir de pagina',
' select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY HH:MI:SS AM'') HOY,',
'        :F_IP as ipaddr,',
'        upper(json_value(:P37_JSON ,''$.nmbre_trcro'' )) as Usuario,       ',
'        a.file_mimetype,',
'        json_value(:P37_JSON ,''$.fcha_in'' )   as fcha_in,',
'        json_value(:P37_JSON ,''$.fcha_fin'' )  as fcha_fin,',
'        upper(json_value(:P37_JSON ,''$.nmbre_rprte'' )) as nmbre_rprte,',
'        :F_NMBRE_USRIO as nmbre_usrio,',
'        (select c.nmbre_impsto from df_c_impuestos c where c.id_impsto = json_value(:P37_JSON ,''$.id_impsto'' )) nmbre_impsto',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(60963435348995055)
,p_shared_query_id=>wwv_flow_api.id(18117702324350396)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_dcmnto',
'     , to_char(a.fcha_dcmnto,''DD/MM/YYYY'') fcha_dcmnto',
'     , b.idntfccion_sjto',
'     , (select dscrpcion from re_d_documento_tipo where cdgo_dcmnto_tpo = a.cdgo_dcmnto_tpo) as dcmnto_tpo',
'     , to_char(a.vlor_ttal_dcmnto,''FM$999G999G999G999G999G999G990'') vlor_ttal_dcmnto',
'     , decode(a.indcdor_entrno, ''PBLCO'', ''Portal'', a.usrio_dgta) as usrio',
'     , a.nmro_dcmnto nmro_dcmnto_count',
'  from re_g_documentos a',
'  join v_si_i_sujetos_impuesto b',
'    on b.id_sjto_impsto = a.id_sjto_impsto',
' where trunc(a.fcha_dcmnto) between json_value(:P37_JSON ,''$.fcha_in'' ) and json_value(:P37_JSON ,''$.fcha_fin'' ) ',
'   and a.usrio_dgta         = json_value(:P37_JSON ,''$.id_usrio'' )',
'   and a.id_impsto          = json_value(:P37_JSON ,''$.id_impsto'' )'))
);
end;
/
