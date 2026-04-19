prompt --application/pages/page_00308
begin
wwv_flow_api.create_page(
 p_id=>308
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('310. Cargue Impuesto Telefon\00EDa')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('310. Cargue Impuesto Telefon\00EDa')
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
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20250326135905'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(169158989797205451)
,p_plug_name=>'Cargue de Archivo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'GI_G_INFORMACION_TELEFONO'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8804123798818628)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(169158989797205451)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>' Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:309:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-undo-arrow'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8804530155818628)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(169158989797205451)
,p_button_name=>'BTN_ELIMINAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-trash'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8804923943818628)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(169158989797205451)
,p_button_name=>'BTN_APLICAR_CAMBIOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P308_ID_INFRMCION_TELEFONO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-edit'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8805346819818627)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(169158989797205451)
,p_button_name=>'BTN_INSERTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cargar Registro'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P308_ID_INFRMCION_TELEFONO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-cloud-upload'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8805757940818627)
,p_name=>'P308_ID_INFRMCION_TELEFONO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(169158989797205451)
,p_item_source_plug_id=>wwv_flow_api.id(169158989797205451)
,p_source=>'ID_INFRMCION_TELEFONO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8806194426818627)
,p_name=>'P308_FILE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(169158989797205451)
,p_item_source_plug_id=>wwv_flow_api.id(169158989797205451)
,p_source=>'FILE_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8806522397818626)
,p_name=>'P308_TPO_ARCHVO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(169158989797205451)
,p_item_source_plug_id=>wwv_flow_api.id(169158989797205451)
,p_prompt=>'Tipo de Archivo'
,p_source=>'ID_TELEFONO_ARCHVO_TPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre, id_telefono_archvo_tpo r',
'  from df_i_telefono_archivo_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8806922128818626)
,p_name=>'P308_VGNCIA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(169158989797205451)
,p_item_source_plug_id=>wwv_flow_api.id(169158989797205451)
,p_prompt=>'Vigencia'
,p_source=>'VGNCIA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT VGNCIA D, VGNCIA R ',
'FROM DF_S_VIGENCIAS ',
'WHERE VGNCIA >= 2024',
'ORDER BY 1 DESC'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8807358957818626)
,p_name=>'P308_PRDO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(169158989797205451)
,p_item_source_plug_id=>wwv_flow_api.id(169158989797205451)
,p_prompt=>'Periodo'
,p_source=>'ID_PRDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  dscrpcion, id_prdo',
'  from df_i_periodos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto = :P308_IMPSTO',
'   and id_impsto_sbmpsto = :P308_SBMPSTO',
'  '))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>'P308_ID_INFRMCION_TELEFONO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8807778629818626)
,p_name=>'P308_FILE_BLOB'
,p_source_data_type=>'BLOB'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(169158989797205451)
,p_item_source_plug_id=>wwv_flow_api.id(169158989797205451)
,p_prompt=>'Archivo'
,p_source=>'FILE_BLOB'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>80
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#:margin-top-md'
,p_is_persistent=>'N'
,p_attribute_01=>'DB_COLUMN'
,p_attribute_02=>'FILE_MIMETYPE'
,p_attribute_03=>'FILE_NAME'
,p_attribute_06=>'Y'
,p_attribute_08=>'attachment'
,p_attribute_11=>'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8808191246818626)
,p_name=>'P308_IMPSTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(169158989797205451)
,p_item_source_plug_id=>wwv_flow_api.id(169158989797205451)
,p_source=>'ID_IMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8808543812818625)
,p_name=>'P308_CDGO_CLNTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(169158989797205451)
,p_item_source_plug_id=>wwv_flow_api.id(169158989797205451)
,p_source=>'CDGO_CLNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8808996562818625)
,p_name=>'P308_ARCHIVO_1'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(169158989797205451)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8809310701818625)
,p_name=>'P308_ARCHIVO_2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(169158989797205451)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8809786576818625)
,p_name=>'P308_ARCHIVO_3'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(169158989797205451)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8810153271818624)
,p_name=>'P308_SBMPSTO'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(169158989797205451)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8810577263818624)
,p_name=>'P308_ID_USRIO_TLFNIA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(169158989797205451)
,p_item_source_plug_id=>wwv_flow_api.id(169158989797205451)
,p_source=>'ID_USRIO_TLFNIA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8815260903818618)
,p_name=>'Al cambiar el archivo'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P308_FILE_BLOB'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8815762490818617)
,p_event_id=>wwv_flow_api.id(8815260903818618)
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
'        //alert(vTipo);',
'        ',
'        if( vTipo != "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") {',
'            alert(''El tipo de Archivo Seleccionado no es Permitido'');',
'',
unistr('            // Si la extensi\00F3n no es de archivo Excel --> Presentar mensaje de Error'),
'            Swal.fire({',
'                icon: ''error'',',
'                title:  ''<H2 >Carga de Archivo</H2>'',',
'                html: ''El archivo debe ser de tipo Excel (.xlsx).''',
'            });',
'',
'            apex.item(''P14_FILE_BLOB'').setValue("");',
'',
'        }',
'    }',
'}',
'',
'',
'Restringir_Archivo_Tipo(this);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8811343493818623)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(169158989797205451)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Para guardar registros'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8814411859818618)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cancelar'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(8804123798818628)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8814825094818618)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Envio de Correo Cargue Archivos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta      number;',
'    o_mnsje_rspsta     varchar2(4000);',
'    v_error            varchar2(4000);',
'begin ',
'    pkg_gi_telefonos_cargue.prc_cargue_archivos_portal (   p_cdgo_clnte             =>  :F_CDGO_CLNTE,',
'                                                           p_id_usuario_telefonia   =>  :P308_ID_USRIO_TLFNIA,',
'                                                           p_archivo_tipo           =>  :P308_TPO_ARCHVO,',
'                                                           o_cdgo_rspsta            =>  o_cdgo_rspsta,',
'                                                           o_mnsje_rspsta           =>  o_mnsje_rspsta);  ',
'     ',
'   if (o_cdgo_rspsta != 0) then',
'        raise_application_error(-20001, o_mnsje_rspsta);',
'    end if;',
'	exception',
'        when others then',
'            v_error := sqlerrm;',
'            raise_application_error(-20001, v_error);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(8805346819818627)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8810914958818624)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(169158989797205451)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>unistr('Initialize form Cargue Impuesto Telefon\00EDa')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
