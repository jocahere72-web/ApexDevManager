prompt --application/shared_components/reports/report_queries/reporte_ajuste
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(180147656184366096)
,p_name=>'reporte_ajuste'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   a.id_ajste,',
'   a.id_impsto,',
'   a.id_sbimpsto,',
'   a.id_sjto_impsto,',
'   a.drccion,',
'   a.fcha,',
'   a.dscrpcion_motivo,',
'   a.nmro_slctud,',
'   a.cdgo_tpo_ajste,',
'   a.tpo_ajste,',
'   a.vlor,',
'   a.cdgo_ajste_estdo,',
'   a.dscrpcion_estado ',
'from v_gf_g_ajustes a',
'where a.id_ajste = :F_ID_AJSTE'))
,p_report_layout_id=>wwv_flow_api.id(182722695566670520)
,p_format=>'PDF'
,p_output_file_name=>'reporte_ajuste'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(72495237741002781)
,p_shared_query_id=>wwv_flow_api.id(180147656184366096)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    a.id_ajste,',
'    a.id_impsto,',
'    a.id_sbimpsto,',
'    a.id_sjto_impsto,',
'    a.drccion,',
'    a.fcha,',
'    a.dscrpcion_motivo,',
'    a.nmro_slctud,',
'    a.cdgo_tpo_ajste,',
'    a.tpo_ajste,',
'    a.vlor,',
'    a.cdgo_ajste_estdo,',
'    a.dscrpcion_estado,',
'    a.obsrvcion,',
'    a.idntfccion,',
'    b.nmbre_rspnsble',
' from v_gf_g_ajustes a',
' join v_si_i_sujetos_responsable b',
'   on a.id_sjto_impsto = b.id_sjto_impsto',
'   and b.prncpal_s_n = ''S''',
' where a.id_ajste = :P18_ID_AJSTE'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(72495468392002781)
,p_shared_query_id=>wwv_flow_api.id(180147656184366096)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_ajste_dtlle, id_ajste, dscrpcion_concepto, vgncia, dscrpcion_periodo, sldo_cptal, vlor_ajste from v_gf_g_ajuste_detalle where id_ajste = :P18_ID_AJSTE;',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(72495689648002781)
,p_shared_query_id=>wwv_flow_api.id(180147656184366096)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select prmer_nmbre || '' '' || sgndo_nmbre || '' '' || prmer_aplldo || '' '' || sgndo_aplldo as nombre_usuario,',
' to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
' :F_IP as ipaddr',
'from si_c_terceros ',
' where idntfccion = coalesce( sys_context(''APEX$SESSION'',''app_user''), regexp_substr(sys_context(''userenv'',''client_identifier''),''^[^:]*''), sys_context(''userenv'',''session_user'') );'))
);
end;
/
