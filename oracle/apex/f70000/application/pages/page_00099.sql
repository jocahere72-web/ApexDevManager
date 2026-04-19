prompt --application/pages/page_00099
begin
wwv_flow_api.create_page(
 p_id=>99
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Liquidaci\00F3n Rentas')
,p_step_title=>unistr('Liquidaci\00F3n Rentas')
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#conceptosActos_ig_report_settings{',
'    display:none;',
'}',
'#conceptos_ig_report_settings{',
'    display:none;',
'}'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20210205080905'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16224042920689145)
,p_plug_name=>unistr('Liquidaci\00F3n Rentas')
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(164085715180707699)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(19863316626456068)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(164098974360707738)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16224400143689149)
,p_plug_name=>'<b>Contribuyente</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(36809005405463007)
,p_plug_name=>'<b>Actos por Conceptos</b>'
,p_region_name=>'conceptos'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''['' || a.cdgo_cncpto  ||  ''] '' || a.dscrpcion_cncpto dscrpcion_cncpto',
'        , a.vlor_bse_grvble',
'		, a.trfa',
'        , vlor_lqddo',
'        , vlor_intres',
'        , (vlor_lqddo + vlor_intres) vlor_ttal ',
'  from v_gi_g_rentas_acto_concepto a',
'  where id_rnta = :P99_ID_RNTA'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P98_INDCDOR_CNCPTO_ACMLBLE = ''N'' or :P93_ID_IMPSTO_ACTO is not null'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4857793504958928)
,p_name=>'VLOR_BSE_GRVBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_BSE_GRVBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Base'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(4857841572958929)
,p_name=>'TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRFA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tarifa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(37513090015196633)
,p_name=>'VLOR_LQDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_LQDDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br>Liquidado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>true
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(37513190584196634)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor <br>Inter\00E9s Mora')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(37513889907196641)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>106
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
 p_id=>wwv_flow_api.id(38290410232203822)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Valor Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(37512597018196628)
,p_internal_uid=>37512597018196628
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
 p_id=>wwv_flow_api.id(38090672211013289)
,p_interactive_grid_id=>wwv_flow_api.id(37512597018196628)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(38090700683013289)
,p_report_id=>wwv_flow_api.id(38090672211013289)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5011944763286413)
,p_view_id=>wwv_flow_api.id(38090700683013289)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(4857793504958928)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98.58500000000004
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5012455103286423)
,p_view_id=>wwv_flow_api.id(38090700683013289)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(4857841572958929)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(38093237084013305)
,p_view_id=>wwv_flow_api.id(38090700683013289)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(37513090015196633)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(38093766618013306)
,p_view_id=>wwv_flow_api.id(38090700683013289)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(37513190584196634)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(38097114171013324)
,p_view_id=>wwv_flow_api.id(38090700683013289)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(37513889907196641)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>460.277
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(38496341898988878)
,p_view_id=>wwv_flow_api.id(38090700683013289)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(38290410232203822)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>198.02499999999998
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37511956699196622)
,p_plug_name=>unistr('<b>Informaci\00F3n Asociada</b>')
,p_region_name=>'asociadaInfo'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P93_INDCDOR_RQRE_ASCDA'
,p_plug_display_when_cond2=>'S'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38288472019203802)
,p_plug_name=>unistr('<b>Informaci\00F3n Adicional</b>')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'htp.p(pkg_gi_titulos_ejecutivo.fnc_gn_region_metadatos(p_cdgo_clnte          =>    :F_CDGO_CLNTE,',
'                                                       p_id_impsto           =>    :P93_ID_IMPSTO,',
'                                                       p_id_impsto_sbmpsto   =>    :P93_ID_IMPSTO_SBMPSTO,',
'                                                       p_id_orgen            =>    :P99_ID_RNTA,',
'                                                       p_dsbled              =>    ''S''',
'                                                       ));'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P93_EXISTE_INFRMCION_ADCNAL'
,p_plug_display_when_cond2=>'S'
,p_plug_read_only_when_type=>'ALWAYS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43677266640611325)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>    ',
unistr('    <p align="justify">La funcionalidad liquidaci\00F3n de rentas permite al funcionario<br><br> '),
'       <b>1.</b> Liquidar la renta correspondiente.<br><br>',
'       <b>2.</b> Paso a movimientos financieros.<br><br>',
unistr('       <b>3.</b> Determinaci\00F3n de la deuda.<br><br>'),
unistr('       <b>4.</b> Generaci\00F3n de documento de pago.<br>'),
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>    '),
'</i>     '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(48822964565194308)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(78104550551464750)
,p_plug_name=>'<b>Actos por Conceptos Acumulados</b>'
,p_region_name=>'conceptosActos'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select cdgo_cncpto',
'           , dscrpcion_cncpto',
'           , sum(bse_cncpto) bse_cncpto',
'           , trfa',
'           , sum(vlor_lqddo) vlor_lqddo',
'           , sum(vlor_intres) vlor_intres_mra',
'           , sum(vlor_lqddo+vlor_intres) vlor_ttal     ',
'           , acmldo',
'      from v_gi_g_rentas_acto_concepto',
'     where id_rnta = :P99_ID_RNTA',
'       and vlor_lqddo > 0                                                        ',
'  group by cdgo_cncpto',
'          , dscrpcion_cncpto',
'          , trfa',
'          , txto_trfa',
'          , acmldo;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P98_INDCDOR_CNCPTO_ACMLBLE = ''S'' and :P93_ACTOS is not null'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(39261572693813821)
,p_name=>'TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRFA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(39261618529813822)
,p_name=>'ACMLDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACMLDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(78104846032464753)
,p_name=>'CDGO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('C\00F3digo <br>Concepto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(78105025537464754)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(78105045604464755)
,p_name=>'BSE_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BSE_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(78105294251464757)
,p_name=>'VLOR_LQDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_LQDDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Valor <br>Liquidado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(78105360548464758)
,p_name=>'VLOR_INTRES_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES_MRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Valor <br>Inter\00E9s Mora')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(78105470078464759)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Valor Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(78104723462464751)
,p_internal_uid=>78104723462464751
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
 p_id=>wwv_flow_api.id(79077754746074983)
