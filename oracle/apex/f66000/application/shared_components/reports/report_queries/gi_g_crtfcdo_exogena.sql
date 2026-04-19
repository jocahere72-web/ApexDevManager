prompt --application/shared_components/reports/report_queries/gi_g_crtfcdo_exogena
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(48739387884278617)
,p_name=>'gi_g_crtfcdo_exogena'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'          upper(b.slgan)slgan,',
'          pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MM/YYYY HH24:MI'')    as HOY,',
'          :F_IP                                          as ipaddr,',
'          :F_NMBRE_USRIO                                 as Usuario,       ',
'          a.file_mimetype,',
'          upper(json_value(:P37_JSON ,''$.nmbre_rprte '')) as nmbre_rprte',
'     from df_c_imagenes_cliente a',
'     join df_s_clientes         b on a.cdgo_clnte = b.cdgo_clnte ',
'    where a.cdgo_clnte       = :F_CDGO_CLNTE',
'      and a.cdgo_imgen_clnte = ''L_E'''))
,p_xml_structure=>'STANDARD'
,p_format=>'PDF'
,p_output_file_name=>'gi_g_crtfcdo_exogena'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(48739513732278624)
,p_shared_query_id=>wwv_flow_api.id(48739387884278617)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'          upper(b.slgan)slgan,',
'          pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MM/YYYY HH24:MI'')    as HOY,',
'          :F_IP                                          as ipaddr,',
'          :F_NMBRE_USRIO                                 as Usuario,       ',
'          a.file_mimetype,',
'          upper(json_value(:P37_JSON ,''$.nmbre_rprte '')) as nmbre_rprte',
'     from df_c_imagenes_cliente a',
'     join df_s_clientes         b on a.cdgo_clnte = b.cdgo_clnte ',
'    where a.cdgo_clnte       = :F_CDGO_CLNTE',
'      and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(48739700377278624)
,p_shared_query_id=>wwv_flow_api.id(48739387884278617)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_rzon_scial',
'        , c.idntfccion',
'        , a.vgncia      ',
'        , json_value(:P37_JSON ,''$.cnsctvo '') as cnsctivo',
'        , extract(year from sysdate)          as anio',
'        , extract (month from sysdate)        as mes',
'        , extract(day from sysdate)           as dia',
'    from v_gi_g_informacion_exogena   a',
'    join v_si_i_personas              b on a.id_sjto_impsto = b.id_sjto_impsto',
'    join si_c_sujetos                 c on b.id_sjto        = c.id_sjto',
'   where a.id_sjto_impsto = json_value(:P37_JSON, ''$.id_sjto_impsto'') '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(48739912032278624)
,p_shared_query_id=>wwv_flow_api.id(48739387884278617)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select initcap(a.nmbre ||'' - ''|| a.dscrpcion)  as archvo',
unistr('        , nvl2(b.id_exgna_archvo_tpo, ''S\00ED'', ''No'') as prsntdo'),
'        , trunc(b.fcha_dgta)                             as fcha_prsntcion',
'    from df_i_exogena_archivo_tipo a',
'    left join (',
'                 select x.id_exgna_archvo_tpo',
'                      , x.fcha_dgta',
'                   from gi_g_informacion_exogena x',
'                  where x.id_sjto_impsto = json_value(:P37_JSON, ''$.id_sjto_impsto'')',
'                ) b',
'        on a.id_exgna_archvo_tpo = b.id_exgna_archvo_tpo',
'     where a.cdgo_clnte = :F_CDGO_CLNTE     ',
'       and a.actvo     = ''S''',
'     order by a.id_exgna_archvo_tpo   '))
);
end;
/
