prompt --application/shared_components/reports/report_queries/gd_g_tabla_retencion_documental
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(36721730419154363)
,p_name=>'gd_g_tabla_retencion_documental'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select   b.cdgo_trd',
'         , b.nmbre_prcso',
'         , b.nmbre_area',
'         , a.cdgo_srie',
'         , a.nmbre_srie',
'         , a.cdgo_sbsrie',
'         , a.indcdor_dspccion_ct',
'         , a.indcdor_dspccion_md',
'         , a.indcdor_dspccion_e',
'         , a.indcdor_dspccion_s',
'         , a.tmpo_cntral',
'         , a.tmpo_gstion',
'         , a.tmpo_hstrco',
'         , c.cdgo_dcmnto_tpo',
'         , c.nmbre',
'    from v_gd_d_trd_serie a ',
'    join v_gd_d_trd_serie_dcmnto_tpo b ',
'      on b.id_trd = a.id_trd ',
'    join gd_d_documentos_tipo c ',
'      on b.id_dcmnto_tpo= c.id_dcmnto_tpo',
' where a.id_trd     = :1',
'   and a.cdgo_clnte = 6;',
'   '))
,p_report_layout_id=>wwv_flow_api.id(37342357820148811)
,p_format=>'PDF'
,p_output_file_name=>'gd_g_tabla_retencion_documental'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(37364191089299896)
,p_shared_query_id=>wwv_flow_api.id(36721730419154363)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select  a.id_trd',
'       , a.id_srie',
'       , a.id_sbsrie',
'       , b.cdgo_trd',
'       , upper(b.nmbre_prcso) as nmbre_prcso',
'       , upper(b.nmbre_area) as nmbre_area',
'       , a.cdgo_srie',
'       ,/* ''* ''||*/upper(a.nmbre_srie) as nmbre_srie',
'       , a.cdgo_sbsrie',
'       , /*''  ''||chr(129)||'' ''||*/upper( a.nmbre_sbsrie) as nmbre_sbsrie',
'       , b.id_dcmnto_tpo',
'       , /*''    ''||chr(176)||'' ''||*/b.nmbre as nmbre_dcmnto',
unistr('       , decode(a.indcdor_dspccion_ct,''S'', ''S\00ED'', ''No'') as indcdor_dspccion_ct'),
unistr('       , decode(a.indcdor_dspccion_md,''S'', ''S\00ED'', ''No'') as indcdor_dspccion_md'),
unistr('       , decode(a.indcdor_dspccion_e,''S'', ''S\00ED'', ''No'')  as indcdor_dspccion_e'),
unistr('       , decode(a.indcdor_dspccion_s,''S'', ''S\00ED'', ''No'')  as indcdor_dspccion_s'),
'       , a.tmpo_cntral',
'       , a.tmpo_gstion',
'       , a.tmpo_hstrco',
'       , json_value(:P6_JSON_PARAM , ''$.nmbre_rprte'') as nombre_reporte',
'  from v_gd_d_trd_serie a',
'  join v_gd_d_trd_serie_dcmnto_tpo b',
'    on b.id_trd_srie = a.id_trd_srie ',
' where a.id_trd in (',
'                     select a.id',
'                      from json_table(',
'                                       :P6_JSON_PARAM , ''$.id_trd[*]''',
'                                          columns ( id number path ''$.id'' )',
'                                      ) a',
'                   )',
'   and a.cdgo_clnte    = :F_CDGO_CLNTE',
'   and a.id_trd=b.id_trd',
'   order by a.id_trd',
'          , a.id_srie',
'          , a.id_sbsrie;',
'          '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(37364353807299896)
,p_shared_query_id=>wwv_flow_api.id(36721730419154363)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'----------Encabezado y Pie de Pagina-----------------',
'select upper(b.nmbre_clnte) as nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,        ',
'       (select upper(nmbre_rprte) from gn_d_reportes m where m.id_rprte = :P_ID_RPRTE) as nmbre_rpte',
'from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'';'))
);
end;
/
