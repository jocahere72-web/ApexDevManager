prompt --application/pages/page_20240
begin
wwv_flow_api.create_page(
 p_id=>2024003
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Actualizar E-Mail - Celular'
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Actualizar E-Mail - Tel\00E9fono')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function SetValues() {',
'',
'    // Obtener valores de los campos registrados',
'    let emailRegistrado = apex.item("P2024003_EMAIL_REGISTRADO").getValue();',
'    let telefonoRegistrado = apex.item("P2024003_TLFNO_REGISTRADO").getValue();',
'    ',
'    // Validar que los valores no sean nulos o indefinidos',
'    if (emailRegistrado) {',
'        apex.item("P2024003_EMAIL_A_ACTUALIZAR").setValue(emailRegistrado);',
'    }',
'',
'    if (telefonoRegistrado) {',
'        apex.item("P2024003_TLFNO_A_ACTUALIZA").setValue(telefonoRegistrado);',
'    }',
'};',
''))
,p_javascript_code_onload=>'SetValues();'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'40%'
,p_dialog_chained=>'N'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JBADRAN'
,p_last_upd_yyyymmddhh24miss=>'20241008102113'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(441511031784227319)
,p_plug_name=>unistr('Informaci\00F3n del Contribuyente')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--large'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9143439181658508)
,p_plug_name=>unistr('<b>Tel\00E9fono</b>')
,p_parent_plug_id=>wwv_flow_api.id(441511031784227319)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(441947595698920514)
,p_plug_name=>'<b>E-Mail</b>'
,p_parent_plug_id=>wwv_flow_api.id(441511031784227319)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3714693848726575)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(441511031784227319)
,p_button_name=>'BTN_ACTUALIZAR_EMAIL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Actualizar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P2024003_ID_SJTO_IMPSTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(3722740719726605)
,p_branch_name=>'Regresar'
,p_branch_action=>'f?p=&APP_ID.:138:&SESSION.::&DEBUG.:RP:P138_EMAIL,P138_TLFNO:&P2024003_EMAIL_A_ACTUALIZAR.,&P2024003_TLFNO_A_ACTUALIZA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(3714693848726575)
,p_branch_sequence=>10
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P2024003_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3715021286726578)
,p_name=>'P2024003_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(441511031784227319)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3715492264726582)
,p_name=>'P2024003_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(441511031784227319)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3715897843726583)
,p_name=>'P2024003_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(441511031784227319)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3716293832726583)
,p_name=>'P2024003_BRANCH'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(441511031784227319)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3716964853726585)
,p_name=>'P2024003_EMAIL_REGISTRADO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(441947595698920514)
,p_prompt=>'<h4>E-Mail Registrado</h4>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P2024003_ID_SJTO_IMPSTO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3717359840726585)
,p_name=>'P2024003_EMAIL_A_ACTUALIZAR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(441947595698920514)
,p_prompt=>'<h4>Nuevo E-Mail</h4>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>300
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_display_when=>'P2024003_ID_SJTO_IMPSTO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9143526608658509)
,p_name=>'P2024003_TLFNO_REGISTRADO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9143439181658508)
,p_prompt=>'<h4>Celular Registrado</h4>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P2024003_ID_SJTO_IMPSTO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9143663031658510)
,p_name=>'P2024003_TLFNO_A_ACTUALIZA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(9143439181658508)
,p_prompt=>'<h4>Nuevo Celular</h4>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>300
,p_cMaxlength=>10
,p_tag_attributes=>'oninput="this.value = this.value.replace(/[^0-9]/g, '''');"'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_display_when=>'P2024003_ID_SJTO_IMPSTO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(3717810636726595)
,p_computation_sequence=>10
,p_computation_item=>'P2024003_EMAIL_REGISTRADO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select email  ',
'from si_i_sujetos_impuesto ',
'where id_sjto_impsto = :P2024003_ID_SJTO_IMPSTO;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(9143898000658512)
,p_computation_sequence=>20
,p_computation_item=>'P2024003_TLFNO_REGISTRADO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cllar',
'from si_i_sujetos_responsable ',
'where id_sjto_impsto = :P2024003_ID_SJTO_IMPSTO;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(3718211627726597)
,p_validation_name=>'Validar que correo que no este vacio'
,p_validation_sequence=>10
,p_validation=>'P2024003_EMAIL_A_ACTUALIZAR'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(3714693848726575)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(3718667705726598)
,p_validation_name=>'Validar que el correo sea valido'
,p_validation_sequence=>20
,p_validation=>'regexp_like (:P2024003_EMAIL_A_ACTUALIZAR, ''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Ingrese un Email valido.'
,p_when_button_pressed=>wwv_flow_api.id(3714693848726575)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9143913103658513)
,p_validation_name=>unistr('Validar que Tel\00E9fono que no este vac\00EDo')
,p_validation_sequence=>30
,p_validation=>'P2024003_TLFNO_A_ACTUALIZA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo Nuevo Tel\00E9fono vaci\00F3, por favor verifique')
,p_associated_item=>wwv_flow_api.id(9143663031658510)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(3840623844031204)
,p_validation_name=>unistr('Valida que el tel\00E9fono sea mayor o igual a 7 d\00EDgitos')
,p_validation_sequence=>40
,p_validation=>'LENGTH(:P2024003_TLFNO_A_ACTUALIZA) >= 7'
,p_validation_type=>'SQL_EXPRESSION'
,p_error_message=>unistr('El Tel\00E9fono debe tener como m\00EDnimo 7 d\00EDgitos.')
,p_when_button_pressed=>wwv_flow_api.id(3714693848726575)
,p_associated_item=>wwv_flow_api.id(9143663031658510)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3719394051726599)
,p_name=>'Ocultar / Mostrar Cuando es Persona Natural'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2024003_TPO_PRSNA'
,p_condition_element=>'P2024003_TPO_PRSNA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3719894500726601)
,p_event_id=>wwv_flow_api.id(3719394051726599)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2024003_PRMER_NMBRE,P2024003_SGNDO_NMBRE,P2024003_PRMER_APLLDO,P2024003_SGNDO_APLLDO,P2024003_CDGO_IDNTFCCION_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3720346529726602)
,p_event_id=>wwv_flow_api.id(3719394051726599)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2024003_NMBRE_RZON_SCIAL,P2024003_ID_SJTO_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3720846780726603)
,p_event_id=>wwv_flow_api.id(3719394051726599)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2024003_PRMER_NMBRE,P2024003_SGNDO_NMBRE,P2024003_PRMER_APLLDO,P2024003_SGNDO_APLLDO,P2024003_CDGO_IDNTFCCION_TPO,P118_SGNDO_NMBRE,P118_PRMER_APLLDO,P118_SGNDO_APLLDO,P118_CDGO_IDNTFCCION_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3721372302726603)
,p_event_id=>wwv_flow_api.id(3719394051726599)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2024003_NMBRE_RZON_SCIAL,P2024003_ID_SJTO_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3721787408726603)
,p_name=>unistr('Si el tipo de persona es Natural calcular el valor de raz\00F3n social')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2024003_PRMER_NMBRE,P2024003_SGNDO_NMBRE,P2024003_PRMER_APLLDO,P2024003_SGNDO_APLLDO'
,p_condition_element=>'P2024003_TPO_PRSNA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3722259539726604)
,p_event_id=>wwv_flow_api.id(3721787408726603)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    var rzon_scial ;',
'    rzon_scial = $v("P2024003_PRMER_NMBRE") + " " + $v("P2024003_SGNDO_NMBRE") + " " + $v("P2024003_PRMER_APLLDO") + " " + $v("P2024003_SGNDO_APLLDO");',
'    apex.item("P2024003_NMBRE_RZON_SCIAL").setValue(rzon_scial);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3718971421726598)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar Email'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    begin    ',
'        --Se actualiza el sujeto impuesto',
'        update si_i_sujetos_impuesto',
'        set    email		  =  :P2024003_EMAIL_A_ACTUALIZAR',
'			 , tlfno		  =  :P2024003_TLFNO_A_ACTUALIZA',
'        where id_sjto_impsto  =  :P2024003_ID_SJTO_IMPSTO ; ',
'',
'    exception',
'        when others then ',
'            raise_application_error(-20001, ''No se pudo actualizar los datos del sujeto impuesto.'');',
'     end;',
'',
'    begin',
'        --Se actualizan los responsables',
'        update si_i_sujetos_responsable',
'        set    email		  =  :P2024003_EMAIL_A_ACTUALIZAR',
'			 , cllar		  =	 :P2024003_TLFNO_A_ACTUALIZA',
'        where id_sjto_impsto  =  :P2024003_ID_SJTO_IMPSTO ; ',
'    exception',
'        when others then ',
'            raise_application_error(-20001, ''No se pudo actualizar los datos del Responsable.'');',
'            rollback;',
'    end;',
'',
'    begin',
'        -- Se actualiza el tercero',
'        update si_c_terceros',
'        set    email	 	  =  :P2024003_EMAIL_A_ACTUALIZAR',
'			 , cllar		  =	 :P2024003_TLFNO_A_ACTUALIZA		',
'        where idntfccion	  =  :P2024003_IDNTFCCION ; ',
'    exception',
'        when others then ',
'            raise_application_error(-20001, ''No se pudo actualizar los datos del Tercero.'');',
'            rollback;',
'    end;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(3714693848726575)
,p_process_success_message=>unistr('Informaci\00F3n actualizada correctamente')
);
end;
/
