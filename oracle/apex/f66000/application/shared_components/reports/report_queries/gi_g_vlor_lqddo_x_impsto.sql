prompt --application/shared_components/reports/report_queries/gi_g_vlor_lqddo_x_impsto
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(28198082023138436)
,p_name=>'gi_g_vlor_lqddo_x_impsto'
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
'   and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'gi_g_vlor_lqddo_x_impsto'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(28596533388030799)
,p_shared_query_id=>wwv_flow_api.id(28198082023138436)
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
'   and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(28596709657030799)
,p_shared_query_id=>wwv_flow_api.id(28198082023138436)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_impsto',
'           , a.nmbre_impsto         ',
'           , a.vgncia',
'           , a.prdo',
'           , a.cdgo_cncpto',
'           , a.dscrpcion_cncpto',
'           , a.vlor_lqddo  ',
'           , sum(a.vlor_lqddo) over() vlor_ttal',
'      from (',
'             select  a.id_impsto',
'                   , a.nmbre_impsto         ',
'                   , a.vgncia',
'                   , a.prdo',
'                   , d.cdgo_cncpto',
'                   , d.dscrpcion       as dscrpcion_cncpto',
'                   , sum(b.vlor_lqddo) vlor_lqddo  ',
'                from v_gi_g_liquidaciones            a ',
'                join gi_g_liquidaciones_concepto     b on a.id_lqdcion            = b.id_lqdcion',
'                join df_i_impuestos_acto_concepto    c on b.id_impsto_acto_cncpto = c.id_impsto_acto_cncpto',
'                join df_i_conceptos                  d on c.id_cncpto             = d.id_cncpto',
'               where a.cdgo_clnte         = :F_CDGO_CLNTE',
'                 and a.id_impsto          = nvl(json_value(:P37_JSON, ''$.id_impsto''),a.id_impsto)',
'                 and a.prdo               = nvl(json_value(:P37_JSON, ''$.id_prdo''),a.prdo)',
'                 and a.vgncia             = nvl(json_value(:P37_JSON, ''$.vgncia''),a.vgncia)',
'                 and a.cdgo_lqdcion_estdo = ''L''',
'            group by a.id_impsto',
'                   , a.nmbre_impsto',
'                   , a.vgncia',
'                   , a.prdo',
'                   , d.cdgo_cncpto',
'                   , d.dscrpcion',
'           ) a',
'           order by a.vgncia',
'                  , a.prdo',
'                  , a.cdgo_cncpto;          '))
);
end;
/
