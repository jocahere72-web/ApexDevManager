prompt --application/shared_components/reports/report_queries/re_g_rechazo_convenio_pago
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(75871493667183455)
,p_name=>'re_g_rechazo_convenio_pago'
,p_query_text=>'select * from v_gf_g_convenios'
,p_format=>'PDF'
,p_output_file_name=>'re_g_rechazo_convenio_pago'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(91820577287099534)
,p_shared_query_id=>wwv_flow_api.id(75871493667183455)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'       a.idntfccion_sjto,',
'       a.nmro_cnvnio,',
'       a.nmbre_slctnte,',
'       a.drccion_ntfccion,',
'       a.nmro_acto,',
'       a.nmro_rdcdo_dsplay,',
'       a.mtvo_rchazo_slctud,',
'       a.fcha_rdcdo,',
'       a.nmro_acto_dsplay,',
'       upper(h.nmbre_clnte)nmbre_clnte,',
'       upper(h.slgan)slgan,',
'       h.id_ofcna, ',
'       h.nmbre_ofcna, ',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => i.file_blob ) as lgo_slgan,',
'       i.file_mimetype,',
'       sysdate fecha_hoy ',
'       ',
'from v_gf_g_convenios a',
'join v_df_s_clientes                                                    h on a.cdgo_clnte = h.cdgo_clnte',
'join df_c_imagenes_cliente                                              i on a.cdgo_clnte = i.cdgo_clnte and i.cdgo_imgen_clnte = ''L_E''',
'',
'where a.id_cnvnio = nvl(pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P49_ID_CNVNIO'' ), a.id_cnvnio) and  a.cdgo_cnvnio_estdo = ''RCH'';'))
);
end;
/
