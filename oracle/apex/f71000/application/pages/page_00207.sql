prompt --application/pages/page_00207
begin
wwv_flow_api.create_page(
 p_id=>207
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Aplicaci\00F3n')
,p_step_title=>unistr('Aplicaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20251201145305'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67994814462700187)
,p_plug_name=>unistr('Compesaci\00F3n - Devoluci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67994972695700188)
,p_plug_name=>unistr('Devoluci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(67994814462700187)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_sldos_fvr_dvlcion_dtll,',
'       a.nmbre_impsto,',
'       b.vlor_dvlcion,',
'       d.nmbre_bnco,',
'       c.nmro_cnta,',
'       f.idntfccion_sjto_frmtda',
'from v_gf_g_saldos_favor a',
'join gf_g_sldos_fvr_dvlcion_dtll  b on a.id_sldo_fvor         = b.id_sldo_fvor',
'join gf_g_saldos_favor_devlucion  c on b.id_sldo_fvor_dvlcion = c.id_sldo_fvor_dvlcion',
'join df_c_bancos                  d on c.id_bnco              = d.id_bnco',
'join v_si_i_sujetos_impuesto      f on a.id_sjto_impsto       = f.id_sjto_impsto',
'where c.id_sldo_fvor_slctud =    :P205_ID_SLDO_FVOR_SLCTUD;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_sldo_fvor_slctud',
'from gf_g_saldos_favor_solicitud a',
'where a.id_sldo_fvor_slctud in (select a.id_sldo_fvor_slctud from gf_g_saldos_favor_devlucion a where a.id_sldo_fvor_slctud = :P207_ID_SLDO_FVOR_SLCTUD);'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67995918382700198)
,p_name=>'ID_SLDOS_FVR_DVLCION_DTLL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLDOS_FVR_DVLCION_DTLL'
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
 p_id=>wwv_flow_api.id(67996032241700199)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(67996170809700200)
,p_name=>'VLOR_DVLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DVLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor de la devoluci\00F3n')
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
 p_id=>wwv_flow_api.id(67996282909700201)
,p_name=>'NMBRE_BNCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_BNCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Banco'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(67996387277700202)
,p_name=>'NMRO_CNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'N. Cuenta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>50
,p_enable_filter=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(67996394890700203)
,p_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO_FRMTDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n Sujeto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(67995803681700197)
,p_internal_uid=>67995803681700197
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
 p_id=>wwv_flow_api.id(68004960898720308)
,p_interactive_grid_id=>wwv_flow_api.id(67995803681700197)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(68005068181720308)
,p_report_id=>wwv_flow_api.id(68004960898720308)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(68008518036720322)
,p_view_id=>wwv_flow_api.id(68005068181720308)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(67995918382700198)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(68009032373720323)
,p_view_id=>wwv_flow_api.id(68005068181720308)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(67996032241700199)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(68009543859720325)
,p_view_id=>wwv_flow_api.id(68005068181720308)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(67996170809700200)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(68010065170720327)
,p_view_id=>wwv_flow_api.id(68005068181720308)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(67996282909700201)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(68010557492720328)
,p_view_id=>wwv_flow_api.id(68005068181720308)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(67996387277700202)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(68011026831720332)
,p_view_id=>wwv_flow_api.id(68005068181720308)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(67996394890700203)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(106449163893857181)
,p_plug_name=>'Reconocimiento'
,p_parent_plug_id=>wwv_flow_api.id(67994814462700187)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  c.nmbre_impsto_sbmpsto,',
'        d.idntfccion_sjto_frmtda,',
'        c.vlor_sldo_fvor,',
'        c.nmbre_sldo_fvor_tpo,',
'        to_char(c.fcha_rgstro, ''DD/MM/YYYY'') as fcha_rgstro',
'from gf_g_saldos_favor_solicitud    a',
'join gf_g_sldos_fvor_slctud_dtll    b   on  a.id_sldo_fvor_slctud   =   b.id_sldo_fvor_slctud',
'join v_gf_g_saldos_favor            c   on  b.id_sldo_fvor          =   c.id_sldo_fvor',
'join v_si_i_sujetos_impuesto        d   on  c.id_sjto_impsto        =   d.id_sjto_impsto',
'where a.id_sldo_fvor_slctud = :P207_ID_SLDO_FVOR_SLCTUD;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_sldo_fvor_slctud from gf_g_saldos_favor_solicitud a',
'where a.id_sldo_fvor_slctud in (select a.id_sldo_fvor_slctud from gf_g_saldos_favor_cmpnscion a ',
'                                join gf_g_saldos_favor_devlucion c on a.id_sldo_fvor_slctud =   c.id_sldo_fvor_slctud',
'                                where a.id_sldo_fvor_slctud = :P207_ID_SLDO_FVOR_SLCTUD);'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(106449435245857184)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(106449549662857185)
,p_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO_FRMTDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(106449670851857186)
,p_name=>'VLOR_SLDO_FVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_FVOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Saldo a Favor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(106449795231857187)
,p_name=>'NMBRE_SLDO_FVOR_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SLDO_FVOR_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo de Saldo a Favor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(106449886143857188)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_api.id(106449244948857182)
,p_internal_uid=>106449244948857182
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
 p_id=>wwv_flow_api.id(106454968536862001)
,p_interactive_grid_id=>wwv_flow_api.id(106449244948857182)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(106455073296862002)
,p_report_id=>wwv_flow_api.id(106454968536862001)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106456086141862013)
,p_view_id=>wwv_flow_api.id(106455073296862002)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(106449435245857184)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>196
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106456590375862015)
,p_view_id=>wwv_flow_api.id(106455073296862002)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(106449549662857185)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106457100358862017)
,p_view_id=>wwv_flow_api.id(106455073296862002)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(106449670851857186)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106457593461862018)
,p_view_id=>wwv_flow_api.id(106455073296862002)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(106449795231857187)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>152
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106458100560862020)
,p_view_id=>wwv_flow_api.id(106455073296862002)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(106449886143857188)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>124
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(201570894722495387)
,p_plug_name=>unistr('Compensaci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(67994814462700187)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select f.nmbre_impsto,',
'       a.sldo_fvor_dspnble as vlor_sldo_fvor,',
'       sum(b.vlor_cmpnscion),',
'       b.vgncia,',
'       b.id_prdo,',
'       b.id_impsto,',
'       b.id_impsto_sbmpsto,',
'       b.id_sjto_impsto,',
'       b.id_sldo_fvor,',
'       e.prdo,',
'       f.idntfccion_sjto_frmtda,',
'       c.id_sld_fvr_cmpnscion,',
'       b.id_mvmnto_fncro',
'from v_gf_g_saldos_favor          a',
'join gf_g_sldos_fvr_cmpnscn_dtll  b on a.id_sldo_fvor         = b.id_sldo_fvor',
'join gf_g_saldos_favor_cmpnscion  c on b.id_sld_fvr_cmpnscion = c.id_sld_fvr_cmpnscion',
'join df_i_conceptos               d on b.id_cncpto            = d.id_cncpto',
'join df_i_periodos                e on b.id_prdo              = e.id_prdo and ',
'                                       b.vgncia               =  e.vgncia',
'join v_si_i_sujetos_impuesto      f on b.id_sjto_impsto       = f.id_sjto_impsto',
'where c.id_sldo_fvor_slctud = :P207_ID_SLDO_FVOR_SLCTUD ',
'and not a.estdo = ''AN'' ',
'group by f.nmbre_impsto,',
'         a.sldo_fvor_dspnble, ',
'         b.vgncia, b.id_prdo, ',
'         b.id_impsto, ',
'         b.id_impsto_sbmpsto, ',
'         b.id_sjto_impsto, ',
'         b.id_sldo_fvor, ',
'         e.prdo, ',
'         f.idntfccion_sjto_frmtda,',
'         c.id_sld_fvr_cmpnscion,',
'         b.id_mvmnto_fncro'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from gf_g_saldos_favor_solicitud a',
'where a.id_sldo_fvor_slctud in (select a.id_sldo_fvor_slctud from gf_g_saldos_favor_cmpnscion a where a.id_sldo_fvor_slctud = :P207_ID_SLDO_FVOR_SLCTUD);'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14135324926360601)
,p_name=>'ID_MVMNTO_FNCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_MVMNTO_FNCRO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
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
 p_id=>wwv_flow_api.id(132687364010482078)
