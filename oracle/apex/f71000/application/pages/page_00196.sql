prompt --application/pages/page_00196
begin
wwv_flow_api.create_page(
 p_id=>196
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Gesti\00F3n de M\00E9todos de Revocatorias')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Gesti\00F3n de M\00E9todos de Revocatorias')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_last_updated_by=>'LOBREDOR'
,p_last_upd_yyyymmddhh24miss=>'20191129174134'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(110286872430018344)
,p_plug_name=>unistr('Gesti\00F3n de M\00E9todos de Revocatorias')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(110287578131018346)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177323513323050604)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(110287946461018346)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(110287578131018346)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar '
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(110287417568018346)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(110287578131018346)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro desea eliminar este mÃ©todo de revocatoria?'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P196_ID_RVCTRIA_MTDO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(110287365772018346)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(110287578131018346)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P196_ID_RVCTRIA_MTDO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(110287258434018346)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(110287578131018346)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P196_ID_RVCTRIA_MTDO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(33491820200634705)
,p_branch_name=>'Go To Page 28'
,p_branch_action=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:RP,28::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110290340705018351)
,p_name=>'P196_ID_RVCTRIA_MTDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(110286872430018344)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_RVCTRIA_MTDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110290772794018371)
,p_name=>'P196_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(110286872430018344)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&F_CDGO_CLNTE.'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110291007445018373)
,p_name=>'P196_DSCRPCION'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(110286872430018344)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>200
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Descripci\00F3n del m\00E9todo de revocatoria')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110291434073018373)
,p_name=>'P196_CDGO_RVCTRIA_TPO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(110286872430018344)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de Revocatoria'
,p_source=>'CDGO_RVCTRIA_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_REVOCATORIA_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion || '' ['' || cdgo_rvctria_tpo  || '']'' as d,',
'       cdgo_rvctria_tpo as r',
'  from gf_d_revocatoria_tipo',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Define el tipo de revocatoria asociado al m\00E9todo de revocatoria.<br><br>'),
unistr('<i><b>Oficios de Incumplimiento</b></i>: Indica que para evaluar los candidatos de revocatoria se debe tener los oficios de incumplimientos generados. <br> <i><b>NOTA:</b> Los Oficios de Incumplimientos se generan teniendo en cuenta el n\00FAmero de cuot')
||unistr('as vencidas ingresado en "N\00FAmero de Cuotas" y el n\00FAmero de d\00EDas transcurridos, luego de vencida la cuota ingresada en "N\00FAmero de Dias de Vencimiento".</i><br><br>'),
unistr('<i><b>Cuotas Vencidas</b></i>: Indican que para evaluar los candidatos de revocatoria se debe tener en cuenta las cuotas vencidas del acuerdo de pago y el n\00FAmero de d\00EDas transcurridos luego de vencida la cuota.')))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110291845742018373)
,p_name=>'P196_ID_ACTO_TPO_INCMPLMNTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(110286872430018344)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de Acto de Oficio de Incumplimiento'
,p_source=>'ID_ACTO_TPO_INCMPLMNTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_TIPOS_ACTO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION as d,',
'       id_acto_tpo  as r',
'      from GN_D_ACTOS_TIPO',
'      where cdgo_clnte = :F_CDGO_CLNTE',
'      order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccionar el tipo de acto para generar oficio de incumplimiento'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110292226448018374)
,p_name=>'P196_NMRO_CTAS'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(110286872430018344)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00FAmero Cuotas')
,p_source=>'NMRO_CTAS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Si el tipo de revocatoria seleccionado es <b><i>Oficio de Incimplimiento</i></b>, indica el n\00FAmero m\00EDnimo de cuotas vencidas que se debe tener en cuenta para emitir el oficio de incumplimiento. <br> <br>'),
unistr('Si el tipo de revocatoria seleccionado es <b><i>Cuotas Vencidas</i></b>, indica el n\00FAmero m\00EDnimo de cuotas vencidas que se debe tener en cuenta para ser candidato de revocatoria.')))
,p_attribute_01=>'0'
,p_attribute_02=>'60'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110292668719018374)
,p_name=>'P196_NMRO_DIAS_VNCMNTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(110286872430018344)
,p_use_cache_before_default=>'NO'
,p_source=>'NMRO_DIAS_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Indica el n\00FAmero de d\00EDas transcurridos luego de vencida la cuota.<br>'),
unistr('Si el tipo de Revocatoria seleccionado es <b><i>Oficio de Incimplimiento</i></b>, indica el n\00FAmero de d\00EDas transcurridos luego de vencida la cuota que se debe tener en cuenta para emitir el oficio de incumplimiento. <br> <br>'),
unistr('Si el tipo de Revocatoria seleccionado es <b><i>Cuotas Vencidas</i></b>, indica el n\00FAmero de d\00EDas transcurridos luego de vencida la cuota que se debe tener en cuenta para ser candidato de revocatoria.')))
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110293039020018375)
,p_name=>'P196_NMRO_OFCIOS_EMTDO_RVOCAR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(110286872430018344)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00B0 Oficios Emitidos Candidato Revocatoria')
,p_source=>'NMRO_OFCIOS_EMTDO_RVOCAR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica el n\00FAmero m\00EDnimo de oficios de incumplimientos que se debe tener en cuenta para ser candidato de revocatoria')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110293499889018375)
,p_name=>'P196_INDCDOR_MSMA_CTA_OFCIO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(110286872430018344)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFOficios requieren de una misma cuota?')
,p_source=>'INDCDOR_MSMA_CTA_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indicador que determina si se debe evaluar que los oficios generados cumplan con la misma cuota para ser considerado candidato de revocatoria.'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110293811179018376)
,p_name=>'P196_ID_ACTO_TPO_RVCTRIA'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(110286872430018344)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de Acto Revocatoria'
,p_source=>'ID_ACTO_TPO_RVCTRIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_TIPOS_ACTO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION as d,',
'       id_acto_tpo  as r',
'      from GN_D_ACTOS_TIPO',
'      where cdgo_clnte = :F_CDGO_CLNTE',
'      order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccionar el tipo de acto para generar el la resoluci\00F3n de revocatoria.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110294287414018376)
,p_name=>'P196_ACTVO'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(110286872430018344)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si el m\00E9todo est\00E1 activo o no, para ser asociado a un tipo de acuerdo de pago.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112607194008052801)
,p_name=>'P196_INDCDOR_APLCA_RVCTRIA_INMDTA'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(110286872430018344)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFAplica Revocatoria Inmediata?')
,p_source=>'INDCDOR_APLCA_RVCTRIA_INMDTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Determina la aplicaci\00F3n directa de la revocatoria o la espera de esta ser notificada.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112607203145052802)
,p_name=>'P196_INDCDOR_VLDA_PGO_CTA'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(110286872430018344)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFValida Pago de Cuotas?')
,p_source=>'INDCDOR_VLDA_PGO_CTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Indicador que determina si se debe validar el pago de las cuotas (que originaron la revocatoria) despu\00E9s de ser notificada la resoluci\00F3n de revocatoria y antes de aplicarla. '),
'',
unistr('Si el indicador es s\00ED y no se encuentra pagada ninguna cuota, la revocatoria deber\00E1 ser <b>Aplicada</b>, de lo contrario deber\00E1 ser <b>Anulada</b>.')))
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(110275507284974921)
,p_validation_name=>'Validar el tipo de acto de oficio de incumplimiento cuando el tipo de revocatoria sea OFC'
,p_validation_sequence=>10
,p_validation=>'P196_ID_ACTO_TPO_INCMPLMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un tipo de Acto para el Oficio de Incumplimiento'
,p_validation_condition=>'P196_CDGO_RVCTRIA_TPO'
,p_validation_condition2=>'OFC'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(110291845742018373)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(110276014614974926)
,p_validation_name=>unistr('N\00B0 de oficios para ser candidatos no nulo')
,p_validation_sequence=>20
,p_validation=>'P196_NMRO_OFCIOS_EMTDO_RVOCAR'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Debe ingresar el n\00FAmero de Oficios de Incumplimiento requeridos para ser candidatos de revocatoria')
,p_validation_condition=>'P196_CDGO_RVCTRIA_TPO'
,p_validation_condition2=>'OFC'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(110293039020018375)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(110276139862974927)
,p_validation_name=>'Indicador Misma Cuota no nula '
,p_validation_sequence=>30
,p_validation=>'P196_INDCDOR_MSMA_CTA_OFCIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar Si/No para indicar si se requiere que en los oficios emitidos este una misma cuota repetida'
,p_validation_condition=>'P196_CDGO_RVCTRIA_TPO'
,p_validation_condition2=>'OFC'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(110293499889018375)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(110288052217018346)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(110287946461018346)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(110288846198018348)
,p_event_id=>wwv_flow_api.id(110288052217018346)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(110274929840974915)
,p_name=>'Mostrar Tipo de Acto de Incumplimiento cuando seleccione Oficio de incumplimiento'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P196_CDGO_RVCTRIA_TPO'
,p_condition_element=>'P196_CDGO_RVCTRIA_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'OFC'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(110275020735974916)
,p_event_id=>wwv_flow_api.id(110274929840974915)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P196_ID_ACTO_TPO_INCMPLMNTO,P196_NMRO_OFCIOS_EMTDO_RVOCAR,P196_INDCDOR_MSMA_CTA_OFCIO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(110275340899974919)
,p_event_id=>wwv_flow_api.id(110274929840974915)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P196_ID_ACTO_TPO_INCMPLMNTO,P196_NMRO_OFCIOS_EMTDO_RVOCAR,P196_INDCDOR_MSMA_CTA_OFCIO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(112607396470052803)
,p_name=>'Mostrar indicar de valida pago de cuota si el indicador de revocatoria inmediata es si'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P196_INDCDOR_APLCA_RVCTRIA_INMDTA'
,p_condition_element=>'P196_INDCDOR_APLCA_RVCTRIA_INMDTA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(112607492160052804)
,p_event_id=>wwv_flow_api.id(112607396470052803)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P196_INDCDOR_VLDA_PGO_CTA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(112607507248052805)
,p_event_id=>wwv_flow_api.id(112607396470052803)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P196_INDCDOR_VLDA_PGO_CTA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(110295005787018378)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from GF_D_REVOCATORIA_METODO'
,p_attribute_02=>'GF_D_REVOCATORIA_METODO'
,p_attribute_03=>'P196_ID_RVCTRIA_MTDO'
,p_attribute_04=>'ID_RVCTRIA_MTDO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(110295428944018378)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of GF_D_REVOCATORIA_METODO'
,p_attribute_02=>'GF_D_REVOCATORIA_METODO'
,p_attribute_03=>'P196_ID_RVCTRIA_MTDO'
,p_attribute_04=>'ID_RVCTRIA_MTDO'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Se han guardado los cambios.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(110295874178018378)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(110287417568018346)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(110296273935018378)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(110287946461018346)
);
end;
/
