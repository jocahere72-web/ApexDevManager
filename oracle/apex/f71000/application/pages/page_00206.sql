prompt --application/pages/page_00206
begin
wwv_flow_api.create_page(
 p_id=>206
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Aprobaci\00F3n de Saldo Favor')
,p_step_title=>unistr('Aprobaci\00F3n de Saldo Favor')
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer{',
'     display:none;   ',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20250901151925'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35545921158923251)
,p_plug_name=>unistr('Compesaci\00F3n - Devoluci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35546079391923252)
,p_plug_name=>unistr('Devoluci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(35545921158923251)
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
'       b.id_sldo_fvor,',
'       f.idntfccion_sjto_frmtda',
'from v_gf_g_saldos_favor a',
'join gf_g_sldos_fvr_dvlcion_dtll  b on a.id_sldo_fvor         = b.id_sldo_fvor',
'join gf_g_saldos_favor_devlucion  c on b.id_sldo_fvor_dvlcion = c.id_sldo_fvor_dvlcion',
'join df_c_bancos                  d on c.id_bnco              = d.id_bnco',
'join v_si_i_sujetos_impuesto      f on a.id_sjto_impsto       = f.id_sjto_impsto',
'where c.id_sldo_fvor_slctud =    :P205_ID_SLDO_FVOR_SLCTUD;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35547025078923262)
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
 p_id=>wwv_flow_api.id(35547138937923263)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
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
 p_id=>wwv_flow_api.id(35547277505923264)
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
 p_id=>wwv_flow_api.id(35547389605923265)
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
 p_id=>wwv_flow_api.id(35547493973923266)
,p_name=>'NMRO_CNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'N. Cuenta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(35547501586923267)
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62103132632460101)
,p_name=>'ID_SLDO_FVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLDO_FVOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'# Saldo a Favor'
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
 p_id=>wwv_flow_api.id(35546910377923261)
,p_internal_uid=>35546910377923261
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
 p_id=>wwv_flow_api.id(35556067594943372)
,p_interactive_grid_id=>wwv_flow_api.id(35546910377923261)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(35556174877943372)
,p_report_id=>wwv_flow_api.id(35556067594943372)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35559624732943386)
,p_view_id=>wwv_flow_api.id(35556174877943372)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(35547025078923262)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35560139069943387)
,p_view_id=>wwv_flow_api.id(35556174877943372)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(35547138937923263)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35560650555943389)
,p_view_id=>wwv_flow_api.id(35556174877943372)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(35547277505923264)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>209
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35561171866943391)
,p_view_id=>wwv_flow_api.id(35556174877943372)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(35547389605923265)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>252
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35561664188943392)
,p_view_id=>wwv_flow_api.id(35556174877943372)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(35547493973923266)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>164
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35562133527943396)
,p_view_id=>wwv_flow_api.id(35556174877943372)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(35547501586923267)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>234
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62109163742461558)
,p_view_id=>wwv_flow_api.id(35556174877943372)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(62103132632460101)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69562929751419553)
,p_plug_name=>'Reconocimiento'
,p_parent_plug_id=>wwv_flow_api.id(35545921158923251)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  nvl(listagg(e.vgncia, '','') within group (order by e.vgncia), ''-'') as vgnvia,',
'        c.nmbre_impsto_sbmpsto,',
'        d.idntfccion_sjto_frmtda,',
'        c.vlor_sldo_fvor,',
'        b.id_sldo_fvor,',
'        c.nmbre_sldo_fvor_tpo,',
'        to_char(c.fcha_rgstro, ''DD/MM/YYYY'') as fcha_rgstro',
'from gf_g_saldos_favor_solicitud    a',
'join gf_g_sldos_fvor_slctud_dtll    b   on  a.id_sldo_fvor_slctud   =   b.id_sldo_fvor_slctud',
'join v_gf_g_saldos_favor            c   on  b.id_sldo_fvor          =   c.id_sldo_fvor',
'left join gf_g_saldos_favor_vigencia     e   on  c.id_sldo_fvor          =   e.id_sldo_fvor',
'join v_si_i_sujetos_impuesto        d   on  c.id_sjto_impsto        =   d.id_sjto_impsto',
'where a.id_sldo_fvor_slctud = :P206_ID_SLDO_FVOR_SLCTUD',
'group by e.vgncia,',
'         c.nmbre_impsto_sbmpsto,',
'         d.idntfccion_sjto_frmtda,',
'         c.vlor_sldo_fvor,',
'         b.id_sldo_fvor,',
'         c.nmbre_sldo_fvor_tpo,',
'         to_char(c.fcha_rgstro, ''DD/MM/YYYY'');'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62103298905460102)
,p_name=>'ID_SLDO_FVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLDO_FVOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'# Saldo a Favor'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(69563122687419555)
,p_name=>'VGNVIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNVIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(69563201103419556)
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
 p_id=>wwv_flow_api.id(69563315520419557)
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
 p_id=>wwv_flow_api.id(69563436709419558)
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
 p_id=>wwv_flow_api.id(69563561089419559)
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
 p_id=>wwv_flow_api.id(69563652001419560)
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
 p_id=>wwv_flow_api.id(69563010806419554)
