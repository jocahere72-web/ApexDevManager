prompt --application/pages/page_00116
begin
wwv_flow_api.create_page(
 p_id=>116
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('At\00EDpicas Rurales')
,p_step_title=>unistr('At\00EDpicas Rurales')
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
 p_id=>wwv_flow_api.id(71063372699234201)
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
 p_id=>wwv_flow_api.id(71064035565234208)
,p_plug_name=>unistr('At\00EDpicas Rurales')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_atpca_rrles',
'     , cdgo_clnte',
'     , id_impsto',
'     , id_impsto_sbmpsto',
'     , id_prdo',
'     , cdgo_prdio_clsfccion',
'     , cdgo_dstno_igac',
'     , id_prdio_dstno',
'     , trfa',
'from gi_d_atipicas_rurales',
'where cdgo_clnte        =   :F_CDGO_CLNTE',
'  and id_impsto         =   :P116_IMPSTO',
'  and id_impsto_sbmpsto =   :P116_IMPSTO_SBMPSTO',
'  and id_prdo           =   :P116_ID_PRDO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71064225339234210)
,p_name=>'ID_ATPCA_RRLES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ATPCA_RRLES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71064354521234211)
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'&F_CDGO_CLNTE.'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71064412773234212)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P116_IMPSTO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71064510753234213)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P116_IMPSTO_SBMPSTO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71064645922234214)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P116_ID_PRDO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71064798201234215)
,p_name=>'CDGO_PRDIO_CLSFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_PRDIO_CLSFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Clasificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(170000125035201240)
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71064845642234216)
,p_name=>'CDGO_DSTNO_IGAC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_DSTNO_IGAC'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Destino IGAC'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(170018707155206555)
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71064960612234217)
,p_name=>'ID_PRDIO_DSTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDIO_DSTNO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Destino'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71065044772234218)
,p_name=>'TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRFA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tarifa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999D99'
,p_item_attributes=>'onkeypress="return validarExpresion(event, ''numeroComa'');" onkeyup="formatNumber(event,{ precision: 2, thousand: ''.'',decimal: '','' });" '
,p_is_required=>true
,p_max_length=>8
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
 p_id=>wwv_flow_api.id(71065178239234219)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71065235090234220)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71065460985234222)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(71064104567234209)
,p_internal_uid=>71064104567234209
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
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
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
 p_id=>wwv_flow_api.id(71112061401510577)
,p_interactive_grid_id=>wwv_flow_api.id(71064104567234209)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(71112176638510577)
,p_report_id=>wwv_flow_api.id(71112061401510577)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71112602234510583)
,p_view_id=>wwv_flow_api.id(71112176638510577)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(71064225339234210)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71113125652510587)
,p_view_id=>wwv_flow_api.id(71112176638510577)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(71064354521234211)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71113669155510589)
,p_view_id=>wwv_flow_api.id(71112176638510577)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(71064412773234212)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71114123719510590)
,p_view_id=>wwv_flow_api.id(71112176638510577)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(71064510753234213)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71114638842510591)
,p_view_id=>wwv_flow_api.id(71112176638510577)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(71064645922234214)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71115124979510593)
,p_view_id=>wwv_flow_api.id(71112176638510577)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(71064798201234215)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>234
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71115669248510594)
,p_view_id=>wwv_flow_api.id(71112176638510577)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(71064845642234216)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>328
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71116155073510598)
,p_view_id=>wwv_flow_api.id(71112176638510577)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(71064960612234217)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>320
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71116642320510599)
,p_view_id=>wwv_flow_api.id(71112176638510577)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(71065044772234218)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>227
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71119652568573584)
,p_view_id=>wwv_flow_api.id(71112176638510577)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(71065178239234219)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71124013144579073)
,p_view_id=>wwv_flow_api.id(71112176638510577)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(71065460985234222)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71065667256234224)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>30
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
unistr('	Funcionalidad que permite ingresar, consultar, modificar y eliminar las at\00EDpicas rurales.'),
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(71063776580234205)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(71063372699234201)
,p_button_name=>'btn_consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-window-search'
,p_button_cattributes=>'style="margin-left: -28px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>12
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71063466564234202)
,p_name=>'P116_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(71063372699234201)
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
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Impuesto de liquidaci\00F3n.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'auto'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71063587765234203)
,p_name=>'P116_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(71063372699234201)
,p_prompt=>'Sub-Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d',
'     , id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto  = :P116_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Sub-Impuesto'
,p_lov_cascade_parent_items=>'P116_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('SubImpuesto de liquidaci\00F3n.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'auto'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71063618992234204)
,p_name=>'P116_ID_PRDO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(71063372699234201)
,p_prompt=>unistr('Per\00EDodo:')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select vgncia || ''-'' || prdo as l',
'      , id_prdo as v',
'   from df_i_periodos',
'  where cdgo_clnte        = :F_CDGO_CLNTE',
'    and id_impsto         = :P116_IMPSTO',
'    and id_impsto_sbmpsto = :P116_IMPSTO_SBMPSTO',
'order by vgncia desc',
'       , prdo'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>unistr('Seleccione Per\00EDodo')
,p_lov_cascade_parent_items=>'P116_IMPSTO,P116_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Periodo de liquidaci\00F3n.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'auto'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(46453605181339340)
,p_validation_name=>'Validar Campo'
,p_validation_sequence=>10
,p_validation=>'P116_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Tributo debe tener alg\00FAn valor.')
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(71063776580234205)
,p_associated_item=>wwv_flow_api.id(71063466564234202)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(46357577455318807)
,p_validation_name=>'Validar Campo_1'
,p_validation_sequence=>20
,p_validation=>'P116_IMPSTO_SBMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Sub Tributo debe tener alg\00FAn valor.')
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(71063776580234205)
,p_associated_item=>wwv_flow_api.id(71063587765234203)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(46357621186318808)
,p_validation_name=>'Validar Campo_1_1'
,p_validation_sequence=>30
,p_validation=>'P116_ID_PRDO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Priodo debe tener alg\00FAn valor.')
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(71063776580234205)
,p_associated_item=>wwv_flow_api.id(71063618992234204)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46356966221318801)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete muerto;',
'insert into muerto (v_001) values (:request);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'btn_consultar'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(71065391269234221)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(71064035565234208)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('At\00EDpicas Rurales: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'btn_consultar'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_only_for_changed_rows=>'N'
,p_process_success_message=>'Se han guardado los cambios.'
);
end;
/
