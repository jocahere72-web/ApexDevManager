prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(72999165452094574)
,p_name=>unistr('Autorizaci\00F3n')
,p_step_title=>unistr('Autorizaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//Seleccion de documentos a generar',
'/*function obtenerSeleccion(){',
'   var region = apex.region("P12_GRID_ACTOS");',
'   var v_seleccionados  = [];',
'   if (region) {',
'       var view = region.widget().interactiveGrid("getViews", "grid");',
'       var model = view.model;  ',
'       var records = view.view$.grid("getSelectedRecords");',
'       if($.isEmptyObject(records) == false){',
'           for(let i=0; i<records.length; i++){',
'			   v_seleccionados.push(model.getValue(records[i], "ID_RCRSO_DCMNTO").trim());',
'           }',
'		   $s("P12_ID_RCRSO_DCMNTO",v_seleccionados);',
'       }',
'       else{',
'          $s("P12_ID_RCRSO_DCMNTO",null);  ',
'       }',
'   } ',
'}*/',
'',
'',
'function obtenerSeleccion(){',
'   var region = apex.region("P12_GRID_ACTOS");',
'   var v_seleccionados  = [];',
'   if (region) {',
'       var view = apex.region("P12_GRID_ACTOS").widget().interactiveGrid("getViews", "grid");',
'       var model = view.model;  ',
'       var records = view.view$.grid("getSelectedRecords");',
'       if($.isEmptyObject(records) == false){',
'             //$s("P12_ID_RCRSO_DCMNTO_COUNT",records.length);',
'           for(let i=0; i<records.length; i++){',
'			   v_seleccionados.push(model.getValue(records[i], "ID_RCRSO_DCMNTO").trim());',
'           }',
'		   $s("P12_ID_RCRSO_DCMNTO",v_seleccionados);',
'       }',
'       else{',
'          $s("P12_ID_RCRSO_DCMNTO",null);  ',
'       }',
'   console.log (''Documentos seleccionados: ''+records.length);',
'   $s("P12_ID_RCRSO_DCMNTO_COUNT",records.length);',
'   } ',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer {',
'    display: none !important;',
'}'))
,p_step_template=>wwv_flow_api.id(72894757230094465)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20241105024358'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(425214361636862069)
,p_plug_name=>unistr('Duraci\00F3n Etapa')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(548604567910632820)
,p_plug_name=>'Recurso'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
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
 p_id=>wwv_flow_api.id(549968062811875231)
,p_plug_name=>'Acto Seleccionado'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(557965639457920082)
,p_plug_name=>unistr('Generaci\00F3n de Actos')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(72932069932094503)
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>6
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from wf_g_instancias_transicion a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO and',
'      a.id_fljo_trea_orgen = :F_ID_FLJO_TREA and',
'      a.id_estdo_trnscion in (1,2)'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(72013287732496001)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(557965639457920082)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from wf_g_instancias_transicion a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO and',
'      a.id_fljo_trea_orgen = :F_ID_FLJO_TREA and',
'      a.id_estdo_trnscion in (1,2)'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(557965107898920077)
,p_plug_name=>'Documentos'
,p_region_name=>'P12_GRID_ACTOS'
,p_parent_plug_id=>wwv_flow_api.id(72013287732496001)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.id_rcrso',
'           ,b.id_fljo_trea',
'           ,b.id_acto_tpo',
'           ,b.id_rcrso_dcmnto',
'           ,d.dscrpcion     dscrpcion_acto_tpo',
'from        gj_g_recursos               a',
'inner join  gj_g_recursos_documento     b   on  b.id_rcrso      =   a.id_rcrso',
'/*left  join  gn_d_actos_tipo_tarea       c   on  c.id_fljo_trea  =   b.id_fljo_trea',
'                                            and c.id_acto_tpo   =   b.id_acto_tpo*/',
'inner join  gn_d_actos_tipo             d   on  d.id_acto_tpo   =   b.id_acto_tpo',
'where       /*c.cdgo_clnte            =       :F_CDGO_CLNTE',
'and         */a.id_instncia_fljo_hjo  =       :F_ID_INSTNCIA_FLJO',
'and         b.id_acto               is      null;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95023506693383803)
,p_name=>'DSCRPCION_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Documento'
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95023999714383807)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95088463140581501)
,p_name=>'ID_RCRSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RCRSO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(95088501115581502)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
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
 p_id=>wwv_flow_api.id(95088679040581503)
,p_name=>'BTN_DCMNTOS'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:RP,16:P16_ID_ACTO_TPO,P16_PGNA_ORGN,P16_INDC_LECTURA,P16_ID_RCRSO_DCMNTO:&ID_ACTO_TPO.,&APP_PAGE_ID.,S,&ID_RCRSO_DCMNTO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95088789686581504)
,p_name=>'ID_RCRSO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RCRSO_DCMNTO'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95110766829685001)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(95023303957383801)
,p_internal_uid=>95023303957383801
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
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
 p_id=>wwv_flow_api.id(95029210956384405)
