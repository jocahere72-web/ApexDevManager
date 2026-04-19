prompt --application/pages/page_00096
begin
wwv_flow_api.create_page(
 p_id=>96
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Panel de control Otros Ingresos'
,p_step_title=>'Panel de control Otros Ingresos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/js/tooltipster.bundle.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function initTooltip(obj){',
'    return $(obj).tooltipster({ contentAsHTML: true , theme: "tooltipster-shadow" , animation: "swing" });',
'}',
'',
'function tooltipRXI() {',
'  $("#rxi .t-Card a").hover(',
'    function() {',
'        var texto = $(this).find(".t-Card-titleWrap").text();',
'        var valor ="<b>" +$(this).find(".t-Card-info").text() +"</b>";',
'        initTooltip(this).tooltipster("content", texto + " : " + valor)',
'                         .tooltipster("open");',
'    },',
'    function() {',
'        initTooltip(this).tooltipster("hide");',
'    }',
'  );',
'}',
'function buttonCollapse(id){',
'	if($(''#''+id).attr(''aria-expanded'') != ''true''){',
'		$(''#''+id).click();',
'	}',
'}'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LTORRES'
,p_last_upd_yyyymmddhh24miss=>'20191203140439'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24103434432127501)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda ')
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
 p_id=>wwv_flow_api.id(24285201978077606)
