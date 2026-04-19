prompt --application/pages/page_00021
begin
wwv_flow_api.create_page(
 p_id=>21
,p_user_interface_id=>wwv_flow_api.id(323679016569283847)
,p_name=>'Traslado de procesos'
,p_step_title=>'Traslado de procesos'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function config_btn(config, options) {',
'    var defaultOptions = {',
'        name: ''Todos'',',
'        icon: ''fa-check-square-o'',',
'        action: function (event) {',
'            console.log(event);',
'        },',
'        hot: true,',
'        data: "",',
'        process: ""',
'    };',
'',
'    defaultOptions = Object.assign(defaultOptions, options);',
'    var $ = apex.jQuery,',
'        toolbarData = $.apex.interactiveGrid.copyDefaultToolbar(),',
'        toolbarGroup = toolbarData[toolbarData.length - 1];',
'',
'    toolbarGroup.controls.push({',
'        type: "BUTTON",',
'        action: "selectAll",',
'        iconBeforeLabel: true,',
'        icon: "fa " + defaultOptions.icon,',
'        hot: defaultOptions.hot',
'    });',
'',
'    config.toolbarData = toolbarData;',
'    var action = eval(defaultOptions.action);',
'    config.initActions = function (actions) {',
'        actions.add({',
'            name: "selectAll",',
'            label: defaultOptions.name,',
'            action: async function (event, focusElement) {',
'                action(event, defaultOptions.data, defaultOptions.process);',
'            }',
'        });',
'    }',
'    return config;',
'}',
'',
'',
'async function trasladar(event, data, process) {',
'    var id_usrio     = $v(''P21_ID_USRIO'');',
'    var id_usrio_asg = $v(''P21_ID_USRIO_ASGNDO'');',
'    var obsrvcion    = $v(''P21_OBSERVACION'');',
'',
'    if (!obsrvcion) {',
'',
unistr('        var v_mensaje = ''<h3>Sr(a). Usuario, Para poder transladar el flujo debe haber ingresado una observaci\00F3n.</h3>'';  '),
'',
'        Swal.fire({',
'            icon: ''information'',',
'            title: ''<h2>Traslado PQR</h2>'',',
'            html: v_mensaje,',
'            confirmButtonText: ''Aceptar''',
'        });',
'',
'        return false;',
'    }   ',
'',
'    apex.message.clearErrors();',
'    var errors = [];',
'    if (!id_usrio) {',
'        errors.push({',
'            type: "error",',
'            location: ["page", "inline"],',
'            pageItem: "P21_ID_USRIO",',
'            message: ''Debe seleccionar un Usuario'',',
'            unsafe: false',
'        });',
'    }',
'',
'    if (!id_usrio_asg) {',
'        errors.push({',
'            type: "error",',
'            location: ["page", "inline"],',
'            pageItem: "P21_ID_USRIO_ASGNDO",',
'            message: ''Debe seleccionar Usuario para asignar'',',
'            unsafe: false',
'        });',
'    }',
'',
'    if (errors.length > 0) {',
'        apex.message.showErrors(errors);',
'        return;',
'    }',
'    var id = $(event.delegateTarget).attr(''id'');',
'    id = id.replace(''_ig'', '''');',
'    var view = apex.region(id).widget().interactiveGrid("getViews", "grid");',
'    var model = view.model;',
'    var records = view.getSelectedRecords();',
'    var json = records.map((m) => {',
'        var obj = {};',
'        data.split().forEach(f => {',
'            obj[f] = model.getValue(m, f);',
'        });',
'        return obj;',
'    });',
'',
'    if (json.length === 0) {',
'        apex.message.showErrors([{',
'            type: "error",',
'            location: ["page"],',
'            message: ''Debe seleccionar registros de la grilla.'',',
'            unsafe: false',
'        }]);',
'        return;',
'    }',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'',
'        await apex.server.process(process, { pageItems: "#P21_ID_USRIO,#P21_ID_USRIO_ASGNDO,#P21_OBSERVACION", f01: JSON.stringify(json) })',
'            .then((resp) => {',
'                if (resp.type === ''OK'') {',
'                    $(''#P21_ID_USRIO'').trigger(''change'');',
'                    apex.message.showPageSuccess(resp.msg)',
'                } else {',
'                    apex.message.showErrors([',
'                        {',
'                            type: "error",',
'                            location: ["page"],',
'                            message: resp.msg,',
'                            unsafe: false',
'                        }',
'                    ]);',
'                }',
'            }).catch((e) => {',
'                console.log(e);',
'            })',
'    } catch (e) {',
'        console.log(e);',
'    } finally {',
'        $waitPopup.remove();',
'    }',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#ig_tareas_ig_report_settings{',
'    display: none !important; ',
'}'))
,p_step_template=>wwv_flow_api.id(39266481085898285)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JBADRAN'
,p_last_upd_yyyymmddhh24miss=>'20251123220220'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21348882938449201)
,p_plug_name=>'Traslado de procesos'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(39299295614898312)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21539032944800329)
,p_plug_name=>'tabs'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(39306030053898315)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21539129713800330)
,p_plug_name=>'Proceso'
,p_region_name=>'ig_flujos'
,p_parent_plug_id=>wwv_flow_api.id(21539032944800329)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(39298132994898311)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct b.id_fljo',
'     , b.dscrpcion_fljo',
'  from wf_g_instancias_transicion a ',
'  join v_wf_d_flujos_tarea b',
'    on b.id_fljo_trea = a.id_fljo_trea_orgen',
' where a.id_usrio = :P21_ID_USRIO ',
'   and id_estdo_trnscion in (1,2)',
'   and b.cdgo_clnte = :F_CDGO_CLNTE'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21539387713800332)
,p_name=>'ID_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(21539441172800333)
,p_name=>'DSCRPCION_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_FLJO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n del proceso')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(21540834283800347)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(21539210429800331)
,p_internal_uid=>21539210429800331
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (config){',
'    return config_btn(config, {',
'        name: ''Trasladar'',',
'        icon: ''fa-exchange'',',
'        action: trasladar,',
'        data: "ID_FLJO",',
'        process:"TRASLADAR_FLUJOS"',
'      });',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(22235150781102858)
,p_interactive_grid_id=>wwv_flow_api.id(21539210429800331)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(22235269024102858)
,p_report_id=>wwv_flow_api.id(22235150781102858)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22235757059102863)
,p_view_id=>wwv_flow_api.id(22235269024102858)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(21539387713800332)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22236279413102879)
,p_view_id=>wwv_flow_api.id(22235269024102858)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(21539441172800333)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21539564755800334)
,p_plug_name=>'Tareas'
,p_region_name=>'ig_tareas'
,p_parent_plug_id=>wwv_flow_api.id(21539032944800329)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(39298132994898311)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_instncia_trnscion ',
'      , b.dscrpcion_fljo',
'      , b.nmbre_trea',
'      , a.fcha_incio',
'      , c.obsrvcion',
'      , c.id_instncia_fljo',
'      , e.nmro_rdcdo_dsplay rdcdo',
'  from wf_g_instancias_transicion a ',
'  join v_wf_d_flujos_tarea b',
'    on b.id_fljo_trea = a.id_fljo_trea_orgen',
'  join wf_g_instancias_flujo c',
'    on c.id_instncia_fljo = a.id_instncia_fljo',
'  left join wf_g_instancias_flujo_gnrdo d',
'    on d.id_instncia_fljo_gnrdo_hjo = a.id_instncia_fljo',
'   left join pq_g_solicitudes e',
'    on e.id_instncia_fljo = d.id_instncia_fljo',
' where a.id_usrio = :P21_ID_USRIO ',
'   and id_estdo_trnscion in (1,2)',
'   and b.cdgo_clnte = :F_CDGO_CLNTE'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21539701406800336)
,p_name=>'ID_INSTNCIA_TRNSCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_TRNSCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(21539812321800337)
,p_name=>'DSCRPCION_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_FLJO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n del proceso')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(21539900343800338)
,p_name=>'NMBRE_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tarea'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21540048713800339)
,p_name=>'FCHA_INCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_INCIO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Inicial de la tarea'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(21540280343800341)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(33863374306147301)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(33863439515147302)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Instancia de flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(94610886587345501)
,p_name=>'RDCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RDCDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero PQR')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(21539663291800335)
,p_internal_uid=>21539663291800335
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (config){',
'    return config_btn(config, {',
'        name: ''Trasladar'',',
'        icon: ''fa-exchange'',',
'        action: trasladar,',
'        data: "ID_INSTNCIA_TRNSCION",',
'        process:"TRASLADAR_TAREAS"',
'      });',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(22237483365110595)
,p_interactive_grid_id=>wwv_flow_api.id(21539663291800335)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(22237572322110595)
,p_report_id=>wwv_flow_api.id(22237483365110595)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22238012328110596)
,p_view_id=>wwv_flow_api.id(22237572322110595)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(21539701406800336)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22238569863110608)
,p_view_id=>wwv_flow_api.id(22237572322110595)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(21539812321800337)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22239077624110610)
,p_view_id=>wwv_flow_api.id(22237572322110595)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(21539900343800338)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22239509127110611)
,p_view_id=>wwv_flow_api.id(22237572322110595)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(21540048713800339)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33869330306147514)
,p_view_id=>wwv_flow_api.id(22237572322110595)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(33863374306147301)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33869873230147520)
,p_view_id=>wwv_flow_api.id(22237572322110595)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(33863439515147302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94616774721346804)
,p_view_id=>wwv_flow_api.id(22237572322110595)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(94610886587345501)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25452733505305117)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(39299295614898312)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center;">',
'        <b>',
'            <i>Opciones <i class="fa fa-gears" aria-hidden="true"></i>',
'			</i>',
'        </b>',
'    </div>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25452963600305119)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(39299295614898312)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'<i>',
'  Funcionalidad que permite realizar traslados ya sea por flujos de procesos o por tareas especificas<br/><br/>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(25452857946305118)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(25452733505305117)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(39351872500898344)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:RP,25::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15925035974549501)
,p_name=>'P21_OBSERVACION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(21348882938449201)
,p_prompt=>unistr('Observaci\00F3n del Traslado')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(39351319077898342)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21348902826449202)
,p_name=>'P21_ID_USRIO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(21348882938449201)
,p_prompt=>'Usuario'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct c.nmbre_trcro ',
'     , a.id_usrio',
'  from wf_g_instancias_transicion a',
'  join v_wf_g_instancias_flujo b',
'    on b.id_instncia_fljo = a.id_instncia_fljo',
'  join v_sg_g_usuarios c',
'    on c.id_usrio = a.id_usrio',
'  join v_df_c_funcionarios D',
'    on c.id_fncnrio = d.id_fncnrio',
' where id_estdo_trnscion in (1,2)',
'   and b.cdgo_clnte = :F_CDGO_CLNTE',
'   and c.actvo = ''S''',
' order by c.nmbre_trcro;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione...'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(39351319077898342)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21349041381449203)
,p_name=>'P21_ID_USRIO_ASGNDO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(21348882938449201)
,p_prompt=>'Usuario para asignar'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_trcro, a.id_usrio',
'  from v_sg_g_usuarios a',
'  join v_df_c_funcionarios b',
'    on a.id_fncnrio = b.id_fncnrio',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.actvo = ''S''',
'   and a.id_crgo not in (2300115)',
'   and 0 = decode(:P21_ID_USRIO, null, 1, id_usrio, 1, 0)',
' order by a.nmbre_trcro',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P21_ID_USRIO'
,p_ajax_optimize_refresh=>'Y'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(39351319077898342)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22358969348319208)
,p_name=>'al seleccionar un usuario'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21_ID_USRIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22359024286319209)
,p_event_id=>wwv_flow_api.id(22358969348319208)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P21_ID_USRIO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22359129893319210)
,p_event_id=>wwv_flow_api.id(22358969348319208)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(21539129713800330)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22359294946319211)
,p_event_id=>wwv_flow_api.id(22358969348319208)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(21539564755800334)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(24184740528668940)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TRASLADAR_FLUJOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json  		clob;',
'    v_cdgo_rspsta 	number;',
'	v_mnsje_rspsta	varchar2(4000);',
'	',
'begin',
'    for i in 1..apex_application.g_f01.count ',
'    loop',
'        v_json := v_json || apex_application.g_f01(i);',
'    end loop;',
'    ',
'    pkg_pl_workflow_1_0.prc_rg_traslado( p_json              => v_json',
'                                       , p_cdgo_clnte        => :F_CDGO_CLNTE ',
'                                       , p_id_usrio_rspnsble => :P21_ID_USRIO',
'                                       , p_id_usrio_asgndo   => :P21_ID_USRIO_ASGNDO',
'                                       , p_id_usrio          => :F_ID_USRIO',
'                                       , p_accion            => ''F''',
'                                       , p_obsrvcion         => :P21_OBSERVACION',
'                                       , o_cdgo_rspsta       => v_cdgo_rspsta',
'                                       , o_mnsje_rspsta      => v_mnsje_rspsta',
'                                       );',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''type'', case when v_cdgo_rspsta = 0 then ''OK'' else ''ERROR'' end );',
'    apex_json.write(''msg'' , case when v_cdgo_rspsta = 0 then ''Proceso realizado de forma exitosa!'' else v_mnsje_rspsta end);    ',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(24184867998668941)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TRASLADAR_TAREAS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json  		clob;',
'    v_cdgo_rspsta 	number;',
'	v_mnsje_rspsta	varchar2(4000);',
'	',
'begin',
'    for i in 1..apex_application.g_f01.count ',
'    loop',
'        v_json := v_json || apex_application.g_f01(i);',
'    end loop;',
'    ',
'    pkg_pl_workflow_1_0.prc_rg_traslado( p_json              => v_json',
'                                       , p_cdgo_clnte        => :F_CDGO_CLNTE',
'                                       , p_id_usrio_rspnsble => :P21_ID_USRIO',
'                                       , p_id_usrio_asgndo   => :P21_ID_USRIO_ASGNDO',
'                                       , p_id_usrio          => :F_ID_USRIO',
'                                       , p_accion            => ''T''',
'                                       , p_obsrvcion         => :P21_OBSERVACION',
'                                       , o_cdgo_rspsta       => v_cdgo_rspsta',
'                                       , o_mnsje_rspsta      => v_mnsje_rspsta',
'                                       );',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''type'', case when v_cdgo_rspsta = 0 then ''OK'' else ''ERROR'' end );',
'    apex_json.write(''msg'' , case when v_cdgo_rspsta = 0 then ''Proceso realizado de forma exitosa!'' else v_mnsje_rspsta end);    ',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
