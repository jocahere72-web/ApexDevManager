prompt --application/shared_components/reports/report_queries/pq_g_slctdes_rcbdas_x_fcha
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(8071517093705450)
,p_name=>'pq_g_slctdes_rcbdas_x_fcha'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  count(*) ',
'       ,b.dscrpcion',
'  from pq_g_solicitudes  a',
'  join pq_d_estados      b on a.id_estdo = b.id_estdo         ',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and trunc(a.fcha_rdcdo) between ''01/01/2021'' and ''01/03/2021'' ',
'group by b.dscrpcion',
''))
,p_format=>'PDF'
,p_output_file_name=>'pq_g_slctdes_rcbdas_x_fcha'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(8112685774178036)
,p_shared_query_id=>wwv_flow_api.id(8071517093705450)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(radicado_cntdad,0) radicado',
'      ,nvl(resuelto_cntdad,0) resuelto',
'      ,nvl(tramite_cntdad,0)  tramite  ',
'      ,nvl(radicado_cntdad,0) + nvl(resuelto_cntdad,0) + nvl(tramite_cntdad,0) total',
'      ,''Estados'' ',
'from (',
'    select  count(*) cantidad',
'           ,b.dscrpcion',
'      from pq_g_solicitudes  a',
'      join pq_d_estados      b on a.id_estdo = b.id_estdo         ',
'     where a.cdgo_clnte        = :F_CDGO_CLNTE ',
'       and trunc(a.fcha_rdcdo) between json_value(:P37_JSON, ''$.fcha_incial'') and json_value(:P37_JSON, ''$.fcha_fnal'')',
'    group by b.dscrpcion',
') pivot(SUM(cantidad) as cntdad  for dscrpcion in (''RADICADO'' RADICADO, ''RESUELTO'' RESUELTO, ''EN TRAMITE'' TRAMITE))',
'group by  nvl(radicado_cntdad,0) ',
'      ,nvl(resuelto_cntdad,0)',
'      ,nvl(tramite_cntdad,0)   ',
'      ,nvl(radicado_cntdad,0) + nvl(resuelto_cntdad,0) + nvl(tramite_cntdad,0);',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(8112837787178036)
,p_shared_query_id=>wwv_flow_api.id(8071517093705450)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte',
'       ,upper(b.slgan)slgan',
'       ,pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan',
'       ,to_char(systimestamp, ''DD/MM/YYYY HH:MM:SS AM'') HOY',
'       ,:F_IP as ipaddr',
'       ,:F_NMBRE_USRIO as Usuario     ',
'       ,a.file_mimetype',
'      ,json_value(:P37_JSON ,''$.fcha_incial'' )          as fcha_incial',
'      ,json_value(:P37_JSON ,''$.fcha_fnal'' )            as fcha_fnal',
'      ,upper(json_value(:P37_JSON ,''$.nmbre_rprte'' ))  as nmbre_rprte',
'from df_c_imagenes_cliente a',
'join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.cdgo_imgen_clnte = ''L_E'''))
);
end;
/