,p_name=>'SUM(B.VLOR_CMPNSCION)'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SUM(B.VLOR_CMPNSCION)'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total Compensado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(132687429828482079)
,p_name=>'BTN_VIEW'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">  ',
'        <span class="fa fa-eye" aria-hidden="true"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:264:&SESSION.::&DEBUG.:RP,264:P264_ID_SLD_FVR_CMPNSCION,P264_ID_SLD_FVR,P264_VGNCIA,P264_ID_PRDO,P264_ID_MVMNTO_FNCRO:&ID_SLD_FVR_CMPNSCION.,&ID_SLDO_FVOR.,&VGNCIA.,&ID_PRDO.,&ID_MVMNTO_FNCRO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(132689158007482096)
,p_name=>'ID_SLD_FVR_CMPNSCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLD_FVR_CMPNSCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Sld Fvr Cmpnscion'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>210
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(139614081600739880)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
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
 p_id=>wwv_flow_api.id(201571258646495390)
,p_name=>'VLOR_SLDO_FVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_FVOR'
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
 p_id=>wwv_flow_api.id(201571420457495392)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(201572357750495401)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(205253757344990279)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(211832656222685981)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attribute_01=>'N'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(211832715574685982)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attribute_01=>'N'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(211832805616685983)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attribute_01=>'N'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(211832884569685984)
,p_name=>'ID_SLDO_FVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLDO_FVOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'# Saldo a Favor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(212506136323004478)
,p_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO_FRMTDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(201571007710495388)
,p_internal_uid=>201571007710495388
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
,p_enable_save_public_report=>true
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
 p_id=>wwv_flow_api.id(201585830630666345)
