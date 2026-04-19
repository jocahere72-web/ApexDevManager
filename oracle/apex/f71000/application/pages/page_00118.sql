prompt --application/pages/page_00118
begin
wwv_flow_api.create_page(
 p_id=>118
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Panel de Control Acuerdos de Pago'
,p_step_title=>'Panel de Control Acuerdos de Pago'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LOBREDOR'
,p_last_upd_yyyymmddhh24miss=>'20200113151553'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(83122340099688801)
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
 p_id=>wwv_flow_api.id(3474797682156646)
,p_plug_name=>unistr('<i><b>Comportamiento de Acuerdos de Pago Sujetos a Modificaci\00F3n</b></i>')
,p_parent_plug_id=>wwv_flow_api.id(83122340099688801)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>100
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3475019082156649)
,p_plug_name=>unistr('<i>Estados de Modificaci\00F3n</i>')
,p_parent_plug_id=>wwv_flow_api.id(3474797682156646)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(3475181385156650)
,p_region_id=>wwv_flow_api.id(3475019082156649)
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
 p_id=>wwv_flow_api.id(3653039878391301)
,p_chart_id=>wwv_flow_api.id(3475181385156650)
,p_seq=>10
,p_name=>'estados'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select cntdad,',
'        estdo,',
'        dscrpcion estdo_vlor,',
'        ''<b>Estado :</b> '' || dscrpcion || ''<br>'' || ''<b>Total Acuerdos:</b> '' || to_char( nvl( cntdad , 0 ) , ''FM9999'' ) || ''<br>'' as tooltip',
'   from ( select nvl(count(*),0) cntdad,',
'                 c.cdgo_cnvnio_mdfccion_estdo estdo,',
'                 initcap(c.dscrpcn_cnvnio_mdfccion_estdo) dscrpcion',
'           from v_gf_g_convenios_modificacion c',
'          where c.cdgo_clnte = :F_CDGO_CLNTE and c.cdgo_cnvnio_mdfccion_estdo in (select cdgo_cnvnio_mdfccion_estdo',
'                                                                                    from gf_d_convenios_mdfccn_estdo) ',
'            and ((trunc(c.fcha_rgstro) between :P118_FECHA_INICIAL and :P118_FECHA_FINAL)',
'             or ((trunc(c.fcha_rgstro) >= :P118_FECHA_INICIAL and :P118_FECHA_FINAL is null))',
'             or (trunc(c.fcha_rgstro) <= :P118_FECHA_FINAL and :P118_FECHA_INICIAL  is null)',
'             or (:P118_FECHA_INICIAL is null and :P118_FECHA_FINAL is null ))',
'       group by c.cdgo_cnvnio_mdfccion_estdo, c.dscrpcn_cnvnio_mdfccion_estdo); '))
,p_items_value_column_name=>'CNTDAD'
,p_items_label_column_name=>'ESTDO_VLOR'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P118_ESTDO_MDFCCION'',''&ESTDO.'');'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3653336846391304)
,p_plug_name=>unistr('<i>Tipos de Modificaci\00F3n por Estado</i>')
,p_parent_plug_id=>wwv_flow_api.id(3474797682156646)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(3701300187753701)
,p_region_id=>wwv_flow_api.id(3653336846391304)
,p_chart_type=>'bar'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
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
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_no_data_found_message=>unistr('No ha seleccionado estado de la modificaci\00F3n de acuerdos de pago.')
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(3701490038753702)
,p_chart_id=>wwv_flow_api.id(3701300187753701)
,p_seq=>10
,p_name=>unistr('Tipos Modificaci\00F3n')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select cntdad,',
'        cdgo_cnvnio_mdfccion_tpo, ',
'        dscrpcion tpo_vlor,',
'        cdgo_cnvnio_mdfccion_estdo,',
unistr('        ''<b>Tipo Modificaci\00F3n: </b> '' || dscrpcion || ''<br>'' || ''<b>Total Acuerdos Modificados:</b> '' || to_char( nvl( cntdad , 0 ) , ''FM9999'' ) || ''<br>'' as tooltip'),
'   from ( select nvl(count(*),0) cntdad,',
'                 initcap(dscrpcion_cnvnio_mdfccion_tpo) dscrpcion,',
'                 cdgo_cnvnio_mdfccion_tpo,',
'                 cdgo_cnvnio_mdfccion_estdo',
'           from v_gf_g_convenios_modificacion',
'          where cdgo_clnte = :F_CDGO_CLNTE',
'            and cdgo_cnvnio_mdfccion_estdo in (select cdgo_cnvnio_mdfccion_estdo',
'                                                from gf_d_convenios_mdfccn_estdo) ',
'            and  cdgo_cnvnio_mdfccion_estdo = :P118_ESTDO_MDFCCION  ',
'            and ((trunc(fcha_rgstro) between :P118_FECHA_INICIAL and :P118_FECHA_FINAL)',
'             or ((trunc(fcha_rgstro) >= :P118_FECHA_INICIAL and :P118_FECHA_FINAL is null))',
'             or (trunc(fcha_rgstro) <= :P118_FECHA_FINAL and :P118_FECHA_INICIAL  is null)',
'             or (:P118_FECHA_INICIAL is null and :P118_FECHA_FINAL is null))',
'       group by cdgo_cnvnio_mdfccion_tpo, dscrpcion_cnvnio_mdfccion_tpo, cdgo_cnvnio_mdfccion_estdo); '))
,p_items_value_column_name=>'CNTDAD'
,p_items_label_column_name=>'TPO_VLOR'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:231:&SESSION.::&DEBUG.:RP:P231_CDGO_CNVNIO_MDFCCION_TPO,P231_CDGO_CNVNIO_MDFCCION_ESTDO:&CDGO_CNVNIO_MDFCCION_TPO.,&CDGO_CNVNIO_MDFCCION_ESTDO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(3701664015753704)
,p_chart_id=>wwv_flow_api.id(3701300187753701)
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
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(3701510661753703)
,p_chart_id=>wwv_flow_api.id(3701300187753701)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(82509537360124818)
,p_plug_name=>'Totalizado Acuerdos de Pago Aplicados'
,p_parent_plug_id=>wwv_flow_api.id(83122340099688801)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--xlarge'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Total Cartera en Acuerdo de Pago'' as label, to_char(nvl(b.vlor,0), :F_FRMTO_MNDA)vlor',
'from dual a',
'left join(',
'    select sum(a.ttal_cnvnio) as vlor',
'     from v_gf_g_convenios a ',
'     /*join wf_g_instancias_transicion b on a.id_instncia_fljo_hjo = b.id_instncia_fljo',
'                                       and b.id_usrio = :F_ID_USRIO */',
'    where a.cdgo_clnte = :F_CDGO_CLNTE',
'      and ((trunc(a.fcha_aplccion) between :P118_FECHA_INICIAL and :P118_FECHA_FINAL)',
'            or ((trunc(a.fcha_aplccion) >= :P118_FECHA_INICIAL and :P118_FECHA_FINAL is null))',
'            or (trunc(a.fcha_aplccion) <= :P118_FECHA_FINAL and :P118_FECHA_INICIAL  is null)',
'            or (:P118_FECHA_INICIAL is null and :P118_FECHA_FINAL is null ))',
'      and  a.cdgo_cnvnio_estdo = ''APL''         ',
'        ) b on b.vlor = b.vlor'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_ajax_items_to_submit=>'P118_FECHA_INICIAL,P118_FECHA_FINAL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VLOR'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(83122739972688805)
,p_plug_name=>unistr('Par\00E1metros B\00FAsqueda')
,p_parent_plug_id=>wwv_flow_api.id(83122340099688801)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(83347350493436001)
,p_plug_name=>unistr('<i><b>Comparativo A Partir Per\00EDodo Actual</b></i>')
,p_parent_plug_id=>wwv_flow_api.id(83122340099688801)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(83347469800436002)
,p_plug_name=>'<i>Cuotas Vencidas y Esperadas</i>'
,p_parent_plug_id=>wwv_flow_api.id(83347350493436001)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--noBorder:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(84891867632150741)
,p_region_id=>wwv_flow_api.id(83347469800436002)
,p_chart_type=>'bar'
,p_animation_on_display=>'zoom'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'smooth'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
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
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(84891945661150742)
,p_chart_id=>wwv_flow_api.id(84891867632150741)
,p_seq=>10
,p_name=>'Cuotas Vencidas'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select  to_char(b.last, ''Month'') label,  nvl(sum(a.ttal_no_pgos),0) valor,',
'           to_char(b.first, ''dd/MM/yyyy'') fcha_inicial, to_char(b.last, ''dd/MM/yyyy'') fcha_final,',
'           ''<b>Corte Mensual:</b> '' || to_char(b.last,''FMMonth/yyyy'')|| ''<br>'' ||',
'           ''<b>Total Valor Cuotas:</b> '' || ''$''|| to_char(sum(nvl(a.ttal_no_pgos,0)),',
'           ''FM999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.'''''') || ''<br>'' as toolTip',
'      from (select a.id_cnvnio, a.vlor_ttal as ttal_no_pgos , trunc(fcha_aplccion) fcha_aplccion',
'              from gf_g_convenios_extracto a',
'              join v_gf_g_convenios b on a.id_cnvnio = b.id_cnvnio',
'             where b.cdgo_clnte = :F_CDGO_CLNTE and a.indcdor_cta_pgda = ''N''',
'               and trunc(sysdate) > trunc(a.fcha_vncmnto)',
'               and b.cdgo_cnvnio_estdo = ''APL'') a',
'right join (select to_date(''01/''||to_char(add_months(sysdate , -level+1),''MM/yyyy''),''dd/MM/yyyy'') first,',
'                   LAST_DAY(add_months(sysdate , -level+1)) last',
'              from dual',
'connect by level <= months_between(sysdate,add_months(sysdate , -6))) b on a.fcha_aplccion between b.first and b.last   ',
'  group by b.first ,b.last, to_char(b.last,''Month'')    ',
'  order by b.last asc'))
,p_items_value_column_name=>'VALOR'
,p_items_label_column_name=>'LABEL'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:123:&SESSION.::&DEBUG.:RP:P123_FCHA_FNAL,P123_FCHA_INCIAL:&FCHA_FINAL.,&FCHA_INICIAL.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(84892295583150745)
,p_chart_id=>wwv_flow_api.id(84891867632150741)
,p_seq=>20
,p_name=>'Cuotas Esperadas'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select to_char(b.last, ''Month'') label, nvl(sum(ttal_esprdo),0) valor,',
'           to_char(b.first, ''dd/MM/yyyy'') fcha_inicial, to_char(b.last, ''dd/MM/yyyy'') fcha_final,',
'           ''<b>Corte Mensual:</b> '' || to_char(b.last,''FMMonth/yyyy'')|| ''<br>'' ||',
'           ''<b>Total Valor Cuotas:</b> '' || ''$''|| to_char(sum(nvl(ttal_esprdo,0)),',
'           ''FM999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.'''''') || ''<br>'' as toolTip',
'      from (select a.id_cnvnio',
'                   ,sum(a.vlor_ttal) as ttal_esprdo',
'                   ,b.fcha_aplccion',
'             from gf_g_convenios_extracto a',
'             join v_gf_g_convenios b on a.id_cnvnio = b.id_cnvnio',
'            where b.cdgo_clnte = :F_CDGO_CLNTE and (trunc(a.fcha_vncmnto) < sysdate)',
'              and b.cdgo_cnvnio_estdo = ''APL''',
'         group by a.id_cnvnio',
'                  ,b.fcha_aplccion) a',
'right join (select to_date(''01/''||to_char(add_months(sysdate , -level+1),''MM/yyyy''),''dd/MM/yyyy'') first,',
'                   LAST_DAY(add_months(sysdate , -level+1)) last',
'              from dual',
'  connect by level <= months_between(sysdate,add_months(sysdate , -6))) b on a.fcha_aplccion between b.first and b.last   ',
'   group by b.last, b.first    ',
'   order by b.last asc'))
,p_items_value_column_name=>'VALOR'
,p_items_label_column_name=>'LABEL'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:124:&SESSION.::&DEBUG.:RP:P124_FCHA_INCIAL,P124_FCHA_FNAL:&FCHA_INICIAL.,&FCHA_FINAL.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(84892124411150744)
,p_chart_id=>wwv_flow_api.id(84891867632150741)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Total Valor Cuotas'
,p_format_type=>'currency'
,p_decimal_places=>0
,p_currency=>'$'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'top'
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
 p_id=>wwv_flow_api.id(84892028765150743)
