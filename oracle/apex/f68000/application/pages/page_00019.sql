prompt --application/pages/page_00019
begin
wwv_flow_api.create_page(
 p_id=>19
,p_user_interface_id=>wwv_flow_api.id(71889596252951620)
,p_name=>'Panel Control PQR'
,p_step_title=>'Panel Control PQR'
,p_warn_on_unsaved_changes=>'N'
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
'        var texto = $(this).find(".t-Card-title").text();',
'        var valor ="<b>" +$(this).find(".t-Card-info").text() +"</b>"; ',
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
'}',
'',
'',
'',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'tooltipRXI();',
'buttonCollapse(''t_Button_rightControlButton'');'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/tooltipster.bundle.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-borderless.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-shadow.min.css'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-label{',
'  font-weight: 700;',
'}',
'',
'.t-Card-body {',
'    flex-grow: 21;',
'    padding: 16px;',
'    display: flex;',
'    flex-direction: inherit;',
'}',
'',
'.t-Card-info {',
'    font-size: 1.4rem;',
'    font-weight: 500;',
'}',
'',
'.t-Card-body img {',
'    width: 35px;',
'    height: 35px;',
'    border-radius: 50%;',
'}',
'',
'.t-Cards--compact .t-Card .t-Card-title {',
'    font-size: 1.4rem;',
'    line-height: 1.6rem;',
'    margin: 0;',
'    font-weight: bold;',
'    position: relative;',
'    font-style: italic;',
'    top: 50%;',
'    -webkit-transform: translateY(-50%);',
'    transform: translateY(-50%);',
'    white-space: nowrap;',
'    overflow: hidden;',
'    text-overflow: ellipsis;',
'}',
'',
'.t-Card-desc {',
'	display: flex !important;',
'	flex: 1 !important;',
'}',
'',
'.t-Card-info {',
'    flex-direction: column !important;',
'    flex: 1 !important;',
'    text-align: right !important;',
'}',
'',
'.t-Card-body {',
'    display: flex !important;',
'    flex-direction: row !important;',
'    flex-wrap: wrap !important;',
'    width: 100% !important;',
'}',
'',
'#rxo polygon{',
'    stroke: #309fdb;',
'    stroke-width: 2px;',
'}'))
,p_step_template=>wwv_flow_api.id(71783507231951541)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LOBREDOR'
,p_last_upd_yyyymmddhh24miss=>'20191023150005'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(58088751421703762)
,p_plug_name=>'Panel de Control'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24180907041668902)
,p_plug_name=>'<i><b>Comportamiento por Estados</b></i>'
,p_parent_plug_id=>wwv_flow_api.id(58088751421703762)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>80
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24181080023668903)
,p_plug_name=>'<i>Estados de PQR</i>'
,p_parent_plug_id=>wwv_flow_api.id(24180907041668902)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--noBorder:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>6
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(24181174057668904)
,p_region_id=>wwv_flow_api.id(24181080023668903)
,p_chart_type=>'pie'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
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
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(24181219676668905)
,p_chart_id=>wwv_flow_api.id(24181174057668904)
,p_seq=>10
,p_name=>'PQR por Estados'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select s.id_estdo',
'     , e.dscrpcion',
'     , count(s.id_estdo) ttal',
'     , ''<b>Estado :</b> '' || e.dscrpcion || ''<br>'' || ',
'       ''<b>Total :</b> '' || count(s.id_estdo) || ''<br>'' as dscrpcion_ttal',
'  from pq_g_solicitudes s ',
'   join pq_d_estados e           on s.id_estdo = e.id_estdo',
'  where s.cdgo_clnte = :F_CDGO_CLNTE',
'    and trunc(s.fcha_incio) between :P19_FCHA_INCIO and :P19_FCHA_FIN',
'  group by s.id_estdo',
'      , e.dscrpcion'))
,p_ajax_items_to_submit=>'P19_FCHA_INCIO,P19_FCHA_FIN'
,p_items_value_column_name=>'TTAL'
,p_items_label_column_name=>'DSCRPCION'
,p_items_short_desc_column_name=>'DSCRPCION_TTAL'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P19_ID_ESTDO'', ''&ID_ESTDO.'')'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(90845933516391875)
,p_plug_name=>'<i>Tipos de PQR por Estados</i>'
,p_region_name=>'rxo'
,p_parent_plug_id=>wwv_flow_api.id(24180907041668902)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--stacked:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(23869854184715701)
,p_region_id=>wwv_flow_api.id(90845933516391875)
,p_chart_type=>'bar'
,p_height=>'200'
,p_animation_on_display=>'zoom'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'on'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_fill_multi_series_gaps=>false
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
,p_no_data_found_message=>'No hay datos que mostrar.'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(23871560130715702)
,p_chart_id=>wwv_flow_api.id(23869854184715701)
,p_seq=>10
,p_name=>'Tipos de PQR por Estados'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select s.id_tpo',
'     , t.dscrpcion',
'     , count(s.id_tpo) ttal',
'     , ''<b>Tipo :</b> '' || t.dscrpcion || ''<br>'' || ',
'       ''<b>Total :</b> '' || count(s.id_tpo) || ''<br>'' as dscrpcion_ttal',
'  from pq_g_solicitudes s',
'   join pq_d_tipos              t   on t.id_tpo = s.id_tpo',
'  where s.cdgo_clnte = :F_CDGO_CLNTE',
'    and s.id_estdo = :P19_ID_ESTDO',
'    and trunc(s.fcha_incio) between :P19_FCHA_INCIO and :P19_FCHA_FIN',
'  group by s.id_tpo',
'      , t.dscrpcion'))
,p_ajax_items_to_submit=>'P19_FCHA_INCIO,P19_FCHA_FIN'
,p_items_value_column_name=>'TTAL'
,p_items_label_column_name=>'DSCRPCION'
,p_items_short_desc_column_name=>'DSCRPCION_TTAL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:RP,20:P20_FCHA_INCIO,P20_FCHA_FIN,P20_ID_TPO,P20_ID_ESTDO:&P19_FCHA_INCIO.,&P19_FCHA_FIN.,&ID_TPO.,&P19_ID_ESTDO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(23870397946715701)
,p_chart_id=>wwv_flow_api.id(23869854184715701)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Cantidad'
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
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(23870967531715702)
,p_chart_id=>wwv_flow_api.id(23869854184715701)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Estados'
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24183057532668923)
,p_plug_name=>'<i><b>Comportamiento por Motivos</b></i>'
,p_parent_plug_id=>wwv_flow_api.id(58088751421703762)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(24183530253668928)
,p_region_id=>wwv_flow_api.id(24183057532668923)
,p_chart_type=>'bar'
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
 p_id=>wwv_flow_api.id(24183699637668929)
