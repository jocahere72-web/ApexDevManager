prompt --application/pages/page_00903
begin
wwv_flow_api.create_page(
 p_id=>903
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Sub Consulta'
,p_page_mode=>'MODAL'
,p_step_title=>'Sub Consulta'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/jqGrid/js/jquery.jqGrid.min.js',
'#IMAGE_PREFIX#javascript/infortributos/jqGrid/src/grid.jqueryui.js',
'#IMAGE_PREFIX#/javascript/infortributos/js/accounting.min.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Constructor/subConsultaSql.js?v=1.10.2'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/jqGrid/src/css/ui.jqgrid.css',
'#IMAGE_PREFIX#javascript/infortributos/jqGrid/src/css/ui.jqgrid-bootstrap4.css',
'#IMAGE_PREFIX#javascript/infortributos/jqGrid/src/css/ui.jqgrid-bootstrap-ui.css'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P903_TPO_CNDCION {',
'    width: 150px;',
'}'))
,p_step_template=>wwv_flow_api.id(29518229835068493)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_last_updated_by=>'MCARO'
,p_last_upd_yyyymmddhh24miss=>'20191106083925'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(209159313934910938)
,p_plug_name=>'Constructor'
,p_region_name=>'region_sql'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(224052628601767627)
,p_plug_name=>unistr('Condiciones y Selecci\00F3n de datos')
,p_region_name=>'jqGrid_container'
,p_parent_plug_id=>wwv_flow_api.id(209159313934910938)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div style="display: flex;justify-content: center;"><table id="gridColumns"></table></div>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P903_ACCION'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(224437912236188207)
,p_plug_name=>'Contenido de Consulta'
,p_parent_plug_id=>wwv_flow_api.id(209159313934910938)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P903_ACCION'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(224438067050188208)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_parent_plug_id=>wwv_flow_api.id(209159313934910938)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39795968376547813)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(224437912236188207)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="top:30px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39798235341547815)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(224438067050188208)
,p_button_name=>'BTN_NVA_CNSLTA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva consulta'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:903:&SESSION.::&DEBUG.:RP,903:P903_ID_CONSULTA,P903_ACCION,P903_COD_PROCESO,P903_SBCNSLTA:,SAVE,&P903_COD_PROCESO.,&P903_SBCNSLTA.'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_column_attributes=>'style="top: 10px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(38413318519757531)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(209159313934910938)
,p_button_name=>'BTN_APLCAR_CMBIOS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P903_ACCION is not null and :P903_ID_CONSULTA is not null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39794155718547810)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(209159313934910938)
,p_button_name=>'BTN_CNCLAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P903_ACCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39794502604547810)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(209159313934910938)
,p_button_name=>'BTN_GRDAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P903_ACCION is not null and :P903_ID_CONSULTA is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(38414674083757544)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(209159313934910938)
,p_button_name=>'BTN_ELMNAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_HELP'
,p_button_condition=>'P903_ID_CONSULTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(48635806228780604)
,p_branch_name=>'Go To Page 903'
,p_branch_action=>'f?p=&APP_ID.:903:&SESSION.::&DEBUG.:RP,903:P903_ID_CONSULTA,P903_ACCION:,SAVE&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(39798235341547815)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38413684185757534)
,p_name=>'P903_SBCNSLTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(224438067050188208)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38413702513757535)
,p_name=>'P903_TPO_CNDCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(224437912236188207)
,p_prompt=>unistr('Agregar Condici\00F3n de')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Exclusi\00F3n;E,Inclusi\00F3n;I,Columna;C')
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39796359028547813)
,p_name=>'P903_CONSULTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(224437912236188207)
,p_prompt=>'Nombre Consulta'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39796799362547814)
,p_name=>'P903_ENTIDADES'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(224437912236188207)
,p_prompt=>'Entidades'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select alias_entdad,',
'       id_entdad ',
'  from cs_d_procesos_sql p',
'  join cs_d_entidades e',
'    on p.id_prcso_sql = e.id_prcso_sql',
' where p.cdgo_prcso_sql = :P903_COD_PROCESO',
'   and p.cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'MULTI'
,p_attribute_08=>'CIC'
,p_attribute_10=>'800'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39797123703547815)
,p_name=>'P903_COD_PROCESO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(224437912236188207)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39797565546547815)
,p_name=>'P903_PARAMETRO_ENTIDADES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(224437912236188207)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39798623218547816)
,p_name=>'P903_ACCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(224438067050188208)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39799087875547816)
,p_name=>'P903_ID_CONSULTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(224438067050188208)
,p_prompt=>'Consulta'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_cnslta,',
'       id_cnslta_mstro ',
'  from cs_g_consultas_maestro m',
'  join cs_d_procesos_sql p',
'    on p.id_prcso_sql = m.id_prcso_sql',
' where p.cdgo_prcso_sql = :P903_COD_PROCESO',
'   and tpo_cndcion is not null',
'   and cdgo_clnte = :F_CDGO_CLNTE',
'   and 1 = case when m.tpo_cndcion = ''C'' ',
'                then 1',
'                when m.id_sbcnslta_mstro = :P902_ID_CONSULTA ',
'                then 1 ',
'                else 0 ',
'           end '))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39802228515547820)
,p_name=>'al_cambiar_entidades'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P903_ENTIDADES'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39802743406547821)
,p_event_id=>wwv_flow_api.id(39802228515547820)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var entidades = $(''#P903_ENTIDADES'',''#region_sql'').val();',
'var parametro = $(''#P903_PARAMETRO_ENTIDADES'',''#region_sql''); ',
'if (entidades) {',
'    parametro.val((entidades.toString()));    ',
'} else {',
'    parametro.val('''');    ',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39803213444547821)
,p_event_id=>wwv_flow_api.id(39802228515547820)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_UTIL.SET_SESSION_STATE(''P903_PARAMETRO_ENTIDADES'',  :P903_PARAMETRO_ENTIDADES );',
''))
,p_attribute_02=>'P903_PARAMETRO_ENTIDADES'
,p_attribute_03=>'P903_PARAMETRO_ENTIDADES'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39803619078547821)
,p_name=>'al_hacer_click_boton_consultar'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(39795968376547813)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39804114830547822)
,p_event_id=>wwv_flow_api.id(39803619078547821)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'recargarDatos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39804555507547822)
,p_name=>'al_cargar_la_pagina'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39805093530547822)
,p_event_id=>wwv_flow_api.id(39804555507547822)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'cargar();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39805476790547822)
,p_name=>'al_hacer_click_boton_guardar'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(39794502604547810)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39805988559547822)
,p_event_id=>wwv_flow_api.id(39805476790547822)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'guardar();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(38413479936757532)
,p_name=>'al_hacer_click_boton_aplicar_cambios'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(38413318519757531)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(38413504926757533)
,p_event_id=>wwv_flow_api.id(38413479936757532)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'guardar();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39806319848547823)
,p_name=>'al_cambiar_la_consulta'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P903_ID_CONSULTA'
,p_condition_element=>'P903_ID_CONSULTA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39806819408547823)
,p_event_id=>wwv_flow_api.id(39806319848547823)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (:P903_ACCION = ''EDIT'' ) then',
'    :P903_ACCION := '''';',
'end if;'))
,p_attribute_02=>'P903_ACCION'
,p_attribute_03=>'P903_ACCION'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39807390489547823)
,p_event_id=>wwv_flow_api.id(39806319848547823)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P903_ACCION := ''EDIT'';'
,p_attribute_02=>'P903_ACCION'
,p_attribute_03=>'P903_ACCION'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39807872848547823)
,p_event_id=>wwv_flow_api.id(39806319848547823)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'P903_ID_CONSULTA'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39808313853547823)
,p_event_id=>wwv_flow_api.id(39806319848547823)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'P903_ID_CONSULTA'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39810676067547824)
,p_name=>'al_cerrar_ventana_modal'
,p_event_sequence=>80
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(209159313934910938)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39811136795547825)
,p_event_id=>wwv_flow_api.id(39810676067547824)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_attribute_01=>'P903_ACCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(38413944607757537)
,p_name=>unistr('al hacer clic en el bot\00F3n cancelar')
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(39794155718547810)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(38414027097757538)
,p_event_id=>wwv_flow_api.id(38413944607757537)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40759244870941101)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar la sub consulta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_count number;',
'    v_mnsje varchar2(4000);',
'begin',
'    ',
'    select count(1)',
'      into v_count',
'      from cs_g_consultas_maestro',
'     where id_sbcnslta_mstro = :P903_ID_CONSULTA;',
'   ',
'    if v_count > 0 then',
'        v_mnsje := ''No se Puede Eliminar la SubConsulta. Existen Dependencias de esta SubConsulta'';',
'        apex_error.add_error (  p_message          => v_mnsje,',
'                                p_display_location => apex_error.c_inline_in_notification );',
'        raise_application_error( -20001 , v_mnsje );',
'    end if;',
'    ',
'    select count(1)',
'      into v_count ',
'      from cs_g_consultas_detalle',
'     where vlor1 = :P903_ID_CONSULTA ',
'       and tpo_dto = ''S'';',
'    ',
'    if v_count > 0 then',
'        v_mnsje := ''No se Puede Eliminar la SubConsulta. Existen Dependencias de esta SubConsulta'';',
'        apex_error.add_error (  p_message          => v_mnsje,',
'                                p_display_location => apex_error.c_inline_in_notification );',
'        raise_application_error( -20001 , v_mnsje );',
'    end if;',
'    ',
'    begin',
'    ',
'        delete ',
'          from cs_g_consultas_detalle ',
'         where id_cnslta_mstro = :P903_ID_CONSULTA ;',
'         ',
'         delete ',
'          from cs_g_consultas_maestro ',
'         where id_cnslta_mstro = :P903_ID_CONSULTA ;',
'         ',
'    exception when others then',
'              v_mnsje := ''No se Puede Eliminar la SubConsulta.Ocurrio un Error al Tratar de Realizar el Proceso'';',
'              apex_error.add_error (  p_message          => v_mnsje,',
'                                      p_display_location => apex_error.c_inline_in_notification );',
'              raise_application_error( -20001 , v_mnsje );',
'    end;',
'    :P903_ID_CONSULTA := '''';',
'    :P903_ACCION      := '''';',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(38414674083757544)
,p_process_success_message=>'Proceso Realizado de forma Exitosa!!!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39801074924547819)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'loadData'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'v_accion varchar2(10);',
'v_id_prcso_sql number;',
'v_id_cnslta_mstro number;',
'v_id_cnslta_dtlle number;',
'',
'begin',
'    pkg_cs_constructorsql.prc_co_consulta_general( p_cdgo_prcso_sql    => null',
'                                                 , p_id_cnslta_mstro   => apex_application.g_f03(1)',
'                                                 , p_json              => apex_application.g_f01',
'                                                 );',
'end;',
'   '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_is_stateful_y_n=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39801486515547819)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'saveData'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_cs_constructorsql.prc_cd_subconsulta_general( p_json                => apex_application.g_f01',
'                                                , p_accion              => apex_application.g_f02(1)',
'                                                , p_cdgo_prcso_sql      => apex_application.g_f03(1)  ',
'                                                , p_nmbre_cnslta        => apex_application.g_f04(1)',
'                                                , p_id_cnslta_mstro     => apex_application.g_f05(1)',
'                                                , p_id_entdad_clmna     => apex_application.g_f06(1)',
'                                                , p_id_sbcnslta_mstro   => apex_application.g_f07(1)',
'                                                , p_tpo_cndcion         => apex_application.g_f08(1)',
'                                                , p_cdgo_clnte          => :F_CDGO_CLNTE );',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39801893749547820)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CargarDatosConsulta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_cs_constructorsql.prc_co_consulta_general( p_id_cnslta_mstro => apex_application.g_f01(1)',
'                                             , p_cdgo_clnte      => :F_CDGO_CLNTE );',
'',
'   '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(38413827943757536)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargarDatosMaestro'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_cs_constructorsql.prc_co_datos_maestro(p_id_cnslta_mstro => apex_application.g_f01(1));',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