,p_plug_name=>'Totales'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24285399832077607)
,p_plug_name=>unistr('T\00EDtulos Ejecutivos')
,p_parent_plug_id=>wwv_flow_api.id(24285201978077606)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(t.id_ttlo_ejctvo ) as numero_titulos_ejectuvis,',
unistr('        ''T\00EDtulos Ejecutivos Aprobados'' as title'),
'from gi_g_titulos_ejecutivo t ',
'where t.id_impsto = nvl(:P96_TRBTO, t.id_impsto)',
'and t.id_impsto_sbmpsto = nvl(:P96_SBTRBTO, t.id_impsto_sbmpsto)',
'and t.cdgo_ttlo_ejctvo_estdo = nvl(:P96_ESTDO, t.cdgo_ttlo_ejctvo_estdo)',
'and t.id_area = nvl(:P96_ORGEN, t.id_area)',
'and trunc(t.fcha_cnsttcion) between nvl(:P96_FCH_DSDE, trunc(t.fcha_cnsttcion)) and nvl(:P96_FCH_HSTA, trunc(t.fcha_cnsttcion))',
'and t.cdgo_clnte = :F_CDGO_CLNTE',
'and t.cdgo_ttlo_ejctvo_estdo = ''APB'';'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'NUMERO_TITULOS_EJECTUVIS'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TITLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24285593823077609)
,p_plug_name=>unistr('Total T\00EDtulos Ejecutivos')
,p_parent_plug_id=>wwv_flow_api.id(24285201978077606)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(to_char(sum(c.vlor_cptal) + sum(c.vlor_intres), :F_FRMTO_MNDA, ''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) mnto_ttal,',
unistr('       ''Total T\00EDtulos Ejecutivos'' title'),
'from gi_g_titulos_ejecutivo t ',
'join gi_g_titulos_ejctvo_cncpto c on t.id_ttlo_ejctvo = c.id_ttlo_ejctvo',
'where t.id_impsto = nvl(:P96_TRBTO, t.id_impsto)',
'and t.id_impsto_sbmpsto = nvl(:P96_SBTRBTO, t.id_impsto_sbmpsto)',
'and t.id_area = nvl(:P96_ORGEN, t.id_area)',
'and t.cdgo_clnte = :F_CDGO_CLNTE',
'and t.cdgo_ttlo_ejctvo_estdo = ''APB''',
'and trunc(t.fcha_cnsttcion) between nvl(:P96_FCH_DSDE, trunc(t.fcha_cnsttcion)) and nvl(:P96_FCH_HSTA, trunc(t.fcha_cnsttcion));'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'MNTO_TTAL'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TITLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24285790929077611)
,p_plug_name=>unistr('Estado de T\00EDtulos Ejecutivos')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(24285841322077612)
,p_region_id=>wwv_flow_api.id(24285790929077611)
,p_chart_type=>'bar'
,p_title=>unistr('Estado de T\00EDtulos Ejecutivos')
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(24285936754077613)
,p_chart_id=>wwv_flow_api.id(24285841322077612)
,p_static_id=>'rx3'
,p_seq=>10
,p_name=>unistr('Estado de T\00EDtulos Ejecutivos')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.dscrpcion as dscrpcion,',
'       count(t.cdgo_ttlo_ejctvo_estdo) as ttal_estdo,',
'       ''<b>Estado:</b> '' ||e.dscrpcion || ''<br>'' ||',
unistr('       ''<b>T\00EDtulos Ejecutivo: </b> '' || count(e.dscrpcion) || ''<br>'' toltip_dscrpcion_rspsta'),
'from gi_g_titulos_ejecutivo t',
'join df_c_areas                     a   on t.id_area = a.id_area',
'join gi_d_titulos_ejecutivo_estdo   e   on t.cdgo_ttlo_ejctvo_estdo = e.cdgo_ttlo_ejctvo_estdo',
'where t.id_impsto = nvl(:P96_TRBTO, t.id_impsto)',
'and t.id_impsto_sbmpsto = nvl(:P96_SBTRBTO, t.id_impsto_sbmpsto)',
'and t.cdgo_ttlo_ejctvo_estdo = nvl(:P96_ESTDO, t.cdgo_ttlo_ejctvo_estdo)',
'and t.id_area = nvl(:P96_ORGEN, t.id_area)',
'and trunc(t.fcha_cnsttcion) between nvl(:P96_FCH_DSDE, trunc(t.fcha_cnsttcion)) and nvl(:P96_FCH_HSTA, trunc(t.fcha_cnsttcion))',
'and t.cdgo_clnte = :F_CDGO_CLNTE',
'group by e.dscrpcion,',
'         t.cdgo_ttlo_ejctvo_estdo;  '))
,p_items_value_column_name=>'TTAL_ESTDO'
,p_items_label_column_name=>'DSCRPCION'
,p_items_short_desc_column_name=>'TOLTIP_DSCRPCION_RSPSTA'
,p_color=>'#FFD07A'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(24286025110077614)
,p_chart_id=>wwv_flow_api.id(24285841322077612)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(24286146549077615)
,p_chart_id=>wwv_flow_api.id(24285841322077612)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24286236803077616)
,p_plug_name=>unistr('Total T\00EDtulos Ejecutivo por  Secretaria')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(24286387585077617)
,p_region_id=>wwv_flow_api.id(24286236803077616)
,p_chart_type=>'bar'
,p_title=>unistr('T\00EDtulos Ejecutivo por  Secretaria')
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(24286446984077618)
,p_chart_id=>wwv_flow_api.id(24286387585077617)
,p_static_id=>'rx0'
,p_seq=>10
,p_name=>unistr('Total T\00EDtulos Ejecutivo por  Secretaria')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_area as dscrpcion_area,',
'       sum(c.vlor_cptal + c.vlor_intres) as ttal,',
'       ''<b>Origen:</b> '' ||a.nmbre_area || ''<br>'' ||',
'       ''<b>Total: </b> '' || to_char(sum(c.vlor_cptal + c.vlor_intres), :F_FRMTO_MNDA) || ''<br>'' toltip_dscrpcion_rspsta ',
'from gi_g_titulos_ejecutivo         t',
'join gi_g_titulos_ejctvo_cncpto     c   on t.id_ttlo_ejctvo = c.id_ttlo_ejctvo',
'join df_c_areas                     a   on t.id_area = a.id_area',
'join gi_d_titulos_ejecutivo_estdo   e   on t.cdgo_ttlo_ejctvo_estdo = e.cdgo_ttlo_ejctvo_estdo',
'where t.id_impsto = nvl(:P96_TRBTO, t.id_impsto)',
'and t.id_impsto_sbmpsto = nvl(:P96_SBTRBTO, t.id_impsto_sbmpsto)',
'and t.id_area = nvl(:P96_ORGEN, t.id_area)',
'and trunc(t.fcha_cnsttcion) between nvl(:P96_FCH_DSDE, trunc(t.fcha_cnsttcion)) and nvl(:P96_FCH_HSTA, trunc(t.fcha_cnsttcion))',
'and t.cdgo_ttlo_ejctvo_estdo = ''APB''',
'and t.cdgo_clnte = :F_CDGO_CLNTE',
'group by a.nmbre_area,',
'         t.cdgo_ttlo_ejctvo_estdo;'))
,p_items_value_column_name=>'TTAL'
,p_items_label_column_name=>'DSCRPCION_AREA'
,p_items_short_desc_column_name=>'TOLTIP_DSCRPCION_RSPSTA'
,p_color=>'#64D1C2'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(24286573393077619)
,p_chart_id=>wwv_flow_api.id(24286387585077617)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(24286646158077620)
,p_chart_id=>wwv_flow_api.id(24286387585077617)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24286794761077621)
,p_plug_name=>unistr('Total T\00EDtulos Ejecutivo por Sub-Impuesto')
,p_region_name=>'rx10'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(24286838610077622)
,p_region_id=>wwv_flow_api.id(24286794761077621)
,p_chart_type=>'bar'
,p_title=>unistr('T\00EDtulos Ejecutivo por Sub-Impuesto')
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(24286953400077623)
,p_chart_id=>wwv_flow_api.id(24286838610077622)
,p_seq=>10
,p_name=>unistr('Total T\00EDtulos Ejecutivo por Sub-Impuesto')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select s.nmbre_impsto_sbmpsto,',
'       sum(c.vlor_cptal + c.vlor_intres) as ttal,',
'       ''<b>Sub-Tributo:</b> '' ||s.nmbre_impsto_sbmpsto || ''<br>'' ||',
'       ''<b>Total: </b> '' || to_char(sum(c.vlor_cptal + c.vlor_intres), :F_FRMTO_MNDA) || ''<br>'' toltip_dscrpcion_rspsta ',
'from gi_g_titulos_ejecutivo         t',
'join gi_g_titulos_ejctvo_cncpto     c   on t.id_ttlo_ejctvo = c.id_ttlo_ejctvo',
'join df_c_areas                     a   on t.id_area = a.id_area',
'join gi_d_titulos_ejecutivo_estdo   e   on t.cdgo_ttlo_ejctvo_estdo = e.cdgo_ttlo_ejctvo_estdo',
'join df_i_impuestos_subimpuesto     s   on t.id_impsto_sbmpsto = s.id_impsto_sbmpsto',
'where t.id_impsto = nvl(:P96_TRBTO, t.id_impsto)',
'and t.id_impsto_sbmpsto = nvl(:P96_SBTRBTO, t.id_impsto_sbmpsto)',
'and t.id_area = nvl(:P96_ORGEN, t.id_area)',
'and trunc(t.fcha_cnsttcion) between nvl(:P96_FCH_DSDE, trunc(t.fcha_cnsttcion)) and nvl(:P96_FCH_HSTA, trunc(t.fcha_cnsttcion))',
'and t.cdgo_ttlo_ejctvo_estdo = ''APB''',
'and t.cdgo_clnte = :F_CDGO_CLNTE',
'group by s.nmbre_impsto_sbmpsto,',
'         t.cdgo_ttlo_ejctvo_estdo; '))
,p_items_value_column_name=>'TTAL'
,p_items_label_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_items_short_desc_column_name=>'TOLTIP_DSCRPCION_RSPSTA'
,p_color=>'#7196D5'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(24287004103077624)
,p_chart_id=>wwv_flow_api.id(24286838610077622)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(24287167753077625)
,p_chart_id=>wwv_flow_api.id(24286838610077622)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24287255821077626)
,p_plug_name=>unistr('T\00EDtulos Ejecutivos por fecha')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(24287336408077627)
,p_region_id=>wwv_flow_api.id(24287255821077626)
,p_chart_type=>'lineWithArea'
,p_title=>unistr('T\00EDtulos Ejecutivos por fecha')
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(24287430674077628)
,p_chart_id=>wwv_flow_api.id(24287336408077627)
,p_seq=>10
,p_name=>unistr('T\00EDtulos Ejecutivos por fecha')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(t.fcha_cnsttcion, ''DD/MM/YYYY'') fcha_formatiada,',
'       to_char(t.fcha_cnsttcion, ''DD/MM/YYYY''),',
'       sum(c.vlor_cptal + c.vlor_intres),',
unistr('       ''<b>Total T\00EDtulo Ejecutivo</b>'),
'        <b>Fecha: </b> '' ||to_char(t.fcha_cnsttcion, ''DD/MM/YYYY'') || ''<br>'' ||',
'        ''<b>Total: </b> '' || to_char(sum(c.vlor_cptal + c.vlor_intres), :F_FRMTO_MNDA) || ''<br>'' toltip_vlor_fcha ',
'from gi_g_titulos_ejecutivo         t',
'join gi_g_titulos_ejctvo_cncpto     c   on t.id_ttlo_ejctvo         = c.id_ttlo_ejctvo',
'join df_c_areas                     a   on t.id_area                = a.id_area',
'join gi_d_titulos_ejecutivo_estdo   e   on t.cdgo_ttlo_ejctvo_estdo = e.cdgo_ttlo_ejctvo_estdo',
'join df_i_impuestos_subimpuesto     s   on t.id_impsto_sbmpsto = s.id_impsto_sbmpsto',
'where t.id_impsto = nvl(:P96_TRBTO, t.id_impsto)',
'and t.id_impsto_sbmpsto = nvl(:P96_SBTRBTO, t.id_impsto_sbmpsto)',
'and t.id_area = nvl(:P96_ORGEN, t.id_area)',
'and trunc(t.fcha_cnsttcion) between nvl(:P96_FCH_DSDE, trunc(t.fcha_cnsttcion)) and nvl(:P96_FCH_HSTA, trunc(t.fcha_cnsttcion))',
'and t.cdgo_ttlo_ejctvo_estdo = ''APB''',
'and t.cdgo_clnte = :F_CDGO_CLNTE',
'group by t.fcha_cnsttcion;  '))
,p_items_value_column_name=>'SUM(C.VLOR_CPTAL+C.VLOR_INTRES)'
,p_items_label_column_name=>'TO_CHAR(T.FCHA_CNSTTCION,''DD/MM/YYYY'')'
,p_items_short_desc_column_name=>'TOLTIP_VLOR_FCHA'
,p_color=>'#FFB17A'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(24287502713077629)
,p_chart_id=>wwv_flow_api.id(24287336408077627)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(24287654042077630)
,p_chart_id=>wwv_flow_api.id(24287336408077627)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24287718920077631)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>90
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
 p_id=>wwv_flow_api.id(25250757966619217)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
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
'',
unistr('Funcionalidad que permite consultar informaci\00F3n de los T\00EDtulos Ejecutivos gestionados en el sistema.<br><br>'),
unistr('<b>1.</b> Muestra el total T\00EDtulos Ejecutivos gestionados.<br><br>'),
unistr('<b>T\00EDtulos Ejecutivos por Secretar\00EDa:<br><br> </b>'),
unistr('<b>1.</b>Con este gr\00E1fico de barras se puede apreciar el valor total de T\00EDtulos Ejecutivos que se han ingresado al sistema emitidos de otras secretar\00EDas.</b><br><br>'),
unistr('<b>T\00EDtulos Ejecutivos por Sub-Impuesto:<br><br> </b>'),
unistr('<b>1.</b>Con este gr\00E1fico de barras se puede apreciar el valor total de T\00EDtulos Ejecutivos por Sub-Impuesto.</b><br><br>'),
unistr('<b>T\00EDtulos Ejecutivos por estado:<br><br> </b>'),
unistr('<b>1.</b>Con este gr\00E1fico de barras se puede apreciar el total de T\00EDtulos Ejecutivos que han sido aprobados y rechazados.</b><br><br>'),
unistr('<b>T\00EDtulos Ejecutivos por fecha:<br><br> </b>'),
unistr('<b>1.</b>Con este gr\00E1fico de barras se puede apreciar el valor total de T\00EDtulos Ejecutivos registrados en el sistema por fecha.</b><br><br>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(24285409316077608)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(24103434432127501)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(25250897343619218)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(24287718920077631)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=50000:115:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24284791040077601)
,p_name=>'P96_TRBTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(24103434432127501)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from v_sg_g_menu_impuesto     a',
'  join sg_g_usuarios_impuesto   b on a.id_impsto = b.id_impsto',
' where a.cdgo_clnte       = :F_CDGO_CLNTE',
'   and a.id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'   and a.id_mnu           = :F_ID_MNU',
'   and b.id_usrio         = :F_ID_USRIO'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS_X_MENU_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto || '' ['' || a.cdgo_impsto || '']''display,',
'       a.id_impsto value',
'  from v_sg_g_menu_impuesto     a',
'  join sg_g_usuarios_impuesto   b on a.id_impsto = b.id_impsto',
' where a.cdgo_clnte       = :F_CDGO_CLNTE',
'   and a.id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'   and a.id_mnu           = :F_ID_MNU',
'   and b.id_usrio         = :F_ID_USRIO',
'   and a.actvo            = ''S''',
'   and b.actvo            = ''S''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select * ',
'   from ( select count(*) a',
'            from v_sg_g_menu_impuesto     a',
'            join sg_g_usuarios_impuesto   b on a.id_impsto = b.id_impsto',
'           where a.cdgo_clnte       = :F_CDGO_CLNTE',
'             and a.id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'             and a.id_mnu           = :F_ID_MNU',
'             and b.id_usrio         = :F_ID_USRIO',
'   )',
'where a > 1;'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24284865326077602)
,p_name=>'P96_SBTRBTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(24103434432127501)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P96_TRBTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P96_TRBTO'
,p_ajax_items_to_submit=>'P96_SBTRBTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24284921400077603)
,p_name=>'P96_FCH_DSDE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(24103434432127501)
,p_prompt=>'Fecha desde'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-04:+00'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24285043991077604)
,p_name=>'P96_FCH_HSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(24103434432127501)
,p_prompt=>'Fecha hasta'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24285142458077605)
,p_name=>'P96_ESTDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(24103434432127501)
,p_prompt=>'Estado'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.dscrpcion as d,',
'       e.cdgo_ttlo_ejctvo_estdo as r',
'from gi_d_titulos_ejecutivo_estdo e',
'where e.cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24373125409150549)
,p_name=>'P96_ORGEN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(24103434432127501)
,p_prompt=>'Origen'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_area as d,',
'       a.id_area    as r',
'from df_c_areas a',
'where a.cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(45684458559248801)
,p_computation_sequence=>10
,p_computation_item=>'P96_TRBTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_impsto',
' from v_sg_g_menu_impuesto     a',
'  join sg_g_usuarios_impuesto   b on a.id_impsto = b.id_impsto',
' where a.cdgo_clnte       = :F_CDGO_CLNTE',
'   and a.id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'   and a.id_mnu           = :F_ID_MNU',
'   and b.id_usrio         = :F_ID_USRIO'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(41129573173545801)
,p_name=>'Al cambiar la fecha'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P96_FCH_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(41129641883545802)
,p_event_id=>wwv_flow_api.id(41129573173545801)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P96_FCH_HSTA").datepicker( ''option'' , ''minDate'' , $("#P96_FCH_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
null;
end;
/
