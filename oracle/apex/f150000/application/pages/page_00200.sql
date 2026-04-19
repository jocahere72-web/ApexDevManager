prompt --application/pages/page_00200
begin
wwv_flow_api.create_page(
 p_id=>200
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Consulta de Contribuyente - Liquidaci\00F3n de Rentas')
,p_step_title=>unistr('Consulta de Contribuyente - Liquidaci\00F3n de Rentas')
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function cal_impstos_actos_cncptos (){',
'    var i, ',
'        records, ',
'        record, ',
'        sal, ',
'        model,',
'        impuestos_acto_concepto = ''[['',',
'        view = apex.region("region_conceptos").widget().interactiveGrid("getCurrentView");',
'        ',
'        model = view.model;',
'        records = view.getSelectedRecords();',
'   ',
'    if ( records.length > 0 ) {',
'        for ( i = 0; i < records.length; i++ ) {',
'            record = records[i];',
'            impuestos_acto_concepto = impuestos_acto_concepto + ''{"ID_IMPSTO_ACTO_CNCPTO":"'' + model.getValue(record, "ID_IMPSTO_ACTO_CNCPTO") + ''"},'';',
'       }',
'    } ',
'    impuestos_acto_concepto = impuestos_acto_concepto.substring( impuestos_acto_concepto.length-1, 1) ;',
'    impuestos_acto_concepto = impuestos_acto_concepto + '']'';',
'    $s("P200_ID_IMPSTO_ACTO_CNCPTO", impuestos_acto_concepto);',
'',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery( apex.gPageContext$ ).on( "apexreadyend", function( e ) {',
'    ocultarAyudaD();',
'    apex.item( "informacion_basica" ).hide();',
'    apex.item( "acto_conceptos" ).hide();',
'    ',
'});',
'',
'',
'apex.jQuery(apex.gPageContext$).on("apexreadyend", async function (e) {',
'    if($v(''P200_RSPSTA'') == ''0'' )  {',
'        apex.item( "informacion_basica" ).hide();',
'        apex.item( "acto_conceptos" ).hide();',
'   }',
'    if($v(''P200_RSPSTA'') == ''1'' || $v(''P200_RSPSTA'') == ''2''  ){',
'        apex.item( "informacion_basica" ).show();',
'        apex.item( "acto_conceptos" ).show();',
'   }',
'    ',
'});',
'',
'/*',
'if( apex.region("region_conceptos") )',
'    apex.region("region_conceptos").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");*/'))
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_step_template=>wwv_flow_api.id(252165693921651362)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'HMARTINEZ'
,p_last_upd_yyyymmddhh24miss=>'20201228172032'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10156403799753320)
,p_plug_name=>'Sujeto Tributo / Actos'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(252183924525651399)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(4794665765814946)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(252197199379651439)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(175863611059962586)
,p_plug_name=>'Acto / Concepto'
,p_region_name=>'acto_conceptos'
,p_parent_plug_id=>wwv_flow_api.id(10156403799753320)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow:t-Form--large'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P200_ID_SJTO_IMPSTO is not null or :P200_ID_SJTO is not null'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10154218530753298)
,p_plug_name=>'Conceptos'
,p_region_name=>'region_conceptos'
,p_parent_plug_id=>wwv_flow_api.id(175863611059962586)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_impsto_acto_cncpto',
'		, a.id_impsto_acto',
'		, ''['' || a.cdgo_cncpto  ||  ''] '' || a.dscrpcion_cncpto dscrpcion_cncpto',
unistr('        , decode(a.unco, ''S'', ''S\00ED'', ''N'', ''No'')                 unco'),
unistr('        , decode(a.gnra_intres_mra, ''S'', ''S\00ED'', ''N'', ''No'')     gnra_intres_mra'),
'        , a.txto_trfa',
unistr('        , decode(a.indcdor_usa_bse, ''S'', ''S\00ED'', ''N'', ''No'')      indcdor_usa_base'),
'	 from v_gi_d_tarifas_esquema                  a  ',
'	where a.id_impsto_acto 						= :P200_ID_IMPSTO_ACTO',
'	  and a.vgncia 								= :P200_VGNCIA_ACTUAL',
'	  and a.prdo 								= :P200_ID_PRDO_ACTUAL',
'	  and (sysdate 								<= cast(a.fcha_vncmnto as date) or a.fcha_vncmnto is null)',
' group by a.id_impsto_acto_cncpto',
'		, a.id_impsto_acto',
'		, a.cdgo_cncpto',
'		, a.dscrpcion_cncpto',
'		, a.unco',
'		, a.gnra_intres_mra ',
'        , a.txto_trfa',
'        , a.indcdor_usa_bse'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select count(a.id_impsto_acto_cncpto)',
'	 from v_df_i_impuestos_acto_concepto		a',
'	where a.id_impsto_acto 						= :P200_ID_IMPSTO_ACTO',
'	  and a.actvo 								= ''S''',
'	  and a.vgncia 								= :P200_VGNCIA_ACTUAL',
'	  and a.prdo 								= :P200_ID_PRDO_ACTUAL',
'	  and (sysdate 								<= cast(a.fcha_vncmnto as date) or a.fcha_vncmnto is null)',
' having count(a.id_impsto_acto_cncpto) > 1'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10154427020753300)
,p_name=>'ID_IMPSTO_ACTO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO_CNCPTO'
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
 p_id=>wwv_flow_api.id(10154520062753301)