,p_chart_id=>wwv_flow_api.id(84891867632150741)
,p_axis=>'x'
,p_is_rendered=>'on'
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
 p_id=>wwv_flow_api.id(84890612539150729)
,p_plug_name=>'<i>Cuotas por Vencer</i>'
,p_parent_plug_id=>wwv_flow_api.id(83347350493436001)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--hiddenOverflow:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(84890941385150732)
,p_region_id=>wwv_flow_api.id(84890612539150729)
,p_chart_type=>'bar'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
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
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(84891070359150733)
,p_chart_id=>wwv_flow_api.id(84890941385150732)
,p_seq=>10
,p_name=>'Convenios CPV'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select sum(nvl(a.ttal,0)) valor, to_char(b.last,''Month'') label, to_char(b.first, ''dd/MM/yyyy'') fcha_inicial, to_char(b.last, ''dd/MM/yyyy'') fcha_final,',
'            ''<b>Corte Mensual:</b> '' || to_char(b.last,''FMMonth/yyyy'')|| ''<br>'' ||',
'            ''<b>Total Valor Cuotas:</b> '' || ''$''|| to_char(sum(nvl(a.ttal,0)),',
'            ''FM999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.'''''') || ''<br>'' as toolTip',
'       from (select sum(e.vlor_ttal) ttal,trunc(e.fcha_vncmnto) fcha_vncmnto',
'               from gf_g_convenios_extracto e',
'               join v_gf_g_convenios c on e.id_cnvnio = c.id_cnvnio',
'              where c.cdgo_clnte = :F_CDGO_CLNTE',
'                and c.cdgo_cnvnio_estdo = ''APL''',
'           group by e.fcha_vncmnto',
'           order by e.fcha_vncmnto) a',
'right join (select to_date(''01/''||to_char(add_months(sysdate , level),''MM/yyyy''),''dd/MM/yyyy'') first,',
'                   last_day(add_months(sysdate , level)) last',
'              from dual',
'        connect by level <= months_between(sysdate,add_months(sysdate , -6))) b',
'        on a.fcha_vncmnto between b.first and b.last ',
'  group by b.first ,b.last, to_char(b.last,''Month'')    ',
'  order by b.last'))
,p_items_value_column_name=>'VALOR'
,p_items_label_column_name=>'LABEL'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'start'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:122:&SESSION.::&DEBUG.:RP:P122_FECHA_INICIAL,P122_FECHA_FINAL:&FCHA_INICIAL.,&FCHA_FINAL.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(84891141893150734)
,p_chart_id=>wwv_flow_api.id(84890941385150732)
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
 p_id=>wwv_flow_api.id(84891220046150735)