,p_interactive_grid_id=>wwv_flow_api.id(78104723462464751)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(79077864472074983)
,p_report_id=>wwv_flow_api.id(79077754746074983)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(40029145281460265)
,p_view_id=>wwv_flow_api.id(79077864472074983)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(39261572693813821)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(40029607696460269)
,p_view_id=>wwv_flow_api.id(79077864472074983)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(39261618529813822)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(79078861665074992)
,p_view_id=>wwv_flow_api.id(79077864472074983)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(78104846032464753)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(79079338664074993)
,p_view_id=>wwv_flow_api.id(79077864472074983)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(78105025537464754)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>300
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(79079881550074995)
,p_view_id=>wwv_flow_api.id(79077864472074983)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(78105045604464755)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(79080896333075002)
,p_view_id=>wwv_flow_api.id(79077864472074983)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(78105294251464757)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(79081340831075004)
,p_view_id=>wwv_flow_api.id(79077864472074983)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(78105360548464758)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(79081888214075006)
,p_view_id=>wwv_flow_api.id(79077864472074983)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(78105470078464759)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(39812393519260911)
,p_view_id=>wwv_flow_api.id(79077864472074983)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(78105294251464757)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(39812605329268334)
,p_view_id=>wwv_flow_api.id(79077864472074983)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(78105360548464758)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(39812672521268334)
,p_view_id=>wwv_flow_api.id(79077864472074983)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(78105470078464759)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23166669562553161)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(48822964565194308)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(48823525893194314)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(48822964565194308)
,p_button_name=>'BTN_TRMNAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Terminar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>':P99_ID_DCMNTO is null and :P99_ENTRNO = ''PRVDO'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(48823455856194313)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(48822964565194308)
,p_button_name=>'BTN_IMPRMIR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Imprimir Recibo Pago'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>':P99_ID_DCMNTO is not null and :P99_ENTRNO = ''PRVDO'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(39043065624329805)
,p_branch_name=>'Imprimir Documento'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_XML,P2_NMBRE_RPRTE:&P99_ID_RPRTE.,<data><P_ID_DCMNTO>&F_ID_DCMNTO.</P_ID_DCMNTO><P_ID_RNTA>&P99_ID_RNTA.</P_ID_RNTA></data>,Documento_&P99_NMRO_DCMNTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(48823455856194313)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(48822885537194307)
,p_branch_name=>unistr('Ir a P\00E1gina 89')
,p_branch_action=>'f?p=&APP_ID.:89:&SESSION.::&DEBUG.:RP,89::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(23166669562553161)
,p_branch_sequence=>20
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P99_ENTRNO'
,p_branch_condition_text=>'PRVDO'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5617193461742834)
,p_branch_name=>unistr('Ir a P\00E1gina 136')
,p_branch_action=>'f?p=&APP_ID.:136:&SESSION.::&DEBUG.:RP,89:P136_ID_RNTA:&P99_ID_RNTA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(23166669562553161)
,p_branch_sequence=>30
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P99_ENTRNO'
,p_branch_condition_text=>'PBLCO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5617061395742833)
,p_name=>'P99_ENTRNO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(16224042920689145)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37510965623196612)
,p_name=>'P99_DSCRPCION_ASCDA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(37511956699196622)
,p_prompt=>'Asociada'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37511083285196613)
,p_name=>'P99_FCHA_EXPDCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(16224400143689149)
,p_prompt=>'Fecha de &P93_LBEL_FCHA.'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37511116532196614)
,p_name=>'P99_FCHA_RGSTRO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(16224400143689149)
,p_prompt=>unistr('Fecha de Liquidaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37511296360196615)
,p_name=>'P99_IDNTFCCION_SJTO_FRMTDA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(16224400143689149)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37511305561196616)
,p_name=>'P99_INDCDOR_USA_EXTRNJRO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(16224400143689149)
,p_prompt=>unistr('\00BFExtranjero?')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37511435613196617)
,p_name=>'P99_INDCDOR_USA_MXTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(16224400143689149)
,p_prompt=>unistr('\00BFMixto?')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37511537992196618)
,p_name=>'P99_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(16224400143689149)
,p_prompt=>'SubTributo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37511661465196619)
,p_name=>'P99_TXTO_ASCDA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(37511956699196622)
,p_prompt=>'Soporte Asociada'
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
 p_id=>wwv_flow_api.id(37511821965196621)
