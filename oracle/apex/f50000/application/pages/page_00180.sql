prompt --application/pages/page_00180
begin
wwv_flow_api.create_page(
 p_id=>180
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Simulador'
,p_page_mode=>'MODAL'
,p_step_title=>'Simulador'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:t-Dialog--noPadding'
,p_dialog_height=>'400'
,p_dialog_width=>'80%'
,p_dialog_chained=>'N'
,p_overwrite_navigation_list=>'Y'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20201125180110'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98956825333819401)
,p_plug_name=>'Simulador de Tasa Diaria'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P180_TPO_SMLCION'
,p_plug_display_when_cond2=>'TSA_DRIA'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98956966113819402)
,p_plug_name=>unistr('Simulador de Inter\00E9s de Mora ')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P180_TPO_SMLCION'
,p_plug_display_when_cond2=>'INTRES'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(98957274270819405)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(98956825333819401)
,p_button_name=>'BTN_CALCULAR_TASA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Calcular'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-calculator'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98957028323819403)
,p_name=>'P180_TSA_ANUAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(98956825333819401)
,p_prompt=>'Tasa Anual'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98957161814819404)
,p_name=>'P180_TSA_DRIA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(98956825333819401)
,p_prompt=>'Tasa Diaria'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when=>'P180_TSA_ANUAL'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98957419044819407)
,p_name=>'P180_TPO_SMLCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(98956825333819401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98957918315819412)
,p_name=>'P180_FCHA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(98956825333819401)
,p_prompt=>'Fecha'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98958036101819413)
,p_name=>'P180_NMRO_DIAS_ANIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(98956825333819401)
,p_prompt=>unistr('N\00FAmero de d\00EDas del a\00F1o')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>5
,p_colspan=>2
,p_display_when=>'P180_CDGO_TPO_DIAS_ANIO'
,p_display_when2=>'DNM'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98958480386819417)
,p_name=>'P180_CDGO_TSA_DRIA_FRMLA'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(98956825333819401)
,p_prompt=>unistr('Formula de c\00E1lculo de tasa diaria')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_TASA_DIARIA_FORMULA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_tsa_dria_frmla as r',
'  from df_s_tasa_diaria_formula',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98958546709819418)
,p_name=>'P180_CDGO_TPO_DIAS_ANIO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(98956825333819401)
,p_prompt=>unistr('Forma de c\00E1lculo de n\00FAmero de d\00EDas del a\00F1o')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Din\00E1mico;DNM,Fijo;FJO')
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98958610709819419)
,p_name=>'P180_NMRO_DIAS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(98956825333819401)
,p_prompt=>unistr('N\00FAmero de D\00EDas')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98959417119819427)
,p_name=>'P180_FRMLA_TSA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(98956825333819401)
,p_prompt=>'Formula de Tasa Diaria'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_begin_on_new_line=>'N'
,p_display_when=>'P180_TSA_ANUAL'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(98959790583819430)
,p_validation_name=>'Validar que la fecha no sea nula'
,p_validation_sequence=>10
,p_validation=>'P180_FCHA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# no puede ser nulo'
,p_when_button_pressed=>wwv_flow_api.id(98957274270819405)
,p_associated_item=>wwv_flow_api.id(98957918315819412)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(98957779781819410)
,p_validation_name=>'Validar que la tasa anula no sea nula'
,p_validation_sequence=>20
,p_validation=>'P180_TSA_ANUAL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# no puede ser nulo'
,p_when_button_pressed=>wwv_flow_api.id(98957274270819405)
,p_associated_item=>wwv_flow_api.id(98957028323819403)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(98959534832819428)
,p_validation_name=>'Validar que el numero de dias no sea nulo cuando la formula de tipo de dias sea fijo'
,p_validation_sequence=>30
,p_validation=>'P180_NMRO_DIAS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# no puede ser nulo'
,p_validation_condition=>'P180_CDGO_TPO_DIAS_ANIO'
,p_validation_condition2=>'FJO'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(98957274270819405)
,p_associated_item=>wwv_flow_api.id(98958610709819419)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(98959118570819424)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P180_CDGO_TPO_DIAS_ANIO'
,p_condition_element=>'P180_CDGO_TPO_DIAS_ANIO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'FJO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(98959258361819425)
,p_event_id=>wwv_flow_api.id(98959118570819424)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P180_NMRO_DIAS'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(98959388560819426)
,p_event_id=>wwv_flow_api.id(98959118570819424)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P180_NMRO_DIAS'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98957614637819409)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calcular Valores'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'   :P180_NMRO_DIAS_ANIO        := pkg_gf_movimientos_financiero.fnc_cl_numero_dias_anio (p_cdgo_clnte            => :F_CDGO_CLNTE',
'                                                                                       , p_cdgo_tpo_dias_anio    => :P180_CDGO_TPO_DIAS_ANIO',
'                                                                                       , p_nmro_dias_anio        => :P180_NMRO_DIAS',
'                                                                                       , p_fcha                  => :P180_FCHA);',
'                                                                                    ',
'    :P180_TSA_DRIA := to_char(pkg_gf_movimientos_financiero.fnc_cl_tea_a_ted(p_cdgo_clnte							=> :F_CDGO_CLNTE',
'                                                                   , p_cdgo_intres_mra_frmla                => :P180_CDGO_TSA_DRIA_FRMLA',
'                                                                   , p_tsa_efctva_anual                     => :P180_TSA_ANUAL',
'                                                                   , p_nmro_dia_anio						=> :P180_NMRO_DIAS_ANIO), ''999G999G999G999G990D000000000000000'');',
'    begin',
'        select frmla',
'          into :P180_FRMLA_TSA',
'          from df_s_tasa_diaria_formula',
'         where cdgo_tsa_dria_frmla        = :P180_CDGO_TSA_DRIA_FRMLA;',
'    exception',
'        when others then ',
'            :P180_FRMLA_TSA := ''--'';',
'    end;',
'    ',
'     ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(98957274270819405)
);
end;
/