,p_internal_uid=>69563010806419554
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
 p_id=>wwv_flow_api.id(69568734394424373)
,p_interactive_grid_id=>wwv_flow_api.id(69563010806419554)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(69568839154424374)
,p_report_id=>wwv_flow_api.id(69568734394424373)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62111194383477396)
,p_view_id=>wwv_flow_api.id(69568839154424374)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(62103298905460102)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69569326199424381)
,p_view_id=>wwv_flow_api.id(69568839154424374)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(69563122687419555)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69569851999424385)
,p_view_id=>wwv_flow_api.id(69568839154424374)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(69563201103419556)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>239
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69570356233424387)
,p_view_id=>wwv_flow_api.id(69568839154424374)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(69563315520419557)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>232
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69570866216424389)
,p_view_id=>wwv_flow_api.id(69568839154424374)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(69563436709419558)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>232
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69571359319424390)
,p_view_id=>wwv_flow_api.id(69568839154424374)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(69563561089419559)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>168
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69571866418424392)
,p_view_id=>wwv_flow_api.id(69568839154424374)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(69563652001419560)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(154742587411886253)
,p_plug_name=>unistr('Compensaci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(35545921158923251)
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
'where c.id_sldo_fvor_slctud = :P206_ID_SLDO_FVOR_SLCTUD ',
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
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(63719425918273101)
,p_name=>'ID_MVMNTO_FNCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_MVMNTO_FNCRO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(85859056699872944)
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
 p_id=>wwv_flow_api.id(85859122517872945)
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
 p_id=>wwv_flow_api.id(85860850696872962)
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
 p_id=>wwv_flow_api.id(92785774290130746)
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
 p_id=>wwv_flow_api.id(154742951335886256)
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
 p_id=>wwv_flow_api.id(154743113146886258)
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
 p_id=>wwv_flow_api.id(154744050439886267)
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
 p_id=>wwv_flow_api.id(158425450034381145)
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
 p_id=>wwv_flow_api.id(165004348912076847)
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
 p_id=>wwv_flow_api.id(165004408264076848)
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
 p_id=>wwv_flow_api.id(165004498306076849)
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
 p_id=>wwv_flow_api.id(165004577259076850)
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
 p_id=>wwv_flow_api.id(165677829012395344)
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
 p_id=>wwv_flow_api.id(154742700399886254)
,p_internal_uid=>154742700399886254
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
 p_id=>wwv_flow_api.id(154757523320057211)
,p_interactive_grid_id=>wwv_flow_api.id(154742700399886254)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(154757586226057212)
,p_report_id=>wwv_flow_api.id(154757523320057211)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46516487524174461)
,p_view_id=>wwv_flow_api.id(154757586226057212)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(158425450034381145)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>67
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46528890740895674)
,p_view_id=>wwv_flow_api.id(154757586226057212)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(154744050439886267)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(63725589724275300)
,p_view_id=>wwv_flow_api.id(154757586226057212)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(63719425918273101)
,p_is_visible=>true
,p_is_frozen=>false
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(85864990082873185)
,p_view_id=>wwv_flow_api.id(154757586226057212)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(85859056699872944)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>136
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(85877547503947435)
,p_view_id=>wwv_flow_api.id(154757586226057212)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(85859122517872945)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>46
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(85885420571998660)
,p_view_id=>wwv_flow_api.id(154757586226057212)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(85860850696872962)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92812867832254806)
,p_view_id=>wwv_flow_api.id(154757586226057212)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(92785774290130746)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>198
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154758600584057214)
,p_view_id=>wwv_flow_api.id(154757586226057212)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(154742951335886256)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>189
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154759570569057216)
,p_view_id=>wwv_flow_api.id(154757586226057212)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(154743113146886258)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>74
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(165200203255395070)
,p_view_id=>wwv_flow_api.id(154757586226057212)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(165004348912076847)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(165200692807395074)
,p_view_id=>wwv_flow_api.id(154757586226057212)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(165004408264076848)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(165201249660395076)
,p_view_id=>wwv_flow_api.id(154757586226057212)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(165004498306076849)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(165201762179395078)
,p_view_id=>wwv_flow_api.id(154757586226057212)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(165004577259076850)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(165683800859395575)
,p_view_id=>wwv_flow_api.id(154757586226057212)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(165677829012395344)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>246
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103429993466815301)
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
,p_attribute_04=>'false'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103498439386345605)
,p_plug_name=>'Parametros'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(134788268408337201)
,p_plug_name=>'Actos'
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
 p_id=>wwv_flow_api.id(246253870753350684)
