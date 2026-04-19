prompt --application/pages/page_00151
begin
wwv_flow_api.create_page(
 p_id=>151
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Cambiar Fecha de Vencimiento'
,p_page_mode=>'MODAL'
,p_step_title=>'Cambiar Fecha de Vencimiento'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
' '))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20250606145233'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(256222764792749198)
,p_plug_name=>'Cambiar Fecha de Vencimiento'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(168575034849289101)
,p_plug_name=>'Conceptos'
,p_region_name=>'conceptos'
,p_parent_plug_id=>wwv_flow_api.id(256222764792749198)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  	 select rownum',
'        , a.cdgo_cncpto || '' - '' || a.dscrpcion_cncpto  dscrpcion_cncpto',
'        , a.vlor_lqddo',
'        , a.vlor_intres_mra',
'        , a.vlor_ttal vlor_ttal',
'        , a.fcha_vncmnto',
'        , a.dias_mra',
'        , a.txto_trfa',
'        , a.bse_grvble',
'     from table (pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte 				=> :F_CDGO_CLNTE',
'                                                           , p_id_impsto                => :P149_ID_IMPSTO',
'                                                           , p_id_impsto_sbmpsto        => :P149_ID_IMPSTO_SBMPSTO  ',
'														   , p_id_impsto_acto           => :P149_ID_IMPSTO_ACTO',
'                                                           , p_id_sjto_impsto           => :P149_ID_SJTO_IMPSTO',
'                                                           --, p_json_cncptos				=>  null',
'                                                           , p_json_cncptos				=> :P151_CNCPTOS',
'                                                           , p_vlor_bse					=> :P149_VLOR_BSE',
'                                                           , p_indcdor_usa_extrnjro		=> nvl(:P149_INDCDOR_USA_EXTRNJRO, ''N'')',
'                                                           , p_indcdor_usa_mxto			=> nvl(:P149_INDCDOR_USA_MXTO, ''N'')',
'                                                           , p_fcha_expdcion            => :P149_FCHA_EXPDCION ',
'                                                           , p_fcha_vncmnto             => :P151_FCHA_VNCMNTO_DCMNTO',
'                                                           , p_indcdor_lqdccion_adcnal  => :P149_INDCDOR_LDCCION_ADCNAL  ',
'                                                           , p_id_rnta_antrior          => :P149_ID_RNTA_ANTRIOR',
'                                                           , p_indcdor_cntrto_gslna     => :P149_INDCDOR_CNTRTO_GSLNA                 ',
'                                                           , p_vlor_aux_lqdcion         => :P149_VLOR_AUX_LQDCION ',
'                                                           , p_id_impsto_acto_slccndo   => (select json_arrayagg( json_object(''ID_IMPSTO_ACTO'' value id_impsto_acto) )  ',
'                                                                                           from ( select distinct id_impsto_acto',
'                                                                                                  from json_table(:P151_CNCPTOS, ''$[*]''  columns (id_impsto_acto number path ''$.ID_IMPSTO_ACTO'')))',
'                                                                                           )',
'                                                           )',
'                ) a',
'	 	join  (select  a.id_impsto_acto_cncpto',
'				 from gi_g_rentas_acto_concepto         a',
'				 join gi_g_rentas_acto                  b on a.id_rnta_acto     = b.id_rnta_acto',
'				 join gi_g_rentas                       c on b.id_rnta          = c.id_rnta',
'				where c.id_rnta                         = :P149_ID_RNTA) b      on a.id_impsto_acto_cncpto = b.id_impsto_acto_cncpto ',
' where a.cdgo_clnte        = :F_CDGO_CLNTE',
'   and abs(a.vlor_lqddo)   > 0  ',
'',
'   ',
'  /*   select rownum',
'        , a.cdgo_cncpto || '' - '' || a.dscrpcion_cncpto  dscrpcion_cncpto',
'        , a.vlor_lqddo',
'        , a.vlor_intres_mra',
'        , a.vlor_ttal vlor_ttal',
'        , a.fcha_vncmnto',
'        , a.dias_mra',
'        , a.txto_trfa',
'        , a.bse_grvble',
'     from table (pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte 				=> :F_CDGO_CLNTE',
'                                                           , p_id_impsto                => :P149_ID_IMPSTO',
'                                                           , p_id_impsto_sbmpsto        => :P149_ID_IMPSTO_SBMPSTO  ',
'														   , p_id_impsto_acto           => :P149_ID_IMPSTO_ACTO',
'                                                           , p_id_sjto_impsto           => :P149_ID_SJTO_IMPSTO',
'                                                           , p_json_cncptos				=> null',
'                                                           , p_vlor_bse					=> :P149_VLOR_BSE',
'                                                           , p_indcdor_usa_extrnjro		=> nvl(:P149_INDCDOR_USA_EXTRNJRO, ''N'')',
'                                                           , p_indcdor_usa_mxto			=> nvl(:P149_INDCDOR_USA_MXTO, ''N'')',
'                                                           , p_fcha_expdcion            => :P149_FCHA_EXPDCION ',
'                                                           , p_fcha_vncmnto             => :P151_FCHA_VNCMNTO_DCMNTO',
'                                                           , p_indcdor_lqdccion_adcnal  => :P149_INDCDOR_LDCCION_ADCNAL  ',
'                                                           , p_id_rnta_antrior          => :P149_ID_RNTA_ANTRIOR',
'                                                           , p_indcdor_cntrto_gslna     => :P149_INDCDOR_CNTRTO_GSLNA  ',
'                                                            )',
'                ) a',
' where a.cdgo_clnte        = :F_CDGO_CLNTE',
'   and abs(a.vlor_lqddo)   > 0',
' --  and a.id_impsto_acto    = :P149_ID_IMPSTO_ACTO;',
' ',
' ',
'  select rownum',
'        , a.cdgo_cncpto || '' - '' || a.dscrpcion_cncpto  dscrpcion_cncpto',
'        , a.vlor_lqddo',
'        , a.vlor_intres_mra',
'        , a.vlor_ttal vlor_ttal',
'        , a.fcha_vncmnto',
'        , a.dias_mra',
'        , a.txto_trfa',
'        , a.bse_grvble',
'     from table (pkg_gi_rentas.fnc_cl_select_cncptos_lqdcion(p_cdgo_clnte 				=> :F_CDGO_CLNTE',
'                                                           , p_id_impsto                => :P149_ID_IMPSTO',
'                                                           , p_id_impsto_sbmpsto        => :P149_ID_IMPSTO_SBMPSTO  ',
'                                                           , p_id_sjto_impsto           => :P149_ID_SJTO_IMPSTO',
'                                                           , p_json						=> :P151_CNCPTOS',
'                                                           , p_vlor_bse					=> :P149_VLOR_BSE',
'                                                           --, p_vlor_bse					=> to_number(:P149_BSE, ''999G999G999G999G999G999G990D99'')',
'                                                           , p_indcdor_usa_extrnjro		=> nvl(:P149_INDCDOR_USA_EXTRNJRO, ''N'')',
'                                                           , p_indcdor_usa_mxto			=> nvl(:P149_INDCDOR_USA_MXTO, ''N'')',
'                                                           , p_fcha_expdcion            => :P149_FCHA_EXPDCION ',
'                                                           , p_fcha_vncmnto             => :P151_FCHA_VNCMNTO_DCMNTO',
'                                                           , p_indcdor_lqdccion_adcnal  => :P149_INDCDOR_LDCCION_ADCNAL  ',
'                                                           , p_id_rnta_antrior          => :P149_ID_RNTA_ANTRIOR',
'                                                           , p_indcdor_cntrto_gslna     => :P149_INDCDOR_CNTRTO_GSLNA  ',
'                                                            )',
'                ) a',
' where a.cdgo_clnte        = :F_CDGO_CLNTE',
'   and abs(a.vlor_lqddo)   > 0',
'   and a.id_impsto_acto    = :P149_ID_IMPSTO_ACTO',
'*/'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(89004733240837942)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(89253823752381708)
,p_name=>'ROWNUM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWNUM'
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
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(89253937804381709)
,p_name=>'VLOR_LQDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_LQDDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br> Liquidado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(89254018657381710)
,p_name=>'VLOR_INTRES_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES_MRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br>Intereses'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(89254181910381711)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br> Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(89254269601381712)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(89254322253381713)
,p_name=>'DIAS_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIAS_MRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('D\00EDas <br> Mora')
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
 p_id=>wwv_flow_api.id(89254401416381714)
