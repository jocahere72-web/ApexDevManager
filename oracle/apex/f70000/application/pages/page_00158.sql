prompt --application/pages/page_00158
begin
wwv_flow_api.create_page(
 p_id=>158
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Panel de Control de Plusval\00EDa')
,p_step_title=>unistr('Panel de Control de Plusval\00EDa')
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Region-headerItems--title {',
'    text-align: center;',
'}'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20200930165839'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(91888804670348944)
,p_plug_name=>'<b> RECAUDOS POR ACTO POR MES</b>'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--noBorder:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(91889029556348946)
,p_region_id=>wwv_flow_api.id(91888804670348944)
,p_chart_type=>'bar'
,p_height=>'250'
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
,p_show_series_name=>false
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
,p_no_data_found_message=>unistr('No hay ning\00FAn acto seleccionado.')
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(91889126948348947)
,p_chart_id=>wwv_flow_api.id(91889029556348946)
,p_seq=>10
,p_name=>unistr('Variaci\00F3n recaudo por acto por mes')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select  nvl( sum(r.vlor) , 0 ) as v_ttal_rcaudo ',
'        , d.nmbre_impsto_acto',
'        , trim(to_char(r.fcha_rcdo,''Month'')) nmbre_mes',
'        , trim(to_char(r.fcha_rcdo,''MM'')) mes',
'        , ''<b>Recaudado por Acto por Mes </b> <br>'' || ',
'        '' <b>Acto:</b> ''                || d.nmbre_impsto_acto || ''<br>'' || ',
'        '' <b>Mes:</b> ''                 || trim(to_char(r.fcha_rcdo,''Month'')) || ''<br>'' ||',
'        '' <b>Total Liquidaciones:</b> ''       || count(a.id_plsvlia_dtlle) ||''<br>'' || ',
'        '' <b>Valor Total Recaudado:</b> '' || nvl(to_char(sum(b.vlor_ttal_dcmnto), :F_FRMTO_MNDA),0) tooltip',
'    from gi_g_plusvalia_procso_dtlle   a',
'    join gi_g_plusvalia_proceso        p on a.id_prcso_plsvlia = p.id_prcso_plsvlia',
'    join re_g_documentos               b on a.id_dcmnto        = b.id_dcmnto',
'    join re_g_recaudos                 r on b.id_dcmnto        = r.id_orgen  and cdgo_rcdo_orgn_tpo = ''DC''          ',
'    join df_i_impuestos_acto           d on a.id_impsto_acto   = d.id_impsto_acto',
'   where b.cdgo_clnte                 = :F_CDGO_CLNTE',
'     and a.id_impsto_acto             = :P158_ID_IMPSTO_ACTO',
'     and trunc(r.fcha_rcdo)           between :P158_FCHA_INCIAL and :P158_FCHA_FNAL',
'    group by d.nmbre_impsto_acto',
'        , trim(to_char(r.fcha_rcdo,''Month'')) , trim(to_char(r.fcha_rcdo,''MM''))',
'    order by trim(to_char(r.fcha_rcdo,''MM''));'))
,p_ajax_items_to_submit=>'P158_FCHA_INCIAL, P158_FCHA_FNAL,P158_ID_IMPSTO_ACTO'
,p_items_value_column_name=>'V_TTAL_RCAUDO'
,p_group_short_desc_column_name=>'NMBRE_MES'
,p_items_label_column_name=>'NMBRE_MES'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_items_label_css_classes=>'font-size:14px;color:black;font-weight: bold'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(91889383327348949)
,p_chart_id=>wwv_flow_api.id(91889029556348946)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'on'
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
 p_id=>wwv_flow_api.id(91889283645348948)
