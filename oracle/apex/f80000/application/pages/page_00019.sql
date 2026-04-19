prompt --application/pages/page_00019
begin
wwv_flow_api.create_page(
 p_id=>19
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Panel de Control Proceso Jur\00EDdico')
,p_step_title=>unistr('Panel de Control Proceso Jur\00EDdico')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-BadgeList-value {',
'	    font-size: 12px !important;',
'}',
'.t-BadgeList-label--top {',
'    font-size: 22px !important;',
'    font-weight: 500 !important;',
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
 p_id=>wwv_flow_api.id(52181578139614024)
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
 p_id=>wwv_flow_api.id(52179910383614008)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_parent_plug_id=>wwv_flow_api.id(52181578139614024)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52181342306614022)
,p_plug_name=>'Totales'
,p_parent_plug_id=>wwv_flow_api.id(52181578139614024)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52181423147614023)
,p_plug_name=>'Total Procesos'
,p_parent_plug_id=>wwv_flow_api.id(52181342306614022)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(count(1), ''999G999G999G999G999G999G990'' ) mnto_ttal, ',
'         ''Total Procesos'' title',
'    from cb_g_procesos_juridico',
'   where trunc(fcha) ',
' between nvl(:P19_FECHA, trunc(fcha)) ',
'     and nvl(:P19_FECHA_HASTA, trunc(fcha))',
'     and cdgo_clnte = :F_CDGO_CLNTE;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'TITLE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'MNTO_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52181645526614025)
,p_plug_name=>'Total Procesos Detenidos'
,p_parent_plug_id=>wwv_flow_api.id(52181342306614022)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select to_char(count(1), ''999G999G999G999G999G999G990'' ) mnto_ttal, ',
'         ''Total Procesos Detenidos'' title',
'    from cb_g_procesos_juridico',
'   where cdgo_prcsos_jrdco_estdo = ''D''',
'     and trunc(fcha) ',
' between nvl(:P19_FECHA, trunc(fcha)) ',
'     and nvl(:P19_FECHA_HASTA, trunc(fcha))',
'     and cdgo_clnte = :F_CDGO_CLNTE'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'TITLE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'MNTO_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52181726105614026)
,p_plug_name=>'Total Procesos Abiertos'
,p_parent_plug_id=>wwv_flow_api.id(52181342306614022)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select to_char(count(1), ''999G999G999G999G999G999G990'' ) mnto_ttal, ',
'         ''Total Procesos Abiertos'' title',
'    from cb_g_procesos_juridico',
'   where cdgo_prcsos_jrdco_estdo = ''A''',
'     and trunc(fcha) ',
' between nvl(:P19_FECHA, trunc(fcha)) ',
'     and nvl(:P19_FECHA_HASTA, trunc(fcha))',
'     and cdgo_clnte = :F_CDGO_CLNTE'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'TITLE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'MNTO_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52181859691614027)
,p_plug_name=>'Total Procesos Cerrados'
,p_parent_plug_id=>wwv_flow_api.id(52181342306614022)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select to_char(count(1), ''999G999G999G999G999G999G990'' ) mnto_ttal, ',
'         ''Total Procesos Cerrados'' title',
'    from cb_g_procesos_juridico',
'   where cdgo_prcsos_jrdco_estdo = ''C''',
'     and trunc(fcha) ',
' between nvl(:P19_FECHA, trunc(fcha)) ',
'     and nvl(:P19_FECHA_HASTA, trunc(fcha))',
'     and cdgo_clnte = :F_CDGO_CLNTE'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'TITLE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'MNTO_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52183243339614041)
,p_plug_name=>'Total Cartera Procesos'
,p_parent_plug_id=>wwv_flow_api.id(52181342306614022)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(nvl(sum(b.vlor_sldo_cptal+b.vlor_intres),0), ''999G999G999G999G999G999G990'' ) mnto_ttal,',
'       ''Total Cartera Procesos'' title',
'from cb_g_procesos_juridico c',
'join cb_g_procesos_jrdco_mvmnto a on c.id_prcsos_jrdco = a.id_prcsos_jrdco',
'join v_gf_g_cartera_x_concepto b on b.id_sjto_impsto = a.id_sjto_impsto',
'                                   and b.vgncia = a.vgncia',
'                                   and b.id_prdo = a.id_prdo',
'                                   and b.id_cncpto = a.id_cncpto',
'                                   and c.cdgo_clnte = b.cdgo_clnte',
'where c.cdgo_prcsos_jrdco_estdo <> ''ACM''',
'and (trunc(fcha) between nvl(:P19_FECHA, trunc(fcha)) ',
'                    and nvl(:P19_FECHA_HASTA, trunc(fcha)))',
'and c.cdgo_clnte = :F_CDGO_CLNTE'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'TITLE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'MNTO_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52183348030614042)
,p_plug_name=>'Total Cartera Procesos Abiertos'
,p_parent_plug_id=>wwv_flow_api.id(52181342306614022)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(nvl(sum(b.vlor_sldo_cptal+b.vlor_intres),0), ''999G999G999G999G999G999G990'' ) mnto_ttal,',
'       ''Total Cartera Procesos Abiertos'' title',
'from cb_g_procesos_juridico c',
'join cb_g_procesos_jrdco_mvmnto a on c.id_prcsos_jrdco = a.id_prcsos_jrdco',
'join v_gf_g_cartera_x_concepto b on b.id_sjto_impsto = a.id_sjto_impsto',
'                                   and b.vgncia = a.vgncia',
'                                   and b.id_prdo = a.id_prdo',
'                                   and b.id_cncpto = a.id_cncpto',
'                                   and c.cdgo_clnte = b.cdgo_clnte',
'where c.cdgo_prcsos_jrdco_estdo = ''A''',
'and (trunc(fcha) between nvl(:P19_FECHA, trunc(fcha)) ',
'                    and nvl(:P19_FECHA_HASTA, trunc(fcha)))',
'and c.cdgo_clnte = :F_CDGO_CLNTE'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'TITLE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'MNTO_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52183452610614043)
,p_plug_name=>'Total Cartera Procesos Detenidos'
,p_parent_plug_id=>wwv_flow_api.id(52181342306614022)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>90
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(nvl(sum(b.vlor_sldo_cptal+b.vlor_intres),0), ''999G999G999G999G999G999G990'' ) mnto_ttal,',
'       ''Total Cartera Procesos Detenidos'' title',
'from cb_g_procesos_juridico c',
'join cb_g_procesos_jrdco_mvmnto a on c.id_prcsos_jrdco = a.id_prcsos_jrdco',
'join v_gf_g_cartera_x_concepto b on b.id_sjto_impsto = a.id_sjto_impsto',
'                                   and b.vgncia = a.vgncia',
'                                   and b.id_prdo = a.id_prdo',
'                                   and b.id_cncpto = a.id_cncpto',
'                                   and c.cdgo_clnte = b.cdgo_clnte',
'where c.cdgo_prcsos_jrdco_estdo = ''D''',
'and (trunc(fcha) between nvl(:P19_FECHA, trunc(fcha)) ',
'                    and nvl(:P19_FECHA_HASTA, trunc(fcha)))',
'and c.cdgo_clnte = :F_CDGO_CLNTE'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'TITLE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'MNTO_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52183503235614044)
,p_plug_name=>'Total Cartera Procesos Cerrados'
,p_parent_plug_id=>wwv_flow_api.id(52181342306614022)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>100
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(nvl(sum(b.vlor_sldo_cptal+b.vlor_intres),0), ''999G999G999G999G999G999G990'' ) mnto_ttal,',
'       ''Total Cartera Procesos Cerrados'' title',
'from cb_g_procesos_juridico c',
'join cb_g_procesos_jrdco_mvmnto a on c.id_prcsos_jrdco = a.id_prcsos_jrdco',
'join v_gf_g_cartera_x_concepto b on b.id_sjto_impsto = a.id_sjto_impsto',
'                                   and b.vgncia = a.vgncia',
'                                   and b.id_prdo = a.id_prdo',
'                                   and b.id_cncpto = a.id_cncpto',
'                                   and c.cdgo_clnte = b.cdgo_clnte',
'where c.cdgo_prcsos_jrdco_estdo = ''C''',
'and (trunc(fcha) between nvl(:P19_FECHA, trunc(fcha)) ',
'                    and nvl(:P19_FECHA_HASTA, trunc(fcha)))',
'and c.cdgo_clnte = :F_CDGO_CLNTE'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'TITLE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'MNTO_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122611514193713938)
,p_plug_name=>'Total Procesos Acumulados'
,p_parent_plug_id=>wwv_flow_api.id(52181342306614022)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select to_char(count(1), ''999G999G999G999G999G999G990'' ) mnto_ttal, ',
'         ''Total Procesos Acumulados'' title',
'    from cb_g_procesos_juridico',
'   where cdgo_prcsos_jrdco_estdo = ''ACM''',
'     and (trunc(fcha) ',
' between nvl(:P19_FECHA, trunc(fcha)) ',
'     and nvl(:P19_FECHA_HASTA, trunc(fcha)))',
'     and cdgo_clnte = :F_CDGO_CLNTE'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'TITLE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'MNTO_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52182004667614029)
,p_plug_name=>unistr('Total Etapas Procesos Jur\00EDdicos')
,p_region_name=>'rx4'
,p_parent_plug_id=>wwv_flow_api.id(52181578139614024)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(52182194823614030)
,p_region_id=>wwv_flow_api.id(52182004667614029)
,p_chart_type=>'pie'
,p_title=>unistr('N\00FAmero de Procesos Jur\00EDdicos por Etapa')
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'dim'
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
,p_legend_position=>'start'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlightAndExplode'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(52182208921614031)
,p_chart_id=>wwv_flow_api.id(52182194823614030)
,p_seq=>10
,p_name=>unistr('Total Procesos Jur\00EDdicos Por Etapa')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select count(1) cntdor,',
'          nombre_etpa,',
unistr('          ''<b>Etapa</b> : '' || nombre_etpa || ''<br/> <b>Procesos Jur\00EDdicos</b> : '' || count(1) as tooltip'),
'     from v_cb_g_procesos_jrdco_dcmnto a',
'     join cb_g_procesos_juridico b on b.id_prcsos_jrdco = a.id_prcsos_jrdco',
'                             and b.cdgo_prcsos_jrdco_estdo <> ''ACM''',
'/*left join cb_g_prcsos_jrdc_dcmnt_estd b',
'       on a.id_prcsos_jrdco_dcmnto = b.id_prcsos_jrdco_dcmnto */',
'    where a.actvo = ''S''',
'      and a.cdgo_prcsos_jrdco_estdo = ''A''',
'      and (trunc(a.fcha) between nvl(:P19_FECHA, trunc(a.fcha)) ',
'                             and nvl(:P19_FECHA_HASTA, trunc(a.fcha)))',
'      and a.cdgo_clnte = :F_CDGO_CLNTE',
' group by nombre_etpa',
'/*',
'select count(1) cntdor,',
'          nombre_etpa,',
unistr('          ''<b>Etapa</b> : '' || nombre_etpa || ''<br/> <b>Procesos Jur\00EDdicos</b> : '' || count(1) as tooltip'),
'     from v_cb_g_procesos_jrdco_dcmnto a',
'left join cb_g_prcsos_jrdc_dcmnt_estd b',
'       on a.id_prcsos_jrdco_dcmnto = b.id_prcsos_jrdco_dcmnto ',
'    where a.actvo = ''S''',
'      and a.cdgo_prcsos_jrdco_estdo = ''A''',
'      and (trunc(a.fcha) between nvl(:P19_FECHA, trunc(a.fcha)) ',
'                             and nvl(:P19_FECHA_HASTA, trunc(a.fcha)))',
'      and a.cdgo_clnte = :F_CDGO_CLNTE',
' group by nombre_etpa*/'))
,p_items_value_column_name=>'CNTDOR'
,p_items_label_column_name=>'NOMBRE_ETPA'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52182601597614035)
,p_plug_name=>unistr('Total Cartera Etapas Procesos Jur\00EDdicos')
,p_region_name=>'rx1'
,p_parent_plug_id=>wwv_flow_api.id(52181578139614024)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(52182718127614036)
,p_region_id=>wwv_flow_api.id(52182601597614035)
,p_chart_type=>'bar'
,p_title=>unistr('Total Cartera Procesos Jur\00EDdicos Por Etapa')
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'horizontal'
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
 p_id=>wwv_flow_api.id(52182936279614038)