,p_interactive_grid_id=>wwv_flow_api.id(95023303957383801)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(95029336196384405)
,p_report_id=>wwv_flow_api.id(95029210956384405)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(36509884111112)
,p_view_id=>wwv_flow_api.id(95029336196384405)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(95088463140581501)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37015902111116)
,p_view_id=>wwv_flow_api.id(95029336196384405)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(95088501115581502)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95030349267384411)
,p_view_id=>wwv_flow_api.id(95029336196384405)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(95023506693383803)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>397
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95098957053599164)
,p_view_id=>wwv_flow_api.id(95029336196384405)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(95088679040581503)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>78
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95116762788685727)
,p_view_id=>wwv_flow_api.id(95029336196384405)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(95110766829685001)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95127563025725023)
,p_view_id=>wwv_flow_api.id(95029336196384405)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(95088789686581504)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(97189433553024004)
,p_plug_name=>'Respuesta/Acciones'
,p_parent_plug_id=>wwv_flow_api.id(557965639457920082)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(218518776464983178)
,p_plug_name=>'Acciones'
,p_parent_plug_id=>wwv_flow_api.id(97189433553024004)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_rcrso_accion, a.id_rcrso_tpo_accion, d.dscrpcion',
'from gj_g_recursos_accion a',
'inner join gj_g_recursos b on a.id_rcrso = b.id_rcrso',
'inner join gj_d_recursos_tipo_accion c on a.id_rcrso_tpo_accion = c.id_rcrso_tpo_accion',
'inner join gj_d_acciones d on c.id_accion = d.id_accion',
'where b.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.*',
'from gj_g_recursos a',
'inner join gj_d_recursos_respuesta b on a.cdgo_rspta = b.cdgo_rspta',
'join gj_d_recursos_tipo_cliente c on a.id_rcrso_tipo_clnte = c.id_rcrso_tipo_clnte--nuevo 19/10/2023',
'where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO and',
'      b.indcdor_rgstra_accion = ''S''',
'and c.cdgo_rcrso_tpo <> ''RPS''--nuevo 19/10/2023',
';'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(218518918246983180)
,p_name=>'ID_RCRSO_ACCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RCRSO_ACCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(218519079645983181)
,p_name=>'ID_RCRSO_TPO_ACCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RCRSO_TPO_ACCION'
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
 p_id=>wwv_flow_api.id(218519172205983182)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Acci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(218519292337983184)
,p_name=>'BTN_VIGENCIAS'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:RP,26:P26_ID_RCRSO_ACCION,P26_INDC_LECTURA:&ID_RCRSO_ACCION.,S'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(218518857199983179)
,p_internal_uid=>218518857199983179
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
 p_id=>wwv_flow_api.id(218535498730071912)
,p_interactive_grid_id=>wwv_flow_api.id(218518857199983179)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(218535602962071912)
,p_report_id=>wwv_flow_api.id(218535498730071912)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(218536094777071913)
,p_view_id=>wwv_flow_api.id(218535602962071912)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(218518918246983180)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(218536657807071915)
,p_view_id=>wwv_flow_api.id(218535602962071912)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(218519079645983181)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(218537117519071916)
,p_view_id=>wwv_flow_api.id(218535602962071912)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(218519172205983182)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(218556800101129479)
,p_view_id=>wwv_flow_api.id(218535602962071912)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(218519292337983184)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>93
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(642169184820181961)
,p_plug_name=>'Observaciones'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from wf_g_instancias_transicion a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO and',
'      a.id_fljo_trea_orgen = :F_ID_FLJO_TREA and',
'      a.id_estdo_trnscion in (1,2)'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71254721248036002)
,p_plug_name=>'Observaciones'
,p_parent_plug_id=>wwv_flow_api.id(642169184820181961)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.obsrvcion,c.nmbre_trea, b.nmbre_trcro,a.fcha ,a.id_rcrso_dtlle',
'from gj_g_recursos_detalle a',
'join v_sg_g_usuarios b  on  a.id_usrio = b.id_usrio',
'join v_wf_d_flujos_tarea c on a.id_fljo_trea = c.id_fljo_trea',
'where a.id_rcrso = :P12_ID_RCRSO',
'order by a.fcha desc;'))
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
 p_id=>wwv_flow_api.id(71254890896036003)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_detail_link=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:RP:P39_ID_RCRSO_DTLLE:#ID_RCRSO_DTLLE#'
