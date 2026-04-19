prompt --application/pages/page_00108
begin
wwv_flow_api.create_page(
 p_id=>108
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Panel de Control Medidas Cautelares'
,p_step_title=>'Panel de Control Medidas Cautelares'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-BadgeList-value {',
'	    font-size: 15px !important;',
'}',
'.t-BadgeList-label--top {',
'    font-size: 15px !important;',
'    font-weight: 450 !important;',
'}',
'',
'#rx4 polygon{',
'    stroke: #309fdb;',
'    stroke-width: 2px;',
'}',
'',
'#rx1 polygon{',
'    stroke: #0CEDB5;',
'    stroke-width: 2px;',
'}',
'',
'#rx2 polygon{',
'    stroke: #309fdb;',
'    stroke-width: 2px;',
'}',
'',
'#rx3 polygon{',
'    stroke: #0CEDB5;',
'    stroke-width: 2px;',
'}',
''))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(17445683081942948)
,p_last_upd_yyyymmddhh24miss=>'20200725113320'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4108275856769901)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122611781668713940)
,p_plug_name=>'Panel de Control'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122611929888713942)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_parent_plug_id=>wwv_flow_api.id(122611781668713940)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122612364448713946)
,p_plug_name=>'Totales'
,p_parent_plug_id=>wwv_flow_api.id(122611781668713940)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4319940395792501)
,p_plug_name=>'Monto embargo Barras'
,p_region_name=>'rx1'
,p_parent_plug_id=>wwv_flow_api.id(122612364448713946)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(4320048523792502)
,p_region_id=>wwv_flow_api.id(4319940395792501)
,p_chart_type=>'bar'
,p_title=>'Total Cartera de Embargos por Tipo de Medida'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
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
 p_id=>wwv_flow_api.id(4320187532792503)
,p_chart_id=>wwv_flow_api.id(4320048523792502)
,p_seq=>10
,p_name=>'Nuevo'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sum((a.vlor_cptal)+a.vlor_intres) as monto, ',
'       b.dscrpcion_tipo_embargo as tipo_embargo, ',
'       trim(to_char(sum((a.vlor_cptal)+a.vlor_intres), ''999G999G999G999G999G999G990'' )) as tooltip',
'from mc_g_embargos_cartera_detalle a',
'join v_mc_g_embargos_cartera b on b.id_embrgos_crtra = a.id_embrgos_crtra',
'                              and b.cdgo_estdos_crtra in (''E'',''S'')',
'join v_mc_g_embargos_resolucion c on c.id_embrgos_crtra = a.id_embrgos_crtra',
'where b.cdgo_clnte = :F_CDGO_CLNTE',
'and (trunc(c.fcha_acto) between nvl(:P108_FCHA_DSDE, trunc(c.fcha_acto)) and nvl(:P108_FCHA_HSTA, trunc(c.fcha_acto)))',
'group by b.dscrpcion_tipo_embargo;'))
,p_items_value_column_name=>'MONTO'
,p_items_label_column_name=>'TIPO_EMBARGO'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'RGB(12,237,181,0.2)'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(4320252864792504)
,p_chart_id=>wwv_flow_api.id(4320048523792502)
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
 p_id=>wwv_flow_api.id(4320379087792505)
,p_chart_id=>wwv_flow_api.id(4320048523792502)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'currency'
,p_currency=>'COP'
,p_format_scaling=>'million'
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
 p_id=>wwv_flow_api.id(4320509125792507)