,p_plug_name=>'Actos'
,p_parent_plug_id=>wwv_flow_api.id(134788268408337201)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_acto_tpo,',
'        a.dscrpcion,',
'        b.id_sldo_fvor_dcmnto,',
'        case',
'            when ( b.id_acto is null or b.id_dcmnto is null ) then',
'                ''<center>',
'                    <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">''',
'                        ||''<span class="fa fa-eye"></span>',
'                    </button>',
'                </center>''',
'        end confirmar,',
'        case',
'            when (b.id_acto is null or b.id_dcmnto is null ) then',
'        ',
unistr('                                ''<a onclick="apex.confirm(''''\00BFEst\00E1 seguro de confirmar el acto ''||a.dscrpcion||''?'''',{request:''''GENERAR'''', set:{''''P''||v(''app_page_id'')||''_ID_DOCUMENTO'''':''||b.id_sldo_fvor_dcmnto||''}});">'),
'                            <center>',
'                                <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Confirmar ''',
'                                    ||''<span class="fa fa-check"></span>',
'                                </button>',
'                            </center>',
'                        </a>''',
'        end acto,',
'        ''<img src="#IMAGE_PREFIX#menu/blue_function_16x16.gif" style="max-width:32px;" alt="" title="" />'' as obsrvcion',
' from gn_d_actos_tipo                   a',
' join v_gf_g_saldos_favor_documentos    b on a.id_acto_tpo = b.id_acto_tpo',
' where b.id_sldo_fvor_slctud = :P206_ID_SLDO_FVOR_SLCTUD  '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
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
 p_id=>wwv_flow_api.id(246253994747350685)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LTORRES'
,p_internal_uid=>246253994747350685
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123405655021678830)
,p_db_column_name=>'ID_ACTO_TPO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Acto Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123406061367678832)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123406415369678833)
,p_db_column_name=>'ID_SLDO_FVOR_DCMNTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Sldo Fvor Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(123406809434678833)
,p_db_column_name=>'CONFIRMAR'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Visualizar'
,p_column_link=>'f?p=&APP_ID.:203:&SESSION.::&DEBUG.:RP:P203_ID_SLDO_FVOR_DCMNTO,P203_ID_FLJO_TREA,P203_EDIT:#ID_SLDO_FVOR_DCMNTO#,&F_ID_FLJO_TREA.,N'
,p_column_linktext=>'#CONFIRMAR#'
,p_allow_filtering=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_format_mask=>'PCT_GRAPH:::'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134552147503835801)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Observaciones'
,p_column_link=>'f?p=&APP_ID.:326:&SESSION.::&DEBUG.:RP,326:P326_ID_SLDO_FVOR_DCMNTO,P326_ID_SLDO_FVOR_SLCTUD,P326_INDCDOR_TRNSCION,P326_ID_FLJO_TREA:#ID_SLDO_FVOR_DCMNTO#,&P205_ID_SLDO_FVOR_SLCTUD.,N,&F_ID_FLJO_TREA.'
,p_column_linktext=>'#OBSRVCION#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(10749948048071001)
,p_db_column_name=>'ACTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Confirmar'
,p_column_link=>'f?p=&APP_ID.:206:&SESSION.:GENERAR:&DEBUG.:RP:P206_ID_DOCUMENTO:#ID_SLDO_FVOR_DCMNTO#'
,p_column_linktext=>'#ACTO#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(246260628693360432)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1234072'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_ACTO_TPO:DSCRPCION:ID_SLDO_FVOR_DCMNTO:CONFIRMAR:OBSRVCION:ACTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(269558331953173163)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(134788268408337201)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>50
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
'where   b.id_sldo_fvor_slctud = :P206_ID_SLDO_FVOR_SLCTUD',
'and     a.estdo != ''AN'' '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(269558558965173165)
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
 p_id=>wwv_flow_api.id(269558622729173166)
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(269558750948173167)
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
 p_id=>wwv_flow_api.id(269558839129173168)
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
 p_id=>wwv_flow_api.id(269558971533173169)
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
 p_id=>wwv_flow_api.id(269559089784173170)
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
 p_id=>wwv_flow_api.id(269559187682173171)
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
,p_link_target=>'f?p=&APP_ID.:205:&SESSION.:DESCARGAR_ADJUNTO:&DEBUG.:RP:P205_ID_SLDO_FVOR_SPRTE:&ID_SLDO_FVOR_SPRTE.'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(269559209240173172)
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
 p_id=>wwv_flow_api.id(269559353394173173)
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
 p_id=>wwv_flow_api.id(269559410159173174)
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
 p_id=>wwv_flow_api.id(269558451811173164)
