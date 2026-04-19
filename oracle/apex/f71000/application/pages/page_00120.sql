prompt --application/pages/page_00120
begin
wwv_flow_api.create_page(
 p_id=>120
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Panel Control Recaudo'
,p_step_title=>'Panel Control Recaudo'
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
'#rxo polygon{',
'    stroke: #309fdb;',
'    stroke-width: 2px;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20220808182325'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(34226146211988101)
,p_plug_name=>'Panel de Control'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(34226295326988102)
,p_plug_name=>'Parametros de Busqueda'
,p_parent_plug_id=>wwv_flow_api.id(34226146211988101)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:t-Form--stretchInputs:margin-top-none:margin-bottom-none:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>2
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(34226359890988103)
,p_plug_name=>'Recaudo Total'
,p_parent_plug_id=>wwv_flow_api.id(34226146211988101)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody:t-Form--noPadding:t-Form--stretchInputs:margin-top-sm:margin-left-sm:margin-right-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char( nvl( sum(a.vlor) , 0 ) , ''FM$999G999G999G999G999G999G990'' ) as ttal_rcaudo',
'    , ''Total Recaudo'' as title',
' from re_g_recaudos a',
' join re_g_recaudos_control b',
'   on a.id_rcdo_cntrol  = b.id_rcdo_cntrol',
'where b.cdgo_clnte      = :F_CDGO_CLNTE ',
'  and a.cdgo_rcdo_estdo = ''AP''',
'  and trunc(a.fcha_rcdo) between :P120_FCHA_INCIO and :P120_FCHA_FIN'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_ajax_items_to_submit=>'P120_FCHA_INCIO,P120_FCHA_FIN'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'TTAL_RCAUDO'
,p_attribute_04=>'f?p=&APP_ID.:121:&SESSION.::&DEBUG.:RP,121::'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TITLE'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(34226679095988106)
,p_name=>'Recaudo por Tributo'
,p_region_name=>'rxi'
,p_parent_plug_id=>wwv_flow_api.id(34226146211988101)
,p_template=>wwv_flow_api.id(177332998617050607)
,p_display_sequence=>60
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--stacked:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-sm:margin-bottom-md:margin-left-none:margin-right-none'
,p_component_template_options=>'u-colors:t-Cards--compact:t-Cards--4cols:t-Cards--animColorFill'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_impsto',
'      , a.impsto as card_title',
'      , case when a.valor_o = 0 then ''#'' else apex_util.prepare_url(''f?p='' || :APP_ID || '':121:''|| :APP_SESSION || ''::NO:121:P121_ID_IMPSTO:'' || a.id_impsto ) end as card_link ',
'      , a.valor as card_subtext',
'      , dbms_lob.getlength(b.imgen) as card_text',
'   from (  ',
'             select a.id_impsto',
'                  , a.cdgo_impsto || ''-''|| a.nmbre_impsto as impsto',
'                  , to_char( nvl( sum(c.vlor) , 0 ) , ''FM$999G999G999G999G999G999G990'' ) as valor',
'                  , nvl( sum(c.vlor) , 0 ) as valor_o',
'               from df_c_impuestos a',
'          left join re_g_recaudos_control b',
'                 on a.cdgo_clnte      = b.cdgo_clnte ',
'                and a.id_impsto       = b.id_impsto ',
'          left join re_g_recaudos c',
'                 on b.id_rcdo_cntrol  = c.id_rcdo_cntrol',
'                and c.cdgo_rcdo_estdo = ''AP''',
'                and trunc(c.fcha_rcdo) between :P120_FCHA_INCIO and :P120_FCHA_FIN',
'              where a.cdgo_clnte      = :F_CDGO_CLNTE ',
'           group by a.id_impsto',
'                  , a.cdgo_impsto || ''-''|| a.nmbre_impsto',
'                  , a.nmbre_impsto',
'        ) a',
'    join df_c_impuestos b',
'      on a.id_impsto = b.id_impsto',
'     and b.actvo = ''S''',
'order by a.valor_o desc',
''))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P120_FCHA_INCIO,P120_FCHA_FIN'
,p_query_row_template=>wwv_flow_api.id(177340194218050611)
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
 p_id=>wwv_flow_api.id(34751200974366309)
,p_query_column_id=>1
,p_column_alias=>'ID_IMPSTO'
,p_column_display_sequence=>2
,p_column_heading=>'Id Impsto'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(34750999729366306)
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
 p_id=>wwv_flow_api.id(34751684059366313)
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
 p_id=>wwv_flow_api.id(34751552439366312)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>4
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(34751361720366310)
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
 p_id=>wwv_flow_api.id(34700212253369805)
