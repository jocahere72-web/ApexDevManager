prompt --application/shared_components/reports/report_queries/nt_g_crtfcdo_actos_pag_web
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(20701783436942784)
,p_name=>'nt_g_crtfcdo_actos_pag_web'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
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
'        (select c.nmbre_impsto from df_c_impuestos c where c.id_impsto = json_value(:P37_JSON ,''$.id_impsto'' )) nmbre_impsto,',
'        :P36_JSON_ACTOS as json',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'nt_g_crtfcdo_actos_pag_web'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(24183348098755695)
,p_shared_query_id=>wwv_flow_api.id(20701783436942784)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 1. Encabezado y pie de pagina',
'select upper(b.nmbre_clnte)nmbre_clnte,',
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
'        (select c.nmbre_impsto from df_c_impuestos c where c.id_impsto = json_value(:P37_JSON ,''$.id_impsto'' )) nmbre_impsto,',
'        :P36_JSON_ACTOS as json',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(24183527910755695)
,p_shared_query_id=>wwv_flow_api.id(20701783436942784)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--2',
'SELECT distinct  initcap(d.nmbre_impsto_sbmpsto)',
'FROM json_table(',
'  (SELECT a.json_crtfcdos ',
'   FROM nt_g_certificados_json a ',
'   WHERE a.id_nt_crtfcdo_json = json_value(:P37_JSON,''$.id_crtfcdo_json'')),',
'  ''$[*]'' COLUMNS (',
'    id_acto NUMBER PATH ''$.ID_ACTO''',
'  )',
') b',
'JOIN gn_g_actos c ON b.id_acto = c.id_acto',
'JOIN gn_g_actos_sujeto_impuesto b ON c.id_acto = b.id_acto',
'JOIN df_i_impuestos_subimpuesto d ON b.id_impsto_sbmpsto = d.id_impsto_sbmpsto',
'fetch next 1 rows only ',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(24183713456755695)
,p_shared_query_id=>wwv_flow_api.id(20701783436942784)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--3',
'SELECT c.id_acto,',
'       c.nmro_acto,',
'       trunc(c.fcha),',
'       c.fcha_pblccion,',
'       ''PAGINA WEB'' as Tipo_notificacion,',
'       d.idntfccion_sjto,',
'       e.dscrpcion',
'  FROM json_table((SELECT a.json_crtfcdos',
'                    FROM nt_g_certificados_json a',
'                   WHERE a.id_nt_crtfcdo_json =',
'                         json_value(:P37_JSON, ''$.id_crtfcdo_json'')),',
'                  ''$[*]'' COLUMNS(id_acto NUMBER PATH ''$.ID_ACTO'')) b',
'  JOIN gn_g_actos c',
'    ON b.id_acto = c.id_acto',
'  join gn_d_actos_tipo e',
'    on e.id_acto_tpo = c.id_acto_tpo',
'  left join v_gn_g_actos_sujeto_impuesto d',
'    on d.id_acto = c.id_acto',
' order by c.nmro_acto asc',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(24183956576755695)
,p_shared_query_id=>wwv_flow_api.id(20701783436942784)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--4',
'SELECT COUNT(1) AS CANTIDAD',
'FROM json_table(',
'  (SELECT a.json_crtfcdos ',
'   FROM nt_g_certificados_json a ',
'   WHERE a.id_nt_crtfcdo_json = json_value(:P37_JSON,''$.id_crtfcdo_json'')),',
'  ''$[*]'' COLUMNS (',
'    id_acto NUMBER PATH ''$.ID_ACTO''',
'  )',
') b',
'JOIN gn_g_actos c ON b.id_acto = c.id_acto'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(24184148797755695)
,p_shared_query_id=>wwv_flow_api.id(20701783436942784)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--5',
'SELECT initcap(t.dscrpcion) as dscrpcion, pkg_gn_generalidades.fnc_cl_fecha_texto(c.fcha_pblccion) as fecha_pblccion',
'FROM json_table(',
'  (SELECT a.json_crtfcdos ',
'   FROM nt_g_certificados_json a ',
'   WHERE a.id_nt_crtfcdo_json = json_value(:P37_JSON,''$.id_crtfcdo_json'')),',
'  ''$[*]'' COLUMNS (',
'    id_acto NUMBER PATH ''$.ID_ACTO''',
'  )',
') b',
'JOIN gn_g_actos c ON b.id_acto = c.id_acto',
'join gn_d_actos_tipo t on c.id_acto_tpo = t.id_acto_tpo',
'fetch next 1 rows only '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(24184399981755695)
,p_shared_query_id=>wwv_flow_api.id(20701783436942784)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--6',
'select a.nmbre_trcro,a.nmbre_crgo,a.nmbre_ofcna',
'from v_df_c_funcionarios a ',
unistr('where a.nmbre_crgo=''COORDINADOR DE GESTI\00D3N DE INGRESOS'''),
'and a.actvo=''S'';     ',
''))
);
end;
/
