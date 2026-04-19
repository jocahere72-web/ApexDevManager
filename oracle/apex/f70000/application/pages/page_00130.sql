prompt --application/pages/page_00130
begin
wwv_flow_api.create_page(
 p_id=>130
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Declaraciones Consulta Declaraciones'
,p_step_title=>'Declaraciones Consulta Declaraciones'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250708102710'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(49843317982093651)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(49843380251093652)
,p_plug_name=>'Detalle'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.id_dclrcion,',
'            a.nmro_cnsctvo,',
'            k.nmbre_dclrcion_uso,',
'            g.nmbre_impsto,',
'            h.nmbre_impsto_sbmpsto,',
'            f.dscrpcion dscrpcion_tpo_dcrlcion,',
'            c.vgncia,',
'            d.dscrpcion dscrpcion_prdo,',
'            i.idntfccion_sjto,            ',
'            i.idntfccion_antrior,',
'            j.nmbre_rzon_scial,',
'            a.fcha_prsntcion,',
'            to_char(a.bse_grvble, ''999G999G999G999G999G999G999G999G999G999'') bse_grvble,',
'            to_char(a.vlor_ttal, ''999G999G999G999G999G999G999G999G999G999'') vlor_ttal,',
'            to_char((select sum(l.vlor_sldo_cptal + l.vlor_intres)',
'                       from v_gf_g_cartera_x_vigencia l',
'                      where l.id_sjto_impsto = a.id_sjto_impsto',
'                        and l.id_prdo = a.id_prdo',
'                        and l.vgncia = a.vgncia',
'                        and l.id_orgen = a.id_dclrcion) , ''999G999G999G999G999G999G999G999G999G999'') crtra_prdo',
'from        gi_g_declaraciones          a',
'inner join  gi_d_dclrcnes_vgncias_frmlr b   on  b.id_dclrcion_vgncia_frmlrio    =   a.id_dclrcion_vgncia_frmlrio',
'inner join  gi_d_dclrcnes_tpos_vgncias  c   on  c.id_dclrcion_tpo_vgncia        =   b.id_dclrcion_tpo_vgncia',
'inner join  df_i_periodos               d   on  d.id_prdo                       =   c.id_prdo',
'inner join  df_s_periodicidad           e   on  e.cdgo_prdcdad                  =   d.cdgo_prdcdad',
'inner join  gi_d_declaraciones_tipo     f   on  f.id_dclrcn_tpo                 =   c.id_dclrcn_tpo',
'inner join  df_c_impuestos              g   on  g.id_impsto                     =   f.id_impsto',
'inner join  df_i_impuestos_subimpuesto  h   on  h.id_impsto_sbmpsto             =   f.id_impsto_sbmpsto',
'inner join  v_si_i_sujetos_impuesto     i   on  i.id_sjto_impsto                =   a.id_sjto_impsto',
'inner join  si_i_personas               j   on  j.id_sjto_impsto                =   i.id_sjto_impsto',
'inner join  gi_d_declaraciones_uso      k   on  k.id_dclrcion_uso               =   a.id_dclrcion_uso',
'where       a.cdgo_clnte            =   :F_CDGO_CLNTE',
'and         g.id_impsto             =   nvl(:P130_ID_IMSPTO, g.id_impsto)',
'and         h.id_impsto_sbmpsto     =   nvl(:P130_ID_SUB_IMSPTO, h.id_impsto_sbmpsto)',
'and         f.id_dclrcn_tpo         =   nvl(:P130_ID_DCLRCN_TPO, f.id_dclrcn_tpo)',
'and         d.vgncia                =   nvl(:P130_VGNCIA, d.vgncia)',
'and         d.id_prdo               =   nvl(:P130_ID_PRDO, d.id_prdo)',
'and         case',
'                when j.id_sjto_tpo is null and :P130_ID_SJTO_TPO is null then 1',
'                when j.id_sjto_tpo = nvl(:P130_ID_SJTO_TPO, j.id_sjto_tpo) then 1',
'                else 0                    ',
'            end                     =   1',
'and         a.id_dclrcion_uso       =   nvl(:P130_ID_DCLRCION_USO, a.id_dclrcion_uso)',
'and         i.idntfccion_sjto       =   nvl(:P130_IDNTFCCION, i.idntfccion_sjto)',
'and         a.cdgo_dclrcion_estdo   in  (''PRS'', ''APL'', ''FRM'')',
'and         (A.INDCDOR_MGRDO <> ''C'' OR A.INDCDOR_MGRDO IS NULL)',
'and         (to_char(a.fcha_prsntcion,''YYYYMMDD'') >= to_char(TO_DATE(:P130_FCHA_INCIAL,''DD/MM/YYYY''),''YYYYMMDD'') OR :P130_FCHA_INCIAL IS NULL)',
'and         (to_char(a.fcha_prsntcion,''YYYYMMDD'') <= to_char(TO_DATE(:P130_FCHA_FNAL,''DD/MM/YYYY''),''YYYYMMDD'') OR :P130_FCHA_FNAL IS NULL)'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14777469715461906)
,p_name=>'IDNTFCCION_ANTRIOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_ANTRIOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(14777543296461907)
,p_name=>'NMBRE_RZON_SCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RZON_SCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Raz\00F3n Social')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(14777680004461908)
,p_name=>'BSE_GRVBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BSE_GRVBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Base Gravable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>40
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
 p_id=>wwv_flow_api.id(14777721890461909)
