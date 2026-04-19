prompt --application/pages/page_00018
begin
wwv_flow_api.create_page(
 p_id=>18
,p_user_interface_id=>wwv_flow_api.id(30413944355578333)
,p_name=>'Notificaciones'
,p_step_title=>'Notificaciones'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id){',
'    if($(''#''+id).attr(''aria-expanded'') == ''true''){',
'        $(''#''+id).click();',
'    }',
'}',
'',
'buttonCollapse(''t_Button_rightControlButton'');'))
,p_step_template=>wwv_flow_api.id(30309424961578275)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20220930143428'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37519979949944621)
,p_plug_name=>'Notificaciones'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding:t-Form--large:margin-top-sm:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(30338884622578288)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select  id_ntfccion "Id Notificaci\00F3n",'),
'        id_acto,',
'        nmro_acto "No. Acto",',
'        fcha_acto "Fecha Acto",',
'        case indcdor_ntfcdo',
'            when ''S'' then ''Si''',
'            when ''N'' then ''No''',
'        end "Notificado?",',
'        cdgo_estdo,',
'        ''<span style="border-radius: 50px;line-height: 14px;font-size: 11px;color: white;font-style: normal;font-weight: bold;padding: 7px 15px;background-color:''||',
'        clor_estdo||''; white-space: nowrap;">''',
'        ||''<span class="fa ''||case cdgo_estdo when ''NGN'' then ''fa-clock-o'' when ''NPR'' then ''fa-check'' when ''NEP'' then ''fa-gear fa-anim-spin    '' end||''" aria-hidden="true" style="margin-right: 5px;"></span>''||acto_descrpcion||''</span>'' acto_estado,',
'        cdgo_acto_orgen,',
'        dscrpcion_acto_orgen "Origen del Acto",',
'        id_acto_tpo,',
'        initcap(dscrpcion_acto_tpo) "Tipo de Acto",',
'        acto_descrpcion "Estado",',
'        fcha_ntfccion',
'from v_nt_g_notificaciones',
'where cdgo_clnte         = :F_CDGO_CLNTE                              and',
'      nmro_acto          = nvl(:P18_NMRO_ACTO, nmro_acto)             and',
'      cdgo_acto_orgen    = nvl(:P18_CDGO_ACTO_ORGEN, cdgo_acto_orgen) and',
'      cdgo_estdo         = nvl(:P18_CDGO_ESTDO, cdgo_estdo)           and',
'      indcdor_ntfcdo     = nvl(:P18_INDCDOR_NTFCDO, indcdor_ntfcdo)   and',
'      id_acto_tpo        = nvl(:P18_ID_ACTO_TPO, id_acto_tpo)         and',
'      nmro_acto          = nvl(:P18_NMRO_ACTO, nmro_acto)             and',
'      (trunc(fcha_acto)          = :P18_FCHA_ACTO or  :P18_FCHA_ACTO is null)           and',
'      ((:P18_IDNTFCCION is not null and id_acto in (select id_acto ',
'                                                    from v_nt_g_ntfccnes_rspnsble',
'                                                    where nmro_idntfccion = :P18_IDNTFCCION)) or',
'      (:P18_IDNTFCCION is null)) and',
'      ((:P18_IDNTFCCION_SJTO is not null and id_acto in (select id_acto',
'                                                        from v_gn_g_actos_sujeto_impuesto',
'                                                        where idntfccion_sjto = :P18_IDNTFCCION_SJTO))or',
'       (:P18_IDNTFCCION_SJTO is null))'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(16412501213495818)
,p_name=>'FCHA_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_NTFCCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha de Notificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(49149101266148908)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(49149464516148911)
,p_name=>'CDGO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(49149569752148912)
,p_name=>'ACTO_ESTADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTO_ESTADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(49149652720148913)
,p_name=>'CDGO_ACTO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ACTO_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(49150145461148918)
,p_name=>unistr('Id Notificaci\00F3n')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('Id Notificaci\00F3n')
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(49150217004148919)
,p_name=>'No. Acto'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'No. Acto'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'No. Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(49150379293148920)
,p_name=>'Notificado?'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Notificado?'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFNotificado?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>2
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
 p_id=>wwv_flow_api.id(49150410105148921)
,p_name=>'Origen del Acto'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Origen del Acto'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Origen Del Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(49150542229148922)
,p_name=>'Tipo de Acto'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Tipo de Acto'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo De Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(49150643633148923)
,p_name=>'Estado'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Estado'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>20
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
 p_id=>wwv_flow_api.id(49151071444148927)
,p_name=>unistr('Ver_Intentos_de_Notificaci\00F3n')
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver          <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>unistr('f?p=&APP_ID.:19:&SESSION.::&DEBUG.:RP,19:P19_ID_NTFCCION:&"Id Notificaci\00F3n".')
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(81341862518214304)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
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
 p_id=>wwv_flow_api.id(129806252138160901)