,p_plug_name=>unistr('<b>Variaci\00F3n de Recaudo por D\00EDa</b>')
,p_parent_plug_id=>wwv_flow_api.id(34226146211988101)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--stacked:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(34700368333369806)
,p_region_id=>wwv_flow_api.id(34700212253369805)
,p_chart_type=>'lineWithArea'
,p_height=>'250'
,p_animation_on_display=>'zoom'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'smooth'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_fill_multi_series_gaps=>false
,p_zoom_and_scroll=>'delayed'
,p_initial_zooming=>'none'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'No hay datos que mostrar.'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(34700488151369807)
,p_chart_id=>wwv_flow_api.id(34700368333369806)
,p_seq=>10
,p_name=>unistr('Variaci\00F3n de Recaudo por D\00EDa')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select nvl( sum(a.vlor) , 0 ) as v_ttal_rcaudo',
'        , to_char( a.fcha_rcdo , ''DD/MM/YYYY'' ) as l_fcha_rcdo',
'        , ''<b>Fecha :</b> '' || to_char( a.fcha_rcdo , ''DD/MM/YYYY'') || ''<br>'' || ',
'          ''<b>Total Recaudado:</b> '' || to_char( nvl( sum(a.vlor) , 0 ) , ''FM$999G999G999G999G999G999G990'' ) || ''<br>'' as tooltip ',
'     from re_g_recaudos a',
'     join re_g_recaudos_control b',
'       on a.id_rcdo_cntrol  = b.id_rcdo_cntrol',
'    where b.cdgo_clnte      = :F_CDGO_CLNTE ',
'      and a.cdgo_rcdo_estdo = ''AP''',
'      and trunc(a.fcha_rcdo) between :P120_FCHA_INCIO and :P120_FCHA_FIN',
' group by to_char( a.fcha_rcdo , ''DD/MM/YYYY'')',
'        , trunc(a.fcha_rcdo)',
' order by trunc(a.fcha_rcdo)'))
,p_ajax_items_to_submit=>'P120_FCHA_INCIO,P120_FCHA_FIN'
,p_optimizer_hint=>'/*+ RESULT_CACHE */'
,p_items_value_column_name=>'V_TTAL_RCAUDO'
,p_group_short_desc_column_name=>'L_FCHA_RCDO'
,p_items_label_column_name=>'L_FCHA_RCDO'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:121:&SESSION.::&DEBUG.:RP,121:P121_FCHA_RCDO:&L_FCHA_RCDO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(34700663215369809)
,p_chart_id=>wwv_flow_api.id(34700368333369806)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Recaudo'
,p_format_type=>'currency'
,p_currency=>'COP'
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
 p_id=>wwv_flow_api.id(34700517165369808)
,p_chart_id=>wwv_flow_api.id(34700368333369806)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Dias'
,p_format_type=>'date-short'
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(66983328306676214)
,p_plug_name=>'<i><b>Recaudo por Origen</b></i>'
,p_region_name=>'rxo'
,p_parent_plug_id=>wwv_flow_api.id(34226146211988101)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--stacked:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(35210706392175088)
,p_region_id=>wwv_flow_api.id(66983328306676214)
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
 p_id=>wwv_flow_api.id(35212414975175093)
,p_chart_id=>wwv_flow_api.id(35210706392175088)
,p_seq=>10
,p_name=>'Recaudo por Origen'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'     select a.cdgo_rcdo_orgen',
'          , a.dscrpcion',
'          , nvl( sum(c.vlor) , 0 ) as ttal_rcaudo',
'          , ''<b>Origen :</b> '' || a.dscrpcion || ''<br>'' || ',
'            ''<b>Total Recaudado:</b> '' || to_char( nvl( sum(c.vlor) , 0 ) , ''FM$999G999G999G999G999G999G990'' ) || ''<br>'' as tooltip',
'       from re_d_recaudo_origen a',
'  left join re_g_recaudos_control b',
'         on a.cdgo_rcdo_orgen = b.cdgo_rcdo_orgen',
'        and b.cdgo_clnte      = :F_CDGO_CLNTE ',
'  left join re_g_recaudos c ',
'         on b.id_rcdo_cntrol  = c.id_rcdo_cntrol',
'        and c.cdgo_rcdo_estdo = ''AP''',
'        and trunc(c.fcha_rcdo) between :P120_FCHA_INCIO and :P120_FCHA_FIN',
'   where a.actvo = ''S''',
'   group by a.cdgo_rcdo_orgen',
'          , a.dscrpcion',
'   order by decode( a.cdgo_rcdo_orgen , ''MN'' , 1 , ''AC'' , 2 , ''WS'' , 3 , ''WR'', 4, 5 )'))
,p_ajax_items_to_submit=>'P120_FCHA_INCIO,P120_FCHA_FIN'
,p_optimizer_hint=>'/*+ RESULT_CACHE */'
,p_items_value_column_name=>'TTAL_RCAUDO'
,p_group_short_desc_column_name=>'DSCRPCION'
,p_items_label_column_name=>'DSCRPCION'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'RGBA(48, 159, 219, 0.2)'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:121:&SESSION.::&DEBUG.:RP,121:P121_CDGO_RCDO_ORGEN:&CDGO_RCDO_ORGEN.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(35211826673175092)
,p_chart_id=>wwv_flow_api.id(35210706392175088)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Recaudo'
,p_format_type=>'currency'
,p_currency=>'COP'
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
 p_id=>wwv_flow_api.id(35211230548175089)
