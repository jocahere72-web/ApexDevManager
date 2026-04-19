prompt --application/pages/page_00017
begin
wwv_flow_api.create_page(
 p_id=>17
,p_user_interface_id=>wwv_flow_api.id(103265655096132800)
,p_name=>'Detalle Usuario Sujetos-Tributo'
,p_page_mode=>'MODAL'
,p_step_title=>'Detalle Usuarios Sujetos Impuestos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20200805120050'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80806747512645815)
,p_plug_name=>'Detalle Usuario Sujeto-Impuesto'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'SG_G_USRIOS_SJTO_IMPSTO'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80807990055645827)
,p_plug_name=>unistr('Informaci\00F3n Gesti\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(80806747512645815)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(80808174139645829)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(80806747512645815)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(80808034267645828)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(80806747512645815)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P17_ID_USRIOS_SJTO_IMPSTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(80809644641645844)
,p_branch_name=>'Ir a Pagina 16'
,p_branch_action=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:RP,16::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80806928890645817)
,p_name=>'P17_ID_USRIOS_SJTO_IMPSTO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(80806747512645815)
,p_item_source_plug_id=>wwv_flow_api.id(80806747512645815)
,p_source=>'ID_USRIOS_SJTO_IMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80807081900645818)
,p_name=>'P17_ID_USRIO_SLCTUD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(80806747512645815)
,p_item_source_plug_id=>wwv_flow_api.id(80806747512645815)
,p_source=>'ID_USRIO_SLCTUD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80807104017645819)
,p_name=>'P17_ID_USRIO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(80806747512645815)
,p_item_source_plug_id=>wwv_flow_api.id(80806747512645815)
,p_prompt=>'Usuario'
,p_source=>'ID_USRIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_USUARIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro || ''['' || user_name || '']''  as d,',
'       id_usrio as r',
'  from v_sg_g_usuarios',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80807239928645820)
,p_name=>'P17_ID_IMPSTO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(80806747512645815)
,p_item_source_plug_id=>wwv_flow_api.id(80806747512645815)
,p_prompt=>'Tributo'
,p_source=>'ID_IMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_impsto,',
'        a.id_impsto',
'from    df_c_impuestos  a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80807359687645821)
,p_name=>'P17_ID_SJTO_IMPSTO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(80806747512645815)
,p_item_source_plug_id=>wwv_flow_api.id(80806747512645815)
,p_prompt=>unistr('Identificaci\00F3n')
,p_source=>'ID_SJTO_IMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.idntfccion_sjto,',
'        a.id_sjto_impsto',
'from    v_si_i_sujetos_impuesto   a',
'where   a.id_sjto_impsto    =   :P17_ID_SJTO_IMPSTO'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80807411002645822)
,p_name=>'P17_ID_USRIO_RGISTRA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(80807990055645827)
,p_item_source_plug_id=>wwv_flow_api.id(80806747512645815)
,p_prompt=>unistr('Usuario Registr\00F3')
,p_source=>'ID_USRIO_RGISTRA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_USUARIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro || ''['' || user_name || '']''  as d,',
'       id_usrio as r',
'  from v_sg_g_usuarios',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80807549843645823)
,p_name=>'P17_ID_USRIO_MDFCA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(80807990055645827)
,p_item_source_plug_id=>wwv_flow_api.id(80806747512645815)
,p_item_default=>'F_ID_USRIO'
,p_item_default_type=>'ITEM'
,p_prompt=>unistr('Usuario Ultima Modificaci\00F3n')
,p_source=>'ID_USRIO_MDFCA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_USUARIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro || ''['' || user_name || '']''  as d,',
'       id_usrio as r',
'  from v_sg_g_usuarios',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80807635152645824)
,p_name=>'P17_ACTVO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(80806747512645815)
,p_item_source_plug_id=>wwv_flow_api.id(80806747512645815)
,p_prompt=>'Activo'
,p_source=>'ACTVO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29996389003317116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80807792882645825)
,p_name=>'P17_FCHA_DGTA'
,p_source_data_type=>'TIMESTAMP'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(80807990055645827)
,p_item_source_plug_id=>wwv_flow_api.id(80806747512645815)
,p_prompt=>unistr('Fecha Registr\00F3')
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'FCHA_DGTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80807859911645826)
,p_name=>'P17_FCHA_MDFCA'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(80807990055645827)
,p_item_source_plug_id=>wwv_flow_api.id(80806747512645815)
,p_prompt=>unistr('Fecha Ultima Modificaci\00F3n')
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'FCHA_MDFCA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(80808237733645830)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(80808174139645829)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(80808389784645831)
,p_event_id=>wwv_flow_api.id(80808237733645830)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(80809443970645842)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar Usuario que Moifica'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    :P17_ID_USRIO_MDFCA := :F_ID_USRIO;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(80808034267645828)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(80808852843645836)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(80806747512645815)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Procesar pantalla Detalle Usuario Sujetos-Tributo'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(80808034267645828)
,p_process_success_message=>unistr('Acci\00F3n procesada con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(80806847420645816)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(80806747512645815)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Inicializar pantalla Detalle Usuario Sujetos-Tributo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
