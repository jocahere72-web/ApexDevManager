prompt --application/shared_components/reports/report_queries/re_nt_presentacion_personal
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(40422505740354858)
,p_name=>'re_nt_presentacion_personal'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cl.nmbre_mncpio ciudad,',
'       to_char(systimestamp, ''Day'') dia_semana,',
'       to_char(systimestamp, ''dd'') dia,',
'       to_char(systimestamp, ''Month'') mes,',
'       to_char(systimestamp, ''yyyy'') ano,',
'       to_char(systimestamp, ''hh:mm:ss a.m.'') hora,',
'       fn.nmbre_trcro funcionario,',
'       fn.idntfccion func_id,',
'       fn.nmbre_crgo cargo,',
'       ti.nmtcnco_idntfccion_tpo tipo_id,',
'       pp.nmro_idntfccion numero_id,',
'       (pp.prmer_nmbre || '' '' || pp.sgndo_nmbre || '' '' || pp.prmer_aplldo || '' '' ||',
'       pp.sgndo_aplldo) nombre,',
'       tr.dscrpcion_rspnsble_tpo tipo_responsable,',
'       pp.nmro_trjeta_prfsnal tp,',
'       nt.dscrpcion_acto_tpo tipo_acto,',
'       nt.nmro_acto acto,',
'       nt.fcha fecha_Acto,',
'       cl.escdo escudo',
'  from v_df_s_clientes             cl,',
'       v_df_c_funcionarios         fn,',
'       df_s_responsables_tipo      tr,',
'       df_s_identificaciones_tipo  ti,',
'       nt_g_presentacion_personal  pp,',
'       nt_g_ntfccnes_rspnsble      nr,',
'       nt_g_notificaciones_detalle nd,',
'       v_nt_g_notfccnes_gn_g_actos nt',
' where tr.cdgo_rspnsble_tpo = ''P''',
'   and ti.cdgo_idntfccion_tpo = pp.cdgo_idntfccion_tpo',
'   and pp.id_ntfcion_mdio_evdncia = nr.id_ntfcion_mdio_evdncia',
'   and nr.id_fncnrio = fn.id_fncnrio',
'   and nr.id_ntfccion_dtlle = nd.id_ntfccion_dtlle',
'   and nd.id_ntfccion = nt.id_ntfccion',
'   and cl.cdgo_clnte=nt.cdgo_clnte'))
,p_xml_structure=>'APEX'
,p_format=>'PDF'
,p_output_file_name=>'re_nt_presentacion_personal'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(42856108968286717)
,p_shared_query_id=>wwv_flow_api.id(40422505740354858)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_mncpio,',
'       to_char(systimestamp, ''Day'') dia_smna,',
'       to_char(systimestamp, ''dd'') dia,',
'       to_char(systimestamp, ''Month'') mes,',
'       to_char(systimestamp, ''yyyy'') ano,',
'       to_char(systimestamp, ''hh:mm:ss a.m.'') hora,',
'       b.nmbre_trcro nmbre_funcnrio,',
'       b.idntfccion idntfccion_funcnrio,',
'       b.nmbre_crgo crgo_funcnrio,',
'       pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''prmer_nmbre'')||nvl2(pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''sgndo_nmbre''), '' ''||pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_X'
||'ML , p_nodo => ''sgndo_nmbre''),'''')||'' ''||pkg_gn_generalidades.fnc_ca_extract_value(p_xml => :P2_XML , p_nodo => ''prmer_aplldo'')||nvl2(pkg_gn_generalidades.fnc_ca_extract_value(p_xml => :P2_XML , p_nodo => ''sgndo_aplldo''), '' ''||pkg_gn_generalidades.fnc'
||'_ca_extract_value(p_xml => :P2_XML , p_nodo => ''sgndo_aplldo''),'''')nmbre_rspnsble,',
'       f.nmtcnco_idntfccion_tpo,',
'       pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''nmro_idntfccion_rspnsble'') nmro_idntfccion_rspnsble,',
'       c.dscrpcion_rspnsble_tpo,',
'       pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''nmro_trjeta_p_rspnsble'') nmro_trjeta_p_rspnsble,',
'       g.nmbre_mncpio nmbre_mncpio_rprsntnte,',
'       d.nmro_acto,',
'       d.dscrpcion_acto_tpo,',
'       to_char(d.fcha,''dd/MM/yyyy'') fcha,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => e.file_blob ) as lgo_slgan,',
'       e.file_mimetype',
'from v_df_s_clientes a',
'inner join v_df_c_funcionarios b on b.id_fncnrio = :F_ID_FNCNRIO',
'inner join df_s_responsables_tipo c on pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''cdgo_rspnsble_tpo'')  = c.cdgo_rspnsble_tpo',
'inner join v_gn_g_actos d on pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''id_acto'') = d.id_acto',
'inner join df_c_imagenes_cliente e on a.cdgo_clnte = e.cdgo_clnte  and',
'                                      3             = e.id_imgen_clnte',
'inner join df_s_identificaciones_tipo f on pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''cdgo_idntfccion_tpo_rspnsble'') = f.cdgo_idntfccion_tpo',
'inner join v_df_s_municipios g on pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''cdgo_mncpio_rspnsble'') = g.cdgo_mncpio --Codigo del Municipio',
'where a.cdgo_clnte = :F_CDGO_CLNTE;'))
);
end;
/