,p_chart_id=>wwv_flow_api.id(35210706392175088)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Origen'
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52536481029931904)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
 p_id=>wwv_flow_api.id(52536689722931906)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
unistr('  Funcionalidad que permite observar gr\00E1ficamente el comportamiento de los recaudos en una fecha determinada: <br/><br/>'),
'  <b>1.</b> Total de Recaudos: muestra en pantalla el total recaudado en el rango de fecha seleccionado, al hacer clic sobre el total se muestra el detalle indicado en el punto 5. <br/><br/>',
unistr('  <b>2.</b>Variaci\00F3n de Recaudo por d\00EDa: Permite observar gr\00E1ficamente la cantidad recaudada por d\00EDa, al hacer clic en el d\00EDa que desea consultar, se muestra el detalle indicado en el punto 5.<br/><br/>'),
'  <b>3.</b> Tarjetas de detalle de Recaudo por Tributo: Muestra el monto del recaudo por tributo, al hacer clic en la tarjeta del tributo que desea consultar, se muestra el detalle indicado en el punto 5.<br/><br />',
'  <b>4.</b> Recaudo por Origen: muestra el desglose del valor recaudado Vs el origen del recaudo, al hacer clic sobre la barra del origen del recaudo, se muestra el detalle indicado en el punto 5.<br/><br/>',
unistr('  <b>5.</b> Muestra una ventana que contiene 2 pesta\00F1as, la primera pesta\00F1a de Gr\00E1fico de Recaudo muestra: 1) Distribuci\00F3n de Recaudos de acuerdo con el origen del mismo y 2) Distribuci\00F3n del recaudo por las vigencias seleccionadas. La segunda pesta\00F1')
||unistr('a de Informe muestra: Gr\00E1fica de porcentaje de Recaudo por las entidades bancarias, seguidamente en la parte inferior de la ventana se encuentra el detalle de la pesta\00F1a en que se encuentre activa. <br/><br/>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(52536571049931905)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(52536481029931904)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=50000:115:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(34234135992045645)
,p_name=>'P120_FCHA_INCIO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(34226295326988102)
,p_item_default=>'''01/'' || to_char( sysdate, ''MM/YYYY'' )'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Inicio:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>18
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-04:+00'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(34234908773049341)
,p_name=>'P120_FCHA_FIN'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(34226295326988102)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Fin:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>18
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P120_FCHA_INCIO.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-04:+00'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(34226411877988104)
,p_name=>'Al Cambiar Fecha Inicio'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P120_FCHA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34226559651988105)
,p_event_id=>wwv_flow_api.id(34226411877988104)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P120_FCHA_FIN").datepicker( ''option'' , ''minDate'' , $("#P120_FCHA_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34374804637979806)
,p_event_id=>wwv_flow_api.id(34226411877988104)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(34226359890988103)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34701515591369818)
,p_event_id=>wwv_flow_api.id(34226411877988104)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(34700212253369805)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34701768575369820)
,p_event_id=>wwv_flow_api.id(34226411877988104)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(34226679095988106)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35181909217762210)
,p_event_id=>wwv_flow_api.id(34226411877988104)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(66983328306676214)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(36422799123017304)
,p_event_id=>wwv_flow_api.id(34226411877988104)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'setTimeout( function(){tooltipRXI();} , 1000 ) '
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(34226773093988107)
,p_name=>'Al_Cambiar_Fecha_Fin'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P120_FCHA_FIN'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34226814807988108)
,p_event_id=>wwv_flow_api.id(34226773093988107)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(34226359890988103)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34701497004369817)
,p_event_id=>wwv_flow_api.id(34226773093988107)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(34700212253369805)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34701630492369819)
,p_event_id=>wwv_flow_api.id(34226773093988107)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(34226679095988106)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35182042692762211)
,p_event_id=>wwv_flow_api.id(34226773093988107)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(66983328306676214)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(36422489473017301)
,p_event_id=>wwv_flow_api.id(34226773093988107)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'setTimeout( function(){tooltipRXI();} , 1000 ) '
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(34226942969988109)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>unistr('Limpiar Sesi\00F3n')
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