,p_name=>'Fecha Acto'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Fecha Acto'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(49148988290148906)
,p_internal_uid=>49148988290148906
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
 p_id=>wwv_flow_api.id(49330809142098096)
,p_interactive_grid_id=>wwv_flow_api.id(49148988290148906)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(49330973871098097)
,p_report_id=>wwv_flow_api.id(49330809142098096)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7253563024382)
,p_view_id=>wwv_flow_api.id(49330973871098097)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(129806252138160901)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>237.20000000000005
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9402813038321)
,p_view_id=>wwv_flow_api.id(49330973871098097)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(49151071444148927)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>65
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18797503054545057)
,p_view_id=>wwv_flow_api.id(49330973871098097)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(16412501213495818)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49331907482098101)
,p_view_id=>wwv_flow_api.id(49330973871098097)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(49149101266148908)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49333416458098105)
,p_view_id=>wwv_flow_api.id(49330973871098097)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(49149464516148911)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49333959039098106)
,p_view_id=>wwv_flow_api.id(49330973871098097)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(49149569752148912)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49334496682098107)
,p_view_id=>wwv_flow_api.id(49330973871098097)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(49149652720148913)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49341597714108354)
,p_view_id=>wwv_flow_api.id(49330973871098097)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(49150145461148918)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49342082992108356)
,p_view_id=>wwv_flow_api.id(49330973871098097)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(49150217004148919)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>196
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49342529293108357)
,p_view_id=>wwv_flow_api.id(49330973871098097)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(49150379293148920)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49343099463108358)
,p_view_id=>wwv_flow_api.id(49330973871098097)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(49150410105148921)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>357
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49343575570108359)
,p_view_id=>wwv_flow_api.id(49330973871098097)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(49150542229148922)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>233
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49348145109112595)
,p_view_id=>wwv_flow_api.id(49330973871098097)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(49150643633148923)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(81367772377346537)
,p_view_id=>wwv_flow_api.id(49330973871098097)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(81341862518214304)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86763156077895098)
,p_plug_name=>'<h4><center>Ayuda </center></h4>'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
unistr('<i>Funcionalidad que permite la consulta de los estados de notificaci\00F3n, los intentos de notificaci\00F3n y la evidencia asociada a cada responsable.'),
'    <br/>',
'    <br/>',
'    <p>',
unistr('        Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario'),
'    </p>',
'',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86793857971715129)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30328831919578284)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(28544783282110405)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(86793857971715129)
,p_button_name=>'BTN_NUEVA_CONSULTA'
,p_button_static_id=>'btn'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_image_alt=>'Nueva Consulta'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(48309438781148295)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(86793857971715129)
,p_button_name=>'BTN_CONSULTAR'
,p_button_static_id=>'btn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42367259516150409)
,p_name=>'P18_IDNTFCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(86793857971715129)
,p_prompt=>unistr('Identificaci\00F3n Responsable')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48311066720148298)
,p_name=>'P18_ID_ACTO_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(86793857971715129)
,p_prompt=>'Tipo de Acto'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_ACTO_TIPOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_acto_tpo||'' - ''||dscrpcion d , id_acto_tpo r ',
'from gn_d_actos_tipo',
'where cdgo_clnte = :F_CDGO_CLNTE and',
'      indcdor_ntfccion = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48315114596233822)
,p_name=>'P18_CDGO_ESTDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(86793857971715129)
,p_prompt=>unistr('Estado de Notificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION,CDGO_ESTDO       ',
'from NT_D_ESTADO'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99610407345982212)
,p_name=>'P18_IDNTFCCION_SJTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(86793857971715129)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99610508202982213)
,p_name=>'P18_INDCDOR_NTFCDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(86793857971715129)
,p_prompt=>unistr('\00BFIndicador de Notificaci\00F3n?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99610696391982214)
,p_name=>'P18_NMRO_ACTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(86793857971715129)
,p_prompt=>'No. del Acto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129806341954160902)
,p_name=>'P18_FCHA_ACTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(86793857971715129)
,p_prompt=>'Fecha'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29112098047792301)
,p_name=>'Al hacer click'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(28544783282110405)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29112164464792302)
,p_event_id=>wwv_flow_api.id(29112098047792301)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P18_ID_ACTO_TPO,P18_NMRO_ACTO,P18_CDGO_ESTDO,P18_INDCDOR_NTFCDO,P18_IDNTFCCION,P18_IDNTFCCION_SJTO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29112418696792305)
,p_event_id=>wwv_flow_api.id(29112098047792301)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P18_ID_ACTO_TPO,P18_NMRO_ACTO,P18_CDGO_ESTDO,P18_INDCDOR_NTFCDO,P18_IDNTFCCION,P18_IDNTFCCION_SJTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29112550611792306)
,p_event_id=>wwv_flow_api.id(29112098047792301)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(37519979949944621)
,p_stop_execution_on_error=>'Y'
);
end;
/
