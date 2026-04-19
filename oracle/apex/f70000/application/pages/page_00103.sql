prompt --application/pages/page_00103
begin
wwv_flow_api.create_page(
 p_id=>103
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Fechas de Vencimiento - Documentos Determinaci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Generaci\00F3n de Actos / Documentos del Lote de Determinaci\00F3n No. &P63_ID_DTRMNCION_LTE. - Documentos de Pago >> Fechas de Vencimiento')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200316222028'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35521133233233418)
,p_plug_name=>'Wirzard'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(164085715180707699)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_list_id=>wwv_flow_api.id(35444422273960683)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(164098974360707738)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35521710267233424)
,p_plug_name=>'Fechas de Vencimientos'
,p_parent_plug_id=>wwv_flow_api.id(35521133233233418)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select id_dtrmncion_fcha_vncmnto,',
'        id_dtrmncion_lte,',
'        fcha_vncmnto,',
'        txto',
'   from gi_g_dtrmncnes_fcha_vncmnto a',
'  where id_dtrmncion_lte = :P63_ID_DTRMNCION_LTE'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35521914749233426)
,p_name=>'ID_DTRMNCION_FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DTRMNCION_FCHA_VNCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35522061954233427)
,p_name=>'ID_DTRMNCION_LTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DTRMNCION_LTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P63_ID_DTRMNCION_LTE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35522196048233428)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de Vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_02=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'Y'
,p_attribute_06=>'2'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_item_attributes=>'onkeydown="return false"'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35522266761233429)
,p_name=>'TXTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Texto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35522305599233430)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35522468970233431)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(35521852368233425)
,p_internal_uid=>35521852368233425
,p_is_editable=>true
,p_edit_operations=>'i:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(35582635500557694)
,p_interactive_grid_id=>wwv_flow_api.id(35521852368233425)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(35582715753557695)
,p_report_id=>wwv_flow_api.id(35582635500557694)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35583275058557702)
,p_view_id=>wwv_flow_api.id(35582715753557695)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(35521914749233426)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35583758902557706)
,p_view_id=>wwv_flow_api.id(35582715753557695)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(35522061954233427)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35584180566557708)
,p_view_id=>wwv_flow_api.id(35582715753557695)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(35522196048233428)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35584630288557709)
,p_view_id=>wwv_flow_api.id(35582715753557695)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(35522266761233429)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35586659654566551)
,p_view_id=>wwv_flow_api.id(35582715753557695)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(35522305599233430)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(36597801440971605)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(35521710267233424)
,p_button_name=>'BTN_GNRAR_DCMNTO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Documentos'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(35521462065233421)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(35521133233233418)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-calendar-ban'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(35521361586233420)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(35521133233233418)
,p_button_name=>'BTN_SIGUIENTE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(35521270330233419)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(35521133233233418)
,p_button_name=>'BTN_ANTERIOR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103612327707757)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(35522701956233434)
,p_branch_name=>'Siguiente 104'
,p_branch_action=>'f?p=&APP_ID.:104:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(35521361586233420)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(35522618339233433)
,p_branch_name=>'Anterior 6'
,p_branch_action=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(35521270330233419)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36598465159971611)
,p_name=>'P103_ID_DCMNTO_LTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(35521710267233424)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47764539085414920)
,p_name=>'P103_FCHAS_VNCMNTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(35521710267233424)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(35522904103233436)
,p_tabular_form_region_id=>wwv_flow_api.id(35521710267233424)
,p_validation_name=>'Validar Fechas de Vencimientos en tasa mora'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_fcha_vlda        varchar2(1);',
'    v_id_impsto        number;',
'    v_count            number;',
'    v_fcha_vncmnto    date;',
'begin',
'    begin ',
'         select count(1)',
'           into v_count',
'           from v_gi_g_determinaciones_lote     a',
'           join df_i_periodos                   b on a.cdgo_clnte = b.cdgo_clnte',
'            and a.id_impsto                     = b.id_impsto',
'            and a.id_impsto_sbmpsto             = b.id_impsto_sbmpsto',
'            and (b.vgncia * 100 + b.prdo)       between (a.vgncia_hsta * 100 + a.prdo_hsta) ',
'                                                    and (a.vgncia_dsde * 100 + a.prdo_dsde)',
'            and b.fcha_vncmnto < sysdate',
'          where a.id_dtrmncion_lte = :P63_ID_DTRMNCION_LTE;',
'   end;',
'   ',
'    if v_count > 0 then',
'        begin ',
'            select id_impsto',
'              into v_id_impsto',
'              from gi_g_determinaciones_lote ',
'             where id_dtrmncion_lte = :P63_ID_DTRMNCION_LTE;',
'',
'             v_fcha_vlda := pkg_gn_generalidades.fnc_vl_fcha_vncmnto_tsas_mra (:F_CDGO_CLNTE, v_id_impsto, to_date(:FCHA_VNCMNTO));    ',
'        exception ',
'             when others then',
'                 return false;',
'        end; ',
'        ',
'        if v_fcha_vlda = ''S''  then',
'            return true;',
'        else ',
'            return false;',
'        end if; ',
'    else ',
'        select min(b.fcha_vncmnto)',
'          into v_fcha_vncmnto',
'          from v_gi_g_determinaciones_lote     a',
'          join df_i_periodos                   b on a.cdgo_clnte = b.cdgo_clnte',
'           and a.id_impsto                     = b.id_impsto',
'           and a.id_impsto_sbmpsto             = b.id_impsto_sbmpsto',
'           and (b.vgncia * 100 + b.prdo)       between (a.vgncia_dsde * 100 + a.prdo_dsde) ',
'                                                   and (a.vgncia_hsta * 100 + a.prdo_hsta)',
'         where a.id_dtrmncion_lte = :P63_ID_DTRMNCION_LTE;',
'        ',
'        if v_fcha_vncmnto >= to_date(:FCHA_VNCMNTO) then',
'            return true;',
'        else',
'            return false;',
'        end if;',
'    end if;',
'    ',
'              ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('La fecha de Vencimiento seleccionada no es valida. Por favor revise las par\00E1metrizaci\00F3n de Tasas Mora')
,p_only_for_changed_rows=>'N'
,p_associated_column=>'FCHA_VNCMNTO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(35523151327233438)
,p_tabular_form_region_id=>wwv_flow_api.id(35521710267233424)
,p_validation_name=>'Validar Fecha de Vencimiento no Repetida'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_encntro number := 0;',
'begin',
'    begin',
'        select 1',
'          into v_encntro',
'          from gi_g_dtrmncnes_fcha_vncmnto ',
'         where id_dtrmncion_lte = :P63_ID_DTRMNCION_LTE',
'           and fcha_vncmnto = :FCHA_VNCMNTO;',
'    exception ',
'        when others then',
'            v_encntro := 0;',
'    end;',
'',
'     if v_encntro > 0 then ',
'         return false;',
'     else',
'         return true;',
'     end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'La fecha de Vencimiento ingresada ya se encuentra registrada para este lote.'
,p_associated_column=>'FCHA_VNCMNTO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(35695425367452209)
,p_validation_name=>'Validar que existan Fechas de Vencimiento'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_dtrmncion_fcha_vncmnto',
'  from gi_g_dtrmncnes_fcha_vncmnto',
' where id_dtrmncion_lte = :P63_ID_DTRMNCION_LTE'))
,p_validation_type=>'EXISTS'
,p_error_message=>'Para poder continuar debe ingresar por lo menos una fecha de vencimiento'
,p_always_execute=>'Y'
,p_validation_condition=>'BTN_SIGUIENTE,BTN_GNRAR_DCMNTO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(36598303344971610)
,p_validation_name=>unistr('Validar Exiten Documento para el lote de la determinaci\00F3n')
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmro_dcmntos number;',
'begin',
'    select count(a.id_dcmnto) nmro_dcmntos',
'      into v_nmro_dcmntos',
'      from gi_g_determinaciones_dcmnto    a',
'      join re_g_documentos                b on a.id_dcmnto = b.id_dcmnto',
'     where a.id_dtrmncion_lte = :P63_ID_DTRMNCION_LTE;',
'     ',
'     if v_nmro_dcmntos > 0 then ',
'         return true;',
'     else',
'     return false;',
'     end if;',
'exception ',
'    when others then ',
'        return false;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Para poder continuar primero se debe generar los documentos de pagos.'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(35521361586233420)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(35521596826233422)
,p_name=>'Cerrar Modal'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(35521462065233421)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35521694529233423)
,p_event_id=>wwv_flow_api.id(35521596826233422)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(36598181442971608)
,p_name=>unistr('Generaci\00F3n de Documentos')
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(36597801440971605)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47764709659414922)
,p_event_id=>wwv_flow_api.id(36598181442971608)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(id_dtrmncion_fcha_vncmnto)',
'  into :P103_FCHAS_VNCMNTO',
'  from gi_g_dtrmncnes_fcha_vncmnto',
' where id_dtrmncion_lte = :P63_ID_DTRMNCION_LTE;'))
,p_attribute_02=>'P103_FCHAS_VNCMNTO'
,p_attribute_03=>'P103_FCHAS_VNCMNTO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(36598242658971609)
,p_event_id=>wwv_flow_api.id(36598181442971608)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($v(''P103_FCHAS_VNCMNTO'') > 0 ){',
'    if($v(''P103_ID_DCMNTO_LTE'')){',
unistr('        apex.message.confirm(''Este lote de determinaci\00F3n ya tiene documentos generados. \00BFEst\00E1 seguro que desea generar los documentos nuevamente?'', function(ok){'),
'            if(ok){',
'                console.log("acepto");',
'                generarDocumentos();',
'            }',
'',
'',
'        });',
'    }else {',
'        generarDocumentos();',
'    }',
'} else {',
'    apex.message.alert(''Para poder generar los documentos debe ingresar por lo menos una fecha de vencimiento'');',
'}',
'    ',
'',
'',
'',
'',
'async function generarDocumentos(){    ',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        await apex.server.process(''Generar_Documentos'',{',
'            pageItems:''#P63_ID_DTRMNCION_LTE''',
'        }).then((resp)=>{',
'            apex.message.alert(resp.msg)',
'        }); ',
'    }catch(e){',
'         console.log(e);',
'    }finally{',
'         $waitPopup.remove();',
'    }',
'      ',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(35522543880233432)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(35521710267233424)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Fechas de Vencimientos - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(36598547989971612)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar el id_dcmnto_lte de la determinaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    /*select max(b.id_dcmnto_lte)',
'       into :P103_ID_DCMNTO_LTE',
'       from gi_g_determinaciones_dcmnto    a',
'       join re_g_documentos                b on a.id_dcmnto = b.id_dcmnto',
'      where a.id_dtrmncion_lte = :P63_ID_DTRMNCION_LTE;;*/',
'      select id_dcmnto_lte',
'        into :P103_ID_DCMNTO_LTE',
'       from gi_g_determinaciones_lote a',
'       where a.id_dtrmncion_lte = :P63_ID_DTRMNCION_LTE;',
'    exception',
'        when others then',
'            :P103_ID_DCMNTO_LTE := null;',
'end;      '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(36598042089971607)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_Documentos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(1000);',
'    v_cntdad_dcmnto      number := 0;',
'    v_dcmnto_lte         number;',
'',
'begin',
'    pkg_gi_determinacion.prc_gn_determinacion_documento (p_cdgo_clnte 		   => :F_CDGO_CLNTE, ',
'                                                         p_id_dtrmncion_lte    => :P63_ID_DTRMNCION_LTE,',
'                                                         p_id_usrio			   => :F_ID_USRIO,',
'                                                         o_id_dcmnto_lte       => v_dcmnto_lte,',
'                                                         o_cntdad_dcmnto       => v_cntdad_dcmnto,',
'                                                         o_cdgo_rspsta         => v_cdgo_rspsta,',
'                                                         o_mnsje_rspsta        => v_mnsje_rspsta);',
'    ',
'    ',
'    apex_json.open_object;',
'    if v_cdgo_rspsta = 0 then',
'        :P103_ID_DCMNTO_LTE := v_dcmnto_lte;',
'        if APEX_COLLECTION.COLLECTION_EXISTS (p_collection_name => ''RANGO_IMPRESION'') then',
'            APEX_COLLECTION.DELETE_COLLECTION (p_collection_name=>''RANGO_IMPRESION'');',
'        end if;',
'        apex_json.write(''type'', ''OK'');',
unistr('        apex_json.write(''msg'', ''Generaci\00F3n de documentos Exitosa. Se generaron '' || v_cntdad_dcmnto || '' documentos''); '),
'    else        ',
'        apex_json.write(''type'', ''ERROR'');',
'        apex_json.write(''msg'', ''Error al generar los documentos. ''|| v_mnsje_rspsta  ); ',
'    end if;',
'    apex_json.close_object;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