,p_internal_uid=>269558451811173164
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
 p_id=>wwv_flow_api.id(269564287981270017)
,p_interactive_grid_id=>wwv_flow_api.id(269558451811173164)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(269564375432270018)
,p_report_id=>wwv_flow_api.id(269564287981270017)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(269564800901270020)
,p_view_id=>wwv_flow_api.id(269564375432270018)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(269558558965173165)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(269565325790270022)
,p_view_id=>wwv_flow_api.id(269564375432270018)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(269558622729173166)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(269565792201270026)
,p_view_id=>wwv_flow_api.id(269564375432270018)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(269558750948173167)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(269566346461270038)
,p_view_id=>wwv_flow_api.id(269564375432270018)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(269558839129173168)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(269566802001270042)
,p_view_id=>wwv_flow_api.id(269564375432270018)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(269558971533173169)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(269567374501270044)
,p_view_id=>wwv_flow_api.id(269564375432270018)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(269559089784173170)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(269567827080270046)
,p_view_id=>wwv_flow_api.id(269564375432270018)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(269559187682173171)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(269568314919270049)
,p_view_id=>wwv_flow_api.id(269564375432270018)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(269559209240173172)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(269568828218270052)
,p_view_id=>wwv_flow_api.id(269564375432270018)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(269559353394173173)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(269569309417270054)
,p_view_id=>wwv_flow_api.id(269564375432270018)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(269559410159173174)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(878795352527931492)
,p_plug_name=>'Actos Generados'
,p_parent_plug_id=>wwv_flow_api.id(134788268408337201)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>40
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
'where      a.id_sldo_fvor_slctud                 =   :P206_ID_SLDO_FVOR_SLCTUD',
'and        dbms_lob.getlength(c.file_blob) >   0;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(132149439843773064)
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
 p_id=>wwv_flow_api.id(878850722568223985)
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
 p_id=>wwv_flow_api.id(878850838811223986)
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
 p_id=>wwv_flow_api.id(878850973582223987)
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
 p_id=>wwv_flow_api.id(878851021079223988)
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
 p_id=>wwv_flow_api.id(878851168370223989)
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
 p_id=>wwv_flow_api.id(878795439517931493)
,p_internal_uid=>878795439517931493
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
 p_id=>wwv_flow_api.id(878849217424133808)
