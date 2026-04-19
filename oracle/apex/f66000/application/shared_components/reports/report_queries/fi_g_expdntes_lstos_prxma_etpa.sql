prompt --application/shared_components/reports/report_queries/fi_g_expdntes_lstos_prxma_etpa
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(36501801431150291)
,p_name=>'fi_g_expdntes_lstos_prxma_etpa'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Encabezado y pir de pagina',
' select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        json_value(:P37_JSON ,''$.fcha_in'' )   as fcha_in,',
'        json_value(:P37_JSON ,''$.fcha_fin'' )  as fcha_fin,',
'        (select upper(nmbre_rprte) from gn_d_reportes where id_rprte = :P_ID_RPRTE) as nmbre_rprte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'';'))
,p_format=>'PDF'
,p_output_file_name=>'fi_g_expdntes_lstos_prxma_etpa'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(36502039692150291)
,p_shared_query_id=>wwv_flow_api.id(36501801431150291)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Encabezado y pir de pagina',
' select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        json_value(:P37_JSON ,''$.fcha_in'' )   as fcha_in,',
'        json_value(:P37_JSON ,''$.fcha_fin'' )  as fcha_fin,',
'        (select upper(nmbre_rprte) from gn_d_reportes where id_rprte = :P_ID_RPRTE) as nmbre_rprte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'';'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(36502235884150291)
,p_shared_query_id=>wwv_flow_api.id(36501801431150291)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--2. Expedientes Listos para la siguiente Etapa:',
'    select a.nmro_expdnte,',
'           to_char(a.fcha_aprtra,''DD/MM/YYYY HH:MI:SS am'') as fcha_aprtra,',
'           c.nmro_acto,',
'           e.dscrpcion as tpo_acto,',
unistr('           decode(c.indcdor_ntfccion, ''S'',''S\00ED'', ''No'') as indcdor_ntfccion,'),
'           d.drcion,',
'           to_char(c.fcha_ntfccion,''DD/MM/YYYY HH:MI:SS am'') as fcha_ntfccion,',
'           d.id_fljo_trea,     ',
'           g.nmbre_trea,',
'           to_char(pk_util_calendario.fnc_cl_fecha_final(p_cdgo_clnte  => c.cdgo_clnte,',
'                                                 p_fecha_inicial  => c.fcha_ntfccion,',
'                                                 p_undad_drcion   => d.undad_drcion,',
'                                                 p_drcion         => d.drcion,',
'                                                 p_dia_tpo        => d.dia_tpo),''DD/MM/YYYY HH:MI:SS am'') as termino',
'       from fi_g_fiscalizacion_expdnte     a',
'       join fi_g_fsclzcion_expdnte_acto    b   on  a.id_fsclzcion_expdnte  =   b.id_fsclzcion_expdnte',
'       join gn_g_actos                     c   on  b.id_acto               =   c.id_acto',
'       join gn_d_actos_tipo_tarea          d   on  b.id_acto_tpo           =   d.id_acto_tpo',
'       join gn_d_actos_tipo                e   on  b.id_acto_tpo           =   e.id_acto_tpo  ',
'       join v_wf_d_flujos_tarea            g   on  d.id_fljo_trea          =   g.id_fljo_trea  ',
'      where c.cdgo_clnte       = :F_CDGO_CLNTE ',
'        and c.indcdor_ntfccion = ''S''',
'        and trunc(sysdate)     >= trunc(pk_util_calendario.fnc_cl_fecha_final(p_cdgo_clnte     => c.cdgo_clnte,',
'                                                                              p_fecha_inicial  => c.fcha_ntfccion,',
'                                                                              p_undad_drcion   => d.undad_drcion,',
'                                                                              p_drcion         => d.drcion,',
'                                                                              p_dia_tpo        => d.dia_tpo)) ',
'        and d.actvo = ''S''',
'      order by 1,3    '))
);
end;
/
