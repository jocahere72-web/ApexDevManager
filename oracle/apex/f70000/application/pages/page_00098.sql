prompt --application/pages/page_00098
begin
wwv_flow_api.create_page(
 p_id=>98
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Proyecci\00F3n Liquidaci\00F3n')
,p_step_title=>unistr('Proyecci\00F3n Liquidaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#actosConceptos_ig_report_settings{',
'    display:none;',
'}',
'#conceptosActos_ig_report_settings{',
'    display:none;',
'}'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200602144846'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20508985588041508)
,p_plug_name=>unistr('Proyecci\00F3n Liquidaci\00F3n')
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
 p_id=>wwv_flow_api.id(39260743675813813)
,p_plug_name=>unistr('Liquidaci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(20508985588041508)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40652089853356920)
,p_plug_name=>'Conceptos'
,p_parent_plug_id=>wwv_flow_api.id(20508985588041508)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P98_FCHA_VNCMNTO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21841803516380231)
,p_plug_name=>'Conceptos Actos'
,p_region_name=>'actosConceptos'
,p_parent_plug_id=>wwv_flow_api.id(40652089853356920)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''['' || a.cdgo_cncpto  ||  ''] '' || a.dscrpcion_cncpto dscrpcion_cncpto',
'        , a.fcha_vncmnto',
'        , a.dias_mra',
'        , a.txto_trfa',
'        , a.bse_grvble',
'        , a.vlor_lqddo',
'        , a.vlor_intres_mra',
'        , a.vlor_ttal vlor_ttal',
'     from table (pkg_gi_rentas.fnc_cl_select_cncptos_lqdcion(p_cdgo_clnte 				=>    :F_CDGO_CLNTE',
'											               , p_json						=>    :P93_CNCPTOS',
'											               , p_id_impsto                =>    :P93_ID_IMPSTO',
'                                                           , p_id_impsto_sbmpsto        =>    :P93_ID_IMPSTO_SBMPSTO  ',
'                                                           , p_vlor_bse					=>    to_number(:P91_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'											               , p_indcdor_usa_extrnjro		=>    nvl(:P91_INDCDOR_USA_EXTRNJRO,''N'')',
'											               , p_indcdor_usa_mxto			=>    nvl(:P91_INDCDOR_USA_MXTO,''N'')',
'                                                           , p_fcha_expdcion            =>    :P91_FCHA_EXPDCION',
'                                                           , p_fcha_vncmnto             =>    :P98_FCHA_VNCMNTO)) a',
'     left join json_table (:P93_ACTOS, ''$[*]'' columns(id_impsto_acto number path ''$.ID_IMPSTO_ACTO'' )) b on a.id_impsto_acto = b.id_impsto_acto',
'    where a.cdgo_clnte         = :F_CDGO_CLNTE',
'      and a.vlor_lqddo          > 0',
'      and (a.id_impsto_acto    = :P93_ID_IMPSTO_ACTO or :P93_ID_IMPSTO_ACTO is null)'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P98_INDCDOR_CNCPTO_ACMLBLE = ''N'' or :P93_ID_IMPSTO_ACTO is not null'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4857693716958927)
,p_name=>'BSE_GRVBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BSE_GRVBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Base Gravable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(21842168014380234)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(21842713165380240)
,p_name=>'VLOR_LQDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_LQDDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br>Liquidado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(21843557948380248)
,p_name=>'VLOR_INTRES_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES_MRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor <br>Inter\00E9s Mora')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(21843619826380249)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(23472768275342201)
,p_name=>'DIAS_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIAS_MRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('D\00EDas<br>Mora')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23472814792342202)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha<br>Vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(36808613121463003)
,p_name=>'TXTO_TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_TRFA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tarifa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(21841973975380232)
,p_internal_uid=>21841973975380232
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
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
 p_id=>wwv_flow_api.id(22083977307745025)
,p_interactive_grid_id=>wwv_flow_api.id(21841973975380232)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(22084011254745026)
,p_report_id=>wwv_flow_api.id(22083977307745025)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1688195247076)
,p_view_id=>wwv_flow_api.id(22084011254745026)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(4857693716958927)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>98.698
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22084954635745036)
,p_view_id=>wwv_flow_api.id(22084011254745026)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(21842168014380234)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>395.887
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22087922518745048)
,p_view_id=>wwv_flow_api.id(22084011254745026)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(21842713165380240)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22106497589862280)
,p_view_id=>wwv_flow_api.id(22084011254745026)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(21843557948380248)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22106938652862281)
,p_view_id=>wwv_flow_api.id(22084011254745026)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(21843619826380249)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>132.969
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23478712993342493)
,p_view_id=>wwv_flow_api.id(22084011254745026)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(23472768275342201)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>55.099999999999994
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23479291417342495)
,p_view_id=>wwv_flow_api.id(22084011254745026)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(23472814792342202)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(36834660755669543)
,p_view_id=>wwv_flow_api.id(22084011254745026)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(36808613121463003)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>63.650000000000006
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(91828000000)
,p_view_id=>wwv_flow_api.id(22084011254745026)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(21843619826380249)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(196125000006)
,p_view_id=>wwv_flow_api.id(22084011254745026)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(21842713165380240)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(291354000007)
,p_view_id=>wwv_flow_api.id(22084011254745026)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(21843557948380248)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38292222872203840)
,p_plug_name=>'Conceptos Actos Acumulados'
,p_region_name=>'conceptosActos'
,p_parent_plug_id=>wwv_flow_api.id(40652089853356920)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_cncpto',
'     , cdgo_cncpto',
'       ,dscrpcion_cncpto',
'       ,sum(bse_grvble) bse_cncpto',
'       ,sum(vlor_lqddo) vlor_lqddo',
'       ,sum(vlor_intres_mra) vlor_intres_mra',
'       ,sum(vlor_ttal) vlor_ttal',
'       ,max(dias_mra) dias_mra',
'       ,bse_grvble',
'       ,tpo_indcdor',
'       ,unco',
' from table (pkg_gi_rentas.fnc_cl_select_cncptos_lqdcion(p_cdgo_clnte          =>    :F_CDGO_CLNTE',
'                                                       ,p_json                 =>    :P93_CNCPTOS',
'                                                       ,p_id_impsto            =>    :P93_ID_IMPSTO',
'                                                       ,p_id_impsto_sbmpsto    =>    :P93_ID_IMPSTO_SBMPSTO  ',
'                                                       ,p_vlor_bse             =>    to_number(:P91_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                                       ,p_indcdor_usa_extrnjro =>    nvl(:P91_INDCDOR_USA_EXTRNJRO,''N'')',
'                                                       ,p_indcdor_usa_mxto     =>    nvl(:P91_INDCDOR_USA_MXTO,''N'')',
'                                                       ,p_fcha_expdcion        =>    :P91_FCHA_EXPDCION',
'                                                       ,p_fcha_vncmnto         =>    :P98_FCHA_VNCMNTO))',
' where id_impsto_acto in (select id from json_table(:P93_ACTOS, ''$[*]'' columns(id number path ''$.ID_IMPSTO_ACTO'' )))',
'  and cdgo_clnte = :F_CDGO_CLNTE',
'  and vlor_lqddo > 0                                                        ',
'group by id_cncpto,cdgo_cncpto',
'      , dscrpcion_cncpto',
'      , bse_grvble',
'      , tpo_indcdor',
'      , unco;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P98_INDCDOR_CNCPTO_ACMLBLE = ''S'' and :P93_ACTOS is not null'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(38292470238203842)
,p_name=>'ID_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO'
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
 p_id=>wwv_flow_api.id(38292518353203843)
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
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(38292697858203844)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(38292717925203845)
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
 p_id=>wwv_flow_api.id(38292966572203847)
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
 p_id=>wwv_flow_api.id(38293032869203848)
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
 p_id=>wwv_flow_api.id(38293142399203849)
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(39259775741813803)
,p_name=>'UNCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNCO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(45243977865472112)
,p_name=>'DIAS_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIAS_MRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('D\00EDas Mora')
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
 p_id=>wwv_flow_api.id(59883255103958013)
