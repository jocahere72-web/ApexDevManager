prompt --application/pages/page_00907
begin
wwv_flow_api.create_page(
 p_id=>907
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Constructor de Consultas'
,p_step_title=>'Constructor de Consultas'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/jqGrid/js/jquery.jqGrid.min.js',
'#IMAGE_PREFIX#javascript/infortributos/jqGrid/src/grid.jqueryui.js',
'#IMAGE_PREFIX#/javascript/infortributos/js/accounting.min.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Constructor/consultaFinal.js?v=1.10.1'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/jqGrid/src/css/ui.jqgrid.css',
'#IMAGE_PREFIX#javascript/infortributos/jqGrid/src/css/ui.jqgrid-bootstrap4.css',
'#IMAGE_PREFIX#javascript/infortributos/jqGrid/src/css/ui.jqgrid-bootstrap-ui.css'))
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'MCARO'
,p_last_upd_yyyymmddhh24miss=>'20191106113204'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(135488846102955814)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(135555761529734814)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i>',
'    </b>',
'</h5>',
'',
unistr('<i>Esta funcionalidad permite la gesti\00F3n de consultas <b>SQL</b> din\00E1micas.</i>'),
'<ol>',
'    <li>',
unistr('        <i>Debe guardar los cambios para poder visualizar los \00FAltimos datos cuando presione el bot\00F3n <b>Ejecutar SQL</b></i>'),
'    </li>',
'</ol>',
'<br>',
unistr('<i>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(256207130788508947)
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
 p_id=>wwv_flow_api.id(98574312008572706)
,p_plug_name=>'Consulta'
,p_parent_plug_id=>wwv_flow_api.id(256207130788508947)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(271100445455365636)
,p_plug_name=>unistr('Condiciones y Selecci\00F3n de datos')
,p_region_name=>'jqGrid_container'
,p_parent_plug_id=>wwv_flow_api.id(256207130788508947)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div style="display: flex;justify-content: center;"><table id="gridColumns"></table></div>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(271485883903786217)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_parent_plug_id=>wwv_flow_api.id(256207130788508947)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(86848497309145838)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(135488846102955814)
,p_button_name=>'Regresar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(86850082032145839)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(135488846102955814)
,p_button_name=>'BTN_APLCAR'
,p_button_static_id=>'BTN_APLCAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(86844818755145835)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(135488846102955814)
,p_button_name=>'BTN_NVA_CNSLTA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Nueva consulta'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:908:&SESSION.::&DEBUG.:RP,908:P908_COD_PROCESO:&P907_COD_PROCESO.'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(86849215587145838)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(135488846102955814)
,p_button_name=>'BTN_EJCTAR'
,p_button_static_id=>'BTN_EJCTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Ejecutar Consulta'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-play'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(98573810452572701)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(135488846102955814)
,p_button_name=>'BTN_ELMNAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(86861571195145858)
,p_branch_name=>'regresar'
,p_branch_action=>' DECLARE'||wwv_flow.LF||
'    v_url varchar2(2000); '||wwv_flow.LF||
'    v_app_page_id number:= :P907_PAGE_ID;'||wwv_flow.LF||
'    v_item_id varchar2(100) := :P907_ITEM_ID;'||wwv_flow.LF||
'    v_app_id number:= :P907_APP_ID;'||wwv_flow.LF||
'    v_session number := v(''APP_SESSION'');'||wwv_flow.LF||
'    v_id_consulta number := :P907_ID_CONSULTA;'||wwv_flow.LF||
'    '||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'    --APEX_UTIL.set_session_state(  p_name  => l_item_id      , p_value => l_valor_query);'||wwv_flow.LF||
''||wwv_flow.LF||
'    v_url := apex_util.prepare_url(               '||wwv_flow.LF||
'        p_url => ''f?p=''|| v_app_id || '':'' || v_app_page_id  || '':''|| v_session || ''::NO:RP:''||case when :P907_ITEM_DEV is not null then :P907_ITEM_DEV ||'','' end || v_item_id || '':'' || case when :P907_ITEM_DEV is not null then :P907_VALOR_DEV ||'','' end || v_id_consulta,'||wwv_flow.LF||
'        p_checksum_type => ''SESSION'');'||wwv_flow.LF||
'        return v_url;'||wwv_flow.LF||
'END;'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_FUNCTION_RETURNING_URL'
,p_branch_when_button_id=>wwv_flow_api.id(86848497309145838)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(86861154314145858)
,p_branch_name=>'Go To Page 905'
,p_branch_action=>'f?p=&APP_ID.:905:&SESSION.::&DEBUG.:RP,905:P905_CNSLTA:&P907_ID_CONSULTA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(86849215587145838)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(87085075101092201)
,p_branch_name=>'Go To Page 908'
,p_branch_action=>'f?p=&APP_ID.:908:&SESSION.::&DEBUG.:RP,908:P908_COD_PROCESO:&P907_COD_PROCESO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(86844818755145835)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8321663576375308)
,p_name=>'P907_VALOR_DEV'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(271485883903786217)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8321793813375309)
,p_name=>'P907_ITEM_DEV'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(271485883903786217)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86845633197145835)
,p_name=>'P907_ID_CONSULTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(271485883903786217)
,p_prompt=>'Consulta'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_cnslta,',
'       id_cnslta_mstro ',
'  from cs_g_consultas_maestro m',
'  join cs_d_procesos_sql p',
'    on p.id_prcso_sql = m.id_prcso_sql',
' where p.cdgo_clnte = :F_CDGO_CLNTE ',
'   and p.cdgo_prcso_sql = :P907_COD_PROCESO',
'   and tpo_cndcion is null',
'   and id_cnslta_mstro_gnral is not null'))
,p_lov_display_null=>'YES'
,p_colspan=>6
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Muestra todas las consultas realizadas para el proceso seleccionado.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'500'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86846559161145837)
,p_name=>'P907_PAGE_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(271485883903786217)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86846970001145837)
,p_name=>'P907_APP_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(271485883903786217)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86847339226145837)
,p_name=>'P907_ITEM_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(271485883903786217)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87685974785408001)
,p_name=>'P907_COD_PROCESO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(271485883903786217)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88790548297098605)
,p_name=>'P907_JSON'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(271485883903786217)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98574459838572707)
,p_name=>'P907_NMBRE_CNSLTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(98574312008572706)
,p_prompt=>'Nombre Consulta'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>99
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(86853788746145853)
,p_name=>'al_hacer_click_boton_consultar'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(184258645604219817)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(86854279560145854)
,p_event_id=>wwv_flow_api.id(86853788746145853)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'recargarDatos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(86854634461145855)
,p_name=>'al_cargar_la_pagina'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(86855198090145855)
,p_event_id=>wwv_flow_api.id(86854634461145855)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'cargar();',
'cargarDatos();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(86859717170145857)
,p_name=>'al_hacer_click_boton_aplicar'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(86850082032145839)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(86860233628145857)
,p_event_id=>wwv_flow_api.id(86859717170145857)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'guardar();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(86856410267145855)
,p_name=>'al_cambiar_la_consulta'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P907_ID_CONSULTA'
,p_condition_element=>'P907_ID_CONSULTA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_BE.CTB.SELECT2|ITEM TYPE|slctchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(87616769707562801)
,p_event_id=>wwv_flow_api.id(86856410267145855)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'cargarDatos();',
'$s(''P907_NMBRE_CNSLTA'', $(''#P907_ID_CONSULTA option[value="'' + $v(''P907_ID_CONSULTA'') + ''"]'').text()); '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(88790370300098603)
,p_event_id=>wwv_flow_api.id(86856410267145855)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(86850082032145839)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(88790445332098604)
,p_event_id=>wwv_flow_api.id(86856410267145855)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(86849215587145838)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(98574117309572704)
,p_event_id=>wwv_flow_api.id(86856410267145855)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(98573810452572701)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(86858815054145856)
,p_name=>'al_cerrar_ventana_modal'
,p_event_sequence=>80
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(86859391165145857)
,p_event_id=>wwv_flow_api.id(86858815054145856)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var datalocal = window.localStorage;',
'var active = $(this.affectedElements[0].activeElement).attr(''id'');',
'',
'if (datalocal.length > 0 ){',
'    console.log(datalocal); ',
'    var data = $(''#gridColumns'').getRowData(datalocal.id);',
'    data.valor1 = datalocal.vl;',
'    $("#gridColumns").jqGrid(''setRowData'', datalocal.id, data)',
'    loadGrid(); ',
'    window.localStorage.clear();',
'} else if (active !== ''BTN_EJCTAR'') {',
'    cargarDatosGenericos().then(function (resp) {            ',
'            window.d = resp.operadores;',
'            window.$subcon = resp.subconsultas;',
'            $("#gridColumns").trigger("reloadGrid");',
'    });',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(88779837196058901)
,p_name=>'al no seleccionar la consulta'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P907_ID_CONSULTA'
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_BE.CTB.SELECT2|ITEM TYPE|slctunselect'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(88779942015058902)
,p_event_id=>wwv_flow_api.id(88779837196058901)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#gridColumns").clearGridData();',
'$s(''P907_NMBRE_CNSLTA'', '''');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(88790192983098601)
,p_event_id=>wwv_flow_api.id(88779837196058901)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(86850082032145839)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(88790231203098602)
,p_event_id=>wwv_flow_api.id(88779837196058901)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(86849215587145838)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(98574247986572705)
,p_event_id=>wwv_flow_api.id(88779837196058901)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(98573810452572701)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(98574555871572708)
,p_name=>'al cerrar la ventana modal'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(86844818755145835)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(98574683233572709)
,p_event_id=>wwv_flow_api.id(98574555871572708)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(115974676946324101)
,p_name=>'ejecutar consulta SQL'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(86849215587145838)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(115974785221324102)
,p_event_id=>wwv_flow_api.id(115974676946324101)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (window.localStorage.changes) {',
'    apex.message.alert( "Los cambios no fueron aplicados, la consulta que se realizara es la ultima guardada.", function(){',
'        apex.submit({request: "BTN_EJCTAR"});',
'    }); ',
'}else {',
'   apex.submit({request: "BTN_EJCTAR"}); ',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(116256907870594701)
,p_name=>unistr('al hacer clic en el bot\00F3n eliminar')
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(98573810452572701)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(116257056349594702)
,p_event_id=>wwv_flow_api.id(116256907870594701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm(''\00BFEst\00E1 seguro que desea eliminar la consulta?'', (e) => {'),
'    if (e) {',
'        apex.submit({request: ''BTN_ELMNAR''});',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(35228565240386403)
,p_name=>'New'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P907_NMBRE_CNSLTA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35228630179386404)
,p_event_id=>wwv_flow_api.id(35228565240386403)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>' window.localStorage.setItem(''changes'', true);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98574026808572703)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar consulta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    pkg_cs_constructorsql.prc_el_consulta(p_id_cnslta_mstro => :P907_ID_CONSULTA); ',
'    :P907_ID_CONSULTA := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(98573810452572701)
,p_process_success_message=>'Consulta eliminda de forma exitosa!!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(86851188569145850)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'loadData'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'pkg_cs_constructorsql.prc_co_consulta_usuario_final( p_id_cnslta_mstro    => :P907_ID_CONSULTA',
'                                                   , p_cdgo_clnte         => :F_CDGO_CLNTE  );',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_is_stateful_y_n=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(86851574827145851)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'saveData'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json    clob;',
'begin',
'    for i in 1..apex_application.g_f01.count',
'    loop',
'        v_json := v_json || apex_application.g_f01(i);',
'    end loop;',
'    pkg_cs_constructorsql.prc_cd_consulta_usuario_final( p_id_cnslta_mstro => :P907_ID_CONSULTA',
'                                                       , p_nmbre_cnslta    => :P907_NMBRE_CNSLTA',
'                                                       , p_json            => v_json );',
'end;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(86851923710145851)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CargarDatosConsulta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_cs_constructorsql.prc_co_consulta_general( p_id_cnslta_mstro    => apex_application.g_f01(1)',
'                        , p_cdgo_clnte         => :F_CDGO_CLNTE);',
'                        '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(86850755983145850)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargarDatosGenericos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    c_operadores        sys_refcursor;',
'begin',
'    ',
'    begin',
'        open c_operadores for ''select id_oprdor_tpo "value",dscrpcion "text", oprdor "operador" from df_s_operadores_tipo'';',
'        apex_json.open_object();',
'        apex_json.write(''operadores'', c_operadores);',
'',
'    exception ',
'        when others then ',
'            apex_json.open_object();',
'            apex_json.write(''ERROR'',true);',
'            apex_json.write(''MSG'',apex_escape.html(sqlerrm));',
'    end;',
'',
'    apex_json.close_all();',
'end;',
'    '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(116257339620594705)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'comboDependiente'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json clob;',
'begin',
'    for i in 1..apex_application.g_f01.count ',
'    loop',
'        v_json := apex_application.g_f01(i);',
'    end loop;',
'',
'    pkg_cs_constructorsql.prc_co_combo_dependiente(p_json => v_json, p_vlor => apex_application.g_x01, p_cdgo_clnte => :F_CDGO_CLNTE);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
