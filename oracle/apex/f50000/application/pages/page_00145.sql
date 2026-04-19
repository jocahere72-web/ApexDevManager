prompt --application/pages/page_00145
begin
wwv_flow_api.create_page(
 p_id=>145
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Gesti\00F3n Destinos que no limitan el Impuesto')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Gesti\00F3n Destinos que no limitan el Impuesto')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(29525011823068496)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200120171817'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38757609064827650)
,p_plug_name=>'Contenido'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38871190440889410)
,p_plug_name=>'Botones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(38871330620889412)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(38871190440889410)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P145_ID_LMTE_DSTNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(38871563593889414)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(38871190440889410)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(38871226258889411)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(38871190440889410)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P145_ID_LMTE_DSTNO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(38871457478889413)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(38871190440889410)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_HELP'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿Esta seguro de eliminar el destino del Predio?'',''DELETE'');'
,p_button_condition=>'P145_ID_LMTE_DSTNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(38871946694889418)
,p_branch_name=>unistr('Ir a P\00E1gina 142')
,p_branch_action=>'f?p=&APP_ID.:142:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'DELETE,SAVE,CREATE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38870313088889402)
,p_name=>'P145_TRIBUTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(38757609064827650)
,p_item_default=>'P142_IMPSTO'
,p_item_default_type=>'ITEM'
,p_prompt=>'Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Tributo asociado al destino del predio. Ejemplo Impuesto Predial Unificado'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38870507604889404)
,p_name=>'P145_ID_LMTE_DSTNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(38757609064827650)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_LMTE_DSTNO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38870622841889405)
,p_name=>'P145_CDGO_PRDIO_CLSFCCION'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(38757609064827650)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Clasificaci\00F3n Predio:')
,p_source=>'CDGO_PRDIO_CLSFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CLASIFICACION_PREDIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_prdio_clsfccion d,',
'       cdgo_prdio_clsfccion  r   ',
'  from df_s_predios_clasificacion',
'  order by cdgo_prdio_clsfccion'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Clase del predio al que se le definir\00E1n las caracter\00EDsticas. Ejemplo Rural.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38870754070889406)
,p_name=>'P145_ID_PRDIO_DSTNO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(38757609064827650)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Predio Destino: '
,p_source=>'ID_PRDIO_DSTNO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d ,',
'       id_prdio_dstno r',
'  from df_i_predios_destino',
' where id_impsto=:P145_TRIBUTO',
'   order by id_prdio_dstno;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P145_TRIBUTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Escoja de la lista el destino del predio.Ejemplo Cultural'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38870840942889407)
,p_name=>'P145_FCHA_FNAL'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(38757609064827650)
,p_use_cache_before_default=>'NO'
,p_item_default=>'31/12/2020'
,p_prompt=>'Fecha Final:'
,p_source=>'FCHA_FNAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione una fecha final.'
,p_attribute_02=>'&P145_FCHA_INCIAL.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38870949468889408)
,p_name=>'P145_FCHA_INCIAL'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(38757609064827650)
,p_use_cache_before_default=>'NO'
,p_item_default=>'01/01/2020'
,p_prompt=>'Fecha Inicial:'
,p_source=>'FCHA_INCIAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione un fecha inicial. '
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38871041111889409)
,p_name=>'P145_CDGO_CLNTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(38757609064827650)
,p_use_cache_before_default=>'NO'
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(39444375824807908)
,p_validation_name=>'Validar Rangos de Fecha'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' v_id_lmte_dstno gi_d_limites_destino.id_lmte_dstno%type;',
'begin',
' ',
'    select id_lmte_dstno into v_id_lmte_dstno',
'      from gi_d_limites_destino a',
'     where a.cdgo_clnte           = :F_CDGO_CLNTE',
'       and a.cdgo_prdio_clsfccion = :P145_CDGO_PRDIO_CLSFCCION    ',
'       and a.id_prdio_dstno       = :P145_ID_PRDIO_DSTNO',
'       and (to_date(:P145_FCHA_INCIAL)  between  a.fcha_incial                and a.fcha_fnal',
'            or fcha_incial              between  to_date(:P145_FCHA_INCIAL)   and to_date(:P145_FCHA_FNAL))',
'       and (to_date(:P145_FCHA_FNAL)    between  a.fcha_incial                and a.fcha_fnal',
'            or fcha_fnal                between  to_date(:P145_FCHA_INCIAL)   and to_date(:P145_FCHA_FNAL));',
'     ',
'     if (v_id_lmte_dstno = :P145_ID_LMTE_DSTNO) then',
'         return true;',
'     else',
'         return false;',
'     end if;',
'     ',
'exception',
'     when no_data_found then ',
'          return false;',
'     when too_many_rows then',
'          return true;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El rango de fecha ingresado para este destino ya se encuentra registrado o abarca un rango existente.'
,p_validation_condition_type=>'NEVER'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(38871653113889415)
,p_name=>'Cerrar Modal'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(38871563593889414)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(38871724278889416)
,p_event_id=>wwv_flow_api.id(38871653113889415)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(38872168987889420)
,p_name=>'Al cambiar fecha inicio '
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P145_FCHA_INCIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(38872212708889421)
,p_event_id=>wwv_flow_api.id(38872168987889420)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P145_FCHA_FNAL").datepicker( ''option'' , ''minDate'' , $("#P145_FCHA_INCIAL").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(38870496085889403)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from GI_D_LIMITES_DESTINO'
,p_attribute_02=>'GI_D_LIMITES_DESTINO'
,p_attribute_03=>'P145_ID_LMTE_DSTNO'
,p_attribute_04=>'ID_LMTE_DSTNO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(38871886791889417)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of GI_D_LIMITES_DESTINO'
,p_attribute_02=>'GI_D_LIMITES_DESTINO'
,p_attribute_03=>'P145_ID_LMTE_DSTNO'
,p_attribute_04=>'ID_LMTE_DSTNO'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n Procesada.')
);
end;
/
