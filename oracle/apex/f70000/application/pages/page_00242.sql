prompt --application/pages/page_00242
begin
wwv_flow_api.create_page(
 p_id=>242
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Declaracion Busqueda'
,p_page_mode=>'MODAL'
,p_step_title=>'Declaracion Busqueda'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20251205091624'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(157536579820965306)
,p_plug_name=>'<b>Detalle de consulta</b>'
,p_region_name=>'tablaDeclaraciones'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(207794329141316235)
,p_plug_name=>'Detalle'
,p_region_name=>'tablaDetalle'
,p_parent_plug_id=>wwv_flow_api.id(157536579820965306)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_dclrcion,',
'       e.idntfccion_sjto,',
'       h.nmbre_rzon_scial,',
'       a.nmro_cnsctvo,',
'       a.id_dclrcion_vgncia_frmlrio,',
'       b.id_frmlrio,',
'       c.id_dclrcn_tpo,',
'       a.vgncia,',
'       a.id_prdo,',
'       d.dscrpcion,',
'       a.id_impsto,',
'       a.id_impsto_sbmpsto,',
'       a.id_sjto_impsto,',
'       a.fcha_prsntcion,',
'       (v.vlor_sldo_cptal + v.vlor_intres) as sldo_prdo',
'  from gi_g_declaraciones a',
' inner join gi_d_dclrcnes_vgncias_frmlr b',
'    on b.id_dclrcion_vgncia_frmlrio = a.id_dclrcion_vgncia_frmlrio',
' inner join gi_d_dclrcnes_tpos_vgncias c',
'    on c.id_dclrcion_tpo_vgncia = b.id_dclrcion_tpo_vgncia',
'  join df_i_periodos d',
'    on a.id_prdo = d.id_prdo',
'  join v_si_i_sujetos_impuesto e',
'    on a.id_sjto_impsto = e.id_sjto_impsto',
'   and e.id_sjto_estdo = 1  ',
'  join gi_d_declaraciones_uso g',
'    on a.id_dclrcion_uso = g.id_dclrcion_uso',
'  join si_i_personas h',
'    on a.id_sjto_impsto = h.id_sjto_impsto',
'  join v_gf_g_cartera_x_vigencia v',
'    on a.id_sjto_impsto = v.id_sjto_impsto',
'   and a.id_impsto = v.id_impsto',
'   and a.id_impsto_sbmpsto = v.id_impsto_sbmpsto',
'   and a.id_dclrcion = v.id_orgen',
'   and v.cdgo_mvmnto_orgn = ''DL''',
'   and a.vgncia = v.vgncia',
'   and a.id_prdo = v.id_prdo',
'   and v.cdgo_mvnt_fncro_estdo = ''NO''',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_impsto = :P242_ID_IMSPTO',
'   and a.id_impsto_sbmpsto = :P242_ID_SUB_IMSPTO',
'   and a.vgncia = nvl(:P242_VGNCIA, a.vgncia)',
'   and a.id_prdo = nvl(:P242_ID_PRDO, a.id_prdo)  ',
'   and c.id_dclrcn_tpo  =  nvl(:P242_ID_DCLRCN_TPO, c.id_dclrcn_tpo)',
'   and g.cdgo_dclrcion_uso in (''DIN'')',
'   and a.cdgo_dclrcion_estdo in (''PRS'', ''APL'', ''FRM'')',
'   and (to_char(a.fcha_prsntcion, ''YYYYMMDD'') >=',
'       to_char(to_date(:P242_FCHA_INCIAL, ''DD/MM/YYYY''), ''YYYYMMDD'') OR',
'       :P242_FCHA_INCIAL IS NULL)',
'   and e.idntfccion_sjto = nvl(:P242_IDNTFCCION, e.idntfccion_sjto)',
'   and a.nmro_cnsctvo = nvl(:P242_NMRO_CNSCTVO, a.nmro_cnsctvo)',
'   and not exists (select 1 from v_gi_g_dclrcnes_nvdad x ',
'                    where x.id_sjto_impsto = a.id_sjto_impsto',
'                          and x.id_dclrcion = a.id_dclrcion',
'                          and x.cdgo_estdo = ''PS'')'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3284839658774614)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(16439416567701508)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(32205793338792701)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(32206026128792704)
,p_name=>'NMBRE_RZON_SCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RZON_SCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Raz\00F3n Social')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(32235673869493807)
,p_name=>'NMRO_CNSCTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNSCTVO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('No. Declaraci\00F3n')
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
 p_id=>wwv_flow_api.id(32235745084493808)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(32236223899493813)