,p_interactive_grid_id=>wwv_flow_api.id(201571007710495388)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(201585893536666346)
,p_report_id=>wwv_flow_api.id(201585830630666345)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14141334846363410)
,p_view_id=>wwv_flow_api.id(201585893536666346)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(14135324926360601)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(93344794834783595)
,p_view_id=>wwv_flow_api.id(201585893536666346)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(205253757344990279)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>67
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(93357198051504808)
,p_view_id=>wwv_flow_api.id(201585893536666346)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(201572357750495401)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(132693297393482319)
,p_view_id=>wwv_flow_api.id(201585893536666346)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(132687364010482078)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>136
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(132705854814556569)
,p_view_id=>wwv_flow_api.id(201585893536666346)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(132687429828482079)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>46
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(132713727882607794)
,p_view_id=>wwv_flow_api.id(201585893536666346)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(132689158007482096)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(139641175142863940)
,p_view_id=>wwv_flow_api.id(201585893536666346)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(139614081600739880)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>198
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(201586907894666348)
,p_view_id=>wwv_flow_api.id(201585893536666346)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(201571258646495390)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>189
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(201587877879666350)
,p_view_id=>wwv_flow_api.id(201585893536666346)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(201571420457495392)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>74
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(212028510566004204)
,p_view_id=>wwv_flow_api.id(201585893536666346)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(211832656222685981)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(212029000118004208)
,p_view_id=>wwv_flow_api.id(201585893536666346)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(211832715574685982)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(212029556971004210)
,p_view_id=>wwv_flow_api.id(201585893536666346)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(211832805616685983)
,p_is_visible=>true
,p_is_frozen=>false
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(212030069490004212)
,p_view_id=>wwv_flow_api.id(201585893536666346)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(211832884569685984)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(212512108170004709)
,p_view_id=>wwv_flow_api.id(201585893536666346)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(212506136323004478)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>246
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(109001825367153805)
,p_plug_name=>'flow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(134868872233482102)
,p_plug_name=>unistr('Duraci\00F3n Etapa')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(213565946276694940)
,p_plug_name=>'Parametros'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(313239197244649456)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
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
'Funcionalidad que permite: <br><br>',
'',
unistr('<i>Confirmar la resoluci\00F3n de Saldo a Favor.<br><br>'),
unistr('Visualizar la resoluci\00F3n de Saldo a Favor.<br><br>'),
unistr('Aplicar la compensaci\00F3n.<br><br>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>',
'',
'',
'',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(410043602769945945)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_api.id(865152993256628823)
,p_plug_name=>'Datos del Flujo'
,p_region_name=>'P109_DTOS_FLJO'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(134526472774107001)
,p_plug_name=>'Observaciones'
,p_parent_plug_id=>wwv_flow_api.id(865152993256628823)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (',
'select  a.id_sldos_fvr_dcmn_obsrvcn ,',
'        a.id_sldo_fvor_dcmnto ,',
'        c.nmbre_trea ,',
'        a.obsrvcion ,',
'        b.nmbre_trcro ,',
'        to_char(a.fcha_rgstro, ''dd/mm/yyyy hh24:mi:ss'') as fcha_rgstro',
'from    gf_g_sldos_fvr_dcmn_obsrvcn a',
'join    v_sg_g_usuarios             b on a.id_usrio = b.id_usrio',
'join    v_wf_d_flujos_tarea         c on a.id_fljo_trea = c.id_fljo_trea',
'--and     a.id_sldo_fvor_dcmnto = :P326_ID_SLDO_FVOR_DCMNTO',
'where   a.id_sldo_fvor_slctud = :P326_ID_SLDO_FVOR_SLCTUD',
'order by a.fcha_rgstro desc',
'    );'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(134526691475107003)
,p_name=>'ID_SLDOS_FVR_DCMN_OBSRVCN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLDOS_FVR_DCMN_OBSRVCN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(134526726195107004)
,p_name=>'ID_SLDO_FVOR_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLDO_FVOR_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(134526835092107005)
,p_name=>'NMBRE_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Etapa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_api.id(134526986156107006)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(134527033840107007)
,p_name=>'NMBRE_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TRCRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Usuario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>503
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
 p_id=>wwv_flow_api.id(134527171386107008)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>19
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
 p_id=>wwv_flow_api.id(134526520500107002)
,p_internal_uid=>134526520500107002
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
 p_id=>wwv_flow_api.id(134532088254113743)
,p_interactive_grid_id=>wwv_flow_api.id(134526520500107002)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(134532163834113744)
,p_report_id=>wwv_flow_api.id(134532088254113743)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134532628092113748)
,p_view_id=>wwv_flow_api.id(134532163834113744)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(134526691475107003)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134533116329113756)
,p_view_id=>wwv_flow_api.id(134532163834113744)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(134526726195107004)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134533697109113758)
,p_view_id=>wwv_flow_api.id(134532163834113744)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(134526835092107005)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134534189492113760)
,p_view_id=>wwv_flow_api.id(134532163834113744)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(134526986156107006)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134534682492113762)
,p_view_id=>wwv_flow_api.id(134532163834113744)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(134527033840107007)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134535158237113763)
,p_view_id=>wwv_flow_api.id(134532163834113744)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(134527171386107008)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(142322780748238526)
,p_plug_name=>'Ajuste'
,p_parent_plug_id=>wwv_flow_api.id(865152993256628823)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.idntfccion_sjto , ',
'        a.numro_ajste , ',
'        a.vlor ,',
'        trunc(fcha) fcha_rgstro, ',
'        to_char(fcha_aplccion , ''dd/mm/yyyy hh:mi:ss'') fcha_aplccion, ',
'        nmbre_trcro , ',
'        initcap(dscrpcion_estado),',
unistr('        decode(a.orgen,''A'', ''Autom\00E1tico'', ''Manual'',a.orgen) orgen '),
'from    v_gf_g_ajustes                a',
'join    wf_g_instancias_flujo_gnrdo   b on a.id_instncia_fljo = b.id_instncia_fljo_gnrdo_hjo',
'where   b.id_instncia_fljo = :F_ID_INSTNCIA_FLJO ;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(142322977360238528)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n del Sujeto')
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
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(142323058980238529)
,p_name=>'NUMRO_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NUMRO_AJSTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00FAmero del Ajuste')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(142323172918238530)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(142323271197238531)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(142323360856238532)
,p_name=>'FCHA_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_APLCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Fecha de Aplicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>19
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
 p_id=>wwv_flow_api.id(142323450367238533)
,p_name=>'NMBRE_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TRCRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Usuario que Registra'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>503
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
 p_id=>wwv_flow_api.id(142323512943238534)
,p_name=>'INITCAP(DSCRPCION_ESTADO)'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INITCAP(DSCRPCION_ESTADO)'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(142323651976238535)
,p_name=>'ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Origen'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_api.id(142322840998238527)
,p_internal_uid=>142322840998238527
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
 p_id=>wwv_flow_api.id(142330589677277564)