,p_name=>'TXTO_TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_TRFA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tarifa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(89254508795381715)
,p_name=>'BSE_GRVBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BSE_GRVBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_format_mask=>'999G999G999G999G990'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(168575145103289102)
,p_internal_uid=>168575145103289102
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
 p_id=>wwv_flow_api.id(169943829688575020)
,p_interactive_grid_id=>wwv_flow_api.id(168575145103289102)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(169943903245575021)
,p_report_id=>wwv_flow_api.id(169943829688575020)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89213858173084838)
,p_view_id=>wwv_flow_api.id(169943903245575021)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(89004733240837942)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>605
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89270157684583958)
,p_view_id=>wwv_flow_api.id(169943903245575021)
,p_display_seq=>30
,p_column_id=>wwv_flow_api.id(89253823752381708)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89270623077583960)
,p_view_id=>wwv_flow_api.id(169943903245575021)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(89253937804381709)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89271267766583961)
,p_view_id=>wwv_flow_api.id(169943903245575021)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(89254018657381710)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>108
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89271862472583963)
,p_view_id=>wwv_flow_api.id(169943903245575021)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(89254181910381711)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>266
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89272431017583964)
,p_view_id=>wwv_flow_api.id(169943903245575021)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(89254269601381712)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120.55600000000001
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89273021553583966)
,p_view_id=>wwv_flow_api.id(169943903245575021)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(89254322253381713)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89273619152583967)
,p_view_id=>wwv_flow_api.id(169943903245575021)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(89254401416381714)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>71
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89274291112583968)
,p_view_id=>wwv_flow_api.id(169943903245575021)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(89254508795381715)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(55230003371)
,p_view_id=>wwv_flow_api.id(169943903245575021)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(89253937804381709)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(149917003371)
,p_view_id=>wwv_flow_api.id(169943903245575021)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(89254018657381710)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(321828003371)
,p_view_id=>wwv_flow_api.id(169943903245575021)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(89254181910381711)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(89012641327903587)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(256222764792749198)
,p_button_name=>'BTN_ACEPTAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cambiar Fecha'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro que desea actualizar la fecha de vencimiento?'', ''BTN_ACEPTAR'');'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(89012226838903586)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(256222764792749198)
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
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(89002254833837917)
,p_branch_name=>'Ir a Inicio'
,p_branch_action=>'f?p=&APP_ID.:149:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(89012641327903587)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89001479700837909)
,p_name=>'P151_ID_RNTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(256222764792749198)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89002789247837922)
,p_name=>'P151_CNCPTOS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(168575034849289101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89205288365054540)
,p_name=>'P151_FCHA_VNCMNTO_DCMNTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(256222764792749198)
,p_prompt=>'<b>Fecha de Vencimiento</b>'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha de vencimiento para el pago de la liquidaci\00F3n del hecho generador.')
,p_attribute_02=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(89255106018381721)
,p_computation_sequence=>10
,p_computation_item=>'P151_CNCPTOS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select json_arrayagg( json_object(''ID_IMPSTO_ACTO_CNCPTO''   value id_impsto_acto_cncpto,',
'                                     ''ID_CNCPTO''                value id_cncpto,',
'                                     ''ID_IMPSTO_ACTO''           value id_impsto_acto,',
'                                     ''BSE_GRVBLE''               value bse_cncpto,',
'                                     ''FCTOR''                   value fctor',
'                                    ) returning clob ',
'                        ) json',
'     from ( select b.id_impsto_acto_cncpto, b.bse_cncpto, b.id_impsto_acto, b.id_cncpto, b.fctor',
'              from gi_g_rentas_acto             a',
'              join v_gi_g_rentas_acto_concepto  b on a.id_rnta_acto = b.id_rnta_acto',
'             where a.id_rnta                    = :P151_ID_RNTA',
'     )      ',
'',
'',
'/*   select json_arrayagg( json_object( ''ID_IMPSTO_ACTO_CNCPTO'' value id_impsto_acto_cncpto ) returning clob )',
'     from ( select b.id_impsto_acto_cncpto',
'              from gi_g_rentas_acto             a',
'              join gi_g_rentas_acto_concepto    b on a.id_rnta_acto = b.id_rnta_acto',
'             where a.id_rnta                    = :P151_ID_RNTA',
'     );*/',
'    '))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(89255240109381722)
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
'                  from json_table(:P151_CNCPTOS,''$[*]''columns id_impsto_acto_cncpto path ''$.ID_IMPSTO_ACTO_CNCPTO'')',
'               )                                   b on a.id_impsto_acto_cncpto    = b.id_impsto_acto_cncpto',
'        where :P151_FCHA_VNCMNTO_DCMNTO            is not null;',
'          --and a.gnra_intres_mra                    = ''S'' ',
'        ',
'        v_fcha_vlda := pkg_gn_generalidades.fnc_vl_fcha_vncmnto_tsas_mra (:F_CDGO_CLNTE, :P149_ID_IMPSTO, to_date(:P151_FCHA_VNCMNTO_DCMNTO));',
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
,p_validation_condition=>'P151_FCHA_VNCMNTO_DCMNTO'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(89019419983903750)
,p_name=>'Cerrar Modal'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(89012226838903586)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(89019902645903756)
,p_event_id=>wwv_flow_api.id(89019419983903750)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(89020221946903761)
,p_name=>'Al cambiar la fecha de vencimiento'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P151_FCHA_VNCMNTO_DCMNTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(89020739469903762)
,p_event_id=>wwv_flow_api.id(89020221946903761)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(89019040824903747)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cambio Fecha Vencimiento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(1000);',
'    v_id_dcmnto          number;',
'    v_nmro_dcmnto        number;',
'begin',
'    pkg_gi_rentas.prc_ac_fecha_pago (p_cdgo_clnte          		        => :F_CDGO_CLNTE',
'                                    , p_id_rnta             			=> :P149_ID_RNTA',
'                                    , p_fcha_vncmnto_dcmnto				=> :P151_FCHA_VNCMNTO_DCMNTO',
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
,p_process_when_button_id=>wwv_flow_api.id(89012641327903587)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    :P149_CDGO_RNTA_ESTDO   in (''APB'',''LQD'')',
'and :P149_INDCDOR_RNTA_PGADA  = ''N'''))
,p_process_when_type=>'SQL_EXPRESSION'
,p_process_success_message=>unistr('Actualizaci\00F3n de Fecha de Vencimiento Exitosa')
);
end;
/