,p_chart_id=>wwv_flow_api.id(84890941385150732)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Total Valor Cuotas'
,p_format_type=>'currency'
,p_decimal_places=>0
,p_currency=>'$'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'top'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'on'
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
 p_id=>wwv_flow_api.id(84887845830150701)
,p_plug_name=>'<i><b>Comportamiento por Estados</b></i>'
,p_parent_plug_id=>wwv_flow_api.id(83122340099688801)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(84887900718150702)
,p_plug_name=>'<i>Estados de Acuerdos de Pago</i>'
,p_parent_plug_id=>wwv_flow_api.id(84887845830150701)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--noBorder:t-Region--hiddenOverflow:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(84888182154150704)
,p_region_id=>wwv_flow_api.id(84887900718150702)
,p_chart_type=>'pie'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
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
,p_pie_selection_effect=>'highlightAndExplode'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(84888205969150705)
,p_chart_id=>wwv_flow_api.id(84888182154150704)
,p_seq=>10
,p_name=>'estados'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select cntdad,',
'        estdo,',
'        dscrpcion estdo_vlor,',
'        ''<b>Estado :</b> '' || dscrpcion || ''<br>'' || ''<b>Total Acuerdos:</b> '' || to_char( nvl( cntdad , 0 ) , ''FM9999'' ) || ''<br>'' as tooltip',
'   from ( select nvl(count(*),0) cntdad,',
'                 c.cdgo_cnvnio_estdo estdo,',
'                 c.dscrpcion_cnvnio_estdo dscrpcion',
'           from v_gf_g_convenios c',
'       /*left join wf_g_instancias_transicion b on c.id_instncia_fljo_hjo = b.id_instncia_fljo',
'                                             and b.id_usrio = :F_ID_USRIO */',
'          where c.cdgo_clnte = :f_cdgo_clnte and c.cdgo_cnvnio_estdo in (select cdgo_cnvnio_estdo',
'                                                                           from gf_d_convenios_estado) ',
'            and ((trunc(c.fcha_slctud) between :p118_fecha_inicial and :p118_fecha_final)',
'             or ((trunc(c.fcha_slctud) >= :p118_fecha_inicial and :p118_fecha_final is null))',
'             or (trunc(c.fcha_slctud) <= :p118_fecha_final and :p118_fecha_inicial  is null)',
'             or (:p118_fecha_inicial is null and :p118_fecha_final is null ))',
'       group by c.cdgo_cnvnio_estdo, c.dscrpcion_cnvnio_estdo); '))
,p_ajax_items_to_submit=>'P118_FECHA_INICIAL,P118_FECHA_FINAL'
,p_items_value_column_name=>'CNTDAD'
,p_items_label_column_name=>'ESTDO_VLOR'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P118_ESTDO'',''&ESTDO.'');'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(84888007562150703)
,p_plug_name=>'<i>Tipos de Acuerdos de Pago por Estados</i>'
,p_parent_plug_id=>wwv_flow_api.id(84887845830150701)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--hiddenOverflow:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(84889264143150715)
,p_region_id=>wwv_flow_api.id(84888007562150703)
,p_chart_type=>'bar'
,p_title=>'&P118_ESTDO_VLOR.'
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
,p_no_data_found_message=>'No ha seleccionado el estado del acuerdo de pago.'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(84889385171150716)
,p_chart_id=>wwv_flow_api.id(84889264143150715)
,p_seq=>10
,p_name=>'Tipos por Estado'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  sum(b.valor) valor, b.tpo id_tpo, b.tooltip tpo,',
'         ''<b>Estado :</b> '' || b.estdo || ''<br>'' as toolTip',
'     from(',
'          select b.id_cnvnio_tpo tpo, ',
'                 b.dscrpcion_cnvnio_tpo tooltip ,',
'                 trunc(b.fcha_slctud) label,',
'                 count(b.id_cnvnio_tpo) valor,  ',
'                 b.dscrpcion_cnvnio_estdo estdo ',
'            from v_gf_g_convenios b ',
'           where b.cdgo_clnte = :F_CDGO_CLNTE ',
'             and b.cdgo_cnvnio_estdo = :P118_ESTDO ',
'             and ((trunc(b.fcha_slctud) between :P118_FECHA_INICIAL and :P118_FECHA_FINAL)',
'                                                                           or ((trunc(b.fcha_slctud) >= :P118_FECHA_INICIAL and :P118_FECHA_FINAL is null))',
'                                                                           or (trunc(b.fcha_slctud) <= :P118_FECHA_FINAL and :P118_FECHA_INICIAL  is null)',
'                                                                           or (:P118_FECHA_INICIAL is null and :P118_FECHA_FINAL is null ))',
'        group by b.id_cnvnio_tpo, b.dscrpcion_cnvnio_tpo, b.fcha_slctud, b.dscrpcion_cnvnio_estdo) b ',
'group by b.tpo, b.tooltip, ''<b>Estado :</b> '' || b.estdo || ''<br>'''))
,p_ajax_items_to_submit=>'P118_ESTDO,P118_FECHA_INICIAL,P118_FECHA_FINAL'
,p_items_value_column_name=>'VALOR'
,p_items_label_column_name=>'TPO'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:119:&SESSION.::&DEBUG.:RP:P119_TPO,P119_FECHA_FINAL,P119_FECHA_INICIAL,P119_ESTDO:&ID_TPO.,&P118_FECHA_FINAL.,&P118_FECHA_INICIAL.,&P118_ESTDO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
end;
/
begin
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(84889412389150717)
,p_chart_id=>wwv_flow_api.id(84889264143150715)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Tipos de Acuerdos por Estado'
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
 p_id=>wwv_flow_api.id(84889564820150718)
