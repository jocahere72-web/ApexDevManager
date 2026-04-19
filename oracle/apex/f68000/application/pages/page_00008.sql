prompt --application/pages/page_00008
begin
wwv_flow_api.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_api.id(71889596252951620)
,p_name=>unistr('Gesti\00F3n de Motivos')
,p_page_mode=>'MODAL'
,p_step_title=>'Motivos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>unistr('var htmldb_delete_message=''\00BFEst\00E1 seguro que desea eliminar el motivo?'';')
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>'Ingrese el motivo de la solicitud y los campos que correspondan al flujo de trabajo y proceso correspondiente.'
,p_last_updated_by=>'JADIES'
,p_last_upd_yyyymmddhh24miss=>'20240909161315'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(72702514053645660)
,p_plug_name=>'Motivos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71794082964951554)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'        <div  class="col col-12" style="text-align: right !important;">',
'            <font size="1">Los campos marcados con </font><font size="2" color="red">*</font><font size="1"> son obligatorios</font>',
'        </div>',
'</div>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(72703201207645663)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71795008836951554)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72703640820645664)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(72703201207645663)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72703131476645663)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(72703201207645663)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm("Â¿EstÃ¡ seguro que desea eliminar el motivo?");'
,p_button_execute_validations=>'N'
,p_button_condition=>'P8_ID_MTVO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72703017971645663)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(72703201207645663)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P8_ID_MTVO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72702932678645663)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(72703201207645663)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P8_ID_MTVO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2672321171762601)
,p_name=>'P8_VLDAR_EXPDNT_FSCA'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(72702514053645660)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>unistr('\00BFAsociar Expediente de Fiscalizaci\00F3n?')
,p_source=>'VLDAR_EXPDNT_FSCA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(71867177152951592)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si el motivo de la PQR requiere asociar un expediente de Fiscalizaci\00F3n.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4753059658707419)
,p_name=>'P8_EDTA_SLCTUD'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(72702514053645660)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>unistr('\00BFEditar solicitud PQR?')
,p_source=>'EDTA_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(71867177152951592)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si el motivo de la PQR requiere asociar un expediente de Fiscalizaci\00F3n.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71910345299488801)
,p_name=>'P8_INDCDOR_PRTAL'
,p_is_required=>true
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(72702514053645660)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFSe Puede Realizar Desde Portal?')
,p_source=>'INDCDOR_PRTAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(71867177152951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72706431376645684)
,p_name=>'P8_ID_MTVO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(72702514053645660)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_MTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72706753116645685)
,p_name=>'P8_CDGO_CLNTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(72702514053645660)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&F_CDGO_CLNTE.'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72707140499645686)
,p_name=>'P8_ID_FLJO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(72702514053645660)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flujo de Trabajo'
,p_source=>'ID_FLJO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_fljo,',
'       id_fljo',
'  from wf_d_flujos',
'where cdgo_clnte = :F_CDGO_CLNTE',
'order by 1',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccionar Flujo de Trabajo'
,p_colspan=>6
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(71867355103951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el Flujo de trabajo que se crea a partir de la PQR.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72707584410645686)
,p_name=>'P8_ID_PRCSO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(72702514053645660)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Proceso'
,p_source=>'ID_PRCSO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre,',
'       id_prcso',
' from df_s_procesos',
' order by 1',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccionar Proceso '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71867355103951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el proceso al que corresponde el motivo a ingresar. '
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72707960944645687)
,p_name=>'P8_DSCRPCION'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(72702514053645660)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Motivo'
,p_source=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>95
,p_cMaxlength=>400
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(71867355103951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Describa el motivo de la solicitud a ingresar.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72708335006645687)
,p_name=>'P8_TPO_DIA'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(72702514053645660)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Tipo D\00EDa')
,p_source=>'TPO_DIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_TIPO_DIA'
,p_lov=>'.'||wwv_flow_api.id(72039863882839182)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccionar'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71867355103951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tipo de d\00EDa (H\00E1bil o Calendario)')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72708764150645687)
,p_name=>'P8_UNDAD_DRCION_PRYCTDA'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(72702514053645660)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Unidad Duraci\00F3n  Proyectada')
,p_source=>'UNDAD_DRCION_PRYCTDA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_UNIDADES_DURACION'
,p_lov=>'.'||wwv_flow_api.id(72043574425839190)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccionar'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71867355103951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione la Unidad de duraci\00F3n l\00EDmite de respuesta establecida por la administraci\00F3n (minutos, horas, d\00EDas, semanas, meses)')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72709117064645687)
,p_name=>'P8_DRCION_PRYCTDA'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(72702514053645660)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Duraci\00F3n Proyectada')
,p_source=>'DRCION_PRYCTDA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>8
,p_cMaxlength=>255
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(71867355103951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la cantidad de tiempo de duraci\00F3n del motivo de la solicitud, de acuerdo con la unidad de duraci\00F3n definido por la administraci\00F3n.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72709561269645687)
,p_name=>'P8_UNDAD_DRCION_LMTE_LEY'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(72702514053645660)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Unidad Duraci\00F3n Ley')
,p_source=>'UNDAD_DRCION_LMTE_LEY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_UNIDADES_DURACION'
,p_lov=>'.'||wwv_flow_api.id(72043574425839190)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccionar'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71867355103951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione la Unidad de duraci\00F3n l\00EDmite de respuesta establecida por la ley (minutos, horas, d\00EDas, semanas, meses)')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72709936253645688)
,p_name=>'P8_DRCION_LMTE_LEY'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(72702514053645660)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Duraci\00F3n por Ley')
,p_source=>'DRCION_LMTE_LEY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>8
,p_cMaxlength=>255
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(71867355103951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la cantidad de tiempo de duraci\00F3n del motivo de la solicitud, de acuerdo con la unidad de duraci\00F3n v\00E1lido por ley.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72710327229645688)
,p_name=>'P8_NTFCAR_RSPNSBLE'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(72702514053645660)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>unistr('\00BFNotificar Responsable?')
,p_source=>'NTFCAR_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71867355103951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Valida si el motivo permite notificar o no el acto a los responsables en la solicitud.'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72710705508645688)
,p_name=>'P8_ACTVO'
,p_is_required=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(72702514053645660)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(71867355103951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Opci\00F3n que activa o desactiva el motivo ingresado.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72711148864645688)
,p_name=>'P8_VLDAR_SJTO_IMPSTO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(72702514053645660)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>unistr('\00BFValidar Sujeto Tributo?')
,p_source=>'VLDAR_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(71867355103951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Valida si el motivo de solicitud tiene en cuenta el sujeto tributo.'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75808950888596605)
,p_name=>'P8_INDCDOR_RDCCION_ATMTCA'
,p_is_required=>true
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(72702514053645660)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>unistr('\00BFRadicaci\00F3n Autom\00E1tica?')
,p_source=>'INDCDOR_RDCCION_ATMTCA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71867355103951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Valida si el motivo requiere ser notificado autom\00E1ticamente o no.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78212307241860311)
,p_name=>'P8_INDCDOR_ACMLDO_MTVO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(72702514053645660)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_source=>'INDCDOR_ACMLDO_MTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78212404564860312)
,p_name=>'P8_INDCDOR_ACMLDO_SJTO_IMPSTO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(72702514053645660)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_source=>'INDCDOR_ACMLDO_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(81317604318850225)
,p_name=>'P8_INDCDOR_FCHA_RSPSTA'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(72702514053645660)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha de respuesta por'
,p_source=>'INDCDOR_FCHA_RSPSTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_TIPO_FCHA_RSPSTA'
,p_lov=>'.'||wwv_flow_api.id(82656812259763623)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccionar'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71867355103951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Permite determinar si la fecha de respuesta de la solicitud tiene en cuenta la duraci\00F3n definida por la administraci\00F3n o la reglamentaria.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(119862466009278101)
,p_name=>'P8_ID_TPO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(72702514053645660)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo'
,p_source=>'ID_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_tpo ',
'  from pq_d_tipos ',
' where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccionar '
,p_field_template=>wwv_flow_api.id(71867355103951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el tipo de PQR asociada al motivo.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(160175554078425002)
,p_name=>'P8_INDCDOR_PQR_AUTMTCA'
,p_is_required=>true
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(72702514053645660)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFPQR Autom\00E1tica?')
,p_source=>'INDCDOR_PQR_AUTMTCA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71867355103951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si el motivo genera autom\00E1ticamente una PQR e instancia el flujo hijo sin necesidad de entrar por el m\00F3dulo de PQR para gestionarla.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(72703798897645664)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(72703640820645664)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(72704555958645666)
,p_event_id=>wwv_flow_api.id(72703798897645664)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72715883391645692)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from PQ_D_MOTIVOS'
,p_attribute_02=>'PQ_D_MOTIVOS'
,p_attribute_03=>'P8_ID_MTVO'
,p_attribute_04=>'ID_MTVO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72716253067645692)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of PQ_D_MOTIVOS'
,p_attribute_02=>'PQ_D_MOTIVOS'
,p_attribute_03=>'P8_ID_MTVO'
,p_attribute_04=>'ID_MTVO'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72716699200645693)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(72703131476645663)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72717043952645693)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
