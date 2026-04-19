prompt --application/shared_components/reports/report_queries/pq_g_solicitudes_x_estado
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(17875114188141729)
,p_name=>'pq_g_solicitudes_x_estado'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
' -- 1. Encabezado y pir de pagina',
' select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY HH:MI:SS AM'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        json_value(:P37_JSON ,''$.fcha_in'' )   as fcha_in,',
'        json_value(:P37_JSON ,''$.fcha_fin'' )  as fcha_fin,',
'        upper(json_value(:P37_JSON ,''$.nmbre_rprte'' )) as nmbre_rprte,',
'        :F_NMBRE_USRIO as nmbre_usrio',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'pq_g_solicitudes_x_estado'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(118867933474088345)
,p_shared_query_id=>wwv_flow_api.id(17875114188141729)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' -- 1. Encabezado y pir de pagina',
' select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY HH:MI:SS AM'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        json_value(:P37_JSON ,''$.fcha_in'' )   as fcha_in,',
'        json_value(:P37_JSON ,''$.fcha_fin'' )  as fcha_fin,',
'        upper(json_value(:P37_JSON ,''$.nmbre_rprte'' )) as nmbre_rprte,',
'        :F_NMBRE_USRIO as nmbre_usrio',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(118868117545088345)
,p_shared_query_id=>wwv_flow_api.id(17875114188141729)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_rdcdo_dsplay',
'     , (',
'            select y.dscrpcion',
'              from pq_g_solicitudes_motivo x',
'              join pq_d_motivos            y on x.id_mtvo = y.id_mtvo',
'             where x.id_slctud = a.id_slctud',
'       ) as mtvo',
'     , i.prmer_nmbre ||'' ''|| i.prmer_aplldo as funcionario',
'     , c.estdo_instncia',
'     , a.id_estdo',
'     , trunc(a.fcha_rdcdo) as fcha_rdcdo',
'     , a.fcha_real',
'     , trunc(a.fcha_pryctda) as fcha_pryctda',
'     , case when e.id_estdo_trnscion = 3 then',
'                    ''Respondidas''',
'            when e.id_estdo_trnscion <> 3 and g.id_trea = 413 and a.fcha_real is null then',
unistr('                    ''En Revisi\00F3n''         '),
'            when e.id_estdo_trnscion <> 3 and sysdate < a.fcha_pryctda and a.fcha_real is null then',
'                    ''Por Responder''',
'            when e.id_estdo_trnscion <> 3 and sysdate > a.fcha_pryctda and a.fcha_real is null then',
'                    ''Vencidas''',
'       end as stdo     ',
'     , h.id_usrio ',
'  from pq_g_solicitudes            a',
'  join wf_g_instancias_flujo_gnrdo b on a.id_instncia_fljo           = b.id_instncia_fljo',
'  join wf_g_instancias_flujo       c on b.id_instncia_fljo_gnrdo_hjo = c.id_instncia_fljo',
'  join wf_d_flujos                 d on c.id_fljo                    = d.id_fljo',
'  join wf_g_instancias_transicion  e on c.id_instncia_fljo           = e.id_instncia_fljo',
'  join wf_d_flujos_tarea           f on e.id_fljo_trea_orgen         = f.id_fljo_trea  ',
'  join wf_d_tareas                 g on f.id_trea                    = g.id_trea      ',
'  join sg_g_usuarios               h on e.id_usrio                   = h.id_usrio',
'  join si_c_terceros               i on h.id_trcro                   = i.id_trcro  ',
' where trunc(e.fcha_fin_real) between json_value(:P37_JSON ,''$.fcha_in'' ) and json_value(:P37_JSON ,''$.fcha_fin'' ) ',
'   and h.id_usrio          = case when json_value(:P37_JSON ,''$.id_usrio'' ) is null then',
'                                            :F_ID_USRIO',
'                                  else',
'                                  json_value(:P37_JSON ,''$.id_usrio'' )',
'                             end     ',
'  -- and f.indcdor_incio     = ''S''',
'  and e.id_instncia_trnscion =',
'               (select max(m.id_instncia_trnscion)',
'                  from wf_g_instancias_transicion m',
'                 where m.id_instncia_fljo = e.id_instncia_fljo',
'                 and m.id_usrio = e.id_usrio)'))
);
end;
/
