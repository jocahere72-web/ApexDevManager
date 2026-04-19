prompt --application/pages/page_00904
begin
wwv_flow_api.create_page(
 p_id=>904
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Funciones Constructor'
,p_page_mode=>'MODAL'
,p_step_title=>'Funciones Constructor'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render_function(){',
'    var fnc = $(''#P904_ID_FNCION'').val(); ',
'    var data = apex.item("P904_PRMTRO").getValue();',
'    data.forEach(function(f, i) {',
'         fnc = fnc.replace(''$param'' + (i + 1), f );   ',
'    });',
'    $(''#P904_FNCION_DSPLAY'').val(fnc);',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P904_FNCION_DSPLAY {',
'    resize: none !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'MCARO'
,p_last_upd_yyyymmddhh24miss=>'20191106133650'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40407933151237601)
,p_plug_name=>unistr('regi\00F3n funciones')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40578037069065901)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(40407933151237601)
,p_button_name=>'BTN_GRDAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40408085202237602)
,p_name=>'P904_ID_FNCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(40407933151237601)
,p_prompt=>unistr('Funci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select package_name ||''.'' || object_name || '' version '' || overload d,  ',
'         package_name ||''.'' || object_name || ''('' || listagg(argument_name || '' => $param'' || position ,'' ,'') within group (order by position) || '')'' b',
'    from user_arguments ',
'   where package_name = ''PKG_WF_FUNCIONES''',
'     and argument_name is not null',
'group by object_name,',
'         package_name,',
'         overload ;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40452133545930601)
,p_name=>'P904_FUNCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(40407933151237601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40461233318953001)
,p_name=>'P904_PRMTRO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(40407933151237601)
,p_prompt=>unistr('Par\00E1metros')
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>'STATIC:r;r'
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'ALL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40468532317001901)
,p_name=>'P904_FNCION_DSPLAY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(40407933151237601)
,p_prompt=>'Resultado'
,p_placeholder=>'Resultado'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>90
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40496092804243201)
,p_name=>'al cargar la pagina'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40496177141243202)
,p_event_id=>wwv_flow_api.id(40496092804243201)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var datosCol = JSON.parse(window.localStorage.data);',
'var fnc = window.localStorage.vl;',
'var funItem = '''';',
'var params = $(''#P904_PRMTRO_LEFT'');',
'var fncn = fnc.match(/(.*)\(/);',
'var arrFnc = fnc.split(''=>'');',
'var dataParms = [];',
'',
'$("#P904_PRMTRO_LEFT option[value=''r'']").remove();',
'datosCol.forEach(function (f) {',
'    $(`<option value="${f.nmbre}">${f.alias}</option>`).appendTo(params);',
'});',
'',
'arrFnc.forEach(function(f) {',
'    var d = f.match(/(.*)[,|\)]/);',
'    if(d) dataParms.push(d[1].trim());',
'});',
'',
'$(''#P904_ID_FNCION option[value!=""]'').each(function(){',
'	var vl = this.value;',
'    if (fncn) {',
'        if (vl.includes(fncn[1]) && arrFnc.length === vl.split(''=>'').length ){',
'            funItem = vl;',
'        }    ',
'    }',
'	',
'});',
'console.log(funItem,fnc,dataParms);',
'$s(''P904_ID_FNCION'', funItem);',
'$s(''P904_FNCION_DSPLAY'',fnc);',
'$s("P904_PRMTRO", dataParms.join('':''));',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40554161422962501)
,p_name=>'al cambiar la funcion'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P904_ID_FNCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40554239661962502)
,p_event_id=>wwv_flow_api.id(40554161422962501)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'render_function();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40563595614039501)
,p_name=>'al hacer clic en parametros'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P904_PRMTRO'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40563605958039502)
,p_event_id=>wwv_flow_api.id(40563595614039501)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'render_function();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40563730422039503)
,p_name=>'al hacer doble clic en parametros'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P904_PRMTRO'
,p_bind_type=>'bind'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40563826006039504)
,p_event_id=>wwv_flow_api.id(40563730422039503)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'render_function();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40563996399039505)
,p_name=>'al presionar una tecla en parametros'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P904_PRMTRO'
,p_bind_type=>'bind'
,p_bind_event_type=>'keydown'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40564007934039506)
,p_event_id=>wwv_flow_api.id(40563996399039505)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'render_function();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40578109092065902)
,p_name=>unistr('a hacer clic en el bot\00F3n guardar')
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(40578037069065901)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40578213349065903)
,p_event_id=>wwv_flow_api.id(40578109092065902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var fnc = $v(''P904_ID_FNCION''); ',
'var fncd = $v(''P904_FNCION_DSPLAY'');',
'var errors = [];',
'    ',
'if (!fnc) {',
'   errors.push({',
'    type: apex.message.TYPE.ERROR,',
'    location: ["page","inline"],',
'    pageItem: "P904_ID_FNCION", ',
unistr('    message: ''Debe Seleccionar una Funci\00F3n'','),
'    unsafe: false',
'}); ',
'}',
'if (fncd.includes(''$param'')) {',
'  errors.push({',
'    type: apex.message.TYPE.ERROR,',
'    location: ["page","inline"],',
'    pageItem: "P904_FNCION_DSPLAY", ',
unistr('    message: ''Debe Seleccionar par\00E1metros o reemplazar los valores en la funci\00F3n'','),
'    unsafe: false',
'}); ',
'}',
'',
'if (fnc.split(''=>'').length !== fncd.split(''=>'').length) {',
'    errors.push({',
'        type: apex.message.TYPE.ERROR,',
'        location: ["page","inline"],',
'        pageItem: "P904_FNCION_DSPLAY", ',
unistr('        message: ''La Cantidad de Par\00E1metros no es Igual a los de la Funci\00F3n'','),
'        unsafe: false',
'}); ',
'}',
'',
'if (errors.length === 0) {',
'    window.localStorage.setItem(''vl'', fncd);',
'    apex.navigation.dialog.close(true);',
'}else{',
'    apex.message.showErrors(errors);',
'    setTimeout(function(){apex.message.clearErrors()}, 5000);',
'}'))
,p_stop_execution_on_error=>'Y'
);
end;
/
