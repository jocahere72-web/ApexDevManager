prompt --application/pages/page_00055
begin
wwv_flow_api.create_page(
 p_id=>55
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
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
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20240806113931'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(136086847441460556)
,p_plug_name=>'Sucursales'
,p_region_name=>'rspnsble'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9233570110762825)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(136086847441460556)
,p_button_name=>'BNT_APLICAR_CAMBIOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P55_SEQ_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9233906933762834)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(136086847441460556)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Regresar / Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9234382570762834)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(136086847441460556)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P55_SEQ_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9234790752762836)
,p_name=>'P55_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(136086847441460556)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9235108431762860)
,p_name=>'P55_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(136086847441460556)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9235534546762860)
,p_name=>'P55_PRNCPAL_S_N'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(136086847441460556)
,p_item_default=>'S'
,p_prompt=>unistr('\00BFPrincipal?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO'
,p_lov=>'.'||wwv_flow_api.id(105710618312748017)||'.'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9235967170762861)
,p_name=>'P55_CDGO_SCRSAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(136086847441460556)
,p_prompt=>unistr('C\00F3digo')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9236390741762861)
,p_name=>'P55_NMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(136086847441460556)
,p_prompt=>'Nombre de la Sucursal'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_tag_attributes=>' onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9236711959762861)
,p_name=>'P55_ID_PAIS_NTFCCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(136086847441460556)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9237158538762868)
,p_name=>'P55_ID_DPRTMNTO_NTFCCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(136086847441460556)
,p_item_default=>'F_ID_DPRTMNTO_CLNTE'
,p_item_default_type=>'ITEM'
,p_prompt=>'Departamento'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_dprtmnto as d,',
'        a.id_dprtmnto as r',
'from df_s_departamentos a;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9237586527762871)
,p_name=>'P55_ID_MNCPIO_NTFCCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(136086847441460556)
,p_item_default=>'F_ID_MNCPIO_CLNTE'
,p_item_default_type=>'ITEM'
,p_prompt=>'Municipio'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_mncpio as d,',
'        a.id_mncpio as r',
'from df_s_municipios a',
'where a.id_dprtmnto = :P55_ID_DPRTMNTO_NTFCCION;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P55_ID_DPRTMNTO_NTFCCION'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9237968083762872)
,p_name=>'P55_DRCCION_NTFCCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(136086847441460556)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>' onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9238387999762872)
,p_name=>'P55_TLFNO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(136086847441460556)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9238706303762873)
,p_name=>'P55_CLLAR'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(136086847441460556)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9239172399762873)
,p_name=>'P55_ACTVO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(136086847441460556)
,p_item_default=>'S'
,p_prompt=>unistr('\00BFActivo?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO'
,p_lov=>'.'||wwv_flow_api.id(105710618312748017)||'.'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9239544480762874)
,p_name=>'P55_EMAIL'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(136086847441460556)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>8
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9239955782762874)
,p_name=>'P55_ESTDO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(136086847441460556)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(9240415348762955)
,p_computation_sequence=>10
,p_computation_item=>'P55_CDGO_SCRSAL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' ',
'   select  nvl(max(c004),0) + 1',
'     from apex_collections    a',
'    where collection_name     = ''SUCURSALES''',
' --     and seq_id              = :P55_SEQ_ID',
'      and n001                = :F_ID_INSTNCIA_FLJO; '))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9241116482762978)
,p_validation_name=>'Valida Nombre'
,p_validation_sequence=>40
,p_validation=>'P55_NMBRE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(9234382570762834)
,p_associated_item=>wwv_flow_api.id(9236390741762861)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9243160413762979)
,p_validation_name=>'Valida codigo de sucursal'
,p_validation_sequence=>50
,p_validation=>'P55_CDGO_SCRSAL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(9234382570762834)
,p_associated_item=>wwv_flow_api.id(9235967170762861)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9241567578762978)
,p_validation_name=>'Valida departamento'
,p_validation_sequence=>60
,p_validation=>'P55_ID_DPRTMNTO_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(9234382570762834)
,p_associated_item=>wwv_flow_api.id(9237158538762868)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9241992631762978)
,p_validation_name=>'Valida municipio'
,p_validation_sequence=>70
,p_validation=>'P55_ID_MNCPIO_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(9234382570762834)
,p_associated_item=>wwv_flow_api.id(9237586527762871)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9242323144762978)
,p_validation_name=>unistr('Valida direcci\00F3n ')
,p_validation_sequence=>90
,p_validation=>'P55_DRCCION_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(9234382570762834)
,p_associated_item=>wwv_flow_api.id(9237968083762872)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6355137509635301)
,p_validation_name=>'Valida correo'
,p_validation_sequence=>110
,p_validation=>'regexp_like (:P55_EMAIL,''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Ingrese un correo valido.'
,p_associated_item=>wwv_flow_api.id(9239544480762874)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6374285612938501)
,p_validation_name=>'validar formato de tefelono valido'
,p_validation_sequence=>120
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if length(:P55_TLFNO) != 7 then ',
unistr('        return ''El n\00FAmero de tel\00E9fono ingresado no es valido, por favor ingrese 7 n\00FAmeros'';  '),
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_api.id(9238387999762872)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6374378733938502)
,p_validation_name=>'validar formato de celular valido'
,p_validation_sequence=>130
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if length(:P55_CLLAR) != 10 then ',
unistr('        return ''El n\00FAmero de celular ingresado no es valido, por favor ingrese 10 n\00FAmeros'';    '),
'    elsif substr(:P55_CLLAR, 1, 1) != ''3'' then',
unistr('        return ''El n\00FAmero de celular ingresado no es valido, debe iniciar con 3'';    '),
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_api.id(9238706303762873)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9246248099762988)
,p_name=>'Carga responsable'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P55_IDNTFCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9246731084763011)
,p_event_id=>wwv_flow_api.id(9246248099762988)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9247158353763018)
,p_name=>'Al hacer clic en Regresar Cerrar Modal'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(9233906933762834)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9247650328763026)
,p_event_id=>wwv_flow_api.id(9247158353763018)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9247964043763026)
,p_name=>'Al cambiar actualizar en la temporal el nuevo valor'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P55_SEQ_ID,P55_PRNCPAL_S_N,P55_NMBRE,P55_ID_DPRTMNTO_NTFCCION,P55_ID_MNCPIO_NTFCCION,P55_DRCCION_NTFCCION,P55_TLFNO,P55_CLLAR,P55_ACTVO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9248475890763026)
,p_event_id=>wwv_flow_api.id(9247964043763026)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'actualizar_temporal(this);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9244214603762986)
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
'     into :P55_ID_SJTO_IMPSTO',
'        , :P55_NMBRE  ',
'        , :P55_PRNCPAL_S_N  ',
'        , :P55_CDGO_SCRSAL',
'        , :P55_ID_DPRTMNTO_NTFCCION',
'        , :P55_ID_MNCPIO_NTFCCION',
'        , :P55_DRCCION_NTFCCION',
'        , :P55_EMAIL',
'        , :P55_TLFNO',
'        , :P55_CLLAR',
'        , :P55_ACTVO ',
'        , :P55_ESTDO',
'     from apex_collections    a',
'    where collection_name     = ''SUCURSALES''',
'      and seq_id              = :P55_SEQ_ID',
'      and n001                = :F_ID_INSTNCIA_FLJO;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P55_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9245005798762986)
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
'        where --a.id_ssion         = :APP_SESSION and',
'          a.n001             = :F_ID_INSTNCIA_FLJO',
'          and a.c005             = ''SUCURSALES''',
'          and a.n002             = :P55_SEQ_ID;',
'    exception ',
'        when others then ',
'            v_id_tmpral    := null;',
'    end;',
'    ',
'    if :P55_SEQ_ID is null then ',
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
'                           values (:APP_SESSION,             :F_ID_INSTNCIA_FLJO,     :P55_SEQ_ID,               c_items.item_name,   ',
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
'where --a.id_ssion         = :APP_SESSION  and ',
'  a.n001             = :F_ID_INSTNCIA_FLJO',
'  and a.c005             = ''RESPONSABLE''',
'  and a.n001             = :P55_SEQ_ID ',
'  and :P55_SEQ_ID        is not null;'))
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9243879198762985)
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
'    if :P55_SEQ_ID is null then',
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
'               and a.n001            = :F_ID_INSTNCIA_FLJO',
'               and a.c004            = :P55_CDGO_SCRSAL;',
'        ',
'            if v_rgstros > 0 then',
'                raise_application_error(-20003, ''Sr(a). '' || :F_NMBRE_USRIO || '', la sucursal ya se encuentra agregada. Por favor valide e intente nuevamente'');  ',
'            end if;',
'        end;-- FIN Se valida si el resposable ya esta registrado      ',
'          ',
'        begin',
'            apex_collection.add_member(p_collection_name 	=> ''SUCURSALES''',
'                                     , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                     , p_c001				=> :P55_ID_SJTO_IMPSTO',
'									 , p_c002				=> :P55_NMBRE',
'									 , p_c003				=> :P55_PRNCPAL_S_N ',
'									 , p_c004				=> :P55_CDGO_SCRSAL',
'									 , p_c005				=> :P55_ID_DPRTMNTO_NTFCCION',
'									 , p_c006				=> :P55_ID_MNCPIO_NTFCCION',
'									 , p_c007				=> :P55_DRCCION_NTFCCION',
'									 , p_c008				=> :P55_EMAIL',
'									 , p_c009				=> :P55_TLFNO',
'									 , p_c010				=> :P55_CLLAR',
'									 , p_c011				=> :P55_ACTVO',
'                                     , p_c012				=> ''NUEVO'');',
'                                     ',
'            insert into gn_g_temporal   (id_ssion								,n001								,c001										,c002				',
'                                        ,c003									,c004								,c005										,c006				',
'                                        ,c007									,c008								,c009										,c010				',
'                                        ,c011									,c012								,c023)								',
'                                values (:F_ID_INSTNCIA_FLJO						,:F_ID_INSTNCIA_FLJO				,:P55_ID_SJTO_IMPSTO						,:P55_NMBRE',
'                                        ,:P55_PRNCPAL_S_N						,:P55_CDGO_SCRSAL					,:P55_ID_DPRTMNTO_NTFCCION					,:P55_ID_MNCPIO_NTFCCION',
'                                        ,:P55_DRCCION_NTFCCION					,:P55_EMAIL							,:P55_TLFNO									,:P55_CLLAR',
'                                        ,:P55_ACTVO								,''NUEVO''							,''SUCURSAL_NOVEDADES_PERSONA'');',
'                                    ',
'      end;         ',
'    end if;                    ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(9234382570762834)
,p_process_when=>'P55_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>'Sucursal agregada exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9245881179762987)
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
'        where --a.id_ssion         = :APP_SESSION and',
'           a.n001             = :F_ID_INSTNCIA_FLJO',
'          and a.c005             = ''SUCURSALES''',
'          and a.c002            =  :P55_NMBRE;',
'    exception ',
'        when others then ',
'            v_id_tmpral    := 0;',
'    end;',
'    ',
'    if :P55_SEQ_ID is null then ',
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
'           and a.n001            = :F_ID_INSTNCIA_FLJO',
'           and a.c002            = :P55_NMBRE',
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
,p_process_when_button_id=>wwv_flow_api.id(9234382570762834)
,p_process_when=>'P55_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>'Sucursal agregada exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9244634036762986)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update Sucursales'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_ttal         number;',
'    v_estdo        varchar2(20);',
'',
'begin',
'    ',
'   select count(*)',
'   into v_ttal',
'   from si_i_sujetos_sucursal',
'   where id_sjto_impsto = :P55_ID_SJTO_IMPSTO',
'       and cdgo_scrsal = :P55_CDGO_SCRSAL;',
'   ',
'   if v_ttal = 0 then',
'       v_estdo := ''NUEVO'';',
'   else',
'       v_estdo := ''ACTUALIZADO'';',
'   end if;',
'   ',
'    begin',
'        apex_collection.update_member(p_collection_name 	=> ''SUCURSALES''',
'                                     , p_seq     			=> :P55_SEQ_ID',
'                                     , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                     , p_c001				=> :P55_ID_SJTO_IMPSTO',
'									 , p_c002				=> :P55_NMBRE',
'									 , p_c003				=> :P55_PRNCPAL_S_N',
'                                 	 , p_c004				=> :P55_CDGO_SCRSAL',
'									 , p_c005				=> :P55_ID_DPRTMNTO_NTFCCION',
'									 , p_c006				=> :P55_ID_MNCPIO_NTFCCION',
'									 , p_c007				=> :P55_DRCCION_NTFCCION',
'									 , p_c008				=> :P55_EMAIL',
'									 , p_c009				=> :P55_TLFNO',
'									 , p_c010				=> :P55_CLLAR',
'									 , p_c011				=> :P55_ACTVO',
'                                     , p_c012				=> v_estdo);',
'',
'                        update gn_g_temporal ',
'                        set   c001		= :P55_ID_SJTO_IMPSTO		',
'                             ,c002		= :P55_NMBRE		',
'                             ,c003		= :P55_PRNCPAL_S_N		',
'                           --  ,c004		= :P55_CDGO_SCRSAL		',
'                             ,c005		= :P55_ID_DPRTMNTO_NTFCCION		',
'                             ,c006		= :P55_ID_MNCPIO_NTFCCION		',
'                             ,c007		= :P55_DRCCION_NTFCCION		',
'                             ,c008		= :P55_EMAIL		',
'                             ,c009		= :P55_TLFNO		',
'                             ,c010		= :P55_CLLAR		',
'                             ,c011		= :P55_ACTVO		',
'                             ,c012		=  v_estdo',
'                        where n001		= :F_ID_INSTNCIA_FLJO',
'                          --  and c001	= :P55_ID_SJTO_IMPSTO',
'                            and c004    = :P55_CDGO_SCRSAL',
'                            and c023    = ''SUCURSAL_NOVEDADES_PERSONA'';',
'',
'    ',
'    exception',
'        when others then ',
'            raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || '', ha ocurrido un error. Por favor valide e intente nuevamente'' );  ',
'    end;    ',
'end;    '))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(9233570110762825)
,p_process_when=>'P55_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'Sucursal actualizada exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9243476438762979)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar la modal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,BNT_APLICAR_CAMBIOS'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('Acci\00F3n Procesada con Exito')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9245406220762987)
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
'            where --a.id_ssion         = :APP_SESSION and',
'              a.n001             = :F_ID_INSTNCIA_FLJO',
'              and a.c005             = ''SUCURSALES''',
'              and a.n002             = :P55_SEQ_ID',
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
'             where --a.id_ssion       = :APP_SESSION and',
'               a.n001           = :F_ID_INSTNCIA_FLJO',
'               and a.c005           = ''SUCURSALES''',
'               and a.n002           = :P55_SEQ_ID',
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
'                               values (:APP_SESSION,             :F_ID_INSTNCIA_FLJO,     :P55_SEQ_ID,               v_item_nmbre,   ',
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
,p_process_when=>'P55_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