,p_detail_link_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div align="center"><img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt=""></div>',
'',
''))
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>71254890896036003
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71254914520036004)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71255121024036006)
,p_db_column_name=>'NMBRE_TREA'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Etapa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71255045532036005)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71255250542036007)
,p_db_column_name=>'ID_RCRSO_DTLLE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Id Rcrso Dtlle'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71281871710249101)
,p_db_column_name=>'FCHA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(71261284768045426)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'712613'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'OBSRVCION:NMBRE_TREA:NMBRE_TRCRO:FCHA:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(659427827598200038)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
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
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from wf_g_instancias_transicion a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO and',
'      a.id_fljo_trea_orgen = :F_ID_FLJO_TREA and',
'      a.id_estdo_trnscion in (1,2)'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(705412298040562406)
,p_plug_name=>'Solicitud'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(72932069932094503)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(722767795691720825)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(705412298040562406)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(787580236104072020)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(722767795691720825)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.id_dcmnto',
'     , d.id_slctud',
'     , d.file_name ',
'     , d.obsrvcion',
'     , md.dscrpcion_dcmnto',
'     , d.fcha',
'     , case when d.actvo = ''S'' then',
'         ''<span style="color:green;"aria-hidden="true" class="fa fa-check-square"></span>''',
'         else',
'         ''<span style="color:red;"class="fa fa-times-square" aria-hidden="true"></span>''',
'         end actvo',
'  from pq_g_documentos d',
'  join v_pq_d_motivos_documento md',
'    on d.id_mtvo_dcmnto = md.id_mtvo_dcmnto',
'    where id_slctud = :P12_ID_SLCTUD '))
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
 p_id=>wwv_flow_api.id(714818477254191525)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>714818477254191525
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94978631348065394)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94979048735065396)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94979445940065397)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'<p></p>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94979868631065397)
,p_db_column_name=>'ID_SLCTUD'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Id Slctud'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94980289286065397)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94980665606065397)
,p_db_column_name=>'ACTVO'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>unistr('\00BFActivo?')
,p_column_html_expression=>'#ACTVO#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94981027446065398)
,p_db_column_name=>'FCHA'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Fecha Subida'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(714831944540197792)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'949814'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:OBSRVCION:FCHA:FILE_NAME:ACTVO:ID_DCMNTO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(787570653030068513)
,p_plug_name=>'Datos del Gestor'
,p_parent_plug_id=>wwv_flow_api.id(705412298040562406)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(787575535119070115)
,p_plug_name=>'Datos del Solicitante'
,p_parent_plug_id=>wwv_flow_api.id(705412298040562406)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(787818894425393093)
,p_plug_name=>'Datos Solicitud'
,p_parent_plug_id=>wwv_flow_api.id(705412298040562406)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1053612739534956741)
,p_plug_name=>'Etapas'
,p_parent_plug_id=>wwv_flow_api.id(705412298040562406)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      c.id_rcrso',
'           ,b.id_fljo_trea',
'           ,b.nmbre_trea',
'           ,a.fcha_incio fcha',
'           ,a.fcha_fin_real fcha_fin',
'           ,case',
'               when a.id_estdo_trnscion in (1, 2) then',
unistr('                   ''S\00ED'''),
'               when a.id_estdo_trnscion in (3, 4) then',
'                   ''No''',
'               else',
'                   ''Invalido''',
'           end actvo',
'from        wf_g_instancias_transicion      a',
'inner join  v_wf_d_flujos_tarea             b   on  b.id_fljo_trea          =   a.id_fljo_trea_orgen',
'left  join  gj_g_recursos                   c   on  c.id_instncia_fljo_hjo  =   a.id_instncia_fljo',
'where       b.cdgo_clnte                        =       :F_CDGO_CLNTE',
'--and         c.id_instncia_fljo_gnrdo_rsl_acl    =     :F_ID_INSTNCIA_FLJO',
'and         a.id_instncia_fljo                  =       :F_ID_INSTNCIA_FLJO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(816778922056238786)
,p_name=>'ID_RCRSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RCRSO'
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
 p_id=>wwv_flow_api.id(816779017202238787)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
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
 p_id=>wwv_flow_api.id(816779167294238788)
,p_name=>'NMBRE_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Etapa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(816779223904238789)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Inicio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(816779387479238790)
,p_name=>'FCHA_FIN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_FIN'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Final'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(816779566498238792)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFActivo?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>8
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
 p_id=>wwv_flow_api.id(816802382976361988)
,p_name=>'BTN_OBSRVCNES'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Observaciones'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP,17:P17_ID_FLJO_TREA,P17_ID_RCRSO:&ID_FLJO_TREA.,&ID_RCRSO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(816802406942361989)
,p_name=>'BTN_DCMNTOS_GNRDOS'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Documentos Generados'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:RP,19:P19_ID_FLJO_TREA,P19_ID_RCRSO:&ID_FLJO_TREA.,&ID_RCRSO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(816778693604238784)
,p_internal_uid=>816778693604238784
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
 p_id=>wwv_flow_api.id(816784662811239273)