,p_interactive_grid_id=>wwv_flow_api.id(142322840998238527)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(142330600954277564)
,p_report_id=>wwv_flow_api.id(142330589677277564)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(142331180223277569)
,p_view_id=>wwv_flow_api.id(142330600954277564)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(142322977360238528)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>180
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(142331515634277685)
,p_view_id=>wwv_flow_api.id(142330600954277564)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(142323058980238529)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(142332013379277686)
,p_view_id=>wwv_flow_api.id(142330600954277564)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(142323172918238530)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(142332501173277688)
,p_view_id=>wwv_flow_api.id(142330600954277564)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(142323271197238531)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(142333020169277690)
,p_view_id=>wwv_flow_api.id(142330600954277564)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(142323360856238532)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>140
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(142333540866277692)
,p_view_id=>wwv_flow_api.id(142330600954277564)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(142323450367238533)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(142334084700277694)
,p_view_id=>wwv_flow_api.id(142330600954277564)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(142323512943238534)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(142334503070277698)
,p_view_id=>wwv_flow_api.id(142330600954277564)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(142323651976238535)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(205739757526950739)
,p_plug_name=>'Actos'
,p_parent_plug_id=>wwv_flow_api.id(865152993256628823)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.id_acto_tpo,',
'            b.dscrpcion,',
'            c.id_acto,',
'            c.id_sldo_fvor_dcmnto,',
unistr('            decode(a.indcdor_oblgtrio, ''S'', ''S\00ED'', ''No'') indcdor_oblgtrio,'),
'            case',
'                when (a.id_acto_tpo_rqrdo is null       and c.id_acto is null) or',
'                     (a.id_acto_tpo_rqrdo is not null   and d.id_acto is not null and c.id_acto is null) then',
'                    ''<center>',
'                        <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">''',
'                            ||nvl2(c.id_sldo_fvor_dcmnto, ''Modificar '', ''Generar '')',
'                            ||''<span class="fa ''||nvl2(c.id_sldo_fvor_dcmnto,''fa-edit'',''fa-gear fa-anim-spin'')||''"></span>',
'                        </button>',
'                     </center>''',
'            end accion,',
'            case',
'                when (a.id_acto_tpo_rqrdo is null     and c.id_sldo_fvor_dcmnto is not null and c.id_acto is null) or',
'                     (a.id_acto_tpo_rqrdo is not null and d.id_acto             is not null and c.id_sldo_fvor_dcmnto is not null and c.id_acto is null)then',
unistr('                        ''<a onclick="apex.confirm(''''Est\00E1 seguro de confirmar el acto ''||b.dscrpcion||'''''',{request:''''GENERAR'''', set:{''''P''||v(''app_page_id'')||''_ID_DOCUMENTO'''':''||c.id_sldo_fvor_dcmnto||''}});">'),
'                            <center>',
'                                <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Confirmar ''',
'                                    ||''<span class="fa fa-check"></span>',
'                                </button>',
'                            </center>',
'                        </a>''',
'            end confirmar',
'from        gn_d_actos_tipo_tarea           a',
'inner join  gn_d_actos_tipo                 b   on  b.id_acto_tpo               =   a.id_acto_tpo',
'inner join  wf_d_flujos_tarea               e   on  e.id_fljo_trea              =   a.id_fljo_trea',
'inner join  wf_d_flujos                     f   on  f.id_fljo                   =   e.id_fljo',
'inner join  wf_g_instancias_flujo           g   on  g.id_instncia_fljo          =   :F_ID_INSTNCIA_FLJO',
'                                                and g.id_fljo                   =   f.id_fljo',
'left  join  v_gf_g_saldos_favor_documentos  c   on  c.id_sldo_fvor_slctud       =   :P207_ID_SLDO_FVOR_SLCTUD',
'                                                and c.id_acto_tpo               =   b.id_acto_tpo',
'                                                and c.id_fljo_trea              =   a.id_fljo_trea',
'left join   v_gf_g_saldos_favor_documentos  d   on  d.id_sldo_fvor_slctud       =   :P207_ID_SLDO_FVOR_SLCTUD',
'                                                and d.id_acto_tpo               =   a.id_acto_tpo_rqrdo;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(210044550823081639)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LTORRES'
,p_internal_uid=>210044550823081639
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110621049669251858)
,p_db_column_name=>'ID_ACTO_TPO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Acto Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110622616295251863)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>20
,p_column_identifier=>'I'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110623062317251864)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>30
,p_column_identifier=>'J'
,p_column_label=>'Id Acto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110622280179251863)
,p_db_column_name=>'ID_SLDO_FVOR_DCMNTO'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Id Sldo Fvor Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110623486120251864)
,p_db_column_name=>'INDCDOR_OBLGTRIO'
,p_display_order=>50
,p_column_identifier=>'K'
,p_column_label=>unistr('\00BFIndicador Obligatorio?')
,p_allow_filtering=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110621454599251863)
,p_db_column_name=>'ACCION'
,p_display_order=>60
,p_column_identifier=>'C'
,p_column_label=>unistr('Acci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110621855281251863)
,p_db_column_name=>'CONFIRMAR'
,p_display_order=>70
,p_column_identifier=>'D'
,p_column_label=>'Confirmar'
,p_column_link=>'f?p=&APP_ID.:207:&SESSION.:GENERAR:&DEBUG.:RP:P207_ID_DOCUMENTO:#ID_SLDO_FVOR_DCMNTO#'
,p_column_linktext=>'#CONFIRMAR#'
,p_allow_filtering=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(210056803425090592)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1106238'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION:ID_ACTO:INDCDOR_OBLGTRIO:ACCION:CONFIRMAR:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(269490821099892187)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(865152993256628823)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_sldo_fvor_sprte , a.id_orgen ,',
unistr('        decode( a.id_orgen, null , ''Resoluci\00F3n'' , ''Recaudo'') tpo_documento,'),
'        decode( a.id_orgen, null , NMRO_RSLCION , cdgo_rcdo_orgn_tpo||'' - ''||nmro_dcmnto ) documento ,',
'        decode( a.id_orgen, null , FCHA_RSLCION , fcha_rcdo )   fcha_dcmnto ,',
'        decode( a.id_orgen, null , FILE_NAME , null )   archivo,',
'        decode( a.id_orgen, null , ''<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>''  , null) descargar ,',
'        decode( a.id_orgen, null , ''<center><span class=" fa fa-eye fa-1x fa-spin"></span></center>'' , null ) ver ,  ',
'        decode( a.id_orgen, null , null, vlor )                valor_recaudo ,',
'        decode( a.id_orgen, null , null , ''<center><span class=" fa fa-file-text-o fa-1x fa-spin"></span></center>'') detalle_rcdo ',
'from    v_gf_g_saldos_favor         a',
'join    gf_g_sldos_fvor_slctud_dtll b on a.id_sldo_fvor = b.id_sldo_fvor',
'left join gf_g_saldos_favor_soporte c on a.id_sldo_fvor = c.id_sldo_fvor',
'left join v_re_g_recaudos           d on a.id_orgen = d.id_rcdo',
'where   b.id_sldo_fvor_slctud = :P207_ID_SLDO_FVOR_SLCTUD',
'and     a.estdo != ''AN'' '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(269491048111892189)
,p_name=>'ID_SLDO_FVOR_SPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLDO_FVOR_SPRTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(269491111875892190)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(269491240094892191)
,p_name=>'TPO_DOCUMENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_DOCUMENTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo Origen'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_api.id(269491328275892192)
,p_name=>'DOCUMENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOCUMENTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>46
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
 p_id=>wwv_flow_api.id(269491460679892193)
,p_name=>'FCHA_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_DCMNTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha <br> Resoluci\00F3n/Recaudo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(269491578930892194)
,p_name=>'ARCHIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ARCHIVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Archivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>255
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
 p_id=>wwv_flow_api.id(269491676828892195)
,p_name=>'DESCARGAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCARGAR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Descargar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>'&DESCARGAR.'
,p_link_target=>'f?p=&APP_ID.:207:&SESSION.:DESCARGAR_ADJUNTO:&DEBUG.:RP:P207_ID_SLDO_FVOR_SPRTE:&ID_SLDO_FVOR_SPRTE.'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(269491698386892196)
,p_name=>'VER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VER'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Visualizar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&VER.'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR:GF_G_SALDOS_FAVOR_SOPORTE,ID_SLDO_FVOR_SPRTE,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,&ID_SLDO_FVOR_SPRTE.'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(269491842540892197)
,p_name=>'VALOR_RECAUDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALOR_RECAUDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Valor Recaudo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_05=>'BOTH'
,p_format_mask=>'999G999G999G999G990D00'
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
 p_id=>wwv_flow_api.id(269491899305892198)
,p_name=>'DETALLE_RCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DETALLE_RCDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Detalle<br>Recaudo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_01=>'&DETALLE_RCDO.'
,p_link_target=>'f?p=140000:17:&SESSION.::&DEBUG.:RP:P17_ID_RCDO:&ID_ORGEN.'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(269490940957892188)
,p_internal_uid=>269490940957892188
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
 p_id=>wwv_flow_api.id(269496777127989041)
,p_interactive_grid_id=>wwv_flow_api.id(269490940957892188)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(269496864578989042)
,p_report_id=>wwv_flow_api.id(269496777127989041)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(269497290047989044)
,p_view_id=>wwv_flow_api.id(269496864578989042)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(269491048111892189)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(269497814936989046)
,p_view_id=>wwv_flow_api.id(269496864578989042)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(269491111875892190)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(269498281347989050)
,p_view_id=>wwv_flow_api.id(269496864578989042)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(269491240094892191)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(269498835607989062)
,p_view_id=>wwv_flow_api.id(269496864578989042)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(269491328275892192)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(269499291147989066)
,p_view_id=>wwv_flow_api.id(269496864578989042)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(269491460679892193)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(269499863647989068)
,p_view_id=>wwv_flow_api.id(269496864578989042)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(269491578930892194)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(269500316226989070)
,p_view_id=>wwv_flow_api.id(269496864578989042)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(269491676828892195)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(269500804065989073)
,p_view_id=>wwv_flow_api.id(269496864578989042)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(269491698386892196)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(269501317364989076)
,p_view_id=>wwv_flow_api.id(269496864578989042)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(269491842540892197)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(269501798563989078)
,p_view_id=>wwv_flow_api.id(269496864578989042)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(269491899305892198)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32128522068693468)
,p_plug_name=>'<b>Soportes</b>'
,p_parent_plug_id=>wwv_flow_api.id(269490821099892187)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  c.file_name Nombre_Archivo, ',
'       c.fcha_rgstro Fecha_Registro,',
'       upper(substr(c.file_name,instr(c.file_name, ''.'', -1) + 1)) tipo_de_archivo,',
'       c.id_adjnto,',
'       1 ver,',
'       2 descargar ',
'from gf_g_saldos_favor_solicitud   b  ',
'     join gn_g_adjuntos            c on c.id_orgen = b.id_sldo_fvor_slctud',
'                                     and c.cdgo_orgen_tpo = ''SOPORTE_SAF''',
'                                     and c.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'where b.id_sldo_fvor_slctud = :P207_ID_SLDO_FVOR_SLCTUD  '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from gf_g_saldos_favor_solicitud  b  ',
'     join gn_g_adjuntos                c on c.id_orgen = b.id_sldo_fvor_slctud',
'                                         and c.cdgo_orgen_tpo = ''SOPORTE_SAF''',
'where b.id_sldo_fvor_slctud = :P207_ID_SLDO_FVOR_SLCTUD'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(32130368347693486)
,p_name=>'NOMBRE_ARCHIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOMBRE_ARCHIVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Archivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>255
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
 p_id=>wwv_flow_api.id(32130481174693487)
