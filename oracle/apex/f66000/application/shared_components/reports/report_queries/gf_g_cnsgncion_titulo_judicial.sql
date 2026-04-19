prompt --application/shared_components/reports/report_queries/gf_g_cnsgncion_titulo_judicial
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(3733191097277231)
,p_name=>'gf_g_cnsgncion_titulo_judicial'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr(' -- Encabezado y Pie de P\00E1gina'),
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       upper(b.nmbre_ofcna) nmbre_ofcna        ',
'   from df_c_imagenes_cliente a',
'   join v_df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_cnsgncion_titulo_judicial'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(11937548149533289)
,p_shared_query_id=>wwv_flow_api.id(3733191097277231)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr(' -- Encabezado y Pie de P\00E1gina'),
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       upper(b.nmbre_ofcna) nmbre_ofcna        ',
'   from df_c_imagenes_cliente a',
'   join v_df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'';'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(11937789758533290)
,p_shared_query_id=>wwv_flow_api.id(3733191097277231)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- obtener html',
'select c.dcmnto,',
'       c.nmro_acto,',
'       pkg_gn_generalidades.fnc_date_to_text(c.fcha_acto) fcha_acto,',
'       initcap(to_char(sysdate, ''FMMONTH DD'') || '' de '' ||',
'               to_char(sysdate, ''YYYY'')) fcha_hoy',
'  from gf_g_titulos_judicial a',
'  join gf_g_ttls_jdcl_dcmnt_asccn b on b.id_ttlo_jdcial = a.id_ttlo_jdcial',
'  join v_gf_g_titulos_jdcial_dcmnto c on c.id_ttlo_jdcial_dcmnto = b.id_ttlo_jdcial_dcmnto',
' where a.id_instncia_fljo = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_instncia_fljo'');'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(11937939493533290)
,p_shared_query_id=>wwv_flow_api.id(3733191097277231)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Datos del demandado',
'select lower(f.dscrpcion_idntfccion_tpo) dscrpcion_idntfccion_tpo,',
'       ltrim(a.idntfccion_dmnddo, 0) idntfccion_dmnddo,',
'       ltrim(rtrim(replace(a.nmbre_dmnddo, ''.'', ''''))) nmbre_dmnddo,',
'       g.nmbre_trcro usuario,',
'       Initcap(''('' || g.nmbre_prfsion || '')'') cargo,',
'       d.nmro_prcso_jrdco,',
'       --fnc_formatear_referencia_catastral(e.idntfccion)idntfccion,',
'       e.idntfccion,',
'       s.drccion',
'  from gf_g_titulos_judicial a',
'  left join v_mc_g_embargos_resolucion b',
'    on b.cnsctvo_embrgo = a.cnsctvo_embrgo',
'  left join mc_g_embrgos_crt_prc_jrd c',
'    on c.id_embrgos_crtra = b.id_embrgos_crtra',
'  left join cb_g_procesos_juridico d',
'    on d.id_prcsos_jrdco = c.id_prcsos_jrdco',
'  left join v_mc_g_embargos_cartera e',
'    on e.id_embrgos_crtra = b.id_embrgos_crtra',
'  left join df_s_identificaciones_tipo f',
'    on f.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo_dmnddo',
'  join v_sg_g_usuarios g',
'    on g.id_fncnrio = a.id_fncnrio',
'  join v_si_i_sujetos_impuesto s',
'    on s.idntfccion_sjto = e.idntfccion',
' where a.id_instncia_fljo = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_instncia_fljo'')'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(11938193107533290)
,p_shared_query_id=>wwv_flow_api.id(3733191097277231)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_trcro as direcor_rentas, a.nmbre_crgo as cargo',
'  from v_sg_g_usuarios a',
' where a.id_crgo = null and rownum = 1'))
);
end;
/
