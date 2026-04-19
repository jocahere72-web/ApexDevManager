prompt --application/pages/page_00272
begin
wwv_flow_api.create_page(
 p_id=>272
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Sucursales Novedades'
,p_page_mode=>'MODAL'
,p_step_title=>'Sucursales Novedades'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function actualizar_temporal(p_this){  ',
'    ',
'    var item_nmbre =  p_this.triggeringElement.name;',
'    var item_vlor =  apex.item(item_nmbre).getValue();',
'    ',
'    ',
'    apex.server.process(''actualizar_temporal'', {',
'        f01: item_nmbre,',
'        f02: item_vlor',
'    }, {',
'        success: function (data) { ',
'                if (data.type === ''OK'') {',
'                    window.localStorage.clear();',
'                    window.location.href = data.url;',
'                }else{',
'                    apex.message.showErrors({',
'                        type: apex.message.TYPE.ERROR,',
'                        location: ["page"],',
'                        message: data.msg,',
'                        unsafe: false',
'                    });',
'                }',
'            },',
'            error: function () {',
'                console.log(arguments);',
'            }',
'        }); ',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'ERICO'
,p_last_upd_yyyymmddhh24miss=>'20220506115242'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(158645340935719521)
,p_plug_name=>'Sucursales'
,p_region_name=>'rspnsble'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(22559038371259088)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(158645340935719521)
,p_button_name=>'BNT_APLICAR_CAMBIOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_execute_validations=>'N'
,p_button_condition=>'P272_SEQ_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(22559301701259140)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(158645340935719521)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar / Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(22559766521259140)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(158645340935719521)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_execute_validations=>'N'
,p_button_condition=>'P272_SEQ_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(22615057969474701)
,p_branch_name=>'redirigir_pag_270_Crear'
,p_branch_action=>'f?p=&APP_ID.:270:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(22559766521259140)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(22617931581474730)
,p_branch_name=>'redirigir_pag_270_Actualizar'
,p_branch_action=>'f?p=&APP_ID.:270:&SESSION.::&DEBUG.:RP,272::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(22559038371259088)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(22615526597474706)
,p_branch_name=>'redirigir_pag_270'
,p_branch_action=>'f?p=&APP_ID.:270:&SESSION.::&DEBUG.:RP,272::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(22559301701259140)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22560120799259142)
,p_name=>'P272_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(158645340935719521)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22560426880259212)
,p_name=>'P272_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(158645340935719521)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22560810875259213)
,p_name=>'P272_PRNCPAL_S_N'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(158645340935719521)
,p_item_default=>'S'
,p_prompt=>unistr('\00BFPrincipal?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO'
,p_lov=>'.'||wwv_flow_api.id(22574826977259438)||'.'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22561290546259223)
,p_name=>'P272_CDGO_SCRSAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(158645340935719521)
,p_prompt=>unistr('C\00F3digo')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22561692143259224)
,p_name=>'P272_NMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(158645340935719521)
,p_prompt=>'Nombre de la Sucursal'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_tag_attributes=>' onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22562067292259224)
,p_name=>'P272_ID_PAIS_NTFCCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(158645340935719521)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22562428943259232)
,p_name=>'P272_ID_DPRTMNTO_NTFCCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(158645340935719521)
,p_item_default=>'F_ID_DPRTMNTO_CLNTE'
,p_item_default_type=>'ITEM'
,p_prompt=>'Departamento'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_dprtmnto as d,',
'        a.id_dprtmnto as r',
'from df_s_departamentos a;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22562847688259233)
,p_name=>'P272_ID_MNCPIO_NTFCCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(158645340935719521)
,p_item_default=>'F_ID_MNCPIO_CLNTE'
,p_item_default_type=>'ITEM'
,p_prompt=>'Municipio'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_mncpio as d,',
'        a.id_mncpio as r',
'from df_s_municipios a',
'where a.id_dprtmnto = :P272_ID_DPRTMNTO_NTFCCION;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P272_ID_DPRTMNTO_NTFCCION'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22563217043259233)
,p_name=>'P272_DRCCION_NTFCCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(158645340935719521)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>' onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22563694051259234)
,p_name=>'P272_TLFNO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(158645340935719521)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22564085200259235)
,p_name=>'P272_CLLAR'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(158645340935719521)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22564412792259235)
,p_name=>'P272_ACTVO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(158645340935719521)
,p_prompt=>unistr('\00BFActivo?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO'
,p_lov=>'.'||wwv_flow_api.id(22574826977259438)||'.'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22564857924259235)
,p_name=>'P272_EMAIL'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(158645340935719521)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22565221257259235)
,p_name=>'P272_ESTDO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(158645340935719521)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22646472015389201)
,p_name=>'P272_IDNTFCCION'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(158645340935719521)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(22565720033259285)
,p_computation_sequence=>10
,p_computation_item=>'P272_CDGO_SCRSAL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' ',
'   select  nvl(max(c004),0) + 1',
'     from apex_collections    a',
'    where collection_name     = ''SUCURSALES''',
'    --  and seq_id              = :P272_SEQ_ID',
'   -- and n001                = :F_ID_INSTNCIA_FLJO '))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22567521969259333)
,p_validation_name=>'Valida Nombre'
,p_validation_sequence=>40
,p_validation=>'P272_NMBRE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(22559766521259140)
,p_associated_item=>wwv_flow_api.id(22561692143259224)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22569129261259334)
,p_validation_name=>'Valida codigo de sucursal'
,p_validation_sequence=>50
,p_validation=>'P272_CDGO_SCRSAL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(22559766521259140)
,p_associated_item=>wwv_flow_api.id(22561290546259223)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22567968037259333)
,p_validation_name=>'Valida departamento'
,p_validation_sequence=>60
,p_validation=>'P272_ID_DPRTMNTO_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(22559766521259140)
,p_associated_item=>wwv_flow_api.id(22562428943259232)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22568372657259333)
,p_validation_name=>'Valida municipio'
,p_validation_sequence=>70
,p_validation=>'P272_ID_MNCPIO_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(22559766521259140)
,p_associated_item=>wwv_flow_api.id(22562847688259233)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22568740511259334)
,p_validation_name=>unistr('Valida direcci\00F3n ')
,p_validation_sequence=>90
,p_validation=>'P272_DRCCION_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(22559766521259140)
,p_associated_item=>wwv_flow_api.id(22563217043259233)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22566383207259297)
,p_validation_name=>'Valida correo'
,p_validation_sequence=>110
,p_validation=>'regexp_like (:P272_EMAIL,''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Ingrese un correo valido.'
,p_when_button_pressed=>wwv_flow_api.id(22559766521259140)
,p_associated_item=>wwv_flow_api.id(22564857924259235)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22566785225259332)
,p_validation_name=>'validar formato de tefelono valido'
,p_validation_sequence=>120
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if length(:P272_TLFNO) != 7 then ',
unistr('        return ''El n\00FAmero de tel\00E9fono ingresado no es valido, por favor ingrese 7 n\00FAmeros'';  '),
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_api.id(22563694051259234)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22567163313259333)
,p_validation_name=>'validar formato de celular valido'
,p_validation_sequence=>130
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if length(:P272_CLLAR) != 10 then ',
unistr('        return ''El n\00FAmero de celular ingresado no es valido, por favor ingrese 10 n\00FAmeros'';    '),
'    elsif substr(:P272_CLLAR, 1, 1) != ''3'' then',
unistr('        return ''El n\00FAmero de celular ingresado no es valido, debe iniciar con 3'';    '),
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_api.id(22559766521259140)
,p_associated_item=>wwv_flow_api.id(22564085200259235)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22616164186474712)
,p_validation_name=>'Validar que celular no este vacio'
,p_validation_sequence=>140
,p_validation=>'P272_CLLAR'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(22559766521259140)
,p_associated_item=>wwv_flow_api.id(22564085200259235)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22616226726474713)
,p_validation_name=>'Valida correo que no este vacio'
,p_validation_sequence=>150
,p_validation=>'P272_EMAIL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(22559766521259140)
,p_associated_item=>wwv_flow_api.id(22564857924259235)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22572113201259395)
,p_name=>'Carga responsable'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P272_IDNTFCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22572634233259403)
,p_event_id=>wwv_flow_api.id(22572113201259395)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22573086401259431)
,p_name=>'Al hacer clic en Regresar Cerrar Modal'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(22559301701259140)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22573537263259435)
,p_event_id=>wwv_flow_api.id(22573086401259431)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22573981350259435)
,p_name=>'Al cambiar actualizar en la temporal el nuevo valor'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P272_SEQ_ID,P272_PRNCPAL_S_N,P272_NMBRE,P272_ID_DPRTMNTO_NTFCCION,P272_ID_MNCPIO_NTFCCION,P272_DRCCION_NTFCCION,P272_TLFNO,P272_CLLAR,P272_ACTVO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22574413095259435)
,p_event_id=>wwv_flow_api.id(22573981350259435)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'actualizar_temporal(this);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22570113134259381)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta en la coleccion los datos de las Sucursales'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' ',
'begin',
'   select c001 id_sjto_impsto',
'        , c002 nmbre',
'        , c003 prncpal_s_n',
'        , c004 cdgo_scrsal',
'        , c005 id_dprtmnto_ntfccion',
'        , c006 id_mncpio_ntfccion',
'        , c007 drccion_ntfccion',
'        , c008 email',
'        , c009 tlfno',
'        , c010 cllar',
'        , c011 actvo ',
'        , c012 estdo',
'     into :P272_ID_SJTO_IMPSTO',
'        , :P272_NMBRE  ',
'        , :P272_PRNCPAL_S_N  ',
'        , :P272_CDGO_SCRSAL',
'        , :P272_ID_DPRTMNTO_NTFCCION',
'        , :P272_ID_MNCPIO_NTFCCION',
'        , :P272_DRCCION_NTFCCION',
'        , :P272_EMAIL',
'        , :P272_TLFNO',
'        , :P272_CLLAR',
'        , :P272_ACTVO ',
'        , :P272_ESTDO',
'     from apex_collections    a',
'    where collection_name     = ''SUCURSALES''',
'      and seq_id              = :P272_SEQ_ID;',
'    --  and n001                = :F_ID_INSTNCIA_FLJO;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P272_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22570933677259394)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Llenar temporal con los datos de las sucursales'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_tmpral    number;',
'    v_error        varchar2(1000);',
'    v_estdo        varchar2(100);',
'begin',
'   ',
'   begin',
'       select nvl(count(1),0)',
'         into v_id_tmpral',
'         from gn_g_temporal      a',
'        where a.id_ssion         = :APP_SESSION',
'          --and a.n001             = :F_ID_INSTNCIA_FLJO',
'          and a.c005             = ''SUCURSALES''',
'          and a.n002             = :P272_SEQ_ID;',
'    exception ',
'        when others then ',
'            v_id_tmpral    := null;',
'    end;',
'    ',
'    if :P272_SEQ_ID is null then ',
'        v_estdo    := ''NUEVO'';',
'    else',
'        v_estdo    := ''ACTUALIZACION'';',
'    end if;',
'    if v_id_tmpral = 0 then ',
'       for c_items in (select item_name',
'                          , label',
'                          ,apex_util.get_session_state(item_name) session_value',
'                      from apex_application_page_items',
'                     where application_id                 = :APP_ID',
'                       and page_id                        = :APP_PAGE_ID) loop',
'',
'        insert into gn_g_temporal (id_ssion,                 n001,                    n002,                      c001,                ',
'                                   c002,                     c003,                    c004,                      c005,',
'                                   c006)',
'                           values (:APP_SESSION,             :F_ID_INSTNCIA_FLJO,     :P272_SEQ_ID,               c_items.item_name,   ',
'                                   c_items.session_value,    c_items.session_value,   c_items.label,             ''SUCURSALES'',',
'                                   v_estdo);',
'        end loop;',
'    end if;',
'    ',
'    ',
'',
'exception',
'    when others then ',
'        v_error    := sqlcode || '' -- '' || sqlerrm;',
'        insert into gti_aux (col1, col2) values (''Error'', v_error); commit;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
' from gn_g_temporal      a',
'where a.id_ssion         = :APP_SESSION',
'  and a.n001             = :F_ID_INSTNCIA_FLJO',
'  and a.c005             = ''RESPONSABLE''',
'  and a.n001             = :P272_SEQ_ID ',
'  and :P272_SEQ_ID        is not null;'))
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22569803387259377)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Agrega Sucursal'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_prncpal               number;',
'    v_rgstros               number;',
'begin',
'',
'    if :P272_SEQ_ID is null then',
'        ',
'        if (not apex_collection.collection_exists(p_collection_name => ''SUCURSALES'') ) then',
'            apex_collection.create_collection( p_collection_name => ''SUCURSALES'');',
'        end if;',
'  ',
'          -- Se valida si la sucursal ya esta registrada',
'        begin',
'            select count(*)',
'              into v_rgstros',
'             from apex_collections   a',
'             where collection_name   = ''SUCURSALES''',
'            --   and a.n001            = :F_ID_INSTNCIA_FLJO',
'               and a.c004            = :P272_CDGO_SCRSAL;',
'        ',
'            if v_rgstros > 0 then',
'                raise_application_error(-20003, ''Sr(a). '' || :F_NMBRE_USRIO || '', la sucursal ya se encuentra agregada. Por favor valide e intente nuevamente'');  ',
'            end if;',
'        end;-- FIN Se valida si el resposable ya esta registrado      ',
'          ',
'        begin',
'            apex_collection.add_member(p_collection_name 	=> ''SUCURSALES''',
'                                  --   , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                     , p_c001				=> :P272_ID_SJTO_IMPSTO',
'									 , p_c002				=> :P272_NMBRE',
'									 , p_c003				=> :P272_PRNCPAL_S_N ',
'									 , p_c004				=> :P272_CDGO_SCRSAL',
'									 , p_c005				=> :P272_ID_DPRTMNTO_NTFCCION',
'									 , p_c006				=> :P272_ID_MNCPIO_NTFCCION',
'									 , p_c007				=> :P272_DRCCION_NTFCCION',
'									 , p_c008				=> :P272_EMAIL',
'									 , p_c009				=> :P272_TLFNO',
'									 , p_c010				=> :P272_CLLAR',
'									 , p_c011				=> :P272_ACTVO',
'                                     , p_c012				=> ''NUEVO'');',
'      end;         ',
'    end if;                    ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(22559766521259140)
,p_process_when=>'P272_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>'Sucursal agregada exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22571767860259395)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Llenar temporal con los datos de la nueva sucursal'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_tmpral    number;',
'    v_error        varchar2(1000);',
'    v_estdo        varchar2(100);',
'    v_seq_id       number;',
'begin',
'   ',
'   begin',
'       select nvl(count(1),0)',
'         into v_id_tmpral',
'         from gn_g_temporal      a',
'        where a.id_ssion         = :APP_SESSION',
'        --  and a.n001             = :F_ID_INSTNCIA_FLJO',
'          and a.c005             = ''SUCURSALES''',
'          and a.c002            =  :P272_NMBRE;',
'    exception ',
'        when others then ',
'            v_id_tmpral    := 0;',
'    end;',
'    ',
'    if :P272_SEQ_ID is null then ',
'        v_estdo    := ''NUEVO'';',
'    else',
'        v_estdo    := ''ACTUALIZACION'';',
'    end if;',
'    ',
'     begin',
'        select seq_id',
'          into v_seq_id',
'         from apex_collections   a',
'         where collection_name   = ''SUCURSALES''',
'         --  and a.n001            = :F_ID_INSTNCIA_FLJO',
'           and a.c002            = :P272_NMBRE',
'           and a.n001            is null;',
'     end;',
'     ',
'    if v_id_tmpral = 0 then ',
'       for c_items in (select item_name',
'                          , label',
'                          ,apex_util.get_session_state(item_name) session_value',
'                      from apex_application_page_items',
'                     where application_id                 = :APP_ID',
'                       and page_id                        = :APP_PAGE_ID) loop',
'',
'        insert into gn_g_temporal (id_ssion,                 n001,                    n002,                      c001,                ',
'                                   c002,                     c003,                    c004,                      c005,',
'                                   c006)',
'                           values (:APP_SESSION,             :F_ID_INSTNCIA_FLJO,     v_seq_id,                  c_items.item_name,   ',
'                                   c_items.session_value,    c_items.session_value,   c_items.label,             ''SUCURSALES'',',
'                                   v_estdo);',
'        end loop;',
'    end if;',
'    ',
'    ',
'',
'exception',
'    when others then ',
'        v_error    := sqlcode || '' -- '' || sqlerrm;',
'        insert into gti_aux (col1, col2) values (''Error'', v_error); commit;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(22559766521259140)
,p_process_when=>'P272_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>'Sucursal agregada exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22570552412259382)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update Sucursales'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'   ',
'    begin',
'        apex_collection.update_member(p_collection_name 	=> ''SUCURSALES''',
'                                     , p_seq     			=> :P272_SEQ_ID',
'                                --     , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                     , p_c001				=> :P272_ID_SJTO_IMPSTO',
'									 , p_c002				=> :P272_NMBRE',
'									 , p_c003				=> :P272_PRNCPAL_S_N',
'                                 	 , p_c004				=> :P272_CDGO_SCRSAL',
'									 , p_c005				=> :P272_ID_DPRTMNTO_NTFCCION',
'									 , p_c006				=> :P272_ID_MNCPIO_NTFCCION',
'									 , p_c007				=> :P272_DRCCION_NTFCCION',
'									 , p_c008				=> :P272_EMAIL',
'									 , p_c009				=> :P272_TLFNO',
'									 , p_c010				=> :P272_CLLAR',
'									 , p_c011				=> :P272_ACTVO',
'                                     , p_c012				=> ''ACTUALIZADO'');',
'    exception',
'        when others then ',
'            raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || '', ha ocurrido un error. Por favor valide e intente nuevamente'' );  ',
'    end;    ',
'end;    '))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(22559038371259088)
,p_process_when=>'P272_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'Sucursal actualizada exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22569446750259334)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar la modal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>unistr('Acci\00F3n Procesada con Exito')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22615490269474705)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Borrar_Sesion'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(22559766521259140)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22615611315474707)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Borrar_Sesion_Cancelar'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(22559301701259140)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22571379697259394)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'actualizar_temporal'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_tmpral                gn_g_temporal.id_tmpral%type;',
'    ',
'    v_item_nmbre               varchar2(1000) := apex_application.g_f01(1);',
'    v_item_vlor                varchar2(1000) := apex_application.g_f02(1);',
'    ',
'    v_error                    varchar2(1000);',
'    v_nmro                     number;',
'begin',
'    ',
'    begin',
'        begin',
'           select a.id_tmpral',
'             into v_id_tmpral',
'             from gn_g_temporal      a',
'            where a.id_ssion         = :APP_SESSION',
'              and a.n001             = :F_ID_INSTNCIA_FLJO',
'              and a.c005             = ''SUCURSALES''',
'              and a.n002             = :P272_SEQ_ID',
'              and a.c001             = v_item_nmbre;',
'        exception ',
'            when others then ',
'                v_id_tmpral    := null;',
'        end;',
'        ',
'        ',
'        if v_id_tmpral is not null then ',
'        ',
'            update gn_g_temporal    a',
'              set c003              = v_item_vlor',
'                , c006              = ''ACTUALIZACION''',
'             where a.id_ssion       = :APP_SESSION',
'               and a.n001           = :F_ID_INSTNCIA_FLJO',
'               and a.c005           = ''SUCURSALES''',
'               and a.n002           = :P272_SEQ_ID',
'               and a.c001           = v_item_nmbre;',
'            v_nmro := sql%rowcount;',
'            /*insert into gti_aux(col1, col2) values (''v_item_nmbre'', v_item_nmbre);',
'            insert into gti_aux(col1, col2) values (''v_item_vlor'', v_item_vlor);*/',
'            commit;',
'            ',
'        else',
'            insert into gn_g_temporal (id_ssion,                 n001,                    n002,                      c001,                ',
'                                       c002,                     c003,                    c004,                      c005,',
'                                       c006)',
'                               values (:APP_SESSION,             :F_ID_INSTNCIA_FLJO,     :P272_SEQ_ID,               v_item_nmbre,   ',
'                                       v_item_vlor,              v_item_vlor,             v_item_nmbre,             ''SUCURSALES'',',
'                                       ''NUEVO'');',
'',
'            commit;',
'        end if;',
'    ',
'    exception ',
'        when others then ',
'            null;',
'  end;',
'  ',
'  ',
'exception',
'    when others then ',
'        v_error    := sqlcode || '' -  ''|| sqlerrm;',
'         insert into gti_aux(col1, col2) values (''Error'', v_error);',
'         commit;        ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P272_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
