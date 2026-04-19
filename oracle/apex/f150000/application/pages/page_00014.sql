prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Informaci\00F3n Ex\00F3gena Cargar')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Informaci\00F3n Ex\00F3gena Cargar')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
''))
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#cabecera_portal{',
'    display:none;  ',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250811152014'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11529632161060211)
,p_plug_name=>'Error(es) de Procesamiento'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT COLLECTION_NAME, SEQ_ID, c001',
'FROM APEX_COLLECTIONS',
'WHERE COLLECTION_NAME = ''EXOGENA_ERROR''',
';'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(11529777702060212)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'BVILLEGAS'
,p_internal_uid=>11529777702060212
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(11529820052060213)
,p_db_column_name=>'COLLECTION_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Collection Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(11529907238060214)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'No. Mensaje'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(11530051897060215)
,p_db_column_name=>'C001'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Mensaje Error'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(11597477612197188)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'115975'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SEQ_ID:C001:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69091455539285082)
,p_plug_name=>'Create Form'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252169105903651390)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69095192483285153)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252173689295651394)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69095545774285155)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(69095192483285153)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69097574189285186)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(69095192483285153)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P14_ID_INFRMCION_EXGNA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69097936134285186)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(69095192483285153)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cargar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P14_ID_INFRMCION_EXGNA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-cloud-upload'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9184136817986711)
,p_name=>'P14_COUNT_ERROR'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(69091455539285082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11575968632196541)
,p_name=>'P14_ENVIA_CORREO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(69091455539285082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11576210396196544)
,p_name=>'P14_MNSJE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(69091455539285082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11576307414196545)
,p_name=>'P14_INDCDOR_EXISTE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(69091455539285082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11576442901196546)
,p_name=>'P14_INFO_EXOGENA'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(69091455539285082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12174648425665124)
,p_name=>'P14_INDCDOR_EXTMPRNEO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(69091455539285082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69091760526285098)
,p_name=>'P14_ID_INFRMCION_EXGNA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(69091455539285082)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69092127502285103)
,p_name=>'P14_ID_SJTO_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(69091455539285082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69092541820285123)
,p_name=>'P14_ID_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(69091455539285082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69092934912285124)
,p_name=>'P14_VGNCIA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(69091455539285082)
,p_prompt=>'Vigencia'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT VGNCIA D, VGNCIA R ',
'FROM DF_S_VIGENCIAS ',
'WHERE VGNCIA = :P14_VGNCIA',
'ORDER BY 1 DESC'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69093390164285124)
,p_name=>'P14_FILE_BLOB'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(69091455539285082)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>120
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_help_text=>unistr('Seleccione el archivo con la informaci\00F3n ex\00F3gena a enviar. ')
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
,p_attribute_11=>'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69129950603536204)
,p_name=>'P14_ID_EXGNA_ARCHVO_TPO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(69091455539285082)
,p_prompt=>'Tipo de Archivo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre || '':'' || dscrpcion d, id_exgna_archvo_tpo r',
'  from df_i_exogena_archivo_tipo',
' where id_exgna_archvo_tpo = :P14_ID_EXGNA_ARCHVO_TPO',
';'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69130517431536210)
,p_name=>'P14_FILE_NAME'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(69091455539285082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95278242770762104)
,p_name=>'P14_ID_PRDO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(69091455539285082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95278304746762105)
,p_name=>'P14_DSCRPCION_PRDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(69091455539285082)
,p_prompt=>'Periodo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186980398299307615)
,p_name=>'P14_CDGO_CLNTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(69091455539285082)
,p_item_default=>'23001'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(69095623681285155)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(69095545774285155)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(69096410283285179)
,p_event_id=>wwv_flow_api.id(69095623681285155)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(69468806382651101)
,p_name=>'Al cambiar Archivo'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_FILE_BLOB'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(69468913723651102)
,p_event_id=>wwv_flow_api.id(69468806382651101)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function Restringir_Archivo_Tipo($this) {',
'    var file = $this.triggeringElement.files[0];',
'    ',
'    if (file !== undefined ) {',
'        vTipo = new String( file.type );',
'        ',
'        if( vTipo != "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") {',
'            Swal.fire({',
'                icon:  ''error'',',
'                title: ''<H2 >Cargar Archivo</H2>'',',
'                html:  ''El tipo de Archivo Seleccionado no es Permitido, el archivo debe ser de tipo Excel (.xlsx).''',
'                      });',
'                      apex.item(''P14_FILE_BLOB'').setValue("");',
'        }',
'    }',
'}',
'Restringir_Archivo_Tipo(this);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(11700033079298490)
,p_name=>'Validar archivo existente'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11700460306298493)
,p_event_id=>wwv_flow_api.id(11700033079298490)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_info_exogena  number;',
'begin',
'    begin',
'        select a.id_infrmcion_exgna',
'        into v_id_info_exogena',
'        from gi_g_informacion_exogena a',
'        where a.id_sjto_impsto      = :P14_ID_SJTO_IMPSTO',
'          and a.id_exgna_archvo_tpo = :P14_ID_EXGNA_ARCHVO_TPO',
'          and a.indcdor_prcsdo      = ''S''',
'          and a.actvo               = ''S''',
'          and a.id_prdo             = :P14_ID_PRDO;',
'    exception',
'        when others then',
'            v_id_info_exogena := null;',
'    end;',
'    ',
'    if v_id_info_exogena is not null then',
'        apex_util.set_session_state(''P14_INFO_EXOGENA'', v_id_info_exogena);',
'        apex_util.set_session_state(''P14_INDCDOR_EXISTE'', ''1'');',
unistr('        apex_util.set_session_state(''P14_MNSJE'', ''<H4>Este archivo ya fue cargado, si lo vuelve a cargar ser\00E1 tomado como correcci\00F3n.</H4>'');'),
'    else',
'        apex_util.set_session_state(''P14_INFO_EXOGENA'', null);',
'        apex_util.set_session_state(''P14_INDCDOR_EXISTE'', ''0'');',
'    end if;',
'end;'))
,p_attribute_02=>'P14_ID_SJTO_IMPSTO,P14_ID_EXGNA_ARCHVO_TPO'
,p_attribute_03=>'P14_INFO_EXOGENA,P14_INDCDOR_EXISTE,P14_MNSJE,P14_DSCRPCION_PRDO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11700992354298493)
,p_event_id=>wwv_flow_api.id(11700033079298490)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($v(''P14_INDCDOR_EXISTE'') == ''1'' ){',
'            Swal.fire({',
'                icon: ''error'',',
unistr('                title:  ''<H2 >Informaci\00F3n Ex\00F3gena</H2>'','),
'                html: $v(''P14_MNSJE'')',
'                      })/*.then((result) => {',
'                                          apex.submit();',
'                                            }',
'                               );    */',
'    }; '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69098764851285187)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(69091455539285082)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Create Form'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(11529283750060207)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_NL.AMIS.SCHEFFER.PROCESS.EXCEL2COLLECTION'
,p_process_name=>'Procesar Excel'
,p_attribute_01=>'P14_FILE_BLOB'
,p_attribute_02=>'hoja'
,p_attribute_04=>';'
,p_attribute_05=>'"'
,p_attribute_07=>'N'
,p_attribute_08=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69099105699285188)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validar DATA'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	TYPE t_sql_array 		IS TABLE OF VARCHAR2(4000) INDEX BY PLS_INTEGER;',
'	v_sqls       			t_sql_array;',
'	v_index      			PLS_INTEGER := 0;',
'	v_cursor_id  			INTEGER;',
'	v_status     			INTEGER;',
'	v_col_cnt    			INTEGER;',
'	v_desc_tab   			DBMS_SQL.DESC_TAB;',
'	v_val        			VARCHAR2(4000);',
'	v_linea      			varchar2(20);',
'	v_cntdor_lnea    		number;',
'	v_ttal_linea 			number;',
'	v_vldcion    			varchar2(1);',
'	v_hoja       			varchar2(100); ',
'	v_tpo_dato   			varchar2(5);',
'	v_count      			number := 1;',
'	v_contaerror 			number := 0;',
'	v_tpo_dato_des 			varchar2(100);',
'	v_envia_correo 			varchar2(1) := ''N'';',
'	v_row_values  			APEX_APPLICATION_GLOBAL.VC_ARR2;',
'	o_mnsje_rspsta    		varchar2(4000);',
'	v_indcdr_crrccion   	varchar2(1);',
'	v_id_infrmcion_exgna    number;',
'								 ',
'begin',
'    apex_collection.create_or_truncate_collection(p_collection_name => ''EXOGENA_ERROR'');',
'',
'    for c_hojas in (',
'        select distinct b.nmro_hoja, a.lneas_encbzdo, c.nmbr_hojas',
'        from df_i_exogena_archivo_tipo a',
'        join df_i_exogena_archv_estrctra b on a.id_exgna_archvo_tpo = b.id_exgna_archvo_tpo',
'        join df_i_exogena_hojas c on b.nmro_hoja = c.id_hojas',
'        where b.id_exgna_archvo_tpo = :P14_ID_EXGNA_ARCHVO_TPO',
'        order by 1',
'    ) loop',
'        declare',
'            v_select varchar2(4000) := ''select '';',
'            v_cols   varchar2(4000) := '''';',
'        begin',
'            for c_columnas in (',
'                select b.nmbre_clmna,',
'                       b.nmro_clmna',
'                from df_i_exogena_archv_estrctra b',
'                where b.nmro_hoja = c_hojas.nmro_hoja',
'                and b.id_exgna_archvo_tpo = :P14_ID_EXGNA_ARCHVO_TPO  ',
'            ) loop',
'                v_cols := v_cols || c_columnas.nmbre_clmna || '' as '' || c_columnas.nmro_clmna || '','';',
'            end loop;',
'',
'            v_cols := RTRIM(v_cols, '', '');',
'',
'            v_select := v_select || v_cols || '', '''''' || c_hojas.nmbr_hojas || '''''' as nmro_hoja ,'' || c_hojas.lneas_encbzdo || '' as lneas_encbzdo from apex_collections where collection_name = '''''' || c_hojas.nmro_hoja || '''''' and seq_id > '' || c_hojas.l'
||'neas_encbzdo;',
'',
'            v_index := v_index + 1;',
'            v_sqls(v_index) := v_select;',
'            --insert into muerto (n_001,v_001) values (v_index,''v_select => ''||v_select);',
'        end;',
'    end loop;',
'',
'    for i in 1 .. v_sqls.COUNT loop',
'        v_count := 1;',
'        v_cursor_id := DBMS_SQL.OPEN_CURSOR;',
'        DBMS_SQL.PARSE(v_cursor_id, v_sqls(i), DBMS_SQL.NATIVE);',
'        DBMS_SQL.DESCRIBE_COLUMNS(v_cursor_id, v_col_cnt, v_desc_tab);',
'',
'        for j in 1 .. v_col_cnt loop',
'            dbms_sql.define_column(v_cursor_id, j, v_val, 4000);',
'        end loop;',
'',
'        v_status := DBMS_SQL.EXECUTE(v_cursor_id);',
'',
'        while DBMS_SQL.FETCH_ROWS(v_cursor_id) > 0 loop',
'            --v_contaerror := 0;',
'            v_row_values.DELETE;',
'            v_hoja := NULL;',
'            v_linea := NULL;',
'',
'            for j in 1 .. v_col_cnt loop',
'                DBMS_SQL.COLUMN_VALUE(v_cursor_id, j, v_val);',
'                DBMS_SQL.COLUMN_VALUE(v_cursor_id, v_col_cnt-1, v_hoja);',
'                DBMS_SQL.COLUMN_VALUE(v_cursor_id, v_col_cnt, v_linea);',
'',
'                v_row_values(j) := v_val;',
'    			--insert into muerto (n_001,v_001) values (v_cursor_id, ''v_desc_tab(j).col_name => ''||v_desc_tab(j).col_name||'' ''||''p14_id_exgna_archvo_tpo =>''||:p14_id_exgna_archvo_tpo);',
'',
'                if v_desc_tab(j).col_name = ''NMRO_HOJA'' then',
'                    v_hoja := v_val;',
'                elsif v_desc_tab(j).col_name = ''LNEAS_ENCBZDO'' then',
'                    v_linea := v_val;',
'                else',
'                    begin',
'                        select distinct b.tpo_dato',
'                        into v_tpo_dato',
'                        from df_i_exogena_archv_estrctra b ',
'                        join df_i_exogena_hojas c on b.nmro_hoja = c.id_hojas',
'                        where b.id_exgna_archvo_tpo = :P14_ID_EXGNA_ARCHVO_TPO',
'                        and c.nmbr_hojas = v_hoja',
'                        and b.nmro_clmna = v_desc_tab(j).col_name;',
'                    exception',
'                        when no_data_found then',
'                            v_tpo_dato := null;',
'                        when others then',
'                            v_tpo_dato := null;',
'                    end;',
'                    ',
'                    if v_tpo_dato = ''N'' then',
'                        v_vldcion := pkg_gi_informacion_exogena.fnc_vl_dato_numerico(v_val);',
unistr('                        v_tpo_dato_des := ''N\00FAmerico'';'),
'                    elsif v_tpo_dato = ''D'' then',
'                        v_vldcion := pkg_gi_informacion_exogena.fnc_vl_dato_numerico_decimal(v_val);',
unistr('                        v_tpo_dato_des := ''N\00FAmerico Decimal (max. 2 decimales ej: 1,50)'';'),
'                    elsif v_tpo_dato = ''E'' then',
'                        v_vldcion := pkg_gi_informacion_exogena.fnc_vl_email(v_val);',
'                        v_tpo_dato_des := ''Email'';',
'                    elsif v_tpo_dato = ''A'' then',
'                        v_vldcion := pkg_gi_informacion_exogena.fnc_vl_dato_alfabetico(v_val);',
unistr('                        v_tpo_dato_des := ''Alfab\00E9tico'';'),
'                    elsif v_tpo_dato = ''F'' then',
'                        v_vldcion := pkg_gi_informacion_exogena.fnc_vl_fecha(v_val);',
'                        v_tpo_dato_des := ''Fecha (ej: 2025-12-31)'';',
'                    else',
'                        v_vldcion := ''S'';',
'                    /*ELSIF v_tpo_dato = ''C'' THEN',
'                        v_vldcion := pkg_gi_informacion_exogena.fnc_vl_dato_alfanumerico(v_val);',
unistr('                        v_tpo_dato_des := ''Alfanum\00E9rico'';'),
'                    ELSE',
'                        v_vldcion := pkg_gi_informacion_exogena.fnc_vl_dato_alfanumerico(v_val);',
unistr('                        v_tpo_dato_des := ''Alfanum\00E9rico'';*/'),
'                    end if;',
'                    ',
'					--insert into muerto (n_001,v_001) values (v_cursor_id, ''v_tpo_dato => ''||v_tpo_dato||'' ''||''v_vldcion =>''||v_vldcion ||'' v_desc_tab(j)col_name => ''|| v_desc_tab(j).col_name|| '' v_val => '' || v_val);',
'',
'                    if v_vldcion = ''N'' then',
'                        v_ttal_linea := v_count + TO_NUMBER(v_linea);',
'                        ',
'						--insert into muerto (n_001,v_001) values (v_ttal_linea, ''Error en la hoja ''||v_hoja || '' columna => ''||v_desc_tab(j).col_name ||'' v_linea =>''||v_ttal_linea ||''dato: ''||v_val);',
'',
'                        APEX_COLLECTION.ADD_MEMBER(',
'                            p_collection_name => ''EXOGENA_ERROR'',',
'                            p_c001 => ''Error en la '' || v_hoja || '', columna => '' || v_desc_tab(j).col_name || '', fila => '' || v_ttal_linea || '', el dato => '' || v_val || '', debe ser de tipo => '' || v_tpo_dato_des||''.''',
'                        );',
'                        v_contaerror := v_contaerror + 1;',
'                    end if;',
'                end if;',
'            end loop;',
'			v_count := v_count + 1;',
'        end loop;',
'',
'        DBMS_SQL.CLOSE_CURSOR(v_cursor_id);',
'    end loop;',
'    ',
'    v_index := 0;',
'    for c_hojas in (',
'        select distinct b.nmro_hoja, a.lneas_encbzdo, c.nmbr_hojas',
'        from df_i_exogena_archivo_tipo a',
'        join df_i_exogena_archv_estrctra b on a.id_exgna_archvo_tpo = b.id_exgna_archvo_tpo',
'        join df_i_exogena_hojas c on b.nmro_hoja = c.id_hojas',
'        where b.id_exgna_archvo_tpo = :P14_ID_EXGNA_ARCHVO_TPO',
'        order by 1) ',
'    loop',
'        declare',
'            v_select varchar2(4000) := ''select '';',
'            v_cols   varchar2(4000) := '''';',
'        begin',
'            for c_columnas in (',
'                select b.nmbre_clmna,',
'                       b.nmro_clmna',
'                from df_i_exogena_archv_estrctra b',
'                where b.nmro_hoja = c_hojas.nmro_hoja',
'                and b.id_exgna_archvo_tpo = :P14_ID_EXGNA_ARCHVO_TPO  ',
'            ) loop',
'                v_cols := v_cols || c_columnas.nmbre_clmna || '' as '' || c_columnas.nmbre_clmna || '','';',
'            end loop;',
'',
'            v_cols := RTRIM(v_cols, '', '');',
'            v_select := v_select || v_cols || '', '''''' || c_hojas.nmbr_hojas || '''''' as NMERO_HJA ,'' || c_hojas.lneas_encbzdo || '' as NMERO_LNEA from apex_collections where collection_name = '''''' || c_hojas.nmro_hoja || '''''' and seq_id > '' || c_hojas.lnea'
||'s_encbzdo;',
'',
'            v_index := v_index + 1;',
'            v_sqls(v_index) := v_select;',
'			--insert into muerto (n_001,v_001) values (v_index,''v_select => ''||v_select);',
'        end;',
'    end loop;',
'    --insert into muerto (n_001,v_001) values (8,''v_contaerror => ''||v_contaerror);',
'',
'',
'    :P14_COUNT_ERROR := v_contaerror;',
'    if v_contaerror = 0 then',
'		v_envia_correo := ''S'';',
'		declare',
'			v_filename   VARCHAR2(255);',
'			v_mimetype   VARCHAR2(255);',
'			v_blob       BLOB;',
'		begin',
'			if :P14_ID_INFRMCION_EXGNA is not null then',
'				begin',
'					update gi_g_informacion_exogena',
'					set actvo = ''N'',indcdor_extmprneo = :P14_INDCDOR_EXTMPRNEO',
'					where id_infrmcion_exgna = :P14_ID_INFRMCION_EXGNA;                ',
'					',
'                    v_indcdr_crrccion := ''S'';',
'				exception',
'					when others then ',
unistr('					raise_application_error(-20001, ''Error al actualizar la informaci\00F3n exogena'');'),
'				end;',
'			else',
'				v_indcdr_crrccion := ''N'';',
'			end if;       ',
'			begin',
'				select filename, mime_type, blob_content',
'				into v_filename, v_mimetype, v_blob',
'				from apex_application_temp_files',
'				where name = :P14_FILE_BLOB;',
'			exception',
'				when no_data_found then',
unistr('					raise_application_error(-20001, ''El archivo no est\00E1 cargado.'');'),
'				when others then',
'					raise_application_error(-20001, ''Error al consultar el archivo.'');            ',
'			end;',
'			insert into gi_g_informacion_exogena (id_sjto_impsto,id_impsto,vgncia,id_exgna_archvo_tpo,',
'												  file_blob,file_name,file_mimetype,indcdor_prcsdo,',
'												  cdgo_clnte,mnsje_error,indcdr_crrccion,id_infrmcion_exgna_crccion,actvo,indcdor_extmprneo,id_prdo)',
'											values(:P14_ID_SJTO_IMPSTO,:P14_ID_IMPSTO,:P14_VGNCIA,:P14_ID_EXGNA_ARCHVO_TPO,',
'												   v_blob,v_filename,v_mimetype,''S'',',
'												   :F_CDGO_CLNTE,'''',v_indcdr_crrccion,:P14_ID_INFRMCION_EXGNA,''S'',:P14_INDCDOR_EXTMPRNEO,:P14_ID_PRDO) ',
'											returning id_infrmcion_exgna into v_id_infrmcion_exgna;      ',
'		end;',
'	    --insert into muerto (n_001,v_001) values (v_index,''v_id_infrmcion_exgna => ''||v_id_infrmcion_exgna);',
'',
'		FOR i IN 1 .. v_sqls.COUNT LOOP',
'			v_cntdor_lnea := 1;',
'			v_cursor_id := DBMS_SQL.OPEN_CURSOR;',
'			DBMS_SQL.PARSE(v_cursor_id, v_sqls(i), DBMS_SQL.NATIVE);',
'			DBMS_SQL.DESCRIBE_COLUMNS(v_cursor_id, v_col_cnt, v_desc_tab);',
'',
'			FOR j IN 1 .. v_col_cnt LOOP',
'				DBMS_SQL.DEFINE_COLUMN(v_cursor_id, j, v_val, 4000);',
'			END LOOP;',
'',
'			v_status := DBMS_SQL.EXECUTE(v_cursor_id);',
'',
'			DECLARE',
'				v_sql varchar2(4000) ;',
'				v_cols   varchar2(4000) ;',
'				v_values   varchar2(4000) ;',
'			BEGIN',
'			   WHILE DBMS_SQL.FETCH_ROWS(v_cursor_id) > 0 LOOP',
'					v_sql  := ''insert into  gi_g_info_exogena_detalle (ID_INFRMCION_EXGNA, '';',
'					v_cols  := '''';',
'					v_values  := nvl(v_id_infrmcion_exgna,:P14_ID_INFRMCION_EXGNA)||'','';',
'					v_row_values.DELETE;',
'					v_hoja := NULL;',
'					v_linea := NULL;',
'',
'					FOR j IN 1 .. v_col_cnt LOOP',
'						DBMS_SQL.COLUMN_VALUE(v_cursor_id, j, v_val);',
'						v_row_values(j) := v_val;',
'',
'						IF v_desc_tab(j).col_name = ''NMERO_LNEA'' THEN',
'							v_linea := v_val;',
'',
'							 v_cols := v_cols || v_desc_tab(j).col_name || '',''; ',
'							 v_values := v_values ||''''''''|| (to_number(v_val) + v_cntdor_lnea) ||'''''','';',
'						else--v_desc_tab(j).col_name',
'							v_cols := v_cols || v_desc_tab(j).col_name || '',''; ',
'							v_values := v_values ||''''''''|| v_val ||'''''','';',
'						end if ;',
'',
'					END LOOP;',
'',
'					v_cols := RTRIM(v_cols, '', '');',
'					v_values := RTRIM(v_values, '', '');',
'',
'					v_values := v_values||'')'';',
'					v_cols := v_cols || '') '';',
'',
'					v_sql := v_sql || v_cols || '' values(''||v_values ;',
'					--insert into muerto (n_001, v_001) values (v_cursor_id, v_sql);',
'					v_cntdor_lnea:= v_cntdor_lnea + 1;',
'',
'					pkg_gi_informacion_exogena.prc_rg_informacion_exogena_dtlle(p_sql =>v_sql );',
'',
'					begin',
'						update gi_g_informacion_exogena',
'						set indcdor_prcsdo = ''S'', indcdor_extmprneo = :P14_INDCDOR_EXTMPRNEO',
'						where id_infrmcion_exgna = :P14_ID_INFRMCION_EXGNA;',
'					exception',
'						when others then ',
'							null;',
'					end;',
'					v_count := v_count + 1;',
'			   END LOOP;',
'			END;',
'			DBMS_SQL.CLOSE_CURSOR(v_cursor_id);',
'		END LOOP;',
'		',
'        commit;',
'        ',
'		if v_envia_correo = ''S'' then',
'			declare',
'				v_json_parametros clob;',
'			begin',
'				begin',
'					select json_object(key ''ID_INFRMCION_EXGNA'' value nvl(v_id_infrmcion_exgna,:P14_ID_INFRMCION_EXGNA),',
'									   key ''ID_SJTO_IMPSTO''     value :P14_ID_SJTO_IMPSTO)',
'					into v_json_parametros',
'					from dual;',
'				exception',
'					when others then',
'						null;',
'				end;',
'				begin      ',
'					pkg_ma_envios.prc_co_envio_programado(p_cdgo_clnte   => :F_CDGO_CLNTE,',
'                                                          p_idntfcdor    => ''EXOGENA'',',
'                                                          p_json_prmtros => v_json_parametros);',
'				exception',
'					when others then',
'						null;',
'				end; ',
'			end;',
'		else',
'			null;',
'		end if;',
'	end if;',
'end; '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9183922852986709)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar modal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST IN (''CREATE'',''SAVE'') AND :P14_COUNT_ERROR = 0'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69098365595285186)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(69091455539285082)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Create Form'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9184090981986710)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Limpiar colleccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    if (not apex_collection.collection_exists(p_collection_name => ''EXOGENA_ERROR'') ) then',
'            apex_collection.create_collection( p_collection_name => ''EXOGENA_ERROR'');',
'            --APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''EXOGENA_ERROR'');',
'     else',
'         IF :P14_COUNT_ERROR =  0 THEN',
'             APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''EXOGENA_ERROR'');',
'         END IF;',
'     end if;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
null;
end;
/
