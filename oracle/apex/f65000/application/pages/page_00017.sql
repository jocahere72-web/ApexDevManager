prompt --application/pages/page_00017
begin
wwv_flow_api.create_page(
 p_id=>17
,p_user_interface_id=>wwv_flow_api.id(30413944355578333)
,p_name=>unistr('Notificaci\00F3n Puntual')
,p_step_title=>unistr('Notificaci\00F3n Puntual')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function obtenerActo() { ',
'    var region = apex.region("actos"); ',
'    if (region) {',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;  ',
'        var records = view.view$.grid("getSelectedRecords");',
'        if($.isEmptyObject(records) == false){',
'           $s("P17_ID_ACTO",model.getValue(records[0], "ID_ACTO").trim());',
'           $s("P17_NMRO_ACTO",model.getValue(records[0], "NMRO_ACTO").trim());',
'           $s("P17_ID_NTFCCION",model.getValue(records[0], "ID_NTFCCION").trim());',
'      ',
'           if (model.getValue(records[0], "FILE_NAME") == "") {',
'             apex.item("scanImage").hide();  ',
'      ',
'           } else{',
'             apex.item("scanImage").show(); ',
'         ',
'           }                       ',
'        }',
'        else{',
'           $s("P17_ID_ACTO", null);',
'           $s("P17_NMRO_ACTO", null);',
'           $s("P17_ID_NTFCCION", null);',
'     ',
'           apex.item("scanImage").hide();',
'        }',
'   } ',
'}',
'',
'function obtenerResponsables(){',
'    var region = apex.region("responsables");',
'    var responsables  = [];',
'    if (region) {',
'        var view = apex.region("responsables").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;  ',
'        var records = view.view$.grid("getSelectedRecords");',
'        if($.isEmptyObject(records) == false){',
'            for(let i=0; i<records.length; i++){',
'                responsables.push({"ID_ACTO_RSPNSBLE":model.getValue(records[i], "ID_ACTO_RSPNSBLE").trim()});',
'            }',
'           $s("P17_JSON_RESPNSBLES",JSON.stringify(responsables));',
'           $s("P17_RSPNSBLES_SELCCNDOS",records.length);',
'            console.log(JSON.stringify(responsables));',
'        }',
'        else{',
'           $s("P17_JSON_RESPNSBLES",null);',
'           $s("P17_RSPNSBLES_SELCCNDOS",null); ',
'        }',
'    }   ',
'}',
'',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id){',
'    if($(''#''+id).attr(''aria-expanded'') == ''false''){',
'        $(''#''+id).click();',
'    }',
'}',
'',
'buttonCollapse(''t_Button_rightControlButton'');',
'obtenerActo();'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Style buttons */',
'.btn {',
'    background-color: #c6e4ff;',
'    border: none;',
'    color: #0c0c0c;',
'    padding: 3px 7px;',
'    font-size: 14px;',
'    cursor: pointer;',
'    border-radius: 5px;',
'}',
'.btn span{',
'    margin-right: 3px;',
'}',
'/* Darker background on mouse-over */',
'.btn:hover {',
'    background-color: #a8c3dc;',
'}'))
,p_step_template=>wwv_flow_api.id(30309424961578275)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(30428954206594327)
,p_last_updated_by=>'ACARABALLO'
,p_last_upd_yyyymmddhh24miss=>'20221215175436'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(41361575578124719)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30328831919578284)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(42227265589589528)
,p_plug_name=>'Actos TAB'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(30346787012578291)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(42046898091387701)
,p_plug_name=>'Actos'
,p_region_name=>'actos'
,p_parent_plug_id=>wwv_flow_api.id(42227265589589528)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30338884622578288)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_ntfccion,',
'        a.id_acto,',
'        a.nmro_acto,',
'        a.fcha,',
'        initcap(a.dscrpcion_acto_tpo) dscrpcion_acto_tpo,',
'        b.idntfccion_sjto ,',
'        b.nmbre_impsto_sbmpsto,',
'        a.file_name',
'from v_nt_g_notfccnes_gn_g_actos a',
'inner join v_gn_g_actos_sujeto_impuesto b on a.id_acto = b.id_acto',
'where a.cdgo_clnte = :F_CDGO_CLNTE                                          and',
'      a.id_ntfccion     is not null                                         and',
'      a.indcdor_ntfcdo  = ''N''                                               and',
'      a.nmro_acto       = nvl(:P17_NMRO_ACTO_B, a.nmro_acto)                and',
'      --a.id_acto_tpo     = nvl(:P17_ID_ACTO_TPO_B, a.id_acto_tpo)            and',
'      a.id_acto_tpo     = :P17_ID_ACTO_TPO_B                                and',
'      b.idntfccion_sjto = nvl(:P17_IDNTFCCION_SJTO_B, b.idntfccion_sjto)    and',
'      b.id_impsto_sbmpsto = nvl(:P17_ID_IMPSTO_B, b.id_impsto_sbmpsto)      and',
'      ((:p17_idntfccion_rspnsble is not null and a.id_acto in (select id_acto',
'                                                               from gn_g_actos_responsable',
'                                                               where idntfccion         = :P17_IDNTFCCION_RSPNSBLE and',
'                                                                     indcdor_ntfccion   = ''N'')) or :P17_IDNTFCCION_RSPNSBLE is null)',
'                                                                     ',
'                                                                     '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(42047647693387709)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'No. Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(42049023503387723)
,p_name=>'DSCRPCION_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Tipo Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(42117438640852915)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(42117577531852916)
,p_name=>'APEX$ROW_ACTION'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(42117664861852917)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>20
,p_attribute_01=>'N'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(42224626572589502)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(42224817850589504)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(46405448115810930)
,p_name=>'ID_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_NTFCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(49421391541137130)
,p_name=>'FILE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FILE_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(49628773484979407)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(42046952091387702)
,p_internal_uid=>42046952091387702
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>true
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
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
'    config.initialSelection = false;',
'    console.log(config);',
'    return config;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(42057188375420869)
,p_interactive_grid_id=>wwv_flow_api.id(42046952091387702)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(42057250380420869)
,p_report_id=>wwv_flow_api.id(42057188375420869)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33108929322487)
,p_view_id=>wwv_flow_api.id(42057250380420869)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(42224626572589502)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34273938322490)
,p_view_id=>wwv_flow_api.id(42057250380420869)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(42224817850589504)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>233
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42060795368420882)
,p_view_id=>wwv_flow_api.id(42057250380420869)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(42047647693387709)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>257
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42083313054449851)
,p_view_id=>wwv_flow_api.id(42057250380420869)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(42049023503387723)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>244
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42138876751862098)
,p_view_id=>wwv_flow_api.id(42057250380420869)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(42117438640852915)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42156280823898056)
,p_view_id=>wwv_flow_api.id(42057250380420869)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(42117577531852916)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48117966840986908)
,p_view_id=>wwv_flow_api.id(42057250380420869)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(46405448115810930)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49732803025486708)
,p_view_id=>wwv_flow_api.id(42057250380420869)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(49421391541137130)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49792240027686618)
,p_view_id=>wwv_flow_api.id(42057250380420869)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(49628773484979407)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>251
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(42050104207387734)
,p_plug_name=>'Seleccionar Responsables'
,p_region_name=>'responsables'
,p_parent_plug_id=>wwv_flow_api.id(42227265589589528)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30338884622578288)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'select  ',
'		c.id_acto,',
'        c.id_acto_rspnsble,',
'        a.idntfccion_sjto,',
'		a.cdgo_idntfccion_tpo,',
'		a.dscrpcion_idntfccion_tpo,',
'		c.idntfccion,		',
'		a.idntfccion_rspnsble,',
'		a.nmbre_rzon_scial,',
'		a.prmer_nmbre,',
'        a.sgndo_nmbre,',
'        a.prmer_aplldo,',
'        a.sgndo_aplldo,		',
'		c.drccion_ntfccion,',
'		c.id_pais_ntfccion,',
'		a.nmbre_pais,',
'		c.id_dprtmnto_ntfccion,',
'		a.nmbre_dprtmnto ,',
'		c.id_mncpio_ntfccion,',
'		a.nmbre_mncpio ,',
'		c.email,',
'        c.tlfno',
'		',
'from ',
'v_si_i_sujetos_responsable a',
'join v_gn_g_actos_sujeto_impuesto b on  a.idntfccion_sjto = b.idntfccion_sjto',
'join gn_g_actos_responsable       c on  a.idntfccion_rspnsble = c.idntfccion and c.id_acto = b.id_acto --123156--123521',
'where c.indcdor_ntfccion    = ''N''',
'--and c.id_acto               = :P17_ID_ACTO',
'and a.idntfccion_sjto       =:P17_IDNTFCCION_SJTO_C;',
'',
'*/',
'',
'',
'select  a.id_acto,',
'        a.id_acto_rspnsble,',
'  --      f.idntfccion_sjto,',
'        a.cdgo_idntfccion_tpo,',
'        b.dscrpcion_idntfccion_tpo,',
'        a.idntfccion,',
'        a.prmer_nmbre,',
'        a.sgndo_nmbre,',
'        a.prmer_aplldo,',
'        a.sgndo_aplldo,',
'        a.drccion_ntfccion,',
'        a.id_pais_ntfccion,',
'        c.nmbre_pais,',
'        a.id_dprtmnto_ntfccion,',
'        d.nmbre_dprtmnto,',
'        a.id_mncpio_ntfccion,',
'        e.nmbre_mncpio,',
'        a.email,',
'        a.tlfno',
'from gn_g_actos_responsable a',
'inner join df_s_identificaciones_tipo    b on a.cdgo_idntfccion_tpo  = b.cdgo_idntfccion_tpo',
'inner join v_df_s_paises                 c on a.id_pais_ntfccion     = c.id_pais',
'inner join v_df_s_departamentos          d on a.id_dprtmnto_ntfccion = d.id_dprtmnto',
'inner join v_df_s_municipios             e on a.id_mncpio_ntfccion   = e.id_mncpio',
'where a.indcdor_ntfccion = ''N''',
'',
'--a.idntfccion_sjto = :IDNTFCCION_SJTO --  and-- 0101000000730007000000000-- 0104000006820013000000000',
'--and c.indcdor_ntfccion = ''N''',
'--and b.id_acto = :ID_ACTO;',
'',
'',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(42046898091387701)
,p_ajax_items_to_submit=>'P17_IDNTFCCION_SJTO_C'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(42120730761852948)
,p_name=>'CDGO_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_IDNTFCCION_TPO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(42225268971589508)
,p_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_IDNTFCCION_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Tipo de Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(42225852025589514)
,p_name=>'DRCCION_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCCION_NTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(42225935824589515)
,p_name=>'ID_PAIS_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PAIS_NTFCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(42226087995589516)
,p_name=>'NMBRE_PAIS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_PAIS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(42226186259589517)
,p_name=>'ID_DPRTMNTO_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DPRTMNTO_NTFCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(42226223008589518)
,p_name=>'NMBRE_DPRTMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DPRTMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(42226336473589519)
,p_name=>'ID_MNCPIO_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_MNCPIO_NTFCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(42226454790589520)
,p_name=>'NMBRE_MNCPIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_MNCPIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ciudad / Municipio'
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
 p_id=>wwv_flow_api.id(42226554210589521)
