prompt --application/pages/page_00179
begin
wwv_flow_api.create_page(
 p_id=>179
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Configuraci\00F3n Financiera - Cliente')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Configuraci\00F3n Financiera - Cliente')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_protection_level=>'C'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20201125180502'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98877053427978293)
,p_plug_name=>'Create Form'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29530253509068499)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'DF_C_CONFIGURACION_FNNCRA'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98883608982978310)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29532093730068500)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(97590241452821749)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(98877053427978293)
,p_button_name=>'BTN_SIMU_CALCULO_TASA_DIARIA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>unistr('Simular c\00E1lculo Tasa diaria')
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:180:&SESSION.::&DEBUG.:RP,180:P180_TPO_SMLCION:TSA_DRIA'
,p_icon_css_classes=>'fa-calculator'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(97590340737821750)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_api.id(98877053427978293)
,p_button_name=>'BTN_SIMU_CALCULO_INTERES_MORA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>unistr('Simular c\00E1lculo Inter\00E9s de Mora')
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:180:&SESSION.::&DEBUG.:RP,180:P180_TPO_SMLCION:INTRES'
,p_icon_css_classes=>'fa-calculator'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(98884024788978312)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(98883608982978310)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Cancelar / Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(98885693265978316)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(98883608982978310)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P179_ID_CNFGRCION_FNNCRA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(98886023847978317)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(98883608982978310)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P179_ID_CNFGRCION_FNNCRA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(98886405853978317)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(98883608982978310)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P179_ID_CNFGRCION_FNNCRA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98877443604978294)
,p_name=>'P179_ID_CNFGRCION_FNNCRA'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(98877053427978293)
,p_item_source_plug_id=>wwv_flow_api.id(98877053427978293)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Cnfgrcion Fnncra'
,p_source=>'ID_CNFGRCION_FNNCRA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(29604177042068537)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98877821671978300)
,p_name=>'P179_CDGO_CLNTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(98877053427978293)
,p_item_source_plug_id=>wwv_flow_api.id(98877053427978293)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98878284653978304)
,p_name=>'P179_CDGO_RDNDEO_EXPRSION_GNRAL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(98877053427978293)
,p_item_source_plug_id=>wwv_flow_api.id(98877053427978293)
,p_prompt=>'Redondeo General'
,p_source=>'CDGO_RDNDEO_EXPRSION_GNRAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_EXPRESION_REDONDEO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_rdndeo_exprsion as r',
'  from df_s_redondeos_expresion',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccionar el tipo de redondeo que ser\00E1 utilizado de manera general en el sistema. Por ejemplo al redondear los valores del documento de pago.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98878646279978305)
,p_name=>'P179_CDGO_RDNDEO_EXPRSION_INT_PRDO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(98877053427978293)
,p_item_source_plug_id=>wwv_flow_api.id(98877053427978293)
,p_prompt=>unistr('Redondeo inter\00E9s de mora por periodo')
,p_source=>'CDGO_RDNDEO_EXPRSION_INT_PRDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_EXPRESION_REDONDEO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_rdndeo_exprsion as r',
'  from df_s_redondeos_expresion',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccionar el tipo de redondeo que ser\00E1 utilizado para redondear el valor de inter\00E9s de mora por periodos [periodos de tasas mora]')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98879078431978305)
,p_name=>'P179_CDGO_RDNDEO_EXPRSION_INT_TTAL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(98877053427978293)
,p_item_source_plug_id=>wwv_flow_api.id(98877053427978293)
,p_prompt=>unistr('Redondeo del total de inter\00E9s de mora')
,p_source=>'CDGO_RDNDEO_EXPRSION_INT_TTAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_EXPRESION_REDONDEO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_rdndeo_exprsion as r',
'  from df_s_redondeos_expresion',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccionar el tipo de redondeo que ser\00E1 utilizado para redondear el valor total de inter\00E9s de mora.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98879464494978306)
,p_name=>'P179_CDGO_TPO_DIAS_ANIO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(98877053427978293)
,p_item_source_plug_id=>wwv_flow_api.id(98877053427978293)
,p_prompt=>unistr('Forma de c\00E1lculo de n\00FAmero de d\00EDas del a\00F1o')
,p_source=>'CDGO_TPO_DIAS_ANIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Fijo;FJO,Din\00E1mico;DNM')
,p_cHeight=>1
,p_colspan=>6
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Se selecciona la forma que sera usada para calcular el numero de d\00EDas del a\00F1o.  <br>'),
unistr('<b> Din\00E1mico </b>: Al seleccionar esta forma de c\00E1lculo se tendr\00E1 en cuenta el tipo de a\00F1o para calcular el numero de d\00EDas del a\00F1o. Para los a\00F1os bisiestos ser\00E1n 366 d\00EDas y para los a\00F1os normales 365 d\00EDas. <br>'),
unistr('<b> Fijo</b>: Al seleccionar esta forma de c\00E1lculo el n\00FAmero de d\00EDas del a\00F1o ser\00E1 el que se especifique en el \00EDtem <b><i>"N\00FAmero de d\00EDas del a\00F1o".</i></b>')))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98879857932978306)
,p_name=>'P179_NMRO_DIAS_ANIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(98877053427978293)
,p_item_source_plug_id=>wwv_flow_api.id(98877053427978293)
,p_prompt=>unistr('N\00FAmero de d\00EDas del a\00F1o')
,p_source=>'NMRO_DIAS_ANIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_cMaxlength=>255
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>unistr('N\00FAmero de d\00EDas del a\00F1o que ser\00E1 usado para calcular el valor de la tasa d\00EDa')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98880181861978307)
,p_name=>'P179_FCHA_DSDE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(98877053427978293)
,p_item_source_plug_id=>wwv_flow_api.id(98877053427978293)
,p_prompt=>'Fecha desde'
,p_source=>'FCHA_DSDE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>255
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>unistr('Fecha cuando inicia a regir esta configuraci\00F3n')
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98880593099978307)
,p_name=>'P179_FCHA_HSTA'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(98877053427978293)
,p_item_source_plug_id=>wwv_flow_api.id(98877053427978293)
,p_prompt=>'Fecha hasta'
,p_source=>'FCHA_HSTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>unistr('Fecha hasta cuando rige esta configuraci\00F3n')
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98957840262819411)
,p_name=>'P179_CDGO_TSA_DRIA_FRMLA'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(98877053427978293)
,p_item_source_plug_id=>wwv_flow_api.id(98877053427978293)
,p_prompt=>unistr('Formula de c\00E1lculo de tasa diaria')
,p_source=>'CDGO_TSA_DRIA_FRMLA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_TASA_DIARIA_FORMULA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_tsa_dria_frmla as r',
'  from df_s_tasa_diaria_formula',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(97589932504821746)
,p_validation_name=>unistr('Validar que el numero de d\00EDas no sea nulo cuando el tipo de calculo sea fijo')
,p_validation_sequence=>10
,p_validation=>'P179_NMRO_DIAS_ANIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# no puede ser nulo'
,p_validation_condition=>'P179_CDGO_TSA_DRIA_FRMLA'
,p_validation_condition2=>'FJO'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(98879857932978306)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(97590011988821747)
,p_validation_name=>unistr('Validar que el numero de d\00EDas sea mayor que 359')
,p_validation_sequence=>20
,p_validation=>':P179_NMRO_DIAS_ANIO >= 360'
,p_validation_type=>'SQL_EXPRESSION'
,p_error_message=>'#LABEL# debe ser mayor o igual que 360'
,p_validation_condition=>'P179_CDGO_TSA_DRIA_FRMLA'
,p_validation_condition2=>'FJO'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(98879857932978306)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(97590166636821748)
,p_validation_name=>'Validar Rangos de Fecha'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
' v_id_cnfgrcion_fnncra df_c_configuracion_fnncra.id_cnfgrcion_fnncra%type;',
'begin     ',
'  ',
'  --Verifica si el rango existe',
'  select id_cnfgrcion_fnncra',
'    into v_id_cnfgrcion_fnncra',
'    from df_c_configuracion_fnncra ',
'   where (to_date(:P179_FCHA_DSDE,''DD/MM/YYYY'') between  fcha_dsde                         and  fcha_hsta ',
'          or fcha_dsde                     between  to_date(:P179_FCHA_DSDE,''DD/MM/YYYY'')  and  to_date(:P179_FCHA_HSTA,''DD/MM/YYYY''))',
'     and (to_date(:P179_FCHA_HSTA,''DD/MM/YYYY'') between  fcha_dsde                         and  fcha_hsta',
'          or fcha_hsta                     between  to_date(:P179_FCHA_DSDE,''DD/MM/YYYY'')  and  to_date(:P179_FCHA_HSTA,''DD/MM/YYYY''));',
'      ',
'   if( v_id_cnfgrcion_fnncra = :P179_ID_CNFGRCION_FNNCRA ) then ',
'       return true;',
'   else',
'       return false;    ',
'   end if;',
'   ',
'exception ',
'     when too_many_rows then ',
'          return false;',
'     when no_data_found then ',
'          return true;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El rango de fechas ingresado esta incluido rango de fechas existente.'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(98884181123978312)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(98884024788978312)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(98884941074978315)
,p_event_id=>wwv_flow_api.id(98884181123978312)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(97588748409821734)
,p_name=>unistr('Mostrar Numero d\00EDas anio cuando el tipo de d\00EDas es fijo')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P179_CDGO_TSA_DRIA_FRMLA'
,p_condition_element=>'P179_CDGO_TSA_DRIA_FRMLA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'FJO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97588882212821735)
,p_event_id=>wwv_flow_api.id(97588748409821734)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P179_NMRO_DIAS_ANIO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97588920070821736)
,p_event_id=>wwv_flow_api.id(97588748409821734)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P179_NMRO_DIAS_ANIO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98887202516978317)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(98877053427978293)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Create Form'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98887659835978319)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98886882699978317)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(98877053427978293)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Create Form'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
