prompt --application/shared_components/reports/report_queries/pq_g_radicados_x_usuario
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(107015642844561191)
,p_name=>'pq_g_radicados_x_usuario'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
' -- 1. Encabezado y pir de pagina',
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
'    and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'pq_g_radicados_x_usuario'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(15887094472512776)
,p_shared_query_id=>wwv_flow_api.id(107015642844561191)
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
 p_id=>wwv_flow_api.id(15887220647512776)
,p_shared_query_id=>wwv_flow_api.id(107015642844561191)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 2. Detalle del reporte',
'select a.nmro_rdcdo_dsplay',
'     , to_char(a.fcha_rdcdo, ''DD/MM/YYYY'')                                           fcha_rdcdo',
'     , (select p.nmbre_impsto from df_c_impuestos p where p.id_impsto = o.id_impsto) impsto',
'     , o.idntfccion',
'     , d.dscrpcion_fljo                                                              motivo',
'     , l.dscrpcion                                                                   estado_pqr',
'     , to_char(a.fcha_pryctda, ''DD/MM/YYYY'')                                         fcha_compromiso',
'     , decode(l.dscrpcion,''RADICADO'',trunc(a.fcha_pryctda) - trunc(sysdate))         dias_vencer',
'     , g.nmbre_trea                                                                  ultima_tarea',
'     , j.estdo_trnscion                                                              estado_tarea     ',
'  from pq_g_solicitudes            a',
'  join wf_g_instancias_flujo_gnrdo b on a.id_instncia_fljo           = b.id_instncia_fljo',
'  join wf_g_instancias_flujo       c on b.id_instncia_fljo_gnrdo_hjo = c.id_instncia_fljo',
'  join wf_d_flujos                 d on c.id_fljo                    = d.id_fljo',
'  join wf_g_instancias_transicion  e on c.id_instncia_fljo           = e.id_instncia_fljo',
'  join wf_d_flujos_tarea           f on e.id_fljo_trea_orgen         = f.id_fljo_trea',
'  join wf_d_tareas                 g on f.id_trea                    = g.id_trea',
'  join sg_g_usuarios               h on e.id_usrio                   = h.id_usrio',
'  join si_c_terceros               i on h.id_trcro                   = i.id_trcro',
'  join wf_d_estado_transicion      j on e.id_estdo_trnscion          = j.id_estdo_trnscion',
'  join pq_d_estados                l on l.id_estdo                   = a.id_estdo',
'  join pq_g_solicitudes_motivo     n on n.id_slctud                  = a.id_slctud',
'  left join pq_g_slctdes_mtvo_sjt_impst o on o.id_slctud_mtvo             = n.id_slctud_mtvo',
' where trunc(a.fcha_rdcdo) between json_value(:P37_JSON ,''$.fcha_in'' ) and json_value(:P37_JSON ,''$.fcha_fin'' ) ',
'   and h.id_usrio = :F_ID_USRIO',
'   and e.id_instncia_trnscion in',
'       (',
'            select max(m.id_instncia_trnscion)',
'              from wf_g_instancias_transicion  m',
'             where m.id_instncia_fljo = e.id_instncia_fljo',
'       )',
' order by a.id_slctud',
'     , e.id_instncia_trnscion'))
);
end;
/