,p_interactive_grid_id=>wwv_flow_api.id(816778693604238784)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(816784704075239274)
,p_report_id=>wwv_flow_api.id(816784662811239273)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(816785749218239284)
,p_view_id=>wwv_flow_api.id(816784704075239274)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(816778922056238786)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(816786207571239286)
,p_view_id=>wwv_flow_api.id(816784704075239274)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(816779017202238787)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(816786781057239287)
,p_view_id=>wwv_flow_api.id(816784704075239274)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(816779167294238788)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(816787171038239288)
,p_view_id=>wwv_flow_api.id(816784704075239274)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(816779223904238789)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(816787590930239290)
,p_view_id=>wwv_flow_api.id(816784704075239274)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(816779387479238790)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(816788603427239293)
,p_view_id=>wwv_flow_api.id(816784704075239274)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(816779566498238792)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(816827116440652514)
,p_view_id=>wwv_flow_api.id(816784704075239274)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(816802382976361988)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(816829780559672975)
,p_view_id=>wwv_flow_api.id(816784704075239274)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(816802406942361989)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(49127000004)
,p_view_id=>wwv_flow_api.id(816784704075239274)
,p_execution_seq=>5
,p_name=>'Etapa Seleccionada'
,p_background_color=>'#0472CE'
,p_text_color=>'#FFFFFF'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(816779566498238792)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>unistr('S\00ED')
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(931878183350059186)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
unistr('<i>Funcionalidad que permite confirmar la proyecci\00F3n del recurso.'),
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94982128324065401)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(659427827598200038)
,p_button_name=>'BTN_AUTRZAR_PRYCCION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Autorizar Proyecci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(97538154882784401)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(659427827598200038)
,p_button_name=>'BTN_RCHZAR_PRYCCION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_image_alt=>unistr('Rechazar Proyecci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(97230268424078038)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(642169184820181961)
,p_button_name=>'BTN_RGSTRA_OBSRVACION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('A\00F1adir Observaci\00F3n')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:RP,39:P39_ID_FLJO_TREA,P39_ID_RCRSO,P39_ID_USRIO:&F_ID_FLJO_TREA.,&P12_ID_RCRSO.,&F_ID_USRIO.'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(95244268978283101)
,p_branch_name=>'Actualizar Pagina'
,p_branch_action=>'f?p=72000:12:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(94982128324065401)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72013382335496002)
,p_name=>'P12_ID_RCRSO_DCMNTO_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(72013287732496001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72013400732496003)
,p_name=>'P12_APRBCION_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(72013287732496001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72013556194496004)
,p_name=>'P12_ID_ACTO_RR_1'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(72013287732496001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72013672078496005)
,p_name=>'P12_ID_ACTO_TPO_RR_1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(72013287732496001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72013744921496006)
,p_name=>'P12_FCHA_ACTO_RR_1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(72013287732496001)
,p_format_mask=>'dd/MM/yyyy HH:MI:SS'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72990427931727403)
,p_name=>'P12_ID_RCRSO_DCMNTO_COUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(557965639457920082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72997938611856201)
,p_name=>'P12_COUNT_REGISTROS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(557965107898920077)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94955635216065362)
,p_name=>'P12_ID_ACTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(549968062811875231)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94956067890065364)
,p_name=>'P12_ID_RCRSO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(549968062811875231)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94956418187065364)
,p_name=>'P12_NMRO_ACTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(549968062811875231)
,p_prompt=>'No. Acto'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94956877089065364)
,p_name=>'P12_FCHA_NTFCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(549968062811875231)
,p_prompt=>unistr('Fecha de Notificaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94957281526065364)
,p_name=>'P12_FCHA_OPTIMA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(549968062811875231)
,p_prompt=>unistr('Fecha L\00EDmite del T\00E9rmino')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94957675852065365)
,p_name=>'P12_ID_RCRSO_TIPO_CLNTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(549968062811875231)
,p_prompt=>'Tipo de Recurso'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIPO_RECURSO_CLIENTE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion d, a.id_rcrso_tipo_clnte r',
'from gj_d_recursos_tipo_cliente a',
'inner join gj_d_recursos_tipo b on a.cdgo_rcrso_tpo = b.cdgo_rcrso_tpo',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94958067412065365)
,p_name=>'P12_INDCDOR_AIR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(549968062811875231)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94958484808065365)
,p_name=>'P12_AIR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(549968062811875231)
,p_prompt=>unistr('Acci\00F3n')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>unistr('STATIC:Admisi\00F3n;A,Inadmisi\00F3n;I,Rechazo;R')
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'3'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94958844181065366)
,p_name=>'P12_DSCRPCION_ACTO_TPO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(549968062811875231)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94959200677065366)
,p_name=>'P12_DFRNCIA_DIAS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(549968062811875231)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94959970390065370)
,p_name=>'P12_OBSRVCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(642169184820181961)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94965054291065381)
,p_name=>'P12_ID_PRSNTCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(787818894425393093)
,p_prompt=>unistr('Tipo de Presentaci\00F3n ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_prsntcion_tpo ',
'  from pq_d_presentaciones_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94965421279065382)
,p_name=>'P12_ID_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(787818894425393093)
,p_prompt=>'Tipo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_tpo',
'  from pq_d_tipos',
'  where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_cHeight=>1
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94965872439065382)
,p_name=>'P12_ID_MTVO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(787818894425393093)
,p_prompt=>'Motivo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_mtvo ',
'  from pq_d_motivos',
' where cdgo_clnte = :f_cdgo_clnte',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94966229992065382)
,p_name=>'P12_NMBRE_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(787818894425393093)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94966641547065382)
,p_name=>'P12_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(787818894425393093)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P12_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94967072342065383)
,p_name=>'P12_IDNTFCCION_SJTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(787818894425393093)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94967455631065383)
,p_name=>'P12_ID_SLCTUD'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(787818894425393093)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94967848914065383)
,p_name=>'P12_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(787818894425393093)
,p_prompt=>unistr('N\00FAmero Radicado')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94968234646065385)
,p_name=>'P12_FCHA_RDCDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(787818894425393093)
,p_prompt=>'Fecha Radicado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94968613185065386)
,p_name=>'P12_ID_INSTNCIA_FLJO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(787818894425393093)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94969390040065387)
,p_name=>'P12_ID_RDCDOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(787570653030068513)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94969753468065387)
,p_name=>'P12_DSCRPCION_IDNTFCCION_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(787570653030068513)
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94970165790065387)
,p_name=>'P12_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(787570653030068513)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94970585463065387)
,p_name=>'P12_PRMER_NMBRE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(787570653030068513)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94970957082065388)
,p_name=>'P12_SGNDO_NMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(787570653030068513)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94971340611065388)
,p_name=>'P12_PRMER_APLLDO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(787570653030068513)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94971726463065388)
,p_name=>'P12_SGNDO_APLLDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(787570653030068513)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94972489892065389)
,p_name=>'P12_DSCRPCION_RSPNSBLE_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(787575535119070115)
,p_prompt=>'Tipo Radicador'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_rspnsble_tpo',
'     , cdgo_rspnsble_tpo ',
'  from df_s_responsables_tipo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94972804572065389)
,p_name=>'P12_DSCRPCION_IDNTFCCION_TPO_S'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(787575535119070115)
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94973254689065389)
,p_name=>'P12_IDNTFCCION_S'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(787575535119070115)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94973640573065389)
,p_name=>'P12_PRMER_NMBRE_S'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(787575535119070115)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94974061727065389)
,p_name=>'P12_SGNDO_NMBRE_S'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(787575535119070115)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94974498899065390)
,p_name=>'P12_PRMER_APLLDO_S'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(787575535119070115)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94974873768065390)
,p_name=>'P12_SGNDO_APLLDO_S'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(787575535119070115)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94975235693065390)
,p_name=>'P12_NMBRE_PAIS_NTFCCION_S'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(787575535119070115)
,p_prompt=>unistr('Pa\00EDs')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94975690701065390)
,p_name=>'P12_NMBRE_DPRTMNTO_NTFCCION_S'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(787575535119070115)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94976023019065390)
,p_name=>'P12_NMBRE_MNCPIO_NTFCCION_S'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(787575535119070115)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>10
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94976417475065391)
,p_name=>'P12_DRCCION_NTFCCION_S'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(787575535119070115)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_colspan=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
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
 p_id=>wwv_flow_api.id(94976899870065391)
