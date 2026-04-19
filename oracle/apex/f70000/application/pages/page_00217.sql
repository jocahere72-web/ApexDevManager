prompt --application/pages/page_00217
begin
wwv_flow_api.create_page(
 p_id=>217
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Consulta De Retenciones'
,p_step_title=>'Consulta De Retenciones'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1',
'#APP_IMAGES#pdf-lib.min.js',
'#APP_IMAGES#FileSaver.min.js',
'#APP_IMAGES#jszip.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function validarItem() {',
'    ',
'    var idntfccion = $v("P217_IDNTFCCION");',
'',
'    if (idntfccion === "") {',
unistr('        var v_msje = "\00A1Debes digitar una identificaci\00F3n!";'),
'        apex.message.clearErrors();',
'        apex.message.alert(v_msje);',
'        return false;',
'    } else{',
'        return true;',
'    }',
'}'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20240611132321'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(28863642927172701)
,p_plug_name=>unistr('Par\00E1metros De Consulta')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(28864661920172711)
,p_plug_name=>'Opciones Right'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Opciones <i class="fa fa-gear" aria-hidden="true"></i></center></b></h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(28864750324172712)
,p_plug_name=>'Retenciones'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(164084128065707698)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(28864885798172713)
,p_plug_name=>'Retenciones Practicadas'
,p_parent_plug_id=>wwv_flow_api.id(28864750324172712)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (',
'select a.id_infrmcion_exgna,',
'       a.id_sjto_impsto,',
'       b.idntfccion_sjto,',
'      -- a.vgncia,',
'       trunc(a.fcha_dgta) as fcha_dgta,',
'    --   d.id_exgna_rtncion,',
'       case when  d.cdgo_exgna_tpo_rgstro = ''RP'' then',
'    ''Retenciones Practicadas'' end as tpo_rtncion,',
'       d.idntfccion,',
'       d.nmbre_rzon_scial,',
'       d.dscrpcion_cncpto,',
'       d.vlor_bse,',
'       d.trfa,',
'       d.vlor_rtncion,',
'       d.vgncia_rtncion,',
'       d.prdo',
'  from v_gi_g_informacion_exogena a',
'  join v_si_i_sujetos_impuesto b',
'    on b.id_sjto_impsto = a.id_sjto_impsto',
'  join si_i_personas p',
'    on p.id_sjto_impsto = a.id_sjto_impsto',
'  join gi_g_exogena_retenciones d',
'    on d.id_infrmcion_exgna = a.id_infrmcion_exgna',
'   and d.cdgo_exgna_tpo_rgstro = ''RP''',
' where b.idntfccion_sjto = :P217_IDNTFCCION',
'   and (a.vgncia = :P217_VGNCIA or :P217_VGNCIA is null)',
'   and a.fcha_dgta = (select max(c.fcha_dgta)',
'                        from gi_g_informacion_exogena c',
'                       where c.id_sjto_impsto = a.id_sjto_impsto',
'                         and c.vgncia = a.vgncia)',
'                         order by  d.vgncia_rtncion,',
'       d.prdo)'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28865198373172716)
,p_name=>'ID_INFRMCION_EXGNA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INFRMCION_EXGNA'
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
 p_id=>wwv_flow_api.id(28865269346172717)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(28865353755172718)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(28865587044172720)
,p_name=>'FCHA_DGTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_DGTA'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(28865801239172723)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>20
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
 p_id=>wwv_flow_api.id(28865933469172724)
,p_name=>'NMBRE_RZON_SCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RZON_SCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Raz\00F3n Social')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>500
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
 p_id=>wwv_flow_api.id(28866056286172725)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(28866172866172726)
