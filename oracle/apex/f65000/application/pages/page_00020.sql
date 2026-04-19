prompt --application/pages/page_00020
begin
wwv_flow_api.create_page(
 p_id=>20
,p_user_interface_id=>wwv_flow_api.id(30413944355578333)
,p_name=>'Descargar Evidencia'
,p_step_title=>'Descargar Evidencia'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ACARDENAS'
,p_last_upd_yyyymmddhh24miss=>'20181218140720'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(49151177002148928)
,p_plug_name=>'Parametros'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49151277588148929)
,p_name=>'P20_ID_NTFCION_MDIO_EVDNCIA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(49151177002148928)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(49386348641218562)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar Evidencia'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_file blob;',
'    v_filename varchar2(255);',
'begin',
'    if(:P20_ID_NTFCION_MDIO_EVDNCIA is not null)then',
'        begin',
'            select file_blob,',
'                   file_name ',
'            into v_file,',
'                 v_filename',
'            from nt_g_medio_entidad_evdncia where id_ntfcion_mdio_evdncia = :P20_ID_NTFCION_MDIO_EVDNCIA;',
'        exception',
'            when others then',
'                RAISE_APPLICATION_ERROR (-20000,''Problemas al descargar evidencia''); ',
'        end;',
'       if dbms_lob.getlength(v_file) > 0 then',
'        owa_util.mime_header(''application/octet'', FALSE); ',
'',
'        htp.p(''Content-length: ''|| dbms_lob.getlength(v_file));',
'',
'        htp.p(''Content-Disposition: attachment; filename="''||v_filename||''"'');',
'',
'        owa_util.http_header_close;',
'',
'        wpg_docload.download_file(v_file);',
'       end if;',
'   end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