,p_name=>'P12_EMAIL_S'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(787575535119070115)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94977263550065391)
,p_name=>'P12_TLFNO_S'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(787575535119070115)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94977603617065391)
,p_name=>'P12_CLLAR_S'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(787575535119070115)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94983436492065403)
,p_name=>'P12_ID_RCRSO_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(557965639457920082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97497867113562740)
,p_name=>'P12_RSPSTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(97189433553024004)
,p_prompt=>'Respuesta'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'LV_RECURSOS_RESPUESTA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d, cdgo_rspta r ',
'from gj_d_recursos_respuesta',
'where actvo           = ''S'' and',
'      indcdor_slccion = ''S''',
'order by 1 asc'))
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976808497094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'4'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97538319796784403)
,p_name=>'P12_APRBCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(557965639457920082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107783237985087125)
,p_name=>'P12_ID_ACTO_RR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(557965639457920082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107783391796087126)
,p_name=>'P12_ID_ACTO_TPO_RR'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(557965639457920082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107889808643707205)
,p_name=>'P12_FCHA_ACTO_RR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(557965639457920082)
,p_format_mask=>'dd/MM/yyyy HH:MI:SS'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141886243153567507)
,p_name=>'P12_USRIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(425214361636862069)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141886674424567508)
,p_name=>'P12_FCHA_INCIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(425214361636862069)
,p_prompt=>'Fecha Inicio Etapa'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141887013879567508)
,p_name=>'P12_FCHA_FIN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(425214361636862069)
,p_prompt=>'Fecha Fin Etapa'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141887408142567508)
,p_name=>'P12_DIAS_FLTNTES'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(425214361636862069)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141887876459567508)
,p_name=>'P12_TXTO_DRCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(425214361636862069)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(97189261632024002)
,p_validation_name=>unistr('Valida los documentos seleccionados al confirmar autorizaci\00F3n')
,p_validation_sequence=>10
,p_validation=>'P12_ID_RCRSO_DCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Para poder continuar es necesario que seleccione los documentos a autorizar.'
,p_when_button_pressed=>wwv_flow_api.id(94982128324065401)
,p_associated_item=>wwv_flow_api.id(94983436492065403)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(97189344933024003)
,p_validation_name=>'Valida Observacion al Registrar Observacion'
,p_validation_sequence=>20
,p_validation=>'P12_OBSRVCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Campo #LABEL# vacio por favor verifique.'
,p_when_button_pressed=>wwv_flow_api.id(97230268424078038)
,p_associated_item=>wwv_flow_api.id(94959970390065370)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72998131869856203)
,p_validation_name=>unistr('Valida los documentos seleccionados al confirmar autorizaci\00F3n_2')
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P12_ID_RCRSO_DCMNTO_COUNT = :P12_COUNT_REGISTROS then',
'        return true;',
'    else',
'        return false;',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Para poder continuar es necesario que seleccione los documentos a autorizar.'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(94982128324065401)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94990825485065413)
,p_name=>'Al cambiar seleccion'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_ID_RCRSO_TIPO_CLNTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94991315111065414)
,p_event_id=>wwv_flow_api.id(94990825485065413)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    apex_util.set_session_state(''P12_ID_RCRSO_TIPO_CLNTE'', :P12_ID_RCRSO_TIPO_CLNTE);',
'    select a_i_r',
'    into :P12_INDCDOR_AIR',
'    from gj_d_recursos_tipo_cliente',
'    where id_rcrso_tipo_clnte = :P12_ID_RCRSO_TIPO_CLNTE;',
'exception',
'    when no_data_found then',
'        :P12_INDCDOR_AIR := null;',
'end;'))
,p_attribute_02=>'P12_ID_RCRSO_TIPO_CLNTE'
,p_attribute_03=>'P12_INDCDOR_AIR'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94988996483065412)
,p_name=>'Al cambiar Indicador AIR'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_INDCDOR_AIR'
,p_condition_element=>'P12_INDCDOR_AIR'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94989412871065413)
,p_event_id=>wwv_flow_api.id(94988996483065412)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_AIR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94990429845065413)
,p_event_id=>wwv_flow_api.id(94988996483065412)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_AIR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94989966594065413)
,p_event_id=>wwv_flow_api.id(94988996483065412)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_AIR'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(95175207511978901)
,p_name=>'Al seleccionar'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(557965107898920077)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95175309955978902)
,p_event_id=>wwv_flow_api.id(95175207511978901)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'obtenerSeleccion();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(109328705865699201)
,p_name=>'Al hacer clic en Autorizar Proyeccion'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(94982128324065401)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(109328888084699202)
,p_event_id=>wwv_flow_api.id(109328705865699201)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'window.localStorage.clear();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(120509263570379805)
,p_name=>unistr('Al hacer clic en Rechazar Proyecci\00F3n')
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(97538154882784401)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(120509318923379806)
,p_event_id=>wwv_flow_api.id(120509263570379805)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'window.localStorage.clear();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(71268383103093068)
,p_name=>unistr('Al Cerrar Modal Registro de Observaci\00F3n')
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(97230268424078038)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71268771652093088)
,p_event_id=>wwv_flow_api.id(71268383103093068)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(71254721248036002)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94986140471065409)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  a.id_tpo,',
'            a.id_mtvo,',
'            b.nmbre_impsto,',
'            c.nmbre_impsto_sbmpsto,',
'            a.idntfccion,',
'            a.id_rdcdor,',
'            a.id_slctud,',
'            a.nmro_rdcdo_dsplay,',
'            a.fcha_rdcdo,',
'            a.id_prsntcion_tpo',
'      into :P12_ID_TPO,',
'           :P12_ID_MTVO,',
'           :P12_NMBRE_IMPSTO,',
'           :P12_NMBRE_IMPSTO_SBMPSTO,',
'           :P12_IDNTFCCION_SJTO,',
'           :P12_ID_RDCDOR,',
'           :P12_ID_SLCTUD,',
'           :P12_NMRO_RDCDO_DSPLAY,',
'           :P12_FCHA_RDCDO,',
'           :P12_ID_PRSNTCION_TPO',
'      from v_pq_g_solicitudes a',
'      inner join df_c_impuestos b on a.id_impsto = b.id_impsto',
'      inner join df_i_impuestos_subimpuesto c on a.id_impsto_sbmpsto = c.id_impsto_sbmpsto and',
'                                                 a.id_impsto = c.id_impsto and',
'                                                 c.cdgo_clnte = :F_CDGO_CLNTE                              ',
'      where a.id_instncia_fljo_gnrdo = :F_ID_INSTNCIA_FLJO;',
'exception',
'    when no_data_found then',
'       raise_application_error(-20000, ''Solicitud no encontrada'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar radicador''); ',
'end;',
'  ',
''))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94986502616065410)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Radicador'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  b.dscrpcion_idntfccion_tpo,',
'            a.idntfccion,',
'            a.prmer_nmbre,',
'            a.sgndo_nmbre,',
'            a.prmer_aplldo,',
'            a.sgndo_aplldo',
'    into    :P12_DSCRPCION_IDNTFCCION_TPO,',
'            :P12_IDNTFCCION,',
'            :P12_PRMER_NMBRE,',
'            :P12_SGNDO_NMBRE,',
'            :P12_PRMER_APLLDO,',
'            :P12_SGNDO_APLLDO',
'    from pq_g_radicador a',
'    inner join df_s_identificaciones_tipo b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
'    where id_rdcdor = :P12_ID_RDCDOR;',
'exception',
'    when no_data_found then',
'       raise_application_error(-20000, ''Radicador de PQR no encontrado'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar radicador''); ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94986926833065411)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del Solicitante'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select d.dscrpcion_rspnsble_tpo,',
'           b.dscrpcion_idntfccion_tpo,',
'           a.idntfccion,',
'           a.prmer_nmbre,',
'           a.sgndo_nmbre,',
'           a.prmer_aplldo,',
'           a.sgndo_aplldo,',
'           c.nmbre_pais,',
'           c.nmbre_dprtmnto,',
'           c.nmbre_mncpio,',
'           a.drccion_ntfccion,',
'           a.email,',
'           a.tlfno,',
'           a.cllar',
'      into :P12_DSCRPCION_RSPNSBLE_TPO,',
'           :P12_DSCRPCION_IDNTFCCION_TPO_S,',
'           :P12_IDNTFCCION_S,',
'           :P12_PRMER_NMBRE_S,',
'           :P12_SGNDO_NMBRE_S ,',
'           :P12_PRMER_APLLDO_S,',
'           :P12_SGNDO_APLLDO_S,',
'           :P12_NMBRE_PAIS_NTFCCION_S,',
'           :P12_NMBRE_DPRTMNTO_NTFCCION_S,',
'           :P12_NMBRE_MNCPIO_NTFCCION_S,',
'           :P12_DRCCION_NTFCCION_S,',
'           :P12_EMAIL_S,',
'           :P12_TLFNO_S,',
'           :P12_CLLAR_S',
'      from pq_g_solicitantes a',
'      inner join df_s_identificaciones_tipo b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
'      inner join v_df_s_municipios c on a.id_mncpio_ntfccion = c.id_mncpio',
'      inner join df_s_responsables_tipo d on a.cdgo_rspnsble_tpo = d.cdgo_rspnsble_tpo',
'     where a.id_slctud = :P12_ID_SLCTUD;',
'exception',
'    when no_data_found then',
'       raise_application_error(-20000, ''Solicitante de PQR no encontrado'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar Solicitante''); ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94987393336065411)
,p_process_sequence=>50
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del Recurso'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select id_rcrso,',
'           id_acto, ',
'           nmro_acto, ',
'           dscrpcion_acto_tpo, ',
'           fcha_ntfccion, ',
'           fcha_optima, ',
'           trunc(to_date(fcha_optima,''DD/MM/YYYY hh24:mi:ss''))-trunc(to_date(sysdate,''DD/MM/YYYY hh24:mi:ss'')) as dfrncia_dias,',
'           id_rcrso_tipo_clnte,',
'           a_i_r,',
'           indcdor_a_i_r,',
'           cdgo_rspta',
'    into :P12_ID_RCRSO,',
'         :P12_ID_ACTO, ',
'         :P12_NMRO_ACTO, ',
'         :P12_DSCRPCION_ACTO_TPO, ',
'         :P12_FCHA_NTFCCION, ',
'         :P12_FCHA_OPTIMA, ',
'         :P12_DFRNCIA_DIAS,',
'         :P12_ID_RCRSO_TIPO_CLNTE,',
'         :P12_AIR,',
'         :P12_INDCDOR_AIR,',
'         :P12_RSPSTA',
'    from(select a.id_rcrso,',
'                a.id_acto,',
'                a.nmro_acto,',
'                a.dscrpcion_acto_tpo,',
'                --a.fcha_ntfccion,',
'                nvl(a.fcha_ntfccion, (select w.fcha_ntfccion from gn_g_actos w',
'                                       where w.id_acto_rqrdo_ntfccion = a.id_acto and w.fcha_ntfccion is not null)) fcha_ntfccion,',
'                to_char(pk_util_calendario.fnc_cl_fecha_final(p_cdgo_clnte    => a.cdgo_clnte, ',
'                                                              p_fecha_inicial => nvl(a.fcha_ntfccion, (select w.fcha_ntfccion from gn_g_actos w',
'                                                                                                        where w.id_acto_rqrdo_ntfccion = a.id_acto and w.fcha_ntfccion is not null)),--a.fcha_ntfccion,',
'                                                              p_undad_drcion  => a.undad_drcion_pr, ',
'                                                              p_drcion        => a.drcion_pr, ',
'                                                              p_dia_tpo       => a.dia_tpo_pr),''dd/MM/yyyy'') as fcha_optima,',
'               a.id_rcrso_tipo_clnte,',
'               a.a_i_r,',
'               a.indcdor_a_i_r,',
'               a.cdgo_rspta',
'         from  v_gj_g_recursos a',
'         where id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO);',
'exception',
'    when no_data_found then',
'        null;',
'    when others then',
'        raise_application_error(-20000,''Problemas al consultar recurso'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(141893764695573532)
,p_process_sequence=>110
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta duraci\00F3n etapa')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  c.nmbre_trcro ,',
'        trunc(a.fcha_incio) , ',
'        trunc(a.fcha_fin_plnda) ,    ',
'        trunc(a.fcha_fin_plnda) - trunc(sysdate) dias_fltntes,',
'        /*decode(id_estdo_trnscion, 3, ''Esta tarea fue finalizada por el usuario ''||trim(c.nmbre_trcro)||'' en un total de ''|| ',
'                                     decode ((trunc(a.fcha_fin_real) - trunc(a.fcha_incio)), 0, 1, (trunc(a.fcha_fin_real) - trunc(a.fcha_incio)))||',
unistr('                                     '' d\00EDa(s). Desde el ''||trunc(a.fcha_incio)||'' hasta el ''||trunc(a.fcha_fin_real)||''.'' ,'),
'                                  ''Sr(a) ''|| trim(c.nmbre_trcro) ||'' le quedan ''|| ',
'                                  decode ((trunc(a.fcha_fin_plnda) - trunc(sysdate)), 0, 1, (trunc(a.fcha_fin_plnda) - trunc(sysdate)))||',
unistr('                                  ''  d\00EDa(s) para resolver la tarea de ''||b.nmbre_trea||'' para pasar a dar continuidad al proceso.'')*/'),
'        case when id_estdo_trnscion = 3 then',
'                  ''Esta tarea fue finalizada por el usuario ''||trim(c.nmbre_trcro)||'' en un total de ''||',
'                  decode ( (trunc(a.fcha_fin_real) - trunc(a.fcha_incio)) , 0 , 1 , (trunc(a.fcha_fin_real) - trunc(a.fcha_incio)) )||',
unistr('                  '' d\00EDa(s). Desde el ''||trunc(a.fcha_incio)||'' hasta el ''||trunc(a.fcha_fin_real)||''.'''),
'            when (trunc(a.fcha_fin_plnda) - trunc(sysdate)) < 0 then',
'                  ''Sr(a) ''|| trim(c.nmbre_trcro) ||'' tiene un retraso de ''||',
'                  abs(decode ( (trunc(a.fcha_fin_plnda) - trunc(sysdate)) , 0 , 1 ,(trunc(a.fcha_fin_plnda) - trunc(sysdate)) ))||',
unistr('                  '' d\00EDa(s) en gestionar la tarea de ''||b.nmbre_trea||'' para pasar a dar continuidad al proceso.'''),
'            else',
'                  ''Sr(a) ''|| trim(c.nmbre_trcro) ||'' le quedan ''|| ',
'                  decode ( (trunc(a.fcha_fin_plnda) - trunc(sysdate)) , 0 , 1 ,(trunc(a.fcha_fin_plnda) - trunc(sysdate)) )||',
unistr('                  '' d\00EDa(s) para resolver la tarea de ''||b.nmbre_trea||'' para pasar a dar continuidad al proceso.'''),
'        end case',
'into    :P12_USRIO,',
'        :P12_FCHA_INCIO,',
'        :P12_FCHA_FIN, ',
'        :P12_DIAS_FLTNTES, ',
'        :P12_TXTO_DRCION',
'from    wf_g_instancias_transicion  a',
'join    v_wf_d_flujos_tarea         b on a.id_fljo_trea_orgen = b.id_fljo_trea',
'join    v_sg_g_usuarios             c on a.id_usrio = c.id_usrio',
'where   /*id_estdo_trnscion in ( 1 , 2 )',
'and    */ id_instncia_fljo   = :F_ID_INSTNCIA_FLJO',
'and     id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'order by id_instncia_trnscion desc',
'fetch first 1 row only ',
';'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94988501846065411)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Documentos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(1000); ',
'    v_fcha               timestamp;',
'begin',
'    begin',
'        pkg_gj_recurso.prc_rg_etapa_documentos(p_cdgo_clnte			=>    :F_CDGO_CLNTE',
'                                              ,p_id_instncia_fljo	=>    :F_ID_INSTNCIA_FLJO',
'                                              ,p_id_usrio			=>    :F_ID_USRIO',
'                                              ,p_id_rcrso_dcmnto	=>    :P12_ID_RCRSO_DCMNTO',
'                                              ,o_cdgo_rspsta		=>    v_cdgo_rspsta',
'                                              ,o_mnsje_rspsta		=>    v_mnsje_rspsta);',
'        /*',
'        --Consultamos el acto que resuelve el recurso',
'        begin',
'            pkg_gj_recurso.prc_co_acto_resolucion(p_cdgo_clnte			=> :F_CDGO_CLNTE,',
'                                                  p_id_instncia_fljo	=> :F_ID_INSTNCIA_FLJO,',
'                                                  o_id_acto             => :P12_ID_ACTO_RR,',
'                                                  o_id_acto_tpo         => :P12_ID_ACTO_TPO_RR,',
'                                                  o_fcha                => v_fcha,',
'                                                  o_cdgo_rspsta			=> v_cdgo_rspsta,',
'                                                  o_mnsje_rspsta        => v_mnsje_rspsta);',
'        exception',
'            when others then',
'                v_cdgo_rspsta  := 1;',
'                v_mnsje_rspsta := ''Problemas al consultar acto que resuelve el recurso'';',
'        end;*/',
'        exception',
'            when others then',
'                v_cdgo_rspsta  := 1;',
'                v_mnsje_rspsta := ''Problemas al llamar el procedimiento.'';',
'    end;',
'    if(v_cdgo_rspsta != 0)then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'    ',
'    :P12_FCHA_ACTO_RR := to_char(v_fcha, ''dd/MM/yyyy hh:mi:ss'');',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(94982128324065401)
,p_process_success_message=>unistr('Documento(s) generado(s) con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(97230429904079788)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Observacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(3000);',
'    v_id_rcrso_dtlle     number;',
'begin',
'    pkg_gj_recurso.prc_rg_recurso_detalle(',
'        p_cdgo_clnte            => :F_CDGO_CLNTE,',
'        p_id_rcrso              => :P11_ID_RCRSO,',
'        p_id_fljo_trea          => :F_ID_FLJO_TREA,',
'        p_id_mtvo_clnte         => null,',
'        p_obsrvcion             => :P11_OBSRVCION,',
'        p_id_usrio              => :F_ID_USRIO,',
'        p_fcha                  => systimestamp,',
'        o_id_rcrso_dtlle        => v_id_rcrso_dtlle,',
'        o_cdgo_rspsta			=> v_cdgo_rspsta,',
'        o_mnsje_rspsta          => v_mnsje_rspsta',
'    );',
'    if(v_cdgo_rspsta != 0)then',
'        raise_application_error(-20000, v_mnsje_rspsta);',
'    end if;',
'    ',
'    :P11_OBSRVCION := null;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(97230268424078038)
,p_process_when_type=>'NEVER'
,p_process_success_message=>unistr('Observaci\00F3n Registrada Exitosamente!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(97538492696784404)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aprobacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(:REQUEST = ''BTN_AUTRZAR_PRYCCION'')then',
'    :P12_APRBCION := ''S'';',
'elsif(:REQUEST = ''BTN_RCHZAR_PRYCCION'')then',
'    :P12_APRBCION := ''N'';',
'end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_AUTRZAR_PRYCCION,BTN_RCHZAR_PRYCCION'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3550513040562531)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Confirmar Acciones'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(3000);',
'begin',
'    pkg_gj_recurso.prc_ac_recurso_acciones(',
'        p_cdgo_clnte                => :F_CDGO_CLNTE,',
'        p_id_instncia_fljo_hjo      => :F_ID_INSTNCIA_FLJO,',
'        p_indcdor_acciones_cnfrmdas => :P12_APRBCION,',
'        p_id_usrio			        => :F_ID_USRIO,',
'        o_cdgo_rspsta			    => v_cdgo_rspsta,',
'        o_mnsje_rspsta              => v_mnsje_rspsta',
'    );',
'    ',
'    if(v_cdgo_rspsta != 0)then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_AUTRZAR_PRYCCION,BTN_RCHZAR_PRYCCION'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'Acciones confirmadas exitosamente.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109774243347325801)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registra Item Tarea'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta number;',
'    v_mnsje_rspsta varchar2(32000);',
'begin',
'    --Registramos los item necesarios para el recurso',
'    pkg_gj_recurso.prc_rg_recursos_item(',
'        p_cdgo_clnte			=> :F_CDGO_CLNTE,',
'        p_id_instncia_fljo		=> :F_ID_INSTNCIA_FLJO,',
'        p_id_usrio              => :F_ID_USRIO,',
'        p_id_fljo_trea		    => :F_ID_FLJO_TREA,',
'        o_cdgo_rspsta			=> v_cdgo_rspsta,',
'        o_mnsje_rspsta          => v_mnsje_rspsta',
'    );',
'    ',
'    if(v_cdgo_rspsta != 0)then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(94982128324065401)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(97538540453784405)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'Workflow'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_AUTRZAR_PRYCCION,BTN_RCHZAR_PRYCCION'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73013237093193101)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calcular_Count'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select   count(   b.id_rcrso   )',
'into    :P12_COUNT_REGISTROS',
'from        gj_g_recursos               a',
'inner join  gj_g_recursos_documento     b   on  b.id_rcrso      =   a.id_rcrso',
'left  join  gn_d_actos_tipo_tarea       c   on  c.id_fljo_trea  =   b.id_fljo_trea',
'                                            and c.id_acto_tpo   =   b.id_acto_tpo',
'left  join  gn_d_actos_tipo             d   on  d.id_acto_tpo   =   b.id_acto_tpo',
'where       c.cdgo_clnte            =       :F_CDGO_CLNTE',
'and         a.id_instncia_fljo_hjo  =       :F_ID_INSTNCIA_FLJO',
'and         b.id_acto               is      null;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
