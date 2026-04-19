prompt --application/pages/page_00902
begin
wwv_flow_api.create_page(
 p_id=>902
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Constructor_SQL'
,p_step_title=>'Constructor de SQL'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/jqGrid/js/jquery.jqGrid.min.js',
'#IMAGE_PREFIX#javascript/infortributos/jqGrid/src/grid.jqueryui.js',
'#IMAGE_PREFIX#/javascript/infortributos/js/accounting.min.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Constructor/consultaSql.js?v=457111111'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/jqGrid/src/css/ui.jqgrid.css',
'#IMAGE_PREFIX#javascript/infortributos/jqGrid/src/css/ui.jqgrid-bootstrap4.css',
'#IMAGE_PREFIX#javascript/infortributos/jqGrid/src/css/ui.jqgrid-bootstrap-ui.css'))
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20191230110108'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(48647628351810001)
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
 p_id=>wwv_flow_api.id(48714543778589001)
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
unistr(' Funcionalidad permite la gesti\00F3n de consultas SQL din\00E1micas.<br><br>'),
unistr('<p><b><i>Nota:</i></b> Aseg\00FArese de guardar los cambios para poder visualizar los \00FAltimos datos cuando presione el bot\00F3n Ejecutar SQL.</p>'),
'<br>',
unistr('<i>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(169365913037363134)
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
 p_id=>wwv_flow_api.id(184259227704219823)
,p_plug_name=>unistr('Condiciones y Selecci\00F3n de datos')
,p_region_name=>'jqGrid_container'
,p_parent_plug_id=>wwv_flow_api.id(169365913037363134)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div style="display: flex;justify-content: center;"><table id="gridColumns"></table></div>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P902_ACCION'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(184644511338640403)
,p_plug_name=>'Contenido de Consulta'
,p_parent_plug_id=>wwv_flow_api.id(169365913037363134)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P902_ACCION'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(184644666152640404)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_parent_plug_id=>wwv_flow_api.id(169365913037363134)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(184676145115791539)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(48647628351810001)
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
 p_id=>wwv_flow_api.id(184674315158791521)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(48647628351810001)
,p_button_name=>'Nueva_Consulta'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva consulta'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:902:&SESSION.::&DEBUG.:RP,902:P902_ID_CONSULTA,P902_ACCION,P902_COD_PROCESO,P902_PAGE_ID,P902_APP_ID:,SAVE,&P902_COD_PROCESO.,&P902_PAGE_ID.,&P902_APP_ID.'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(184259770559219828)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(48647628351810001)
,p_button_name=>'Guardar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P902_ACCION is not null and :P902_ID_CONSULTA is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(38412874416757526)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(48647628351810001)
,p_button_name=>'BTN_APLCAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P902_ACCION is not null and :P902_ID_CONSULTA is not null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(38412481268757522)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(48647628351810001)
,p_button_name=>'BTN_AGRGAR_SBCNSLTA'
,p_button_static_id=>'BTN_AGRGAR_SBCNSLTA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Agregar Subconsulta'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:903:&SESSION.::&DEBUG.:RP,903:P903_COD_PROCESO,P903_SBCNSLTA:&P902_COD_PROCESO.,&P902_ID_CONSULTA.'
,p_button_condition=>'P902_ID_CONSULTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-database-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(48745236541661501)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(48647628351810001)
,p_button_name=>'BTN_EJCTAR'
,p_button_static_id=>'BTN_EJCTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Ejecutar SQL'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P902_ID_CONSULTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-play'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(98624241666014101)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(48647628351810001)
,p_button_name=>'BTN_ELMNAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P902_ID_CONSULTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(184258645604219817)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(184644511338640403)
,p_button_name=>'Boton_Consultar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="top:30px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(184676088508791538)
,p_branch_name=>'regresar'
,p_branch_action=>' DECLARE'||wwv_flow.LF||
'    v_url varchar2(2000); '||wwv_flow.LF||
'    v_app_page_id number:= :P902_PAGE_ID;'||wwv_flow.LF||
'    v_item_id varchar2(100) := :P902_ITEM_ID;'||wwv_flow.LF||
'    v_app_id number:= :P902_APP_ID;'||wwv_flow.LF||
'    v_session number := v(''APP_SESSION'');'||wwv_flow.LF||
'    v_id_consulta number := :P902_ID_SQL_QUERY;'||wwv_flow.LF||
'    '||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'    --APEX_UTIL.set_session_state(  p_name  => l_item_id      , p_value => l_valor_query);'||wwv_flow.LF||
''||wwv_flow.LF||
'    v_url := APEX_UTIL.PREPARE_URL(               '||wwv_flow.LF||
'        p_url => ''f?p=''|| v_app_id || '':'' || v_app_page_id  || '':''|| v_session || ''::NO:RP:''|| v_item_id || '':'' || v_id_consulta,'||wwv_flow.LF||
'        p_checksum_type => ''SESSION'');'||wwv_flow.LF||
'        return v_url;'||wwv_flow.LF||
'END;'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_FUNCTION_RETURNING_URL'
,p_branch_when_button_id=>wwv_flow_api.id(184676145115791539)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(48783983828964401)
,p_branch_name=>'Go To Page 905'
,p_branch_action=>'f?p=&APP_ID.:905:&SESSION.::&DEBUG.:RP,905:P905_CNSLTA:&P902_ID_CONSULTA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(48745236541661501)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(169366068357363135)
,p_name=>'P902_CONSULTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(184644511338640403)
,p_prompt=>'Nombre Consulta'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>98
,p_colspan=>4
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(169366123430363136)
,p_name=>'P902_ENTIDADES'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(184644511338640403)
,p_prompt=>'Entidades'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select alias_entdad,',
'       id_entdad ',
'  from cs_d_procesos_sql p',
'  join cs_d_entidades e',
'    on p.id_prcso_sql = e.id_prcso_sql',
' where p.cdgo_prcso_sql = :P902_COD_PROCESO',
'   and p.cdgo_clnte     = :F_CDGO_CLNTE  ;'))
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
 p_id=>wwv_flow_api.id(184132105529415244)
