prompt --application/pages/page_00206
begin
wwv_flow_api.create_page(
 p_id=>206
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Sucursales'
,p_page_mode=>'MODAL'
,p_step_title=>'Sucursales'
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
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20210409082502'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(145226308147160391)
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
 p_id=>wwv_flow_api.id(9251782799326352)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(145226308147160391)
,p_button_name=>'BNT_APLICAR_CAMBIOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P206_SEQ_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9252109438326371)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(145226308147160391)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar / Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9252513353326371)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(145226308147160391)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P206_SEQ_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9252919540326374)
,p_name=>'P206_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(145226308147160391)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9253381074326424)
,p_name=>'P206_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(145226308147160391)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9253663997326424)
,p_name=>'P206_PRNCPAL_S_N'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(145226308147160391)
,p_item_default=>'S'
,p_prompt=>unistr('\00BFPrincipal?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(5646119019866897)||'.'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9254073433326425)
,p_name=>'P206_CDGO_SCRSAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(145226308147160391)
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
 p_id=>wwv_flow_api.id(9254439908326425)
,p_name=>'P206_NMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(145226308147160391)
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
 p_id=>wwv_flow_api.id(9254870894326426)
,p_name=>'P206_ID_PAIS_NTFCCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(145226308147160391)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9255215870326426)
,p_name=>'P206_ID_DPRTMNTO_NTFCCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(145226308147160391)
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
 p_id=>wwv_flow_api.id(9255672325326426)
,p_name=>'P206_ID_MNCPIO_NTFCCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(145226308147160391)
,p_prompt=>'Municipio'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_mncpio as d,',
'        a.id_mncpio as r',
'from df_s_municipios a',
'where a.id_dprtmnto = :P206_ID_DPRTMNTO_NTFCCION;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P206_ID_DPRTMNTO_NTFCCION'
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
 p_id=>wwv_flow_api.id(9256010343326427)
,p_name=>'P206_DRCCION_NTFCCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(145226308147160391)
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
 p_id=>wwv_flow_api.id(9256447452326428)
,p_name=>'P206_TLFNO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(145226308147160391)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9256852405326429)
,p_name=>'P206_CLLAR'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(145226308147160391)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9257294229326429)
,p_name=>'P206_ACTVO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(145226308147160391)
,p_item_default=>'S'
,p_prompt=>unistr('\00BFActivo?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(5646119019866897)||'.'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9257635273326429)
,p_name=>'P206_EMAIL'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(145226308147160391)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>8
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9258068784326429)
,p_name=>'P206_ESTDO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(145226308147160391)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(9258589387326454)
,p_computation_sequence=>10
,p_computation_item=>'P206_CDGO_SCRSAL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' ',
'   select  nvl(max(c004),0) + 1',
'     from apex_collections    a',
'    where collection_name     = ''SUCURSALES''',
'      and seq_id              = :P206_SEQ_ID; '))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9259309989326465)
,p_validation_name=>'Valida Nombre'
,p_validation_sequence=>40
,p_validation=>'P206_NMBRE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(9252513353326371)
,p_associated_item=>wwv_flow_api.id(9254439908326425)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9261386608326467)
,p_validation_name=>'Valida codigo de sucursal'
,p_validation_sequence=>50
,p_validation=>'P206_CDGO_SCRSAL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(9252513353326371)
,p_associated_item=>wwv_flow_api.id(9254073433326425)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9259721215326465)
,p_validation_name=>'Valida departamento'
,p_validation_sequence=>60
,p_validation=>'P206_ID_DPRTMNTO_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(9252513353326371)
,p_associated_item=>wwv_flow_api.id(9255215870326426)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9260137477326466)
,p_validation_name=>'Valida municipio'
,p_validation_sequence=>70
,p_validation=>'P206_ID_MNCPIO_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(9252513353326371)
,p_associated_item=>wwv_flow_api.id(9255672325326426)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9260571145326466)
,p_validation_name=>unistr('Valida direcci\00F3n ')
,p_validation_sequence=>80
,p_validation=>'P206_DRCCION_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(9252513353326371)
,p_associated_item=>wwv_flow_api.id(9256010343326427)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9258985607326459)
,p_validation_name=>'Valida Telefono'
,p_validation_sequence=>90
,p_validation=>'P206_TLFNO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(9252513353326371)
,p_associated_item=>wwv_flow_api.id(9256447452326428)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9260909373326467)
,p_validation_name=>'Valida Correo'
,p_validation_sequence=>100
,p_validation=>'regexp_like (:P206_EMAIL, ''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Ingrese un correo valido.'
,p_when_button_pressed=>wwv_flow_api.id(9252513353326371)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9264423238326483)
,p_name=>'Carga responsable'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P206_IDNTFCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9264915256326489)
,p_event_id=>wwv_flow_api.id(9264423238326483)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9265370392326494)
,p_name=>'Al hacer clic en Regresar Cerrar Modal'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(9252109438326371)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9265807927326496)
,p_event_id=>wwv_flow_api.id(9265370392326494)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9266203415326496)
,p_name=>'Al cambiar actualizar en la temporal el nuevo valor'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P206_SEQ_ID,P206_PRNCPAL_S_N,P206_NMBRE,P206_ID_DPRTMNTO_NTFCCION,P206_ID_MNCPIO_NTFCCION,P206_DRCCION_NTFCCION,P206_TLFNO,P206_CLLAR,P206_ACTVO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9266738825326496)
,p_event_id=>wwv_flow_api.id(9266203415326496)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'actualizar_temporal(this);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9262462325326477)
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
'     into :P206_ID_SJTO_IMPSTO',
'        , :P206_NMBRE  ',
'        , :P206_PRNCPAL_S_N  ',
'        , :P206_CDGO_SCRSAL',
'        , :P206_ID_DPRTMNTO_NTFCCION',
'        , :P206_ID_MNCPIO_NTFCCION',
'        , :P206_DRCCION_NTFCCION',
'        , :P206_EMAIL',
'        , :P206_TLFNO',
'        , :P206_CLLAR',
'        , :P206_ACTVO ',
'        , :P206_ESTDO',
'     from apex_collections    a',
'    where collection_name     = ''SUCURSALES''',
'      and seq_id              = :P206_SEQ_ID;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P206_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9263257694326481)
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
'        where a.id_ssion         = :APP_SESSION ',
'          and a.c005             = ''SUCURSALES''',
'          and a.n002             = :P206_SEQ_ID;',
'    exception ',
'        when others then ',
'            v_id_tmpral    := null;',
'    end;',
'    ',
'    if :P206_SEQ_ID is null then ',
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
'                           values (:APP_SESSION,             :F_ID_INSTNCIA_FLJO,     :P206_SEQ_ID,               c_items.item_name,   ',
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
'where a.id_ssion         = :APP_SESSION ',
'  and a.c005             = ''RESPONSABLE''',
'  and a.n001             = :P206_SEQ_ID ',
'  and :P206_SEQ_ID        is not null;'))
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9262035446326476)
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
'    if :P206_SEQ_ID is null then',
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
'             where collection_name   = ''SUCURSALES'' ',
'               and a.c004            = :P206_CDGO_SCRSAL;',
'        ',
'            if v_rgstros > 0 then',
'                raise_application_error(-20003, ''Sr(a). '' || :F_NMBRE_USRIO || '', la sucursal ya se encuentra agregada. Por favor valide e intente nuevamente'');  ',
'            end if;',
'        end;-- FIN Se valida si el resposable ya esta registrado      ',
'          ',
'        begin',
'            apex_collection.add_member(p_collection_name 	=> ''SUCURSALES''',
'                                     , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                     , p_c001				=> :P206_ID_SJTO_IMPSTO',
'									 , p_c002				=> :P206_NMBRE',
'									 , p_c003				=> :P206_PRNCPAL_S_N ',
'									 , p_c004				=> :P206_CDGO_SCRSAL',
'									 , p_c005				=> :P206_ID_DPRTMNTO_NTFCCION',
'									 , p_c006				=> :P206_ID_MNCPIO_NTFCCION',
'									 , p_c007				=> :P206_DRCCION_NTFCCION',
'									 , p_c008				=> :P206_EMAIL',
'									 , p_c009				=> :P206_TLFNO',
'									 , p_c010				=> :P206_CLLAR',
'									 , p_c011				=> :P206_ACTVO',
'                                     , p_c012				=> ''NUEVO'');',
'      end;         ',
'    end if;                    ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(9252513353326371)
,p_process_when=>'P206_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>'Responsable agregado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9264069607326482)
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
'        where a.id_ssion         = :APP_SESSION ',
'          and a.c005             = ''SUCURSALES''',
'          and a.c002            =  :P206_NMBRE;',
'    exception ',
'        when others then ',
'            v_id_tmpral    := 0;',
'    end;',
'    ',
'    if :P206_SEQ_ID is null then ',
'        v_estdo    := ''NUEVO'';',
'    else',
'        v_estdo    := ''ACTUALIZACION'';',
'    end if;',
'    ',
'     begin',
'        select seq_id',
'          into v_seq_id',
'         from apex_collections   a',
'         where collection_name   = ''SUCURSALES'' ',
'           and a.c002            = :P206_NMBRE',
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
,p_process_when_button_id=>wwv_flow_api.id(9252513353326371)
,p_process_when=>'P206_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>'Responsable agregado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9262814845326479)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update Sucursales'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'   ',
'    begin',
'        apex_collection.update_member(p_collection_name 	=> ''SUCURSALES''',
'                                     , p_seq     			=> :P206_SEQ_ID',
'                                     , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                     , p_c001				=> :P206_ID_SJTO_IMPSTO',
'									 , p_c002				=> :P206_NMBRE',
'									 , p_c003				=> :P206_PRNCPAL_S_N',
'                                 	 , p_c004				=> :P206_CDGO_SCRSAL',
'									 , p_c005				=> :P206_ID_DPRTMNTO_NTFCCION',
'									 , p_c006				=> :P206_ID_MNCPIO_NTFCCION',
'									 , p_c007				=> :P206_DRCCION_NTFCCION',
'									 , p_c008				=> :P206_EMAIL',
'									 , p_c009				=> :P206_TLFNO',
'									 , p_c010				=> :P206_CLLAR',
'									 , p_c011				=> :P206_ACTVO',
'                                     , p_c012				=> ''ACTUALIZADO'');',
'    exception',
'        when others then ',
'            raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || '', ha ocurrido un error. Por favor valide e intente nuevamente'' );  ',
'    end;    ',
'end;    '))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(9251782799326352)
,p_process_when=>'P206_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'Responsable actualizado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9261647440326470)
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
 p_id=>wwv_flow_api.id(9263601937326481)
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
'              and a.n002             = :P206_SEQ_ID',
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
'               and a.n002           = :P206_SEQ_ID',
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
'                               values (:APP_SESSION,             :F_ID_INSTNCIA_FLJO,     :P206_SEQ_ID,               v_item_nmbre,   ',
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
,p_process_when=>'P206_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