,p_chart_id=>wwv_flow_api.id(52182718127614036)
,p_seq=>20
,p_name=>unistr('Total Cartera Procesos Jur\00EDdicos Por Etapa')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sum(d.vlor_sldo_cptal+d.vlor_intres)  total,',
'      a.nombre_etpa,',
unistr('      ''<b>Etapa</b> : '' || nombre_etpa || ''<br/> <b>Total Cartera Procesos Jur\00EDdicos</b> : '' || to_char(nvl(sum(d.vlor_sldo_cptal+d.vlor_intres),0),''999G999G999G999G999G999G990'') as tooltip'),
' from v_cb_g_procesos_jrdco_dcmnto a',
'join cb_g_procesos_juridico b on b.id_prcsos_jrdco = a.id_prcsos_jrdco',
'                             and b.cdgo_prcsos_jrdco_estdo <> ''ACM''',
'join cb_g_procesos_jrdco_mvmnto c on c.id_prcsos_jrdco = b.id_prcsos_jrdco',
'join v_gf_g_cartera_x_concepto d on d.id_sjto_impsto = c.id_sjto_impsto',
'                                   and d.vgncia = c.vgncia',
'                                   and d.id_prdo = c.id_prdo',
'                                   and d.id_cncpto = c.id_cncpto',
'                                   and d.cdgo_clnte = a.cdgo_clnte',
'    where a.actvo = ''S''',
'      and trunc(a.fcha) ',
'  between nvl(:P19_FECHA, trunc(a.fcha)) ',
'      and nvl(:P19_FECHA_HASTA, trunc(a.fcha))',
'      and a.cdgo_clnte = :F_CDGO_CLNTE',
' group by nombre_etpa',
'/*   select sum(a.vlor_ttal_dda)  total,',
'          a.nombre_etpa,',
unistr('          ''<b>Etapa</b> : '' || nombre_etpa || ''<br/> <b>Total Cartera Procesos Jur\00EDdicos</b> : '' || to_char(nvl(sum(a.vlor_ttal_dda),0),''999G999G999G999G999G999G990'') as tooltip'),
'     from v_cb_g_procesos_jrdco_dcmnto a',
'join cb_g_procesos_juridico b on b.id_prcsos_jrdco = a.id_prcsos_jrdco',
'                             and b.cdgo_prcsos_jrdco_estdo <> ''ACM''',
'    where a.actvo = ''S''',
'      and trunc(a.fcha) ',
'  between nvl(:P19_FECHA, trunc(a.fcha)) ',
'      and nvl(:P19_FECHA_HASTA, trunc(a.fcha))',
'      and a.cdgo_clnte = :F_CDGO_CLNTE',
' group by nombre_etpa*/'))
,p_items_value_column_name=>'TOTAL'
,p_items_label_column_name=>'NOMBRE_ETPA'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'RGB(12,237,181,0.2)'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(52183046073614039)
,p_chart_id=>wwv_flow_api.id(52182718127614036)
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
 p_id=>wwv_flow_api.id(52183178724614040)
