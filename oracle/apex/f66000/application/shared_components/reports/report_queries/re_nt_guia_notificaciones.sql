prompt --application/shared_components/reports/report_queries/re_nt_guia_notificaciones
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(84625918394322499)
,p_name=>'re_nt_guia_notificaciones'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_lte,',
'       a.id_lte_dtlle,',
'       a.id_acto,',
'       a.id_acto_rspnsble,',
'       a.id_ntfccion_rspnsble,',
'       b.id_acto_tpo,',
'       b.dscrpcion_acto_tpo,',
'       b.nmro_acto,',
'       b.fcha,',
'       b.idntfccion_sjto,',
'       c.cdgo_idntfccion_tpo,',
'       c.idntfccion,',
'       c.prmer_nmbre,',
'       c.sgndo_nmbre,',
'       c.prmer_aplldo,',
'       c.sgndo_aplldo,',
'       c.drccion_ntfccion,',
'       d.nmbre_mncpio,',
'       e.nmbre_dprtmnto,',
'       f.nmbre_pais',
'from nt_d_lote_detalle                  a',
'inner join v_gn_g_actos_sujeto_impuesto b on a.id_acto                  = b.id_acto',
'inner join gn_g_actos_responsable       c on a.id_acto_rspnsble         = c.id_acto_rspnsble',
'inner join df_s_municipios              d on c.id_mncpio_ntfccion       = d.id_mncpio',
'inner join df_s_departamentos           e on c.id_dprtmnto_ntfccion     = e.id_dprtmnto',
'inner join df_s_paises                  f on c.id_pais_ntfccion         = f.id_pais',
'where a.id_lte = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''id_lte'');'))
,p_report_layout_id=>wwv_flow_api.id(91443579006214253)
,p_format=>'XLS'
,p_output_file_name=>'re_nt_guia_notificaciones'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(91445269097215984)
,p_shared_query_id=>wwv_flow_api.id(84625918394322499)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_lte,',
'       a.id_lte_dtlle,',
'       a.id_acto,',
'       a.id_acto_rspnsble,',
'       a.id_ntfccion_rspnsble,',
'       b.id_acto_tpo,',
'       b.dscrpcion_acto_tpo,',
'       b.nmro_acto,',
'       b.fcha,',
'       b.idntfccion_sjto,',
'       c.cdgo_idntfccion_tpo,',
'       c.idntfccion,',
'       c.prmer_nmbre,',
'       c.sgndo_nmbre,',
'       c.prmer_aplldo,',
'       c.sgndo_aplldo,',
'       c.drccion_ntfccion,',
'       d.nmbre_mncpio,',
'       e.nmbre_dprtmnto,',
'       f.nmbre_pais',
'from nt_d_lote_detalle                  a',
'inner join v_gn_g_actos_sujeto_impuesto b on a.id_acto                  = b.id_acto',
'inner join gn_g_actos_responsable       c on a.id_acto_rspnsble         = c.id_acto_rspnsble',
'inner join df_s_municipios              d on c.id_mncpio_ntfccion       = d.id_mncpio',
'inner join df_s_departamentos           e on c.id_dprtmnto_ntfccion     = e.id_dprtmnto',
'inner join df_s_paises                  f on c.id_pais_ntfccion         = f.id_pais',
'--where a.id_lte = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''id_lte'');'))
);
end;
/