,p_name=>'BSE_GRVBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BSE_GRVBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Base'
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
 p_id=>wwv_flow_api.id(59883361997958014)
,p_name=>'TPO_INDCDOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_INDCDOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Indicador /<br>Tarifa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(38292395783203841)
,p_internal_uid=>38292395783203841
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
 p_id=>wwv_flow_api.id(39265427066814073)
,p_interactive_grid_id=>wwv_flow_api.id(38292395783203841)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(39265536792814073)
,p_report_id=>wwv_flow_api.id(39265427066814073)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39266076528814080)
,p_view_id=>wwv_flow_api.id(39265536792814073)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(38292470238203842)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39266533985814082)
,p_view_id=>wwv_flow_api.id(39265536792814073)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(38292518353203843)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39267010984814083)
,p_view_id=>wwv_flow_api.id(39265536792814073)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(38292697858203844)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>279
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39267553870814085)
,p_view_id=>wwv_flow_api.id(39265536792814073)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(38292717925203845)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39268568653814092)
,p_view_id=>wwv_flow_api.id(39265536792814073)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(38292966572203847)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39269013151814094)
,p_view_id=>wwv_flow_api.id(39265536792814073)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(38293032869203848)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39269560534814096)
,p_view_id=>wwv_flow_api.id(39265536792814073)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(38293142399203849)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39271542568814105)
,p_view_id=>wwv_flow_api.id(39265536792814073)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(39259775741813803)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(45846889827982821)
,p_view_id=>wwv_flow_api.id(39265536792814073)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(45243977865472112)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(59904247383746857)
,p_view_id=>wwv_flow_api.id(39265536792814073)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(59883255103958013)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(59905885510780457)
,p_view_id=>wwv_flow_api.id(39265536792814073)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(59883361997958014)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(65840000001)
,p_view_id=>wwv_flow_api.id(39265536792814073)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(38292966572203847)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(277650007424)
,p_view_id=>wwv_flow_api.id(39265536792814073)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(38293032869203848)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(344842007424)
,p_view_id=>wwv_flow_api.id(39265536792814073)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(38293142399203849)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20509170526041510)
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
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>    ',
unistr('    <p align="justify">La funcionalidad proyecci\00F3n de liquidaci\00F3n permite<br><br> '),
unistr('        Realizar preliquidaci\00F3n de las rentas seg\00FAn los conceptos previamente seleccionados.'),
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>     '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40651959989356919)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(39260743675813813)
,p_button_name=>'BTN_GNRAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Generar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(20509029406041509)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(20508985588041508)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(20698043108674302)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(20508985588041508)
,p_button_name=>'NEXT'
,p_button_static_id=>'NEXT'
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
 p_id=>wwv_flow_api.id(20698374097675431)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(20508985588041508)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103612327707757)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
