prompt --application/shared_components/reports/report_queries/re_g_acumulacion_procesos
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(96939139822767465)
,p_name=>'re_g_acumulacion_procesos'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_format=>'PDF'
,p_output_file_name=>'re_g_acumulacion_procesos'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(97124366971041841)
,p_shared_query_id=>wwv_flow_api.id(96939139822767465)
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
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(97124584217041841)
,p_shared_query_id=>wwv_flow_api.id(96939139822767465)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmro_acto_dsplay',
'     , to_char(b.fcha, ''FMdd "de" Month "de" yyyy'', ''NLS_DATE_LANGUAGE=spanish'') fcha   ',
'  from cb_g_procesos_jrdco_acmldo a',
'  join gn_g_actos b on b.id_acto = a.id_acto',
'  where a.id_prcso_jrdco_acmldo = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_prcso_jrdco_acmldo'')'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(97124750155041841)
,p_shared_query_id=>wwv_flow_api.id(96939139822767465)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select listagg(a.nmtcnco_idntfccion_tpo || '' No. '' || a.idntfccion , '', '') within group (order by id_prcsos_jrdco) documento',
'     , listagg(a.nmbre_cmplto, '', '') within group (order by id_prcsos_jrdco) nombre ',
'  from v_cb_g_procesos_jrdco_rspnsble a',
'  join cb_g_procesos_jrdco_acmldo b on a.id_prcsos_jrdco = b.id_prcso_jrdco_pdre',
' where b.id_prcso_jrdco_acmldo = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_prcso_jrdco_acmldo'')      '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(97124928175041841)
,p_shared_query_id=>wwv_flow_api.id(96939139822767465)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.idntfccion_sjto, a.drccion ',
'   from v_si_c_sujetos a',
'   join cb_g_procesos_juridico_sjto b on b.id_sjto = a.id_sjto',
'   join cb_g_procesos_jrdco_acmldo c on c.id_prcso_jrdco_pdre =  b.id_prcsos_jrdco',
'  where c.id_prcso_jrdco_acmldo = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_prcso_jrdco_acmldo'')',
'   '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(97125159403041841)
,p_shared_query_id=>wwv_flow_api.id(96939139822767465)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select a.dscrpcion_acto_tpo  etapa',
'       , listagg(a.nmro_acto_dsplay || '' de fecha ''  ||  to_char(a.fcha_acto , ''dd/dd/yyyy'') , '', '') within group (order by a.dscrpcion_acto_tpo) dscrpcion ',
'    from v_cb_g_procesos_jrdco_dcmnto a',
'    join (select a.id_prcso_jrdco_pdre as id_prcsos_jrdco',
'            from cb_g_procesos_jrdco_acmldo a',
'           where id_prcso_jrdco_acmldo = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_prcso_jrdco_acmldo'')',
'       union all ',
'          select a.id_prcsos_jrdco ',
'            from cb_g_prcsos_jrdc_acmld_dtll a',
'           where id_prcso_jrdco_acmldo = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_prcso_jrdco_acmldo'') ) b',
'      on b.id_prcsos_jrdco = a.id_prcsos_jrdco   ',
'    join v_cb_g_procesos_jrdco_acmldo c',
'      on a.id_acto_tpo = c.id_acto_tpo',
'group by a.dscrpcion_acto_tpo'))
);
end;
/
