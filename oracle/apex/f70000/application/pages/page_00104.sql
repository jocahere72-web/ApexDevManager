prompt --application/pages/page_00104
begin
wwv_flow_api.create_page(
 p_id=>104
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Tipo de Impresi\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Generaci\00F3n de Actos / Documentos del Lote de Determinaci\00F3n No. &P63_ID_DTRMNCION_LTE. - Documentos de Pago >> Tipo de Impresi\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20191119174446'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35520239721233409)
,p_plug_name=>'Wirzard - Documentos'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(164085715180707699)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(35444422273960683)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(164098974360707738)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35523220929233439)
,p_plug_name=>unistr('Tipo de Impresi\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(35520239721233409)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(35523550700233442)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(35523220929233439)
,p_button_name=>'BTN_GENERAR_ARCHIVO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Archivo Plano'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-file-code-o'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(35523769755233444)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(35523220929233439)
,p_button_name=>'BTN_IMPRIMIR_ESPECIFICACION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Imprimir Especificaci\00F3n')
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-file-arrow-down'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(35623583870874402)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(35523220929233439)
,p_button_name=>'BTN_IMPRIMIR_LIQUIDACION_FACTURA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Imprimir Liquidaci\00F3n Factura')
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-file-arrow-down'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(35623653932874403)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(35523220929233439)
,p_button_name=>'BTN_IMPRIMIR_RANGOS_LIQUIDACION_FACTURA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Imprimir Rangos Liquidaci\00F3n Factura')
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-files-o'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(35623794982874404)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(35523220929233439)
,p_button_name=>'BTN_GENERAR_ZIP'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Generar Zip'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-file-archive-o'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(35520445992233411)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(35520239721233409)
,p_button_name=>'BTN_ANTERIOR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103612327707757)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:103:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(35520688200233413)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(35520239721233409)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-calendar-ban'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(35524347799233450)
,p_branch_name=>unistr('Imprimir Archivo de Especificaci\00F3n')
,p_branch_action=>'f?p=&APP_ID.:104:&SESSION.:PRINT_REPORT=gf_dt_especificaci%C3%B3n_archivo_1:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(35523769755233444)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(35623401341874401)
,p_branch_name=>unistr('Generar el Archivo Plano - P\00E1g 64')
,p_branch_action=>'f?p=&APP_ID.:64:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(35523550700233442)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(35694650234452201)
,p_branch_name=>'Imprimir Reporte Liquidacion Factura'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_XML:&P104_ID_RPRTE.,<P_ID_DTRMNCION_LTE>&P63_ID_DTRMNCION_LTE.</P_ID_DTRMNCION_LTE>&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(35623583870874402)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(35695310786452208)
,p_branch_name=>'Imprimir Liquidacion Factura Zip'
,p_branch_action=>'f?p=66000:2:&SESSION.:masivoZip:&DEBUG.:RP:P2_ID_RPRTE_PRMTRO,P2_ID_RPRTE,P2_NMBRE_ZIP:&P104_ID_RPRTE_PRMTRO.,&P104_ID_RPRTE.,Lote Determinacion &P63_ID_DTRMNCION_LTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(35623794982874404)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(37897928576435101)
,p_branch_name=>'Imprimir Rango Documentos'
,p_branch_action=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:RP,29:P29_ID_DTRMNCION_LTE:&P63_ID_DTRMNCION_LTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(35623653932874403)
,p_branch_sequence=>50
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(35520812213233415)
,p_branch_name=>'Anterior - Documentos'
,p_branch_action=>'f?p=&APP_ID.:103:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(35520445992233411)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(37414914226005924)
,p_branch_name=>'Anterior - Actos'
,p_branch_action=>'f?p=&APP_ID.:106:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(35520445992233411)
,p_branch_sequence=>20
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P104_GNRCION_TPO'
,p_branch_condition_text=>'ACT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35523303886233440)
,p_name=>'P104_IMPRSION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(35523220929233439)
,p_item_default=>'PDF'
,p_prompt=>unistr('Tipo de Impresi\00F3n')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Archivo Plano;ACH,PDF;PDF'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35623871607874405)
,p_name=>'P104_ID_RPRTE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(35523220929233439)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_rprte d ,',
'        id_rprte r',
'   from gn_d_reportes',
'  where cdgo_rprte_grpo = ''GGI''',
'    and id_rprte = 291',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione una Plantilla -- '
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35694722068452202)
,p_name=>'P104_RSPSTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(35520239721233409)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35695271628452207)
,p_name=>'P104_ID_RPRTE_PRMTRO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(35520239721233409)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37414019646005915)
,p_name=>'P104_GNRCION_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(35520239721233409)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(35624886766874415)
,p_validation_name=>'Plantilla no nula cuando es por PDF'
,p_validation_sequence=>10
,p_validation=>'P104_ID_RPRTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar una plantilla para poder continurar'
,p_validation_condition=>'P104_IMPRSION_TPO'
,p_validation_condition2=>'PDF'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(35623871607874405)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(35520939029233416)
,p_name=>'Cerrar Modal'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(35520688200233413)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35521024752233417)
,p_event_id=>wwv_flow_api.id(35520939029233416)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(35523830998233445)
,p_name=>unistr('Mostrar Items y Botones de tipo de impresi\00F3n por archivo plano y ocultar los de tipo de impresi\00F3n por pdf')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P104_IMPRSION_TPO'
,p_condition_element=>'P104_IMPRSION_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'ACH'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35523970167233446)
,p_event_id=>wwv_flow_api.id(35523830998233445)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(35523550700233442)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35524281107233449)
,p_event_id=>wwv_flow_api.id(35523830998233445)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(35523769755233444)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35524029970233447)
,p_event_id=>wwv_flow_api.id(35523830998233445)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(35523769755233444)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35524155053233448)
,p_event_id=>wwv_flow_api.id(35523830998233445)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(35523550700233442)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(35623947057874406)
,p_name=>unistr('Mostrar Items y Botones de tipo de impresi\00F3n por pdf y ocultar los de tipo de impresi\00F3n por archivo plano')
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P104_IMPRSION_TPO'
,p_condition_element=>'P104_IMPRSION_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'PDF'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35624098386874407)
,p_event_id=>wwv_flow_api.id(35623947057874406)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(35623583870874402)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35624717282874414)
,p_event_id=>wwv_flow_api.id(35623947057874406)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P104_ID_RPRTE'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35624222044874409)
,p_event_id=>wwv_flow_api.id(35623947057874406)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(35623653932874403)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35624529300874412)
,p_event_id=>wwv_flow_api.id(35623947057874406)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(35623794982874404)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35624386400874410)
,p_event_id=>wwv_flow_api.id(35623947057874406)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(35623653932874403)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35624416219874411)
,p_event_id=>wwv_flow_api.id(35623947057874406)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(35623794982874404)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35624156444874408)
,p_event_id=>wwv_flow_api.id(35623947057874406)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(35623583870874402)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35624604864874413)
,p_event_id=>wwv_flow_api.id(35623947057874406)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P104_ID_RPRTE'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(35695127396452206)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar XML - Generar ZIP'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_dta            clob;',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar2(100);',
'begin',
'    v_mnsje_rspsta := ''Tipo de Lote Determinaciones - Multiples Fechas -- Entrando a Generar el XML'';',
'    pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_re_documentos.prc_rg_lote_documentos'',  6, v_mnsje_rspsta, 6); 	',
'    ',
'    :P104_ID_RPRTE_PRMTRO  := pkg_gn_generalidades.fnc_ge_id_rprte_prmtro();',
'    ',
'    v_mnsje_rspsta := ''P104_ID_RPRTE_PRMTRO: '' || :P104_ID_RPRTE_PRMTRO;',
'    pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_re_documentos.prc_rg_lote_documentos'',  6, v_mnsje_rspsta, 6); ',
'        ',
'    for c_determinacion in ( select distinct ',
'                                    a.id_dtrmncion,',
'                                    c.nmro_dcmnto ',
'                               from gi_g_determinaciones           a',
'                               join gi_g_determinaciones_dcmnto    b on a.id_dtrmncion = b.id_dtrmncion',
'                               join re_g_documentos                c on b.id_dcmnto = c.id_dcmnto',
'                              where a.id_dtrmncion_lte = :P63_ID_DTRMNCION_LTE) loop',
'    ',
'        v_dta  := ''<P_ID_DTRMNCION_LTE>'' || :P63_ID_DTRMNCION_LTE        || ''</P_ID_DTRMNCION_LTE>''|| ',
'                  ''<P_ID_DTRMNCION>''     || c_determinacion.id_dtrmncion || ''</P_ID_DTRMNCION>''    || ',
'                  ''<nmbre_rprte> ''         || c_determinacion.nmro_dcmnto  || ''</nmbre_rprte>'';',
'             ',
'        pkg_gn_generalidades.prc_rg_t_reportes_parametro( :P104_ID_RPRTE_PRMTRO, v_dta, v_cdgo_rspsta, v_mnsje_rspsta );',
'                                                      ',
'    end loop;',
'    ',
'    v_mnsje_rspsta := ''v_cdgo_rspsta: '' || v_cdgo_rspsta || '' v_mnsje_rspsta: '' || v_mnsje_rspsta;',
'    pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_re_documentos.prc_rg_lote_documentos'',  6, v_mnsje_rspsta, 6); ',
'    ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(35623794982874404)
);
end;
/