,p_chart_id=>wwv_flow_api.id(84889264143150715)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Cantidad Acuerdos de Pago'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'on'
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
 p_id=>wwv_flow_api.id(86034277598896729)
,p_plug_name=>'<i><b>Comportamiento de Tributos y Cuotas de Acuerdos de Pago</b></i>'
,p_parent_plug_id=>wwv_flow_api.id(83122340099688801)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>80
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86034946142896736)
,p_plug_name=>'<i>Tributos</i>'
,p_parent_plug_id=>wwv_flow_api.id(86034277598896729)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(86035164234896738)
,p_region_id=>wwv_flow_api.id(86034946142896736)
,p_chart_type=>'donut'
,p_height=>'300'
,p_animation_on_display=>'alphaFade'
,p_animation_on_data_change=>'none'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
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
,p_legend_position=>'top'
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
 p_id=>wwv_flow_api.id(86035218026896739)
,p_chart_id=>wwv_flow_api.id(86035164234896738)
,p_seq=>10
,p_name=>'Impuestos'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select i.nmbre_impsto label',
'       ,c.id_impsto',
'       ,count(c.id_impsto) cntdad',
'       ,''<b>Total Acuerdos: </b> $''|| to_char(sum(c.ttal_cnvnio), ''FM999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.'''''') || ''<br>'' ||',
'        ''<b>Cantidad: </b>'' || count(c.id_impsto)|| ''<br>'' || ''<b>Tributo: </b>''||i.cdgo_impsto tooltip',
'from v_gf_g_convenios c',
'join df_c_impuestos i',
'  on c.id_impsto = i.id_impsto',
'where c.cdgo_clnte = :F_CDGO_CLNTE',
'  and ((trunc(c.fcha_slctud) between :P118_FECHA_INICIAL and :P118_FECHA_FINAL)',
'        or ((trunc(c.fcha_slctud) >= :P118_FECHA_INICIAL and :P118_FECHA_FINAL is null))',
'        or (trunc(c.fcha_slctud) <= :P118_FECHA_FINAL and :P118_FECHA_INICIAL  is null)',
'        or (:P118_FECHA_INICIAL is null and :P118_FECHA_FINAL is null ))',
'  and c.cdgo_cnvnio_estdo = ''APL''      ',
'group by i.nmbre_impsto, c.id_impsto, i.cdgo_impsto'))
,p_ajax_items_to_submit=>'P118_FECHA_INICIAL,P118_FECHA_FINAL'
,p_items_value_column_name=>'CNTDAD'
,p_items_label_column_name=>'LABEL'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:126:&SESSION.::&DEBUG.:RP:P126_FECHA_FINAL,P126_FECHA_INICIAL,P126_IMPUESTO:&P118_FECHA_FINAL.,&P118_FECHA_INICIAL.,&ID_IMPSTO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86035066399896737)
,p_plug_name=>unistr('<i>Tipos Cuota M\00E1xima</i>')
,p_parent_plug_id=>wwv_flow_api.id(86034277598896729)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--hiddenOverflow:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(86624800281452933)
,p_region_id=>wwv_flow_api.id(86035066399896737)
,p_chart_type=>'bar'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
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
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(86624999477452934)
,p_chart_id=>wwv_flow_api.id(86624800281452933)
,p_seq=>10
,p_name=>unistr('Cuota M\00E1xima')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select max(c.nmro_cta) vlor, c.id_cnvnio_tpo, c.dscrpcion_cnvnio_tpo label,',
unistr('         ''<b>Cuota M\00E1xima</b><br>'' || ''<b>Tipo: </b>''||c.dscrpcion_cnvnio_tpo '),
unistr('         || ''<br>'' || ''<b>N\00B0 Cuotas M\00E1xima: </b>'' || max(c.nmro_cta) as toolTip'),
'    from v_gf_g_convenios c',
'   where c.cdgo_clnte = :F_CDGO_CLNTE ',
'     and ((trunc(c.fcha_slctud) between :P118_FECHA_INICIAL and :P118_FECHA_FINAL)',
'           or ((trunc(c.fcha_slctud) >= :P118_FECHA_INICIAL and :P118_FECHA_FINAL   is null))',
'           or (trunc(c.fcha_slctud)  <= :P118_FECHA_FINAL   and :P118_FECHA_INICIAL is null)',
'           or (:P118_FECHA_INICIAL is null and :P118_FECHA_FINAL is null))',
'     and c.cdgo_cnvnio_estdo = ''APL''',
'group by c.id_cnvnio_tpo, c.dscrpcion_cnvnio_tpo'))
,p_ajax_items_to_submit=>'P118_FECHA_INICIAL,P118_FECHA_FINAL'
,p_items_value_column_name=>'VLOR'
,p_items_label_column_name=>'LABEL'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:127:&SESSION.::&DEBUG.:RP:P127_FECHA_FINAL,P127_FECHA_INICIAL,P127_CTA,P127_TPO:&P118_FECHA_FINAL.,&P118_FECHA_INICIAL.,&VLOR.,&ID_CNVNIO_TPO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(3474866587156647)
,p_chart_id=>wwv_flow_api.id(86624800281452933)
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
 p_id=>wwv_flow_api.id(3474903129156648)