,p_name=>'EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMAIL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Correo Electr\00F3nico')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(42226676581589522)
,p_name=>'TLFNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TLFNO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Tel\00E9fono')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
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
 p_id=>wwv_flow_api.id(42227020216589526)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(46404655212810922)
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
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(42117438640852915)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(46404793416810923)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('No. Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
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
 p_id=>wwv_flow_api.id(46404832761810924)
,p_name=>'PRMER_NMBRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRMER_NMBRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Primer Nombre'
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(46404933823810925)
,p_name=>'SGNDO_NMBRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGNDO_NMBRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Segundo Nombre'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(46405003425810926)
,p_name=>'PRMER_APLLDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRMER_APLLDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Primer Apellido'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(46405130250810927)
,p_name=>'SGNDO_APLLDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGNDO_APLLDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Segundo Apellido'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(46405254470810928)
,p_name=>'ID_ACTO_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_RSPNSBLE'
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(42050244262387735)
,p_internal_uid=>42050244262387735
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
'    config.initialSelection = false;',
'    console.log(config);',
'    return config;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(42121694437854505)
,p_interactive_grid_id=>wwv_flow_api.id(42050244262387735)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(42121731039854505)
,p_report_id=>wwv_flow_api.id(42121694437854505)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42199451085241746)
,p_view_id=>wwv_flow_api.id(42121731039854505)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(42120730761852948)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42265939093746198)
,p_view_id=>wwv_flow_api.id(42121731039854505)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(42225268971589508)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>187
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42268954853746207)
,p_view_id=>wwv_flow_api.id(42121731039854505)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(42225852025589514)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42269427159746208)
,p_view_id=>wwv_flow_api.id(42121731039854505)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(42225935824589515)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42269902354746210)
,p_view_id=>wwv_flow_api.id(42121731039854505)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(42226087995589516)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42270456136746211)
,p_view_id=>wwv_flow_api.id(42121731039854505)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(42226186259589517)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42270980811746212)
,p_view_id=>wwv_flow_api.id(42121731039854505)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(42226223008589518)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42271403293746214)
,p_view_id=>wwv_flow_api.id(42121731039854505)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(42226336473589519)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42271934764746215)
,p_view_id=>wwv_flow_api.id(42121731039854505)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(42226454790589520)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>154
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42272432580746217)
,p_view_id=>wwv_flow_api.id(42121731039854505)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(42226554210589521)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>300
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42272933568746218)
,p_view_id=>wwv_flow_api.id(42121731039854505)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(42226676581589522)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>198
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46722444116453463)
,p_view_id=>wwv_flow_api.id(42121731039854505)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(46404655212810922)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46722955310453465)
,p_view_id=>wwv_flow_api.id(42121731039854505)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(46404793416810923)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46723470649453466)
,p_view_id=>wwv_flow_api.id(42121731039854505)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(46404832761810924)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>304
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46723955850453467)
,p_view_id=>wwv_flow_api.id(42121731039854505)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(46404933823810925)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46724402221453469)
,p_view_id=>wwv_flow_api.id(42121731039854505)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(46405003425810926)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>135
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46724989009453470)
,p_view_id=>wwv_flow_api.id(42121731039854505)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(46405130250810927)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>147
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46729366089459452)
,p_view_id=>wwv_flow_api.id(42121731039854505)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(46405254470810928)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(42227474214589530)
,p_plug_name=>'Acto Seleccionado'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(42228858877589544)
,p_plug_name=>'Datos del Representante'
,p_parent_plug_id=>wwv_flow_api.id(42227474214589530)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:margin-top-lg'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(42366943202150406)
,p_plug_name=>'Notificar'
,p_parent_plug_id=>wwv_flow_api.id(42227474214589530)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:margin-top-md'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(42280767905776502)
,p_plug_name=>'<h4><center>Ayuda </center></h4>'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
unistr('<i>Funcionalidad que permite la notificaci\00F3n personal de los actos enviados a notificar:'),
'<ul style="margin: 1.2rem 1.3rem; !important">',
'  <li>',
'      <p>',
'      Seleccione el acto a notificar.',
'      </p>',
'  </li>',
'  <li>',
'      <p>',
'      Seleccione los responsables a notificar.',
'      </p>',
'  </li>',
'  <li>',
'      <p>',
unistr('      Registrar la informaci\00F3n del representante.'),
'      </p>',
'  </li>',
'  <li>',
'      <p>',
unistr('      Imprimir el formato de acta de presentaci\00F3n personal bot\00F3n "Imprimir Formato".'),
'      </p>',
'  </li>',
'  <li>',
'      <p>',
unistr('      Cargar la evidencia al sistema seg\00FAn el tipo de representante.'),
'      </p>',
'  </li>',
'  <li>',
'      <p>',
unistr('      Presionar el bot\00F3n "Notificar" para realizar la notificaci\00F3n personal.'),
'      </p>',
'  </li>',
'</ul>',
'<br/>',
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
 p_id=>wwv_flow_api.id(44277654970346246)
