prompt --application/pages/page_00009
begin
wwv_flow_api.create_page(
 p_id=>9
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Registro de Usuario'
,p_page_mode=>'MODAL'
,p_step_title=>'Registro de Usuario'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
'#IMAGE_PREFIX#javascript/infortributos/Portal/js/app.js?v=1.1.1',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
''))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function registrarUsuario(){',
'    var regex_cllr = /^[3][0-9]{9}$/;',
'    var regex_email = /^[A-Za-z]+[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/;',
'    ',
'    error = await validarFormulario();',
'    console.log(error.length);',
'    if (error.length > 0 ){',
'        return;    ',
'    }',
'    ',
'    if ($v(''P9_CLLAR'') != ''''){',
'        if (!regex_cllr.test($v(''P9_CLLAR''))) {',
'             Swal.fire(',
unistr('                      ''<h2><b>\00A1Alerta!</b></h2>'','),
unistr('                       ''<h3>El N\00FAmero de Celular no es V\00E1lido</h3>'','),
'                      ''info''',
'                    );        ',
'            return;',
'        }    ',
'    }    ',
'    ',
'    if (!regex_email.test($v(''P9_EMAIL''))) {',
'         Swal.fire(',
unistr('                  ''<h2><b>\00A1Alerta!</b></h2>'','),
unistr('                   ''<h3>El Email no es V\00E1lido</h3>'','),
'                  ''info''',
'                );',
'        return;',
'    }    ',
'    ',
'     if ($v(''P9_EMAIL'') != $v(''P9_EMAIL_1'')) {',
'         Swal.fire(',
unistr('                  ''<h2><b>\00A1Alerta!</b></h2>'','),
unistr('                   ''<h3>Las direcciones de correo electr\00F3nico no coinciden.</h3>'','),
'                  ''info''',
'                );',
'         return;',
'    }',
'        let $waitPopup = apex.widget.waitPopup();    ',
'        try {',
'            await apex.server.process("registrar", {',
'                pageItems: "#P9_CDGO_IDNTFCCION_TPO,#P9_IDNTFCCION,#P9_PRMER_NMBRE,#P9_SGNDO_NMBRE,#P9_PRMER_APLLDO,#P9_SGNDO_APLLDO,#P9_ID_DPRTMNTO,#P9_ID_MNCPIO,#P9_DRCCION,#P9_CLLAR,#P9_TLFNO,#P9_EMAIL"',
'            },{',
'                success: function(data){',
'                    console.log(data);',
'                    if (data.o_cdgo_rspsta === 0){',
'                        $waitPopup.remove();',
'                        Swal.fire(',
unistr('                                  ''<h2><b>\00A1Registro Exitoso!</b></h2>'','),
'                                  ''<h3>'' + data.o_mnsje_rspsta + ''</h3>'',',
'                                  ''success''',
'                                ).then((result) => {',
'                                    apex.navigation.dialog.close(true);',
'                                });',
'                    }else{',
'                        $waitPopup.remove();',
'                        Swal.fire(',
unistr('                                  ''<h2><b>\00A1No es posible registrar el usuario!</b></h2>'','),
'                                  ''<h3>'' + data.o_mnsje_rspsta+ ''</h3>'',',
'                                  ''error''',
'                                ).then((result) => {',
'                                    apex.navigation.dialog.close(true);',
'                                });                    ',
'                    }',
'',
'',
'                }',
'            })',
'        }catch(e){',
'            console.log(e);',
'        }',
'    ',
'};',
'',
'function validarFormulario(){',
'    apex.message.clearErrors();',
'    var errors = [];',
'    var item_requeridos = $(''input,select,select2'').filter(''[required]'')',
'    let item;',
'    console.log(item_requeridos);',
'    for ( item of item_requeridos) {',
'        let name = item.name;',
'        let label = $(`#${name}_LABEL`).text().replace($(`#${name}_LABEL`).children(''.u-VisuallyHidden'').text(), '''').trim();',
'',
'        if (!$v(name)) {',
'            errors.push({',
'                            type: "error",',
'                            location: ["inline"],',
'                            pageItem: name,',
'                            message: label + '' es requerido!'',',
'                            unsafe: false',
'                        });',
'',
'        }',
'    }',
'',
'    apex.message.showErrors(errors);',
'    return errors;',
'};',
'',
'$(document).ready(function(){',
'	$("#P9_EMAIL_1").on(''paste'', function(e){',
'		e.preventDefault();',
'	})',
'	$("#P9_EMAIL").on(''copy'', function(e){',
'		e.preventDefault();		',
'	})',
'    $("#P9_EMAIL").on(''paste'', function(e){',
'		e.preventDefault();',
'	})',
'	$("#P9_EMAIL_1").on(''copy'', function(e){',
'		e.preventDefault();		',
'	})',
'})'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*apex.jQuery( apex.gPageContext$ ).on( "apexreadyend", function( e ) {',
'    apex.item(''btn_atras'').hide();',
'    apex.item(''btn_grdar'').hide();',
'    //portal.generarCombo([''#P'' + $v(''pFlowStepId'') + ''_ID_PAIS'', ''#P'' + $v(''pFlowStepId'') + ''_ID_PAIS_NTFCCION'',''#P'' + $v(''pFlowStepId'') + ''_ID_PAIS_ORGN''], ''util/Pais'');',
'    //init_tab();',
'});*/'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css',
'#IMAGE_PREFIX#javascript/infortributos/Portal/css/registro.css?v=1.25'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'body .ui-corner-all {',
'    border-radius: 10px !important;',
'}',
'',
'.t-Region-header {',
'    border-radius: 10px 10px 0px 0px !important;',
'    margin-left: 0 !important;',
'}',
'',
'span.t-Region-headerIcon{',
'	    background: url(/i/public/&F_CDGO_CLNTE./logo1.png);',
'    background-repeat: no-repeat;',
'    display: block !important;',
'    height: 11.2rem;',
'    left: 46rem;',
'    margin-bottom: -2rem;',
'    position: relative;',
'    top: -3rem;',
'    width: 25rem;'))
,p_step_template=>wwv_flow_api.id(252165246740651358)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_page_is_public_y_n=>'Y'
,p_rejoin_existing_sessions=>'P'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20221205094354'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108964385537117657)
,p_plug_name=>'<p></p>'
,p_region_name=>'formulario'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--xlarge'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(59495303170406550)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(108964385537117657)
,p_button_name=>'btn_grdar'
,p_button_static_id=>'btn_grdar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4479462762952205)
,p_name=>'P9_EMAIL'
,p_is_required=>true
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(108964385537117657)
,p_prompt=>unistr('Correo Electr\00F3nico ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4479578688952206)
,p_name=>'P9_EMAIL_1'
,p_is_required=>true
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(108964385537117657)
,p_prompt=>unistr('Confirmar Correo Electr\00F3nico ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4480024913952211)
,p_name=>'P9_MSNSJE_RSPSTA'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(108964385537117657)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59497492835406583)
,p_name=>'P9_NCNLDAD'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(108964385537117657)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59497813992406583)
,p_name=>'P9_FCHA_NCMNTO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(108964385537117657)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59498280881406584)
,p_name=>'P9_GNRO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(108964385537117657)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59498657153406584)
,p_name=>'P9_CLLAR'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(108964385537117657)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEL'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59500174725406585)
,p_name=>'P9_ID_TRCRO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(108964385537117657)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59500510232406585)
,p_name=>'P9_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(108964385537117657)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59500915155406585)
,p_name=>'P9_CDGO_IDNTFCCION_TPO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(108964385537117657)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:C\00C9DULA DE CIUDADAN\00CDA;C,C\00C9DULA DE EXTRANJER\00CDA;E,NUMERO DE IDENTIFICACION TRIBUTARIA;N')
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59501328988406586)
,p_name=>'P9_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(108964385537117657)
,p_prompt=>unistr(' Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event,''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59501735178406586)
,p_name=>'P9_PRMER_NMBRE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(108964385537117657)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59502188750406587)
,p_name=>'P9_SGNDO_NMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(108964385537117657)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59502581598406587)
,p_name=>'P9_PRMER_APLLDO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(108964385537117657)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59502968976406587)
,p_name=>'P9_SGNDO_APLLDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(108964385537117657)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59503324128406587)
,p_name=>'P9_ID_PAIS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(108964385537117657)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59503713464406587)
,p_name=>'P9_ID_DPRTMNTO'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(108964385537117657)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_dprtmnto',
'     , id_dprtmnto ',
'  from df_s_departamentos'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione...'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59504190384406588)
,p_name=>'P9_ID_MNCPIO'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(108964385537117657)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mncpio',
'     , id_mncpio',
'  from df_s_municipios',
' where id_dprtmnto = :P9_ID_DPRTMNTO'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione...'
,p_lov_cascade_parent_items=>'P9_ID_DPRTMNTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59504532224406591)
,p_name=>'P9_DRCCION'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(108964385537117657)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79385390321513101)
,p_name=>'P9_TLFNO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(108964385537117657)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cMaxlength=>320
,p_tag_attributes=>' onkeypress="return validarExpresion(event, ''numeroEntero'')" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEL'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(59508624989406629)
,p_name=>unistr('al obtener el foco en identificaci\00F3n')
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_IDNTFCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusin'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(59509111492406630)
,p_event_id=>wwv_flow_api.id(59508624989406629)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'var elm = this.triggeringElement;',
'$(elm).data(''value'', $(elm).val());'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4480455199952215)
,p_name=>'Registrar Usuario'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(59495303170406550)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4480539847952216)
,p_event_id=>wwv_flow_api.id(4480455199952215)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'registrarUsuario();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4480380735952214)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'registrar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(4000);',
'begin    ',
'',
'    -- Procedimiento que registra un usuario portal',
'    pkg_pc_portal_ciudadano.prc_rg_usuario_portal(',
'              p_cdgo_clnte				=> :F_CDGO_CLNTE',
'            , p_cdgo_idntfccion_tpo		=> :P9_CDGO_IDNTFCCION_TPO',
'            , p_idntfccion				=> :P9_IDNTFCCION',
'            , p_prmer_nmbre				=> :P9_PRMER_NMBRE',
'            , p_sgndo_nmbre				=> :P9_SGNDO_NMBRE',
'            , p_prmer_aplldo			=> :P9_PRMER_APLLDO',
'            , p_sgndo_aplldo			=> :P9_SGNDO_APLLDO',
'            , p_drccion					=> :P9_DRCCION',
'            , p_id_dprtmnto				=> :P9_ID_DPRTMNTO',
'            , p_id_mncpio				=> :P9_ID_MNCPIO',
'            , p_email					=> :P9_EMAIL',
'            , p_tlfno					=> :P9_TLFNO',
'            , p_ncnldad					=> :P9_NCNLDAD',
'            , p_cllar					=> :P9_CLLAR',
'            , o_cdgo_rspsta				=> v_cdgo_rspsta',
'            , o_mnsje_rspsta			=> v_mnsje_rspsta ',
'    );',
'',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'' , v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'    ',
'',
'end;    ',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