,p_interactive_grid_id=>wwv_flow_api.id(878795439517931493)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(878849321191133809)
,p_report_id=>wwv_flow_api.id(878849217424133808)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10798808027404122)
,p_view_id=>wwv_flow_api.id(878849321191133809)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(132149439843773064)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(878857141378224143)
,p_view_id=>wwv_flow_api.id(878849321191133809)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(878850722568223985)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(878857659487224145)
,p_view_id=>wwv_flow_api.id(878849321191133809)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(878850838811223986)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>2
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(878858139880224146)
,p_view_id=>wwv_flow_api.id(878849321191133809)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(878850973582223987)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>3
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(878861649731252656)
,p_view_id=>wwv_flow_api.id(878849321191133809)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(878851021079223988)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(878862112785252661)
,p_view_id=>wwv_flow_api.id(878849321191133809)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(878851168370223989)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(134788937135337208)
,p_plug_name=>unistr('Duraci\00F3n Etapa')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(280730149796636317)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>70
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
'<i>',
'',
'Funcionalidad que permite: <br><br>',
'',
'Aprobar o rechazar los Saldos a Favor.<br><br>',
'',
unistr('Visualizar la plantilla generada en la etapa de proyecci\00F3n.<br><br>'),
'',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(299974043528586150)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103498143126345602)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(299974043528586150)
,p_button_name=>'BTN_APROBAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aprobar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_exste_rgstro    number:=0;',
'begin',
'',
'    select count(1) into v_exste_rgstro',
'    from wf_g_instancias_transicion a',
'    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'    and a.id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'    and a.id_estdo_trnscion in (1,2);',
'',
'    if v_exste_rgstro > 0 and :P206_ID_ACTO is not null then',
'        return true;    ',
'    else',
'        return false;',
'    end if;',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103498242746345603)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(299974043528586150)
,p_button_name=>'BTN_RECHAZAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Rechazar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from wf_g_instancias_transicion a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'and a.id_estdo_trnscion in (1,2);'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(134789414832337213)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(299974043528586150)
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
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(134713436772426101)
,p_branch_name=>'Ir a observaciones'
,p_branch_action=>'f?p=&APP_ID.:326:&SESSION.::&DEBUG.:RP,326:P326_ID_SLDO_FVOR_SLCTUD,P326_INDCDOR_TRNSCION,P326_ID_INSTNCIA_FLJO,P326_ID_FLJO_TREA:&P206_ID_SLDO_FVOR_SLCTUD.,S,&F_ID_INSTNCIA_FLJO.,&F_ID_FLJO_TREA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(103498242746345603)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(134869447530482108)
,p_branch_name=>unistr('Ir a gesti\00F3n')
,p_branch_action=>'f?p=&APP_ID.:216:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(103498143126345602)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10779742473299001)
,p_name=>'P206_ID_ACTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(103498439386345605)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103498595965345606)
,p_name=>'P206_PARAMETRO_TRANSICION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(103498439386345605)
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
 p_id=>wwv_flow_api.id(103498604406345607)
,p_name=>'P206_ID_DOCUMENTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(103498439386345605)
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
 p_id=>wwv_flow_api.id(109150877456860601)
,p_name=>'P206_ID_SLCTUD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(103498439386345605)
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
 p_id=>wwv_flow_api.id(109443745743776202)
,p_name=>'P206_ID_SLDO_FVOR_SLCTUD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(103498439386345605)
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134788403420337203)
,p_name=>'P206_USRIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(103498439386345605)
,p_prompt=>'Usuario'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134788525247337204)
,p_name=>'P206_FCHA_INCIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(134788937135337208)
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
 p_id=>wwv_flow_api.id(134788662121337205)
,p_name=>'P206_FCHA_FIN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(134788937135337208)
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
 p_id=>wwv_flow_api.id(134788716075337206)
