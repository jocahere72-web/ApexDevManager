prompt --application/pages/page_00287
begin
wwv_flow_api.create_page(
 p_id=>287
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Carga de Declaraciones Externas'
,p_step_title=>'Carga de Declaraciones Externas'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JAGUIRRE'
,p_last_upd_yyyymmddhh24miss=>'20220914105328'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(65327762693456184)
,p_plug_name=>unistr('Par\00E1metros')
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
 p_id=>wwv_flow_api.id(65329758142457691)
,p_plug_name=>'Declaraciones_Carga'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select  a.id_crga,',
'        a.id_dclrcnes_crga, ',
'        b.id_dclrcn_tpo,',
'		b.dscrpcion_dclrcion_tpo,',
'        b.vgncia, ',
'        b.dscrpcion_prdcdad,',
'        b.cdgo_frmlrio,',
'        b.dscrpcion_frmlrio,',
'        b.id_frmlrio,',
'        b.id_dclrcion_vgncia_frmlrio,        ',
'        c.nmbre_bnco,',
'        d.nmro_cnta',
'',
'from    v_gi_g_dclrcnes_vgncias_frmlr    b ',
'join    gi_g_dclrcnes_crga               a on a.id_dclrcion_vgncia_frmlrio = b.id_dclrcion_vgncia_frmlrio',
'join    df_c_bancos                      c on a.id_bnco = c.id_bnco',
'join    df_c_bancos_cuenta               d on a.id_bnco_cnta = d.id_bnco_cnta',
'where   b.cdgo_clnte = :F_CDGO_CLNTE',
'and     a.id_crga    = nvl(:P287_TPO_CRGA, a.id_crga);*/',
'select  a.id_crga,',
'        a.id_dclrcnes_crga, 		',
'        a.id_dclrcn_tpo,',
'		b.dscrpcion 		dscrpcion_dclrcion_tpo,		',
'        a.vgncia, ',
'        NULL dscrpcion_prdcdad, --f.dscrpcion dscrpcion_prdcdad,		',
'        c.cdgo_frmlrio,',
'        c.dscrpcion			dscrpcion_frmlrio,',
'        c.id_frmlrio,',
'        null id_dclrcion_vgncia_frmlrio,    		',
'        d.nmbre_bnco,',
'        e.nmro_cnta,',
'        a.dscrpcion',
'        ',
'from    gi_g_dclrcnes_crga               a --on a.id_dclrcion_vgncia_frmlrio = b.id_dclrcion_vgncia_frmlrio',
'join    gi_d_declaraciones_tipo          b on a.id_dclrcn_tpo = b.id_dclrcn_tpo',
'join	gi_d_formularios                 c on a.id_frmlrio = c.id_frmlrio',
'join    df_c_bancos                      d on a.id_bnco = d.id_bnco',
'join    df_c_bancos_cuenta               e on a.id_bnco_cnta = e.id_bnco_cnta',
'--join    df_s_periodicidad                f on a.cdgo_prdcdad = f.cdgo_prdcdad',
'where   a.cdgo_clnte = :F_CDGO_CLNTE',
'and     a.id_crga    = nvl(:P287_TPO_CRGA, a.id_crga);'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30165141628766236)
,p_name=>'ID_DCLRCN_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCN_TPO'
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
 p_id=>wwv_flow_api.id(30165365615766238)
,p_name=>'ID_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO'
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
 p_id=>wwv_flow_api.id(30165494320766239)
,p_name=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(30166022028766245)
,p_name=>'Parametrizar Detalle'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Parametrizar Detalle'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" ><span class="fa fa-plus"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:289:&SESSION.::&DEBUG.:RP:P289_ID_DLCRCION_CRGA,P289_ID_VGNCIA_FRMLRIO,P289_ET_CRGA,P289_ID_FRMLARIO:&ID_DCLRCNES_CRGA.,&ID_DCLRCION_VGNCIA_FRMLRIO.,&ID_CRGA.,&ID_FRMLRIO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35172689452725125)
,p_name=>'ID_DCLRCNES_CRGA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCNES_CRGA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35173384839725132)
,p_name=>'DSCRPCION_DCLRCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_DCLRCION_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Tipo Declaraci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(35173479174725133)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
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
 p_id=>wwv_flow_api.id(35173518260725134)
,p_name=>'DSCRPCION_PRDCDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_PRDCDAD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35173621405725135)
,p_name=>'CDGO_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_FRMLRIO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(35173716940725136)
,p_name=>'DSCRPCION_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_FRMLRIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Formulario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>500
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
 p_id=>wwv_flow_api.id(35173869874725137)
,p_name=>'NMBRE_BNCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_BNCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Banco'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(35173979196725138)
,p_name=>'NMRO_CNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Cuenta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(35239087095975620)
,p_name=>'ID_CRGA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CRGA'
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
 p_id=>wwv_flow_api.id(126350711501990907)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>400
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
 p_id=>wwv_flow_api.id(65329868356457692)
