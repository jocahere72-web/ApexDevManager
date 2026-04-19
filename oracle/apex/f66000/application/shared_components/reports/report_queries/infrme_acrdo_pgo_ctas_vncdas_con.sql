prompt --application/shared_components/reports/report_queries/infrme_acrdo_pgo_ctas_vncdas_con
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(25292300457284343)
,p_name=>'infrme_acrdo_pgo_ctas_vncdas_con'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select upper(b.nmbre_clnte)nmbre_clnte',
'        , upper(b.slgan)slgan',
'        , pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan',
'        , to_char(systimestamp, ''DD/MM/YYYY HH:MM:SS AM'') HOY',
'        , :F_IP as ipaddr',
'        , :F_NMBRE_USRIO        as Usuario     ',
'        , a.file_mimetype',
'        , json_value(:P37_JSON ,''$.nmro_ctas_vncdas'' )     as nmro_ctas_vncdas',
'        , upper(json_value(:P37_JSON ,''$.nmbre_rprte'' ))   as nmbre_rprte',
'     from df_c_imagenes_cliente a',
'     join df_s_clientes         b on a.cdgo_clnte = b.cdgo_clnte ',
'    where a.cdgo_clnte          = :F_CDGO_CLNTE',
'      and a.cdgo_imgen_clnte    = ''L_E'' '))
,p_report_layout_id=>wwv_flow_api.id(25292124479284110)
,p_format=>'PDF'
,p_output_file_name=>'infrme_acrdo_pgo_ctas_vncdas_con'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(25299447322435037)
,p_shared_query_id=>wwv_flow_api.id(25292300457284343)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select upper(b.nmbre_clnte)nmbre_clnte',
'        , upper(b.slgan)slgan',
'        , pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan',
'        , to_char(systimestamp, ''DD/MM/YYYY HH:MM:SS AM'') HOY',
'        , :F_IP as ipaddr',
'        , :F_NMBRE_USRIO        as Usuario     ',
'        , a.file_mimetype',
'        , json_value(:P37_JSON ,''$.nmro_ctas_vncdas'' )    as nmro_ctas_vncdas',
'        , upper(json_value(:P37_JSON ,''$.nmbre_rprte'' ))   as nmbre_rprte',
'     from df_c_imagenes_cliente a',
'     join df_s_clientes         b on a.cdgo_clnte = b.cdgo_clnte ',
'    where a.cdgo_clnte          = :F_CDGO_CLNTE',
'      and a.cdgo_imgen_clnte    = ''L_E'' '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(25299639923435037)
,p_shared_query_id=>wwv_flow_api.id(25292300457284343)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select count(a.id_cnvnio)                                                           ttal_acrdos',
'        , a.nmbre_impsto',
'        , trim(to_char(sum(b.vlor_cptal), ''999G999G999G999G999''))                      ttal_cptal_ap',
'        , trim(to_char(sum(b.vlor_intres), ''999G999G999G999G999''))                     ttal_intres_ap',
'        , trim(to_char(sum((b.vlor_cptal + b.vlor_intres)), ''999G999G999G999G999''))    ttal_ap',
'     from v_gf_g_convenios                  a',
'     join (select a.id_cnvnio',
'                , count(a.nmro_cta)             nmro_cta_vncdas',
'                , sum(a.vlor_cptal)             vlor_cptal',
'                , sum(a.vlor_intres)            vlor_intres    ',
'             from v_gf_g_convenios_extracto     a',
'            where a.cdgo_clnte                  = :F_CDGO_CLNTE',
'              and a.estdo_cta                   = ''VENCIDA''',
'         group by a.id_cnvnio)              b on a.id_cnvnio = b.id_cnvnio',
'      and b.nmro_cta_vncdas                 >= json_value(:P37_JSON ,''$.nmro_ctas_vncdas'' )',
'    where a.cdgo_cnvnio_estdo               = ''APL''',
' group by a.nmbre_impsto'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(25299874488435037)
,p_shared_query_id=>wwv_flow_api.id(25292300457284343)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select count(a.id_cnvnio)                                                           ttal_acrdos',
'        , trim(to_char(sum(b.vlor_cptal), ''999G999G999G999G999''))                      ttal_cptal_ap',
'        , trim(to_char(sum(b.vlor_intres), ''999G999G999G999G999''))                     ttal_intres_ap',
'        , trim(to_char(sum((b.vlor_cptal + b.vlor_intres)), ''999G999G999G999G999''))    ttal_ap',
'     from v_gf_g_convenios                  a',
'     join (select a.id_cnvnio',
'                , count(a.nmro_cta)             nmro_cta_vncdas',
'                , sum(a.vlor_cptal)             vlor_cptal',
'                , sum(a.vlor_intres)            vlor_intres    ',
'             from v_gf_g_convenios_extracto     a',
'            where a.cdgo_clnte                  = :F_CDGO_CLNTE',
'              and a.estdo_cta                   = ''VENCIDA''',
'         group by a.id_cnvnio)              b on a.id_cnvnio = b.id_cnvnio',
'      and b.nmro_cta_vncdas                 >= json_value(:P37_JSON ,''$.nmro_ctas_vncdas'' )',
'    where a.cdgo_cnvnio_estdo               = ''APL'''))
);
end;
/
