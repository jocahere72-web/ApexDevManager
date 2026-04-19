prompt --application/shared_components/reports/report_queries/pq_g_estadisticas_x_funcionrio
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(106075307227632283)
,p_name=>'pq_g_estadisticas_x_funcionrio'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Encabezado y Pie de Pagina',
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       upper(json_value(:P37_JSON ,''$.nmbre_rprte '')) as nmbre_rprte',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E'';'))
,p_format=>'PDF'
,p_output_file_name=>'pq_g_estadisticas_x_funcionrio'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(106101527123781055)
,p_shared_query_id=>wwv_flow_api.id(106075307227632283)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Encabezado y Pie de Pagina',
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       upper(json_value(:P37_JSON ,''$.nmbre_rprte '')) as nmbre_rprte',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E'';'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(106101725465781055)
,p_shared_query_id=>wwv_flow_api.id(106075307227632283)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.id_usrio',
'     , d.nmbre_trcro',
'     , sum(atnddas_cntda) as atnddas',
'     , sum(vncdas_cntda)  as vncdas',
'     , sum(pndnte_cntda)  as pndntes',
'     , sum(atnddas_cntda) + sum(vncdas_cntda) + sum(pndnte_cntda) as rdcdas',
'  from (',
'            select distinct a.id_slctud',
'                 , b.id_usrio',
'                 , case ',
'                        when trunc(a.fcha_real) <= trunc(a.fcha_pryctda) then',
'                                ''AT''',
'                        when trunc(a.fcha_pryctda) <= trunc(sysdate) then',
'                                ''VE''',
'                        when trunc(sysdate) <= trunc(a.fcha_pryctda) and trunc(a.fcha_real) is null then',
'                                ''PD''',
'                   end as cse',
'              from pq_g_solicitudes           a',
'              join wf_g_instancias_transicion b on a.id_instncia_fljo = b.id_instncia_fljo and b.id_estdo_trnscion in (2,1,4)',
'             where trunc(a.fcha_rdcdo) between json_value(:P37_JSON, ''$.fcha_incial'') and json_value(:P37_JSON, ''$.fcha_fnal'')',
'       ) pivot (count (1) as cntda for cse in (''AT'' as atnddas, ''VE'' as vncdas, ''PD'' as pndnte)) c',
'    join v_sg_g_usuarios d on c.id_usrio   = d.id_usrio ',
'                          and d.id_fncnrio is not null',
'  where d.id_usrio  = nvl(json_value(:P37_JSON, ''$.id_usrio''), d.id_usrio)',
'   group by c.id_usrio',
'       , d.nmbre_trcro',
'   order by c.id_usrio '))
);
end;
/
