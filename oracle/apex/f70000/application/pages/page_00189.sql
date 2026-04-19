prompt --application/pages/page_00189
begin
wwv_flow_api.create_page(
 p_id=>189
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Cambiar Fecha de Vencimiento'
,p_page_mode=>'MODAL'
,p_step_title=>'Cambiar Fecha de Vencimiento'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'75%'
,p_last_updated_by=>'JRANGEL'
,p_last_upd_yyyymmddhh24miss=>'20201204133537'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100073007125508501)
,p_plug_name=>unistr('<b>Liquidaci\00F3n N\00B0 &P189_NMRO_RNTA. </b>')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100077504486508546)
,p_plug_name=>'Conceptos'
,p_parent_plug_id=>wwv_flow_api.id(100073007125508501)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'       select rownum',
'        , a.cdgo_cncpto || '' - '' || a.dscrpcion_cncpto  dscrpcion_cncpto',
'        , a.vlor_lqddo',
'        , a.vlor_intres_mra',
'        , a.vlor_ttal vlor_ttal',
'        , a.fcha_vncmnto',
'        , a.dias_mra',
'        , a.txto_trfa',
'        , a.bse_grvble',
'     from table (pkg_gi_rentas.fnc_cl_select_cncptos_lqdcion(p_cdgo_clnte 				=> :F_CDGO_CLNTE',
'                                                           , p_id_impsto                => :P189_ID_IMPSTO',
'                                                           , p_id_impsto_sbmpsto        => :P189_ID_IMPSTO_SBMPSTO  ',
'                                                           , p_id_sjto_impsto           => :P189_ID_SJTO_IMPSTO',
'                                                           , p_json						=> :P189_CNCPTOS',
'                                                           , p_vlor_bse					=> :P189_VLOR_BSE',
'                                                           --, p_vlor_bse					=> to_number(:P149_BSE, ''999G999G999G999G999G999G990D99'')',
'                                                           , p_indcdor_usa_extrnjro		=> nvl(:P189_INDCDOR_USA_EXTRNJRO, ''N'')',
'                                                           , p_indcdor_usa_mxto			=> nvl(:P189_INDCDOR_USA_MXTO, ''N'')',
'                                                           , p_fcha_expdcion            => :P189_FCHA_EXPDCION ',
'                                                           , p_fcha_vncmnto             => :P189_FCHA_VNCMNTO',
'                                                           , p_indcdor_lqdccion_adcnal  => :P189_INDCDOR_LDCCION_ADCNAL  ',
'                                                           , p_id_rnta_antrior          => :P189_ID_RNTA_ANTRIOR',
'                                                           , p_indcdor_cntrto_gslna     => :P189_INDCDOR_CNTRTO_GSLNA  ',
'                                                            )',
'                ) a',
' where a.cdgo_clnte        = :F_CDGO_CLNTE',
'   and abs(a.vlor_lqddo)   > 0',
'   and a.id_impsto_acto    = :P189_ID_IMPSTO_ACTO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(100077874167508549)
,p_name=>'ROWNUM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWNUM'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Rownum'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>10
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(100077940572508550)
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
,p_is_required=>false
,p_max_length=>106
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
 p_id=>wwv_flow_api.id(100153826695860401)
,p_name=>'VLOR_LQDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_LQDDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br>Liquidado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(100153906470860402)
,p_name=>'VLOR_INTRES_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES_MRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor <br>Inter\00E9s ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(100154007956860403)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor<br> Total'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(100154170559860404)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fcha Vncmnto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_api.id(100154212060860405)
,p_name=>'DIAS_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIAS_MRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('D\00EDas <br>Moras')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(100154334968860406)
,p_name=>'TXTO_TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_TRFA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tarifa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(100154429462860407)
,p_name=>'BSE_GRVBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BSE_GRVBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Bse Grvble'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(100077667485508547)
,p_internal_uid=>100077667485508547
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
 p_id=>wwv_flow_api.id(100159450242867580)
