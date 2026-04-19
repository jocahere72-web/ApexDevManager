prompt --application/pages/page_00128
begin
wwv_flow_api.create_page(
 p_id=>128
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Tipo Esquema Declaracion'
,p_step_title=>'Tipo Esquema Declaracion'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
''))
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20200311110737'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(62392672613394420)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
unistr('	Funcionalidad que permite ingresar, consultar, modificar y eliminar los tipos de esquema tarifario de declaraci\00F3n.'),
'<br><br>	',
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(62392763126394421)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(62430689657101302)
,p_plug_name=>unistr('Tipo Esquema Declaraci\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid,',
'       cdgo_dclrcns_esqma_trfa_tpo,',
'       id_dclrcns_esqma_trfa_tpo,',
'       cdgo_clnte,',
'       id_impsto,',
'       id_impsto_sbmpsto,',
'       nmbre_dclrcns_esqma_trfa_tpo,',
'       actvo',
'  from gi_d_dclrcns_esqma_trfa_tpo',
'  where cdgo_clnte = :F_CDGO_CLNTE ',
'     and  ((id_impsto = :P128_ID_IMPSTO) or :P128_ID_IMPSTO is null)',
'     and  ((id_impsto_sbmpsto = :P128_ID_IMPSTO_SBMPSTO) or :P128_ID_IMPSTO_SBMPSTO is null)',
'  ',
'  '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62392296137394416)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62392302150394417)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62392547930394419)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62432382371101363)
,p_name=>'ID_DCLRCNS_ESQMA_TRFA_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCNS_ESQMA_TRFA_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>true
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62432930483101364)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'F_CDGO_CLNTE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62433534087101364)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select initcap (nmbre_impsto) as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P128_ID_IMPSTO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62434178280101365)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Sub Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select initcap(nmbre_impsto_sbmpsto)  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
'  where id_impsto = :ID_IMPSTO',
'order by 1'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'ID_IMPSTO'
,p_ajax_items_to_submit=>'ID_IMPSTO'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62434758332101365)
,p_name=>'CDGO_DCLRCNS_ESQMA_TRFA_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_DCLRCNS_ESQMA_TRFA_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('C\00F3digo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_item_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'')" onkeyup="campoMayuscula(this)"'
,p_is_required=>true
,p_max_length=>3
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62435388478101372)
,p_name=>'NMBRE_DCLRCNS_ESQMA_TRFA_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DCLRCNS_ESQMA_TRFA_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n del Tipo de Esquema Tarifario')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>50
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62435939418101372)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>'Activo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'S'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(62431138344101328)
,p_internal_uid=>62431138344101328
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
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
 p_id=>wwv_flow_api.id(62431426902101338)
,p_interactive_grid_id=>wwv_flow_api.id(62431138344101328)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(62431526813101339)
,p_report_id=>wwv_flow_api.id(62431426902101338)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62432747148101364)
,p_view_id=>wwv_flow_api.id(62431526813101339)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(62432382371101363)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62433311073101364)
,p_view_id=>wwv_flow_api.id(62431526813101339)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(62432930483101364)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62433918300101365)
,p_view_id=>wwv_flow_api.id(62431526813101339)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(62433534087101364)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>267
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62434569578101365)
,p_view_id=>wwv_flow_api.id(62431526813101339)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(62434178280101365)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>288.8
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62435161864101372)
,p_view_id=>wwv_flow_api.id(62431526813101339)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(62434758332101365)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>82.8
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62435740630101372)
,p_view_id=>wwv_flow_api.id(62431526813101339)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(62435388478101372)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>363.4
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62436323757101373)
,p_view_id=>wwv_flow_api.id(62431526813101339)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(62435939418101372)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62450968085135174)
,p_view_id=>wwv_flow_api.id(62431526813101339)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(62392296137394416)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62455261672139917)
,p_view_id=>wwv_flow_api.id(62431526813101339)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(62392547930394419)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(62499029788542702)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(62392763126394421)
,p_button_name=>'CONSULTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62392817107394422)
,p_name=>'P128_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(62392763126394421)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select initcap (nmbre_impsto) as d,',
'       id_impsto as r',
'  from v_df_c_impuestos ',
' where cdgo_clnte = :F_CDGO_CLNTE',
' and id_impsto in (select distinct (id_impsto) ',
'                            from gi_d_dclrcns_esqma_trfa_tpo)',
' order by 1'))
,p_lov_display_null=>'YES'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62392915192394423)
,p_name=>'P128_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(62392763126394421)
,p_prompt=>'Sub Tributo '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select initcap(nmbre_impsto_sbmpsto)  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
'  where id_impsto = :P128_ID_IMPSTO',
'',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P128_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(62393243219394426)
,p_name=>'Limpiar'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(62392763126394421)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(62393328184394427)
,p_event_id=>wwv_flow_api.id(62393243219394426)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P128_ID_IMPSTO,P128_ID_IMPSTO_SBMPSTO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(62499119035542703)
,p_name=>'Al hacer clic en consultar'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(62499029788542702)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(62499205746542704)
,p_event_id=>wwv_flow_api.id(62499119035542703)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$redirect([''P128_ID_IMPSTO'',''P128_ID_IMPSTO_SBMPSTO''], [$v(''P128_ID_IMPSTO''),$v(''P128_ID_IMPSTO_SBMPSTO'')])'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(62392429230394418)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(62430689657101302)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Tipo Esquema Declaracion - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CONSULTAR'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
);
end;
/
