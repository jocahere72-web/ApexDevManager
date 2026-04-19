prompt --application/pages/page_00117
begin
wwv_flow_api.create_page(
 p_id=>117
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('At\00EDpica Referencia')
,p_step_title=>unistr('At\00EDpica Referencia')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_css_file_urls=>'#IMAGE_PREFIX#css/infortributos/utilidades.css'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20201222101359'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(53704744092312211)
,p_plug_name=>unistr('At\00EDpica Referencia')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_atpca_rfrncia',
'     , cdgo_clnte',
'     , id_impsto',
'     , id_impsto_sbmpsto',
'     , rfrncia_igac',
'     , dscrpcion',
'     , id_prdo',
'     , id_prdio_dstno',
'     , cdgo_estrto',
'     , id_prdio_uso_slo',
'  from gi_d_atipicas_referencia',
' where cdgo_clnte        = :F_CDGO_CLNTE',
'   and id_impsto         = :P117_IMPSTO',
'   and id_impsto_sbmpsto = :P117_IMPSTO_SBMPSTO',
'   and id_prdo           = :P117_ID_PRDO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P117_IMPSTO,P117_IMPSTO_SBMPSTO,P117_ID_PRDO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P117_ID_PRDO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(26439969193183401)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>200
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
 p_id=>wwv_flow_api.id(53706518272312221)
,p_name=>'ID_ATPCA_RFRNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ATPCA_RFRNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(53707132199312222)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
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
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'F_CDGO_CLNTE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(53707745798312222)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P117_IMPSTO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(53708346852312222)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P117_IMPSTO_SBMPSTO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(53708903256312222)
,p_name=>'RFRNCIA_IGAC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RFRNCIA_IGAC'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Referencia IGAC'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_item_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_is_required=>true
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(53709502371312223)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P117_ID_PRDO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(53710168677312223)
,p_name=>'ID_PRDIO_DSTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDIO_DSTNO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Destino'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(170059178262214330)
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(53710773627312223)
,p_name=>'CDGO_ESTRTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ESTRTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Estrato'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(172389176370562101)
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(53711311640312223)
,p_name=>'ID_PRDIO_USO_SLO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDIO_USO_SLO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Uso'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(170020211613206555)
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(53922024577417602)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(53922190460417603)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(53705256745312216)
,p_internal_uid=>53705256745312216
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
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(53705672064312218)
,p_interactive_grid_id=>wwv_flow_api.id(53705256745312216)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(53705737469312218)
,p_report_id=>wwv_flow_api.id(53705672064312218)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1110320000580)
,p_view_id=>wwv_flow_api.id(53705737469312218)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(53922024577417602)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26445900368183772)
,p_view_id=>wwv_flow_api.id(53705737469312218)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(26439969193183401)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>307
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53706988379312221)
,p_view_id=>wwv_flow_api.id(53705737469312218)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(53706518272312221)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53707587516312222)
,p_view_id=>wwv_flow_api.id(53705737469312218)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(53707132199312222)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53708191467312222)
,p_view_id=>wwv_flow_api.id(53705737469312218)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(53707745798312222)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53708774481312222)
,p_view_id=>wwv_flow_api.id(53705737469312218)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(53708346852312222)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53709326309312223)
,p_view_id=>wwv_flow_api.id(53705737469312218)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(53708903256312222)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>154
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53709980966312223)
,p_view_id=>wwv_flow_api.id(53705737469312218)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(53709502371312223)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>137
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53710573547312223)
,p_view_id=>wwv_flow_api.id(53705737469312218)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(53710168677312223)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>278
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53711199170312223)
,p_view_id=>wwv_flow_api.id(53705737469312218)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(53710773627312223)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>57
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53711739925312224)
,p_view_id=>wwv_flow_api.id(53705737469312218)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(53711311640312223)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>205
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(53714427740349801)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_css_classes=>'parametroBusqueda1'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29541487623068504)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(53720166971358001)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'<i>',
unistr('    Funcionalidad que permite ingresar, consultar, modificar y eliminar las at\00EDpicas por referencia. <br/><br/>'),
unistr('    Seleccione el tributo, sub-tributo y per\00EDodo hacer clic en el bot\00F3n consultar, seguidamente se mostrar\00E1n los datos correspondientes a las at\00EDpicas por referencia, de acuerdo con los par\00E1metros de b\00FAsqueda seleccionados.<br/><br/>'),
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(53720462805358004)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(53714427740349801)
,p_button_name=>'CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="top: 7px;left: -16px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>12
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53720209803358002)
,p_name=>'P117_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(53714427740349801)
,p_prompt=>'Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Impuesto'
,p_colspan=>5
,p_grid_column=>2
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista el tributo de liquidaci\00F3n.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'95%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53720361092358003)
,p_name=>'P117_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(53714427740349801)
,p_prompt=>'Sub-Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d',
'     , id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto  = :P117_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Sub-Impuesto'
,p_lov_cascade_parent_items=>'P117_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista el Sub-Tributo de liquidaci\00F3n.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'95%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54426633275420801)
,p_name=>'P117_ID_PRDO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(53714427740349801)
,p_prompt=>unistr('Per\00EDodo:')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select vgncia || ''-'' || prdo as l',
'      , id_prdo as v',
'   from df_i_periodos',
'  where cdgo_clnte        = :F_CDGO_CLNTE',
'    and id_impsto         = :P117_IMPSTO',
'    and id_impsto_sbmpsto = :P117_IMPSTO_SBMPSTO',
'order by vgncia desc',
'       , prdo'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>unistr('Seleccione Per\00EDodo')
,p_lov_cascade_parent_items=>'P117_IMPSTO,P117_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_colspan=>5
,p_grid_column=>2
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista el per\00EDodo de liquidaci\00F3n.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'95%'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(46447334268279213)
,p_validation_name=>'Validar Campo'
,p_validation_sequence=>10
,p_validation=>'P117_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Tributo debe tener alg\00FAn valor.')
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(53720209803358002)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(46357344597318805)
,p_validation_name=>'Validar Campo_1'
,p_validation_sequence=>20
,p_validation=>'P117_IMPSTO_SBMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Sub Tributo debe tener alg\00FAn valor.')
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(53720361092358003)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(46357438409318806)
,p_validation_name=>'Validar Campo_1_1'
,p_validation_sequence=>30
,p_validation=>'P117_ID_PRDO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Periodo debe tener alg\00FAn valor.')
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(54426633275420801)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(53922233121417604)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(53704744092312211)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('At\00EDpica Referencia - Save Interactive Grid Data')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CONSULTAR'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_process_success_message=>'Se han guardado los cambios.'
);
end;
/