,p_chart_id=>wwv_flow_api.id(24183530253668928)
,p_seq=>10
,p_name=>'Motivos de PQR'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sm.id_mtvo',
'     , m.dscrpcion',
'     , count(sm.id_mtvo) ttal',
'     , ''<b>Motivo :</b> '' || m.dscrpcion || ''<br>'' || ',
'       ''<b>Total :</b> '' || count(sm.id_mtvo) || ''<br>'' as dscrpcion_ttal',
'  from pq_g_solicitudes         s',
'  join pq_g_solicitudes_motivo  sm  on sm.id_slctud = s.id_slctud',
'  join pq_d_motivos             m   on m.id_mtvo = sm.id_mtvo     ',
'  where s.cdgo_clnte = :F_CDGO_CLNTE',
'    and trunc(s.fcha_incio) between :P19_FCHA_INCIO and :P19_FCHA_FIN',
'  group by sm.id_mtvo',
'      , m.dscrpcion;'))
,p_ajax_items_to_submit=>'P19_FCHA_INCIO,P19_FCHA_FIN'
,p_items_value_column_name=>'TTAL'
,p_items_label_column_name=>'DSCRPCION'
,p_items_short_desc_column_name=>'DSCRPCION_TTAL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:RP,20:P20_FCHA_INCIO,P20_FCHA_FIN,P20_ID_MTVO:&P19_FCHA_INCIO.,&P19_FCHA_FIN.,&ID_MTVO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(24183752528668930)
,p_chart_id=>wwv_flow_api.id(24183530253668928)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Motivos'
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
 p_id=>wwv_flow_api.id(24183882035668931)