,p_plug_name=>'Monto de embargo'
,p_parent_plug_id=>wwv_flow_api.id(122612364448713946)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select trim(to_char(sum((a.vlor_cptal)+a.vlor_intres), ''999G999G999G999G999G999G990'' )) as monto, ',
'       ''Total Cartera en Embargos Activos'' as tipo_embargo',
'from mc_g_embargos_cartera_detalle a',
'join v_mc_g_embargos_cartera b on b.id_embrgos_crtra = a.id_embrgos_crtra',
'                              and b.cdgo_estdos_crtra in (''E'',''S'')',
'join v_mc_g_embargos_resolucion c on c.id_embrgos_crtra = a.id_embrgos_crtra',
'where b.cdgo_clnte = :F_CDGO_CLNTE',
'and (trunc(c.fcha_acto) between nvl(:P108_FCHA_DSDE, trunc(c.fcha_acto)) and nvl(:P108_FCHA_HSTA, trunc(c.fcha_acto)))',
'union all',
'select trim(to_char(sum((a.vlor_cptal)+a.vlor_intres), ''999G999G999G999G999G999G990'' )) as monto, ',
'       ''Total Cartera en embargos Activos de Tipo: ''||b.dscrpcion_tipo_embargo as tipo_embargo',
'from mc_g_embargos_cartera_detalle a',
'join v_mc_g_embargos_cartera b on b.id_embrgos_crtra = a.id_embrgos_crtra',
'                              and b.cdgo_estdos_crtra in (''E'',''S'')',
'join v_mc_g_embargos_resolucion c on c.id_embrgos_crtra = a.id_embrgos_crtra',
'where b.cdgo_clnte = :F_CDGO_CLNTE',
'and (trunc(c.fcha_acto) between nvl(:P108_FCHA_DSDE, trunc(c.fcha_acto)) and nvl(:P108_FCHA_HSTA, trunc(c.fcha_acto)))',
'group by b.dscrpcion_tipo_embargo'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'MONTO'
,p_attribute_05=>'2'
,p_attribute_06=>'L'
,p_attribute_07=>'DOT'
,p_attribute_08=>'N'
,p_attribute_09=>'TIPO_EMBARGO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4321139910792513)
,p_plug_name=>'Monto desembargo Barras'
,p_region_name=>'rx3'
,p_parent_plug_id=>wwv_flow_api.id(122612364448713946)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(4321283141792514)
,p_region_id=>wwv_flow_api.id(4321139910792513)
,p_chart_type=>'bar'
,p_title=>'Total Cartera de Desembargada por Tipo de Medida'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
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
 p_id=>wwv_flow_api.id(4321309886792515)
,p_chart_id=>wwv_flow_api.id(4321283141792514)
,p_seq=>10
,p_name=>'Nuevo'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sum((a.vlor_cptal)+a.vlor_intres) as monto, ',
'       b.dscrpcion_tipo_embargo as tipo_embargo, ',
'       trim(to_char(sum((a.vlor_cptal)+a.vlor_intres), ''999G999G999G999G999G999G990'' )) as tooltip',
'from mc_g_embargos_cartera_detalle a',
'join v_mc_g_embargos_cartera b on b.id_embrgos_crtra = a.id_embrgos_crtra',
'                              and b.cdgo_estdos_crtra in (''D'',''F'')',
'join v_mc_g_embargos_resolucion c on c.id_embrgos_crtra = a.id_embrgos_crtra',
'where b.cdgo_clnte = :F_CDGO_CLNTE',
'and (trunc(c.fcha_acto) between nvl(:P108_FCHA_DSDE, trunc(c.fcha_acto)) and nvl(:P108_FCHA_HSTA, trunc(c.fcha_acto)))',
'group by b.dscrpcion_tipo_embargo;'))
,p_items_value_column_name=>'MONTO'
,p_items_label_column_name=>'TIPO_EMBARGO'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'RGB(12,237,181,0.2)'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(4321432591792516)
,p_chart_id=>wwv_flow_api.id(4321283141792514)
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
 p_id=>wwv_flow_api.id(4321539125792517)
,p_chart_id=>wwv_flow_api.id(4321283141792514)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'currency'
,p_currency=>'COP'
,p_format_scaling=>'million'
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
 p_id=>wwv_flow_api.id(4321684083792518)