,p_name=>'FCHA_PRSNTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_PRSNTCION'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Presentacion'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
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
 p_id=>wwv_flow_api.id(32370964291640901)
,p_name=>'SLDO_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SLDO_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Cartera Del Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(32371035027640902)
,p_name=>'ID_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO'
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
 p_id=>wwv_flow_api.id(32371190862640903)
,p_name=>'ID_DCLRCN_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCN_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(158054880766770393)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(158054917684770394)
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(158055575737770400)
,p_name=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(207794611156316238)
,p_name=>'ID_DCLRCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_stretch=>'A'
,p_link_target=>'f?p=&APP_ID.:239:&SESSION.::&DEBUG.:RP,239:P239_ID_DCLRCION:&ID_DCLRCION.'
,p_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-view.png" class="apex-edit-view" alt="">'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(207795156344316243)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(207794529140316237)
,p_internal_uid=>207794529140316237
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>false
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>false
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(207862949534792509)
,p_interactive_grid_id=>wwv_flow_api.id(207794529140316237)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>5
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(207863061382792511)
,p_report_id=>wwv_flow_api.id(207862949534792509)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3521463953617794)
,p_view_id=>wwv_flow_api.id(207863061382792511)
,p_display_seq=>27
,p_column_id=>wwv_flow_api.id(3284839658774614)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16511851610936415)
,p_view_id=>wwv_flow_api.id(207863061382792511)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(16439416567701508)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(32211892067793418)
,p_view_id=>wwv_flow_api.id(207863061382792511)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(32205793338792701)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(32219753193896999)
,p_view_id=>wwv_flow_api.id(207863061382792511)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(32206026128792704)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(32264177258670389)
,p_view_id=>wwv_flow_api.id(207863061382792511)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(32235673869493807)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(32264618975670396)
,p_view_id=>wwv_flow_api.id(207863061382792511)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(32235745084493808)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(32288366604730987)
,p_view_id=>wwv_flow_api.id(207863061382792511)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(32236223899493813)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(32376882433641147)
,p_view_id=>wwv_flow_api.id(207863061382792511)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(32370964291640901)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(32380915338955497)
,p_view_id=>wwv_flow_api.id(207863061382792511)
,p_display_seq=>25
,p_column_id=>wwv_flow_api.id(32371035027640902)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(32381517820955499)
,p_view_id=>wwv_flow_api.id(207863061382792511)
,p_display_seq=>26
,p_column_id=>wwv_flow_api.id(32371190862640903)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(158060977668771623)
,p_view_id=>wwv_flow_api.id(207863061382792511)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(158054880766770393)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(158067934989790554)
,p_view_id=>wwv_flow_api.id(207863061382792511)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(158054917684770394)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(158106429416766114)
,p_view_id=>wwv_flow_api.id(207863061382792511)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(158055575737770400)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(207863590492792528)
,p_view_id=>wwv_flow_api.id(207863061382792511)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(207794611156316238)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>30
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(207865978076792542)
,p_view_id=>wwv_flow_api.id(207863061382792511)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(207795156344316243)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(207789114332314805)
,p_plug_name=>unistr('<b>Par\00E1metros de  B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8364223522699773)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(207789114332314805)
,p_button_name=>'Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8364647718699778)
,p_name=>'P242_ID_IMSPTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(207789114332314805)
,p_prompt=>' <b>Impuesto</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8365073286699795)
,p_name=>'P242_ID_SUB_IMSPTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(207789114332314805)
,p_prompt=>'<b>Sub - Impuesto</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  nmbre_impsto_sbmpsto,',
'   id_impsto_sbmpsto ',
'from df_i_impuestos_subimpuesto',
'where id_impsto = :P242_ID_IMSPTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P242_ID_IMSPTO'
,p_ajax_items_to_submit=>'P242_ID_IMSPTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8365403953699796)
,p_name=>'P242_ID_DCLRCN_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(207789114332314805)
,p_prompt=>unistr('<b>Tipo de Declaraci\00F3n</b>')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,id_dclrcn_tpo from gi_d_declaraciones_tipo',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and  id_impsto  = :P242_ID_IMSPTO',
'and actvo = ''S'''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P242_ID_IMSPTO'
,p_ajax_items_to_submit=>'P242_ID_IMSPTO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8365833369699796)
,p_name=>'P242_ID_DCLRCION_USO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(207789114332314805)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8366236925699796)
,p_name=>'P242_IDNTFCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(207789114332314805)
,p_prompt=>unistr('<b>Identificaci\00F3n</b>')
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
 p_id=>wwv_flow_api.id(8366613499699796)
,p_name=>'P242_ID_SJTO_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(207789114332314805)
,p_prompt=>'<b>Tipo de Sujeto</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_sjto_tpo,a.id_sjto_tpo',
'from df_i_sujetos_tipo a',
'where a.id_sjto_tpo in (select distinct(id_sjto_tpo)  id_sjto_tpo from gi_d_dclrcnes_tpos_sjto b',
'where b.id_dclrcn_tpo = :P242_ID_DCLRCN_TPO)'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P242_ID_DCLRCN_TPO'
,p_ajax_items_to_submit=>'P242_ID_DCLRCN_TPO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8367098122699796)
,p_name=>'P242_FCHA_INCIAL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(207789114332314805)
,p_prompt=>'<b>Fecha Inicial</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" '
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8367488038699797)
,p_name=>'P242_FCHA_FNAL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(207789114332314805)
,p_prompt=>'<b>Fecha Final</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P242_FCHA_INCIAL.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8367813375699797)
,p_name=>'P242_VGNCIA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(207789114332314805)
,p_prompt=>'<b>Vigencia</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct(vgncia) dscrpcion_vgncia,vgncia from gi_d_dclrcnes_tpos_vgncias',
'where id_dclrcn_tpo = :P242_id_dclrcn_tpo or :P242_id_dclrcn_tpo is null',
'order by vgncia desc'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P242_ID_DCLRCN_TPO'
,p_ajax_items_to_submit=>'P242_ID_DCLRCN_TPO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8368262289699797)
,p_name=>'P242_ID_PRDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(207789114332314805)
,p_prompt=>'<b>Periodo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct (a.dscrpcion), a.id_prdo',
'  from df_i_periodos a',
' where id_impsto = :P242_ID_IMSPTO',
' and id_impsto_sbmpsto = :P242_ID_SUB_IMSPTO',
'  and vgncia = :P242_VGNCIA ',
'order by a.id_prdo'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P242_ID_IMSPTO,P242_ID_SUB_IMSPTO,P242_VGNCIA'
,p_ajax_items_to_submit=>'P242_ID_IMSPTO,P242_ID_SUB_IMSPTO,P242_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8368639356699798)
,p_name=>'P242_CDGO_DCLRCION_ESTDO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(207789114332314805)
,p_prompt=>unistr('<b>Estados de la Declaraci\00F3n</b>')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>'STATIC:FIRME;FRM,PRESENTADA;PRS,APLICADA;APL'
,p_lov_display_null=>'YES'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32235029993493801)
,p_name=>'P242_JSON_DCLRCNES'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(157536579820965306)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32235829188493809)
,p_name=>'P242_NMRO_CNSCTVO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(207789114332314805)
,p_prompt=>unistr('<b>No. Declaraci\00F3n</b>')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(32206165119792705)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Detalle'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_json clob;',
'  v_cdgo_rspsta number;',
'  v_mnsje_rspsta varchar2(4000);',
'  v_exception     exception;',
'begin',
'  select json_arrayagg(json_object(''id_dclrcion'' value a.id_dclrcion,',
'                                    ''idntfccion'' value f.idntfccion,',
'                                    ''nmbre_rzon_scial'' value',
'                                    h.nmbre_rzon_scial,',
'                                    ''id_impsto'' value a.id_impsto,',
'                                    ''id_prdo'' value a.id_prdo,',
'                                    ''nmbre_impsto'' value b.nmbre_impsto,',
'                                    ''nmbre_impsto_sbmpsto'' value',
'                                    c.nmbre_impsto_sbmpsto,',
'                                    ''nmro_cnsctvo'' value a.nmro_cnsctvo,',
'                                    ''vgncia'' value a.vgncia,',
'                                    ''dscrpcion'' value d.dscrpcion,',
'                                    ''id_dclrcion_vgncia_frmlrio'' value',
'                                    a.id_dclrcion_vgncia_frmlrio,',
'                                    ''id_sjto_impsto'' value a.id_sjto_impsto,',
'                                    ''id_impsto_sbmpsto'' value',
'                                    a.id_impsto_sbmpsto,',
'                                    ''fcha_rgstro'' value a.fcha_rgstro)returning clob)',
'    into v_json',
'    from gi_g_declaraciones a',
'    join df_c_impuestos b',
'      on a.id_impsto = b.id_impsto',
'    join df_i_impuestos_subimpuesto c',
'      on a.id_impsto_sbmpsto = c.id_impsto_sbmpsto',
'     and b.id_impsto = c.id_impsto',
'    join df_i_periodos d',
'      on a.id_prdo = d.id_prdo',
'    join si_i_sujetos_impuesto e',
'      on a.id_sjto_impsto = e.id_sjto_impsto',
'     and e.id_sjto_estdo = 1',
'    join si_c_sujetos f',
'      on e.id_sjto = f.id_sjto',
'    join gi_d_declaraciones_uso g',
'      on a.id_dclrcion_uso = g.id_dclrcion_uso',
'    join si_i_personas h',
'      on h.id_sjto_impsto = a.id_sjto_impsto',
'   where a.cdgo_clnte = :F_CDGO_CLNTE',
'     and a.id_impsto = :P242_ID_IMSPTO',
'     and a.id_impsto_sbmpsto = :P242_ID_SUB_IMSPTO',
'     and a.vgncia = :P242_VGNCIA',
'     and (a.id_prdo = :P242_ID_PRDO or :P242_ID_PRDO is null)',
'     and (extract(year from trunc(systimestamp)) -',
'         extract(year from',
'                  trunc(pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(p_id_dclrcion_vgncia_frmlrio => a.id_dclrcion_vgncia_frmlrio,',
'                                                                       p_idntfccion                 => f.idntfccion)))) <= 5',
'     and pkg_fi_fiscalizacion.fnc_vl_existe_inexacto(p_cdgo_clnte                 => :F_CDGO_CLNTE,',
'                                                     p_id_sjto_impsto             => a.id_sjto_impsto,',
'                                                     p_id_dclrcion_vgncia_frmlrio => a.id_dclrcion_vgncia_frmlrio) = ''N''',
'     and pkg_fi_fiscalizacion.fnc_vl_firmeza_dclracion(p_cdgo_clnte                 => :F_CDGO_CLNTE,',
'                                                       p_id_dclrcion_vgncia_frmlrio => a.id_dclrcion_vgncia_frmlrio,',
'                                                       p_idntfccion_sjto            => f.idntfccion) = ''N''',
'     and (f.idntfccion = :P242_IDNTFCCION or :P242_IDNTFCCION is null)',
'     and g.cdgo_dclrcion_uso in (''DIN'')',
'     and a.cdgo_dclrcion_estdo in (''PRS'', ''APL'', ''FRM'')',
'     and (to_char(a.fcha_prsntcion, ''YYYYMMDD'') >=',
'         to_char(to_date(:P242_FCHA_INCIAL, ''DD/MM/YYYY''), ''YYYYMMDD'') or',
'         :P242_FCHA_INCIAL is null);',
'         ',
'    if (v_json is not null and length(v_json)>0) then',
'      v_cdgo_rspsta := 0;',
'      v_mnsje_rspsta := ''Resultado exitoso'';',
'   --   :P242_JSON_DCLRCNES := v_json;',
'    else',
'      v_cdgo_rspsta := 1;',
'      v_mnsje_rspsta := ''Error al cargar el json. ''||sqlerrm;',
'      v_json := null;',
'      raise v_exception;',
'    end if;  ',
'',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta); ',
'    apex_json.write(''o_json'', v_json);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'    ',
'exception',
'  when v_exception then',
'    rollback;    ',
'	apex_json.open_object;',
'	apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_json'', v_json);',
'	apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'	apex_json.close_object;   ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