,p_chart_id=>wwv_flow_api.id(86624800281452933)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'on'
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
 p_id=>wwv_flow_api.id(86438822344446102)
,p_plug_name=>'Total Cantidad'
,p_parent_plug_id=>wwv_flow_api.id(83122340099688801)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow:t-Form--noPadding'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select ''Total Acuerdos de Pago Aplicados'' as label, count(a.id_cnvnio) as cntdad ',
'     from  v_gf_g_convenios a',
'     where a.cdgo_clnte = :F_CDGO_CLNTE ',
'       and ((trunc(a.fcha_aplccion) between :P118_FECHA_INICIAL and :P118_FECHA_FINAL)',
'            or ((trunc(a.fcha_aplccion) >= :P118_FECHA_INICIAL and :P118_FECHA_FINAL is null))',
'            or (trunc(a.fcha_aplccion) <= :P118_FECHA_FINAL and :P118_FECHA_INICIAL  is null)',
'            or (:P118_FECHA_INICIAL is null and :P118_FECHA_FINAL is null ))',
'       and a.cdgo_cnvnio_estdo = ''APL'';  '))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_ajax_items_to_submit=>'P118_FECHA_FINAL,P118_FECHA_INICIAL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'CNTDAD'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86460405429526903)
,p_plug_name=>'Porcentaje Cartera'
,p_parent_plug_id=>wwv_flow_api.id(83122340099688801)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with c_ttl_crtra as ( ',
'                       select sum(vlor_sldo_cptal)+ sum(vlor_intres) as ttal',
'                         from v_gf_g_cartera_x_concepto',
'                        where cdgo_clnte = :F_CDGO_CLNTE',
'                          and cdgo_mvnt_fncro_estdo <> ''AN''',
'                    )',
'                    ',
'   select ''% Sobre Cartera'' label, to_char(nvl(b.prcntje,0), ''FM9990.0000'') || ''%'' prcntje',
'     from dual a',
'left join ( select trunc((sum(c.vlor_sldo_cptal)+sum(c.vlor_intres))/ nvl(d.ttal,1) * 100,4) as prcntje',
'             from v_gf_g_movimientos_detalle a',
'             join (select id_sjto_impsto, fcha_aplccion',
'                     from gf_g_convenios',
'                    where cdgo_cnvnio_estdo = ''APL'') b on a.id_sjto_impsto = b.id_sjto_impsto',
'             join v_gf_g_cartera_x_concepto c on a.id_sjto_impsto = c.id_sjto_impsto',
'             join c_ttl_crtra d on d.ttal = d.ttal',
'           where a.cdgo_clnte =:F_CDGO_CLNTE',
'            and ((trunc(b.fcha_aplccion) between :P118_FECHA_INICIAL and :P118_FECHA_FINAL)',
'            or ((trunc(b.fcha_aplccion) >= :P118_FECHA_INICIAL and :P118_FECHA_FINAL is null))',
'            or (trunc(b.fcha_aplccion) <= :P118_FECHA_FINAL and :P118_FECHA_INICIAL  is null)',
'            or (:P118_FECHA_INICIAL is null and :P118_FECHA_FINAL is null))',
'            and a.cdgo_mvnt_fncro_estdo = ''CN''',
'          group by d.ttal) b on b.prcntje = b.prcntje'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_ajax_items_to_submit=>'P118_FECHA_INICIAL,P118_FECHA_FINAL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'PRCNTJE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(124170058327769301)
,p_plug_name=>'<i><b>Comportamiento de Acuerdos de Pago Revocados</b></i>'
,p_parent_plug_id=>wwv_flow_api.id(83122340099688801)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>90
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3473120975156630)
,p_plug_name=>'<i>Estados de Revocatoria</i>'
,p_parent_plug_id=>wwv_flow_api.id(124170058327769301)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(3473256168156631)
,p_region_id=>wwv_flow_api.id(3473120975156630)
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
 p_id=>wwv_flow_api.id(3473352563156632)