,p_chart_id=>wwv_flow_api.id(24183530253668928)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Cantidad'
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
 p_id=>wwv_flow_api.id(58088900536703763)
,p_plug_name=>'Parametros de Busqueda'
,p_parent_plug_id=>wwv_flow_api.id(58088751421703762)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:t-Form--stretchInputs:margin-top-none:margin-bottom-none:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(58088965100703764)
,p_plug_name=>'PQR Total'
,p_parent_plug_id=>wwv_flow_api.id(58088751421703762)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody:t-Form--noPadding:t-Form--stretchInputs:margin-top-sm:margin-left-sm:margin-right-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select count(1) as ttal_pqr',
'   , ''Total PQR'' as title',
'    from pq_g_solicitudes s',
'   where s.cdgo_clnte = :F_CDGO_CLNTE',
'     and trunc(s.fcha_incio) between :P19_FCHA_INCIO and :P19_FCHA_FIN;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_ajax_items_to_submit=>'P19_FCHA_INCIO,P19_FCHA_FIN'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'TTAL_PQR'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TITLE'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(58089284305703767)
,p_name=>'PQR por Tributo'
,p_region_name=>'rxi'
,p_parent_plug_id=>wwv_flow_api.id(58088751421703762)
,p_template=>wwv_flow_api.id(71815592755951563)
,p_display_sequence=>60
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-sm:margin-bottom-md:margin-left-none:margin-right-none'
,p_component_template_options=>'u-colors:t-Cards--compact:t-Cards--4cols:t-Cards--animColorFill'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select b.id_impsto',
'      , b.cdgo_impsto || ''-'' || b.nmbre_impsto as card_title',
'      , decode(a.id_impsto, null, ''#'', apex_util.prepare_url(''f?p=''||:APP_ID||'':20:''||:APP_SESSION||''::NO:20:P20_ID_IMPSTO,P20_FCHA_INCIO,P20_FCHA_FIN:''|| a.id_impsto || '',''|| :P19_FCHA_INCIO || '',''|| :P19_FCHA_FIN   ) ) as card_link ',
'      , nvl(a.ttal, 0) as card_subtext',
'      , dbms_lob.getlength(b.imgen) as card_text ',
'   from df_c_impuestos b ',
'   left join (  ',
'                 select i.id_impsto',
'                      , count(1) ttal',
'                   from pq_g_solicitudes s ',
'                   join pq_g_solicitudes_motivo m       on m.id_slctud = s.id_slctud',
'                   join pq_g_slctdes_mtvo_sjt_impst i   on i.id_slctud_mtvo = m.id_slctud_mtvo  ',
'                  where s.cdgo_clnte = :F_CDGO_CLNTE',
'                    and trunc(s.fcha_incio) between :P19_FCHA_INCIO and :P19_FCHA_FIN',
'               group by i.id_impsto',
'              ) a ',
'      on a.id_impsto = b.id_impsto',
'   where b.cdgo_clnte = :F_CDGO_CLNTE',
'order by a.ttal desc;',
' ',
''))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P19_FCHA_INCIO,P19_FCHA_FIN'
,p_query_row_template=>wwv_flow_api.id(71831460632951573)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'No hay datos que mostrar.'
,p_csv_output=>'N'
,p_prn_output=>'Y'
,p_prn_format=>'PDF'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width_units=>'PERCENTAGE'
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
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23864992627715687)
,p_query_column_id=>1
,p_column_alias=>'ID_IMPSTO'
,p_column_display_sequence=>2
,p_column_heading=>'Id Impsto'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23865370115715688)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23865747381715688)
,p_query_column_id=>3
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>5
,p_column_heading=>'Card Link'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23866191085715688)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>4
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23866516584715688)
,p_query_column_id=>5
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_column_format=>'IMAGE:DF_C_IMPUESTOS:IMGEN:ID_IMPSTO::FILE_MIMETYPE:FILE_NAME:::::'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76399086239647565)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
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
 p_id=>wwv_flow_api.id(76399294932647567)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
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
unistr('  Funcionalidad que permite observar el comportamiento de las PQR\00B4S en un rango de fechas: <br/><br/>'),
'  <b>1.</b> Muestra el total de PQR.<br><br>',
unistr(' <b>2.</b> Tarjetas de PQR\00B4S por Tributo: muestra la cantidad de PQR discriminadas por tributo, al hacer clic sobre la tarjeta muestra el detalle de las PQR\00B4S del tributo seleccionado.<br/><br />'),
unistr('  <b>3.</b> Gr\00E1fica de Comportamiento por Motivo: muestra el desglose del total de PQR Vs el motivo de la misma, de acuerdo con el rango de fecha seleccionada, al hacer clic sobre la barra del motivo en el gr\00E1fico se muestra una ventana con el detall')
||'e del motivo seleccionado.<br/><br/>',
unistr('  <b>4.</b> Gr\00E1fica de Comportamiento por Estado: muestra el porcentaje del estado de las PQR''S, al hacer clic en el estado la gr\00E1fica circular muestra en la gr\00E1fica de barras la cantidad de tipos de PQR''S que se encuentran en el estado seleccionado,')
||unistr(' adicionalmente, al hacer clic sobre la barra de Tipos de PQR por Estado se muestra una ventana con el detalle de las PQR\00B4S. <br><br>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23872358550715703)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(76399086239647565)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=50000:115:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23863502723715683)
,p_name=>'P19_FCHA_INCIO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(58088900536703763)
,p_item_default=>'''01-'' || to_char( systimestamp , ''MM/YYYY'' )'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Inicio:'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>18
,p_field_template=>wwv_flow_api.id(71867060529951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23863938914715685)
,p_name=>'P19_FCHA_FIN'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(58088900536703763)
,p_item_default=>'to_char( last_day(sysdate) , ''DD/MM/YYYY'' )'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Fin:'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>18
,p_field_template=>wwv_flow_api.id(71867060529951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P19_FCHA_INCIO.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24181706759668910)
,p_name=>'P19_ID_ESTDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(24181080023668903)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23876838163715729)
,p_name=>'Al_Cambiar_Fecha_Fin'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19_FCHA_FIN'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23879358344715731)
,p_event_id=>wwv_flow_api.id(23876838163715729)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(58088965100703764)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23877831167715730)
,p_event_id=>wwv_flow_api.id(23876838163715729)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(58089284305703767)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24184004667668933)
,p_event_id=>wwv_flow_api.id(23876838163715729)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(24183057532668923)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24184257883668935)
,p_event_id=>wwv_flow_api.id(23876838163715729)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(24181080023668903)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23878307169715730)
,p_event_id=>wwv_flow_api.id(23876838163715729)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(90845933516391875)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23878837742715730)
,p_event_id=>wwv_flow_api.id(23876838163715729)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'setTimeout( function(){tooltipRXI();} , 1000 ) '
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23909446955839501)
,p_name=>'Al Cambiar Fecha Inicio'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19_FCHA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23873927279715717)
,p_event_id=>wwv_flow_api.id(23909446955839501)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P19_FCHA_FIN").datepicker( ''option'' , ''minDate'' , $("#P19_FCHA_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23874465029715720)
,p_event_id=>wwv_flow_api.id(23909446955839501)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(58088965100703764)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23875452541715722)
,p_event_id=>wwv_flow_api.id(23909446955839501)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(58089284305703767)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23875929824715728)
,p_event_id=>wwv_flow_api.id(23909446955839501)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(90845933516391875)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24181564748668908)
,p_event_id=>wwv_flow_api.id(23909446955839501)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(24181080023668903)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24181637557668909)
,p_event_id=>wwv_flow_api.id(23909446955839501)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(24181080023668903)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24183903340668932)
,p_event_id=>wwv_flow_api.id(23909446955839501)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(24183057532668923)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23876456770715729)
,p_event_id=>wwv_flow_api.id(23909446955839501)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'setTimeout( function(){tooltipRXI();} , 1000 ) '
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(24181866904668911)
,p_name=>'al cambiar el estado '
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19_ID_ESTDO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24181911876668912)
,p_event_id=>wwv_flow_api.id(24181866904668911)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P19_ID_ESTDO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24182103699668914)
,p_event_id=>wwv_flow_api.id(24181866904668911)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(90845933516391875)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23873070409715712)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>unistr('Limpiar Sesi\00F3n')
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