,p_name=>'FECHA_REGISTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA_REGISTRO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(32130597406693488)
,p_name=>'TIPO_DE_ARCHIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIPO_DE_ARCHIVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo de<br> Archivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>255
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
 p_id=>wwv_flow_api.id(32130706120693489)
,p_name=>'VER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VER'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_01=>'<center><span class=" fa fa-eye fa-1x fa-spin"></span></center>'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR:gn_g_adjuntos,ID_ADJNTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,&ID_ADJNTO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(32130736430693490)
,p_name=>'DESCARGAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCARGAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(32130860971693491)
,p_name=>'ID_ADJNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ADJNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Adjnto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(32130183352693484)
,p_internal_uid=>32130183352693484
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
 p_id=>wwv_flow_api.id(32146889037746066)
,p_interactive_grid_id=>wwv_flow_api.id(32130183352693484)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(32147015947746067)
,p_report_id=>wwv_flow_api.id(32146889037746066)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(32147999571746075)
,p_view_id=>wwv_flow_api.id(32147015947746067)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(32130368347693486)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>512.8299999999999
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(32148462448746077)
,p_view_id=>wwv_flow_api.id(32147015947746067)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(32130481174693487)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>165.128
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(32148942695746079)
,p_view_id=>wwv_flow_api.id(32147015947746067)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(32130597406693488)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>96.81800000000001
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(32149511263746081)
,p_view_id=>wwv_flow_api.id(32147015947746067)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(32130706120693489)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>79.83500000000001
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(32149833419746082)
,p_view_id=>wwv_flow_api.id(32147015947746067)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(32130736430693490)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114.79499999999999
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(32153122008756512)
,p_view_id=>wwv_flow_api.id(32147015947746067)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(32130860971693491)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(868009826276596530)
,p_plug_name=>'Actos Generados'
,p_parent_plug_id=>wwv_flow_api.id(865152993256628823)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.id_sldo_fvor_dcmnto,',
'            b.nmbre_trea,',
'            c.dscrpcion_acto_tpo,',
'            c.nmro_acto_dsplay,',
'            a.id_acto',
'from        gf_g_saldos_favor_documento a',
'inner join  v_wf_d_flujos_tarea         b   on  b.id_fljo_trea  =   a.id_fljo_trea',
'inner join  v_gn_g_actos                c   on  c.id_acto       =   a.id_acto',
'where      a.id_sldo_fvor_slctud                 =   :P207_ID_SLDO_FVOR_SLCTUD',
'and        dbms_lob.getlength(c.file_blob) >   0;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(121363913592438102)
,p_name=>'ID_SLDO_FVOR_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLDO_FVOR_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Sldo Fvor Dcmnto'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(868065196316889023)
,p_name=>'NMBRE_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tarea'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_api.id(868065312559889024)
,p_name=>'DSCRPCION_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(868065447330889025)
,p_name=>'NMRO_ACTO_DSPLAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO_DSPLAY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero de Acto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(868065494827889026)
,p_name=>'VISUALIZAR'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,FILE_BLOB,FILE_NAME,FILE_MIMETYPE,ID_ACTO,&ID_ACTO.'
,p_link_text=>'Ver <span aria-hidden="true" class="fa fa-eye"></span>'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(868065642118889027)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(868009913266596531)
,p_internal_uid=>868009913266596531
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(868063691172798846)
,p_interactive_grid_id=>wwv_flow_api.id(868009913266596531)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(868063794939798847)
,p_report_id=>wwv_flow_api.id(868063691172798846)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13281776069160)
,p_view_id=>wwv_flow_api.id(868063794939798847)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(121363913592438102)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(868071615126889181)
,p_view_id=>wwv_flow_api.id(868063794939798847)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(868065196316889023)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(868072133235889183)
,p_view_id=>wwv_flow_api.id(868063794939798847)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(868065312559889024)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>2
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(868072613628889184)
,p_view_id=>wwv_flow_api.id(868063794939798847)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(868065447330889025)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>3
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(868076123479917694)
,p_view_id=>wwv_flow_api.id(868063794939798847)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(868065494827889026)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(868076586533917699)
,p_view_id=>wwv_flow_api.id(868063794939798847)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(868065642118889027)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(110069846169359797)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(410043602769945945)
,p_button_name=>'Btn_Aplicar'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de Aplicar la CompensaciÃ³n ?'',''Btn_Aplicar'');'
,p_button_condition=>'(:P207_ID_SLDO_FVOR_DVLCION is not null and :P207_ID_SLD_FVR_CMPNSCION is not null and :P207_ID_INSTNCIA_FLJO_GNRDO_HJO is null) or (:P207_ID_SLD_FVR_CMPNSCION is not null and :P207_ID_INSTNCIA_FLJO_GNRDO_HJO is null)'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(134527240913107009)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(410043602769945945)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Regresar a Gesti\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:216:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(134885037168750101)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(410043602769945945)
,p_button_name=>'BTN_OBSRVCNES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Observaciones'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:326:&SESSION.::&DEBUG.:RP:P326_ID_SLDO_FVOR_SLCTUD,P326_INDCDOR_TRNSCION,P326_ID_FLJO_TREA:&P207_ID_SLDO_FVOR_SLCTUD.,N,&F_ID_FLJO_TREA.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  *',
'from    wf_g_instancias_transicion  a ',
'where   id_instncia_fljo   = :F_ID_INSTNCIA_FLJO',
'and     id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'and     id_estdo_trnscion = 3'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-file-text-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32424533807615402)
,p_name=>'P207_ID_SLDO_FVOR_DVLCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(213565946276694940)
,p_prompt=>'id_sldo_fvor_dvlcion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32605481333621101)
,p_name=>'P207_ID_SLD_FVR_CMPNSCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(213565946276694940)
,p_prompt=>'id_sld_fvr_cmpnscion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46946227493718801)
,p_name=>'P207_ID_INSTNCIA_FLJO_GNRDO_HJO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(213565946276694940)
,p_prompt=>'New'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110067883129349350)
,p_name=>'P207_PARAMETRO_TRANSICION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(213565946276694940)
,p_prompt=>'Parametro Transicion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110068262133349353)
,p_name=>'P207_ID_DOCUMENTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(213565946276694940)
,p_prompt=>'ID SAF Documento'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110068617728349353)
,p_name=>'P207_ID_SLCTUD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(213565946276694940)
,p_prompt=>'id_slctud'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110069069198349353)
,p_name=>'P207_ID_SLDO_FVOR_SLCTUD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(213565946276694940)
,p_prompt=>'id_sldo_fvor_slctud'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121363857307438101)
,p_name=>'P207_ID_ACTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(213565946276694940)
,p_prompt=>'id_acto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123431222704856301)
,p_name=>'P207_RESPUESTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(213565946276694940)
,p_prompt=>'Nuevo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134757827608104411)
,p_name=>'P207_ID_SLDO_FVOR_SPRTE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(213565946276694940)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134868982156482103)
,p_name=>'P207_USRIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(134868872233482102)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134869080762482104)
,p_name=>'P207_FCHA_INCIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(134868872233482102)
,p_prompt=>'Fecha Inicio Etapa'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134869198936482105)
,p_name=>'P207_FCHA_FIN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(134868872233482102)
,p_prompt=>'Fecha Fin Etapa'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134869209919482106)
,p_name=>'P207_DIAS_FLTNTES'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(134868872233482102)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134869386332482107)
,p_name=>'P207_TXTO_DRCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(134868872233482102)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(134757917993104412)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar Adjunto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Consulta',
'declare',
'    v_file_name       varchar2(2000);',
'    v_file_blob       blob;',
'    file_blob         blob;',
'    v_file_bfile      bfile;',
'    v_file_mimetype   varchar2(1000);',
'    v_tipo_operacion  varchar2(20);',
'    v_id_dcmnto       number;',
'    o_cdgo_rspsta     number;',
'    o_mnsje_rspsta    varchar2(4000);',
'begin',
'',
'    --apex_application.g_print_success_message := ''<span style="color:white">ITEM [''||:P207_ID_SLDO_FVOR_SPRTE||'']!'';       ',
'    select  file_blob,    ',
'           file_bfile,     ',
'           file_mimetype,     ',
'           file_name',
'    into   v_file_blob,   ',
'           v_file_bfile,   ',
'           v_file_mimetype,   ',
'           v_file_name',
'    from gf_g_saldos_favor_soporte',
'    where id_sldo_fvor_sprte  = :P207_ID_SLDO_FVOR_SPRTE;',
'',
'    if  v_file_blob is null and v_file_bfile is not null then',
'    ',
'        -- apex_application.g_print_success_message := ''<span style="color:white">ENTRO [''||:P207_ID_SLDO_FVOR_SPRTE||'']!'';',
'        pkg_gd_utilidades.prc_co_archco_dsco ( p_bfile          => v_file_bfile',
'                                                , o_archvo_blob      => v_file_blob ',
'                                                , o_cdgo_rspsta      => o_cdgo_rspsta ',
'                                                , o_mnsje_rspsta     => o_mnsje_rspsta) ;   ',
'        ',
'    end if;',
'    ',
'     htp.init;',
'        owa_util.mime_header(v_file_mimetype, FALSE );',
'        htp.p(''Content-length: '' ||dbms_lob.getlength(v_file_blob));',
'        htp.p(''Content-Disposition: attachment; filename="'' ||v_file_name || ''"'' );',
'        htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'        owa_util.http_header_close;',
'        wpg_docload.download_file(v_file_blob);',
'        apex_application.stop_apex_engine; ',
'    ',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DESCARGAR_ADJUNTO'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(134868772320482101)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta duraci\00F3n etapa')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  c.nmbre_trcro ,',
'        trunc(a.fcha_incio) , ',
'        trunc(a.fcha_fin_plnda) ,    ',
'        trunc(a.fcha_fin_plnda) - trunc(sysdate) dias_fltntes  ,',
'        decode( id_estdo_trnscion , 3 , ''Esta tarea fue finalizada por el usuario ''||trim(c.nmbre_trcro)',
'        ||'' en un total de ''|| decode ( (trunc(a.fcha_fin_real) - trunc(a.fcha_incio)) , 0 , 1 , (trunc(a.fcha_fin_real) - trunc(a.fcha_incio)) )',
unistr('        ||'' d\00EDa(s). Desde el ''||trunc(a.fcha_incio)||'' hasta el ''||trunc(a.fcha_fin_real)||''.'' ,'),
'                ''Sr(a) ''|| trim(c.nmbre_trcro) ||'' le quedan ''|| decode ( (trunc(a.fcha_fin_plnda) - trunc(sysdate)) , 0 , 1 ,(trunc(a.fcha_fin_plnda) - trunc(sysdate)) )',
unistr('        ||''  d\00EDa(s) para resolver la tarea de ''||b.nmbre_trea||'' para pasar a dar continuidad al proceso.'' )'),
'into    :P207_USRIO,',
'        :P207_FCHA_INCIO,',
'        :P207_FCHA_FIN, ',
'        :P207_DIAS_FLTNTES, ',
'        :P207_TXTO_DRCION',
'from    wf_g_instancias_transicion  a',
'join    v_wf_d_flujos_tarea         b on a.id_fljo_trea_orgen = b.id_fljo_trea',
'join    v_sg_g_usuarios             c on a.id_usrio = c.id_usrio',
'where   id_instncia_fljo   = :F_ID_INSTNCIA_FLJO',
'and     id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'order by id_instncia_trnscion desc',
'fetch first 1 row only ',
';'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(111766253017291201)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Disparar ajuste'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta number;',
'    v_mnsje_rspsta varchar(2000);',
'begin    ',
'        ',
'	if :P207_ID_ACTO is null then',
unistr('		raise_application_error(-20001,''SR(a) '' ||:F_NMBRE_USRIO||   '' debe confirmar el acto antes de realizar la aplicaci\00F3n'');         '),
'	else',
'		begin',
'            pkg_gf_saldos_favor.prc_rg_saldo_favor_aplicacion(p_cdgo_clnte          =>  :F_CDGO_CLNTE,       ',
'                                                              p_id_usrio            =>  :F_ID_USRIO,        ',
'                                                              p_id_instncia_fljo    =>  :F_ID_INSTNCIA_FLJO, ',
'                                                              p_id_fljo_trea	    =>  :F_ID_FLJO_TREA, ',
'                                                              p_id_sldo_fvor_slctud =>  :P207_ID_SLDO_FVOR_SLCTUD,',
'                                                              p_cdgo_acto_tpo       =>  ''SAF'',',
'										                      o_cdgo_rspsta			=>  :P207_RESPUESTA,       	',
'										                      o_mnsje_rspsta	    =>  v_mnsje_rspsta);                                 ',
'            if (:P207_RESPUESTA != 0) then',
'                raise_application_error(-20001,v_mnsje_rspsta);',
'            end if;',
'		exception',
'			when others then',
'                raise_application_error(-20001,''Error:'' ||v_mnsje_rspsta||'' - ''||sqlerrm);				',
'		end;        ',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(110069846169359797)
,p_process_success_message=>unistr('Aplicaci\00F3n con \00E9xito ')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13796083496516802)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Act'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta number;',
'    v_id_acto    number;',
'    v_mnsje_rspsta varchar(2000);',
'begin',
'    begin',
'    pkg_gf_saldos_favor.prc_rg_saldo_favor_acto(p_cdgo_clnte              =>    :F_CDGO_CLNTE,',
'                                                p_id_usrio                =>    :F_ID_USRIO,',
'                                                p_id_sldo_fvor_slctud     =>    :P207_ID_SLDO_FVOR_SLCTUD,',
'                                                p_id_fljo_trea            =>    :F_ID_FLJO_TREA,',
'                                                p_id_sldo_fvor_dcmnto     =>    :P207_ID_DOCUMENTO,',
'                                                o_id_acto                 =>     v_id_acto,',
'                                                o_cdgo_rspsta             =>     v_cdgo_rspsta,',
'                                                o_mnsje_rspsta            =>     v_mnsje_rspsta) ;',
'                                                ',
'    :P207_ID_ACTO := v_id_acto;',
'                                                ',
'    if(v_cdgo_rspsta > 0)then',
'         raise_application_error(-20001,v_mnsje_rspsta);',
'     end if;',
'',
'    end;',
'',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'GENERAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Se Genero el acto Correctamente.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(126276197911406101)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'Siguiente'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(110069846169359797)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(32424485833615401)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Capturar compensaci\00F3n devoluci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select c.id_sldo_fvor_dvlcion,',
'           b.id_sld_fvr_cmpnscion',
'    into :P207_ID_SLDO_FVOR_DVLCION,',
'         :P207_ID_SLD_FVR_CMPNSCION',
'    from gf_g_saldos_favor_solicitud        a',
'    left join gf_g_saldos_favor_cmpnscion   b   on  a.id_sldo_fvor_slctud = b.id_sldo_fvor_slctud',
'    left join gf_g_saldos_favor_devlucion   c   on  a.id_sldo_fvor_slctud   = c.id_sldo_fvor_slctud',
'    where a.id_sldo_fvor_slctud = :P207_ID_SLDO_FVOR_SLCTUD;',
'    ',
'    exception',
'        when no_data_found then',
'            :P207_ID_SLDO_FVOR_DVLCION := null;',
'            :P207_ID_SLD_FVR_CMPNSCION := null;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(45157603012696701)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Capturar identificador del acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    begin',
'        select a.id_acto ',
'        into :P207_ID_ACTO',
'        from gf_g_saldos_favor_documento a',
'        where a.id_sldo_fvor_slctud = :P207_ID_SLDO_FVOR_SLCTUD',
'        and a.id_acto_tpo in (',
'                                    select id_acto_tpo',
'                                    from gn_d_actos_tipo',
'                                    where cdgo_clnte = :F_CDGO_CLNTE',
'                                    and cdgo_acto_tpo in ( ''SAF'' , ''CSA'' )',
'                                );',
'    exception ',
'        when others then',
'            :P207_ID_ACTO := null;',
'    end;',
'    ',
'    ',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46946381817718802)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Capturar la instancia de flujo ajuste'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    select distinct 1',
'    into   :P207_ID_INSTNCIA_FLJO_GNRDO_HJO',
'    from wf_g_instancias_flujo_gnrdo i',
'    where i.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'',
'exception ',
'    when others then',
'        :P207_ID_INSTNCIA_FLJO_GNRDO_HJO := null;',
'    ',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
