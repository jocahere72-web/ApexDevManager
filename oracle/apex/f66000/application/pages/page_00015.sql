prompt --application/pages/page_00015
begin
wwv_flow_api.create_page(
 p_id=>15
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Reportes por Cliente Masivo'
,p_step_title=>'Reportes por Cliente Masivo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const gridSelect = (idRegion, action) => {',
'',
'    //Se busca la region con el idenficador',
'    const region = apex.region(idRegion);',
'',
'    if (region) {',
'',
'        let view = region.widget().interactiveGrid("getViews", "grid");',
'        let model = view.model;',
'        let records = view.view$.grid("getSelectedRecords");',
'',
'        //Realizamos un filtro de todos los datos seleccionados del interactive grid que no esten procesados',
'        records = records.filter((record) => {',
'            return model.getValue(record, "INDCDOR_GNRCO") === ''N''',
'        });',
'',
'        //Obtenemos un json con los datos seleccionados que no han sido procesados',
'        let json = records.map((record) => {',
'            return { "id_rprte": model.getValue(record, "ID_RPRTE").trim() };',
'        });',
'',
'        //Habilitamos o deshabilitamos el botom dependiendo si hay mas de un registro seleccionado',
'        if (json.length > 0) {',
'            $(`#${idRegion} #btn${idRegion}`).show();',
'            let jsonData = {};',
'            jsonData[''action''] = action;',
'            jsonData[''datas''] = json;',
'            //Seteamos el valor del json',
'            $s(''P15_JSON'', JSON.stringify(jsonData));',
'        } else {',
'            $(`#${idRegion} #btn${idRegion}`).hide();',
'        }',
'',
'        //Verifica si el boton seleccionar todo esta activo del interactive grid',
'        $(`#${idRegion}_ig_grid_vc_cur [role="checkbox"]`).attr(''aria-checked'') ? scrollDown(): null;',
'',
'        ',
'        //Seleccionamos los item no procesados en el interactive grid ',
'        region.widget().interactiveGrid("setSelectedRecords", records);',
'',
'    }',
'};',
'',
'const gridSelectAll = (e, btn, grid, datos) => {',
'    let json = datos.filter((data) => {',
'        return data.INDCDOR_GNRCO === ''N'';',
'    });',
'',
'    if (json.length > 0) {',
'        $(`#${grid} #btn${grid}`).show();',
'        scrollDown();',
'    }',
'};',
'',
'const scrollDown = () => {',
'    $("html, body").animate({ scrollTop: $(document).height() + "px" });',
'};'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'ocultarAyudaD();',
'',
unistr('/*\00BFReporte Gen\00E9rico? S\00ED Colapsado*/'),
unistr('$(''.a-GV-controlBreakLabel span:contains("S\00ED")'').parent().siblings().click();')))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-side {',
'    width: 258px;',
'}',
'',
'.t-Form-label{',
'    font-weight: 700;',
'}',
'',
'.a-GV {',
'    line-height: 11px;',
'}',
'',
'.a-IG-controlsContainer{',
'   display:none;',
'}'))
,p_step_template=>wwv_flow_api.id(35710418378290397)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20191113091619'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27680571551559703)
,p_plug_name=>'<b>Reportes Asignados</b>'
,p_region_name=>'ra'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(35741315331290409)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_rprte',
'     , a.nmbre_rprte',
'     , a.dscrpcion_indcdor_gnrco',
'     , a.indcdor_gnrco',
'     , a.dscrpcion_actvo',
'  from (',
'            select a.id_rprte',
'                 , a.nmbre_rprte',
'                 , a.indcdor_gnrco',
'                 , a.dscrpcion_indcdor_gnrco',
'                 , nvl2( b.id_rprte , ''S'' , ''N'' ) as asignado',
unistr('                 , nvl( b.dscrpcion_actvo , ''S\00ED'' ) as dscrpcion_actvo'),
'              from v_gn_d_reportes a',
'         left join v_gn_d_reporte_cliente b',
'                on a.id_rprte   = b.id_rprte',
'               and b.cdgo_clnte = :P15_CDGO_CLNTE',
'             where a.actvo      = ''S''',
'       ) a',
'   where a.asignado = ''S''',
'     and :P15_CDGO_CLNTE is not null'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(27680704547559705)
,p_name=>'ID_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RPRTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 Reporte')
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(27680841826559706)
,p_name=>'NMBRE_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RPRTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Reporte'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(27681266332559710)
,p_name=>'INDCDOR_GNRCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_GNRCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(27681640085559714)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(27681865789559716)
,p_name=>'DSCRPCION_INDCDOR_GNRCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_INDCDOR_GNRCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFReporte Gen\00E9rico?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(35137171057844805)
,p_name=>'DSCRPCION_ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFActivo?')
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(27680612813559704)
,p_internal_uid=>27680612813559704
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_no_data_found_message=>'No se encuentran reportes por deasignar.'
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'    config.initialSelection = false;',
'    return selectAll(config, [{',
'        name: '''',',
'        action: scrollDown,',
'        icon: ''fa-user-arrow-down'',',
'        hot: true,',
'        method: ''scrollDown''',
'    }, {',
'        name: ''Seleccionar Todos'',',
'        action: gridSelectAll,',
'        hot: false',
'    }]);',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(28209465180139118)
,p_interactive_grid_id=>wwv_flow_api.id(27680612813559704)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>50
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(28209508079139118)
,p_report_id=>wwv_flow_api.id(28209465180139118)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28210084397139134)
,p_view_id=>wwv_flow_api.id(28209508079139118)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(27680704547559705)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>179
,p_sort_order=>2
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28210556056139138)
,p_view_id=>wwv_flow_api.id(28209508079139118)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(27680841826559706)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>701
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28212555847139144)
,p_view_id=>wwv_flow_api.id(28209508079139118)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(27681266332559710)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28301762951498680)
,p_view_id=>wwv_flow_api.id(28209508079139118)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(27681865789559716)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>147
,p_sort_order=>1
,p_break_order=>1
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35391120323799104)
,p_view_id=>wwv_flow_api.id(28209508079139118)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(35137171057844805)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>159.25
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(90388000001)
,p_view_id=>wwv_flow_api.id(28209508079139118)
,p_execution_seq=>5
,p_name=>unistr('\00BFInactivo?')
,p_background_color=>'#FF7755'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(35137171057844805)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'No'
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(28422610773475501)
,p_plug_name=>'<b>Reportes por Asignar</b>'
,p_region_name=>'rxa'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(35741315331290409)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_rprte',
'     , a.nmbre_rprte',
'     , a.dscrpcion_indcdor_gnrco',
'     , a.indcdor_gnrco',
'  from (',
'            select a.id_rprte',
'                 , a.nmbre_rprte',
'                 , a.indcdor_gnrco',
'                 , a.dscrpcion_indcdor_gnrco',
'                 , nvl2( b.id_rprte , ''S'' , ''N'' ) as asignado',
'              from v_gn_d_reportes a',
'         left join v_gn_d_reporte_cliente b',
'                on a.id_rprte   = b.id_rprte',
'               and b.cdgo_clnte = :P15_CDGO_CLNTE',
'             where a.actvo      = ''S''',
'       ) a',
'   where a.asignado = ''N''',
'     and :P15_CDGO_CLNTE is not null'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28422916316475504)
,p_name=>'DSCRPCION_INDCDOR_GNRCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_INDCDOR_GNRCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFReporte Gen\00E9rico?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(28423087276475505)
,p_name=>'ID_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RPRTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 Reporte')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28423162728475506)
,p_name=>'NMBRE_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RPRTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Reporte'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(28423213935475507)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28423303327475508)
,p_name=>'INDCDOR_GNRCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_GNRCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(28422884285475503)
,p_internal_uid=>28422884285475503
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_no_data_found_message=>'No se encuentran reportes por asignar.'
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'    config.initialSelection = false;',
'    return selectAll(config, [{',
'        name: '''',',
'        action: scrollDown,',
'        icon: ''fa-user-arrow-down'',',
'        hot: true,',
'        method: ''scrollDown''',
'    }, {',
'        name: ''Seleccionar Todos'',',
'        action: gridSelectAll,',
'        hot: false',
'    }]);',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(28428779421483249)
,p_interactive_grid_id=>wwv_flow_api.id(28422884285475503)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>50
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(28428865851483250)
,p_report_id=>wwv_flow_api.id(28428779421483249)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28429364803483255)
,p_view_id=>wwv_flow_api.id(28428865851483250)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(28422916316475504)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>123.88877671813964
,p_break_order=>1
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28429837729483257)
,p_view_id=>wwv_flow_api.id(28428865851483250)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(28423087276475505)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>181.66699999999997
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28430311874483258)
,p_view_id=>wwv_flow_api.id(28428865851483250)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(28423162728475506)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>854.778
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28431202395483261)
,p_view_id=>wwv_flow_api.id(28428865851483250)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(28423303327475508)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(28423527943475510)
,p_plug_name=>'Tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(35749219659290414)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(36578803382045116)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35731364179290406)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(36580099111045128)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>30
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
' <i>',
'Funcionalidad que permite: <br><br>',
'<b>1.</b> Asignar y Remover los reportes por clientes de forma masiva.<br><br>',
'',
unistr('Para realizar la asignaci\00F3n el usuario debe consultar el cliente en la regi\00F3n Par\00E1metros de B\00FAsqueda y hacer clic en el bot\00F3n Consultar, se mostrar\00E1 seguidamente dos pesta\00F1as: a. Reportes por Asignar y b. Reportes Asignados. <br><br>'),
unistr('<b>a. Reportes por asignar:</b> Mostrar\00E1 todos los reportes disponibles No Gen\00E9ricos que se encuentran por asignar, el usuario podr\00E1 seleccionar uno o varios reportes para asignar al cliente, o tambi\00E9n podr\00E1 hacer uso del Bot\00F3n Seleccionar todos, est')
||unistr('as acciones habilitar\00E1n el bot\00F3n Asignar en la parte superior de la cuadr\00EDcula interactiva, hacer clic en el bot\00F3n Asignar para asociar los reportes seleccionado del cliente. <br><br>'),
unistr('<b>b. Reportes Asignados:</b> Mostrar\00E1 todos los reportes No Gen\00E9ricos y Gen\00E9ricos asignados al cliente, el usuario podr\00E1 seleccionar uno o varios reportes No Gen\00E9ricos para Remover del cliente, o tambi\00E9n podr\00E1 hacer uso del Bot\00F3n Seleccionar todos, ')
||unistr('estas acciones habilitar\00E1n el bot\00F3n Remover en la parte superior de la cuadr\00EDcula interactiva, hacer clic en el bot\00F3n Remover para desasociar los reportes seleccionados del cliente.  <br><br>'),
'',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario. </i>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(35499392285290432)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(27680571551559703)
,p_button_name=>'Btn_Remover'
,p_button_static_id=>'btnra'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_image_alt=>'Remover'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(`Â¿Â¿EstÂ¿Â¿ seguro de remover los reportes para el cliente (${$(''#P15_CDGO_CLNTE [selected="selected"]'').text().toLowerCase().trim()})?`,''Btn_Remover'');'
,p_icon_css_classes=>'fa-undo'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(36581436052045142)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(36578803382045116)
,p_button_name=>'Btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(28422787802475502)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(28422610773475501)
,p_button_name=>'Btn_Asignar'
,p_button_static_id=>'btnrxa'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Asignar'
,p_button_position=>'BOTTOM'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35498231972290421)
,p_name=>'P15_JSON'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(36578803382045116)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36578720803045115)
,p_name=>'P15_CDGO_CLNTE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(36578803382045116)
,p_prompt=>'Cliente:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CLIENTES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_clnte D,',
'       cdgo_clnte R',
'  from df_s_clientes',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'   -Seleccione Cliente-'
,p_colspan=>9
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(36582169825045149)
,p_name=>'remover_clase'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(36582248053045150)
,p_event_id=>wwv_flow_api.id(36582169825045149)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'ACTVO_DISPLAY'
,p_attribute_01=>'a-GV-cell u-tC is-readonly'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(37358766333980910)
,p_name=>'al_cambiar_estado_activo'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'a.ig-link'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(37358816104980911)
,p_event_id=>wwv_flow_api.id(37358766333980910)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//1 Obtener el elemento de enlace que se hizo clic',
'var $te = $(this.triggeringElement);',
'//2 Obtener el ID de la fila',
'var rowId = $te.closest(''tr'').data(''id'');',
unistr('//3 Identificar la cuadr\00EDcula interactiva particular'),
'var ig$ = apex.region("json").widget();',
'//4 Obtener el modelo para la interactiva.',
'var model = ig$.interactiveGrid("getViews","grid").model;',
'// Obtener el registro para el rowId particular',
'var record = model.getRecord(rowId);',
'',
unistr('//Obtiene el valor de la celdas a trav\00E9s del nombre de la columnas'),
'var json = record.map(function(record){',
'     return {"ID_RPRTE": parseInt(model.getValue(record, "ID_RPRTE").trim()),',
'                "ACTVO":          model.getValue(record, "ACTVO")  ',
'   };                                                     ',
'});',
'',
'$(''#P15_JSON_ACTIVO'').val(json.length > 0 ? JSON.stringify(json) : '''');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(37359015907980913)
,p_event_id=>wwv_flow_api.id(37358766333980910)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P15_JSON_ACTIVO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(32481685905854501)
,p_name=>'Al Seleccionar Reporte D'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(28422610773475501)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32481720222854502)
,p_event_id=>wwv_flow_api.id(32481685905854501)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(this);',
'gridSelect("rxa", "I");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32483061019854515)
,p_event_id=>wwv_flow_api.id(32481685905854501)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P15_JSON'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(32482809419854513)
,p_name=>'Al Seleccionar Reporte A'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(27680571551559703)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32482908915854514)
,p_event_id=>wwv_flow_api.id(32482809419854513)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'gridSelect("ra", "D");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32483158820854516)
,p_event_id=>wwv_flow_api.id(32482809419854513)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P15_JSON'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(36579277276045120)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Crud Reportes Cliente'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_cdgo_rspsta  number;',
'  v_mnsje_rspsta varchar2(4000);',
'begin',
'    ',
'  insert into muerto (c_001) values (:P15_JSON);',
'  commit;',
'  ',
'  pkg_gn_generalidades.prc_cd_reportes_cliente( p_cdgo_clnte   => :P15_CDGO_CLNTE',
'                                              , p_json         => :P15_JSON',
'                                              , o_cdgo_rspsta  => v_cdgo_rspsta',
'                                              , o_mnsje_rspsta => v_mnsje_rspsta );',
'  ',
'  --Verifica si hay error',
'  if( v_cdgo_rspsta <> 0 ) then',
'      raise_application_error( -20001 , v_mnsje_rspsta );',
'  end if;',
'  ',
'end;',
''))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Btn_Remover,Btn_Asignar'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
end;
/