,p_name=>'P206_DIAS_FLTNTES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(103498439386345605)
,p_prompt=>unistr('D\00EDas para resolver la tarea:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134789089091337209)
,p_name=>'P206_TXTO_DRCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(134788937135337208)
,p_prompt=>' '
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(122585164708364301)
,p_name=>'Btn_Aprobar'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(103498143126345602)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122585236112364302)
,p_event_id=>wwv_flow_api.id(122585164708364301)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function fnc_AprobarSaldosAFavor(){',
'    try{',
'       apex.server.process("ajaxAprobarSaldosAFavor",{',
'            pageItems: "#P206_ID_SLDO_FVOR_SLCTUD, #P206_ID_DOCUMENTO"',
'        },{',
'            success: function(data){',
'                if(data.o_cdgo_rspsta != 0){',
'                   console.log(data.o_cdgo_rspsta);',
'                   apex.message.clearErrors();',
'                   apex.message.showErrors ([',
'                       {',
'                           type:       "error",',
'                           location:   "page",',
'                           message:    data.o_mnsje_rspsta,',
'                           unsafe:     false',
'                       }',
'                   ]);',
'                }else{',
unistr('                   apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                   window.localStorage.clear();',
'                   apex.submit({request:"BTN_APROBAR"});',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }',
'}',
'',
'',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de aprobar la proyecci\00F3n?", function(okPressed) {'),
'    if(okPressed) {',
'        fnc_AprobarSaldosAFavor();',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(46852806697712701)
,p_name=>unistr('Rechazar la Proyecci\00F3n')
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(103498242746345603)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(46852917830712702)
,p_event_id=>wwv_flow_api.id(46852806697712701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de rechazar la proyecci\00F3n?", function(okPressed) {'),
'    if(okPressed) {',
'        window.localStorage.clear();',
'        apex.submit({request:"BTN_RECHAZAR"});',
'    }',
'});',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(134788851238337207)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta Duraci\00F3n Etapa')
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
'into    :P206_USRIO,',
'        :P206_FCHA_INCIO,',
'        :P206_FCHA_FIN, ',
'        :P206_DIAS_FLTNTES, ',
'        :P206_TXTO_DRCION',
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
 p_id=>wwv_flow_api.id(7010728023705101)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualiza usuario que firma'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    update gf_g_saldos_favor_documento a',
'    set    a.id_usrio_frma = :F_ID_USRIO',
'    where  a.id_sldo_fvor_slctud = :P206_ID_SLDO_FVOR_SLCTUD;',
'    commit;',
'   ',
unistr('    apex_application.g_print_success_message := ''<span style="color:white">Proyecci\00F3n Aprobada. </span>'';'),
'    ',
'    exception',
'        when others then',
'            raise_application_error(-20001, ''Error actualizando usuario que aprueba: ''||sqlerrm);',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_APROBAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46853096382712703)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualiza los usuarios que reviso'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    update gf_g_saldos_favor_documento a',
'    set    a.id_usrio_rvso = null',
'           , a.id_usrio_frma = null',
'    where  a.id_sldo_fvor_slctud = :P206_ID_SLDO_FVOR_SLCTUD;',
'    ',
'    if :P206_ID_ACTO is not null then',
'        -- se borra el blob sin perder el id_acto',
'        delete from gd_g_documentos ',
'        where id_dcmnto = (',
'                            select id_dcmnto ',
'                            from gn_g_actos ',
'                            where id_acto = :P206_ID_ACTO',
'                           );  ',
'',
'        update gn_g_actos set id_dcmnto = null',
'        where id_acto = :P206_ID_ACTO ;   ',
'    end if;        ',
'    -----------------------------------------------------------',
'    ',
'    commit;',
unistr('    --apex_application.g_print_success_message := ''<span style="color:white">Proyecci\00F3n Rechazada! </span>'';'),
'    ',
'    exception',
'        when others then',
'            raise_application_error(-20001, ''Error actualizando usuario que rechaza: ''||sqlerrm);',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_RECHAZAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46634191146228801)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'Transitar'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(103498143126345602)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10755725369104967)
,p_process_sequence=>40
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
'                                                p_id_sldo_fvor_slctud     =>    :P206_ID_SLDO_FVOR_SLCTUD,',
'                                                p_id_fljo_trea            =>    :F_ID_FLJO_TREA,',
'                                                p_id_sldo_fvor_dcmnto     =>    :P206_ID_DOCUMENTO,',
'                                                o_id_acto                 =>     v_id_acto,',
'                                                o_cdgo_rspsta             =>     v_cdgo_rspsta,',
'                                                o_mnsje_rspsta            =>     v_mnsje_rspsta) ;',
'                                                ',
'    :P206_ID_ACTO := v_id_acto;',
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
,p_process_success_message=>unistr('Se gener\00F3 el acto correctamente.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(122585390010364303)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajaxAprobarSaldosAFavor'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta         number;',
'    v_mnsje_rspsta       varchar2(1000);',
'begin',
'',
'   pkg_gf_saldos_favor.prc_rg_saldos_favor_mvimiento(p_cdgo_clnte              =>     :F_CDGO_CLNTE,',
'                                                      p_id_sldo_fvor_slctud     =>     :P206_ID_SLDO_FVOR_SLCTUD,',
'                                                      p_id_usrio                =>     :F_ID_USRIO,   ',
'                                                      p_id_sldo_fvor_dcmnto     =>     :P206_ID_DOCUMENTO,',
'                                                      o_cdgo_rspsta             =>     v_cdgo_rspsta,',
'                                                      o_mnsje_rspsta            =>     v_mnsje_rspsta);',
'                                                      ',
'   if(v_cdgo_rspsta != 0)then',
'        rollback;',
'        --raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'                                       ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;                                                      ',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