,p_name=>'P99_VLOR_BSE_GRVBLE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(16224400143689149)
,p_prompt=>'Base de Renta'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38290272855203820)
,p_name=>'P99_ID_LQDCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(16224042920689145)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38290363059203821)
,p_name=>'P99_RSPSTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(16224042920689145)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38290632933203824)
,p_name=>'P99_ID_RPRTE'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(16224400143689149)
,p_prompt=>unistr('Plantilla Liquidaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_rprte d ,',
'        id_rprte r',
'   from gn_d_reportes',
'  where cdgo_rprte_grpo = ''RRV'''))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione la plantilla del recibo de pago de liquidaci\00F3n.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39042716272329802)
,p_name=>'P99_CDGO_RCBO_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(16224042920689145)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39042807407329803)
,p_name=>'P99_VGNCIA_PRDO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(16224042920689145)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39042957455329804)
,p_name=>'P99_NMRO_DCMNTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(16224042920689145)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45243627447472109)
,p_name=>'P99_ID_RNTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(16224042920689145)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48822204179194301)
,p_name=>'P99_VLOR_SIN_FRMTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(16224042920689145)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49020153836734001)
,p_name=>'P99_ID_DCMNTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(16224042920689145)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(45243734934472110)
,p_computation_sequence=>10
,p_computation_item=>'P99_ID_RNTA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'nvl(:P93_ID_RNTA, :P98_ID_RNTA)'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(48822327611194302)
,p_computation_sequence=>10
,p_computation_item=>'P99_VLOR_SIN_FRMTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'to_number(:P91_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(38290152208203819)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Registro Liquidaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar2(1000);',
'begin',
'    pkg_gi_rentas.prc_rg_liquidacion_rentas(p_cdgo_clnte			=>    :F_CDGO_CLNTE',
'                                            ,p_id_impsto			=>    :P93_ID_IMPSTO',
'                                            ,p_id_impsto_sbmpsto	=>    :P93_ID_IMPSTO_SBMPSTO',
'                                            ,p_id_sjto_impsto		=>    :P91_ID_SJTO_IMPSTO                                         ',
'                                            ,p_bse_grvble			=>    to_number(:P91_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                            ,p_id_rnta				=>    :P99_ID_RNTA',
'                                            ,p_id_usrio             =>    :F_ID_USRIO',
'                                            ,o_id_lqdcion           =>    :P99_ID_LQDCION ',
'                                            ,o_cdgo_rspsta			=>    v_cdgo_rspsta',
'                                            ,o_mnsje_rspsta			=>    v_mnsje_rspsta);',
'    if (v_cdgo_rspsta != 0) then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'    ',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(48823525893194314)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40650516350356905)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Determinar Deuda'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta            number;',
'    v_mnsje_rspsta           varchar2(4000); ',
'begin',
'    ',
'    begin',
'       select listagg ((vgncia||'',''||prdo),'':'') within group (order by vgncia, prdo), ''DNO''',
'         into :P99_VGNCIA_PRDO, :P99_CDGO_RCBO_TPO',
'         from (select vgncia, prdo',
'                 from v_gi_g_rentas_acto_concepto',
'                where id_rnta = :P99_ID_RNTA',
'                group by vgncia, prdo);',
'    exception',
'        when no_data_found then',
'            raise_application_error(-20001, ''Error al consultar vigencia y periodo''||sqlerrm);',
'    end;',
'    ',
'    /*begin',
'        pkg_gi_determinacion.prc_gn_determinacion ( p_cdgo_clnte            =>     :F_CDGO_CLNTE',
'                                                   ,p_id_impsto             =>     :P93_ID_IMPSTO',
'                                                   ,p_id_impsto_sbmpsto     =>     :P93_ID_IMPSTO_SBMPSTO',
'                                                   ,p_id_sjto_impsto        =>     :P91_ID_SJTO_IMPSTO	',
'                                                   ,p_cdna_vgncia_prdo      =>     :P99_VGNCIA_PRDO',
'                                                   ,p_tpo_orgen             =>     ''LQ''',
'                                                   ,p_id_orgen              =>     :P99_ID_LQDCION',
'                                                   ,p_id_usrio              =>     :F_ID_USRIO',
'                                                   ,o_cdgo_rspsta           =>     v_cdgo_rspsta',
'                                                   ,o_mnsje_rspsta          =>     v_mnsje_rspsta);',
'        if (v_cdgo_rspsta != 0) then',
'            raise_application_error(-20001, v_mnsje_rspsta);',
'        end if;',
'        ',
'    end;*/',
'',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(48823525893194314)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(48822575763194304)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Json Documentos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Arma el array json de cartera',
'begin',
'    select JSON_OBJECT (''VGNCIA_PRDO''   value JSON_ARRAYAGG(',
'           JSON_OBJECT (''vgncia''    value vgncia,',
'                        ''prdo''      value prdo,',
'                        ''id_orgen''  value id_orgen))) vgncias_prdo',
'      into :P99_VGNCIA_PRDO                      ',
'      from (',
'            select  vgncia',
'                ,   prdo',
'                ,   id_orgen',
'              from  v_gf_g_movimientos_financiero ',
'             where  cdgo_clnte = :F_CDGO_CLNTE',
'               and  id_orgen = :P99_ID_LQDCION',
'            );',
'exception',
'    when others then',
'        raise_application_error(-20001, ''Error al armar el json del documento ''||sqlerrm);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(48823525893194314)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39042621767329801)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_dcmnto                re_g_documentos.id_dcmnto%type;',
'    v_vlor_ttal_dcmnto         number;',
'    v_cdgo_rspsta              number;  ',
'    v_mnsje_rspsta             varchar2(1000);   ',
'    v_fcha_vncmnto             date;',
'begin',
'',
'    -- Consulta el total del documento',
'    begin',
'        select (sum(vlor_lqddo)+ sum(vlor_intres))',
'          into v_vlor_ttal_dcmnto  ',
'          from v_gi_g_rentas_acto_concepto',
'         where id_rnta = :P99_ID_RNTA;',
'',
'    exception',
'        when others then',
'            raise_application_error(-20001, ''Error al totalizar el documento ''||sqlerrm);',
'    end;',
'    ',
'      ',
'    v_id_dcmnto := pkg_re_documentos.fnc_gn_documento (p_cdgo_clnte 			=> :F_CDGO_CLNTE, ',
'                                                       p_id_impsto 			    => :P93_ID_IMPSTO, ',
'                                                       p_id_impsto_sbmpsto 	    => :P93_ID_IMPSTO_SBMPSTO, ',
'                                                       p_cdna_vgncia_prdo		=> :P99_VGNCIA_PRDO,',
'                                                       p_cdna_vgncia_prdo_ps	=> null,',
'                                                       p_id_dcmnto_lte		    => null,',
'                                                       p_id_sjto_impsto         => :P91_ID_SJTO_IMPSTO,',
'                                                       p_fcha_vncmnto			=> :P98_FCHA_VNCMNTO,',
'                                                       p_cdgo_dcmnto_tpo        => :P99_CDGO_RCBO_TPO,',
'                                                       p_nmro_dcmnto            => null,',
'                                                       p_vlor_ttal_dcmnto       => v_vlor_ttal_dcmnto,',
'                                                       p_indcdor_entrno         => ''PRVDO'');',
'                                                       ',
'    if (v_id_dcmnto > 0)  then ',
'         :F_ID_DCMNTO := to_number(v_id_dcmnto);',
'         ',
'         begin',
'             select nmro_dcmnto, fcha_vncmnto',
'               into :P99_NMRO_DCMNTO, v_fcha_vncmnto',
'               from re_g_documentos',
'              where id_dcmnto = :F_ID_DCMNTO;',
'                              ',
'            begin',
'                pkg_gi_rentas.prc_an_movimientos_financiero( p_cdgo_clnte           =>    :F_CDGO_CLNTE',
'                                                            ,p_id_lqdcion 			=>    :P99_ID_LQDCION',
'                                                            ,p_id_dcmnto			=>    :F_ID_DCMNTO',
'                                                            ,p_id_rnta				=>    :P99_ID_RNTA',
'                                                            ,p_fcha_vncmnto_dcmnto  =>    v_fcha_vncmnto',
'                                                            ,o_cdgo_rspsta			=>    v_cdgo_rspsta',
'                                                            ,o_mnsje_rspsta			=>    v_mnsje_rspsta',
'                                                            );',
'                if (v_cdgo_rspsta != 0) then',
'                    raise_application_error(-20001, v_mnsje_rspsta);',
'                end if;',
'                ',
'            end;          ',
'            ',
'         exception',
'             when others then',
'                 raise_application_error(-20001, ''Error al actualizar la tabla de rentas''||sqlerrm);',
'         end;',
'          ',
'    end if;                                                ',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(48823525893194314)
,p_process_success_message=>unistr('\00A1Liquidaci\00F3n N\00B0 &P99_ID_LQDCION. Generada Satisfactoriamente!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(37510872972196611)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Datos Liquidaci\00F3n Rentas')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  dscrpcion_ascda',
'        ,   fcha_expdcion',
'        ,   fcha_rgstro',
'        ,   idntfccion_sjto_frmtda',
'        ,   usa_extrnjro',
'        ,   usa_mxto',
'        ,   nmbre_impsto_sbmpsto',
'        ,   txto_ascda',
'        ,   (select case when upper(a.txto_bse_grvble) = ''BASE GRAVABLE'' then to_char(:P99_VLOR_SIN_FRMTO, :F_FRMTO_MNDA) else  :P99_VLOR_SIN_FRMTO || '' '' ||upper(a.txto_bse_grvble) end txto_bse',
'               from df_i_impuestos_acto a ',
'               join gi_g_rentas_acto b on a.id_impsto_acto = b.id_impsto_acto',
'              where b.id_rnta = :P99_ID_RNTA',
'                and rownum = 1) vlor_bse_grvble',
'        , entrno',
'     into   :P99_DSCRPCION_ASCDA',
'        ,   :P99_FCHA_EXPDCION',
'        ,   :P99_FCHA_RGSTRO',
'        ,   :P99_IDNTFCCION_SJTO_FRMTDA',
'        ,   :P99_INDCDOR_USA_EXTRNJRO',
'        ,   :P99_INDCDOR_USA_MXTO',
'        ,   :P99_NMBRE_IMPSTO_SBMPSTO',
'        ,   :P99_TXTO_ASCDA',
'        ,   :P99_VLOR_BSE_GRVBLE ',
'        ,   :P99_ENTRNO',
'     from   v_gi_g_rentas',
'    where   cdgo_clnte = :F_CDGO_CLNTE',
'      and   id_rnta = :P99_ID_RNTA;',
'exception',
'    when no_data_found then',
'        null;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40479783757382205)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Carga Datos Liquidaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select (select id_rprte from gn_d_reportes where cdgo_rprte_grpo = ''RRV'')',
'         ,  id_lqdcion ',
'      into :P99_ID_RPRTE',
'         , :P99_ID_LQDCION',
'      from gi_g_rentas',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and id_rnta = :P99_ID_RNTA;  ',
'exception',
'    when no_data_found then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46019004694660701)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Datos Documentos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.nmro_dcmnto, a.id_dcmnto',
'      into :P99_NMRO_DCMNTO, :P99_ID_DCMNTO',
'      from re_g_documentos a',
'      join gi_g_rentas b on a.id_dcmnto = b.id_dcmnto',
'     where a.cdgo_clnte = :F_CDGO_CLNTE',
'       and b.id_rnta = :P99_ID_RNTA;',
'exception',
'    when no_data_found then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
