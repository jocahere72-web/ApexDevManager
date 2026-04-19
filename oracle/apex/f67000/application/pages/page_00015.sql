prompt --application/pages/page_00015
begin
wwv_flow_api.create_page(
 p_id=>15
,p_user_interface_id=>wwv_flow_api.id(71698179048188014)
,p_name=>'Plantilla'
,p_page_mode=>'MODAL'
,p_step_title=>'Plantilla'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'75%'
,p_dialog_chained=>'N'
,p_last_upd_yyyymmddhh24miss=>'20230911095352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8722750756834934)
,p_plug_name=>'Formulario'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71602665844187947)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8723647314834943)
,p_plug_name=>'Contenedor de Botones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71603687943187948)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8724024601834947)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(8723647314834943)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8723701384834944)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(8723647314834943)
,p_button_name=>'BTN_GUARDAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P15_ID_ENVIO_MDIO_CNFGRCION_PL'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8723861298834945)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(8723647314834943)
,p_button_name=>'BTN_CREAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P15_ID_ENVIO_MDIO_CNFGRCION_PL'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8723998578834946)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(8723647314834943)
,p_button_name=>'BTN_ELIMINAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(''Esta seguro de eliminar la plantilla?'',''BTN_ELIMINAR'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P15_ID_ENVIO_MDIO_CNFGRCION_PL'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9198400233752701)
,p_branch_name=>unistr('Ir a P\00E1gina 6')
,p_branch_action=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:RP,6:P6_ID_ENVIO_MDIO_CNFGRCION:&P15_ID_ENVIO_MDIO_CNFGRCION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'BTN_GUARDAR,BTN_CREAR,BTN_ELIMINAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8722884697834935)
,p_name=>'P15_ID_ENVIO_MDIO_CNFGRCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(8722750756834934)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_ENVIO_MDIO_CNFGRCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8723043609834937)
,p_name=>'P15_ID_ENVIO_MDIO_CNFGRCION_PL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(8722750756834934)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_ENVIO_MDIO_CNFGRCION_PL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8723157004834938)
,p_name=>'P15_DSCRPCION'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(8722750756834934)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8723210434834939)
,p_name=>'P15_TXTO_PLNTLLA'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(8722750756834934)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Plantilla'
,p_source=>'TXTO_PLNTLLA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_envio_mdio_cnfgrcion ',
'from ma_d_envios_medio_cnfgrcion a',
'where a.id_envio_mdio_cnfgrcion = :P15_ID_ENVIO_MDIO_CNFGRCION and',
'      a.actvo = ''S'' and',
'      a.crctres_prmtdos = ''LBA'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(71675717475187989)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8723368033834940)
,p_name=>'P15_TXTO_PLNTLLA_HTML'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(8722750756834934)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Plantilla'
,p_source=>'TXTO_PLNTLLA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_cSize=>30
,p_cHeight=>5
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_envio_mdio_cnfgrcion ',
'from ma_d_envios_medio_cnfgrcion a',
'where a.id_envio_mdio_cnfgrcion = :P15_ID_ENVIO_MDIO_CNFGRCION and',
'      a.actvo = ''S'' and',
'      a.crctres_prmtdos != ''LBA'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(71675717475187989)
,p_item_template_options=>'#DEFAULT#'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (opt) {',
'    opt.skin = ''office2013,skins/office2013/'';',
'    opt.height = 300;',
'    opt.resize_enabled = false;',
'    opt.removeButtons=''Underline,Strike,Subscript,Superscript,Anchor,Styles,Specialchar'';',
'    opt.enterMode = 2;	opt.removePlugins = ''contextmenu,liststyle,tabletools'';	return opt;',
'    ',
'}'))
,p_attribute_03=>'Y'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8723585438834942)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Recuperacion Automatica de Filas'
,p_attribute_02=>'MA_D_ENVIOS_MDIO_CNFGRCN_PL'
,p_attribute_03=>'P15_ID_ENVIO_MDIO_CNFGRCION_PL'
,p_attribute_04=>'ID_ENVIO_MDIO_CNFGRCION_PL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P15_ID_ENVIO_MDIO_CNFGRCION_PL'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9198557263752702)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Obtener Secuencia'
,p_process_sql_clob=>':P15_ID_ENVIO_MDIO_CNFGRCION_PL := SQ_MA_D_ENVIOS_MDIO_CNFGRCN_PL.NEXTVAL;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(8723861298834945)
,p_process_when=>'P15_ID_ENVIO_MDIO_CNFGRCION_PL'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8724195135834948)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Procesamiento Automatico DML'
,p_attribute_02=>'MA_D_ENVIOS_MDIO_CNFGRCN_PL'
,p_attribute_03=>'P15_ID_ENVIO_MDIO_CNFGRCION_PL'
,p_attribute_04=>'ID_ENVIO_MDIO_CNFGRCION_PL'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_GUARDAR,BTN_CREAR,BTN_ELIMINAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8724360669834950)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar Recuadro de Dialogo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(8724024601834947)
);
end;
/