,p_name=>'P902_PARAMETRO_ENTIDADES'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(184644511338640403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184260283540219833)
,p_name=>'P902_COD_PROCESO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(184644511338640403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184644402590640402)
,p_name=>'P902_ACCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(184644666152640404)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184644775781640405)
,p_name=>'P902_ID_CONSULTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(184644666152640404)
,p_prompt=>'Consulta'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_cnslta,',
'       id_cnslta_mstro ',
'  from cs_g_consultas_maestro m',
'  join cs_d_procesos_sql p',
'    on p.id_prcso_sql = m.id_prcso_sql',
' where p.cdgo_clnte = :F_CDGO_CLNTE ',
'   and p.cdgo_prcso_sql = :P902_COD_PROCESO',
'   and m.tpo_cndcion is null',
'   and m.id_cnslta_mstro_gnral is null'))
,p_lov_display_null=>'YES'
,p_colspan=>6
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Muestra todas las consultas realizadas para el proceso seleccionado.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'500'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184676295300791540)
,p_name=>'P902_PAGE_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(184644666152640404)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184676375481791541)
,p_name=>'P902_APP_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(184644666152640404)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184676478503791542)
,p_name=>'P902_ITEM_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(184644666152640404)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184676542190791543)
,p_name=>'P902_ID_SQL_QUERY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(184644666152640404)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(184132203642415245)
,p_name=>'al_cambiar_entidades'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P902_ENTIDADES'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184132317363415246)
,p_event_id=>wwv_flow_api.id(184132203642415245)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var entidades = $(''#P902_ENTIDADES'',''#region_sql'').val();',
'var parametro = $(''#P902_PARAMETRO_ENTIDADES'',''#region_sql''); ',
'if (entidades) {',
'    parametro.val((entidades.toString()));    ',
'} else {',
'    parametro.val('''');    ',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184132768535415250)
,p_event_id=>wwv_flow_api.id(184132203642415245)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_UTIL.SET_SESSION_STATE(''P902_PARAMETRO_ENTIDADES'',  :P902_PARAMETRO_ENTIDADES );',
''))
,p_attribute_02=>'P902_PARAMETRO_ENTIDADES'
,p_attribute_03=>'P902_PARAMETRO_ENTIDADES'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(184258939661219820)
,p_name=>'al_hacer_click_boton_consultar'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(184258645604219817)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184259041183219821)
,p_event_id=>wwv_flow_api.id(184258939661219820)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'recargarDatos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(184259587697219826)
,p_name=>'al_cargar_la_pagina'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184259603915219827)
,p_event_id=>wwv_flow_api.id(184259587697219826)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'cargar();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(184259877039219829)
,p_name=>'al_hacer_click_boton_guardar'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(184259770559219828)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184259949378219830)
,p_event_id=>wwv_flow_api.id(184259877039219829)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'guardar();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(38412937683757527)
,p_name=>'al_hacer_click_boton_aplicar'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(38412874416757526)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(38413061876757528)
,p_event_id=>wwv_flow_api.id(38412937683757527)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'guardar();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(184672344085791501)
,p_name=>'al_cambiar_la_consulta'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P902_ID_CONSULTA'
,p_condition_element=>'P902_ID_CONSULTA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184674187914791519)
,p_event_id=>wwv_flow_api.id(184672344085791501)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (:P902_ACCION = ''EDIT'' ) then',
'    :P902_ACCION := '''';',
'end if;'))
,p_attribute_02=>'P902_ACCION'
,p_attribute_03=>'P902_ACCION'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184674004903791518)
,p_event_id=>wwv_flow_api.id(184672344085791501)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P902_ACCION := ''EDIT'';'
,p_attribute_02=>'P902_ACCION'
,p_attribute_03=>'P902_ACCION'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184673811619791516)
,p_event_id=>wwv_flow_api.id(184672344085791501)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'P902_ID_CONSULTA'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184674263590791520)
,p_event_id=>wwv_flow_api.id(184672344085791501)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'P902_ID_CONSULTA'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(184675588095791533)
,p_name=>'al_cerrar_ventana_modal'
,p_event_sequence=>80
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184675626764791534)
,p_event_id=>wwv_flow_api.id(184675588095791533)
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
 p_id=>wwv_flow_api.id(115905745921788901)
