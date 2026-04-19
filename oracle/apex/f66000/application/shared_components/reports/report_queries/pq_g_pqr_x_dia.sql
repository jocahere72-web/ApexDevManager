prompt --application/shared_components/reports/report_queries/pq_g_pqr_x_dia
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(55446893532123470)
,p_name=>'pq_g_pqr_x_dia'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT TRUNC(a.FCHA_RDCDO) AS "FECHA RADICADO",',
'       b.NMBRE_SLCTNTE AS "REMITENTE",',
'       a.nmro_rdcdo_dsplay AS "NUMERO DE RADICADO",',
'       a.NMBRE_TRCRO AS "USUARIO RADICADOR",',
'       d.nmbre_trcro AS "NOMBRE ABOGADO ASIGNADO"',
'  FROM genesys.v_pq_g_solicitudes a',
'  JOIN genesys.v_pq_g_solicitantes b',
'    ON b.id_slctud = a.id_slctud',
'  JOIN (SELECT c.id_instncia_fljo,',
'               u.nmbre_trcro,',
'               ROW_NUMBER() OVER (PARTITION BY c.id_instncia_fljo ORDER BY c.id_instncia_fljo) AS rn',
'          FROM genesys.wf_g_instancias_transicion c',
'          JOIN genesys.v_sg_g_usuarios u',
'            ON u.id_usrio = c.id_usrio) d',
'    ON d.id_instncia_fljo = a.id_instncia_fljo_gnrdo',
'   AND d.rn = 1',
' WHERE --a.nmro_rdcdo_dsplay=''2024-10013463'';',
'  trunc(a.fcha_rdcdo) between json_value(:P37_JSON, ''$.fcha_incial'') and json_value(:P37_JSON, ''$.fcha_fnal'');'))
,p_format=>'PDF'
,p_output_file_name=>'pq_g_pqr_x_dia'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(68670156643244613)
,p_shared_query_id=>wwv_flow_api.id(55446893532123470)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT TRUNC(a.FCHA_RDCDO) AS "FECHA RADICADO",',
'       b.NMBRE_SLCTNTE AS "REMITENTE",',
'       a.nmro_rdcdo_dsplay AS "NUMERO DE RADICADO",',
'       a.NMBRE_TRCRO AS "USUARIO RADICADOR",',
'       d.nmbre_trcro AS "NOMBRE ABOGADO ASIGNADO"',
'  FROM genesys.v_pq_g_solicitudes a',
'  JOIN genesys.v_pq_g_solicitantes b',
'    ON b.id_slctud = a.id_slctud',
'  JOIN (SELECT c.id_instncia_fljo,',
'               u.nmbre_trcro,',
'               ROW_NUMBER() OVER (PARTITION BY c.id_instncia_fljo ORDER BY c.id_instncia_fljo) AS rn',
'          FROM genesys.wf_g_instancias_transicion c',
'          JOIN genesys.v_sg_g_usuarios u',
'            ON u.id_usrio = c.id_usrio) d',
'    ON d.id_instncia_fljo = a.id_instncia_fljo_gnrdo',
'   AND d.rn = 1',
' WHERE --a.nmro_rdcdo_dsplay=''2024-10013463'';',
'--  trunc(a.fcha_rdcdo) between json_value(:P67_JSON, ''$.fcha_incial'') and json_value(:P67_JSON, ''$.fcha_fnal'')',
' -- and a.id_usrio  = nvl(json_value(:P67_JSON, ''$.id_usrio''), a.id_usrio);',
' ',
'trunc(a.fcha_rdcdo) BETWEEN TO_DATE(json_value(:P67_JSON, ''$.fcha_in''), ''DD/MM/YYYY'') ',
'                               AND TO_DATE(json_value(:P67_JSON, ''$.fcha_fin''), ''DD/MM/YYYY'')',
' --  AND a.id_usrio = json_value(:P67_ID_USRIO, ''$.id_usrio'');',
' -- AND (a.id_usrio = json_value(:P67_JSON, ''$.id_usrio'') OR json_value(:P67_JSON, ''$.id_usrio'') IS NULL);'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(68670343106244613)
,p_shared_query_id=>wwv_flow_api.id(55446893532123470)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = :P_ID_IMPSTO)nmbre_impsto,',
'        (select upper(nmbre_rprte) from gn_d_reportes m where m.id_rprte = :P_ID_RPRTE)nmbre_rpte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E''',
'    '))
);
end;
/