,p_chart_id=>wwv_flow_api.id(52182718127614036)
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
 p_id=>wwv_flow_api.id(52183648215614045)
,p_plug_name=>unistr('N\00FAmero de Procesos Jur\00EDdicos por Funcionario')
,p_region_name=>'rx2'
,p_parent_plug_id=>wwv_flow_api.id(52181578139614024)
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
 p_id=>wwv_flow_api.id(52183729694614046)
,p_region_id=>wwv_flow_api.id(52183648215614045)
,p_chart_type=>'bar'
,p_title=>unistr('N\00FAmero de Procesos Jur\00EDdicos por Funcionario')
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'horizontal'
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
 p_id=>wwv_flow_api.id(52183848427614047)
,p_chart_id=>wwv_flow_api.id(52183729694614046)
,p_seq=>10
,p_name=>unistr('N\00FAmero de Procesos Jur\00EDdicos por Funcionario')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(1) cntdor,',
'          fncnrio_rspnsble,',
unistr('          ''<b>Funcionario</b> : '' || fncnrio_rspnsble || ''<br/> <b>Total Cartera Procesos Jur\00EDdicos</b> : '' ||  count(1) as tooltip'),
'     from v_cb_g_procesos_jrdco_dcmnto a',
'     join cb_g_procesos_juridico b on b.id_prcsos_jrdco = a.id_prcsos_jrdco',
'                             and b.cdgo_prcsos_jrdco_estdo <> ''ACM''',
'    where a.actvo = ''S''',
'      and (trunc(a.fcha) ',
'  between nvl(:P19_FECHA, trunc(a.fcha)) ',
'      and nvl(:P19_FECHA_HASTA, trunc(a.fcha)))',
'      and a.cdgo_clnte = :F_CDGO_CLNTE',
' group by fncnrio_rspnsble',
'/*',
'   select count(1) cntdor,',
'          fncnrio_rspnsble,',
unistr('          ''<b>Funcionario</b> : '' || fncnrio_rspnsble || ''<br/> <b>Total Cartera Procesos Jur\00EDdicos</b> : '' ||  count(1) as tooltip'),
'     from v_cb_g_procesos_jrdco_dcmnto a',
'left join cb_g_prcsos_jrdc_dcmnt_estd b',
'       on a.id_prcsos_jrdco_dcmnto = b.id_prcsos_jrdco_dcmnto ',
'    where nvl(b.actvo,''S'') = ''S''',
'      and trunc(a.fcha) ',
'  between nvl(:P19_FECHA, trunc(a.fcha)) ',
'      and nvl(:P19_FECHA_HASTA, trunc(a.fcha))',
'      and a.cdgo_clnte = :F_CDGO_CLNTE',
' group by fncnrio_rspnsble*/'))
,p_items_value_column_name=>'CNTDOR'
,p_items_label_column_name=>'FNCNRIO_RSPNSBLE'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(52183963823614048)
,p_chart_id=>wwv_flow_api.id(52183729694614046)
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
 p_id=>wwv_flow_api.id(52184029046614049)