,p_interactive_grid_id=>wwv_flow_api.id(100077667485508547)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(100159535698867580)
,p_report_id=>wwv_flow_api.id(100159450242867580)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(100160086769867587)
,p_view_id=>wwv_flow_api.id(100159535698867580)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(100077874167508549)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(100160546432867591)
,p_view_id=>wwv_flow_api.id(100159535698867580)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(100077940572508550)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>308.8
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(100161039643867593)
,p_view_id=>wwv_flow_api.id(100159535698867580)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(100153826695860401)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(100161544065867595)
,p_view_id=>wwv_flow_api.id(100159535698867580)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(100153906470860402)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(100162013002867600)
,p_view_id=>wwv_flow_api.id(100159535698867580)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(100154007956860403)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(100162535779867602)
,p_view_id=>wwv_flow_api.id(100159535698867580)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(100154170559860404)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(100163009744867604)
,p_view_id=>wwv_flow_api.id(100159535698867580)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(100154212060860405)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(100163596877867606)
,p_view_id=>wwv_flow_api.id(100159535698867580)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(100154334968860406)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(100164096658867609)
,p_view_id=>wwv_flow_api.id(100159535698867580)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(100154429462860407)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100077068454508541)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(100073007125508501)
,p_button_name=>'btn_aceptar'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Aceptar'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro que desea actualizar la fecha de vencimiento?'', ''btn_aceptar'');'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100077146392508542)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(100073007125508501)
,p_button_name=>'btn_cancelar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar / Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(100077443397508545)
,p_branch_name=>'Ir a inicio'
,p_branch_action=>'f?p=&APP_ID.:188:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(100077068454508541)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100073182374508502)
,p_name=>'P189_FCHA_VNCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(100073007125508501)
,p_prompt=>'<b>Fecha Vencimiento</b>'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false" '
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha de vencimiento para el pago de la liquidaci\00F3n del hecho generador.')
,p_attribute_02=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100073372677508504)
,p_name=>'P189_ID_RNTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(100073007125508501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100073400927508505)
,p_name=>'P189_NMRO_RNTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(100073007125508501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100073504320508506)
,p_name=>'P189_IDNTFCCION_SJTO_FRMTDA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(100073007125508501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100073629367508507)
,p_name=>'P189_ID_SJTO_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(100073007125508501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100073730064508508)
,p_name=>'P189_ID_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(100073007125508501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100073894528508509)
,p_name=>'P189_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(100073007125508501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100073977496508510)
,p_name=>'P189_ID_IMPSTO_ACTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(100073007125508501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100074090396508511)
,p_name=>'P189_FCHA_EXPDCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(100073007125508501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100074145310508512)
,p_name=>'P189_INDCDOR_EXTRNJRO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(100073007125508501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100074228627508513)
,p_name=>'P189_INDCDOR_MXTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(100073007125508501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100074385818508514)
,p_name=>'P189_INDCDOR_LQDCCION_ADCNAL'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(100073007125508501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100074465947508515)
,p_name=>'P189_ID_RNTA_ANTRIOR'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(100073007125508501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100074541589508516)
,p_name=>'P189_INDCDOR_CNTRTO_GSLNA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(100073007125508501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100074673526508517)
,p_name=>'P189_VLOR_BSE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(100073007125508501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100074748043508518)
,p_name=>'P189_INDCDOR_RNTA_PGADA'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(100073007125508501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100074873476508519)
,p_name=>'P189_CDGO_RNTA_ESTDO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(100073007125508501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100154532621860408)
,p_name=>'P189_CNCPTOS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(100077504486508546)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(100154668757860409)
,p_computation_sequence=>10
,p_computation_item=>'P189_CNCPTOS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select json_arrayagg( json_object( ''ID_IMPSTO_ACTO_CNCPTO'' value id_impsto_acto_cncpto ) returning clob )',
'     from ( select b.id_impsto_acto_cncpto',
'              from gi_g_rentas_acto             a',
'              join gi_g_rentas_acto_concepto    b on a.id_rnta_acto = b.id_rnta_acto',
'             where a.id_rnta                    = :P189_ID_RNTA',
'     );'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(100076889013508539)
,p_validation_name=>'Validar que la fecha de vencimiento este en el rango de tasas mora'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' v_fcha_vlda          varchar2(1);',
' v_gnra_intres_mra    varchar2(1);',
'begin     ',
'    ',
'    begin',
'        select distinct a.gnra_intres_mra',
'          into v_gnra_intres_mra',
'          from v_df_i_impuestos_acto_concepto      a ',
'          join (select id_impsto_acto_cncpto ',
'                  from json_table(:P189_CNCPTOS,''$[*]''columns id_impsto_acto_cncpto path ''$.ID_IMPSTO_ACTO_CNCPTO'')',
'               )                                   b on a.id_impsto_acto_cncpto    = b.id_impsto_acto_cncpto',
'        where a.gnra_intres_mra                    = ''S''',
'          and :P189_FCHA_VNCMNTO            is not null;',
'        ',
'        v_fcha_vlda := pkg_gn_generalidades.fnc_vl_fcha_vncmnto_tsas_mra (:F_CDGO_CLNTE, :P189_ID_IMPSTO, to_date(:P189_FCHA_VNCMNTO));',
'        if v_fcha_vlda = ''S''  then',
'            return true;',
'        else ',
'            return false;',
'        end if;       ',
'    exception',
'        when others then ',
'            raise_application_error(-20001, sqlerrm);',
'            return false;',
'    end;',
'    ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Debe seleccionar una fecha valida para poder continuar. Se debe revisar que la fecha de vencimiento se encuentre en un rango de tasa mora parametrizado'
,p_validation_condition=>'P189_FCHA_VNCMNTO'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100076635245508537)
,p_name=>'Al Cambiar la Fecha Vencimiento'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P189_FCHA_VNCMNTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100076750650508538)
,p_event_id=>wwv_flow_api.id(100076635245508537)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100077293066508543)
,p_name=>'Cerrar Modal'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(100077146392508542)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100077354684508544)
,p_event_id=>wwv_flow_api.id(100077293066508543)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(100076974859508540)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cambiar Fecha Vencimiento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(1000);',
'    v_id_dcmnto          number;',
'    v_nmro_dcmnto        number;',
'begin',
'    pkg_gi_rentas.prc_ac_fecha_pago (p_cdgo_clnte          		        => :F_CDGO_CLNTE',
'                                    , p_id_rnta             			=> :P189_ID_RNTA',
'                                    , p_fcha_vncmnto_dcmnto				=> :P189_FCHA_VNCMNTO',
'                                    , p_id_usrio            			=> :F_ID_USRIO',
'                                    , o_id_dcmnto                		=> v_id_dcmnto',
'                                    , o_nmro_dcmnto              		=> v_nmro_dcmnto',
'                                    , o_cdgo_rspsta         			=> v_cdgo_rspsta',
'                                    , o_mnsje_rspsta        			=> v_mnsje_rspsta);',
'',
'   /*if v_cdgo_rspsta = 0 then ',
'        :F_ID_DCMNTO         := v_id_dcmnto;',
'        :P149_NMRO_DCMNTO    := v_nmro_dcmnto;',
'    end if;*/',
'   ',
'    if v_cdgo_rspsta != 0 then ',
'        raise_application_error(-20001, v_mnsje_rspsta );',
'    end if;',
'exception',
'    when others then ',
'        raise_application_error(-20001, ''Error al cambiar la fecha de vencimiento: '' ||'' - ''||to_char(sqlerrm));',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(100077068454508541)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    :P189_CDGO_RNTA_ESTDO     = ''APB''',
'and :P189_INDCDOR_RNTA_PGADA  = ''N'''))
,p_process_when_type=>'SQL_EXPRESSION'
,p_process_success_message=>unistr('Actualizaci\00F3n de Fecha de Vencimiento Exitosa')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(100076505694508536)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Informacion Renta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'   select a.idntfccion_sjto_frmtda',
'        , a.id_sjto_impsto',
'        , a.id_impsto',
'        , a.id_impsto_sbmpsto',
'        , d.id_impsto_acto',
'        , a.fcha_expdcion',
'        , a.indcdor_usa_extrnjro',
'        , a.indcdor_usa_mxto',
'        , case ',
'            when a.id_rnta_antrior is not null then ',
'                ''S''',
'            else ',
'                ''N''',
'          end as indcdor_lqdcion_adcnal',
'        , a.id_rnta_antrior',
'        , a.indcdor_cntrto_gslna',
'        , a.indcdor_rnta_pgda',
'     into :P189_IDNTFCCION_SJTO_FRMTDA',
'        , :P189_ID_SJTO_IMPSTO',
'        , :P189_ID_IMPSTO',
'        , :P189_ID_IMPSTO_SBMPSTO',
'        , :P189_ID_IMPSTO_ACTO',
'        , :P189_FCHA_EXPDCION',
'        , :P189_INDCDOR_EXTRNJRO',
'        , :P189_INDCDOR_MXTO',
'        , :P189_INDCDOR_LQDCCION_ADCNAL',
'        , :P189_ID_RNTA_ANTRIOR',
'        , :P189_INDCDOR_CNTRTO_GSLNA',
'        , :P189_INDCDOR_RNTA_PGADA  ',
'     from v_gi_g_rentas     a',
'     join v_si_i_sujetos_impuesto    b on a.id_sjto_impsto  = b.id_sjto_impsto',
'     join si_i_personas              c on b.id_sjto_impsto  = c.id_sjto_impsto',
'     join gi_g_rentas_acto           d on a.id_rnta         = d.id_rnta',
'    where a.id_rnta                  = :P189_ID_RNTA;',
'',
'exception',
'    when others then',
'         :P189_IDNTFCCION_SJTO_FRMTDA    := null;',
'         :P189_ID_SJTO_IMPSTO            := null;',
'         :P189_ID_IMPSTO                 := null;',
'         :P189_ID_IMPSTO_SBMPSTO         := null;',
'         :P189_ID_IMPSTO_ACTO            := null;',
'         :P189_FCHA_EXPDCION             := null;',
'         :P189_INDCDOR_EXTRNJRO          := null;',
'         :P189_INDCDOR_MXTO              := null;',
'         :P189_INDCDOR_LQDCCION_ADCNAL   := null;',
'         :P189_ID_RNTA_ANTRIOR           := null;',
'         :P189_INDCDOR_CNTRTO_GSLNA      := null;',
'         :P189_INDCDOR_RNTA_PGADA        := null;',
'        ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