,p_internal_uid=>65329868356457692
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
 p_id=>wwv_flow_api.id(70305301240799333)
,p_interactive_grid_id=>wwv_flow_api.id(65329868356457692)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(70305427528799336)
,p_report_id=>wwv_flow_api.id(70305301240799333)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35222976469889152)
,p_view_id=>wwv_flow_api.id(70305427528799336)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(30165141628766236)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35223963183889156)
,p_view_id=>wwv_flow_api.id(70305427528799336)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(30165365615766238)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35224437142889158)
,p_view_id=>wwv_flow_api.id(70305427528799336)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(30165494320766239)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35227730079894785)
,p_view_id=>wwv_flow_api.id(70305427528799336)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(30166022028766245)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35284425950466005)
,p_view_id=>wwv_flow_api.id(70305427528799336)
,p_display_seq=>26
,p_column_id=>wwv_flow_api.id(35172689452725125)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35284975310466007)
,p_view_id=>wwv_flow_api.id(70305427528799336)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(35173384839725132)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>300
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35285486944466009)
,p_view_id=>wwv_flow_api.id(70305427528799336)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(35173479174725133)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35285981106466012)
,p_view_id=>wwv_flow_api.id(70305427528799336)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(35173518260725134)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35286449712466014)
,p_view_id=>wwv_flow_api.id(70305427528799336)
,p_display_seq=>30
,p_column_id=>wwv_flow_api.id(35173621405725135)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35286907139466016)
,p_view_id=>wwv_flow_api.id(70305427528799336)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(35173716940725136)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>280
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35291480319470374)
,p_view_id=>wwv_flow_api.id(70305427528799336)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(35173869874725137)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35291922547470377)
,p_view_id=>wwv_flow_api.id(70305427528799336)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(35173979196725138)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35348156991143958)
,p_view_id=>wwv_flow_api.id(70305427528799336)
,p_display_seq=>31
,p_column_id=>wwv_flow_api.id(35239087095975620)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(126542121441383378)
,p_view_id=>wwv_flow_api.id(70305427528799336)
,p_display_seq=>32
,p_column_id=>wwv_flow_api.id(126350711501990907)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(65331938792458767)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <b>',
'        <center>Opciones ',
'            <i class="fa fa-gears" aria-hidden="true"></i>',
'        </center>',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(65332326343461089)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <center>',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'        </b>',
'    </center>',
'</h5>',
'<p>',
'<b><i></i></b>Esta funcionalidad permite Parametrizar un proceso de carga del ETL, contando con las siguientes opciones:<br><br>',
'',
'<b><i>1.</i></b>Consultar los procesos de carga ya parametrizados.<br><br>',
'',
'<b><i>2.</i></b>Insertar nuevas parametrizaciones.',
'</p>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(30163498425766219)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(65331938792458767)
,p_button_name=>'btn_insrtar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:288:&SESSION.::&DEBUG.:RP::'
,p_button_condition=>'SELECT * FROM gi_g_dclrcnes_crga;'
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(35165835950689983)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(65327762693456184)
,p_button_name=>'Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column=>3
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35166211891689992)
,p_name=>'P287_FRMLRIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(65327762693456184)
,p_prompt=>'Formulario'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.vgncia||''-''||e.dscrpcion||''-''||e.dscrpcion_prdcdad||''-''||d.cdgo_frmlrio || '' - '' || d.dscrpcion,',
'        d.id_frmlrio',
'from    gi_d_declaraciones_tipo a',
'join    gi_d_dclrcnes_tpos_vgncias b on a.id_dclrcn_tpo=b.id_dclrcn_tpo',
'join    gi_d_dclrcnes_vgncias_frmlr c on b.id_dclrcion_tpo_vgncia = c.id_dclrcion_tpo_vgncia',
'join    gi_d_formularios d on c.id_frmlrio=d.id_frmlrio',
'join    v_df_i_periodos e on  b.id_prdo=e.id_prdo  ',
'where   a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and a.id_dclrcn_tpo=:P287_TPO_DCLRCION;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P287_TPO_DCLRCION'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'250'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35166676610690007)
,p_name=>'P287_TPO_DCLRCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(65327762693456184)
,p_prompt=>unistr('Tipo Declaraci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_dclrcn_tpo',
'from    gi_d_declaraciones_tipo a',
'where   a.cdgo_clnte        =   :F_CDGO_CLNTE',
'order by a.dscrpcion;',
'',
'',
''))
,p_lov_display_null=>'YES'
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'360'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35167044564690007)
,p_name=>'P287_TPO_CRGA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(65327762693456184)
,p_prompt=>'Tipo Carga'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_crga,',
'       id_crga',
'  from et_g_carga ',
'  where not id_crga in (',
'                          select id_crga ',
'                            from df_s_resolucion_carga',
'                      )',
' order by nmbre_crga'))
,p_lov_display_null=>'YES'
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
end;
/