,p_chart_id=>wwv_flow_api.id(3473256168156631)
,p_seq=>10
,p_name=>'Estados'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select cntdad,',
'        estdo,',
'        dscrpcion estdo_vlor,',
'        ''<b>Estado :</b> '' || dscrpcion || ''<br>'' || ''<b>Total Acuerdos:</b> '' || to_char( nvl( cntdad , 0 ) , ''FM9999'' ) || ''<br>'' as tooltip',
'   from ( select nvl(count(*),0) cntdad,',
'                 c.cdgo_cnvnio_rvctria_estdo estdo,',
'                 initcap(c.dscrpcion_cnvnio_rvctria_estdo) dscrpcion',
'           from v_gf_g_convenios_revocatoria c',
'          where c.cdgo_clnte = :f_cdgo_clnte',
'            and c.cdgo_cnvnio_rvctria_estdo in (select cdgo_cnvnio_rvctria_estdo',
'                                                  from gf_d_cnvnios_rvctria_estdo) ',
'            and ((trunc(c.fcha_rgstro) between :P118_FECHA_INICIAL and :P118_FECHA_FINAL)',
'             or ((trunc(c.fcha_rgstro) >= :P118_FECHA_INICIAL and :P118_FECHA_FINAL is null))',
'             or (trunc(c.fcha_rgstro) <= :P118_FECHA_FINAL and :P118_FECHA_INICIAL  is null)',
'             or (:P118_FECHA_INICIAL is null and :P118_FECHA_FINAL is null ))',
'       group by c.cdgo_cnvnio_rvctria_estdo, c.dscrpcion_cnvnio_rvctria_estdo); '))
,p_ajax_items_to_submit=>'P118_CDGO_CNVNIO_RVCTRIA_ESTDO'
,p_items_value_column_name=>'CNTDAD'
,p_items_label_column_name=>'ESTDO_VLOR'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'PERCENT'
,p_items_label_font_color=>'#000000'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:230:&SESSION.::&DEBUG.:RP:P230_CDGO_CNVNIO_ESTDO_RVCTRIA:&ESTDO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(124170176306769302)
,p_plug_name=>'<i>Tipos de Revocatoria</i>'
,p_parent_plug_id=>wwv_flow_api.id(124170058327769301)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(124170392431769304)
,p_region_id=>wwv_flow_api.id(124170176306769302)
,p_chart_type=>'donut'
,p_height=>'300'
,p_animation_on_display=>'alphaFade'
,p_animation_on_data_change=>'none'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
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
,p_legend_position=>'top'
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
 p_id=>wwv_flow_api.id(124170420565769305)
,p_chart_id=>wwv_flow_api.id(124170392431769304)
,p_seq=>10
,p_name=>'Tipos'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.cdgo_rvctria_tpo , ',
'        dscrpcion_rvctria_tpo label,',
'        count(*) vlor  ',
'       ,''<b>Cantidad: </b>'' || count(*)|| ''<br>'' || ''<b>Tipo Revocatoria: </b> ''|| a.dscrpcion_rvctria_tpo tooltip',
'  from v_gf_d_revocatoria_metodo a',
'  join v_gf_g_convenios_revocatoria c on a.id_rvctria_mtdo = c.id_rvctria_mtdo',
' where c.cdgo_clnte = :F_CDGO_CLNTE',
'   and ((trunc(c.fcha_aplccion) between :P118_FECHA_INICIAL and :P118_FECHA_FINAL)',
'        or ((trunc(c.fcha_aplccion) >= :P118_FECHA_INICIAL and :P118_FECHA_FINAL is null))',
'        or (trunc(c.fcha_aplccion) <= :P118_FECHA_FINAL and :P118_FECHA_INICIAL  is null)',
'        or (:P118_FECHA_INICIAL is null and :P118_FECHA_FINAL is null))',
'   and c.cdgo_cnvnio_rvctria_estdo = ''APL''',
'group by a.cdgo_rvctria_tpo, dscrpcion_rvctria_tpo; '))
,p_items_value_column_name=>'VLOR'
,p_items_label_column_name=>'LABEL'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P118_CDGO_RVCTRIA_TPO'',''&CDGO_RVCTRIA_TPO.'');'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(124170279245769303)
,p_plug_name=>unistr('<i>M\00E9todos Revocatoria por Tipo de Revocatoria</i>')
,p_parent_plug_id=>wwv_flow_api.id(124170058327769301)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(124171640904769317)
,p_region_id=>wwv_flow_api.id(124170279245769303)
,p_chart_type=>'bar'
,p_title=>'&P118_CDGO_RVCTRIA_TPO_VLOR.'
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
,p_show_group_name=>false
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
,p_no_data_found_message=>'No ha seleccionado el tipo de revocatoria de acuerdos de pago'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(124171791858769318)
,p_chart_id=>wwv_flow_api.id(124171640904769317)
,p_seq=>10
,p_name=>unistr('tipos por m\00E9todos')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(id_rvctria_mtdo) vlor',
'       ,dscrpcion_mtdo_rvctria label',
unistr('       ,''<b>Cantidad: </b>''||count(id_rvctria_mtdo)||''<br><b>M\00E9todo :</b> '' || dscrpcion_mtdo_rvctria || ''<br>'' as toolTip'),
'       ,id_rvctria_mtdo',
' from v_gf_g_convenios_revocatoria',
'where cdgo_clnte = :F_CDGO_CLNTE ',
' and cdgo_rvctria_tpo = :P118_CDGO_RVCTRIA_TPO',
' and cdgo_cnvnio_rvctria_estdo = ''APL''',
' and ((trunc(fcha_aplccion) between :P118_FECHA_INICIAL and :P118_FECHA_FINAL)',
'  or ((trunc(fcha_aplccion) >= :P118_FECHA_INICIAL and :P118_FECHA_FINAL is null))',
'  or (trunc(fcha_aplccion) <= :P118_FECHA_FINAL and :P118_FECHA_INICIAL  is null)',
'  or (:P118_FECHA_INICIAL is null and :P118_FECHA_FINAL is null))',
'  group by id_rvctria_mtdo, dscrpcion_mtdo_rvctria;'))
,p_ajax_items_to_submit=>'P118_FECHA_INICIAL,P118_FECHA_FINAL,P118_CDGO_RVCTRIA_TPO'
,p_items_value_column_name=>'VLOR'
,p_items_label_column_name=>'LABEL'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:229:&SESSION.::&DEBUG.:RP:P229_ID_RVCTRIA_MTDO,P229_CDGO_RVCTRIA_TPO:&ID_RVCTRIA_MTDO.,&P118_CDGO_RVCTRIA_TPO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(124171893892769319)
,p_chart_id=>wwv_flow_api.id(124171640904769317)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Tipos de Acuerdos de Pago'
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
 p_id=>wwv_flow_api.id(124171989856769320)