,p_chart_id=>wwv_flow_api.id(52183729694614046)
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
 p_id=>wwv_flow_api.id(52184170700614050)
,p_plug_name=>unistr('Total Cartera Procesos Jur\00EDdicos por Funcionario')
,p_region_name=>'rx3'
,p_parent_plug_id=>wwv_flow_api.id(52181578139614024)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>80
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(52649043947451101)
,p_region_id=>wwv_flow_api.id(52184170700614050)
,p_chart_type=>'bar'
,p_title=>unistr('Total Cartera Procesos Jur\00EDdicos Por Funcionario')
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
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
 p_id=>wwv_flow_api.id(52649174605451102)
,p_chart_id=>wwv_flow_api.id(52649043947451101)
,p_seq=>10
,p_name=>unistr('Total Cartera Procesos Jur\00EDdicos Por Funcionario')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sum(d.vlor_sldo_cptal+d.vlor_intres)  total,',
'          fncnrio_rspnsble,',
unistr('          ''<b>Funcionario</b> : '' || fncnrio_rspnsble || ''<br/> <b>Total Cartera Procesos Jur\00EDdicos</b> : $'' || to_char(nvl(sum(d.vlor_sldo_cptal+d.vlor_intres),0),''999G999G999G999G999G999G990'') as tooltip'),
'     from v_cb_g_procesos_jrdco_dcmnto a',
'join cb_g_procesos_juridico b on b.id_prcsos_jrdco = a.id_prcsos_jrdco',
'                             and b.cdgo_prcsos_jrdco_estdo <> ''ACM''',
'join cb_g_procesos_jrdco_mvmnto c on c.id_prcsos_jrdco = b.id_prcsos_jrdco',
'join v_gf_g_cartera_x_concepto d on d.id_sjto_impsto = c.id_sjto_impsto',
'                                   and d.vgncia = c.vgncia',
'                                   and d.id_prdo = c.id_prdo',
'                                   and d.id_cncpto = c.id_cncpto',
'                                   and d.cdgo_clnte = a.cdgo_clnte',
'    where a.actvo = ''S''',
'      and trunc(a.fcha) ',
'  between nvl(:P19_FECHA, trunc(a.fcha)) ',
'      and nvl(:P19_FECHA_HASTA, trunc(a.fcha))',
'      and a.cdgo_clnte = :F_CDGO_CLNTE',
' group by fncnrio_rspnsble',
'/*',
'select sum(a.vlor_ttal_dda)  total,',
'          fncnrio_rspnsble,',
unistr('          ''<b>Funcionario</b> : '' || fncnrio_rspnsble || ''<br/> <b>Total Cartera Procesos Jur\00EDdicos</b> : $'' || to_char(nvl(sum(a.vlor_ttal_dda),0),''999G999G999G999G999G999G990'') as tooltip'),
'     from v_cb_g_procesos_jrdco_dcmnto a',
'left join cb_g_prcsos_jrdc_dcmnt_estd b',
'       on a.id_prcsos_jrdco_dcmnto = b.id_prcsos_jrdco_dcmnto ',
'    where nvl(b.actvo,''S'') = ''S''',
'      and trunc(a.fcha) ',
'  between nvl(:P19_FECHA, trunc(a.fcha)) ',
'      and nvl(:P19_FECHA_HASTA, trunc(a.fcha))',
'      and a.cdgo_clnte = :F_CDGO_CLNTE',
' group by fncnrio_rspnsble*/'))
,p_items_value_column_name=>'TOTAL'
,p_items_label_column_name=>'FNCNRIO_RSPNSBLE'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'RGB(12,237,181,0.2)'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(52649305063451104)
,p_chart_id=>wwv_flow_api.id(52649043947451101)
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
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(52649219138451103)
,p_chart_id=>wwv_flow_api.id(52649043947451101)
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
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52537083599931910)
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
 p_id=>wwv_flow_api.id(52537265334931912)
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
unistr('Funcionalidad que permite controlar los procesos Jur\00EDdicos realizados. <br><br>'),
unistr('<b>1.</b> Muestra el n\00FAmero de procesos jur\00EDdicos realizados (Abiertos, Cerrados Y Detenidos), Adem\00E1s del valor total de la cartera de los procesos jur\00EDdicos, adicionalmente, se puede establecer un periodo determinado.<br><br>'),
unistr('<b>2.</b>N\00FAmero de procesos por etapa y total de cartera de los procesos por etapas<br><br>'),
unistr('<b>3.</b>N\00FAmero de procesos de un funcionario y total de cartera de los procesos por funcionario<br><br>'),
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(52537176813931911)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(52537083599931910)
,p_button_name=>'Regresar'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=50000:115:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(52181933620614028)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(52179910383614008)
,p_button_name=>'BTN_CNSLTAR'
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
 p_id=>wwv_flow_api.id(52180038236614009)
,p_name=>'P19_FECHA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(52179910383614008)
,p_item_default=>'01/01/2019'
,p_prompt=>'Fecha Desde'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>18
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52180870438614017)
,p_name=>'P19_FECHA_HASTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(52179910383614008)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Hasta'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>18
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P19_FECHA.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(52180903029614018)
,p_name=>'al cambiar la fecha'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19_FECHA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(52181078333614019)
,p_event_id=>wwv_flow_api.id(52180903029614018)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P19_FECHA_HASTA").datepicker( ''option'' , ''minDate'' , $("#P19_FECHA").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(52181133627614020)
,p_name=>'al cambiar la fecha hasta'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19_FECHA_HASTA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(52181237544614021)
,p_event_id=>wwv_flow_api.id(52181133627614020)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P19_FECHA").datepicker( ''option'' , ''maxDate'' , $("#P19_FECHA_HASTA").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
end;
/
