prompt --application/shared_components/reports/report_queries/fi_g_actos_generados
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(36500764431145782)
,p_name=>'fi_g_actos_generados'
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
'        upper(json_value(:P37_JSON ,''$.nmbre_rprte'' )) as nmbre_rprte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'';'))
,p_format=>'PDF'
,p_output_file_name=>'fi_g_actos_generados'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(36500958802145814)
,p_shared_query_id=>wwv_flow_api.id(36500764431145782)
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
'        upper(json_value(:P37_JSON ,''$.nmbre_rprte'' )) as nmbre_rprte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'';'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(36501137553145814)
,p_shared_query_id=>wwv_flow_api.id(36500764431145782)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--2. Actos Generados y no notificados',
'   select i.nmro_acto',
'        , h.dscrpcion                                 as tpo_acto ',
'        , trunc(f.fcha_crcion)                        as fcha_acto       ',
unistr('        , decode(i.indcdor_ntfccion, ''S'', ''S\00ED'', ''No'') as ntfcdo       '),
'        , i.id_acto',
'        , e.nmro_expdnte',
'        , e.id_expdnte',
'        , b.nmbre_rzon_scial',
'        , c.idntfccion_sjto',
'     from v_fi_g_candidatos              a',
'     join si_i_personas                  b   on  a.id_sjto_impsto        =   b.id_sjto_impsto',
'     join v_si_i_sujetos_impuesto        c   on  b.id_sjto_impsto        =   c.id_sjto_impsto',
'     join fi_g_fiscalizacion_expdnte     e   on  a.id_cnddto             =   e.id_cnddto',
'     join fi_g_fsclzcion_expdnte_acto    f   on  e.id_fsclzcion_expdnte  =   f.id_fsclzcion_expdnte',
'     join gn_g_actos                     i   on  f.id_acto               =   i.id_acto',
'     join gn_d_actos_tipo                h   on  i.id_acto_tpo           =   h.id_acto_tpo',
'    where a.cdgo_clnte               = :F_CDGO_CLNTE',
'      and h.id_acto_tpo              = nvl(json_value(:P37_JSON ,''$.tpo_acto'' ),h.id_acto_tpo)',
'      and trunc(f.fcha_crcion) between json_value(:P37_JSON ,''$.fcha_in'' ) ',
'                                   and json_value(:P37_JSON ,''$.fcha_fin'' )',
'      and i.indcdor_ntfccion         = nvl(json_value(:P37_JSON ,''$.ntfcdo'' ),i.indcdor_ntfccion)',
'    order by 9,6,1;'))
);
end;
/
