prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(323679016569283847)
,p_name=>'Flujos'
,p_step_title=>'Flujos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function iniciar_flujo(id_instancia){',
'    apex.server.process("IniciarFlujo", {',
'        f01: id_instancia',
'    }, {',
'        success: function (data) { ',
'                if (data.type === ''OK'') {',
'                    window.localStorage.clear();',
'                    window.location.href = data.url;',
'                }else{',
'                    apex.message.showErrors({',
'                        type: apex.message.TYPE.ERROR,',
'                        location: ["page"],',
'                        message: data.msg,',
'                        unsafe: false',
'                    });',
'                }',
'            },',
'            error: function () {',
'                console.log(arguments);',
'            }',
'        }); ',
'}'))
,p_step_template=>wwv_flow_api.id(39266481085898285)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'MCARO'
,p_last_upd_yyyymmddhh24miss=>'20200115132342'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32498096691534306)
,p_plug_name=>'ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(39299295614898312)
,p_plug_display_sequence=>20
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
'</h5>',
'Esta Funcionalidad permite crear instancias de los flujos de procesos, para llevar a cabo sus respectivas tareas.',
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32498405072534310)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(39299295614898312)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33390941826846301)
,p_plug_name=>'Instancias del flujo'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(39299295614898312)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33125592088992001)
,p_plug_name=>'Instancias Flujos'
,p_parent_plug_id=>wwv_flow_api.id(33390941826846301)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(39298132994898311)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.nmbre_trcro,',
'       a.fcha_incio,',
'       a.estdo_instncia,',
'       a.id_fljo,',
'       a.id_instncia_fljo,',
'       b.dscrpcion_fljo,',
'       a.obsrvcion',
'  from wf_g_instancias_flujo a',
'  join wf_d_flujos b',
'    on b.id_fljo = a.id_fljo',
'  join wf_d_flujos_usuarios c',
'    on c.id_fljo  = b.id_fljo',
'   and c.id_usrio = :F_ID_USRIO',
'  join v_sg_g_usuarios d',
'    on c.id_usrio = d.id_usrio  ',
' where b.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_usrio = :F_ID_USRIO ',
'   and a.id_fljo = nvl(:P12_ID_FLJO, a.id_fljo)',
'   and (nvl(:P12_ESTDO_INSTNCIA, ''0'') = ''0'' or a.estdo_instncia = :P12_ESTDO_INSTNCIA)'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(33129132794992037)
,p_name=>'NMBRE_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TRCRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Usuario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>403
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(33129213943992038)
,p_name=>'FCHA_INCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_INCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Inicio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(33129356768992039)
,p_name=>'ESTDO_INSTNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTDO_INSTNCIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado Instancia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(33129470403992040)
,p_name=>'ID_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO'
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
 p_id=>wwv_flow_api.id(33129506946992041)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Instancia del flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(33129991849992045)
,p_name=>'Opciones'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button onclick="iniciar_flujo(&ID_INSTNCIA_FLJO.)" style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Ir a flujo',
'    <span class="fa fa-external-link-square"></span>',
'</button>'))
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(33540033333641902)
,p_name=>'DSCRPCION_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_FLJO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(112828563932963002)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(33126911640992015)
,p_internal_uid=>33126911640992015
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
 p_id=>wwv_flow_api.id(33161289400198743)
