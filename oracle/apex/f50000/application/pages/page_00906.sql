prompt --application/pages/page_00906
begin
wwv_flow_api.create_page(
 p_id=>906
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Scanner'
,p_page_mode=>'MODAL'
,p_step_title=>'Scanner'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'#IMAGE_PREFIX#/javascript/infortributos/Dynamsoft/Resources/dynamsoft.webtwain.initiate.js',
'#IMAGE_PREFIX#javascript/infortributos/Dynamsoft/Resources/dynamsoft.webtwain.config.js',
'#IMAGE_PREFIX#javascript/infortributos/Dynamsoft/script.js'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'800'
,p_dialog_width=>'80%'
,p_dialog_chained=>'N'
,p_last_updated_by=>'JCUAO'
,p_last_upd_yyyymmddhh24miss=>'20190301100746'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76727114356736811)
,p_plug_name=>'Dynamsoft'
,p_region_name=>'r_escanear'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div id="dwtcontrolContainer"></div>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76986160960106605)
,p_plug_name=>'botones'
,p_parent_plug_id=>wwv_flow_api.id(76727114356736811)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76986043566106604)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(76727114356736811)
,p_button_name=>'BTN_ZOOMM'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(29604517744068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Zoom '
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-search-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(77039553257264201)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(76727114356736811)
,p_button_name=>'BTN_ZOOMMe'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(29604517744068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Zoom'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-search-minus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(77039684928264202)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(76727114356736811)
,p_button_name=>'BTN_LEFT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(29604517744068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Rotar Izquierda'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-rotate-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(77039789779264203)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(76727114356736811)
,p_button_name=>'BTN_RIGHT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(29604517744068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Rotar Derecha'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-rotate-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(77077783823352601)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(76727114356736811)
,p_button_name=>'BTN_GO_LEFT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(29604517744068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ir Izquierda'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(77077871402352602)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(76727114356736811)
,p_button_name=>'BTN_BACK'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(29604517744068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Anterior'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76727490873736814)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(76986160960106605)
,p_button_name=>'BTN_SCAN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Escanear'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76728015271736820)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(76986160960106605)
,p_button_name=>'BTN_CLEAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Limpiar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76727725701736817)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(76986160960106605)
,p_button_name=>'BTN_SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76727281320736812)
,p_name=>'P906_FILE_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(76727114356736811)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76727312896736813)
,p_name=>'P906_MIMETYPE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(76727114356736811)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77185935771636301)
,p_name=>'P906_APP_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(76727114356736811)
,p_item_default=>'&APP_ID.'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77186080055636302)
,p_name=>'P906_APP_PAGE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(76727114356736811)
,p_item_default=>'&APP_PAGE_ID.'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(76727544695736815)
,p_name=>'al presionar el boton scanner'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(76727490873736814)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76727612114736816)
,p_event_id=>wwv_flow_api.id(76727544695736815)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'AcquireImage();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(76727827081736818)
,p_name=>'al presionar el boton save'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(76727725701736817)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76727900329736819)
,p_event_id=>wwv_flow_api.id(76727827081736818)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'FTPUpload();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(76728117875736821)
,p_name=>'al presionar el boton limpiar'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(76728015271736820)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76728242006736822)
,p_event_id=>wwv_flow_api.id(76728117875736821)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'Limpiar_Buffer();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(77077979468352603)
,p_name=>unistr('al hacer clic en el bot\00F3n ir izquierda')
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(77077783823352601)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(77078015076352604)
,p_event_id=>wwv_flow_api.id(77077979468352603)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'next();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(77078160110352605)
,p_name=>unistr('al hacer clic en el bot\00F3n rotar izquierda')
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(77039684928264202)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(77078205911352606)
,p_event_id=>wwv_flow_api.id(77078160110352605)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'rotateLeft();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(77078325160352607)
,p_name=>unistr('al hacer clic en el bot\00F3n rotar derecha')
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(77039789779264203)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(77078436708352608)
,p_event_id=>wwv_flow_api.id(77078325160352607)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'rotateRight();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(77078543943352609)
,p_name=>unistr('al hacer clic en el bot\00F3n zoom mas')
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(76986043566106604)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(77078655919352610)
,p_event_id=>wwv_flow_api.id(77078543943352609)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'zoom(true);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(77078797592352611)
,p_name=>unistr('al hacer clic en el bot\00F3n zoom menos')
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(77039553257264201)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(77078870964352612)
,p_event_id=>wwv_flow_api.id(77078797592352611)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'zoom(false);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(77078923466352613)
,p_name=>unistr('al hacer clic en el bot\00F3n atras')
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(77077871402352602)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(77079005675352614)
,p_event_id=>wwv_flow_api.id(77078923466352613)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'back();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76985938337106603)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('borrar datos de colecci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    if (not apex_collection.collection_exists(p_collection_name => ''TMPFILE'') ) then',
'        apex_collection.create_collection( p_collection_name => ''TMPFILE'');',
'    end if;',
'exception ',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76728590123736825)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save_File'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_blob  blob := empty_blob();',
'    v_bfile bfile ;',
'begin',
'',
'  apex_session.attach(   p_app_id     => :P906_APP_ID,',
'                         p_page_id    => :P906_APP_PAGE_ID,',
'                         p_session_id => v(''APP_SESSION'') );',
'                         ',
'  apex_collection.create_or_truncate_collection(p_collection_name => ''TMPFILE'');',
'  ',
'  v_bfile := bfilename(''UPLOADTMP'', :P906_FILE_NAME);',
'',
'  dbms_lob.open(v_bfile, dbms_lob.lob_readonly);',
'   ',
'  dbms_lob.createtemporary(   lob_loc => v_blob',
'                            , cache   => true',
'                            , dur     => dbms_lob.session',
'                          );',
'     ',
'  dbms_lob.open(v_blob, dbms_lob.lob_readwrite);',
'   ',
'  dbms_lob.loadfromfile(  dest_lob => v_blob',
'                        , src_lob  => v_bfile',
'                        , amount   => dbms_lob.getlength(v_bfile)); ',
' ',
'  dbms_lob.close(v_bfile);',
'  ',
'  apex_collection.add_member( p_collection_name => ''TMPFILE''',
'                            , p_c001 => :P906_FILE_NAME',
'                            , p_c002 => :P906_MIMETYPE',
'                            , p_n001 => 1',
'                            , p_blob001 => v_blob );  ',
'                            ',
'  apex_json.open_object;',
'  apex_json.write(''error'', false);  ',
'  apex_json.close_object;',
'  ',
'exception',
'    when others then',
'        apex_json.open_object;',
'        apex_json.write(''error'', true);  ',
'        apex_json.write(''msg''  , sqlerrm);  ',
'        apex_json.close_object;',
'  end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
