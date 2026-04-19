prompt --application/pages/page_00189
begin
wwv_flow_api.create_page(
 p_id=>189
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Prescripci\00F3n Documentos Validaciones')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Prescripci\00F3n Documentos Validaciones')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//Generar JSON desde un datagrid',
'function obtenerSeleccion(){',
'    var v_obj_acptds = {},',
'        vigencia  = ''0''',
'        vigencias = [];',
'    v_obj_acptds[$v(''P189_IDNTFCCION'')] = {"SI":[],"NO":[]};',
'    //Region vigencias aceptadas',
'    var v_rgion_acptds = apex.region("P189_VGNCIAS_ACPTDS");',
'    if (v_rgion_acptds) {',
'        var view = v_rgion_acptds.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        if($.isEmptyObject(records) == false){',
'            var v_json_acptds = records.map((m) => {',
'                var v_obj_vgn_vld = {};',
'                v_obj_vgn_vld[model.getValue(m, "VGNCIA").trim()] = model.getValue(m, "RSPSTA").trim();',
'                return v_obj_vgn_vld;',
'            });',
'            v_json_acptds.forEach((objVgncas) => {',
'                var vig = Object.keys(objVgncas)[0];		',
'                if(vig !== vigencia){				',
'                    vigencia = vig;         ',
'                    var filtro = v_json_acptds.map((m) => {            ',
'                        var keys = Object.keys(m);            ',
'                        if (keys[0] === vig) {                ',
'                            return m[keys[0]];            ',
'                        }        ',
'                    }).filter((f) => f );',
'                    var obj = {};',
'                    obj[vig] = filtro',
'                    vigencias.push(obj); 	',
'                }',
'            });',
'            v_obj_acptds[$v(''P189_IDNTFCCION'')].SI = vigencias;',
'        }',
'        else{',
unistr('            console.log(JSON.stringify("vac\00EDo"));'),
'        }',
'    }',
'    //Region vigencias no aceptadas',
'    vigencias = [];',
'    var v_rgion_no_acptds = apex.region("P189_VGNCIAS_NO_ACPTDS");',
'    vigencia = ''0'';',
'    if (v_rgion_no_acptds) {',
'        var view = v_rgion_no_acptds.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        if($.isEmptyObject(records) == false){',
'            var v_json_no_acptds = records.map((m) => {',
'                var v_obj_vgn_vld = {};',
'                v_obj_vgn_vld[model.getValue(m, "VGNCIA").trim()] = model.getValue(m, "RSPSTA").trim();',
'                return v_obj_vgn_vld;',
'            });',
'            ',
'            v_json_no_acptds.forEach((objVgncas) => {',
'                var vig = Object.keys(objVgncas)[0];		',
'                if(vig !== vigencia){				',
'                    vigencia = vig;         ',
'                    var filtro = v_json_no_acptds.map((m) => {            ',
'                        var keys = Object.keys(m);            ',
'                        if (keys[0] === vig) {                ',
'                            return m[keys[0]];            ',
'                        }        ',
'                    }).filter((f) => f );',
'                    var obj = {};',
'                    obj[vig] = filtro',
'                    vigencias.push(obj); 	',
'                }',
'            });',
'            v_obj_acptds[$v(''P189_IDNTFCCION'')].NO = vigencias;',
'        }',
'        else{',
unistr('            console.log(JSON.stringify("vac\00EDo"));'),
'        }',
'    }',
'    ',
'    var v_cpiarVgncias = JSON.stringify(v_obj_acptds);',
'    window.localStorage.setItem(''dataCopy'', v_cpiarVgncias);',
'}'))
,p_javascript_code_onload=>'window.localStorage.removeItem(''dataCopy'');'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'100%'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20191108094105'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108850191818518102)
,p_plug_name=>'Datos Basicos'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108850701469518108)
,p_plug_name=>'Vigencias Aceptadas'
,p_region_name=>'P189_VGNCIAS_ACPTDS'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.id_vgnc_vldcn,',
'            a.vgncia,',
'            b.prdo || ''-'' || b.dscrpcion_prdo as prdo,',
'            d.dscrpcion,',
'            case when a.indcdr_cmplio_opcnl is null then a.indcdr_cmplio',
'            else a.indcdr_cmplio_opcnl',
'            end as indcdr_cmplio,',
'            case when a.indcdr_cmplio_opcnl is null then a.rspsta_prmtrca',
'            else a.rspsta_opcnl',
'            end as rspsta',
'from        v_gf_g_prscrpcnes_vgncs_vldcn   a',
'inner join  v_gf_g_prscrpcnes_vgncia        b   on  b.id_prscrpcion_vgncia          =   a.id_prscrpcion_vgncia',
'inner join  gn_d_rglas_ngcio_clnte_fnc      c   on  c.id_rgla_ngcio_clnte_fncion    =   a.id_rgla_ngcio_clnte_fncion',
'inner join  gn_d_funciones                  d   on  d.id_fncion                     =   c.id_fncion',
'where       a.id_prscrpcion_sjto_impsto =   :P189_ID_PRSCRPCION_SJTO_IMPSTO',
'and         a.indcdor_aprbdo            =   ''S'';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>'<b><i>Vigencias Aceptadas</i></b>'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108850935433518110)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(108851149736518112)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>91
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
 p_id=>wwv_flow_api.id(108851318209518114)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Validaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(108851483231518115)
,p_name=>'INDCDR_CMPLIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDR_CMPLIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('\00BFCumpli\00F3?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(108851576274518116)
,p_name=>'RSPSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSPSTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Respuesta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(109032542761366802)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109032782934366804)
,p_name=>'ID_VGNC_VLDCN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_VGNC_VLDCN'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(108850852038518109)
,p_internal_uid=>108850852038518109
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
 p_id=>wwv_flow_api.id(108864877887693437)
