prompt --application/pages/page_00055
begin
wwv_flow_api.create_page(
 p_id=>55
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>'Panel De Control'
,p_step_title=>'Panel De Control'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HMARTINEZ'
,p_last_upd_yyyymmddhh24miss=>'20200806114934'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(74736769181921707)
,p_plug_name=>'Container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12837620635983803)
,p_plug_name=>'OMISOS'
,p_parent_plug_id=>wwv_flow_api.id(74736769181921707)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(a.id_prgrma) as cantidad,',
'       a.nmbre_prgrma,',
'       ( apex_util.prepare_url(''f?p='' || :APP_ID || '':56:'' || :APP_SESSION || ''::NO:56:P56_ID_PRGRMA:'' || a.id_prgrma ) ) as url',
'from v_fi_g_candidatos              a',
'join fi_g_fiscalizacion_expdnte     b   on  a.id_cnddto = b.id_cnddto',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_prgrma  = nvl(:P55_PRGRMA,a.id_prgrma )',
'and a.id_impsto = nvl(:P55_IMPUESTO, a.id_impsto)',
'and b.cdgo_expdnte_estdo = ''CER''',
'and to_char(b.fcha_aprtra, ''DD/MM/YYYY'') between nvl(:P55_FCHA_INCIO, to_char(b.fcha_aprtra, ''DD/MM/YYYY'') ) and nvl(:P55_FCHA_FIN, to_char(b.fcha_aprtra, ''DD/MM/YYYY''))',
'group by a.nmbre_prgrma, ( apex_util.prepare_url(''f?p='' || :APP_ID || '':56:'' || :APP_SESSION || ''::NO:56:P56_ID_PRGRMA:'' || a.id_prgrma ) );',
'',
'',
''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'CANTIDAD'
,p_attribute_04=>'&URL.'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'NMBRE_PRGRMA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12991839925188406)
,p_plug_name=>'Programas'
,p_parent_plug_id=>wwv_flow_api.id(74736769181921707)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(12991972355188407)
,p_region_id=>wwv_flow_api.id(12991839925188406)
,p_chart_type=>'donut'
,p_title=>'Expedientes Por Programas'
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
 p_id=>wwv_flow_api.id(12992093154188408)
,p_chart_id=>wwv_flow_api.id(12991972355188407)
,p_seq=>10
,p_name=>'Programas'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_prgrma,',
'        count(a.id_prgrma) as cantidad,',
'       ''<b>'' || a.nmbre_prgrma  || '':</b> '' || count(a.id_prgrma) || ''<br>'' as tooltip',
'from v_fi_g_candidatos              a',
'join fi_g_fiscalizacion_expdnte     b on a.id_cnddto = b.id_cnddto',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_prgrma = nvl(:P55_PRGRMA, a.id_prgrma)',
'and b.cdgo_expdnte_estdo = ''CER''',
'and to_char(b.fcha_aprtra, ''DD/MM/YYYY'') between nvl(:P55_FCHA_INCIO, to_char(b.fcha_aprtra, ''DD/MM/YYYY'') ) and nvl(:P55_FCHA_FIN, to_char(b.fcha_aprtra, ''DD/MM/YYYY''))',
'group by a.nmbre_prgrma;'))
,p_items_value_column_name=>'CANTIDAD'
,p_items_label_column_name=>'NMBRE_PRGRMA'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_items_label_font_color=>'#000000'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12992321723188411)
,p_plug_name=>'Vigencias'
,p_parent_plug_id=>wwv_flow_api.id(74736769181921707)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(12992493921188412)
,p_region_id=>wwv_flow_api.id(12992321723188411)
,p_chart_type=>'bar'
,p_title=>'Expedientes Por Vigencias'
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
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(12992527765188413)
,p_chart_id=>wwv_flow_api.id(12992493921188412)
,p_seq=>10
,p_name=>'Vigencias'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_prgrma,',
'        count(a.id_prgrma) as cantidad,',
'        c.vgncia,',
'        ''<b>Vigencia:</b> '' || c.vgncia || ''<br>'' ||',
'        ''<b>'' || a.nmbre_prgrma  || '':</b> '' || count(a.id_prgrma) || ''<br>'' as tooltip',
'from v_fi_g_candidatos              a',
'join fi_g_fiscalizacion_expdnte     b on a.id_cnddto =   b.id_cnddto',
'join fi_g_candidatos_vigencia       c on a.id_cnddto = c.id_cnddto  ',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_prgrma = nvl(:P55_PRGRMA, a.id_prgrma)',
'and to_char(b.fcha_aprtra, ''DD/MM/YYYY'') between nvl(:P55_FCHA_INCIO, to_char(b.fcha_aprtra, ''DD/MM/YYYY'') ) and nvl(:P55_FCHA_FIN, to_char(b.fcha_aprtra, ''DD/MM/YYYY''))',
'and b.cdgo_expdnte_estdo = ''CER''',
'group by a.nmbre_prgrma,',
'         c.vgncia;'))
,p_series_name_column_name=>'NMBRE_PRGRMA'
,p_items_value_column_name=>'CANTIDAD'
,p_items_label_column_name=>'VGNCIA'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(12992793916188415)
,p_chart_id=>wwv_flow_api.id(12992493921188412)
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
 p_id=>wwv_flow_api.id(12992677570188414)