,p_name=>'FCHA_PRSNTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_PRSNTCION'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha Presentaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(49245212996622707)
,p_name=>'CRTRA_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CRTRA_PRDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cartera'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>40
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
 p_id=>wwv_flow_api.id(49843662266093655)
,p_name=>'ID_DCLRCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION'
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
 p_id=>wwv_flow_api.id(49843745841093656)
,p_name=>'NMRO_CNSCTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNSCTVO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Numero Formulario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:133:&SESSION.::&DEBUG.:RP,133:P133_ID_DCLRCION:&ID_DCLRCION.'
,p_link_text=>'&NMRO_CNSCTVO.'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(49843940308093657)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(49843992608093658)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub-Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(49844076501093659)
,p_name=>'DSCRPCION_TPO_DCRLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TPO_DCRLCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(49844207454093660)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
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
 p_id=>wwv_flow_api.id(49844332471093661)
,p_name=>'DSCRPCION_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_PRDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(49844437705093662)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(49844575421093664)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo a Cargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>40
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
 p_id=>wwv_flow_api.id(49844775881093666)
,p_name=>'NMBRE_DCLRCION_USO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DCLRCION_USO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Uso Declaraci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(86968129155489201)
,p_name=>'PDF'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver Pdf'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attribute_01=>'<button type="button" class="t-Button t-Button--icon t-Button--success t-Button--simple t-Button--iconRight">Ver PDF<span aria-hidden="true" class="t-Icon t-Icon--right fa fa-eye"></span></button>'
,p_link_target=>'f?p=&APP_ID.:268:&SESSION.::&DEBUG.:RP:P268_ID_DCLRCION:&ID_DCLRCION.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(49843580250093654)
,p_internal_uid=>49843580250093654
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
 p_id=>wwv_flow_api.id(49912000644569926)
,p_interactive_grid_id=>wwv_flow_api.id(49843580250093654)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(49912112492569928)
,p_report_id=>wwv_flow_api.id(49912000644569926)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16226443763809730)
,p_view_id=>wwv_flow_api.id(49912112492569928)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(14777469715461906)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16226881816809749)
,p_view_id=>wwv_flow_api.id(49912112492569928)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(14777543296461907)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16243471547895926)
,p_view_id=>wwv_flow_api.id(49912112492569928)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(14777680004461908)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16457287466055550)
,p_view_id=>wwv_flow_api.id(49912112492569928)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(14777721890461909)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49912641602569945)
,p_view_id=>wwv_flow_api.id(49912112492569928)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(49843662266093655)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49913051470569953)
,p_view_id=>wwv_flow_api.id(49912112492569928)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(49843745841093656)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>135
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49913571380569955)
,p_view_id=>wwv_flow_api.id(49912112492569928)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(49843940308093657)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>177
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49914071702569956)
,p_view_id=>wwv_flow_api.id(49912112492569928)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(49843992608093658)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49914526943569958)
,p_view_id=>wwv_flow_api.id(49912112492569928)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(49844076501093659)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49915029186569959)
,p_view_id=>wwv_flow_api.id(49912112492569928)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(49844207454093660)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49915494898569961)
,p_view_id=>wwv_flow_api.id(49912112492569928)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(49844332471093661)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
,p_sort_order=>2
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49916036954569962)
,p_view_id=>wwv_flow_api.id(49912112492569928)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(49844437705093662)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49917013051569994)
,p_view_id=>wwv_flow_api.id(49912112492569928)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(49844575421093664)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49987298441691160)
,p_view_id=>wwv_flow_api.id(49912112492569928)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(49844775881093666)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(60355218191282687)
,p_view_id=>wwv_flow_api.id(49912112492569928)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(49245212996622707)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(86974597787495818)
,p_view_id=>wwv_flow_api.id(49912112492569928)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(86968129155489201)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(49844657274093665)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
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
unistr('</h5>Funci\00F3n que permite consultar las declaraciones presentadas ante la administraci\00F3n.</i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(25013003644578080)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(49843317982093651)
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
 p_id=>wwv_flow_api.id(21676475869808004)
,p_name=>'P130_FCHA_INCIAL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(49843317982093651)
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
 p_id=>wwv_flow_api.id(21676528530808005)
,p_name=>'P130_FCHA_FNAL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(49843317982093651)
,p_prompt=>'<b>Fecha Final</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P130_FCHA_INCIAL.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25013493305578081)
,p_name=>'P130_ID_IMSPTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(49843317982093651)
,p_prompt=>'<b>Impuesto</b>'
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
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25013859480578086)
,p_name=>'P130_ID_SUB_IMSPTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(49843317982093651)
,p_prompt=>'<b>Sub - Impuesto</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  nmbre_impsto_sbmpsto,',
'   id_impsto_sbmpsto ',
'from df_i_impuestos_subimpuesto',
'where id_impsto = :P130_ID_IMSPTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P130_ID_IMSPTO'
,p_ajax_items_to_submit=>'P130_ID_IMSPTO'
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
 p_id=>wwv_flow_api.id(25014203778578086)
