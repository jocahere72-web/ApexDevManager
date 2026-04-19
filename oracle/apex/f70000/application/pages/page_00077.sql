prompt --application/pages/page_00077
begin
wwv_flow_api.create_page(
 p_id=>77
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Declaraciones Fechas de Presentaci\00F3n')
,p_step_title=>unistr('Declaraciones Fechas de Presentaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JGONZALEZ'
,p_last_upd_yyyymmddhh24miss=>'20230105094105'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18563660301436335)
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
 p_id=>wwv_flow_api.id(18563798601436336)
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
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i>',
'    </b>',
'</h5>',
unistr('<i>Funcionalidad que permite gestionar las fechas de presentaci\00F3n asociadas a un tipo de declaraci\00F3n.'),
'<br>',
'<ol>',
unistr('    <li>Seleccionar el tipo de declaraci\00F3n</li>'),
'    <li>Seleccionar la vigencia</li>',
'    <li>Seleccionar el periodo</li>',
'</ol>',
'',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.  </i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18563855501436337)
,p_plug_name=>unistr('Opciones de B\00FAsqueda')
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
 p_id=>wwv_flow_api.id(18564937672436348)
,p_plug_name=>unistr('Fechas de Presentaci\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_dclrcion_fcha_prsntcion,',
'        a.id_dclrcion_tpo_vgncia,',
'        a.dscrpcion,',
'        a.cdgo_tpo_fcha_prsntcion,',
'        a.fcha_incial,',
'        a.fcha_fnal,',
'        a.id_sjto_tpo,',
'        a.vlor,',
'        a.actvo',
'from    gi_d_dclrcnes_fcha_prsntcn  a',
'where   a.id_dclrcion_tpo_vgncia    =   :P77_ID_DCLRCION_TPO_VGNCIA;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18565187161436350)
,p_name=>'ID_DCLRCION_FCHA_PRSNTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION_FCHA_PRSNTCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18677696943427101)
,p_name=>'ID_DCLRCION_TPO_VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION_TPO_VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P77_ID_DCLRCION_TPO_VGNCIA'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18677707447427102)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(18677877124427103)
,p_name=>'FCHA_INCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_INCIAL'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(18677987797427104)
,p_name=>'FCHA_FNAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_FNAL'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Final'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(18678082667427105)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Valor'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18678105368427106)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFActivo?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(18681015036427135)
,p_name=>'Editar'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Editar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:78:&SESSION.::&DEBUG.:RP,78:P78_ID_DCLRCION_FCHA_PRSNTCION,P78_ID_DCLRCN_TPO:&ID_DCLRCION_FCHA_PRSNTCION.,&P77_ID_DCLRCN_TPO.'
,p_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50785273452565901)
,p_name=>'ID_SJTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tipo Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.nmbre_sjto_tpo,',
'            a.id_sjto_tpo',
'from        df_i_sujetos_tipo           a',
'inner join  gi_d_declaraciones_tipo     b   on  b.id_impsto     =   a.id_impsto',
'inner join  gi_d_dclrcnes_tpos_vgncias  c   on  c.id_dclrcn_tpo =   b.id_dclrcn_tpo',
'where       c.id_dclrcion_tpo_vgncia    =   :ID_DCLRCION_TPO_VGNCIA;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'ID_DCLRCION_TPO_VGNCIA'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76579224416946910)
,p_name=>'CDGO_TPO_FCHA_PRSNTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TPO_FCHA_PRSNTCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Limite Presentaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.cdgo_tpo_fcha_prsntcion',
'from    gi_d_dclrcns_tps_fch_prstcn a;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(18565071095436349)
,p_internal_uid=>18565071095436349
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
 p_id=>wwv_flow_api.id(18683236876428586)