,p_chart_id=>wwv_flow_api.id(12992493921188412)
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
 p_id=>wwv_flow_api.id(12992841842188416)
,p_plug_name=>unistr('Tipo Declaraci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(74736769181921707)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(12992968834188417)
,p_region_id=>wwv_flow_api.id(12992841842188416)
,p_chart_type=>'donut'
,p_title=>'Expediente Por Declaraciones'
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
 p_id=>wwv_flow_api.id(12993094319188418)
,p_chart_id=>wwv_flow_api.id(12992968834188417)
,p_seq=>10
,p_name=>unistr('Tipo de Declaraci\00F3n')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(f.id_dclrcn_tpo) as cantidad,',
'       f.dscrpcion,',
'       ''<b>'' || f.dscrpcion  || '':</b> '' || count(f.id_dclrcn_tpo) || ''<br>'' as tooltip',
'from v_fi_g_candidatos          a',
'join fi_g_candidatos_vigencia   b   on  a.id_cnddto             =   b.id_cnddto',
'join fi_g_fiscalizacion_expdnte c   on  a.id_cnddto             =   c.id_cnddto',
'join gi_d_dclrcnes_vgncias_frmlr d  on  b.id_dclrcion_vgncia_frmlrio = d.id_dclrcion_vgncia_frmlrio',
'join GI_D_DCLRCNES_TPOS_VGNCIAS e   on  d.id_dclrcion_tpo_vgncia = e.id_dclrcion_tpo_vgncia',
'join gi_d_declaraciones_tipo f on e.id_dclrcn_tpo = f.id_dclrcn_tpo',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_prgrma = nvl(:P55_PRGRMA, a.id_prgrma)',
'and c.cdgo_expdnte_estdo = ''CER''',
'and to_char(c.fcha_aprtra, ''DD/MM/YYYY'') between nvl(:P55_FCHA_INCIO, to_char(c.fcha_aprtra, ''DD/MM/YYYY'') ) and nvl(:P55_FCHA_FIN, to_char(c.fcha_aprtra, ''DD/MM/YYYY''))',
'group by f.dscrpcion;'))
,p_items_value_column_name=>'CANTIDAD'
,p_items_label_column_name=>'DSCRPCION'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_items_label_font_color=>'#000000'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12993320523188421)
,p_plug_name=>'Expediendte Por Tributo'
,p_parent_plug_id=>wwv_flow_api.id(74736769181921707)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(12993404981188422)
,p_region_id=>wwv_flow_api.id(12993320523188421)
,p_chart_type=>'bar'
,p_title=>'Expediente Por Tributo'
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
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(12993574292188423)
,p_chart_id=>wwv_flow_api.id(12993404981188422)
,p_seq=>10
,p_name=>'Expedientes Por Tributos'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_prgrma,',
'        count(a.id_prgrma) as cantidad,',
'        a.nmbre_impsto,',
'        ''<b>Tributo:</b> '' || a.nmbre_impsto || ''<br>'' ||',
'        ''<b>'' || a.nmbre_prgrma  || '':</b> '' || count(a.id_prgrma) || ''<br>'' as tooltip',
'from v_fi_g_candidatos              a',
'join fi_g_fiscalizacion_expdnte     b on a.id_cnddto =   b.id_cnddto',
'join fi_g_candidatos_vigencia       c on a.id_cnddto = c.id_cnddto  ',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_prgrma = nvl(:P55_PRGRMA, a.id_prgrma)',
'and to_char(b.fcha_aprtra, ''DD/MM/YYYY'') between nvl(:P55_FCHA_INCIO, to_char(b.fcha_aprtra, ''DD/MM/YYYY'') ) and nvl(:P55_FCHA_FIN, to_char(b.fcha_aprtra, ''DD/MM/YYYY''))',
'and b.cdgo_expdnte_estdo = ''CER''',
'group by a.nmbre_prgrma,',
'         a.nmbre_impsto;'))
,p_series_name_column_name=>'NMBRE_PRGRMA'
,p_items_value_column_name=>'CANTIDAD'
,p_items_label_column_name=>'NMBRE_IMPSTO'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(14517776120585001)
,p_chart_id=>wwv_flow_api.id(12993404981188422)
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
 p_id=>wwv_flow_api.id(14517868063585002)
,p_chart_id=>wwv_flow_api.id(12993404981188422)
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
 p_id=>wwv_flow_api.id(81076285768242077)
,p_plug_name=>unistr('Par\00E1metros busquedas ')
,p_parent_plug_id=>wwv_flow_api.id(74736769181921707)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36491913657968646)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12929161865102781)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(81076285768242077)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12915756195987709)
,p_name=>'P55_FCHA_INCIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(81076285768242077)
,p_prompt=>'Fecha Inicio'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12915837050987710)
,p_name=>'P55_FCHA_FIN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(81076285768242077)
,p_prompt=>'Fecha Fin'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P120_FCHA_INCIO.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12929584481102783)
,p_name=>'P55_IMPUESTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(81076285768242077)
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
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12929971143102787)
,p_name=>'P55_PRGRMA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(81076285768242077)
,p_prompt=>'Programa'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_prgrma as d,',
'        a.cdgo_prgrma as r ',
'from fi_d_programas a;  '))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
end;
/