,p_name=>'P130_ID_DCLRCN_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(49843317982093651)
,p_prompt=>unistr('<b>Tipo de Declaraci\00F3n</b>')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,id_dclrcn_tpo from gi_d_declaraciones_tipo',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and  id_impsto  = :P130_ID_IMSPTO',
'--and actvo = ''S'''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P130_ID_IMSPTO'
,p_ajax_items_to_submit=>'P130_ID_IMSPTO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25014662428578086)
,p_name=>'P130_ID_DCLRCION_USO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(49843317982093651)
,p_prompt=>unistr('<b>Uso de Declaraci\00F3n</b>')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_dclrcion_uso,',
'        a.id_dclrcion_uso',
'from    gi_d_declaraciones_uso  a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE',
'order by a.nmbre_dclrcion_uso'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25015091580578087)
,p_name=>'P130_IDNTFCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(49843317982093651)
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
 p_id=>wwv_flow_api.id(25015404886578087)
,p_name=>'P130_ID_SJTO_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(49843317982093651)
,p_prompt=>'<b>Tipo de Sujeto</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_sjto_tpo,a.id_sjto_tpo',
'from df_i_sujetos_tipo a',
'where a.id_sjto_tpo in (select distinct(id_sjto_tpo)  id_sjto_tpo from gi_d_dclrcnes_tpos_sjto b',
'where b.id_dclrcn_tpo = :P130_ID_DCLRCN_TPO)'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P130_ID_DCLRCN_TPO'
,p_ajax_items_to_submit=>'P130_ID_DCLRCN_TPO'
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
 p_id=>wwv_flow_api.id(25015880192578087)
,p_name=>'P130_VGNCIA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(49843317982093651)
,p_prompt=>'<b>Vigencia</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct(vgncia) dscrpcion_vgncia,vgncia from gi_d_dclrcnes_tpos_vgncias',
'where id_dclrcn_tpo = :P130_id_dclrcn_tpo or :P130_id_dclrcn_tpo is null',
'order by vgncia desc'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P130_ID_DCLRCN_TPO'
,p_ajax_items_to_submit=>'P130_ID_DCLRCN_TPO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25016265770578092)
,p_name=>'P130_ID_PRDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(49843317982093651)
,p_prompt=>'<b>Periodo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct(a.dscrpcion),a.id_prdo from df_i_periodos a',
'where ',
'--id_impsto = :P130_ID_IMSPTO',
'--and  ',
'a.id_prdo in (',
'select distinct(id_prdo) from gi_d_dclrcnes_tpos_vgncias where id_dclrcn_tpo = :P130_id_dclrcn_tpo and vgncia = :P130_VGNCIA',
')'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P130_ID_DCLRCN_TPO,P130_VGNCIA,P130_ID_IMSPTO'
,p_ajax_items_to_submit=>'P130_ID_DCLRCN_TPO,P130_VGNCIA,P130_ID_IMSPTO'
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
 p_id=>wwv_flow_api.id(25016658268578093)
,p_name=>'P130_CDGO_DCLRCION_ESTDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(49843317982093651)
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
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21676603495808006)
,p_name=>'Al Cambiar Fecha Inicio'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P130_FCHA_INCIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21676769927808007)
,p_event_id=>wwv_flow_api.id(21676603495808006)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P130_FCHA_FNAL").datepicker( ''option'' , ''minDate'' , $("#P130_FCHA_INCIAL").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
end;
/
