prompt --application/pages/page_00144
begin
wwv_flow_api.create_page(
 p_id=>144
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Motivos de exenci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Motivos de exenci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'JRANGEL'
,p_last_upd_yyyymmddhh24miss=>'20201130175412'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(167211509938845643)
,p_plug_name=>unistr('Motivos de exenci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(79563779995385546)
,p_plug_name=>'Conceptos'
,p_parent_plug_id=>wwv_flow_api.id(167211509938845643)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select e.id_exncion_cncpto',
'        , c.dscrpcion_cncpto',
'        , (c.vlor_lqddo + c.vlor_intres) vlor_cncpto',
'        , e.prcntje_exncion',
'        , (c.vlor_lqddo + c.vlor_intres) * (e.prcntje_exncion / 100) vlor_exnto',
'        , (c.vlor_lqddo + c.vlor_intres) - (c.vlor_lqddo + c.vlor_intres) * (e.prcntje_exncion / 100) vlor_ttal',
'     from gi_g_rentas                   a',
'     join gi_g_rentas_acto              b on a.id_rnta      = b.id_rnta',
'     join v_gi_g_rentas_acto_concepto   c on b.id_rnta_acto = c.id_rnta_acto',
'     join df_i_exenciones               d on a.cdgo_clnte   = d.cdgo_clnte',
'      and d.id_exncion                  = :P144_ID_EXNCION',
'     join df_i_exenciones_concepto      e on d.id_exncion   = e.id_exncion',
'      and a.id_impsto                   = e.id_impsto',
'      and a.id_impsto_sbmpsto           = e.id_impsto_sbmpsto',
'      and c.id_cncpto                   = e.id_cncpto',
'    where a.id_rnta                     = :P136_ID_RNTA',
'      ;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(79563981872385548)
,p_name=>'ID_EXNCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EXNCION_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(79564053944385549)
,p_name=>'VLOR_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(79564186465385550)
,p_name=>'PRCNTJE_EXNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCNTJE_EXNCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('% Exenci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_03=>'center'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(80926961419670801)
,p_name=>'VLOR_EXNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_EXNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Exenci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(80927082577670802)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor a Pagar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(80927390238670805)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(79563890249385547)
,p_internal_uid=>79563890249385547
,p_is_editable=>false
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
 p_id=>wwv_flow_api.id(80932574834671465)
,p_interactive_grid_id=>wwv_flow_api.id(79563890249385547)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(80932648391671466)
,p_report_id=>wwv_flow_api.id(80932574834671465)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6394640089230)
,p_view_id=>wwv_flow_api.id(80932648391671466)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(80927390238670805)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>494
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80933124969671471)
,p_view_id=>wwv_flow_api.id(80932648391671466)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(79563981872385548)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80933664594671474)
,p_view_id=>wwv_flow_api.id(80932648391671466)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(79564053944385549)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>156.75
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80934176204671476)
,p_view_id=>wwv_flow_api.id(80932648391671466)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(79564186465385550)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80934608359671478)
,p_view_id=>wwv_flow_api.id(80932648391671466)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(80926961419670801)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>136
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80935112878671480)
,p_view_id=>wwv_flow_api.id(80932648391671466)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(80927082577670802)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(51772000002)
,p_view_id=>wwv_flow_api.id(80932648391671466)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(80927082577670802)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(227974000012)
,p_view_id=>wwv_flow_api.id(80932648391671466)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(79564053944385549)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(338522000012)
,p_view_id=>wwv_flow_api.id(80932648391671466)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(80926961419670801)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(86191743427257700)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(167211509938845643)
,p_button_name=>'BTN_VER_PLANILLA_EXENCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103612327707757)
,p_button_image_alt=>unistr('Planilla Certificado de Exenci\00F3n')
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:152:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>3
,p_grid_column=>6
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(80888193140052413)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(167211509938845643)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar / Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(80888448269052418)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(167211509938845643)
,p_button_name=>'BTN_PROYECTAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Aprobar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro que desea proyectar estÃ¡ solicitud con los datos seleccionados?'', ''BTN_PROYECTAR'');'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(80890678635052472)
,p_branch_name=>'Ir a Inicio'
,p_branch_action=>'f?p=&APP_ID.:135:&SESSION.::&DEBUG.:RP,136,137::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(80888448269052418)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79563596853385544)
,p_name=>'P144_ID_EXNCION_MTVO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(167211509938845643)
,p_prompt=>unistr('Motivos de exenci\00F3n')
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select b.nmtcnco ||'' - ''|| b.mtvo a, b.id_exncion_mtvo b',
'     from v_df_i_exenciones a',
'     join v_df_i_exenciones_motivo b on a.id_exncion = b.id_exncion',
'      and b.id_exncion = :P144_ID_EXNCION',
'     order by a'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P144_ID_EXNCION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>100
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79563650580385545)
,p_name=>'P144_ID_EXNCION_SLCTUD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(167211509938845643)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80888875008052421)
,p_name=>'P144_ID_EXNCION'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(167211509938845643)
,p_prompt=>unistr('Exenci\00F3n')
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmtcnco ||'' - ''|| a.obsrvcion a',
'       ,a.id_exncion                    b',
'from v_df_i_exenciones           a ',
'join gf_g_exenciones_solicitud   b on b.id_exncion_slctud = :P144_ID_EXNCION_SLCTUD',
' and b.fcha_rgstro                 between a.fcha_incio and a.fcha_fin',
'join (select distinct a.id_exncion',
'      from   df_i_exenciones_concepto a',
'      where  a.id_impsto_sbmpsto    = :P144_ID_IMPSTO_SBMPSTO) c on a.id_exncion = c.id_exncion',
'where a.cdgo_clnte                  = :F_CDGO_CLNTE',
'order by a.nmtcnco'))
,p_lov_display_null=>'YES'
,p_cSize=>100
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83210728318346808)
,p_name=>'P144_ID_PLNTLLA'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(167211509938845643)
,p_prompt=>'Plantilla '
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select dscrpcion',
'        , id_plntlla',
'     from gn_d_plantillas ',
'    where cdgo_clnte        = :F_CDGO_CLNTE',
'      and id_prcso          = 90;'))
,p_cHeight=>1
,p_colspan=>5
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99383109263819901)
,p_name=>'P144_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(167211509938845643)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(88148509833033701)
,p_computation_sequence=>10
,p_computation_item=>'P144_ID_PLNTLLA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select min(id_plntlla)',
'     from gn_d_plantillas ',
'    where cdgo_clnte        = :F_CDGO_CLNTE',
'      and id_prcso          = 90;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(80927988608670811)
,p_validation_name=>'Validar Motivo no nulo'
,p_validation_sequence=>10
,p_validation=>'P144_ID_EXNCION_MTVO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor seleccione un Motivo '
,p_when_button_pressed=>wwv_flow_api.id(80888448269052418)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(80928005917670812)
,p_validation_name=>'Validar Valor exento mayor a 0'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select e.id_exncion_cncpto',
'     from gi_g_rentas                   a',
'     join gi_g_rentas_acto              b on a.id_rnta      = b.id_rnta',
'     join v_gi_g_rentas_acto_concepto   c on b.id_rnta_acto = c.id_rnta_acto',
'     join df_i_exenciones               d on a.cdgo_clnte   = d.cdgo_clnte',
'      and d.id_exncion                  = :P144_ID_EXNCION',
'     join df_i_exenciones_concepto      e on d.id_exncion   = e.id_exncion',
'      and a.id_impsto                   = e.id_impsto',
'      and a.id_impsto_sbmpsto           = e.id_impsto_sbmpsto',
'      and c.id_cncpto                   = e.id_cncpto',
'    where a.id_rnta                     = :P136_ID_RNTA'))
,p_validation_type=>'EXISTS'
,p_error_message=>unistr('Para aprobar la exenci\00F3n debe tener conceptos para aplicar exenci\00F3n. Por favor revise la parametrizaci\00F3n de exenciones')
,p_when_button_pressed=>wwv_flow_api.id(80888448269052418)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(80889621554052444)
,p_name=>'Cerrar Modal'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(80888193140052413)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(80890105803052468)
,p_event_id=>wwv_flow_api.id(80889621554052444)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(80927704111670809)
,p_name=>'Submit para refrescar la region de conceptos'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P144_ID_EXNCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(80927830919670810)
,p_event_id=>wwv_flow_api.id(80927704111670809)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(84211163492325501)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Proyeci\00F3n de Exenci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(1000);',
'    v_id_dcmnto          number;',
'    v_nmro_dcmnto        number;',
'begin',
'    pkg_gi_rentas.prc_gn_proyecion_exencion ( p_cdgo_clnte           => :F_CDGO_CLNTE',
'                                            , p_id_rnta              => :P136_ID_RNTA',
'                                            , p_id_exncion_slctud    => :P144_ID_EXNCION_SLCTUD',
'                                            , p_id_exncion			 => :P144_ID_EXNCION',
'                                            , p_id_exncion_mtvo		 => :P144_ID_EXNCION_MTVO',
'                                            , p_id_plntlla           => :P144_ID_PLNTLLA ',
'                                            , p_id_instncia_fljo     => :F_ID_INSTNCIA_FLJO',
'                                            , p_id_usrio             => :F_ID_USRIO',
'                                            , o_cdgo_rspsta          => v_cdgo_rspsta',
'                                            , o_mnsje_rspsta         => v_mnsje_rspsta);',
'   ',
'    if v_cdgo_rspsta != 0 then ',
'        raise_application_error(-20001, v_mnsje_rspsta );',
'    end if;',
'exception',
'    when others then ',
unistr('        raise_application_error(-20001, ''Error al registrar la proyeci\00F3n: '' ||'' - ''||to_char(sqlerrm));'),
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(80888448269052418)
);
end;
/
