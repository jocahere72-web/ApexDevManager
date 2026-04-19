prompt --application/shared_components/reports/report_queries/gf_g_auto_plantilla
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(77568092677056401)
,p_name=>'gf_g_auto_plantilla'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :F_APP_XML, p_nodo => ''nmro_acto_dsplay'') as nmro_acto_dsplay,',
'       pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :F_APP_XML, p_nodo => ''dscpcion_acto_tipo'') as dscpcion_acto_tipo,',
'       pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :F_APP_XML, p_nodo => ''fcha_acto'') as fcha_acto,',
'       c.idntfccion_sjto,',
'       a.nmbre_impsto,',
'       a.nmro_rdcdo_dsplay,',
'       a.fcha_rdcdo,',
'       d.nmbre_rzon_scial,',
'       d.dscrpcion_idntfccion_tpo,',
'       b.drccion_ntfccion,',
'       b.nmbre_slctnte,',
'       b.dscrpcion_rspnsble_tpo',
'from v_pq_g_solicitudes                 a',
'inner join v_pq_g_solicitantes          b on a.id_slctud      = b.id_slctud',
'inner join v_si_i_sujetos_impuesto      c on a.id_sjto_impsto = c.id_sjto_impsto',
'left  join v_si_i_sujetos_responsable   d on c.id_sjto        = d.id_sjto',
'where a.id_slctud = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :F_APP_XML, p_nodo => ''id_slctud'')'))
,p_report_layout_id=>wwv_flow_api.id(77567831487056076)
,p_format=>'PDF'
,p_output_file_name=>'gf_g_auto_plantilla'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(77572008514086012)
,p_shared_query_id=>wwv_flow_api.id(77568092677056401)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :F_APP_XML, p_nodo => ''nmro_acto_dsplay'') as nmro_acto_dsplay,',
'       pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :F_APP_XML, p_nodo => ''dscpcion_acto_tipo'') as dscpcion_acto_tipo,',
'       pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :F_APP_XML, p_nodo => ''fcha_acto'') as fcha_acto',
'      ',
'from v_pq_g_solicitudes                 a',
'inner join v_pq_g_solicitantes          b on a.id_slctud      = b.id_slctud',
'inner join v_si_i_sujetos_impuesto      c on a.id_sjto_impsto = c.id_sjto_impsto',
'left  join v_si_i_sujetos_responsable   d on c.id_sjto        = d.id_sjto',
'where a.id_slctud = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :F_APP_XML, p_nodo => ''id_slctud'')'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(77572264193086012)
,p_shared_query_id=>wwv_flow_api.id(77568092677056401)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,',
'        a.file_mimetype',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
end;
/