,p_interactive_grid_id=>wwv_flow_api.id(33126911640992015)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(33161386945198743)
,p_report_id=>wwv_flow_api.id(33161289400198743)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1363727014185)
,p_view_id=>wwv_flow_api.id(33161386945198743)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(33129991849992045)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33222393555100922)
,p_view_id=>wwv_flow_api.id(33161386945198743)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(33129132794992037)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>61
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33222820804100924)
,p_view_id=>wwv_flow_api.id(33161386945198743)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(33129213943992038)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>162
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33223373346100926)
,p_view_id=>wwv_flow_api.id(33161386945198743)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(33129356768992039)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33223819781100927)
,p_view_id=>wwv_flow_api.id(33161386945198743)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(33129470403992040)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33224390814100928)
,p_view_id=>wwv_flow_api.id(33161386945198743)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(33129506946992041)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33548169373674639)
,p_view_id=>wwv_flow_api.id(33161386945198743)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(33540033333641902)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>129
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(112834776544975929)
,p_view_id=>wwv_flow_api.id(33161386945198743)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(112828563932963002)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>223
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(60463967204713247)
,p_interactive_grid_id=>wwv_flow_api.id(33126911640992015)
,p_name=>'De hoy'
,p_type=>'ALTERNATIVE'
,p_default_view=>'GRID'
,p_authorization_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(60464064749713247)
,p_report_id=>wwv_flow_api.id(60463967204713247)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27304041531528689)
,p_view_id=>wwv_flow_api.id(60464064749713247)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(33129991849992045)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(60525071359615426)
,p_view_id=>wwv_flow_api.id(60464064749713247)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(33129132794992037)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>61
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(60525498608615428)
,p_view_id=>wwv_flow_api.id(60464064749713247)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(33129213943992038)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>162
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(60526051150615430)
,p_view_id=>wwv_flow_api.id(60464064749713247)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(33129356768992039)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(60526497585615431)
,p_view_id=>wwv_flow_api.id(60464064749713247)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(33129470403992040)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(60527068618615432)
,p_view_id=>wwv_flow_api.id(60464064749713247)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(33129506946992041)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(60850847178189143)
,p_view_id=>wwv_flow_api.id(60464064749713247)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(33540033333641902)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>129
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(140137454349490433)
,p_view_id=>wwv_flow_api.id(60464064749713247)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(112828563932963002)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>223
);
wwv_flow_api.create_ig_report_filter(
 p_id=>wwv_flow_api.id(27302720405514509)
,p_report_id=>wwv_flow_api.id(60463967204713247)
,p_type=>'COLUMN'
,p_column_id=>wwv_flow_api.id(33129213943992038)
,p_operator=>'LAST'
,p_is_case_sensitive=>false
,p_expression=>'1~D'
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33472066796056006)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(39288192398898308)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(32498599304534311)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(32498405072534310)
,p_button_name=>'BTN_INSTNCR_FLJO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(39351872500898344)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Instanciar Flujo'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP,17::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(33539926260641901)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(33472066796056006)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_api.id(39351872500898344)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="margin-top:-8px"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33472152905056007)
,p_name=>'P12_ID_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(33472066796056006)
,p_prompt=>'Flujo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion_fljo r,',
'       a.id_fljo v ',
'  from v_wf_d_flujos a',
'  join wf_d_flujos_usuarios b',
'    on b.id_fljo = a.id_fljo',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and b.id_usrio = :F_ID_USRIO;'))
,p_lov_display_null=>'YES'
,p_colspan=>5
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(39351056969898342)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'99%'
,p_attribute_13=>'theme:''flat'''
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(115761693760498301)
,p_name=>'P12_ESTDO_INSTNCIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(33472066796056006)
,p_prompt=>'Estado:'
,p_source=>'INICIADA'
,p_source_type=>'STATIC'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>'STATIC:Seleccione...;0,INICIADA;INICIADA,FINALIZADA;FINALIZADA'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_column=>6
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(39351056969898342)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'99%'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(35090603248315301)
,p_name=>'cuando cancele el dialogo'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(32498599304534311)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35090742030315302)
,p_event_id=>wwv_flow_api.id(35090603248315301)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(33125592088992001)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(33271024536325302)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IniciarFlujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_instncia_fljo number := apex_application.g_f01(1);',
'    v_id_fljo_trea number;',
'    v_url varchar2(4000);',
'    ',
'begin',
'    ',
'    apex_util.set_session_state(''F_BRANCH_PAGE'', :APP_PAGE_ID );',
'    apex_util.set_session_state(''F_BRANCH_APP'', :APP_ID );',
'    begin',
'        apex_json.initialize_output( p_http_cache => false );',
'        owa_util.mime_header(''application/json'', false);',
'        htp.p(''cache-control: no-cache'');',
'        htp.p(''pragma: no-cache'');',
'        owa_util.http_header_close;',
'        apex_json.open_object();  ',
'    ',
'    begin',
'    ',
'        select a.id_fljo_trea_orgen ',
'          into v_id_fljo_trea',
'          from wf_g_instancias_transicion a',
'         where a.id_instncia_fljo = v_id_instncia_fljo',
'           and a.id_estdo_trnscion in (1,2);',
'           ',
'    exception when no_data_found then',
'              ',
'              begin                   ',
'                  select distinct first_value(id_fljo_trea_orgen) over(order by id_instncia_trnscion desc) ',
'                    into v_id_fljo_trea',
'                    from wf_g_instancias_transicion ',
'                   where id_instncia_fljo = v_id_instncia_fljo;',
'                   ',
'              exception when no_data_found  then',
'                        v_id_fljo_trea := null;',
'              end;',
'    end;',
'    ',
'        if nvl(v_id_fljo_trea, -1) > 0 then',
'            apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo );',
'            apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea ); ',
'            ',
'            v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => v_id_instncia_fljo,',
'                                                          p_id_fljo_trea     => v_id_fljo_trea,',
'                                                          p_clear_session    => ''S'');',
'        ',
'            apex_json.write(''type'', ''OK'');',
'            apex_json.write(''msg'', ''Url generada exitosamente'');',
'            apex_json.write(''url'', v_url);',
'        ',
'        else',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'', ''No existe tarea destino'');',
'        ',
'        end if;',
'        apex_json.close_object();',
'    ',
'    exception when others then ',
'      apex_json.open_object();',
'      apex_json.write(''type'', ''OK'');',
'      apex_json.write(''msg'',apex_escape.html(sqlerrm));',
'      apex_json.close_object();',
'  end;',
'  ',
'  apex_json.close_all();',
'  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
