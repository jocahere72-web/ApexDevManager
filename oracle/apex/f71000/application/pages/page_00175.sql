prompt --application/pages/page_00175
begin
wwv_flow_api.create_page(
 p_id=>175
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Registro Revocatoria Acuerdo de Pago'
,p_step_title=>'Registro Revocatoria Acuerdo de Pago'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'apex.item(''BTN_NVA_RVCTRIA'').hide();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#candidatosRevocar_ig_report_settings{',
'    display : none',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(177374633629050691)
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20220323165559'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(106175270767209301)
,p_plug_name=>'<b>Candidatos a Revocar  - &P175_MTDO_RVCTRIA.</b>'
,p_region_name=>'candidatosRevocar'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.cdgo_clnte',
'        , a.cdgo_cnvnio_estdo',
'        , a.id_cnvnio',
'        , a.nmro_cnvnio',
'        , a.fcha_aplccion',
'        , a.id_cnvnio_tpo									',
'        , a.id_impsto',
'        , a.id_impsto_sbmpsto',
'       -- , nvl(a.idntfccion_sjto_frmtda, a.idntfccion_sjto) idntfccion_sjto_frmtda',
'        , ''''||a.idntfccion_sjto',
'        , a.nmbre_slctnte',
'        , a.dscrpcion_cnvnio_estdo',
'        , a.cdgo_cnvnio_rvctria_estdo',
'        , a.vlor_fncion',
'        , a.nmbre_impsto_sbmpsto',
'        , b.id_instncia_fljo_hjo',
'        , (select count(*) from v_gf_g_convenios_extracto where id_cnvnio = a.id_cnvnio and  actvo = ''S'' ) ttal_ctas',
'    from table (pkg_gf_convenios.fnc_co_vlor_mt_rvctria_cnvnio(p_cdgo_clnte       => :F_CDGO_CLNTE',
'                                                              , p_id_cnvnio_tpo    => :P175_ID_CNVNIO_TPO)) a ',
'     join gf_g_convenios                    b on a.id_cnvnio = b.id_cnvnio',
'    ------  left join v_convenios_vgncias_ftras    c on a.id_cnvnio = c.id_cnvnio',
'    where a.cdgo_clnte                      = :F_CDGO_CLNTE',
'      and a.id_impsto                       = :P175_ID_IMPSTO',
'       and (a.id_impsto_sbmpsto              = :P175_ID_IMPSTO_SBMPSTO   or :P175_ID_IMPSTO_SBMPSTO is null)  ',
'      and ((trunc(a.fcha_aplccion)          between :P175_FCHA_INCIO    and :P175_FCHA_FIN)',
'       or (trunc(a.fcha_aplccion)           >= :P175_FCHA_INCIO         and :P175_FCHA_FIN      is null) ',
'       or (trunc(a.fcha_aplccion)           <= :P175_FCHA_FIN           and :P175_FCHA_INCIO    is null)',
'       or (:P175_FCHA_INCIO                 is null and :P175_FCHA_FIN  is null )) ',
'      and a.id_cnvnio                       not in (select m.id_cnvnio ',
'                                                      from gf_g_convenios_revocatoria m',
'                                                     where not (a.cdgo_cnvnio_rvctria_estdo = ''ANL'' and a.anlcion_actva = ''N'')',
'                                                    )'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21184679515731101)
,p_name=>'''''||A.IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'''''||A.IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n Sujeto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
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
 p_id=>wwv_flow_api.id(21184813171731103)
,p_name=>'TTAL_CTAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TTAL_CTAS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total  <br> Cuotas'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
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
 p_id=>wwv_flow_api.id(50166281008213325)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(94856481119060701)
,p_name=>'ID_INSTNCIA_FLJO_HJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO_HJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(106984751649480602)
,p_name=>'ID_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNVNIO'
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
 p_id=>wwv_flow_api.id(106984822491480603)
,p_name=>'NMRO_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNVNIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>unistr('N\00B0 Acuerdo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:283:&SESSION.::&DEBUG.:RP,283:P283_BRANCH,P283_ID_CNVNIO,P283_ID_INSTNCIA_FLJO:&APP_PAGE_ID.,&ID_CNVNIO.,&ID_INSTNCIA_FLJO_HJO.'
,p_link_text=>'&NMRO_CNVNIO.'
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
 p_id=>wwv_flow_api.id(106985249213480607)
,p_name=>'NMBRE_SLCTNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SLCTNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Solicitante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>404
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
 p_id=>wwv_flow_api.id(106985341102480608)
,p_name=>'DSCRPCION_CNVNIO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNVNIO_ESTDO'
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
 p_id=>wwv_flow_api.id(106985639690480611)
,p_name=>'FCHA_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_APLCCION'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Fecha Aplicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_format_mask=>'DD/MM/YYYY'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_api.id(107203871212985001)
,p_name=>'Ver Acuerdo'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_01=>'<span class="fa fa-pencil"></span>'
,p_link_target=>'f?p=&APP_ID.:185:&SESSION.::&DEBUG.:RP,185:P185_ID_CNVNIO:&ID_CNVNIO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(112732938262497401)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(112733099442497402)
,p_name=>'CDGO_CNVNIO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNVNIO_ESTDO'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(112733107466497403)
,p_name=>'ID_CNVNIO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNVNIO_TPO'
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
 p_id=>wwv_flow_api.id(112733254849497404)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
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
 p_id=>wwv_flow_api.id(112733348261497405)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(112733548096497407)
,p_name=>'CDGO_CNVNIO_RVCTRIA_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNVNIO_RVCTRIA_ESTDO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(112733718920497409)
,p_name=>'VLOR_FNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_FNCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 Cuotas / Oficios')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(119357248885894524)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub - Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(106984655196480601)
,p_internal_uid=>106984655196480601
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(106990536515481499)
,p_interactive_grid_id=>wwv_flow_api.id(106984655196480601)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(106990612765481499)
,p_report_id=>wwv_flow_api.id(106990536515481499)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46521126076099)
,p_view_id=>wwv_flow_api.id(106990612765481499)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(21184813171731103)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>75.04499999999999
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21190570085731846)
,p_view_id=>wwv_flow_api.id(106990612765481499)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(21184679515731101)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>188
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94862412918063879)
,p_view_id=>wwv_flow_api.id(106990612765481499)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(94856481119060701)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106991173710481502)
,p_view_id=>wwv_flow_api.id(106990612765481499)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(106984751649480602)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106991680217481506)
,p_view_id=>wwv_flow_api.id(106990612765481499)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(106984822491480603)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106993628470481512)
,p_view_id=>wwv_flow_api.id(106990612765481499)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(106985249213480607)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>335
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106994149475481513)
,p_view_id=>wwv_flow_api.id(106990612765481499)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(106985341102480608)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>81
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106997729476495642)
,p_view_id=>wwv_flow_api.id(106990612765481499)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(106985639690480611)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(107209559807991744)
,p_view_id=>wwv_flow_api.id(106990612765481499)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(107203871212985001)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(112738812650497646)
,p_view_id=>wwv_flow_api.id(106990612765481499)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(112732938262497401)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(112739333900497649)
,p_view_id=>wwv_flow_api.id(106990612765481499)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(112733099442497402)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(112739897983497651)
,p_view_id=>wwv_flow_api.id(106990612765481499)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(112733107466497403)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(112740336708497655)
,p_view_id=>wwv_flow_api.id(106990612765481499)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(112733254849497404)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(112740861232497656)
,p_view_id=>wwv_flow_api.id(106990612765481499)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(112733348261497405)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(112741839761497659)
,p_view_id=>wwv_flow_api.id(106990612765481499)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(112733548096497407)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(112742890019497661)
,p_view_id=>wwv_flow_api.id(106990612765481499)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(112733718920497409)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>147
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119465930173147504)
,p_view_id=>wwv_flow_api.id(106990612765481499)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(119357248885894524)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>120
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(111063201256216477)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(202104012893372152)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
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
 p_id=>wwv_flow_api.id(248179439505081546)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'Esta Funcionalidad Permite<br><br>',
unistr('    <b>1.</b> Consultar los candidatos a revocar acuerdo(s) de pago, a trav\00E9s de los par\00E1metros de b\00FAsqueda seleccionados por el funcionario e iniciar proceso de revocatoria de acuerdos de pago.<br><br>'),
unistr('    <b>2.</b> Registrar revocatoria de acuerdo(s) de pago seg\00FAn el tipo de acuerdo de pago seleccionado.<br><br>'),
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(107084471941782396)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(202104012893372152)
,p_button_name=>'BTN_NVA_RVCTRIA'
,p_button_static_id=>'BTN_NVA_RVCTRIA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva Revocatoria'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:184:&SESSION.::&DEBUG.:RP,184::'
,p_icon_css_classes=>'fa fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(106198832660285800)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(111063201256216477)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(107158408180545301)
,p_branch_name=>unistr('Ir a P\00E1gina 184')
,p_branch_action=>'f?p=&APP_ID.:184:&SESSION.::&DEBUG.:RP,184::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(107084471941782396)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(55404404728472903)
,p_branch_action=>'f?p=&APP_ID.:175:&SESSION.::&DEBUG.:RP,175:P175_ID_IMPSTO,P175_ID_IMPSTO_SBMPSTO,P175_ID_CNVNIO_TPO:&P175_ID_IMPSTO.,&P175_ID_IMPSTO_SBMPSTO.,&P175_ID_CNVNIO_TPO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49285509470088301)
,p_name=>'P175_MTDO_RVCTRIA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(111063201256216477)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49285605020088302)
,p_name=>'P175_VLOR'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(111063201256216477)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55404691700472905)
,p_name=>'P175_ID_CNVNIO_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(111063201256216477)
,p_prompt=>'<b>Tipo de Acuerdo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       ID_CNVNIO_TPO as r',
'  from gf_d_convenios_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_colspan=>5
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106199298801285806)
,p_name=>'P175_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(111063201256216477)
,p_prompt=>'<b>Tributo:</b>'
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
,p_lov_null_text=>'Seleccione'
,p_colspan=>5
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el tributo asociado a los acuerdos de pago candidatos a revocar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106200196417285810)
,p_name=>'P175_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(111063201256216477)
,p_prompt=>'<b>Sub-Tributo:</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d',
'     , id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto  = :P175_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_lov_cascade_parent_items=>'P175_ID_IMPSTO'
,p_ajax_items_to_submit=>'P175_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_column=>6
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione el sub tributo asociado a los acuerdos de pago candidatos a revocar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106201098858285810)
,p_name=>'P175_FCHA_INCIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(111063201256216477)
,p_prompt=>unistr('<b>Fecha Inicial <br>Aplicaci\00F3n</b>')
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>6
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_help_text=>unistr('Ingrese fecha m\00EDnima del rango, correspondiente  a la aplicaci\00F3n de la solicitud de acuerdo de pago.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106201942668285810)
,p_name=>'P175_FCHA_FIN'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(111063201256216477)
,p_prompt=>unistr('<b>Fecha Final <br> Aplicaci\00F3n</b>')
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_help_text=>unistr('Ingrese fecha m\00E1xima del rango, correspondiente  a la aplicaci\00F3n de la solicitud de acuerdo de pago.')
,p_attribute_02=>'&P175_FCHA_INCIO.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106986498960480619)
,p_name=>'P175_ID_CNVNIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(106175270767209301)
,p_prompt=>'Id Cnvnio'
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
 p_id=>wwv_flow_api.id(109183754514082101)
,p_name=>'P175_CDGO_RVCTRIA_TPO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(111063201256216477)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110612665068117301)
,p_name=>'P175_ID_RVCTRIA_MTDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(111063201256216477)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(106986524247480620)
,p_validation_name=>'Convenios Seleccionados'
,p_validation_sequence=>10
,p_validation=>'P175_ID_CNVNIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('\00A1Seleccione Acuerdo(s) de Pago!')
,p_validation_condition=>'BTN_NVA_RVCTRIA'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(106986498960480619)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(106986240135480617)
,p_name=>'Al Seleccionar un Registro'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(106175270767209301)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(106986387816480618)
,p_event_id=>wwv_flow_api.id(106986240135480617)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var records = this.data.selectedRecords, model = this.data.model; ',
'if(records.length > 0){',
'    var json = records.map((record)=>{',
'        return {''ID_CNVNIO'': model.getValue(record, ''ID_CNVNIO'')};',
'    })',
'    $s(''P175_ID_CNVNIO'',JSON.stringify(json));',
'    apex.item(''BTN_NVA_RVCTRIA'').show();',
'}else{',
'    $s(''P175_ID_CNVNIO'','''');',
'    apex.item(''BTN_NVA_RVCTRIA'').hide();',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50165562572213318)
,p_event_id=>wwv_flow_api.id(106986240135480617)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P175_ID_CNVNIO'
,p_attribute_03=>'P175_ID_CNVNIO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(107172352443634004)
,p_name=>'Cerrar Modal'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50166028455213323)
,p_event_id=>wwv_flow_api.id(107172352443634004)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var id  = $(this.browserEvent.target).attr(''id'');',
'var inc =  id.includes(''apex_dialog'');',
'if(inc){',
'    apex.region(''candidatosRevocar'').refresh();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(107350157079906201)
,p_name=>'Refrescar al Seleccionar Acuerdo'
,p_event_sequence=>40
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(106175270767209301)
,p_triggering_element=>'APEX$ROW_SELECTOR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(107350286359906202)
,p_event_id=>wwv_flow_api.id(107350157079906201)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50165616887213319)
,p_name=>unistr('Al Cerrar Modal con Bot\00F3n nueva Revocatoria')
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(107084471941782396)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50165773451213320)
,p_event_id=>wwv_flow_api.id(50165616887213319)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(106175270767209301)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(55404774500472906)
,p_name=>unistr('al hacer clic en el bot\00F3n consultar')
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(106198832660285800)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(55404891472472907)
,p_event_id=>wwv_flow_api.id(55404774500472906)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(!$v(''P175_ID_CNVNIO_TPO'')){',
'    apex.message.clearErrors();',
'    apex.message.showErrors([',
'        {',
'            type:       "error",',
'            location:   [ "page", "inline" ],',
'            pageItem:   "P175_ID_CNVNIO_TPO",',
unistr('            message:    $(''#P175_ID_CNVNIO_TPO_LABEL'').text().replace(''(Valor Necesario)'', '''') + "debe tener alg\00FAn valor.",'),
'            unsafe:     false',
'        }',
'    ]);',
'}else{',
'    apex.page.submit(''BTN_CONSULTAR'');',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(106219219357374204)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Recuperar Datos Definiciones de Revocatoria'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select decode(m.cdgo_rvctria_tpo ,''CTA'', m.nmro_ctas, m.nmro_ofcios_emtdo_rvocar) vlor',
'              , initcap(m.dscrpcion)',
'              , m.cdgo_rvctria_tpo',
'              , m.id_rvctria_mtdo',
'       into :P175_VLOR, :P175_MTDO_RVCTRIA, :P175_CDGO_RVCTRIA_TPO, :P175_ID_RVCTRIA_MTDO       ',
'       from v_gf_d_revocatoria_metodo m',
'       join gf_d_convenios_tipo t on  t.id_rvctria_mtdo = m.id_rvctria_mtdo',
'       where t.cdgo_clnte = :F_CDGO_CLNTE',
'       and t.id_cnvnio_tpo = :P175_ID_CNVNIO_TPO;    ',
'exception',
'    when no_data_found then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55404321883472902)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Nuevo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select decode(m.cdgo_rvctria_tpo ,''CTA'', m.nmro_ctas, m.nmro_ofcios_emtdo_rvocar) vlor',
'              , initcap(m.dscrpcion)',
'              , m.cdgo_rvctria_tpo',
'              , m.id_rvctria_mtdo',
'       into :P175_VLOR, :P175_MTDO_RVCTRIA, :P175_CDGO_RVCTRIA_TPO, :P175_ID_RVCTRIA_MTDO       ',
'       from v_gf_d_revocatoria_metodo m',
'       join gf_d_convenios_tipo t on  t.id_rvctria_mtdo = m.id_rvctria_mtdo',
'       where t.cdgo_clnte = :F_CDGO_CLNTE',
'       and t.id_cnvnio_tpo = :P175_ID_CNVNIO_TPO;    ',
'exception',
'    when no_data_found then',
'        :P175_VLOR := NULL ;',
'        :P175_MTDO_RVCTRIA := NULL;',
'        :P175_CDGO_RVCTRIA_TPO := NULL;',
'        :P175_ID_RVCTRIA_MTDO := NULL;   ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