,p_name=>'VLOR_BSE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_BSE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Base <br>Retenci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(28866254201172727)
,p_name=>'TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRFA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tarifa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(28866374885172728)
,p_name=>'VLOR_RTNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_RTNCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor <br>Retenci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(28866425564172729)
,p_name=>'VGNCIA_RTNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA_RTNCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(28866590989172730)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28868432224172749)
,p_name=>'TPO_RTNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_RTNCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(28865004825172715)
,p_internal_uid=>28865004825172715
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(28884092160755139)
,p_interactive_grid_id=>wwv_flow_api.id(28865004825172715)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(28884100496755162)
,p_report_id=>wwv_flow_api.id(28884092160755139)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28884598925755196)
,p_view_id=>wwv_flow_api.id(28884100496755162)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(28865198373172716)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28885087782755213)
,p_view_id=>wwv_flow_api.id(28884100496755162)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(28865269346172717)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28885593111755215)
,p_view_id=>wwv_flow_api.id(28884100496755162)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(28865353755172718)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28886582244755219)
,p_view_id=>wwv_flow_api.id(28884100496755162)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(28865587044172720)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28888319474755242)
,p_view_id=>wwv_flow_api.id(28884100496755162)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(28865801239172723)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28888874323755246)
,p_view_id=>wwv_flow_api.id(28884100496755162)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(28865933469172724)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>285
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28889349068755249)
,p_view_id=>wwv_flow_api.id(28884100496755162)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(28866056286172725)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28889868272755266)
,p_view_id=>wwv_flow_api.id(28884100496755162)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(28866172866172726)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>139
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28890344754755268)
,p_view_id=>wwv_flow_api.id(28884100496755162)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(28866254201172727)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28890883797755270)
,p_view_id=>wwv_flow_api.id(28884100496755162)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(28866374885172728)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28891355220755272)
,p_view_id=>wwv_flow_api.id(28884100496755162)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(28866425564172729)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28891835823755284)
,p_view_id=>wwv_flow_api.id(28884100496755162)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(28866590989172730)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28939362217813846)
,p_view_id=>wwv_flow_api.id(28884100496755162)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(28868432224172749)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(28864996898172714)
,p_plug_name=>'Retenciones Que Le Practicaron'
,p_parent_plug_id=>wwv_flow_api.id(28864750324172712)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (',
'select a.idntfccion_sjto,',
'       a.nmbre_rzon_scial,',
'       a.dscrpcion_cncpto,',
'       a.vlor_bse,',
'       a.trfa,',
'       a.vlor_rtncion,',
'       a.vgncia_rtncion,',
'       a.prdo,      ',
'       a.cdgo_exgna_tpo_rgstro,',
'       a.idntfccion',
'  from V_RTNCNES_PRCTCDAS_RD a',
' where a.idntfccion = :P217_IDNTFCCION',
'   and (a.vgncia_rtncion = :P217_VGNCIA or :P217_VGNCIA is null)',
'   and a.cdgo_exgna_tpo_rgstro = ''RP''',
' order by a.vgncia_rtncion,a.cdgo_prdo);',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28866766208172732)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28866904237172734)
,p_name=>'CDGO_EXGNA_TPO_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_EXGNA_TPO_RGSTRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(28867083634172735)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(28867172014172736)
,p_name=>'NMBRE_RZON_SCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RZON_SCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Raz\00F3n Social')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(28867226529172737)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(28867397530172738)
,p_name=>'VLOR_BSE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_BSE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Base <br>Retenci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_is_required=>false
,p_max_length=>29
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_api.id(28867484657172739)
,p_name=>'TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRFA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tarifa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(28867517816172740)
,p_name=>'VLOR_RTNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_RTNCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor <br>Retenci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_is_required=>false
,p_max_length=>29
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_api.id(28867621563172741)
,p_name=>'VGNCIA_RTNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA_RTNCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(28867743758172742)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(28866692260172731)
,p_internal_uid=>28866692260172731
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(28894342893786160)
,p_interactive_grid_id=>wwv_flow_api.id(28866692260172731)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(28894414388786160)
,p_report_id=>wwv_flow_api.id(28894342893786160)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28894988050786162)
,p_view_id=>wwv_flow_api.id(28894414388786160)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(28866766208172732)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28895909590786165)
,p_view_id=>wwv_flow_api.id(28894414388786160)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(28866904237172734)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28896438908786167)
,p_view_id=>wwv_flow_api.id(28894414388786160)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(28867083634172735)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28896920996786169)
,p_view_id=>wwv_flow_api.id(28894414388786160)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(28867172014172736)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>300
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28897437018786171)
,p_view_id=>wwv_flow_api.id(28894414388786160)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(28867226529172737)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28897928224786172)
,p_view_id=>wwv_flow_api.id(28894414388786160)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(28867397530172738)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28898465764786174)
,p_view_id=>wwv_flow_api.id(28894414388786160)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(28867484657172739)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28898948012786176)
,p_view_id=>wwv_flow_api.id(28894414388786160)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(28867517816172740)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28899450185786178)
,p_view_id=>wwv_flow_api.id(28894414388786160)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(28867621563172741)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28899937196786180)
,p_view_id=>wwv_flow_api.id(28894414388786160)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(28867743758172742)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(28867874902172743)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
unistr('<i><p>Funcionalidad que permite realizar una consulta de informaci\00F3n ex\00F3gena de un sujeto en una vigencia.</p>'),
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dirijase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(28864282130172707)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(28864661920172711)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(28868503122172750)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(28864661920172711)
,p_button_name=>'BTN_EXPRTAR_EXCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Reporte Retenciones <br>Practic\00F3')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-excel-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(29035026078080608)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(28864661920172711)
,p_button_name=>'BTN_EXCEL_RD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reporte Retenciones <br>Le Practicaron'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-excel-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(29034345787080601)
,p_branch_name=>'excel'
,p_branch_action=>'f?p=&APP_ID.:217:&SESSION.:descargar:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'descargar_Excel'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(29034901249080607)
,p_branch_name=>'excelRd'
,p_branch_action=>'f?p=&APP_ID.:217:&SESSION.:descargarRD:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'descargar_ExcelRD'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28863713473172702)
,p_name=>'P217_IDNTFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(28863642927172701)
,p_prompt=>unistr('<b>Identificaci\00F3n</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28863803274172703)
,p_name=>'P217_NMBRE_RZON_SCIAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(28863642927172701)
,p_prompt=>unistr('<b>Raz\00F3n Social</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28864174410172706)
,p_name=>'P217_VGNCIA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(28863642927172701)
,p_prompt=>'<b>Vigencia</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'60%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28950630420620203)
,p_name=>'P217_NMBRE_ARCHVO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(28863642927172701)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29035354371080611)
,p_name=>'P217_TPO_RTNCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(28863642927172701)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29034472110080602)
,p_name=>'al dar click'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(28868503122172750)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29034570757080603)
,p_event_id=>wwv_flow_api.id(29034472110080602)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function descarga(){',
' //  var valido = validarItem();',
'    if (validarItem()){',
'        apex.item("P217_TPO_RTNCION").setValue("RP");',
'        apex.submit(''descargar_Excel'');',
'    }    ',
'}',
'',
'descarga();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29035134812080609)
,p_name=>'Al dar click BTN_EXCEL_RD'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(29035026078080608)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29035263506080610)
,p_event_id=>wwv_flow_api.id(29035134812080609)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function descargar(){',
'   // var valido = validarItem();',
'    if (validarItem()){',
'        apex.item("P217_TPO_RTNCION").setValue("RD");',
'        apex.submit(''descargar_ExcelRD'');',
'    }    ',
'}',
'',
'descargar();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29035481945080612)
,p_name=>'Al dar click BTN_CNSLTAR'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(28864282130172707)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29035599546080613)
,p_event_id=>wwv_flow_api.id(29035481945080612)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function consultar(){',
'   // var rspta = validarItem();',
'    console.log(''Respuesta: ''+ validarItem());',
'    if(validarItem()){',
'        apex.submit();',
'    }',
'}',
'',
'consultar();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29034687051080604)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BajarExcel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_blob         blob;',
'  v_cdgo_rspsta  number;',
'  v_mnsje_rspsta varchar2(4000);',
'  v_nmbre_dcmnto varchar2(200);',
'begin',
'                            ',
'/* prc_gn_rprte_rtncnes_excl(p_cdgo_clnte   => :F_CDGO_CLNTE,',
'                            p_idntfccion   => :P217_IDNTFCCION,',
'                            p_vgncia       => :P217_VGNCIA,',
'                            o_file_blob    => v_blob,',
'                            o_cdgo_rspsta  => v_cdgo_rspsta,',
'                            o_mnsje_rspsta => v_mnsje_rspsta); */',
'  ',
'  pkg_gi_informacion_exogena.prc_gn_rprte_rtncnes_rd(p_cdgo_clnte   => :F_CDGO_CLNTE,',
'                                                     p_idntfccion   => :P217_IDNTFCCION,',
'                                                     p_vgncia       => :P217_VGNCIA,',
'                                                     p_tpo_rtncion  => :P217_TPO_RTNCION,',
'                                                     o_file_blob    => v_blob,',
'                                                     o_cdgo_rspsta  => v_cdgo_rspsta,',
'                                                     o_mnsje_rspsta => v_mnsje_rspsta);',
'                            ',
'  htp.init;',
'  owa_util.mime_header(''application/ms-excel'', false);',
'  ',
'  v_nmbre_dcmnto := ''Reporte_Retenciones_''|| :P217_IDNTFCCION||''_''|| to_char(sysdate,''yyyymmddhhmiss'');',
'  ',
'  htp.p(''Content-length: '' ||sys.dbms_lob.getlength(v_blob) );  ',
'  htp.p(''Content-Disposition: attachment; filename="''|| v_nmbre_dcmnto ||''.xlsx"'');  ',
'  htp.p(''Cache-Control: max-age=0'');',
'  owa_util.http_header_close;  ',
'  wpg_docload.download_file(v_blob);  ',
'  apex_application.stop_apex_engine;',
'  ',
'  exception',
'    when others then',
'        apex_error.add_error(p_message          => v_mnsje_rspsta,',
'                         p_display_location => apex_error.c_inline_in_notification);',
'                         ',
'  /*if v_cdgo_rspsta = 0 then',
'    -- descargar el archivo',
'    owa_util.mime_header(''application/vnd.ms-excel'', false);',
'    htp.p(''Content-length: '' || dbms_lob.getlength(v_blob));',
'    htp.p(''Content-Disposition: attachment; filename="reporte_retenciones.xlsx"'');',
'    owa_util.http_header_close;',
'    wpg_docload.download_file(v_blob);',
'  else',
'    -- mostrar error',
'    apex_error.add_error(p_message          => v_mnsje_rspsta,',
'                         p_display_location => apex_error.c_inline_in_notification);',
'  end if;*/',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'descargar'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29034851173080606)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BajarExcelRD'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_blob         blob;',
'  v_cdgo_rspsta  number;',
'  v_mnsje_rspsta varchar2(4000);',
'  v_nmbre_dcmnto varchar2(200);',
'begin',
'                            ',
'/*  prc_gn_rprte_rtncnes_excl_rd(p_cdgo_clnte   => :F_CDGO_CLNTE,',
'                               p_idntfccion   => :P217_IDNTFCCION,',
'                               p_vgncia       => :P217_VGNCIA,',
'                               o_file_blob    => v_blob,',
'                               o_cdgo_rspsta  => v_cdgo_rspsta,',
'                               o_mnsje_rspsta => v_mnsje_rspsta);   */',
'                               ',
'  pkg_gi_informacion_exogena.prc_gn_rprte_rtncnes_rd(p_cdgo_clnte   => :F_CDGO_CLNTE,',
'                                                     p_idntfccion   => :P217_IDNTFCCION,',
'                                                     p_vgncia       => :P217_VGNCIA,',
'                                                     p_tpo_rtncion  => :P217_TPO_RTNCION,',
'                                                     o_file_blob    => v_blob,',
'                                                     o_cdgo_rspsta  => v_cdgo_rspsta,',
'                                                     o_mnsje_rspsta => v_mnsje_rspsta);                               ',
'                            ',
'  htp.init;',
'  owa_util.mime_header(''application/ms-excel'', false);',
'  ',
'  v_nmbre_dcmnto := ''Reporte_Retenciones_Practicaron_''|| :P217_IDNTFCCION||''_''|| to_char(sysdate,''yyyymmddhhmiss'');',
'  ',
'  htp.p(''Content-length: '' ||sys.dbms_lob.getlength(v_blob) );  ',
'  htp.p(''Content-Disposition: attachment; filename="''|| v_nmbre_dcmnto ||''.xlsx"'');  ',
'  htp.p(''Cache-Control: max-age=0'');',
'  owa_util.http_header_close;  ',
'  wpg_docload.download_file(v_blob);  ',
'  apex_application.stop_apex_engine;',
'  ',
'  exception',
'    when others then',
'        apex_error.add_error(p_message          => v_mnsje_rspsta,',
'                         p_display_location => apex_error.c_inline_in_notification);',
'                           ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'descargarRD'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29035677699080614)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BuscarRazonSocial'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_rzon_scial   v_si_i_personas.nmbre_rzon_scial%type;',
'begin',
'     ',
'     select a.nmbre_rzon_scial into :P217_NMBRE_RZON_SCIAL',
'      from v_si_i_personas a',
'      join v_si_i_sujetos_impuesto b',
'        on b.id_sjto_impsto = a.id_sjto_impsto',
'     where b.idntfccion_sjto = :P217_IDNTFCCION',
'         and b.id_impsto = 700012;',
'       ',
'exception ',
'    when others then',
'        :P217_NMBRE_RZON_SCIAL := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P217_IDNTFCCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29020319085294401)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DescargaExcel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_blob         blob;',
'  v_cdgo_rspsta  number;',
'  v_mnsje_rspsta varchar2(4000);',
'  v_nmbre_dcmnto varchar2(200);',
'  v_tpo_rtncion  varchar2(2);',
'begin',
'',
'  /*  prc_gn_rprte_rtncnes_excl(p_cdgo_clnte   => :F_CDGO_CLNTE,',
'  p_idntfccion   => :P217_IDNTFCCION,',
'  p_vgncia       => :P217_VGNCIA,',
'  o_file_blob    => v_blob,',
'  o_cdgo_rspsta  => v_cdgo_rspsta,',
'  o_mnsje_rspsta => v_mnsje_rspsta);   */',
'',
'  pkg_gi_informacion_exogena.prc_gn_rprte_rtncnes_rd(p_cdgo_clnte   => :F_CDGO_CLNTE,',
'                                                     p_idntfccion   => :P217_IDNTFCCION,',
'                                                     p_vgncia       => :P217_VGNCIA,',
'                                                     p_tpo_rtncion  => v_tpo_rtncion,',
'                                                     o_file_blob    => v_blob,',
'                                                     o_cdgo_rspsta  => v_cdgo_rspsta,',
'                                                     o_mnsje_rspsta => v_mnsje_rspsta);',
'',
'  htp.init;',
'  owa_util.mime_header(''application/ms-excel'', false);',
'',
'  v_nmbre_dcmnto := ''Reporte_Retenciones_'' || :P217_IDNTFCCION || ''_'' ||',
'                    to_char(sysdate, ''yyyymmddhhmiss'');',
'',
'  htp.p(''Content-length: '' || sys.dbms_lob.getlength(v_blob));',
'  htp.p(''Content-Disposition: attachment; filename="'' || v_nmbre_dcmnto ||',
'        ''.xlsx"'');',
'  htp.p(''Cache-Control: max-age=0'');',
'  owa_util.http_header_close;',
'  wpg_docload.download_file(v_blob);',
'  apex_application.stop_apex_engine;',
'',
'exception',
'  when others then',
'    apex_error.add_error(p_message          => v_mnsje_rspsta,',
'                         p_display_location => apex_error.c_inline_in_notification);',
'  ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29034711732080605)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DescargarRd'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_blob         blob;',
'  v_cdgo_rspsta  number;',
'  v_mnsje_rspsta varchar2(4000);',
'  v_nmbre_dcmnto varchar2(200);',
'begin',
'                            ',
'  prc_gn_rprte_rtncnes_excl_rd(p_cdgo_clnte   => :F_CDGO_CLNTE,',
'                               p_idntfccion   => :P217_IDNTFCCION,',
'                               p_vgncia       => :P217_VGNCIA,',
'                               o_file_blob    => v_blob,',
'                               o_cdgo_rspsta  => v_cdgo_rspsta,',
'                               o_mnsje_rspsta => v_mnsje_rspsta);                            ',
'                            ',
'  htp.init;',
'  owa_util.mime_header(''application/ms-excel'', false);',
'  ',
'  v_nmbre_dcmnto := ''Reporte_Retenciones_Practicaron_''|| :P217_IDNTFCCION||''_''|| to_char(sysdate,''yyyymmddhhmiss'');',
'  ',
'  htp.p(''Content-length: '' ||sys.dbms_lob.getlength(v_blob) );  ',
'  htp.p(''Content-Disposition: attachment; filename="''|| v_nmbre_dcmnto ||''.xlsx"'');  ',
'  htp.p(''Cache-Control: max-age=0'');',
'  owa_util.http_header_close;  ',
'  wpg_docload.download_file(v_blob);  ',
'  apex_application.stop_apex_engine;',
'  ',
'  exception',
'    when others then',
'        apex_error.add_error(p_message          => v_mnsje_rspsta,',
'                         p_display_location => apex_error.c_inline_in_notification);',
'                           ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