,p_plug_name=>unistr('Informaci\00F3n Ayuda')
,p_region_name=>'informacion_ayuda'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400:t-Form--slimPadding:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(30336754148578287)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<i>',
'<strong>Persona natural</strong>',
'<h6>',
unistr('<li>Debe presentar el documento de identificaci\00F3n original.</li>'),
unistr('<li>Si es autorizado de una persona natural, debe presentar la autorizaci\00F3n debidamente firmada y el documento de identificaci\00F3n original del autorizado.</li>'),
unistr('<li>Si es apoderado debe presentar el poder general o especial debidamente autenticado por el poderdante y el documento de identificaci\00F3n original del apoderado.</li>'),
'</h6>',
unistr('<strong>Persona jur\00EDdica</strong>'),
'<h6>',
unistr('<li>Debe presentar el certificado de existencia y representaci\00F3n legal actualizado y el documento de identificaci\00F3n original.</li>'),
unistr('<li>Si es autorizado de una persona jur\00EDdica, la autorizaci\00F3n debe estar debidamente firmada por el representante legal o quien haga sus veces, el certificado de existencia y representaci\00F3n legal actualizado y el documento de identificaci\00F3n original ')
||'del autorizado.</li>',
unistr('<li>Si es apoderado debe presentar el poder general o especial debidamente autenticado por el poderdante, el certificado de existencia y representaci\00F3n legal actualizado y el documento de identificaci\00F3n original del apoderado.</li>'),
unistr('<li>Si es autorizado de un apoderado, debe presentar la autorizaci\00F3n debidamente firmada por el apoderado, acompa\00F1ada del poder general o especial debidamente autenticado por el poderdante, o la sustituci\00F3n del poder autenticada, el certificado de ex')
||unistr('istencia y representaci\00F3n legal actualizado y el documento de identificaci\00F3n original del autorizado.</li></h6></i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(153232380546515906)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
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
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P17_CDGO_FLJO_JRDCA'
,p_plug_display_when_cond2=>'RCS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44277780850346247)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(42280767905776502)
,p_button_name=>'BTN_MAS_INFORMACION'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_image_alt=>unistr('M\00E1s Informaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:openModal(''informacion_ayuda'');'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-question-circle-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(153232490644515907)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(153232380546515906)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_image_alt=>unistr('Regresar a Gesti\00F3n Jur\00EDdica')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&P17_BRANCH_APP_ID.:&P17_BRANCH_PAGE_ID.:&SESSION.::&DEBUG.:RP::'
,p_button_condition=>'(:P17_BRANCH_APP_ID = 72000) and (:P17_CDGO_FLJO_JRDCA =''RCS'')'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-box-arrow-in-west'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(193380044629908823)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(41361575578124719)
,p_button_name=>'Limpiar_sesiones'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(30392085768578313)
,p_button_image_alt=>'Limpiar Sesiones'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(41362118705124725)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(41361575578124719)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(43480468405880702)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(42227474214589530)
,p_button_name=>'BTN_DSCARGAR'
,p_button_static_id=>'scanImage'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_image_alt=>'Descargar Acto'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-download'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(42367049784150407)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(42228858877589544)
,p_button_name=>'BTN_IMPRIMIR_GUIA_PRESENTACION_PERSONAL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_image_alt=>'Imprimir Formato'
,p_button_position=>'BOTTOM'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(42229094788589546)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(42366943202150406)
,p_button_name=>'BTN_NOTIFICAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Notificar'
,p_button_position=>'BOTTOM'
,p_icon_css_classes=>'fa-send-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(43480712035880705)
,p_branch_action=>'f?p=&APP_ID.:17:&SESSION.:print_acto:&DEBUG.:RP:P17_ID_ACTO:&P17_ID_ACTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(43480468405880702)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(42284747043776542)
,p_branch_name=>'Go To Page 2'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_XML:17,<prmer_nmbre>&P17_PRMER_NMBRE.</prmer_nmbre> <sgndo_nmbre>&P17_SGNDO_NMBRE.</sgndo_nmbre> <prmer_aplldo>&P17_PRMER_APLLDO.</prmer_aplldo> <sgndo_aplldo>&P17_SGNDO_APLLDO.</sgndo_aplldo> <nmro_idntfccion_rspnsble>&P17_NMRO_IDNTFCCION.</nmro_idntfccion_rspnsble> <nmro_trjeta_p_rspnsble>&P17_NMRO_TRJETA_PRFSNAL.</nmro_trjeta_p_rspnsble> <cdgo_rspnsble_tpo>&P17_CDGO_RSPNSBLE_TPO.</cdgo_rspnsble_tpo> <id_acto>&P17_ID_ACTO.</id_acto> <cdgo_idntfccion_tpo_rspnsble>&P17_CDGO_IDNTFCCION_TPO.</cdgo_idntfccion_tpo_rspnsble> <cdgo_mncpio_rspnsble>&P17_CDGO_MNCPIO.</cdgo_mncpio_rspnsble>&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(42367049784150407)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(16412440354495817)
,p_branch_name=>unistr('Ir a P\00E1gina 127')
,p_branch_action=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_name,file_blob,file_mimetype,id_acto,&P17_ID_ACTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(43480468405880702)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25319014470448913)
,p_name=>'P17_INDCDOR_ENVIA_EMAIL'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(42366943202150406)
,p_prompt=>unistr('\00BFEnviar email?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391672326578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41361646197124720)
,p_name=>'P17_ID_IMPSTO_B'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(41361575578124719)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41361720540124721)
,p_name=>'P17_ID_ACTO_TPO_B'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(41361575578124719)
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
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391756467578313)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41361869295124722)
,p_name=>'P17_NMRO_ACTO_B'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(41361575578124719)
,p_prompt=>unistr('N\00FAmero del Acto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41361920602124723)
,p_name=>'P17_IDNTFCCION_SJTO_B'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(41361575578124719)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41362638223124730)
,p_name=>'P17_CDGO_MNCPIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(42228858877589544)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mncpio d, cdgo_mncpio r ',
'from v_df_s_municipios ',
'where id_dprtmnto = :P17_DEPARTAMENTO',
'order by nmbre_mncpio asc'))
,p_lov_cascade_parent_items=>'P17_PAIS,P17_DEPARTAMENTO'
,p_ajax_items_to_submit=>'P17_CDGO_MNCPIO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391756467578313)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42227646983589532)
,p_name=>'P17_ID_ACTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(42227474214589530)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42227720613589533)
,p_name=>'P17_RSPNSBLES_SELCCNDOS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(42227474214589530)
,p_prompt=>'Responsables Seleccionados'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42228278227589538)
,p_name=>'P17_NMRO_ACTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(42227474214589530)
,p_prompt=>'No. Acto'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42228307192589539)
,p_name=>'P17_JSON_RESPNSBLES'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(42227474214589530)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42229260962589548)
,p_name=>'P17_CDGO_RSPNSBLE_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(42228858877589544)
,p_prompt=>'Tipo Representante'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_rspnsble_tpo d, cdgo_rspnsble_tpo r ',
'from df_s_responsables_tipo',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391756467578313)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42229370556589549)
,p_name=>'P17_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(42228858877589544)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_idntfccion_tpo d, cdgo_idntfccion_tpo r ',
'from df_s_identificaciones_tipo',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391756467578313)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42229410654589550)
,p_name=>'P17_NMRO_IDNTFCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(42228858877589544)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391756467578313)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42366476061150401)
,p_name=>'P17_PRMER_NMBRE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(42228858877589544)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(30391756467578313)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42366505073150402)
,p_name=>'P17_SGNDO_NMBRE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(42228858877589544)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42366650007150403)
,p_name=>'P17_PRMER_APLLDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(42228858877589544)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391756467578313)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42366726658150404)
,p_name=>'P17_SGNDO_APLLDO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(42228858877589544)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42366898979150405)
,p_name=>'P17_NMRO_TRJETA_PRFSNAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(42228858877589544)
,p_prompt=>'Tarjeta Profesional'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42367193222150408)
,p_name=>'P17_FILE_EVDNCIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(42366943202150406)
,p_prompt=>'Cargar Evidencia'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(30391672326578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
,p_attribute_11=>'image/*,application/pdf'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46405312496810929)
,p_name=>'P17_IDNTFCCION_RSPNSBLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(41361575578124719)
,p_prompt=>unistr('Identificaci\00F3n Responsable')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46405581409810931)
,p_name=>'P17_ID_NTFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(42227474214589530)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49151754871148934)
,p_name=>'P17_MDIO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(42227474214589530)
,p_item_default=>'PPN'
,p_prompt=>unistr('Medio de Notificaci\00F3n')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>unistr('STATIC:Presentaci\00F3n Personal;PPN,Conducta Concluyente;CCY')
,p_grid_column=>8
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49152178667148938)
,p_name=>'P17_FCHA_PRSNTCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(42366943202150406)
,p_prompt=>unistr('Fecha de Presentaci\00F3n')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>' onkeydown="return false" '
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(30391672326578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49421163388137128)
,p_name=>'P17_VALIDA_FECHA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(42366943202150406)
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when_type=>'NEVER'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49628539000979405)
,p_name=>'P17_IDNTFCCION_SJTO_C'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(42227474214589530)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90787697688739202)
,p_name=>'P17_PAIS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(42228858877589544)
,p_prompt=>unistr('Pa\00EDs')
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_pais d, id_pais r',
'from df_s_paises',
'order by 1'))
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(30391756467578313)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90787782783739203)
,p_name=>'P17_DEPARTAMENTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(42228858877589544)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_dprtmnto d, id_dprtmnto r ',
'from df_s_departamentos',
'where id_pais = :P17_PAIS',
'order by 1'))
,p_lov_cascade_parent_items=>'P17_PAIS'
,p_ajax_items_to_submit=>'P17_DEPARTAMENTO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391756467578313)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153279380913253303)
,p_name=>'P17_BRANCH_PAGE_ID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(42227474214589530)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153279400397253304)
,p_name=>'P17_BRANCH_APP_ID'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(42227474214589530)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153384920530458703)
,p_name=>'P17_CDGO_FLJO_JRDCA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(42227474214589530)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(193377987509908802)
,p_name=>'P17_MEDIOS_DE_NOTIFICA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(42227474214589530)
,p_prompt=>'Medios de Notificacion'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select cdgo_mdio||'' - ''||dscrpcion d, cdgo_mdio r',
'From nt_d_medio',
'where cdgo_mdio in(''CEL'',''PWE'',''PPN'',''CCY'')',
'',
''))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(42229132139589547)
,p_validation_name=>'Validar P17_JSON_RESPNSBLES no es nulo'
,p_validation_sequence=>10
,p_validation=>'P17_JSON_RESPNSBLES'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'No hay responsables seleccionados.'
,p_when_button_pressed=>wwv_flow_api.id(42229094788589546)
,p_associated_item=>wwv_flow_api.id(42227720613589533)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(41363018006124734)
,p_validation_name=>'Valida Tipo Responsable al Imprimir Guia'
,p_validation_sequence=>20
,p_validation=>'P17_CDGO_RSPNSBLE_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# Vac\00EDo')
,p_validation_condition=>'P17_MDIO'
,p_validation_condition2=>'PPN'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(42367049784150407)
,p_associated_item=>wwv_flow_api.id(42229260962589548)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(41363175981124735)
,p_validation_name=>'Valida Tipo Responsable al Notificar'
,p_validation_sequence=>30
,p_validation=>'P17_CDGO_RSPNSBLE_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# Vac\00EDo')
,p_validation_condition=>'P17_MDIO'
,p_validation_condition2=>'PPN'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(42229094788589546)
,p_associated_item=>wwv_flow_api.id(42229260962589548)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(41363496406124738)
,p_validation_name=>unistr('Valida Tipo de Identificaci\00F3n al Imprimir')
,p_validation_sequence=>40
,p_validation=>'P17_CDGO_IDNTFCCION_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# Vacio'
,p_validation_condition=>'P17_MDIO'
,p_validation_condition2=>'PPN'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(42367049784150407)
,p_associated_item=>wwv_flow_api.id(42229370556589549)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(41363536135124739)
,p_validation_name=>unistr('Valida Tipo de Identificaci\00F3n al Notificar')
,p_validation_sequence=>50
,p_validation=>'P17_CDGO_IDNTFCCION_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# Vacio'
,p_validation_condition=>'P17_MDIO'
,p_validation_condition2=>'PPN'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(42229094788589546)
,p_associated_item=>wwv_flow_api.id(42229370556589549)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(41363644134124740)
,p_validation_name=>unistr('Valida Identificaci\00F3n al Imprimir')
,p_validation_sequence=>60
,p_validation=>'P17_NMRO_IDNTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# Vacio'
,p_validation_condition=>'P17_MDIO'
,p_validation_condition2=>'PPN'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(42367049784150407)
,p_associated_item=>wwv_flow_api.id(42229410654589550)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(41363779287124741)
,p_validation_name=>unistr('Valida Identificaci\00F3n al Notificar')
,p_validation_sequence=>70
,p_validation=>'P17_NMRO_IDNTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# Vacio'
,p_validation_condition=>'P17_MDIO'
,p_validation_condition2=>'PPN'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(42229094788589546)
,p_associated_item=>wwv_flow_api.id(42229410654589550)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(41363858397124742)
,p_validation_name=>'Valida Municipio al Imprimir'
,p_validation_sequence=>80
,p_validation=>'P17_CDGO_MNCPIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# Vacio'
,p_validation_condition=>'P17_MDIO'
,p_validation_condition2=>'PPN'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(42367049784150407)
,p_associated_item=>wwv_flow_api.id(41362638223124730)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(41363958807124743)
,p_validation_name=>'Valida Municipio al Notificar'
,p_validation_sequence=>90
,p_validation=>'P17_CDGO_MNCPIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# Vacio'
,p_validation_condition=>'P17_MDIO'
,p_validation_condition2=>'PPN'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(42229094788589546)
,p_associated_item=>wwv_flow_api.id(41362638223124730)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(41364017359124744)
,p_validation_name=>'Valida Primer Nombre al Imprimir'
,p_validation_sequence=>100
,p_validation=>'P17_PRMER_NMBRE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# Vacio'
,p_validation_condition=>'P17_MDIO'
,p_validation_condition2=>'PPN'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(42367049784150407)
,p_associated_item=>wwv_flow_api.id(42366476061150401)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(41364144737124745)
,p_validation_name=>'Valida Primer Nombre al Notificar'
,p_validation_sequence=>110
,p_validation=>'P17_PRMER_NMBRE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# Vacio'
,p_validation_condition=>'P17_MDIO'
,p_validation_condition2=>'PPN'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(42229094788589546)
,p_associated_item=>wwv_flow_api.id(42366476061150401)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(41364237351124746)
,p_validation_name=>'Valida Primer Apellido al Imprimir'
,p_validation_sequence=>120
,p_validation=>'P17_PRMER_APLLDO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# Vacio'
,p_validation_condition=>'P17_MDIO'
,p_validation_condition2=>'PPN'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(42367049784150407)
,p_associated_item=>wwv_flow_api.id(42366650007150403)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(41364381119124747)
,p_validation_name=>'Valida Primer Apellido al Notificar'
,p_validation_sequence=>130
,p_validation=>'P17_PRMER_APLLDO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# Vacio'
,p_validation_condition=>'P17_MDIO'
,p_validation_condition2=>'PPN'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(42229094788589546)
,p_associated_item=>wwv_flow_api.id(42366650007150403)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(41364444077124748)
,p_validation_name=>'Valida Evidencia al Notificar'
,p_validation_sequence=>140
,p_validation=>'P17_FILE_EVDNCIA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# Vacio'
,p_when_button_pressed=>wwv_flow_api.id(42229094788589546)
,p_associated_item=>wwv_flow_api.id(42367193222150408)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(41364585196124749)
,p_validation_name=>'Valida Acto Seleccionado al Notificar'
,p_validation_sequence=>150
,p_validation=>'P17_ID_ACTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('No ha seleccionado ning\00FAn acto.')
,p_when_button_pressed=>wwv_flow_api.id(42229094788589546)
,p_associated_item=>wwv_flow_api.id(42227646983589532)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(42893695819704928)
,p_validation_name=>'Valida Acto Seleccionado al Imprimir'
,p_validation_sequence=>160
,p_validation=>'P17_ID_ACTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('No ha seleccionado ning\00FAn acto.')
,p_when_button_pressed=>wwv_flow_api.id(42367049784150407)
,p_associated_item=>wwv_flow_api.id(42227646983589532)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52340303077779005)
,p_validation_name=>unistr('Valida Fecha de Presentaci\00F3n al Notificar')
,p_validation_sequence=>170
,p_validation=>'P17_FCHA_PRSNTCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#LABEL# Vacio',
''))
,p_validation_condition=>'P17_MDIO'
,p_validation_condition2=>'CCY'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(42229094788589546)
,p_associated_item=>wwv_flow_api.id(49152178667148938)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(90787894014739204)
,p_validation_name=>'Valida Pais al Imprimir'
,p_validation_sequence=>180
,p_validation=>'P17_PAIS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# Vacio'
,p_when_button_pressed=>wwv_flow_api.id(42367049784150407)
,p_associated_item=>wwv_flow_api.id(90787697688739202)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(90787968777739205)
,p_validation_name=>'Valida Pais al Notificar'
,p_validation_sequence=>190
,p_validation=>'P17_PAIS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# Vacio'
,p_validation_condition=>'P17_MDIO'
,p_validation_condition2=>'PPN'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(42229094788589546)
,p_associated_item=>wwv_flow_api.id(90787697688739202)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(52340713575779009)
,p_name=>'Al cambiar seleccion en actos definir valor de JSON responsables en nulo y responsables seleccionados'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(42046898091387701)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(52340808593779010)
,p_event_id=>wwv_flow_api.id(52340713575779009)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_JSON_RESPNSBLES,P17_RSPNSBLES_SELCCNDOS'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(42228495485589540)
,p_name=>'Al cambiar seleccion en responsables obtener responsables seleccionados'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(42050104207387734)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(42228548390589541)
,p_event_id=>wwv_flow_api.id(42228495485589540)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'obtenerResponsables();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(42227897748589534)
,p_name=>'Al cambiar seleccion en actos obtener el acto seleccionado'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(42046898091387701)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(42227978104589535)
,p_event_id=>wwv_flow_api.id(42227897748589534)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'obtenerActo();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(49419279988137109)
,p_name=>'Al cambiar'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_MDIO'
,p_condition_element=>'P17_MDIO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'PPN'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49419307336137110)
,p_event_id=>wwv_flow_api.id(49419279988137109)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(42228858877589544)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49419487260137111)
,p_event_id=>wwv_flow_api.id(49419279988137109)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(42228858877589544)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(193378194433908804)
,p_event_id=>wwv_flow_api.id(49419279988137109)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(42228858877589544)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49419894860137115)
,p_event_id=>wwv_flow_api.id(49419279988137109)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_FCHA_PRSNTCION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49419937441137116)
,p_event_id=>wwv_flow_api.id(49419279988137109)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_FCHA_PRSNTCION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49421256489137129)
,p_event_id=>wwv_flow_api.id(49419279988137109)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_VALIDA_FECHA'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'CCY'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49421422781137131)
,p_event_id=>wwv_flow_api.id(49419279988137109)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_NMRO_TRJETA_PRFSNAL,P17_CDGO_RSPNSBLE_TPO,P17_CDGO_IDNTFCCION_TPO,P17_NMRO_IDNTFCCION,P17_PAIS,P17_DEPARTAMENTO,P17_CDGO_MNCPIO,P17_PRMER_NMBRE,P17_SGNDO_NMBRE,P17_PRMER_APLLDO,P17_SGNDO_APLLDO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49421569591137132)
,p_event_id=>wwv_flow_api.id(49419279988137109)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_FILE_EVDNCIA,P17_FCHA_PRSNTCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(153432103088415601)
,p_name=>'Clic Limpiar Items'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(153232490644515907)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(153432247396415602)
,p_event_id=>wwv_flow_api.id(153432103088415601)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' :P17_BRANCH_APP_ID := '''';',
' :P17_BRANCH_PAGE_ID := '''';',
' :P17_CDGO_FLJO_JRDCA := '''';',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(193378060391908803)
,p_name=>'Al Seleccionar medio PWE'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_MEDIOS_DE_NOTIFICA'
,p_condition_element=>'P17_MEDIOS_DE_NOTIFICA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'PWE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(193378660068908809)
,p_event_id=>wwv_flow_api.id(193378060391908803)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(42366943202150406)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(193154172859788024)
,p_event_id=>wwv_flow_api.id(193378060391908803)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(42228858877589544)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25320106201448924)
,p_event_id=>wwv_flow_api.id(193378060391908803)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_INDCDOR_ENVIA_EMAIL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(193379140335908814)
,p_name=>'Al seleccionar Conducta concluyente'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_MEDIOS_DE_NOTIFICA'
,p_condition_element=>'P17_MEDIOS_DE_NOTIFICA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'CCY'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(193379275632908815)
,p_event_id=>wwv_flow_api.id(193379140335908814)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(42366943202150406)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(193380562983908828)
,p_event_id=>wwv_flow_api.id(193379140335908814)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(42228858877589544)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(193380924186908832)
,p_event_id=>wwv_flow_api.id(193379140335908814)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_FILE_EVDNCIA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25320251464448925)
,p_event_id=>wwv_flow_api.id(193379140335908814)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_INDCDOR_ENVIA_EMAIL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(193379301063908816)
,p_name=>'Al Seleccionar Presentacion Personal'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_MEDIOS_DE_NOTIFICA'
,p_condition_element=>'P17_MEDIOS_DE_NOTIFICA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'PPN'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(193153993598788022)
,p_event_id=>wwv_flow_api.id(193379301063908816)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(42366943202150406)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(193379499593908817)
,p_event_id=>wwv_flow_api.id(193379301063908816)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(42228858877589544)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(193379588942908818)
,p_name=>'Al Seleccionar Correo Electronico CEL'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_MEDIOS_DE_NOTIFICA'
,p_condition_element=>'P17_MEDIOS_DE_NOTIFICA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'CEL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(193379615372908819)
,p_event_id=>wwv_flow_api.id(193379588942908818)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(42366943202150406)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(193154088886788023)
,p_event_id=>wwv_flow_api.id(193379588942908818)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(42228858877589544)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25320023788448923)
,p_event_id=>wwv_flow_api.id(193379588942908818)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_INDCDOR_ENVIA_EMAIL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(41362853336124732)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Notificaci\00F3n Puntual')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(3000);',
'begin',
'',
'insert into muerto (n_001, v_001, t_001) values (999,:P17_MEDIOS_DE_NOTIFICA, sysdate); commit;',
'',
unistr('   if(:P17_MEDIOS_DE_NOTIFICA = ''PPN'')then--Si es presentaci\00F3n personal'),
'       pkg_nt_notificacion.prc_rg_notificacion_puntual(',
'           p_cdgo_clnte            => :F_CDGO_CLNTE,',
'           p_id_acto               => :P17_ID_ACTO,',
'           p_id_ntfccion           => :P17_ID_NTFCCION,',
'           p_json_rspnsbles        => :P17_JSON_RESPNSBLES,',
'           p_cdgo_rspnsble_tpo     => :P17_CDGO_RSPNSBLE_TPO, ',
'           p_cdgo_idntfccion_tpo   => :P17_CDGO_IDNTFCCION_TPO,',
'           p_nmro_idntfccion       => :P17_NMRO_IDNTFCCION,',
'           p_cdgo_mncpio           => :P17_CDGO_MNCPIO,',
'           p_nmro_trjeta_prfsnal   => :P17_NMRO_TRJETA_PRFSNAL,',
'           p_prmer_nmbre           => :P17_PRMER_NMBRE,',
'           p_sgndo_nmbre           => :P17_SGNDO_NMBRE,',
'           p_prmer_aplldo          => :P17_PRMER_APLLDO,',
'           p_sgndo_aplldo          => :P17_SGNDO_APLLDO,',
'           p_id_fncnrio            => :F_ID_FNCNRIO,',
'           p_file_evdncia          => :P17_FILE_EVDNCIA,',
'           p_cdgo_mdio             => :P17_MEDIOS_DE_NOTIFICA,',
'           o_cdgo_rspsta           => v_cdgo_rspsta,',
'           o_mnsje_rspsta          => v_mnsje_rspsta',
'       );',
'     elsif(:P17_MEDIOS_DE_NOTIFICA = ''CCY'')then --Si es conducta concluyente',
'       pkg_nt_notificacion.prc_rg_notificacion_puntual(',
'           p_cdgo_clnte            => :F_CDGO_CLNTE,',
'           p_id_acto               => :P17_ID_ACTO,',
'           p_id_ntfccion           => :P17_ID_NTFCCION,',
'           p_fcha_prsntccion       => :P17_FCHA_PRSNTCION,',
'           p_json_rspnsbles        => :P17_JSON_RESPNSBLES,',
'           p_id_fncnrio            => :F_ID_FNCNRIO,',
'           p_file_evdncia          => :P17_FILE_EVDNCIA,',
'           p_cdgo_mdio             => :P17_MEDIOS_DE_NOTIFICA,',
'           o_cdgo_rspsta           => v_cdgo_rspsta,',
'           o_mnsje_rspsta          => v_mnsje_rspsta',
'       );',
'       ',
'       elsif(:P17_MEDIOS_DE_NOTIFICA = ''PWE'')then --Si es pagina web',
'         pkg_nt_notificacion.prc_rg_notificacion_puntual(',
'           p_cdgo_clnte            => :F_CDGO_CLNTE,',
'           p_id_acto               => :P17_ID_ACTO,',
'           p_id_ntfccion           => :P17_ID_NTFCCION,',
'           p_fcha_prsntccion       => :P17_FCHA_PRSNTCION,',
'           p_json_rspnsbles        => :P17_JSON_RESPNSBLES,',
'           p_id_fncnrio            => :F_ID_FNCNRIO,',
'           p_file_evdncia          => :P17_FILE_EVDNCIA,',
'           p_cdgo_mdio             => :P17_MEDIOS_DE_NOTIFICA,',
'           o_cdgo_rspsta           => v_cdgo_rspsta,',
'           o_mnsje_rspsta          => v_mnsje_rspsta);',
'      ',
'       elsif(:P17_MEDIOS_DE_NOTIFICA = ''CEL'')then --Si es email',
'       --insert into muerto (n_001, v_001, t_001) values (999, ''entro a correo electronico'', sysdate); commit;',
'       ',
'          pkg_nt_notificacion.prc_rg_notificacion_puntual(',
'           p_cdgo_clnte            => :F_CDGO_CLNTE,',
'           p_id_acto               => :P17_ID_ACTO,',
'           p_id_ntfccion           => :P17_ID_NTFCCION,',
'           p_fcha_prsntccion       => :P17_FCHA_PRSNTCION,',
'           p_json_rspnsbles        => :P17_JSON_RESPNSBLES,',
'           p_id_fncnrio            => :F_ID_FNCNRIO,',
'           p_file_evdncia          => :P17_FILE_EVDNCIA,',
'           p_cdgo_mdio             => :P17_MEDIOS_DE_NOTIFICA,',
'           p_indcdor_envia_email   => :P17_INDCDOR_ENVIA_EMAIL,',
'           o_cdgo_rspsta           => v_cdgo_rspsta,',
'           o_mnsje_rspsta          => v_mnsje_rspsta);',
'',
'     -- insert into muerto (n_001, v_001, t_001) values (999, ''v_cdgo_rspsta ''||v_cdgo_rspsta, sysdate); commit;',
'      --insert into muerto (n_001, v_001, t_001) values (999, ''v_mnsje_rspsta ''||v_mnsje_rspsta, sysdate); commit;',
'',
'',
'       end if;',
'   --raise_application_error(-20001, '' cdgo respuesta [''||v_cdgo_rspsta||'' msg [''||v_mnsje_rspsta||'']'' );',
'   if(v_cdgo_rspsta != 0) then',
'       RAISE_APPLICATION_ERROR (-20001, v_mnsje_rspsta); ',
'   end if;',
'   ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(42229094788589546)
,p_process_success_message=>unistr('Notificaci\00F3n Puntual realizada exitosamente')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(41362901301124733)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Borrar Estado de Sesion al Notificar'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P17_ID_ACTO,P17_JSON_RESPNSBLES,P17_FILE_EVDNCIA,P17_ID_NTFCCION,P17_MDIO,P17_FCHA_PRSNTCION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(42229094788589546)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(193380131544908824)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Sesion'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16412371898495816)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar Informaci\00F3n del cliente')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_pais, id_dprtmnto',
'into :P17_PAIS, :P17_DEPARTAMENTO',
'from df_s_clientes',
'where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P17_PAIS'
,p_process_when_type=>'ITEM_IS_NULL'
);
end;
/