,p_chart_id=>wwv_flow_api.id(124171640904769317)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Cantidad de Tipos'
,p_min=>0
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
,p_step=>1
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
 p_id=>wwv_flow_api.id(83122433242688802)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(83122681253688804)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
unistr('  Funcionalidad que permite valorar gr\00E1ficamente el comportamiento de los acuerdos de pago efectuados, su representacion porcentual sobre la cartera, adem\00E1s de permitir diferenciar cantidad en t\00E9rminos de unidades y de efectivo.<br><br> '),
unistr('  <b>1. Comportamiento por Estados</b><br> La estad\00EDstica de acuerdos de pago representa porcentualmente los estados de los acuerdos de pago, as\00ED mismo los tipifica y muestra su respectivo detalle.<br><br>'),
unistr('  <b>2. Comparativo A Partir de Per\00EDodo Actual</b><br><br>'),
unistr('  <b>2.1. Cuotas Vencidas y Esperadas</b><br>El comparativo de acuerdos de pago por cuotas vencidas muestra la relaci\00F3n de los \00FAltimos seis meses de las cuotas que la administraci\00F3n espera recaudar y las vencidas de acuerdos de pago aplicados hasta l')
||'a fecha.<br><br>',
unistr('  <b>2.2. Cuotas por Vencer</b><br> El comparativo de acuerdos de pago de cuotas por vencer detalla a partir de la fecha las cuotas de acuerdos de pago aplicados que se recaudar\00E1n durante los pr\00F3ximos seis meses en t\00E9rminos monetarios.<br><br>'),
'  <b>3. Comportamiento de Tributos y Cuotas de Acuerdos de Pago</b><br><br>',
unistr('  <b>3.1. Tributo</b><br> El gr\00E1fico detalla la cantidad de acuerdos de pago por tributo.<br><br>'),
unistr('  <b>3.2. Tipos por Cuota M\00E1xima</b><br> Detalla los acuerdos de pago con la m\00E1xima cuota por tipo de acuerdo de pago.<br><br>'),
'  <b>4. Comportamiento de Acuerdos de Pago Revocados</b><br><br>',
'  <b>4.1. Estados de Revocatoria</b><br>Representa porcentualmente los estados en que se encuentran las revocatorias de acuerdos de pago a la fecha.<br><br>',
unistr('  <b>4.2. Tipos de Revocatoria</b><br> Gr\00E1fica que identifica los tipos y m\00E9todos de revocatoria definidos en los tipos de acuerdos de pago.<br><br>'),
unistr('  <b>5. Comportamiento de Acuerdos de Pago Sujetos a Modificaci\00F3n</b><br>Identifica porcentualmente los estados en que se encuentran los acuerdos de pago modificados, detallando as\00ED los tipos de modificaci\00F3n de acuerdos de pago que los originaron.<br')
||'><br>',
unistr('  <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(83122579943688803)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(83122433242688802)
,p_button_name=>'Regresar'
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
 p_id=>wwv_flow_api.id(3473778770156636)
,p_name=>'P118_CDGO_CNVNIO_RVCTRIA_ESTDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3473120975156630)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3653813586391309)
,p_name=>'P118_ESTDO_MDFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3475019082156649)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3653979428391310)
,p_name=>'P118_CDGO_ESTDO_MDFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3653336846391304)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83122971151688807)
,p_name=>'P118_FECHA_INICIAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(83122739972688805)
,p_item_default=>'''01/''|| to_char( sysdate , ''MM/YYYY'' )'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'<b>Fecha Inicial</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00EDnima de aplicaci\00F3n de acuerdos de pago del rango, para mostrar las estad\00EDsticas que as\00ED lo requieran.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83123288363688810)
,p_name=>'P118_FECHA_FINAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(83122739972688805)
,p_item_default=>'to_char( last_day(sysdate) , ''DD/MM/YYYY'' )'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'<b>Fecha Final</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00E1xima de aplicaci\00F3n de acuerdos de pago del rango, para mostrar las estad\00EDsticas que as\00ED lo requieran.')
,p_attribute_02=>'&P118_FECHA_INICIAL.'
,p_attribute_03=>'+1d'
,p_attribute_04=>'both'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84888571658150708)
,p_name=>'P118_ESTDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(84887900718150702)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84889853567150721)
,p_name=>'P118_ESTDO_VALOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(84888007562150703)
,p_prompt=>'Estado Valor'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355220964050628)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(124170736159769308)
,p_name=>'P118_CDGO_RVCTRIA_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(124170176306769302)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(124171575173769316)
,p_name=>'P118_CDGO_RVCTRIA_TPO_VLOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(124170279245769303)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(83123045749688808)
,p_name=>'Al modificar Fecha Inicial'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_FECHA_INICIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24124485477336302)
,p_event_id=>wwv_flow_api.id(83123045749688808)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_ESTDO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(83123142787688809)
,p_event_id=>wwv_flow_api.id(83123045749688808)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P118_FECHA_FINAL").datepicker( ''option'' , ''minDate'' , $("#P118_FECHA_INICIAL").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(83800450323822101)
,p_event_id=>wwv_flow_api.id(83123045749688808)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(84887900718150702)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(82510278465124825)
,p_event_id=>wwv_flow_api.id(83123045749688808)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(82509537360124818)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(86460553295526904)
,p_event_id=>wwv_flow_api.id(83123045749688808)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(86438822344446102)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(86460651105526905)
,p_event_id=>wwv_flow_api.id(83123045749688808)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(86460405429526903)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24124364249336301)
,p_event_id=>wwv_flow_api.id(83123045749688808)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(84888007562150703)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23955689154187027)
,p_event_id=>wwv_flow_api.id(83123045749688808)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(86034946142896736)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23955801941187029)
,p_event_id=>wwv_flow_api.id(83123045749688808)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(86035066399896737)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23956002082187031)
,p_event_id=>wwv_flow_api.id(83123045749688808)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(3473120975156630)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23956127911187032)
,p_event_id=>wwv_flow_api.id(83123045749688808)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(124170176306769302)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23956417644187035)
,p_event_id=>wwv_flow_api.id(83123045749688808)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(3475019082156649)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23956541431187036)
,p_event_id=>wwv_flow_api.id(83123045749688808)
,p_event_result=>'TRUE'
,p_action_sequence=>130
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(3653336846391304)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(82510020864124823)
,p_name=>'Al Modificar Fecha Final'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_FECHA_FINAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24124511214336303)
,p_event_id=>wwv_flow_api.id(82510020864124823)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_ESTDO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(82510104922124824)
,p_event_id=>wwv_flow_api.id(82510020864124823)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(82509537360124818)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(82510962797124832)
,p_event_id=>wwv_flow_api.id(82510020864124823)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(84887900718150702)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(86460737775526906)
,p_event_id=>wwv_flow_api.id(82510020864124823)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(86438822344446102)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(86460896331526907)
,p_event_id=>wwv_flow_api.id(82510020864124823)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(86460405429526903)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24124682764336304)
,p_event_id=>wwv_flow_api.id(82510020864124823)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(84888007562150703)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23955738412187028)
,p_event_id=>wwv_flow_api.id(82510020864124823)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(86034946142896736)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23955947494187030)
,p_event_id=>wwv_flow_api.id(82510020864124823)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(86035066399896737)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23956234944187033)
,p_event_id=>wwv_flow_api.id(82510020864124823)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(3473120975156630)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23956338181187034)
,p_event_id=>wwv_flow_api.id(82510020864124823)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(124170176306769302)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23956696928187037)
,p_event_id=>wwv_flow_api.id(82510020864124823)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(3475019082156649)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23956788906187038)
,p_event_id=>wwv_flow_api.id(82510020864124823)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(3653336846391304)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(84889000856150713)
,p_name=>'Modificar Tipos'
,p_event_sequence=>170
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(84887900718150702)
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(84889128712150714)
,p_event_id=>wwv_flow_api.id(84889000856150713)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(84888007562150703)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(84890790369150730)
,p_name=>'ocultar vencidas'
,p_event_sequence=>200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_FILTRO'
,p_condition_element=>'P118_FILTRO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'VENCIDOS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(84890805043150731)
,p_event_id=>wwv_flow_api.id(84890790369150730)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(84890612539150729)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(85697705326401902)
,p_name=>'Modificar Tipo'
,p_event_sequence=>210
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_ESTDO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(85697896107401903)
,p_event_id=>wwv_flow_api.id(85697705326401902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_ESTDO_VALOR'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select b.dscrpcion estdo_name',
'     from gf_d_convenios_estado b',
'    where b.cdgo_cnvnio_estdo = :P118_ESTDO'))
,p_attribute_07=>'P118_ESTDO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(124171361474769314)
,p_name=>unistr('Modificar M\00E9todo')
,p_event_sequence=>220
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_CDGO_RVCTRIA_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124171448804769315)
,p_event_id=>wwv_flow_api.id(124171361474769314)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_CDGO_RVCTRIA_TPO_VLOR'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.dscrpcion estdo_name',
'     from gf_d_revocatoria_tipo a',
'    where a.cdgo_rvctria_tpo = :P118_CDGO_RVCTRIA_TPO;'))
,p_attribute_07=>'P118_CDGO_RVCTRIA_TPO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124172141177769322)
,p_event_id=>wwv_flow_api.id(124171361474769314)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(124170279245769303)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3654078538391311)
,p_name=>unistr('Modificar Tipo Modificaci\00F3n')
,p_event_sequence=>230
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_ESTDO_MDFCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3654127598391312)
,p_event_id=>wwv_flow_api.id(3654078538391311)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_CDGO_ESTDO_MDFCCION'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select initcap(a.dscrpcion) estdo_name',
'     from gf_d_convenios_mdfccn_estdo a',
'    where a.cdgo_cnvnio_mdfccion_estdo = :P118_ESTDO_MDFCCION;'))
,p_attribute_07=>'P118_ESTDO_MDFCCION'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3654294060391313)
,p_event_id=>wwv_flow_api.id(3654078538391311)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(3653336846391304)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(82511396016124836)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Borrar Sesion'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
