prompt --application/shared_components/reports/report_queries/gi_g_vlr_dclrdo_x_mes
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(28196320383133325)
,p_name=>'gi_g_vlr_dclrdo_x_mes'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       upper(json_value(:P37_JSON,''$.nmbre_rprte'')) as nmbre_rprte,',
'       json_value(:P37_JSON,''$.mes'') as mes',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E''',
'    '))
,p_format=>'PDF'
,p_output_file_name=>'gi_g_vlr_dclrdo_x_mes'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(28196536770133328)
,p_shared_query_id=>wwv_flow_api.id(28196320383133325)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       upper(json_value(:P37_JSON,''$.nmbre_rprte'')) as nmbre_rprte,',
'       json_value(:P37_JSON,''$.mes'') as mes',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E''',
'    '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(28196777994133337)
,p_shared_query_id=>wwv_flow_api.id(28196320383133325)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select d.id_impsto,',
'               d.nmbre_impsto,',
'               to_char(a.fcha_prsntcion, ''YYYY'') as anio_prsntcion,',
'               to_char(a.fcha_prsntcion, ''MM'')   as mes_prsntcion,',
'               c.dscrpcion                       as dscrpcion_concpto,',
'               sum(b.vlor_dbe) vlor_dclrdo',
'          from gi_g_declaraciones          a',
'          join gi_g_dclrcnes_mvmnto_fnncro b   on  b.id_dclrcion   =   a.id_dclrcion',
'          join df_i_conceptos              c   on  c.id_cncpto     =   b.id_cncpto',
'          join df_c_impuestos              d   on  a.id_impsto     =   d.id_impsto  ',
'         where a.cdgo_clnte            =   :F_CDGO_CLNTE',
'           and a.id_impsto             =   nvl(json_value(:P37_JSON,''$.id_impsto''),c.id_impsto )',
'           and a.cdgo_dclrcion_estdo   in  (''PRS'', ''APL'' , ''COR'')',
'           and to_char(a.fcha_prsntcion, ''YYYY'') = nvl(json_value(:P37_JSON,''$.anio''),to_char(a.fcha_prsntcion, ''YYYY''))',
'           and to_char(a.fcha_prsntcion, ''MM'')   = nvl(json_value(:P37_JSON,''$.mes''),to_char(a.fcha_prsntcion, ''MM''))',
'      group by d.id_impsto,',
'               d.nmbre_impsto,',
'               to_char(a.fcha_prsntcion, ''YYYY''),',
'               to_char(a.fcha_prsntcion, ''MM''),',
'               c.dscrpcion',
'      order by to_number(to_char(a.fcha_prsntcion, ''YYYY'')),',
'               to_number(to_char(a.fcha_prsntcion, ''MM'')),',
'               c.dscrpcion'))
);
end;
/
