prompt --application/shared_components/reports/report_queries/pq_g_slctdes_x_mtv
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(8043996322317475)
,p_name=>'pq_g_slctdes_x_mtv'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT FUNCIONARIO,',
'       MOTIVO_PQR,',
'       COUNT(*) PQR_VENCIDOS',
'  FROM (',
'        select A.nmro_rdcdo_dsplay,',
'                TRUNC(A.FCHA_RDCDO) FCHA_RDCDO,',
'                (select p.nmbre_impsto',
'                   from df_c_impuestos p',
'                  where p.id_impsto = o.id_impsto) impsto,',
'                o.idntfccion,',
'               -- d.dscrpcion_fljo as motivo,',
'                (SELECT R.DSCRPCION FROM PQ_D_MOTIVOS R WHERE R.ID_MTVO = Q.ID_MTVO) MOTIVO_PQR,',
'                l.dscrpcion estado_pqr,',
'                i.prmer_nmbre || '' '' || i.prmer_aplldo as funcionario,',
'                TO_CHAR(A.FCHA_PRYCTDA, ''DD/MM/YYYY'') FCHA_PRYCTDA,',
'                DECODE(l.dscrpcion,',
'                       ''RADICADO'',',
'                       TRUNC(A.FCHA_PRYCTDA) - TRUNC(SYSDATE)) DIAS_VNCER,',
'                g.nmbre_trea TREA_ACTUAL,',
'                j.estdo_trnscion ESTDO_TREA',
'          from pq_g_solicitudes            a',
'          join wf_g_instancias_flujo_gnrdo b on a.id_instncia_fljo = b.id_instncia_fljo',
'          join wf_g_instancias_flujo       c on b.id_instncia_fljo_gnrdo_hjo = c.id_instncia_fljo',
'          join wf_d_flujos                 d on c.id_fljo = d.id_fljo',
'          join wf_g_instancias_transicion  e on c.id_instncia_fljo = e.id_instncia_fljo',
'          join wf_d_flujos_tarea           f on e.id_fljo_trea_orgen = f.id_fljo_trea',
'          join wf_d_tareas                 g on f.id_trea = g.id_trea',
'          join sg_g_usuarios               h on e.id_usrio = h.id_usrio',
'          join si_c_terceros               i on h.id_trcro = i.id_trcro',
'          join wf_d_estado_transicion      j on e.id_estdo_trnscion = j.id_estdo_trnscion',
'          join PQ_D_ESTADOS                l on l.id_estdo = a.id_estdo',
'          JOIN PQ_G_SOLICITUDES_MOTIVO     N on n.id_slctud = a.id_slctud',
'          join PQ_G_SLCTDES_MTVO_SJT_IMPST o on o.id_slctud_mtvo = n.id_slctud_mtvo',
'          join PQ_G_SOLICITUDES_MOTIVO     Q ON A.ID_SLCTUD = Q.ID_SLCTUD',
'         where trunc(a.fcha_rdcdo)         between json_value(:P37_JSON, ''$.fcha_incial'') and json_value(:P37_JSON, ''$.fcha_fnal'')',
'           and h.id_usrio                  = nvl(json_value(:P37_JSON, ''$.id_usrio''), h.id_usrio)',
'           and e.id_instncia_trnscion in',
'               (select max(m.id_instncia_trnscion)',
'                  from wf_g_instancias_transicion m',
'                 where m.id_instncia_fljo = e.id_instncia_fljo)',
'  )',
'WHERE ESTDO_TREA NOT IN (''FINALIZADA'')',
'AND DIAS_VNCER < 0',
'AND FUNCIONARIO NOT IN (''ADMINISTRADOR MONTERIA'')',
'GROUP BY FUNCIONARIO, MOTIVO_PQR',
'ORDER BY FUNCIONARIO, MOTIVO_PQR'))
,p_format=>'PDF'
,p_output_file_name=>'pq_g_slctdes_x_mtv'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(8044138874317479)
,p_shared_query_id=>wwv_flow_api.id(8043996322317475)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT FUNCIONARIO,',
'       MOTIVO_PQR,',
'       COUNT(*) PQR_VENCIDOS',
'  FROM (',
'        select A.nmro_rdcdo_dsplay,',
'                TRUNC(A.FCHA_RDCDO) FCHA_RDCDO,',
'                (select p.nmbre_impsto',
'                   from df_c_impuestos p',
'                  where p.id_impsto = o.id_impsto) impsto,',
'                o.idntfccion,',
'               -- d.dscrpcion_fljo as motivo,',
'                (SELECT R.DSCRPCION FROM PQ_D_MOTIVOS R WHERE R.ID_MTVO = Q.ID_MTVO) MOTIVO_PQR,',
'                l.dscrpcion estado_pqr,',
'                i.prmer_nmbre || '' '' || i.prmer_aplldo as funcionario,',
'                TO_CHAR(A.FCHA_PRYCTDA, ''DD/MM/YYYY'') FCHA_PRYCTDA,',
'                DECODE(l.dscrpcion,',
'                       ''RADICADO'',',
'                       TRUNC(A.FCHA_PRYCTDA) - TRUNC(SYSDATE)) DIAS_VNCER,',
'                g.nmbre_trea TREA_ACTUAL,',
'                j.estdo_trnscion ESTDO_TREA',
'          from pq_g_solicitudes            a',
'          join wf_g_instancias_flujo_gnrdo b on a.id_instncia_fljo = b.id_instncia_fljo',
'          join wf_g_instancias_flujo       c on b.id_instncia_fljo_gnrdo_hjo = c.id_instncia_fljo',
'          join wf_d_flujos                 d on c.id_fljo = d.id_fljo',
'          join wf_g_instancias_transicion  e on c.id_instncia_fljo = e.id_instncia_fljo',
'          join wf_d_flujos_tarea           f on e.id_fljo_trea_orgen = f.id_fljo_trea',
'          join wf_d_tareas                 g on f.id_trea = g.id_trea',
'          join sg_g_usuarios               h on e.id_usrio = h.id_usrio',
'          join si_c_terceros               i on h.id_trcro = i.id_trcro',
'          join wf_d_estado_transicion      j on e.id_estdo_trnscion = j.id_estdo_trnscion',
'          join PQ_D_ESTADOS                l on l.id_estdo = a.id_estdo',
'          JOIN PQ_G_SOLICITUDES_MOTIVO     N on n.id_slctud = a.id_slctud',
'          join PQ_G_SLCTDES_MTVO_SJT_IMPST o on o.id_slctud_mtvo = n.id_slctud_mtvo',
'          join PQ_G_SOLICITUDES_MOTIVO     Q ON A.ID_SLCTUD = Q.ID_SLCTUD',
'         where trunc(a.fcha_rdcdo)         between json_value(:P37_JSON, ''$.fcha_incial'') and json_value(:P37_JSON, ''$.fcha_fnal'')',
'           and h.id_usrio                  = nvl(json_value(:P37_JSON, ''$.id_usrio''), h.id_usrio)',
'           and e.id_instncia_trnscion in',
'               (select max(m.id_instncia_trnscion)',
'                  from wf_g_instancias_transicion m',
'                 where m.id_instncia_fljo = e.id_instncia_fljo)',
'  )',
'WHERE ESTDO_TREA NOT IN (''FINALIZADA'')',
'AND DIAS_VNCER < 0',
'AND FUNCIONARIO NOT IN (''ADMINISTRADOR MONTERIA'')',
'GROUP BY FUNCIONARIO, MOTIVO_PQR',
'ORDER BY FUNCIONARIO, MOTIVO_PQR'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(8044329156317491)
,p_shared_query_id=>wwv_flow_api.id(8043996322317475)
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
