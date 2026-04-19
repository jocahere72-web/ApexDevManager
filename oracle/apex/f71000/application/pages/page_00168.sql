prompt --application/pages/page_00168
begin
wwv_flow_api.create_page(
 p_id=>168
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Prescripci\00F3n Iniciar Prescripci\00F3n Masiva')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Iniciar Prescripci\00F3n Masiva')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function validar_sel() {',
'    var region = apex.region("P168_GRID_RGLAS_NGCIO");',
'    if (region) {',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records_ = view.view$.grid("getSelectedRecords");//todos los seleccionados',
'        var records = model._data; //todos los datos de la grilla',
'        //REALIZAMOS UN FILTRO DE TODOS LOS DATOS SELECCIONADOS DEL INTERACTIVE GRID QUE NO ESTEN PROCESADOS',
'        records = records.filter(function (record) {',
'            return model.getValue(record, "INDCDOR_EDTA_RGLA").v === ''N''',
'        });',
'        ',
'        records_.filter(function (record) {',
'            return model.getValue(record, "INDCDOR_EDTA_RGLA").v !== ''N''',
'        }).forEach(function (f){',
'            records.push(f);',
'        });',
'        ',
'        ',
'        var json  = records.map(function (m) {',
'           return model.getValue(m, "ID_RGLA_NGCIO_CLNTE_FNCION").trim();',
'        });',
'         $s("P168_RGLAS_NGCIO", json.length > 0 ? json : '''');',
'        //SELECCIONAMOS LOS ITEM NO PROCESADOS EN EL INTERACTIVE GRID ',
'        //console.log(records);',
'        region.widget().interactiveGrid("setSelectedRecords", records);',
'        return;',
'    }',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#168_DTLLES_PRSCRPCION .t-TabsRegion-items{',
'    min-height: 100px !important;',
'}',
'#P168_GRID_RGLAS_NGCIO_ig_report_settings {',
'    display: none !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20191113133030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(101801454109379901)
,p_plug_name=>'Reglas de Negocio'
,p_region_name=>'P168_GRID_RGLAS_NGCIO'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.id_rgla_ngcio_clnte',
'           ,b.id_impsto',
'           ,e.nmbre_impsto',
'           ,b.id_impsto_sbmpsto ',
'           ,e.nmbre_impsto_sbmpsto',
'           ,c.nmbre nmbre_rgla_ngcio',
'           ,b.indcdor_edta_rgla',
'           ,a.id_rgla_ngcio_clnte_fncion',
'           ,d.dscrpcion',
'from        gn_d_rglas_ngcio_clnte_fnc      a',
'inner join  gn_d_reglas_negocio_cliente     b   on  b.id_rgla_ngcio_clnte   =   a.id_rgla_ngcio_clnte',
'inner join  gn_d_reglas_negocio             c   on  c.id_rgla_ngcio         =   b.id_rgla_ngcio',
'inner join  gn_d_funciones                  d   on  d.id_fncion             =   a.id_fncion',
'inner join  v_df_i_impuestos_subimpuesto    e   on  e.id_impsto             =   b.id_impsto',
'                                                and e.id_impsto_sbmpsto     =   b.id_impsto_sbmpsto',
'where       b.cdgo_clnte    =       :F_CDGO_CLNTE',
'and         c.id_prcso      =       12',
'and         a.actvo         =       ''S''',
'and         sysdate         between b.fcha_incio and b.fcha_fin',
'and         exists(select   1',
'                   from     gf_g_prscrpcns_sjt_impst_lt f',
'                   where    f.id_prscrpcion_lte =   :P168_ID_PRSCRPCION_LTE',
'                   and      f.cdgo_clnte        =   b.cdgo_clnte',
'                   and      f.id_impsto         =   b.id_impsto',
'                   and      f.id_impsto_sbmpsto =   b.id_impsto_sbmpsto',
'            )     ',
'order by    a.id_rgla_ngcio_clnte, b.indcdor_edta_rgla;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(101801612812379903)
,p_name=>'ID_RGLA_NGCIO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RGLA_NGCIO_CLNTE'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(101801747355379904)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(101801887879379905)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(101801911496379906)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
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
 p_id=>wwv_flow_api.id(101802061720379907)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub-Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(101802103781379908)
,p_name=>'NMBRE_RGLA_NGCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RGLA_NGCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Regla de Negocio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(101802280874379909)
,p_name=>'INDCDOR_EDTA_RGLA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_EDTA_RGLA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Editable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(177372678491050686)
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(101802305837379910)
,p_name=>'ID_RGLA_NGCIO_CLNTE_FNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RGLA_NGCIO_CLNTE_FNCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(101802411215379911)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Funci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
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
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(101802670260379913)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(101801565412379902)
,p_internal_uid=>101801565412379902
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
' config.initialSelection = false;',
' return config;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(101807015308384553)
,p_interactive_grid_id=>wwv_flow_api.id(101801565412379902)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(101807141619384553)
,p_report_id=>wwv_flow_api.id(101807015308384553)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101807601762384557)
,p_view_id=>wwv_flow_api.id(101807141619384553)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(101801612812379903)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101808120776384560)
,p_view_id=>wwv_flow_api.id(101807141619384553)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(101801747355379904)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101808660516384562)
,p_view_id=>wwv_flow_api.id(101807141619384553)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(101801887879379905)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101809181931384563)
,p_view_id=>wwv_flow_api.id(101807141619384553)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(101801911496379906)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101809650231384565)
,p_view_id=>wwv_flow_api.id(101807141619384553)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(101802061720379907)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101810179219384566)
,p_view_id=>wwv_flow_api.id(101807141619384553)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(101802103781379908)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
,p_break_order=>10
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101810660793384567)
,p_view_id=>wwv_flow_api.id(101807141619384553)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(101802280874379909)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101811179872384569)
,p_view_id=>wwv_flow_api.id(101807141619384553)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(101802305837379910)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101811666460384570)
,p_view_id=>wwv_flow_api.id(101807141619384553)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(101802411215379911)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(101724508970782905)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(101801454109379901)
,p_button_name=>'BTN_CNCLAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(101724425757782904)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(101801454109379901)
,p_button_name=>'BTN_INCIAR_PRS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Iniciar Prescripci\00F3n')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-play'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(107917308581785701)
,p_branch_name=>unistr('Borrar cach\00E9 del lote')
,p_branch_action=>'f?p=&APP_ID.:157:&SESSION.::&DEBUG.:RP,157::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(101724425757782904)
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101724282202782902)
,p_name=>'P168_ID_PRSCRPCION_LTE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(101801454109379901)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101724339838782903)
,p_name=>'P168_FLUJOS'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(101801454109379901)
,p_prompt=>'Flujos'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.dscrpcion_fljo r,',
'            a.id_fljo v',
'from        v_wf_d_flujos a',
'join        wf_d_flujos_usuarios b  on  b.id_fljo   =   a.id_fljo',
'where       a.cdgo_clnte    =   :F_CDGO_CLNTE',
'and         a.id_prcso      =   12',
'and         b.id_usrio      =   :F_ID_USRIO',
'and         b.actvo         =   ''S''',
'order by    a.dscrpcion_fljo;'))
,p_colspan=>12
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'70%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101824495512497005)
,p_name=>'P168_RGLAS_NGCIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(101801454109379901)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109220924119444201)
,p_name=>'P168_RSPSTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(101801454109379901)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(101824034809497001)
,p_name=>'Al seleccionar regla'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(101801454109379901)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101824134612497002)
,p_event_id=>wwv_flow_api.id(101824034809497001)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(101824230953497003)
,p_name=>'Al cambiar modo'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(101801454109379901)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridreportchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101824319403497004)
,p_event_id=>wwv_flow_api.id(101824230953497003)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(114955756947976905)
,p_name=>'Al hacer clic BTN_INCIAR_PRS'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(101724425757782904)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(114955836339976906)
,p_event_id=>wwv_flow_api.id(114955756947976905)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function fnc_procesarLote(){   ',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        await apex.server.process ( "ajax_procesarLote", {',
'            pageItems: "#P168_FLUJOS, #P168_ID_PRSCRPCION_LTE, #P168_RGLAS_NGCIO"',
'        }, {',
'            success: function( pData ){',
'                if (pData.o_cdgo_rspsta != 0){',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors ([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    pData.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                }else{',
'                    //apex.message.showPageSuccess(pData.o_mnsje_rspsta);',
'                    if (pData.o_mnsje_rspsta){',
'                        sessionStorage.setItem("v_msgInciarPrscpcion",pData.o_mnsje_rspsta);                        ',
'                    }',
'                    window.location.href = pData.url;',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'};',
'',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de iniciar prescripci\00F3n para el lote de selecci\00F3n?", function( okPressed ) {'),
'        if( okPressed ) {',
'            fnc_procesarLote();',
'        }',
'    });'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(101802779344379914)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(101801454109379901)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Reglas de Negocio: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(101824748334497008)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Procesar lote de selecci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(1000);',
'    v_xml          clob;',
'begin',
'    v_xml :=        ''<CDGO_CLNTE>''           ||:F_CDGO_CLNTE          ||''</CDGO_CLNTE>'';',
'    v_xml := v_xml||''<ID_FLJO>''              ||:P168_FLUJOS           ||''</ID_FLJO>'';',
'    v_xml := v_xml||''<ID_USRIO>''             ||:F_ID_USRIO            ||''</ID_USRIO>'';',
'    v_xml := v_xml||''<ID_PRSCRPCION_LTE>''    ||:P168_ID_PRSCRPCION_LTE||''</ID_PRSCRPCION_LTE>'';',
'    v_xml := v_xml||''<ID_RGL_NGCO_CLNT_FNCN>''||:P168_RGLAS_NGCIO      ||''</ID_RGL_NGCO_CLNT_FNCN>'';',
'    pkg_gf_prescripcion.prc_rg_prscrpcn_pblcion_msva  (p_xml								=>    v_xml,',
'                                                        o_cdgo_rspsta						=>    v_cdgo_rspsta,',
'                                                        o_mnsje_rspsta						=>    v_mnsje_rspsta',
'                                                       );     ',
'	if v_cdgo_rspsta <> 0 then',
'        RAISE_APPLICATION_ERROR (-20000,v_mnsje_rspsta);',
'	end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(101724425757782904)
,p_process_when_type=>'NEVER'
,p_process_success_message=>unistr('Acci\00F3n procesada con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(101724634417782906)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar cuadro de dialogo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(101724508970782905)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(115182446673198602)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_procesarLote'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_xml                 clob;',
'    v_id_prscrpcion       number;',
'    v_id_instncia_fljo    number;',
'    v_url                 varchar2(1000);',
'    v_cdgo_rspsta         number := 0;',
'    v_mnsje_rspsta        varchar2(4000);',
'    v_mnsje_gnral         varchar2(4000);',
'begin',
'    v_xml :=        ''<CDGO_CLNTE>''           ||:F_CDGO_CLNTE          ||''</CDGO_CLNTE>'';',
'    v_xml := v_xml||''<ID_FLJO>''              ||:P168_FLUJOS           ||''</ID_FLJO>'';',
'    v_xml := v_xml||''<ID_USRIO>''             ||:F_ID_USRIO            ||''</ID_USRIO>'';',
'    v_xml := v_xml||''<ID_PRSCRPCION_LTE>''    ||:P168_ID_PRSCRPCION_LTE||''</ID_PRSCRPCION_LTE>'';',
'    v_xml := v_xml||''<ID_RGL_NGCO_CLNT_FNCN>''||:P168_RGLAS_NGCIO      ||''</ID_RGL_NGCO_CLNT_FNCN>'';',
'    pkg_gf_prescripcion.prc_rg_prscrpcn_pblcion_msva  ( p_xml				=>    v_xml,',
'                                                        o_id_prscrpcion     =>    v_id_prscrpcion,',
'                                                        o_id_instncia_fljo  =>    v_id_instncia_fljo,',
'                                                        o_url               =>    v_url,',
'                                                        o_cdgo_rspsta		=>    v_cdgo_rspsta,',
'                                                        o_mnsje_rspsta		=>    v_mnsje_rspsta',
'                                                       );',
'    v_mnsje_gnral := v_mnsje_rspsta;',
'    if (v_cdgo_rspsta <> 0) then',
'        update      gf_g_prescripciones_lte     a',
'        set         a.prcsdo            	=   ''N''',
'        where       a.id_prscrpcion_lte 	=   :P168_ID_PRSCRPCION_LTE;',
'        commit;',
'        if (v_id_prscrpcion is not null) then',
'            pkg_gf_prescripcion.prc_el_prescripcion (p_cdgo_clnte			=>    :F_CDGO_CLNTE,',
'                                                     p_id_prscrpcion		=>    v_id_prscrpcion,',
'                                                     p_id_instncia_fljo     =>    v_id_instncia_fljo,',
'                                                     o_cdgo_rspsta          =>    v_cdgo_rspsta,',
'                                                     o_mnsje_rspsta		    =>    v_mnsje_rspsta',
'                                                    );',
'            if (v_cdgo_rspsta <> 0) then',
'                v_mnsje_gnral := v_mnsje_gnral || chr(10) ||',
unistr('                ''Al haber problemas en el registro de la prescripci\00F3n se intenta reversar el proceso, lo que genera:'' || chr(10) || v_mnsje_rspsta;'),
'            else',
'                v_mnsje_gnral := v_mnsje_gnral || chr(10) ||',
unistr('                ''Proceso reversado con \00E9xito.'';'),
'            end if;',
'        end if;',
'    else',
'        if (v_id_prscrpcion is null) then',
unistr('            v_mnsje_gnral := ''Acci\00F3n procesada con \00E9xito, pero, la poblaci\00F3n en el lote no cumpli\00F3 con las reglas dadas, por este motivo no se instanci\00F3 un flujo de prescripci\00F3n.'';'),
'        end if;',
'    end if;',
'	owa_util.mime_header(''application/json'', false);',
'    htp.p(''cache-control: no-cache'');',
'    htp.p(''pragma: no-cache''); ',
'    owa_util.http_header_close;',
'    if (v_url is not null) then',
'        v_url := apex_util.prepare_url(''f?p=''|| v(''APP_ID'') || '':110:''|| v(''APP_SESSION'') || v_url);',
'    else',
'        v_url := apex_util.prepare_url(''f?p=''|| v(''APP_ID'') || '':157:''|| v(''APP_SESSION'') || '':msgInciarPrscpcion:NO:157::'');',
'    end if;',
'    htp.p(''{"url":"'' || v_url || ''"'' || ',
'          '',"o_cdgo_rspsta" :'' ||v_cdgo_rspsta ||',
'          '',"o_mnsje_rspsta":"''||v_mnsje_gnral ||''"}'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
