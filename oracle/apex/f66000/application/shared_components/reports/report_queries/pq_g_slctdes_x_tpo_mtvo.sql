prompt --application/shared_components/reports/report_queries/pq_g_slctdes_x_tpo_mtvo
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(8136502056365248)
,p_name=>'pq_g_slctdes_x_tpo_mtvo'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  count(*) cantidad',
'       ,c.dscrpcion',
'       ,trunc(a.fcha_rdcdo) fcha_rdcdo',
'       ,trunc(a.fcha_pryctda)fcha_pryctda',
'       ,d.dscrpcion estado',
'  from pq_g_solicitudes         a',
'  join pq_g_solicitudes_motivo  b on b.id_slctud = a.id_slctud ',
'  join pq_d_motivos             c on b.id_mtvo   = c.id_mtvo   ',
'  join pq_d_estados 			d on d.id_estdo  = a.id_estdo',
' where trunc(a.fcha_rdcdo) between ''01/01/2021'' and ''01/03/2021'' ',
'group by c.dscrpcion, ',
'        trunc(a.fcha_rdcdo), ',
'        trunc(a.fcha_pryctda), ',
'        d.dscrpcion ;'))
,p_format=>'PDF'
,p_output_file_name=>'pq_g_slctdes_x_tpo_mtvo'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(34662124260822227)
,p_shared_query_id=>wwv_flow_api.id(8136502056365248)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  count(*) cantidad',
'       ,c.dscrpcion',
'      -- ,d.dscrpcion estado',
'       --,e.nmbre_trcro',
'  from pq_g_solicitudes         a',
'  join pq_g_solicitudes_motivo  b on b.id_slctud = a.id_slctud ',
'  join pq_d_motivos             c on b.id_mtvo   = c.id_mtvo   ',
'  join pq_d_estados 			d on d.id_estdo  = a.id_estdo',
'  join v_sg_g_usuarios          e on a.id_usrio  = e.id_usrio',
' where trunc(a.fcha_rdcdo)     between  json_value(:P37_JSON, ''$.fcha_incial'') and json_value(:P37_JSON, ''$.fcha_fnal'')',
' and   c.id_mtvo               = nvl(json_value(:P37_JSON, ''$.mtvo''),c.id_mtvo )',
' and   a.id_usrio              = nvl(json_value(:P37_JSON, ''$.id_usrio''), a.id_usrio)  ',
'group by c.dscrpcion ',
'        --d.dscrpcion',
'order by c.dscrpcion',
'       -- e.nmbre_trcro;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(34662369806822227)
,p_shared_query_id=>wwv_flow_api.id(8136502056365248)
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
'and a.cdgo_imgen_clnte = ''L_E''',
''))
);
end;
/