,p_chart_id=>wwv_flow_api.id(91889029556348946)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(140885758769243148)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(148979373311199794)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(149373940660144047)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'    </b>',
'</h5>',
'<i>',
unistr('Funcionalidad que permite valorar gr\00E1ficamente el comportamiento de la plusval\00EDa, su representaci\00F3n sobre la cartera y la cantidad generada de las mismas.<br><br>  '),
unistr('    <b>1. Liquidaciones Plusval\00EDa </b><br> Muestra las liquidaciones de plusval\00EDa, el total y el valor de las liquidaciones por Acto,teniendo en cuenta si                                                 fueron o no pagadas.<br><br>'),
'    <b>2. Recaudos por Mes</b> Muestra el total el total recaudado por mes<br><br>',
'    <b>3. Liquidaciones por Actos </b> Muestra las liquidaciones por Sub-Tributos, discriminada por Actos.<br><br>',
'    <b>4. Actos Vs Estados </b> Muestra las liquidaciones por Actos, discriminada por estados.<br><br>',
'    ',
unistr('  <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(177406168757897264)
,p_plug_name=>'<b>Resumen</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(177406244440897265)
,p_plug_name=>unistr('<b>Liquidaciones<br>Plusval\00EDa</b>')
,p_parent_plug_id=>wwv_flow_api.id(177406168757897264)
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(91029845399854265)
,p_region_id=>wwv_flow_api.id(177406244440897265)
,p_chart_type=>'dial'
,p_width=>'90'
,p_height=>'100'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_text_type=>'percent'
,p_value_position=>'auto'
,p_value_format_type=>'percent'
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
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_indicator_size=>3
,p_gauge_inner_radius=>.8
,p_gauge_plot_area=>'on'
,p_gauge_start_angle=>90
,p_gauge_angle_extent=>360
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(91030392282854272)
,p_chart_id=>wwv_flow_api.id(91029845399854265)
,p_seq=>10
,p_name=>'Aprobadas'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select count(a.id_plsvlia_dtlle) vlor_mxmo ',
'        , to_number(:P158_TTAL_PLSVLIA_LQD) cntdad',
unistr('        , ''<b>Plusval\00EDa Liquidadas</b> <br>'' || '),
unistr('          '' <b>Total Plusval\00EDa:</b> ''            || to_number(:P158_TTAL_PLSVLIA_LQD) ||''<br>''  || '),
unistr('          '' <b>Valor Total Plusval\00EDa:</b> ''  || to_char(sum(b.vlor_ttal_dcmnto), :F_FRMTO_MNDA)  ||''<br>'''),
'         tooltip',
'    from gi_g_plusvalia_procso_dtlle   a',
'    join gi_g_plusvalia_proceso        p on a.id_prcso_plsvlia = p.id_prcso_plsvlia',
'    left join re_g_documentos          b on a.id_dcmnto    = b.id_dcmnto',
'                                            and trunc(b.fcha_dcmnto)   between :P158_FCHA_INCIAL and :P158_FCHA_FNAL',
'   where p.cdgo_clnte                  = :F_CDGO_CLNTE'))
,p_items_value_column_name=>'CNTDAD'
,p_items_max_value=>'VLOR_MXMO'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_custom_column_name=>'CNTDAD'
,p_color=>'#FFEA00'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(177406693749897270)
,p_plug_name=>'<b>Valor Recaudado <br><i>&P158_VLOR_RCDDO.</i></b>'
,p_parent_plug_id=>wwv_flow_api.id(177406168757897264)
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(91031246758854278)
,p_region_id=>wwv_flow_api.id(177406693749897270)
,p_chart_type=>'dial'
,p_width=>'90'
,p_height=>'100'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_text_type=>'percent'
,p_value_position=>'auto'
,p_value_format_type=>'percent'
,p_value_decimal_places=>2
,p_value_format_scaling=>'none'
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
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_indicator_size=>3
,p_gauge_inner_radius=>.8
,p_gauge_plot_area=>'on'
,p_gauge_start_angle=>90
,p_gauge_angle_extent=>360
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(91031776401854278)
,p_chart_id=>wwv_flow_api.id(91031246758854278)
,p_seq=>10
,p_name=>'Recaudo_LIQ'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select sum(b.vlor_ttal_dcmnto)      ttal ',
'        , to_number(:P158_TTAL_RCDO_PLSVLIA_LQD) vlor_mxmo',
'        , ''<b>Recaudo</b> <br>'' || ',
unistr('          '' <b>Total Plusval\00EDa pagada:</b> ''            || count(a.id_plsvlia_dtlle)||''<br>''  || '),
unistr('          '' <b>Recaudo de Plusval\00EDa liquidada:</b> ''  || to_char(sum(b.vlor_ttal_dcmnto), :F_FRMTO_MNDA)  ||''<br>'''),
'         tooltip',
'    from gi_g_plusvalia_procso_dtlle   a',
'    join gi_g_plusvalia_proceso        p on a.id_prcso_plsvlia = p.id_prcso_plsvlia',
'    join re_g_documentos               b on a.id_dcmnto    = b.id_dcmnto',
'   where p.cdgo_clnte                  = :F_CDGO_CLNTE',
'     and trunc(b.fcha_dcmnto)   between :P158_FCHA_INCIAL and :P158_FCHA_FNAL',
'     and INDCDOR_PGO_APLCDO = ''S'''))
,p_items_value_column_name=>'TTAL'
,p_items_max_value=>'VLOR_MXMO'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'#3589E3'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(177407279326897275)
,p_plug_name=>'<b>Valor Pendiente por recaudar<br> <i>&P158_VLOR_POR_RCDDO.</i></b>'
,p_parent_plug_id=>wwv_flow_api.id(177406168757897264)
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(91033029597854280)
,p_region_id=>wwv_flow_api.id(177407279326897275)
,p_chart_type=>'dial'
,p_width=>'90'
,p_height=>'100'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_text_type=>'percent'
,p_value_position=>'auto'
,p_value_format_type=>'percent'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
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
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_indicator_size=>3
,p_gauge_inner_radius=>.8
,p_gauge_plot_area=>'on'
,p_gauge_start_angle=>90
,p_gauge_angle_extent=>360
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(91033516785854280)
,p_chart_id=>wwv_flow_api.id(91033029597854280)
,p_seq=>10
,p_name=>'Recaudo_pendiente'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select sum(b.vlor_ttal_dcmnto)      ttal ',
'        , to_number(:P158_TTAL_RCDO_PLSVLIA_LQD) vlor_mxmo',
'        , ''<b>Recaudo</b> <br>'' || ',
unistr('          '' <b>Total Plusval\00EDa pagada:</b> ''            || count(a.id_plsvlia_dtlle)||''<br>''  || '),
unistr('          '' <b>Recaudo de Plusval\00EDa liquidada:</b> ''  || to_char(sum(b.vlor_ttal_dcmnto), :F_FRMTO_MNDA)  ||''<br>'''),
'         tooltip',
'    from gi_g_plusvalia_procso_dtlle   a',
'    join gi_g_plusvalia_proceso        p on a.id_prcso_plsvlia = p.id_prcso_plsvlia',
'    join re_g_documentos               b on a.id_dcmnto    = b.id_dcmnto',
'   where p.cdgo_clnte                  = :F_CDGO_CLNTE',
'     and trunc(b.fcha_dcmnto)   between :P158_FCHA_INCIAL and :P158_FCHA_FNAL',
'     and INDCDOR_PGO_APLCDO = ''N''	  '))
,p_items_value_column_name=>'TTAL'
,p_items_max_value=>'VLOR_MXMO'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'#E01234'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(177600821929513773)
,p_plug_name=>'<b>LIQUIDACIONES POR ACTOS</b>'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--noBorder:t-Region--hiddenOverflow'
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
 p_id=>wwv_flow_api.id(91044710427854332)