,p_name=>'ejecutar consulta'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(48745236541661501)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(115905890250788902)
,p_event_id=>wwv_flow_api.id(115905745921788901)
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
 p_id=>wwv_flow_api.id(116186715512968401)
,p_name=>unistr('clic bot\00F3n eliminar ')
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(98624241666014101)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(116186821356968402)
,p_event_id=>wwv_flow_api.id(116186715512968401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm(''\00BFEst\00E1 seguro de eliminar la consulta?'', function (ok){'),
'    if(ok){',
'        apex.submit({request:''BTN_ELMNAR''})',
'    }',
'})'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98699408163022502)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    pkg_cs_constructorsql.prc_el_consulta(p_id_cnslta_mstro =>  :P902_ID_CONSULTA ); ',
'    :P902_ID_CONSULTA := null;',
'    :P902_ACCION := ''''; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(98624241666014101)
,p_process_success_message=>'Consulta eliminada de forma existosa'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(184258572719219816)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'loadData'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'v_accion varchar2(10);',
'v_cdgo_prcso_sql varchar2(5);',
'v_id_cnslta_mstro number;',
'v_id_cnslta_dtlle number;',
'',
'begin',
'    pkg_cs_constructorsql.prc_co_consulta_general( p_cdgo_prcso_sql    => apex_application.g_f04(1)',
'                                                 , p_id_cnslta_mstro   => apex_application.g_f03(1)',
'                                                 , p_json              => apex_application.g_f01',
'                                                 );',
' end;',
'    '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_is_stateful_y_n=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(184260071566219831)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'saveData'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_accion varchar2(20);',
'v_id_prcso_sql number;',
'v_id_cnslta_mstro number;',
'v_id_cnslta_dtlle number; ',
'',
'begin',
'    pkg_cs_constructorsql.prc_cd_consulta_general( p_json              => apex_application.g_f01',
'                                                 , p_accion            => apex_application.g_f02(1)',
'                                                 , p_cdgo_prcso_sql    => apex_application.g_f03(1)',
'                                                 , p_cdgo_clnte        => :F_CDGO_CLNTE',
'                                                 , p_nmbre_cnslta      => apex_application.g_f04(1)',
'                                                 , p_id_cnslta_mstro   => apex_application.g_f05(1)',
'                                                 , p_clmnas            => apex_application.g_f06(1));',
'    /*begin',
'    ',
'    apex_json.open_object();',
'    v_accion := apex_application.g_f02(1);',
'    apex_json.write(''ACCION'', v_accion); ',
'    ',
'    if v_accion = ''SAVE'' then',
'        ',
'        select id_prcso_sql',
'          into v_id_prcso_sql',
'          from ge_p_procesos_sql',
'         where cdgo_prcso_sql = apex_application.g_f03(1)',
'           and cdgo_clnte     = :F_CDGO_CLNTE;',
'',
'        insert into ge_p_consulta_maestro (id_prcso_sql, nmbre_cnslta) ',
'                                    values(v_id_prcso_sql,apex_application.g_f04(1)) ',
'        returning id_cnslta_mstro ',
'             into v_id_cnslta_mstro;',
'',
'',
'        for i in 1..apex_application.g_f01.count loop         ',
'            for r_entidad_columna in (select id_entdad,',
'                                             id_entdad_clmnas,',
'                                             operador,',
'                                             valor1,',
'                                             valor2,',
'                                             tpo_dto,',
'                                             case when checked = ''Yes'' then ''S'' else ''N'' end checked',
'                                        from json_table(apex_application.g_f01(i),''$'' columns(id_entdad number path ''$.id_entdad'',',
'                                                                                              id_entdad_clmnas number path ''$.id_entdad_clmnas'',',
'                                                                                              operador number path ''$.operador'' ,',
'                                                                                              tpo_dto varchar2(1) path ''$.tpo_dto'',',
'                                                                                              valor1 varchar2(4000) path ''$.valor1'',',
'                                                                                              valor2 varchar2(4000) path ''$.valor2'',',
'                                                                                              checked varchar2(3) path ''$.checked'' ) ',
'                                                               ) t ',
'                                     )  loop',
'',
'             insert into ge_p_consulta_detalle(id_cnslta_mstro           , id_entdad_clmna                   , indcdor_select           , ',
'                                               id_oprdor_tpo             , vlor1                             , vlor2                    ,',
'                                               ordn_clmna                , tpo_dto  ) ',
'                                        values(v_id_cnslta_mstro         , r_entidad_columna.id_entdad_clmnas, r_entidad_columna.checked,',
'                                               r_entidad_columna.operador, r_entidad_columna.valor1          , r_entidad_columna.valor1 ,',
'                                               i                         , r_entidad_columna.tpo_dto         );',
'            end loop;                                                          ',
'        end loop;             ',
'          ',
'        apex_json.write(''SUCCESS'',true);',
unistr('        apex_json.write(''MSG'',''Se Registraron los Datos con \00C9xito'');'),
'        apex_json.write(''sql_query'',  v_id_cnslta_mstro);',
'        ',
'    elsif v_accion = ''EDIT'' then',
'         ',
'            select id_cnslta_mstro',
'              into v_id_cnslta_mstro',
'              from ge_p_consulta_maestro',
'             where id_cnslta_mstro = apex_application.g_f05(1);                 ',
'           ',
'            update ge_p_consulta_maestro ',
'               set nmbre_cnslta = apex_application.g_f04(1)',
'             where id_cnslta_mstro = v_id_cnslta_mstro;',
'              ',
'            --SE BORRAN LOS REGISTROS NO ENCONTRADO EN LA LISTA            ',
'            delete from ge_p_consulta_detalle ',
'                  where id_cnslta_mstro = v_id_cnslta_mstro ',
'                    and id_entdad_clmna not in (select regexp_substr( apex_application.g_f06(1),''[^,]+'', 1, level) ',
'                                                  from dual',
'                                            connect by regexp_substr( apex_application.g_f06(1), ''[^,]+'', 1, level) is not null);',
'                                        ',
'                        ',
'            for i in 1..apex_application.g_f01.count loop ',
'                for r_entidad_columna in (select id_entdad,',
'                                                 id_entdad_clmnas,',
'                                                 id_cnslta_dtlle,',
'                                                 operador,',
'                                                 valor1,',
'                                                 valor2,',
'                                                 tpo_dto,',
'                                                 case when checked = ''Yes'' then ''S'' else ''N'' end checked',
'                                            from json_table(apex_application.g_f01(i),''$'' columns(id_entdad number path ''$.id_entdad'',',
'                                                                                                  id_entdad_clmnas number path ''$.id_entdad_clmnas'',',
'                                                                                                  id_cnslta_dtlle number path ''$.id_cnslta_dtlle'',',
'                                                                                                  operador number path ''$.operador'' ,',
'                                                                                                  tpo_dto varchar2(1) path ''$.tpo_dto'',',
'                                                                                                  valor1 varchar2(4000) path ''$.valor1'',',
'                                                                                                  valor2 varchar2(4000) path ''$.valor2'',',
'                                                                                                  checked varchar2(3) path ''$.checked'' ) ',
'                                                                   ) t ',
'                                         )  loop',
'                 ',
'                        ',
'                        begin',
'                            if r_entidad_columna.id_cnslta_dtlle is null then',
'                            ',
'                                insert into ge_p_consulta_detalle( id_cnslta_mstro           , id_entdad_clmna                   , indcdor_select           , ',
'                                                                   id_oprdor_tpo             , vlor1                             , vlor2                    ,',
'                                                                   ordn_clmna                , tpo_dto                           ) ',
'                                                           values( v_id_cnslta_mstro         , r_entidad_columna.id_entdad_clmnas, r_entidad_columna.checked,',
'                                                                   r_entidad_columna.operador, r_entidad_columna.valor1          , r_entidad_columna.valor2 ,',
'                                                                   i                         , r_entidad_columna.tpo_dto         ); ',
'                            else',
'                            ',
'                                update ge_p_consulta_detalle ',
'                                   set indcdor_select = r_entidad_columna.checked,',
'                                       id_oprdor_tpo  = r_entidad_columna.operador,',
'                                       vlor1          = r_entidad_columna.valor1,',
'                                       vlor2          = r_entidad_columna.valor2,',
'                                       tpo_dto        = r_entidad_columna.tpo_dto,',
'                                       ordn_clmna     = i',
'                                 where id_cnslta_dtlle  = r_entidad_columna.id_cnslta_dtlle ;',
'                            end if;',
'                        exception when others  then ',
'                                  apex_json.write(''ERROR'', true);',
unistr('                                  apex_json.write(''MSG''  , ''No se pudo Realizar la Operaci\00F3n'');'),
unistr('                                  raise_application_error( -20001 ,  ''No se pudo Realizar la Operaci\00F3n'' );'),
'                        end; ',
'                end loop;                                                          ',
'            end loop;                         ',
'            ',
'            apex_json.write(''SUCCESS'',true);',
unistr('            apex_json.write(''MSG'',''Se Modificaron los Datos con \00C9xito'');'),
'            apex_json.write(''sql_query'',  v_id_cnslta_mstro);',
'            ',
'    end if;',
'    ',
'exception when others then',
'',
'        apex_json.write(''ERROR''  , true);',
unistr('        apex_json.write(''MSG''  , ''No se pudo Realizar la Operaci\00F3n'');'),
'        apex_json.write(''SQLERRM'', sqlerrm);   ',
'    end;',
'    ',
'      apex_json.close_all();*/',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(184675279777791530)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CargarDatosConsulta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'v_accion varchar2(10);',
'v_id_prcso_sql number;',
'v_id_cnslta_mstro number := apex_application.g_f01(1);',
'v_id_cnslta_dtlle number;',
'v_id_entdad_clmna varchar2(4000);',
'v_nmbre_cnslta varchar2(100);',
'',
'begin',
'    pkg_cs_constructorsql.prc_co_consulta_general( p_id_cnslta_mstro => v_id_cnslta_mstro , p_cdgo_clnte => :F_CDGO_CLNTE);',
'end;',
'    '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(38414379129757541)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargarDatosGenericos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_accion varchar2(10)         := apex_application.g_f01(1);',
'    v_cdgo_prcso_sql varchar2(5)  := apex_application.g_f02(1);',
'',
'begin',
'    begin',
'        apex_json.open_object(); ',
'        apex_json.write(''ACCION'', v_accion); ',
'        pkg_cs_constructorsql.prc_co_datos_genericos(p_cdgo_prcso_sql => v_cdgo_prcso_sql , p_cdgo_clnte => :F_CDGO_CLNTE );             ',
'',
'    exception ',
'        when others then ',
'            apex_json.open_object();',
'            apex_json.write(''ERROR'',true);',
'            apex_json.write(''MSG'',apex_escape.html(sqlerrm));',
'            apex_json.close_object();',
'    end;',
'',
'    apex_json.close_all();',
'end;',
'    '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