,p_plug_name=>'Monto de desembargo'
,p_parent_plug_id=>wwv_flow_api.id(122612364448713946)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select trim(to_char(nvl(sum((a.vlor_cptal)+a.vlor_intres),0), ''999G999G999G999G999G999G990'' )) as monto, ',
'       ''Total Cartera Desembargada'' as tipo_embargo',
'from mc_g_embargos_cartera_detalle a',
'join v_mc_g_embargos_cartera b on b.id_embrgos_crtra = a.id_embrgos_crtra',
'                              and b.cdgo_estdos_crtra in (''D'',''F'')',
'join v_mc_g_embargos_resolucion c on c.id_embrgos_crtra = a.id_embrgos_crtra',
'where b.cdgo_clnte = :F_CDGO_CLNTE',
'and (trunc(c.fcha_acto) between nvl(:P108_FCHA_DSDE, trunc(c.fcha_acto)) and nvl(:P108_FCHA_HSTA, trunc(c.fcha_acto)))',
'union all',
'select trim(to_char(sum((a.vlor_cptal)+a.vlor_intres), ''999G999G999G999G999G999G990'' )) as monto, ',
'       ''Total Cartera Desembargada de Tipo: ''||b.dscrpcion_tipo_embargo as tipo_embargo',
'from mc_g_embargos_cartera_detalle a',
'join v_mc_g_embargos_cartera b on b.id_embrgos_crtra = a.id_embrgos_crtra',
'                              and b.cdgo_estdos_crtra in (''D'',''F'')',
'join v_mc_g_embargos_resolucion c on c.id_embrgos_crtra = a.id_embrgos_crtra',
'where b.cdgo_clnte = :F_CDGO_CLNTE',
'and (trunc(c.fcha_acto) between nvl(:P108_FCHA_DSDE, trunc(c.fcha_acto)) and nvl(:P108_FCHA_HSTA, trunc(c.fcha_acto)))',
'group by b.dscrpcion_tipo_embargo'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'MONTO'
,p_attribute_05=>'2'
,p_attribute_06=>'L'
,p_attribute_07=>'DOT'
,p_attribute_08=>'N'
,p_attribute_09=>'TIPO_EMBARGO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122612519435713948)
,p_plug_name=>'Embargos'
,p_parent_plug_id=>wwv_flow_api.id(122612364448713946)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(a.id_embrgos_rslcion) as valor, ''Total Embargos Activos'' as titulo',
'from mc_g_embargos_resolucion a',
'where (trunc(a.fcha_acto) between nvl(:P108_FCHA_DSDE, trunc(a.fcha_acto)) and nvl(:P108_FCHA_HSTA, trunc(a.fcha_acto)))',
'and exists (select 1',
'                from mc_g_embargos_cartera d',
'               where d.id_embrgos_crtra = a.id_embrgos_crtra',
'                 and d.cdgo_clnte = :F_CDGO_CLNTE)',
'and exists (select 1',
'                from mc_g_solicitudes_y_oficios b',
'                where b.id_embrgos_crtra = a.id_embrgos_crtra',
'                and b.id_embrgos_rslcion = a.id_embrgos_rslcion',
'                and not exists (select 2',
'                                 from mc_g_desembargos_oficio c',
'                                 where c.id_slctd_ofcio = b.id_slctd_ofcio))',
'union all',
'select count(a.id_embrgos_rslcion) as valor, ''Total Embargos Activos con Desembargos Parciales'' as titulo',
'from mc_g_embargos_resolucion a',
'where (trunc(a.fcha_acto) between nvl(:P108_FCHA_DSDE, trunc(a.fcha_acto)) and nvl(:P108_FCHA_HSTA, trunc(a.fcha_acto)))',
'and exists (select 1',
'                from mc_g_embargos_cartera d',
'               where d.id_embrgos_crtra = a.id_embrgos_crtra',
'                 and d.cdgo_clnte = :F_CDGO_CLNTE)',
'and exists (select 1',
'                from mc_g_solicitudes_y_oficios b',
'                where b.id_embrgos_crtra = a.id_embrgos_crtra',
'                and b.id_embrgos_rslcion = a.id_embrgos_rslcion',
'                and not exists (select 2',
'                                 from mc_g_desembargos_oficio c',
'                                 where c.id_slctd_ofcio = b.id_slctd_ofcio))',
'and exists (select 1',
'                from mc_g_solicitudes_y_oficios b',
'                where b.id_embrgos_crtra = a.id_embrgos_crtra',
'                and b.id_embrgos_rslcion = a.id_embrgos_rslcion',
'                and exists (select 2',
'                                 from mc_g_desembargos_oficio c',
'                                 where c.id_slctd_ofcio = b.id_slctd_ofcio))',
'union all',
'select count(a.id_tpos_embrgo) as valor ,''Total Embargos de Tipo: '' ||a.dscrpcion_tipo_embargo as titulo',
'from v_mc_g_embargos_resolucion a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and (trunc(a.fcha_acto) between nvl(:P108_FCHA_DSDE, trunc(a.fcha_acto)) and nvl(:P108_FCHA_HSTA, trunc(a.fcha_acto)))',
'and exists (select 1',
'                from mc_g_solicitudes_y_oficios b',
'                where b.id_embrgos_crtra = a.id_embrgos_crtra',
'                and b.id_embrgos_rslcion = a.id_embrgos_rslcion',
'                and not exists (select 2',
'                                 from mc_g_desembargos_oficio c',
'                                 where c.id_slctd_ofcio = b.id_slctd_ofcio))',
'group by a.dscrpcion_tipo_embargo',
'union all',
'select count(a.id_embrgos_rslcion) as valor, ''Total Embargos Activos con medida de Secuestre'' as titulo',
'from mc_g_embargos_resolucion a',
'where (trunc(a.fcha_acto) between nvl(:P108_FCHA_DSDE, trunc(a.fcha_acto)) and nvl(:P108_FCHA_HSTA, trunc(a.fcha_acto)))',
'and exists (select 1',
'                from mc_g_embargos_cartera d',
'               where d.id_embrgos_crtra = a.id_embrgos_crtra',
'                 and d.cdgo_clnte = :F_CDGO_CLNTE)',
'and exists (select 2',
'                from mc_g_solicitudes_y_oficios b',
'                where b.id_embrgos_crtra = a.id_embrgos_crtra',
'                and b.id_embrgos_rslcion = a.id_embrgos_rslcion',
'                and not exists (select 2',
'                                 from mc_g_desembargos_oficio c',
'                                 where c.id_slctd_ofcio = b.id_slctd_ofcio)',
'                and exists (select 3',
'                              from mc_g_secuestre_gestion d',
'                             where d.id_slctd_ofcio = b.id_slctd_ofcio',
'                               and d.actvo = ''S''))',
'union all',
'select count(a.id_scstre_gstion) as valor, ''Total Secuestres con Diligencia Practicada'' as titulo',
'from mc_g_secuestre_gestion a',
'where a.actvo = ''S''',
'and a.cdgo_clnte = :F_CDGO_CLNTE',
'and (trunc(a.FCHA_SCSTRE) between nvl(:P108_FCHA_DSDE, trunc(a.FCHA_SCSTRE)) and nvl(:P108_FCHA_HSTA, trunc(a.FCHA_SCSTRE)))',
'and exists (select 1',
'                from mc_g_secuestre_diligencia b',
'               where b.id_scstre_gstion = a.id_scstre_gstion)',
'union all',
unistr('select count(a.id_scstre_gstion) as valor, ''Total Secuestres Asociados a un Proceso Jur\00EDdico'' as titulo'),
'from mc_g_secuestre_gestion a',
'where a.actvo = ''S''',
'and a.cdgo_clnte = :F_CDGO_CLNTE',
'and (trunc(a.FCHA_SCSTRE) between nvl(:P108_FCHA_DSDE, trunc(a.FCHA_SCSTRE)) and nvl(:P108_FCHA_HSTA, trunc(a.FCHA_SCSTRE)))',
'and exists (select 1',
'                from mc_g_secuestre_diligencia b',
'               where b.id_scstre_gstion = a.id_scstre_gstion)',
'and exists (select 2',
'              from cb_g_prcsos_jrdco_mdda_ctlr c',
'             where c.id_scstre_gstion = a.id_scstre_gstion)'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALOR'
,p_attribute_05=>'4'
,p_attribute_06=>'L'
,p_attribute_07=>'DOT'
,p_attribute_08=>'N'
,p_attribute_09=>'TITULO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122612686098713949)
,p_plug_name=>'Desembargo'
,p_parent_plug_id=>wwv_flow_api.id(122612364448713946)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(a.id_dsmbrgos_rslcion) as valor, ''Total Desembargos'' as titulo',
'from v_mc_g_desembargos_resolucion a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and (trunc(a.fcha_acto) between nvl(:P108_FCHA_DSDE, trunc(a.fcha_acto)) and nvl(:P108_FCHA_HSTA, trunc(a.fcha_acto)))',
'union all',
'select count(a.cdgo_csal) as valor, ''Total Desembargos por la Causal: ''|| a.dscrpcion_csal as titulo',
'from v_mc_g_desembargos_resolucion a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and (trunc(a.fcha_acto) between nvl(:P108_FCHA_DSDE, trunc(a.fcha_acto)) and nvl(:P108_FCHA_HSTA, trunc(a.fcha_acto)))',
'group by dscrpcion_csal;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALOR'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'DOT'
,p_attribute_08=>'N'
,p_attribute_09=>'TITULO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122611899627713941)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
'Funcionalidad que permite controlar los procesos de las medidas cautelar tal como: Embargos, Desembargos y Secuestres. <br><br>',
unistr('<b>1.</b> Muestra el n\00FAmero de Embargos (activos y desembargados parcialmente), Adem\00E1s de los embargos por tipo, se puede establecer un periodo determinado.<br><br>'),
unistr('<b>2.</b>N\00FAmero de embargos activos con medidas de secuestre<br><br>'),
unistr('<b>3.</b>N\00FAmero de secuestres con diligencia practicada y cuantos est\00E1n asociados a un proceso jur\00EDdico<br><br>'),
unistr('<b>4.</b>N\00FAmero de desembargos, adem\00E1s de la cantidad de desembargos por tipo de causal<br><br>'),
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4320485496792506)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4108275856769901)
,p_button_name=>'btn_regresar'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=50000:115:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(122612299105713945)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(122611929888713942)
,p_button_name=>'btn_cnsultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122612001924713943)
,p_name=>'P108_FCHA_DSDE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(122611929888713942)
,p_prompt=>'Fecha Desde'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122612128352713944)
,p_name=>'P108_FCHA_HSTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(122611929888713942)
,p_prompt=>'Fecha Hasta'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_02=>'&P108_FCHA_DSDE.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(67114568360324301)
,p_name=>'Al cambiar fecha'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P108_FCHA_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67114636579324302)
,p_event_id=>wwv_flow_api.id(67114568360324301)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P108_FCHA_HSTA").datepicker( ''option'' , ''minDate'' , $("#P108_FCHA_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
end;
/
