prompt --application/shared_components/reports/report_queries/gf_g_cnvnio_x_usrio
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(37229777182425937)
,p_name=>'gf_g_cnvnio_x_usrio'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. encabezado y pie de pagina',
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY HH:MI AM'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       json_value(:P37_JSON,''$.fcha_i'') as fcha_incial,',
'       json_value(:P37_JSON,''$.fcha_f'') as fcha_fnal,',
'       upper(json_value(:P37_JSON,''$.nmbre_rprte'')) as nmbre_rprte',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E''  '))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_cnvnio_x_usrio'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(39668328041383479)
,p_shared_query_id=>wwv_flow_api.id(37229777182425937)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. encabezado y pie de pagina',
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY HH:MI AM'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       json_value(:P37_JSON,''$.fcha_i'') as fcha_incial,',
'       json_value(:P37_JSON,''$.fcha_f'') as fcha_fnal,',
'       upper(json_value(:P37_JSON,''$.nmbre_rprte'')) as nmbre_rprte',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E''  ',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(39668577838383479)
,p_shared_query_id=>wwv_flow_api.id(37229777182425937)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--2.datos basicos',
'select a.nmro_cnvnio',
'     , a.nmbre_slctnte',
'     , a.nmbre_rdcdor as usrio_registra',
'     , trunc(a.fcha_rdcdo)   as fcha_rgstro',
'     , d.nmbre_trcro  as usrrio_aprbcion',
'     , trunc(a.fcha_aprbcion) as fcha_aprbcion',
'     , a.dscrpcion_cnvnio_estdo',
'     , a.id_usrio_aprbcion',
'     , trunc(b.fcha)   as fcha_acto',
'     , nvl(b.nmro_acto,''-'')     as nmro_acto',
'     , (c.cdgo_acto_tpo ||'' - ''|| c.dscrpcion) as tpo_acto',
'  from v_gf_g_convenios     a',
'  left join gn_g_actos      b on a.id_acto           = b.id_acto',
'  left join gn_d_actos_tipo c on b.id_acto_tpo       = c.id_acto_tpo',
'  join v_sg_g_usuarios      d on a.id_usrio_aprbcion = d.id_usrio',
' where a.cdgo_clnte                          = :F_CDGO_CLNTE',
'   and a.nmro_cnvnio                         = nvl(json_value(:P37_JSON, ''$.nmro_cnvnio''),a.nmro_cnvnio)',
'   and a.cdgo_cnvnio_estdo                   = nvl(json_value(:P37_JSON, ''$.cdgo_cnvnio_estdo''),a.cdgo_cnvnio_estdo)',
'   and trunc(a.fcha_rdcdo)             between json_value(:P37_JSON, ''$.fcha_i'')',
'                                           and json_value(:P37_JSON, ''$.fcha_f'')',
'   and a.id_usrio_aprbcion                   = nvl(json_value(:P37_JSON, ''$.id_usrio''), a.id_usrio_aprbcion)',
'order by 4   '))
);
end;
/