end;
/
begin
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(20511251951041531)
,p_branch_name=>unistr('Ir a P\00E1gina 91')
,p_branch_action=>'f?p=&APP_ID.:91:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(20698374097675431)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(20511516251041534)
,p_branch_name=>unistr('Ir a P\00E1gina 89')
,p_branch_action=>'f?p=&APP_ID.:89:&SESSION.::&DEBUG.:RP,98,91,93::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(20509029406041509)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(16223975535689144)
,p_branch_name=>unistr('Ir a P\00E1gina 99')
,p_branch_action=>'f?p=&APP_ID.:99:&SESSION.::&DEBUG.:RP,99::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(20698043108674302)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22135061327804606)
,p_name=>'P98_CNCPTOS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(20508985588041508)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38291787738203835)
,p_name=>'P98_ID_RNTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(20508985588041508)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40652487533356924)
,p_name=>'P98_RSPSTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(20508985588041508)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40929044211215694)
,p_name=>'P98_FCHA_VNCMNTO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(39260743675813813)
,p_prompt=>'Fecha Vencimiento'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la fecha de vencimiento del recibo de pago de la liquidaci\00F3n.')
,p_attribute_02=>'+0d'
,p_attribute_03=>'&P98_ULTMA_FCHA.'
,p_attribute_04=>'both'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46019224882660703)
,p_name=>'P98_INDCDOR_CNCPTO_ACMLBLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(20508985588041508)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49860358333389001)
,p_name=>'P98_ULTMA_FCHA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(20508985588041508)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39260222103813808)
,p_computation_sequence=>10
,p_computation_item=>'P98_CNCPTOS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select json_arrayagg(json_object(  key ''ID_IMPSTO_ACTO_CNCPTO'' is a.id_impsto_acto_cncpto',
'                                   ,key ''ID_IMPSTO_ACTO''        is a.id_impsto_acto',
'                                   ,key ''GNRA_INTRES_MRA''       is a.gnra_intres_mra',
'                                   ,key ''FCHA_VNCMNTO''          is to_char(a.fcha_vncmnto, ''dd/mm/YYYY'')',
'                                   ,key ''DIAS_MRA''              is nvl(a.dias_mra,''0'')',
'                                   ,key ''BSE_CNCPTO''            is a.bse_grvble',
'                                   ,key ''VLOR_TRFA''             is nvl(a.vlor_trfa,''0'')',
'                                   ,key ''VLOR_INDCDOR''          is a.vlor',
'                                   ,key ''TXTO_TRFA''             is a.txto_trfa',
'                                   ,key ''VLOR_LQDDO''            is a.vlor_lqddo',
'                                   ,key ''VLOR_INTRES_MRA''       is a.vlor_intres_mra',
'                                   ,key ''VLOR_TTAL''             is a.vlor_ttal',
'                                 )',
'                      )cncptos',
' from table (pkg_gi_rentas.fnc_cl_select_cncptos_lqdcion(p_cdgo_clnte 				=>    :F_CDGO_CLNTE',
'											            ,p_json						=>    :P93_CNCPTOS',
'											            ,p_id_impsto                =>    :P93_ID_IMPSTO',
'                                                        ,p_id_impsto_sbmpsto        =>    :P93_ID_IMPSTO_SBMPSTO     ',
'                                                        ,p_vlor_bse				    =>    to_number(:P91_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'											            ,p_indcdor_usa_extrnjro		=>    :P91_INDCDOR_USA_EXTRNJRO',
'											            ,p_indcdor_usa_mxto			=>    :P91_INDCDOR_USA_MXTO',
'                                                        ,p_fcha_expdcion            =>    nvl(:P93_FCHA_EXPDCION,:P91_FCHA_EXPDCION)',
'                                                        ,p_fcha_vncmnto             =>    :P98_FCHA_VNCMNTO)) a',
'left join json_table (:P93_ACTOS, ''$[*]'' columns(id_impsto_acto number path ''$.ID_IMPSTO_ACTO'' )) b on a.id_impsto_acto = b.id_impsto_acto',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and vlor_lqddo > 0',
'       and (a.id_impsto_acto = :P93_ID_IMPSTO_ACTO or :P93_ID_IMPSTO_ACTO is null)                                                        ',
''))
,p_compute_when=>'P98_FCHA_VNCMNTO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(46019353384660704)
,p_computation_sequence=>20
,p_computation_item=>'P98_INDCDOR_CNCPTO_ACMLBLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_valor              number;',
'    v_acmlble            varchar2(1);',
'',
'begin',
'',
'    select count(1)',
'      into v_valor',
'      from v_df_i_impuestos_acto_concepto a',
'      join json_table (:P93_CNCPTOS, ''$[*]'' columns id_impsto_acto_cncpto path ''$.ID_IMPSTO_ACTO_CNCPTO'') b ',
'                   on a.id_impsto_acto_cncpto = b.id_impsto_acto_cncpto',
'      where a.cdgo_clnte = :F_CDGO_CLNTE',
'        and a.id_impsto = :P93_ID_IMPSTO',
'        and a.id_impsto_sbmpsto = :P93_ID_IMPSTO_SBMPSTO',
'        and a.unco = ''S'';',
'      ',
'    if (v_valor > 0) then',
'        v_acmlble:= ''S'';',
'    else',
'        v_acmlble := ''N'';',
'    end if;',
'    ',
'    return v_acmlble;',
'',
'end;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(48822690842194305)
,p_computation_sequence=>20
,p_computation_item=>'P98_FCHA_VNCMNTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select fcha_vncmnto_dcmnto',
'  from gi_g_rentas',
' where id_rnta = :P93_ID_RNTA;'))
,p_compute_when=>':P93_ID_RNTA is not null and :REQUEST is not null'
,p_compute_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(49860442538389002)
,p_computation_sequence=>20
,p_computation_item=>'P98_ULTMA_FCHA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select last_day(to_date(''1/12/''||to_char(sysdate,''YYYY''),''DD/MM/YYYY'')) ultma_fcha from dual'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(45243188302472104)
,p_name=>unistr('Refresca Regi\00F3n')
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(40651959989356919)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(45243280540472105)
,p_event_id=>wwv_flow_api.id(45243188302472104)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(40652089853356920)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(45243352626472106)
,p_event_id=>wwv_flow_api.id(45243188302472104)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(35413321993826906)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registro Actos Conceptos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta         number;',
'    v_mnsje_rspsta        varchar2(2000);',
'    ',
'begin',
'       ',
'    pkg_gi_rentas.prc_rg_proyeccion_renta(p_cdgo_clnte              =>    :F_CDGO_CLNTE',
'                                          ,p_id_usrio               =>    :F_ID_USRIO ',
'                                          ,p_actos_cncpto           =>    :P98_CNCPTOS',
'                                          ,p_id_impsto              =>    :P91_IMPUESTO',
'                                          ,p_id_impsto_sbmpsto      =>    :P91_SUB_IMPUESTO',
'                                          ,p_id_sjto_impsto         =>    :P91_ID_SJTO_IMPSTO',
'                                          ,p_id_sbmpsto_ascda       =>    :P93_ASCDA',
'                                          ,p_txto_ascda             =>    :P93_TXTO_ASCDA',
'                                          ,p_fcha_expdcion          =>    nvl(:P93_FCHA_EXPDCION, :P91_FCHA_EXPDCION)',
'                                          ,p_vlor_bse_grvble        =>    to_number(:P91_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                          ,p_indcdor_usa_mxto       =>    nvl(:P91_INDCDOR_USA_MXTO, ''N'')',
'                                          ,p_indcdor_usa_extrnjro   =>    nvl(:P91_INDCDOR_USA_EXTRNJRO,''N'')',
'                                          ,p_id_rnta                =>    :P93_ID_RNTA',
'                                          ,p_fcha_vncmnto_dcmnto    =>    :P98_FCHA_VNCMNTO',
'                                          ,o_id_rnta                =>    :P98_ID_RNTA',
'                                          ,o_cdgo_rspsta            =>    v_cdgo_rspsta',
'                                          ,o_mnsje_rspsta           =>    v_mnsje_rspsta',
'                                         );',
'',
'    if(v_cdgo_rspsta = 0) then',
unistr('        :P98_RSPSTA:= ''\00A1Preliquidaci\00F3n Generada Satisfactoriamente!'';'),
'    else',
'        rollback;',
'        raise_application_error(-20001, v_mnsje_rspsta || sqlerrm);',
'    end if;',
'        ',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(20698043108674302)
,p_process_success_message=>'&P98_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(48822489859194303)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Registro Informaci\00F3n Adicional')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta            number;',
'begin',
'    pkg_gi_rentas.prc_rg_metadatos_renta(p_id_rnta			=>    nvl(:P98_ID_RNTA, :P93_ID_RNTA)',
'                                        ,p_json_mtdtos      =>    :P93_JSON_MTDTOS',
'                                        ,o_cdgo_rspsta		=>    v_cdgo_rspsta',
'                                        ,o_mnsje_rspsta		=>    :P98_RSPSTA',
'                                        );           ',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(20698043108674302)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from df_i_impstos_sbmpsto_mtdta',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto_sbmpsto = :P93_ID_IMPSTO_SBMPSTO;'))
,p_process_when_type=>'EXISTS'
,p_process_success_message=>'&P98_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74291730314890705)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cerrar sessiones inactivas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    for c_session in (SELECT ''ALTER SYSTEM KILL SESSION ''||''''''''||sid||'',''||serial||'''''''' sentencia',
'                        FROM ( SELECT sid, serial# AS SERIAL',
'                                 FROM v$session',
'                                WHERE status =  ''INACTIVE''',
'                            )',
'                     ) loop',
'           execute immediate c_session.sentencia ;',
'    end loop;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