,p_region_id=>wwv_flow_api.id(177600821929513773)
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
,p_value_min=>0
,p_value_position=>'auto'
,p_value_format_type=>'percent'
,p_value_decimal_places=>2
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
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ){',
'    // Add new 3D effect to existing chart style defaults   ',
'    options.styleDefaults = $.extend( options.styleDefaults, {threeDEffect: "on"});',
'    return options;',
'}'))
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(91045226606854333)
,p_chart_id=>wwv_flow_api.id(91044710427854332)
,p_seq=>10
,p_name=>'Tipos de Actos'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select count(a.id_plsvlia_dtlle) ',
'           , d.id_impsto_acto',
'           , d.nmbre_impsto_acto',
'           , round((count(a.id_plsvlia_dtlle) / sum(count(a.id_plsvlia_dtlle)) over ()),2) porc',
'           , ''<b>Liquidaciones Por Tipos de actos </b> <br>'' || ',
'             '' <b>Acto:</b> ''                  || d.nmbre_impsto_acto || ''<br>'' || ',
unistr('             '' <b>Total Plusval\00EDa:</b> ''       || count(a.id_plsvlia_dtlle) ||''<br>'' || '),
unistr('             '' <b>Valor Total Plusval\00EDa:</b> '' || to_char(sum(b.vlor_ttal_dcmnto), :F_FRMTO_MNDA)  tooltip'),
'    from gi_g_plusvalia_procso_dtlle   a',
'    join gi_g_plusvalia_proceso        p on a.id_prcso_plsvlia = p.id_prcso_plsvlia',
'    join re_g_documentos               b on a.id_dcmnto        = b.id_dcmnto',
'    join re_g_recaudos                 r on b.id_dcmnto        = r.id_orgen  and cdgo_rcdo_orgn_tpo = ''DC''          ',
'    join df_i_impuestos_acto           d on a.id_impsto_acto   = d.id_impsto_acto',
'   where p.cdgo_clnte                  = :F_CDGO_CLNTE',
'     and trunc(r.fcha_rcdo)   between :P158_FCHA_INCIAL and :P158_FCHA_FNAL',
'     and INDCDOR_PGO_APLCDO = ''S''',
'    group by d.id_impsto_acto',
'        , d.nmbre_impsto_acto ;'))
,p_series_name_column_name=>'ID_IMPSTO_ACTO'
,p_items_value_column_name=>'COUNT(A.ID_PLSVLIA_DTLLE)'
,p_items_label_column_name=>'NMBRE_IMPSTO_ACTO'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'PERCENT'
,p_items_label_css_classes=>'font-size:14px;font-weight: bold'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P158_ID_IMPSTO_ACTO'',&ID_IMPSTO_ACTO.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(177601360695513778)
,p_plug_name=>'<b> RECAUDOS POR MES</b>'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--noBorder:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(91046947427854334)
,p_region_id=>wwv_flow_api.id(177601360695513778)
,p_chart_type=>'lineWithArea'
,p_height=>'350'
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
,p_no_data_found_message=>unistr('No hay ning\00FAn acto seleccionado.')
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(91048580006854346)
,p_chart_id=>wwv_flow_api.id(91046947427854334)
,p_seq=>10
,p_name=>unistr('Variaci\00F3n recaudo por mes')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select nvl( sum(r.vlor) , 0 ) as v_ttal_rcaudo',
'        , trim(to_char(r.fcha_rcdo,''Month'')) nmbre_mes',
'        , ''<b>Recaudado por Mes </b> <br>'' || ',
'          '' <b>Mes:</b> ''                 || trim(to_char(r.fcha_rcdo,''Month'')) || ''<br>'' ||',
'          '' <b>Valor Total Recaudo:</b> '' || nvl(to_char(sum(r.vlor), :F_FRMTO_MNDA),0) tooltip',
'    from gi_g_plusvalia_procso_dtlle   a',
'    join gi_g_plusvalia_proceso        p on a.id_prcso_plsvlia = p.id_prcso_plsvlia',
'    join re_g_documentos               b on a.id_dcmnto        = b.id_dcmnto',
'    join re_g_recaudos                 r on b.id_dcmnto        = r.id_orgen  and cdgo_rcdo_orgn_tpo = ''DC''          ',
'    join df_i_impuestos_acto           d on a.id_impsto_acto   = d.id_impsto_acto',
'   where b.cdgo_clnte                 = :F_CDGO_CLNTE',
'     --and a.id_impsto_acto             = :P158_ID_IMPSTO_ACTO',
'     and trunc(r.fcha_rcdo)           between :P158_FCHA_INCIAL and :P158_FCHA_FNAL',
'    group by trim(to_char(r.fcha_rcdo,''Month'')) , trim(to_char(r.fcha_rcdo,''MM''))',
'    order by trim(to_char(r.fcha_rcdo,''MM''));            ',
'    '))
,p_ajax_items_to_submit=>'P158_FCHA_INCIAL, P158_FCHA_FNAL'
,p_items_value_column_name=>'V_TTAL_RCAUDO'
,p_group_short_desc_column_name=>'NMBRE_MES'
,p_items_label_column_name=>'NMBRE_MES'
,p_items_short_desc_column_name=>'TOOLTIP'
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
 p_id=>wwv_flow_api.id(91047485527854334)