,p_interactive_grid_id=>wwv_flow_api.id(18565071095436349)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(18683329016428586)
,p_report_id=>wwv_flow_api.id(18683236876428586)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18683851589428589)
,p_view_id=>wwv_flow_api.id(18683329016428586)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(18565187161436350)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18684340347428594)
,p_view_id=>wwv_flow_api.id(18683329016428586)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(18677696943427101)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18684874988428595)
,p_view_id=>wwv_flow_api.id(18683329016428586)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(18677707447427102)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18685390637428597)
,p_view_id=>wwv_flow_api.id(18683329016428586)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(18677877124427103)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18685893773428598)
,p_view_id=>wwv_flow_api.id(18683329016428586)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(18677987797427104)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18686339388428600)
,p_view_id=>wwv_flow_api.id(18683329016428586)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(18678082667427105)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18686825104428601)
,p_view_id=>wwv_flow_api.id(18683329016428586)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(18678105368427106)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18727975586828039)
,p_view_id=>wwv_flow_api.id(18683329016428586)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(18681015036427135)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50791289387566176)
,p_view_id=>wwv_flow_api.id(18683329016428586)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(50785273452565901)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76612584499234673)
,p_view_id=>wwv_flow_api.id(18683329016428586)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(76579224416946910)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18678849722427113)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(18563660301436335)
,p_button_name=>'BTN_Nueva_Presentacion'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nueva Presentaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:78:&SESSION.::&DEBUG.:RP,78:P78_ID_DCLRCION_TPO_VGNCIA,P78_ID_DCLRCN_TPO:&P77_ID_DCLRCION_TPO_VGNCIA.,&P77_ID_DCLRCN_TPO.'
,p_button_condition=>'P77_ID_DCLRCION_TPO_VGNCIA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16412831738495821)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(18563660301436335)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.:RP,69::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18564608889436345)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(18563855501436337)
,p_button_name=>'BTN_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(16412915991495822)
,p_branch_action=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.:RP,69::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(16412831738495821)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18564228208436341)
,p_name=>'P77_ID_DCLRCN_TPO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(18563855501436337)
,p_prompt=>unistr('Tipo de Declaraci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_dclrcn_tpo',
'from    gi_d_declaraciones_tipo a',
'where   a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and     a.id_impsto         =   nvl(:P77_ID_IMPSTO, a.id_impsto)',
'and     a.id_impsto_sbmpsto =   nvl(:P77_ID_IMPSTO_SBMPSTO, a.id_impsto_sbmpsto)',
'and     a.cdgo_prdcdad      =   nvl(:P77_CDGO_PRDCDAD, a.cdgo_prdcdad)',
'and     a.actvo = ''S''',
'or      a.cdgo_dclrcn_tpo = ''RTS''',
'order by a.dscrpcion;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tributo a consultar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18564317886436342)
,p_name=>'P77_ID_DCLRCION_TPO_VGNCIA'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(18563855501436337)
,p_prompt=>'Periodo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.prdo || '' '' || b.dscrpcion,',
'            a.id_dclrcion_tpo_vgncia',
'from        gi_d_dclrcnes_tpos_vgncias  a',
'inner join  df_i_periodos               b   on  b.id_prdo   =   a.id_prdo',
'where       a.id_dclrcn_tpo =   :P77_ID_DCLRCN_TPO',
'and         a.vgncia        =   :P77_VGNCIA',
'order by    a.vgncia desc, b.prdo, b.dscrpcion;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P77_VGNCIA'
,p_ajax_items_to_submit=>'P77_ID_DCLRCION_TPO_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el periodo que desea consultar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18564555643436344)
,p_name=>'P77_VGNCIA'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(18563855501436337)
,p_prompt=>'Vigencia'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.vgncia text,',
'        a.vgncia value',
'from    df_s_vigencias  a',
'where   exists(select       1',
'               from         gi_d_declaraciones_tipo     b',
'               inner join   gi_d_dclrcnes_tpos_vgncias  c   on  c.id_dclrcn_tpo =   b.id_dclrcn_tpo',
'               where        b.id_dclrcn_tpo =   :P77_ID_DCLRCN_TPO',
'               and          c.vgncia        =   a.vgncia',
'              )',
'order by a.vgncia desc;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P77_ID_DCLRCN_TPO'
,p_ajax_items_to_submit=>'P77_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista la vigencia a consultar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18680640978427131)
,p_name=>'Btn Cerrar ventana'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(18678849722427113)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18680755361427132)
,p_event_id=>wwv_flow_api.id(18680640978427131)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(18564937672436348)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18680858939427133)
,p_name=>'CI Cerrar ventana'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(18564937672436348)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18680971859427134)
,p_event_id=>wwv_flow_api.id(18680858939427133)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(18564937672436348)
,p_stop_execution_on_error=>'Y'
);
end;
/