,p_name=>'ID_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(10154613389753302)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>108
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
 p_id=>wwv_flow_api.id(10155685629753313)
,p_name=>'Seleccionar'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10314850351186399)
,p_name=>'UNCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BF\00DAnico?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>2
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
 p_id=>wwv_flow_api.id(10314977961186400)
,p_name=>'GNRA_INTRES_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GNRA_INTRES_MRA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFGenera Interes<br> de Mora?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>2
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
 p_id=>wwv_flow_api.id(10315006278186401)
,p_name=>'TXTO_TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_TRFA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tarifa'
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
 p_id=>wwv_flow_api.id(10315112978186402)
,p_name=>'INDCDOR_USA_BASE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_USA_BASE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFUsa Base?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>2
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
 p_id=>wwv_flow_api.id(10154365986753299)
,p_internal_uid=>10154365986753299
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
 p_id=>wwv_flow_api.id(10170236868085460)
,p_interactive_grid_id=>wwv_flow_api.id(10154365986753299)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(10170318860085463)
,p_report_id=>wwv_flow_api.id(10170236868085460)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10170868087085473)
,p_view_id=>wwv_flow_api.id(10170318860085463)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(10154427020753300)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10171281724085481)
,p_view_id=>wwv_flow_api.id(10170318860085463)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(10154520062753301)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10171827228085483)
,p_view_id=>wwv_flow_api.id(10170318860085463)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(10154613389753302)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10421607919008924)
,p_view_id=>wwv_flow_api.id(10170318860085463)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(10314850351186399)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10422197919008928)
,p_view_id=>wwv_flow_api.id(10170318860085463)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(10314977961186400)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10422821142008930)
,p_view_id=>wwv_flow_api.id(10170318860085463)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(10315006278186401)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10423462252008933)
,p_view_id=>wwv_flow_api.id(10170318860085463)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(10315112978186402)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(351374595523103860)
,p_plug_name=>'Sujeto Tributo'
,p_parent_plug_id=>wwv_flow_api.id(10156403799753320)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--large'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(79394311112908987)
,p_plug_name=>unistr('Informaci\00F3n B\00E1sica')
,p_region_name=>'informacion_basica'
,p_parent_plug_id=>wwv_flow_api.id(351374595523103860)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-none:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10314305875186394)
,p_plug_name=>'Definiciones de Rentas'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5410000713581079)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_api.id(351374595523103860)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4252589668589303)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(351374595523103860)
,p_button_name=>'BTN_REGISTRARSE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Registrarse'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:207:&SESSION.::&DEBUG.:RP,207:P207_ID_IMPSTO,P207_IDNTFCCION:&P200_ID_IMPSTO.,&P200_PRMTRO.'
,p_icon_css_classes=>'fa-user-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5401583452581003)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(10156403799753320)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-angle-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5401985535581005)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(10156403799753320)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de cancelar? Al cancelar se perderÃ¡ todos los cambios que no se han guardado'',''CANCEL'');'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5425852267581164)
,p_branch_name=>unistr('Ir a Informaci\00F3n Relacionada')
,p_branch_action=>'f?p=&APP_ID.:201:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5401583452581003)
,p_branch_sequence=>20
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P200_INDCDOR_RQRE_ASCDA'
,p_branch_condition_text=>'S'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5426281390581164)
,p_branch_name=>unistr('Ir a Proyecci\00F3n')
,p_branch_action=>'f?p=&APP_ID.:202:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5401583452581003)
,p_branch_sequence=>30
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P200_INDCDOR_RQRE_ASCDA'
,p_branch_condition_text=>'N'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(78952540965533305)
,p_branch_name=>unistr('Ir a la P\00E1gina de Inicio')
,p_branch_action=>'P200_BRANCH'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_when_button_id=>wwv_flow_api.id(5401985535581005)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5402655486581010)
,p_name=>'P200_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(175863611059962586)
,p_prompt=>unistr('Liquidaci\00F3n de')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select nmbre_impsto_sbmpsto          d ',
'        , id_impsto_sbmpsto             r       ',
'     from df_i_impuestos_subimpuesto    a',
'    where cdgo_clnte                    = :F_CDGO_CLNTE',
'      and id_impsto                     = :P200_ID_IMPSTO',
'      and indcdor_lqdcion_pblco         = ''S''',
'      and actvo                         = ''S''',
' order by nmbre_impsto_sbmpsto'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P200_ID_IMPSTO'
,p_ajax_items_to_submit=>'P200_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el sub tributo a liquidar'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5403557965581027)
,p_name=>'P200_ID_IMPSTO_ACTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(175863611059962586)
,p_prompt=>'Acto'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''['' || cdgo_impsto_acto || ''] '' || nmbre_impsto_acto      d',
'        , id_impsto_acto         r',
'     from df_i_impuestos_acto    a',
'    where id_impsto_sbmpsto      = :P200_ID_IMPSTO_SBMPSTO',
'      and actvo                  = ''S''',
' order by nmbre_impsto_acto',
'   '))
,p_lov_cascade_parent_items=>'P200_ID_IMPSTO_SBMPSTO'
,p_ajax_items_to_submit=>'P200_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione el Acto a liquidar'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5404458621581028)
,p_name=>'P200_ID_IMPSTO_ACTO_CNCPTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(175863611059962586)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''[{"ID_IMPSTO_ACTO_CNCPTO":"'' || min(a.id_impsto_acto_cncpto) || ''"}]'' a',
'	 from v_df_i_impuestos_acto_concepto		a',
'	where a.id_impsto_acto 						= :P200_ID_IMPSTO_ACTO',
'	  and a.actvo 								= ''S''',
'	  and a.vgncia 								= :P200_VGNCIA_ACTUAL',
'	  and a.prdo 								= :P200_ID_PRDO_ACTUAL',
'	  and (sysdate 								<= cast(a.fcha_vncmnto as date) or a.fcha_vncmnto is null)'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5404891065581028)
,p_name=>'P200_INDCDOR_RQRE_ASCDA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(175863611059962586)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_indcdor_rqre_ascsda     number := 0;',
'begin',
'',
'    begin',
'        select count(id_impsto_acto) id_impsto_acto',
'          into v_indcdor_rqre_ascsda',
'          from df_i_impuestos_acto           a',
'          join gi_d_subimpuestos_asociada    b on a.id_impsto_sbmpsto = b.id_impsto_sbmpsto',
'         where b.cdgo_clnte                  = :F_CDGO_CLNTE',
'           and a.id_impsto_sbmpsto           = :P200_ID_IMPSTO_SBMPSTO',
'           and a.indcdor_rqre_ascsda         = ''S''',
'           and a.id_impsto_acto              = :P200_ID_IMPSTO_ACTO',
'           ;',
'    exception',
'        when others then ',
'            v_indcdor_rqre_ascsda := 0;',
'    end;',
'    ',
'    if v_indcdor_rqre_ascsda > 0 then',
'        return ''S'';',
'    else ',
'        return ''N'';',
'    end if;',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5405208342581030)
,p_name=>'P200_INDCDOR_RQRE_AUTRZCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(175863611059962586)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_rqre_autrzcion',
'     from df_i_impuestos_subimpuesto',
'    where id_impsto_sbmpsto            = :P200_ID_IMPSTO_SBMPSTO'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5410443882581086)
,p_name=>'P200_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(351374595523103860)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_help_text=>'Seleccione el tributo asociado al acuerdo de pago.'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5411367627581089)
,p_name=>'P200_CDGO_SJTO_TPO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(351374595523103860)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5411715438581089)
,p_name=>'P200_ID_SJTO_IMPSTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(351374595523103860)
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5412176300581090)
,p_name=>'P200_PRMTRO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(351374595523103860)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_column=>3
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del sujeto al que se le realizar\00E1 la liquidaci\00F3n de la renta.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5413078665581090)
,p_name=>'P200_RSPSTA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(351374595523103860)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5413415356581090)
,p_name=>'P200_VGNCIA_ACTUAL'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(351374595523103860)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte 				  => :F_CDGO_CLNTE, ',
'                                                       p_cdgo_dfncion_clnte_ctgria    => ''GFN'', ',
'                                                       p_cdgo_dfncion_clnte		      => ''VAC'') vngcia',
'from dual;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5413841062581091)
,p_name=>'P200_ID_PRDO_ACTUAL'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(351374595523103860)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte 				  => :F_CDGO_CLNTE, ',
'                                                       p_cdgo_dfncion_clnte_ctgria    => ''GFN'', ',
'                                                       p_cdgo_dfncion_clnte 		  => ''PAC'') a',
'  from dual;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5414575302581101)
,p_name=>'P200_IDNTFCCION_SJTO_FRMTDA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(79394311112908987)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5414802160581103)
,p_name=>'P200_NMBRE_RZON_SCIAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(79394311112908987)
,p_prompt=>'Nombre / Razon Social'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5415279000581103)
,p_name=>'P200_UBCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(79394311112908987)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5415655451581103)
,p_name=>'P200_DRCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(79394311112908987)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5416013303581104)
,p_name=>'P200_CDGO_SJTO_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(79394311112908987)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5416736527581104)
,p_name=>'P200_LBEL_ITEM_FCHA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(10314305875186394)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5417198364581104)
,p_name=>'P200_INDCDOR_USA_EXTRNJRO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(10314305875186394)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5417584995581105)
,p_name=>'P200_INDCDOR_USA_MXTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(10314305875186394)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75049346240310045)
,p_name=>'P200_INDCDOR_RQRE_ADJNTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(175863611059962586)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_rqre_adjnto',
'     from df_i_impuestos_subimpuesto',
'    where id_impsto_sbmpsto            = :P200_ID_IMPSTO_SBMPSTO'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75049554728310047)
,p_name=>'P200_ID_SJTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(351374595523103860)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78952158366533301)
,p_name=>'P200_INDCDOR_EXTRNJRO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(175863611059962586)
,p_item_default=>'N'
,p_prompt=>unistr('\00BFExtranjero?')
,p_display_as=>'NATIVE_YES_NO'
,p_display_when=>'P200_INDCDOR_USA_EXTRNJRO'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78952284593533302)
,p_name=>'P200_INDCDOR_MXTO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(175863611059962586)
,p_item_default=>'N'
,p_prompt=>unistr('\00BFMixto?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_display_when=>'P200_INDCDOR_USA_MXTO'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78952461649533304)
,p_name=>'P200_BRANCH'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(10314305875186394)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92264030662839105)
,p_name=>'P200_INDCDOR_LQDCCION_ADCNAL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(175863611059962586)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_lqdccion_adcnal',
'     from gi_d_rntas_cnfgrcion_sbmpst',
'    where id_impsto_sbmpsto            = :P200_ID_IMPSTO_SBMPSTO'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92264117584839106)
,p_name=>'P200_INDCDOR_EXNCION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(175863611059962586)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_exncion',
'     from gi_d_rntas_cnfgrcion_sbmpst',
'    where id_impsto_sbmpsto            = :P200_ID_IMPSTO_SBMPSTO'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(5418045377581122)
,p_computation_sequence=>10
,p_computation_item=>'P200_CDGO_SJTO_TPO_IMPSTO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_sjto_tpo',
'  from df_c_impuestos    a',
' where a.cdgo_clnte      = :F_CDGO_CLNTE',
'   and a.id_impsto       = :P200_ID_IMPSTO'))
,p_compute_when=>'P200_ID_IMPSTO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5418493826581128)
,p_validation_name=>'Validar SubImpuesto no Null'
,p_validation_sequence=>10
,p_validation=>'P200_ID_IMPSTO_SBMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un Sub-Tributo a liquidar para continuar'
,p_when_button_pressed=>wwv_flow_api.id(5401583452581003)
,p_associated_item=>wwv_flow_api.id(5402655486581010)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5418874276581148)
,p_validation_name=>'Validar Impuesto Acto no Null'
,p_validation_sequence=>20
,p_validation=>'P200_ID_IMPSTO_ACTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleecionar un Acto para continuar'
,p_when_button_pressed=>wwv_flow_api.id(5401583452581003)
,p_associated_item=>wwv_flow_api.id(5403557965581027)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5419249573581148)
,p_validation_name=>'Validar Impuestos Conceptos No Nulo'
,p_validation_sequence=>30
,p_validation=>'select 1 from json_table(:P200_ID_IMPSTO_ACTO_CNCPTO,''$[*]''columns id_impsto_acto_cncpto path ''$.ID_IMPSTO_ACTO_CNCPTO'')'
,p_validation_type=>'EXISTS'
,p_error_message=>'Debe selecionar un concepto para continuar'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(5401583452581003)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5421160114581155)
,p_name=>unistr('Al hacer clic en el bot\00F3n consultar')
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(5410000713581079)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5421664788581160)
,p_event_id=>wwv_flow_api.id(5421160114581155)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    v_ctdad_acrdos          number    := 0;',
'    v_id_cnvnio             number;',
'    v_tpo_bsqda             varchar2(3);',
'    v_id_sjto               si_c_sujetos.id_sjto%type;',
'    ',
'begin',
unistr('    -- Se consulta si la identificaci\00F3n consultada existe para el impuesto'),
'    begin ',
'        select a.id_sjto_impsto',
'          into v_id_sjto_impsto',
'          from v_si_i_sujetos_impuesto    a',
'          join si_i_personas              b on a.id_sjto_impsto    = b.id_sjto_impsto',
'         where cdgo_clnte                 = :F_CDGO_CLNTE',
'           and id_impsto                  = :P200_ID_IMPSTO',
'           and a.idntfccion_sjto          = :P200_PRMTRO;',
'        ',
'        -- Si existe se retorna el id del sujeto impuesto',
'        apex_util.set_session_state(''P200_RSPSTA'', ''1'');',
'        apex_util.set_session_state(''P200_ID_SJTO_IMPSTO'', v_id_sjto_impsto);',
'',
'    exception',
'        when no_data_found then ',
unistr('            -- Si no existe como sujeto impuesto se consulta la identificaci\00F3n en sujeto para verificar si existe en otro impuesto '),
'            begin ',
'                select id_sjto ',
'                  into v_id_sjto',
'                  from si_c_sujetos',
'                 where cdgo_clnte     = :F_CDGO_CLNTE',
'                   and idntfccion     = :P200_PRMTRO',
'                   and rownum         = 1;',
unistr('                -- Si existe la identificaci\00F3n en sujeto se debe crear como sujeto impuesto para renta de manera automatica   '),
'                apex_util.set_session_state(''P200_RSPSTA'', ''2'');',
'                apex_util.set_session_state(''P200_ID_SJTO'', v_id_sjto);',
'                    ',
'            exception',
'                when others then ',
unistr('                -- Si No existe la identificaci\00F3n en sujeto se debe solicitar la informaci\00F3n para crearlo como sujeto impuesto'),
'                    :P200_RSPSTA                := ''0'';',
'                    :P200_ID_SJTO_IMPSTO        := null;',
'                    apex_util.set_session_state(''P200_RSPSTA'', ''0'');',
'                    apex_util.set_session_state(''P200_ID_SJTO_IMPSTO'', null);',
'           end;',
'',
'        when others then ',
'            apex_util.set_session_state(''P200_RSPSTA'', ''0'');',
'            apex_util.set_session_state(''P200_ID_SJTO_IMPSTO'', null);',
'    end;',
'end;'))
,p_attribute_02=>'P200_PRMTRO'
,p_attribute_03=>'P200_ID_SJTO_IMPSTO,P200_RSPSTA,P200_ID_SJTO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5422108512581161)
,p_event_id=>wwv_flow_api.id(5421160114581155)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($v(''P200_RSPSTA'') == ''1'' ){',
'    // Si existe el sujeto impuesto',
'    apex.submit();',
'}',
'else if  ($v(''P200_RSPSTA'') == ''0'' ){',
'    // No existe el sujeto impuesto',
'    Swal.fire({',
'        icon: ''error'',',
'        title:  ''<H2 >RENTAS VARIAS</H2>'',',
'        html: ''<H4>El Sujeto Impuesto ingresado NO existe. Por Favor registrese</H4>''',
'    }); ',
'}',
'else if  ($v(''P200_RSPSTA'') == ''2'' ){',
'    // No existe el sujeto impuesto pero si el sujeto impuesto',
'    apex.submit();',
'}',
'',
'',
';',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5422585383581162)
,p_name=>unistr('Refrescar P\00E1gina ')
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P200_ID_IMPSTO_ACTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5423535350581162)
,p_event_id=>wwv_flow_api.id(5422585383581162)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P200_ID_IMPSTO_ACTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5423042249581162)
,p_event_id=>wwv_flow_api.id(5422585383581162)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5423931306581162)
,p_name=>'Al seleccionar un concepto, guardarlo en el item de impuestos actos conceptos'
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(10154218530753298)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5424417974581163)
,p_event_id=>wwv_flow_api.id(5423931306581162)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'cal_impstos_actos_cncptos();',
'apex.region("region_conceptos").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5424848469581163)
,p_name=>'New'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P200_ID_IMPSTO_ACTO_CNCPTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5425353090581163)
,p_event_id=>wwv_flow_api.id(5424848469581163)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P200_ID_IMPSTO_ACTO_CNCPTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5420779653581154)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Configuraci\00F3n de Rentas')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.indcdor_usa_extrnjro',
'         , a.indcdor_usa_mxto',
unistr('         , initcap(nvl(a.lbel_fcha_expdcion, ''Fecha de Expedici\00F3n''))'),
'      into :P200_INDCDOR_USA_EXTRNJRO',
'         , :P200_INDCDOR_USA_MXTO',
'         , :P200_LBEL_ITEM_FCHA',
'      from gi_d_rentas_configuracion    a',
'     where a.cdgo_clnte                = :F_CDGO_CLNTE;',
'exception',
'    when others then',
'        :P200_INDCDOR_USA_EXTRNJRO    := ''N'';',
'        :P200_INDCDOR_USA_MXTO        := ''N'';',
unistr('        :P200_LBEL_ITEM_FCHA          := ''Fecha de Expedici\00F3n'';'),
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5420306674581154)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de Datos del Sujeto Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P200_ID_SJTO_IMPSTO is not null and :P200_ID_SJTO is null then ',
'        select a.idntfccion_sjto_frmtda',
'            , upper(a.nmbre_pais || '' '' || a.nmbre_dprtmnto || '' '' || a.nmbre_mncpio)',
'            , a.drccion',
'            , a.cdgo_sjto_tpo',
'            , nmbre_rzon_scial',
'         into :P200_IDNTFCCION_SJTO_FRMTDA',
'            , :P200_UBCCION',
'            , :P200_DRCCION',
'            , :P200_CDGO_SJTO_TPO  ',
'            , :P200_NMBRE_RZON_SCIAL    ',
'         from v_si_i_sujetos_impuesto    a',
'         join si_i_personas              b on a.id_sjto_impsto = b.id_sjto_impsto',
'        where a.id_sjto_impsto           = :P200_ID_SJTO_IMPSTO;',
'    ',
'    elsif :P200_ID_SJTO is not null and (:P200_ID_SJTO_IMPSTO is null or :P200_ID_SJTO_IMPSTO = 0 ) then ',
'        select a.idntfccion_sjto_frmtda',
'            , upper(a.nmbre_pais || '' '' || a.nmbre_dprtmnto || '' '' || a.nmbre_mncpio)',
'            , a.drccion',
'            , a.cdgo_sjto_tpo',
'            , nmbre_rzon_scial',
'         into :P200_IDNTFCCION_SJTO_FRMTDA',
'            , :P200_UBCCION',
'            , :P200_DRCCION',
'            , :P200_CDGO_SJTO_TPO  ',
'            , :P200_NMBRE_RZON_SCIAL ',
'         from v_si_i_sujetos_impuesto    a',
'         join si_i_personas              b on a.id_sjto_impsto = b.id_sjto_impsto',
'        where a.id_sjto_impsto           = (select max(id_sjto_impsto) from si_i_sujetos_impuesto where id_sjto = :P200_ID_SJTO) ;',
'    else',
'        :P200_IDNTFCCION_SJTO_FRMTDA       := null;',
'        :P200_IDNTFCCION_ANTRIOR_FRMTDA    := null;',
'        :P200_UBCCION                      := null;',
'        :P200_DRCCION                      := null;',
'        :P200_CDGO_SJTO_TPO                := null;',
'        :P200_MTRCLA_INMBLRIA              := null;',
'        :P200_ID_SJTO_IMPSTO               := null;',
'    end if;',
'exception',
'    when others then',
'        :P200_IDNTFCCION_SJTO_FRMTDA       := null;',
'        :P200_IDNTFCCION_ANTRIOR_FRMTDA    := null;',
'        :P200_UBCCION                      := null;',
'        :P200_DRCCION                      := null;',
'        :P200_CDGO_SJTO_TPO                := null;',
'        :P200_MTRCLA_INMBLRIA              := null;',
'        :P200_ID_SJTO_IMPSTO               := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5419558597581148)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto Impuesto x BTN_CONSULTAR'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    ',
'begin',
'    select a.id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto    a',
'      join si_i_predios               b on a.id_sjto_impsto    = b.id_sjto_impsto',
'     where cdgo_clnte                 = :F_CDGO_CLNTE',
'       and id_impsto                  = :P200_ID_IMPSTO',
'       and (',
'               (:P200_TPO_BSQDA       = ''REF'' and a.idntfccion_sjto     = :P200_PRMTRO) or',
'               (:P200_TPO_BSQDA       = ''RAN'' and a.idntfccion_antrior  = :P200_PRMTRO) or',
'               (:P200_TPO_BSQDA       = ''DIR'' and a.drccion             = :P200_PRMTRO) or',
'               (:P200_TPO_BSQDA       = ''MTR'' and b.mtrcla_inmblria     = :P200_PRMTRO)',
'            );',
'    ',
'    :P200_RSPSTA := ''1'';',
'    :P200_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'exception',
'    when no_data_found then ',
'    :P200_ID_SJTO_IMPSTO := null;',
'     :P200_RSPSTA := ''0'';',
'     --:P200_RSPSTA := '' No Existe el Sujeto Impuesto'' ;',
'end;'))
,p_process_error_message=>'&P200_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5410000713581079)
,p_process_success_message=>'&P200_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5419923063581153)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Cache de Id sujeto Impuesto'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P200_ID_SJTO_IMPSTO'
,p_process_error_message=>'&P200_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5410000713581079)
,p_process_when=>':P200_ID_SJTO_IMPSTO IS NULL or :P200_ID_SJTO_IMPSTO = 0'
,p_process_when_type=>'SQL_EXPRESSION'
,p_process_success_message=>'&P200_RSPSTA.'
);
end;
/