,p_chart_id=>wwv_flow_api.id(91046947427854334)
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
 p_id=>wwv_flow_api.id(91047963016854346)
,p_chart_id=>wwv_flow_api.id(91046947427854334)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'on'
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
 p_id=>wwv_flow_api.id(177754224992945579)
,p_plug_name=>unistr('<b>LIQUIDACIONES PLUSVAL\00CDA</b>')
,p_region_name=>'stackCategoryChartAprobadas'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--noBorder:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select m.srie',
'        , m.indcdor_pgo_aplcdo',
'        , m.clor',
'        , m.id_impsto_acto',
'        , n.nmbre_impsto_acto',
'        , m.cntdad_ttal_acto',
'        , m.ttal_plsvlia ',
'        , m.vlor_ttal_pagar_plsvlia',
'        , (m.ttal_plsvlia / m.cntdad_ttal_acto) prcntje',
'        , m.vlor_ttal_pagar',
unistr('        , ''<b>Plusval\00EDa - ''     || m.srie                   || '' </b> <br>'' '),
'        ||'' <b>Acto:</b> ''               || n.nmbre_impsto_acto   || ''<br>'' ',
unistr('        ||'' <b>Total Plusval\00EDa:</b> ''       || m.ttal_plsvlia             || '' ['' || round((m.ttal_plsvlia / m.cntdad_ttal_acto)* 100,2) || ''%]<br>'' '),
unistr('        ||'' <b>Valor Total Plusval\00EDa:</b> '' || to_char(m.vlor_ttal_pagar_plsvlia, :F_FRMTO_MNDA) '),
'         tooltip',
'     from (select ''PAGADAS'' srie',
'                , ''S'' indcdor_pgo_aplcdo',
'                , ''#B0DEA6'' clor',
'                , x.id_impsto_acto',
'                , count(x.id_plsvlia_dtlle)                  cntdad_ttal_acto',
'				, (select count(a.id_plsvlia_dtlle)',
'					 from gi_g_plusvalia_procso_dtlle   a',
'					 join gi_g_plusvalia_proceso        p on a.id_prcso_plsvlia = p.id_prcso_plsvlia',
'					 join re_g_documentos               b on a.id_dcmnto    = b.id_dcmnto',
'				    where p.cdgo_clnte                  = :F_CDGO_CLNTE',
'					  and trunc(b.fcha_dcmnto)   between :P158_FCHA_INCIAL and :P158_FCHA_FNAL',
'					  and indcdor_pgo_aplcdo = ''S''',
'                      and a.id_impsto_acto       = x.id_impsto_acto) ttal_plsvlia',
'				, (select sum(b.vlor_ttal_dcmnto)',
'					 from gi_g_plusvalia_procso_dtlle   a',
'					 join gi_g_plusvalia_proceso        p on a.id_prcso_plsvlia = p.id_prcso_plsvlia',
'					 join re_g_documentos               b on a.id_dcmnto    = b.id_dcmnto',
'				    where p.cdgo_clnte                  = :F_CDGO_CLNTE',
'					  and trunc(b.fcha_dcmnto)   between :P158_FCHA_INCIAL and :P158_FCHA_FNAL',
'					  and indcdor_pgo_aplcdo = ''S''',
'                      and a.id_impsto_acto       = x.id_impsto_acto) vlor_ttal_pagar_plsvlia',
'                , sum(z.vlor_ttal_dcmnto)           vlor_ttal_pagar				',
'			 from gi_g_plusvalia_procso_dtlle   x',
'			 join gi_g_plusvalia_proceso        y on x.id_prcso_plsvlia = y.id_prcso_plsvlia',
'			 join re_g_documentos               z on x.id_dcmnto    = z.id_dcmnto',
'			where y.cdgo_clnte                  = :F_CDGO_CLNTE',
'			  and trunc(z.fcha_dcmnto)   between :P158_FCHA_INCIAL and :P158_FCHA_FNAL',
'         group by x.id_impsto_acto',
'		 ',
'        union all',
'        ',
'           select ''NO PAGADAS'' sries',
'                , ''N'' indcdor_pgo_aplcdo',
'                , ''#3589E3'' clor',
'                , x.id_impsto_acto',
'                , count(x.id_plsvlia_dtlle)                  cntdad_ttal_sbmpsto',
'				, (select count(a.id_plsvlia_dtlle)',
'					 from gi_g_plusvalia_procso_dtlle   a',
'					 join gi_g_plusvalia_proceso        p on a.id_prcso_plsvlia = p.id_prcso_plsvlia',
'					 join re_g_documentos               b on a.id_dcmnto    = b.id_dcmnto',
'				    where p.cdgo_clnte                  = :F_CDGO_CLNTE',
'					  and trunc(b.fcha_dcmnto)   between :P158_FCHA_INCIAL and :P158_FCHA_FNAL',
'					  and indcdor_pgo_aplcdo = ''N''',
'                      and a.id_impsto_acto       = x.id_impsto_acto) ttal_plsvlia',
'				, (select sum(b.vlor_ttal_dcmnto)',
'					 from gi_g_plusvalia_procso_dtlle   a',
'					 join gi_g_plusvalia_proceso        p on a.id_prcso_plsvlia = p.id_prcso_plsvlia',
'					 join re_g_documentos               b on a.id_dcmnto    = b.id_dcmnto',
'				    where p.cdgo_clnte                  = :F_CDGO_CLNTE',
'					  and trunc(b.fcha_dcmnto)   between :P158_FCHA_INCIAL and :P158_FCHA_FNAL',
'					  and indcdor_pgo_aplcdo = ''N''',
'                      and a.id_impsto_acto       = x.id_impsto_acto) vlor_ttal_pagar_plsvlia',
'                , sum(z.vlor_ttal_dcmnto)           vlor_ttal_pagar				',
'			 from gi_g_plusvalia_procso_dtlle   x',
'			 join gi_g_plusvalia_proceso        y on x.id_prcso_plsvlia = y.id_prcso_plsvlia',
'			 join re_g_documentos               z on x.id_dcmnto    = z.id_dcmnto',
'			where y.cdgo_clnte                  = :F_CDGO_CLNTE',
'			  and trunc(z.fcha_dcmnto)   between :P158_FCHA_INCIAL and :P158_FCHA_FNAL',
'         group by x.id_impsto_acto',
'               ) m',
'     join df_i_impuestos_acto  n on m.id_impsto_acto    = n.id_impsto_acto;',
'  '))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(91049827863854351)
,p_region_id=>wwv_flow_api.id(177754224992945579)
,p_chart_type=>'bar'
,p_height=>'300'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withoutRescale'
,p_hover_behavior=>'none'
,p_stack=>'on'
,p_stack_label=>'on'
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
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
end;
/
begin
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(91051575810854352)
,p_chart_id=>wwv_flow_api.id(91049827863854351)
,p_seq=>10
,p_name=>unistr('Plusval\00EDa')
,p_location=>'REGION_SOURCE'
,p_series_name_column_name=>'SRIE'
,p_items_value_column_name=>'PRCNTJE'
,p_items_label_column_name=>'NMBRE_IMPSTO_ACTO'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'&CLOR.'
,p_assigned_to_y2=>'off'
,p_stack_category=>'stack_pagada'
,p_items_label_rendered=>true
,p_items_label_position=>'insideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_items_label_css_classes=>'font-size:14px;color:white;'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(91050355915854351)
,p_chart_id=>wwv_flow_api.id(91049827863854351)
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
 p_id=>wwv_flow_api.id(91050974260854352)
