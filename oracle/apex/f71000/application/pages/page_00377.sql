prompt --application/pages/page_00377
begin
wwv_flow_api.create_page(
 p_id=>377
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'generar zip'
,p_step_title=>'generar zip'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20221212090846'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69592054073907202)
,p_plug_name=>unistr('Impresi\00F3n en ZIP')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69592144258907203)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(69592054073907202)
,p_button_name=>'Generar_zip'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Generar Zip'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:377:&SESSION.:Imprimir:&DEBUG.:RP::'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8905531182566306)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(69592054073907202)
,p_button_name=>'BTN_GENERAR_ZIP'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Generar Zip'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69592486698907206)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(69592054073907202)
,p_button_name=>'Procesar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Procesar'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(8905677243566307)
,p_branch_name=>'Ir a la 377'
,p_branch_action=>'f?p=&APP_ID.:377:&SESSION.:Imprimir:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(8905531182566306)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8905417914566305)
,p_name=>'P377_ID_DTRMNCION_LTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(69592054073907202)
,p_prompt=>unistr('<b>Lote de Determinaci\00F3n</b>')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69592315318907205)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New_1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta   number;',
'    o_mnsje_rspsta  varchar2(4000);',
'    v_nl            number := 6;',
'    v_nmbre_up      varchar2(100) := ''pkg_gi_determinacion.prc_ac_acto_determinacion_job'';',
'begin',
'',
'    begin  ',
'        pkg_gi_determinacion.prc_ac_acto_determinacion_job (  p_cdgo_clnte          => :F_CDGO_CLNTE',
'                                                             , p_id_usrio           => :F_ID_USRIO ',
'                                                             , p_id_dtrmncion_lte   => :P377_ID_DTRMNCION_LTE',
'                                                             , p_indcdor_prcsmnto   => ''NA''',
'                                                             , o_cdgo_rspsta		=> o_cdgo_rspsta ',
'                                                             , o_mnsje_rspsta		=> o_mnsje_rspsta) ;',
'                                             ',
unistr('        pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, v_nmbre_up, v_nl, ''Termin\00F3 prc_ac_acto_determinacion_job. o_cdgo_rspsta:''||o_cdgo_rspsta||'' - ''||o_mnsje_rspsta , 6);'),
'    exception',
'        when others then ',
'            o_cdgo_rspsta  := 100;',
'            o_mnsje_rspsta := ''|DET_PRCSMNTO_DET_BLOB CDGO: '' || o_cdgo_rspsta|| '': Error al generar los jobs. '' || sqlerrm; ',
'            pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, v_nmbre_up, v_nl, o_mnsje_rspsta , 1); ',
'    end; -- Fin Se generan los blobs ',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(69592486698907206)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69592216261907204)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_app_id        number                     := v(''APP_ID'');',
'    v_app_page_id   number                     := v(''APP_PAGE_ID'');',
'    v_cdgo_clnte df_s_clientes.cdgo_clnte%type := :F_CDGO_CLNTE;',
'    v_gn_d_reportes gn_d_reportes%rowtype;',
'    v_app_id_dstno  number := 66000;',
'    v_zip_file      blob;',
'    V_LOTE        NUMBER;',
'begin',
'',
'    --raise_application_error(-20001, ''Debe Seleccionar una Fecha Recaudos-->''||:P377_ID_DTRMNCION_LTE);',
'    ',
'    for c_dcmntos_lte in (    ',
'                             select c.file_blob,c.file_name from gi_g_determinaciones a join v_gn_g_actos b on a.id_acto = b.id_acto',
'                                        left join gd_g_documentos c on b.id_dcmnto = c.id_dcmnto',
'                            where a.id_dtrmncion_lte = :P377_ID_DTRMNCION_LTE and b.id_dcmnto is not null',
'                        ) loop',
'        ',
'            apex_zip.add_file ( p_zipped_blob => v_zip_file',
'                              , p_file_name   => c_dcmntos_lte.file_name',
'                              , p_content     => c_dcmntos_lte.file_blob );',
'    end loop;',
'    ',
'    apex_zip.finish( p_zipped_blob => v_zip_file );',
'    ',
'    owa_util.mime_header(''application/zip'', false); ',
'    htp.p(''Content-length: ''|| dbms_lob.getlength(v_zip_file));',
unistr('    htp.p(''Content-Disposition: attachment; filename="'' || ''Lote N\00B0'' || :P59_ID_DCMNTO_LTE || ''.zip"'');'),
'    owa_util.http_header_close;',
'    wpg_docload.download_file(v_zip_file);',
'',
'    apex_session.attach( p_app_id     => v_app_id',
'                       , p_page_id    => v_app_page_id',
'                       , p_session_id => v(''APP_SESSION''));',
'                           ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Imprimir'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