,p_interactive_grid_id=>wwv_flow_api.id(108850852038518109)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>20
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(108864935408693437)
,p_report_id=>wwv_flow_api.id(108864877887693437)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108865427386693440)
,p_view_id=>wwv_flow_api.id(108864935408693437)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(108850935433518110)
,p_is_visible=>false
,p_is_frozen=>false
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108866413767693443)
,p_view_id=>wwv_flow_api.id(108864935408693437)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(108851149736518112)
,p_is_visible=>false
,p_is_frozen=>false
,p_break_order=>10
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108867493649693445)
,p_view_id=>wwv_flow_api.id(108864935408693437)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(108851318209518114)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108867957252693447)
,p_view_id=>wwv_flow_api.id(108864935408693437)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(108851483231518115)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108873110729717384)
,p_view_id=>wwv_flow_api.id(108864935408693437)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(108851576274518116)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109039204791375456)
,p_view_id=>wwv_flow_api.id(108864935408693437)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(109032782934366804)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108851648263518117)
,p_plug_name=>'Vigencias No Aceptadas'
,p_region_name=>'P189_VGNCIAS_NO_ACPTDS'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.id_vgnc_vldcn,',
'            a.vgncia,',
'            b.prdo || ''-'' || b.dscrpcion_prdo as prdo,',
'            d.dscrpcion,',
'            case when a.indcdr_cmplio_opcnl is null then a.indcdr_cmplio',
'            else a.indcdr_cmplio_opcnl',
'            end as indcdr_cmplio,',
'            case when a.indcdr_cmplio_opcnl is null then a.rspsta_prmtrca',
'            else a.rspsta_opcnl',
'            end as rspsta',
'from        v_gf_g_prscrpcnes_vgncs_vldcn   a',
'inner join  v_gf_g_prscrpcnes_vgncia        b   on  b.id_prscrpcion_vgncia          =   a.id_prscrpcion_vgncia',
'inner join  gn_d_rglas_ngcio_clnte_fnc      c   on  c.id_rgla_ngcio_clnte_fncion    =   a.id_rgla_ngcio_clnte_fncion',
'inner join  gn_d_funciones                  d   on  d.id_fncion                     =   c.id_fncion',
'where       a.id_prscrpcion_sjto_impsto =   :P189_ID_PRSCRPCION_SJTO_IMPSTO',
'and         a.indcdor_aprbdo            =   ''N'';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>'<b><i>Vigencias Rechazadas</i></b>'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108851836836518119)
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
 p_id=>wwv_flow_api.id(108851978383518120)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>91
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
 p_id=>wwv_flow_api.id(108852092579518121)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Validaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(108852142641518122)
,p_name=>'INDCDR_CMPLIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDR_CMPLIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('\00BFCumpli\00F3?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(108852205746518123)
,p_name=>'RSPSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSPSTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Respuesta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(109032852190366805)
,p_name=>'ID_VGNC_VLDCN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_VGNC_VLDCN'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109033031269366807)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(108851710319518118)
,p_internal_uid=>108851710319518118
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
 p_id=>wwv_flow_api.id(108875796360738231)
,p_interactive_grid_id=>wwv_flow_api.id(108851710319518118)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>20
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(108875849993738231)
,p_report_id=>wwv_flow_api.id(108875796360738231)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108876347787738232)
,p_view_id=>wwv_flow_api.id(108875849993738231)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(108851836836518119)
,p_is_visible=>false
,p_is_frozen=>false
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108876811144738234)
,p_view_id=>wwv_flow_api.id(108875849993738231)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(108851978383518120)
,p_is_visible=>false
,p_is_frozen=>false
,p_break_order=>10
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108877349234738236)
,p_view_id=>wwv_flow_api.id(108875849993738231)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(108852092579518121)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108877842378738237)
,p_view_id=>wwv_flow_api.id(108875849993738231)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(108852142641518122)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108878399195738238)
,p_view_id=>wwv_flow_api.id(108875849993738231)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(108852205746518123)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109042855440379194)
,p_view_id=>wwv_flow_api.id(108875849993738231)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(109032852190366805)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108850299617518103)
,p_name=>'P189_ID_PRSCRPCION_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(108850191818518102)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108850343698518104)
,p_name=>'P189_NMBRE_IMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(108850191818518102)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tributo'
,p_source=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>200
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108850448337518105)
,p_name=>'P189_NMBRE_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(108850191818518102)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sub-Tributo'
,p_source=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108850582975518106)
,p_name=>'P189_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(108850191818518102)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Identificaci\00F3n')
,p_source=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(109102070113654001)
,p_name=>'Al seleccionar vigencias aceptadas'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(108850701469518108)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(109102132930654002)
,p_event_id=>wwv_flow_api.id(109102070113654001)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'obtenerSeleccion();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(109366920356121601)
,p_name=>'Al seleccionar vigencias rechazadas'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(108851648263518117)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(109367086328121602)
,p_event_id=>wwv_flow_api.id(109366920356121601)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'obtenerSeleccion();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(108850674619518107)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Rcprcion Aut Flas v_gf_g_prescripcins_sjt_impst'
,p_attribute_02=>'V_GF_G_PRSCRPCNES_SJTO_IMPSTO'
,p_attribute_03=>'P189_ID_PRSCRPCION_SJTO_IMPSTO'
,p_attribute_04=>'ID_PRSCRPCION_SJTO_IMPSTO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109032697175366803)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(108850701469518108)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Vigencias Aceptadas: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109033148650366808)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(108851648263518117)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Vigencias No Aceptadas: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