,p_chart_id=>wwv_flow_api.id(91049827863854351)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Liquidaciones'
,p_min=>0
,p_max=>1
,p_format_type=>'percent'
,p_decimal_places=>2
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(91028039111854256)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(148979373311199794)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(91025600477854195)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(140885758769243148)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(91052596908854353)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(177754224992945579)
,p_button_name=>'BTN_STACK_CHART_APROBADAS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Apilar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-bar-chart-horizontal'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(91052998973854353)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(177754224992945579)
,p_button_name=>'BTN_UNSTACK_CHART_APROBADAS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Desapilar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-bar-chart'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(91053336363854353)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(177754224992945579)
,p_button_name=>'BTN_HORZONTAL_APROBADAS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103612327707757)
,p_button_image_alt=>'Horizontal'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-bar-chart-horizontal'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(91052102842854353)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(177754224992945579)
,p_button_name=>'BTN_VERTICAL_APROBADAS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103612327707757)
,p_button_image_alt=>'Vertical'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-bar-chart'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91026048212854219)
,p_name=>'P158_FCHA_INCIAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(140885758769243148)
,p_item_default=>'''01/''|| to_char( sysdate , ''MM/YYYY'' )'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'<b>Fecha Inicial</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>11
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00EDnima del registro de las rentas liquidadas, para mostrar las estad\00EDsticas que as\00ED lo requieran.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91026891849854250)
,p_name=>'P158_FCHA_FNAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(140885758769243148)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'<b>Fecha Final</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>11
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00E1xima del registro de las rentas liquidadas, para mostrar las estad\00EDsticas que as\00ED lo requieran.')
,p_attribute_02=>'&P158_FCHA_INCIAL.'
,p_attribute_03=>'+1d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91028751975854259)
,p_name=>'P158_TTAL_PLSVLIA_LQD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(177406168757897264)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91029149792854262)
,p_name=>'P158_TTAL_RCDO_PLSVLIA_LQD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(177406168757897264)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91032300147854279)
,p_name=>'P158_VLOR_RCDDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(177406693749897270)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(sum(b.vlor_ttal_dcmnto), :F_FRMTO_MNDA)',
'    from gi_g_plusvalia_procso_dtlle   a',
'    join gi_g_plusvalia_proceso        p on a.id_prcso_plsvlia = p.id_prcso_plsvlia',
'    join re_g_documentos               b on a.id_dcmnto    = b.id_dcmnto',
'   where p.cdgo_clnte                  = :F_CDGO_CLNTE',
'     and trunc(b.fcha_dcmnto)   between :P158_FCHA_INCIAL and :P158_FCHA_FNAL',
'     and INDCDOR_PGO_APLCDO = ''S'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91034189124854282)
,p_name=>'P158_VLOR_POR_RCDDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(177407279326897275)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(sum(b.vlor_ttal_dcmnto), :F_FRMTO_MNDA) ',
'    from gi_g_plusvalia_procso_dtlle   a',
'    join gi_g_plusvalia_proceso        p on a.id_prcso_plsvlia = p.id_prcso_plsvlia',
'    join re_g_documentos               b on a.id_dcmnto    = b.id_dcmnto',
'   where p.cdgo_clnte                  = :F_CDGO_CLNTE',
'     and trunc(b.fcha_dcmnto)   between :P158_FCHA_INCIAL and :P158_FCHA_FNAL',
'     and INDCDOR_PGO_APLCDO = ''N'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91046245306854334)
,p_name=>'P158_ID_IMPSTO_ACTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(177600821929513773)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91888949586348945)
,p_name=>'P158_NMBR_ACTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(91888804670348944)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(91053844508854369)
,p_computation_sequence=>10
,p_computation_item=>'P158_FCHA_INCIAL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation=>'''01/''|| to_char( sysdate , ''MM/YYYY'' )'
,p_compute_when=>'P158_FCHA_INCIAL'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(91054219076854375)
,p_computation_sequence=>20
,p_computation_item=>'P158_FCHA_FNAL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation=>'sysdate'
,p_compute_when=>'P158_FCHA_FNAL'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(91054651492854375)
,p_computation_sequence=>30
,p_computation_item=>'P158_TTAL_PLSVLIA_LQD'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(a.id_plsvlia_dtlle) cntdad',
'  from gi_g_plusvalia_procso_dtlle   a',
'  join gi_g_plusvalia_proceso        p on a.id_prcso_plsvlia = p.id_prcso_plsvlia',
'  join re_g_documentos          b on a.id_dcmnto        = b.id_dcmnto',
' where p.cdgo_clnte                  = :F_CDGO_CLNTE',
'   and trunc(b.fcha_dcmnto) between :P158_FCHA_INCIAL and :P158_FCHA_FNAL'))
,p_compute_when=>'P158_FCHA_FNAL'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(91055079856854376)
,p_computation_sequence=>40
,p_computation_item=>'P158_TTAL_RCDO_PLSVLIA_LQD'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sum(b.vlor_ttal_dcmnto) ttal  ',
'  from gi_g_plusvalia_procso_dtlle   a',
'  join gi_g_plusvalia_proceso        p on a.id_prcso_plsvlia = p.id_prcso_plsvlia',
'  join re_g_documentos               b on a.id_dcmnto        = b.id_dcmnto',
' where p.cdgo_clnte                  = :F_CDGO_CLNTE',
'   and trunc(b.fcha_dcmnto) between :P158_FCHA_INCIAL and :P158_FCHA_FNAL'))
,p_compute_when=>'P158_FCHA_FNAL'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91055318290854376)
,p_name=>'Al Cambiar la Fecha Inicial'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P158_FCHA_INCIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91055874674854387)
,p_event_id=>wwv_flow_api.id(91055318290854376)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P158_FCHA_FNAL").datepicker( ''option'' , ''minDate'' , $("#P158_FCHA_INCIAL").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91056227843854391)
,p_name=>'Stack Chart'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(86726073531091404)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91056787544854392)
,p_event_id=>wwv_flow_api.id(91056227843854391)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.region("stackCategoryChart").widget().ojChart({stack: ''on''});'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91057138343854392)
,p_name=>'Stack Chart Aprobadas'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(91052596908854353)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91057635113854392)
,p_event_id=>wwv_flow_api.id(91057138343854392)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.region("stackCategoryChartAprobadas").widget().ojChart({stack: ''on''});'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91058037922854392)
,p_name=>'Unstack Chart'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(86726327428091407)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91058533575854393)
,p_event_id=>wwv_flow_api.id(91058037922854392)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.region("stackCategoryChart").widget().ojChart({stack: ''off''});'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91058943704854393)
,p_name=>'Unstack Chart Aprobadas'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(91052998973854353)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91059428006854393)
,p_event_id=>wwv_flow_api.id(91058943704854393)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.region("stackCategoryChartAprobadas").widget().ojChart({stack: ''off''});'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91059847456854396)
,p_name=>unistr('Gr\00E1fica Horizontal')
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(86726681918091410)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91060352086854396)
,p_event_id=>wwv_flow_api.id(91059847456854396)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.region("stackCategoryChart").widget().ojChart({orientation: ''horizontal''});'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91060745087854396)
,p_name=>unistr('Gr\00E1fica Horizontal Aprobadas')
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(91053336363854353)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91061245818854398)
,p_event_id=>wwv_flow_api.id(91060745087854396)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.region("stackCategoryChartAprobadas").widget().ojChart({orientation: ''horizontal''});'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91061687764854398)
,p_name=>unistr('Gr\00E1fica Vertical')
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(86726728441091411)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91062125685854399)
,p_event_id=>wwv_flow_api.id(91061687764854398)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.region("stackCategoryChart").widget().ojChart({orientation: ''vertical''});'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91062510981854399)
,p_name=>unistr('Gr\00E1fica Vertical Aprobadas')
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(91052102842854353)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91063033549854402)
,p_event_id=>wwv_flow_api.id(91062510981854399)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.region("stackCategoryChartAprobadas").widget().ojChart({orientation: ''vertical''});'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91063431027854402)
,p_name=>'Refrescar Impuesto Acto'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P158_ID_IMPSTO_ACTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91063914089854403)
,p_event_id=>wwv_flow_api.id(91063431027854402)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(177600821929513773)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92930106818349403)
,p_event_id=>wwv_flow_api.id(91063431027854402)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(91888804670348944)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91064369949854404)
,p_name=>'Setear valor acto'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P158_ID_IMPSTO_ACTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91889404673348950)
,p_event_id=>wwv_flow_api.id(91064369949854404)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P158_NMBR_ACTO'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select nmbre_impsto_acto',
'    from df_i_impuestos_acto',
'    where id_impsto_acto  = :P158_ID_IMPSTO_ACTO;'))
,p_attribute_07=>'P158_ID_IMPSTO_ACTO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
