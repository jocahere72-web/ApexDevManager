prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Informaci\00F3n Ex\00F3gena Cargar Vr 2')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Informaci\00F3n Ex\00F3gena Cargar Vr 2')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#cabecera_portal{',
'    display:none;  ',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'300'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20200505164859'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138584862083255728)
,p_plug_name=>'Create Form'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252169105903651390)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'GI_G_INFORMACION_EXOGENA'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138588599027255799)
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
 p_id=>wwv_flow_api.id(69498408094970710)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(138588599027255799)
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
 p_id=>wwv_flow_api.id(69498879738970718)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(138588599027255799)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69499294246970719)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(138588599027255799)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P12_ID_INFRMCION_EXGNA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69499628486970719)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(138588599027255799)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cargar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P12_ID_INFRMCION_EXGNA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-cloud-upload'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69494041681970679)
,p_name=>'P12_ID_INFRMCION_EXGNA'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(138584862083255728)
,p_item_source_plug_id=>wwv_flow_api.id(138584862083255728)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Infrmcion Exgna'
,p_source=>'ID_INFRMCION_EXGNA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69494457619970692)
,p_name=>'P12_ID_SJTO_IMPSTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(138584862083255728)
,p_item_source_plug_id=>wwv_flow_api.id(138584862083255728)
,p_source=>'ID_SJTO_IMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69494808168970694)
,p_name=>'P12_ID_IMPSTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(138584862083255728)
,p_item_source_plug_id=>wwv_flow_api.id(138584862083255728)
,p_source=>'ID_IMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69495298192970695)
,p_name=>'P12_VGNCIA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(138584862083255728)
,p_item_source_plug_id=>wwv_flow_api.id(138584862083255728)
,p_item_default=>'select vgncia from df_i_calendario_exogena where cdgo_clnte = :F_CDGO_CLNTE and sysdate between fcha_dsde and fcha_hsta'
,p_item_default_type=>'SQL_QUERY'
,p_source=>'VGNCIA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69495639540970695)
,p_name=>'P12_ID_EXGNA_ARCHVO_TPO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(138584862083255728)
,p_item_source_plug_id=>wwv_flow_api.id(138584862083255728)
,p_prompt=>'Tipo de Archivo'
,p_source=>'ID_EXGNA_ARCHVO_TPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre || '':'' || dscrpcion d, id_exgna_archvo_tpo r',
'  from df_i_exogena_archivo_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and  (:P12_ID_INFRMCION_EXGNA is null and id_exgna_archvo_tpo not in ( ',
'          select b.id_exgna_archvo_tpo',
'            from v_gi_g_informacion_exogena b',
'           where b.id_sjto_impsto = :P11_ID_SJTO_IMPSTO ',
'             and vgncia in  (select vgncia from df_i_calendario_exogena where cdgo_clnte = :F_CDGO_CLNTE and sysdate between fcha_dsde and fcha_hsta)',
'             )',
'        or :P12_ID_INFRMCION_EXGNA is not null and :P12_ID_EXGNA_ARCHVO_TPO = id_exgna_archvo_tpo ) '))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69496048675970696)
,p_name=>'P12_FILE_BLOB'
,p_source_data_type=>'BLOB'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(138584862083255728)
,p_item_source_plug_id=>wwv_flow_api.id(138584862083255728)
,p_prompt=>'Archivo'
,p_source=>'FILE_BLOB'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>120
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_help_text=>unistr('Seleccione el archivo con la informaci\00F3n ex\00F3gena a enviar. ')
,p_attribute_01=>'DB_COLUMN'
,p_attribute_02=>'FILE_MIMETYPE'
,p_attribute_03=>'FILE_NAME'
,p_attribute_06=>'N'
,p_attribute_11=>'application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69496907665970701)
,p_name=>'P12_FILE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(138584862083255728)
,p_item_source_plug_id=>wwv_flow_api.id(138584862083255728)
,p_source=>'FILE_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(69502433224970787)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(69498408094970710)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(69502953085970791)
,p_event_id=>wwv_flow_api.id(69502433224970787)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(69503372099970792)
,p_name=>'Al cambiar Archivo'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_FILE_BLOB'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(69503891250970793)
,p_event_id=>wwv_flow_api.id(69503372099970792)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function Restringir_Archivo_Tipo($this) {',
'',
'    var file = $this.triggeringElement.files[0];',
'    ',
'    if (file !== undefined ) {',
'        vTipo = new String( file.type );',
'',
'        alert(vTipo);',
'',
'        //if( vTipo != "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" ) {',
'        if( vTipo != "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" ) {',
'            alert(''Diferente'');',
'',
unistr('            // Si lA EXTENSI\00D3N NO ES  de archivo de Excel --> Presentar mensaje de Error'),
'            Swal.fire({',
'                icon: ''error'',',
'                title:  ''<H2 >Carga de Archivo</H2>'',',
'                html: ''El archivo debe ser de tipo Excel.''',
'            });',
'',
'            apex.item(''P12_FILE_BLOB'').setValue("");',
'',
'        }',
'    }',
'}',
'',
'',
'Restringir_Archivo_Tipo(this);',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69497757704970709)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(138584862083255728)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Create Form'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69502162539970786)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69497338303970705)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(138584862083255728)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Create Form'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
