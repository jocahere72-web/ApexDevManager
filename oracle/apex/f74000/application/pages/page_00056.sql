prompt --application/pages/page_00056
begin
wwv_flow_api.create_page(
 p_id=>56
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>'Detalle Panel de Control'
,p_step_title=>'Panel de Control'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-noDataMsg {',
'    padding: 0;',
'}'))
,p_step_template=>wwv_flow_api.id(36470205860968633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HMARTINEZ'
,p_last_upd_yyyymmddhh24miss=>'20200806172958'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12837702948983804)
,p_plug_name=>'Container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12837990902983806)
,p_plug_name=>'Tab Container'
,p_parent_plug_id=>wwv_flow_api.id(12837702948983804)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--fillLabels:t-TabsRegion-mod--simple:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(36509862944968653)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12838004187983807)
,p_plug_name=>'INFORME'
,p_parent_plug_id=>wwv_flow_api.id(12837990902983806)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P56_CDGO_PRGRMA = ''O'' or :P56_CDGO_PRGRMA = ''I'''
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12839782199983824)
,p_plug_name=>'Declaraciones'
,p_parent_plug_id=>wwv_flow_api.id(12838004187983807)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(12839842515983825)
,p_region_id=>wwv_flow_api.id(12839782199983824)
,p_chart_type=>'donut'
,p_title=>'Declaraciones'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
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
 p_id=>wwv_flow_api.id(12839924647983826)
,p_chart_id=>wwv_flow_api.id(12839842515983825)
,p_seq=>10
,p_name=>unistr('Declaraci\00F3n Determinaci\00F3n Oficial ')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  count(*) as total,',
unistr('        case when d.id_cnddto_vgncia is null then ''Declaraciones'' else ''Determinaci\00F3n Oficial'' end as "Acci\00F3n",'),
unistr('        ''<b>'' || case when d.id_cnddto_vgncia is null then ''Declaraciones'' else ''Determinaci\00F3n Oficial'' end  || '':</b> '' || count(*) || ''<br>'' as tooltip'),
'from v_fi_g_candidatos            a',
'join fi_g_candidatos_vigencia   b   on  a.id_cnddto             =   b.id_cnddto',
'join fi_g_fiscalizacion_expdnte c   on  a.id_cnddto             =   c.id_cnddto',
'join gi_g_declaraciones d           on  b.id_dclrcion_vgncia_frmlrio = d.id_dclrcion_vgncia_frmlrio',
'                                    and d.id_sjto_impsto = a.id_sjto_impsto',
'                                    and d.cdgo_dclrcion_estdo in (''PRS'', ''APL'')                                ',
'where a.cdgo_clnte = :F_CDGO_CLNTE ',
'and a.id_prgrma = :P56_ID_PRGRMA',
'and a.id_sbprgrma = nvl(:P56_SBPRGRMA,a.id_sbprgrma)',
'and c.cdgo_expdnte_estdo = ''CER''',
'and to_char(c.fcha_aprtra, ''DD/MM/YYYY'') between nvl(:P56_FCHA_INCIO, to_char(c.fcha_aprtra, ''DD/MM/YYYY'') ) and nvl(:P56_FCHA_FIN, to_char(c.fcha_aprtra, ''DD/MM/YYYY''))',
unistr('group by case when d.id_cnddto_vgncia is null then ''Declaraciones'' else ''Determinaci\00F3n Oficial'' end '),
'',
'',
'',
'',
''))
,p_items_value_column_name=>'TOTAL'
,p_items_label_column_name=>unistr('Acci\00F3n')
,p_items_short_desc_column_name=>'TOOLTIP'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12840263744983829)
,p_plug_name=>'Recaudo Total'
,p_parent_plug_id=>wwv_flow_api.id(12838004187983807)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--noPadding:t-Form--stretchInputs:margin-top-sm:margin-left-sm:margin-right-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>6
,p_plug_display_column=>4
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  to_char( nvl( sum(e.vlor) , 0 ) , ''FM$999G999G999G999G999G999G990'' ) as ttal_rcaudo,',
'        ''Total Recaudo'' as title',
'from v_fi_g_candidatos          a',
'join fi_g_candidatos_vigencia   b   on  a.id_cnddto             =   b.id_cnddto',
'join fi_g_fiscalizacion_expdnte c   on  a.id_cnddto             =   c.id_cnddto',
'join gi_g_declaraciones d           on  b.id_dclrcion_vgncia_frmlrio = d.id_dclrcion_vgncia_frmlrio',
'                                    and d.id_sjto_impsto = a.id_sjto_impsto',
'                                    and d.cdgo_dclrcion_estdo in (''PRS'', ''APL'')',
'join re_g_recaudos e on d.id_rcdo = e.id_rcdo ',
'join re_g_recaudos_control f on e.id_rcdo_cntrol  = f.id_rcdo_cntrol                                    ',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_prgrma = :P56_ID_PRGRMA',
'and a.id_sbprgrma = nvl(:P56_SBPRGRMA,a.id_sbprgrma)',
'and e.cdgo_rcdo_orgn_tpo = ''DL''',
'and c.cdgo_expdnte_estdo = ''CER''',
'and to_char(c.fcha_aprtra, ''DD/MM/YYYY'') between nvl(:P56_FCHA_INCIO, to_char(c.fcha_aprtra, ''DD/MM/YYYY'') ) and nvl(:P56_FCHA_FIN, to_char(c.fcha_aprtra, ''DD/MM/YYYY''));'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'TTAL_RCAUDO'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TITLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12840342959983830)
,p_plug_name=>unistr('Declaraci\00F3n&Determinaci\00F3nOficial')
,p_parent_plug_id=>wwv_flow_api.id(12838004187983807)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select  case when d.id_cnddto_vgncia is null then ''Declaraciones'' else ''Determinaci\00F3n Oficial'' end as Tittle,'),
'        count(*) as total',
'from v_fi_g_candidatos            a',
'join fi_g_candidatos_vigencia   b   on  a.id_cnddto             =   b.id_cnddto',
'join fi_g_fiscalizacion_expdnte c   on  a.id_cnddto             =   c.id_cnddto',
'join gi_g_declaraciones d           on  b.id_dclrcion_vgncia_frmlrio = d.id_dclrcion_vgncia_frmlrio',
'                                    and d.id_sjto_impsto = a.id_sjto_impsto',
'                                    and d.cdgo_dclrcion_estdo in (''PRS'', ''APL'')                                ',
'where a.cdgo_clnte = :F_CDGO_CLNTE ',
'and a.id_prgrma = :P56_ID_PRGRMA',
'and a.id_sbprgrma = nvl(:P56_SBPRGRMA,a.id_sbprgrma)',
'and c.cdgo_expdnte_estdo = ''CER''',
'and to_char(c.fcha_aprtra, ''DD/MM/YYYY'') between nvl(:P56_FCHA_INCIO, to_char(c.fcha_aprtra, ''DD/MM/YYYY'') ) and nvl(:P56_FCHA_FIN, to_char(c.fcha_aprtra, ''DD/MM/YYYY''))',
unistr('group by case when d.id_cnddto_vgncia is null then ''Declaraciones'' else ''Determinaci\00F3n Oficial'' end;')))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'TOTAL'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'TITTLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12838658697983813)
,p_plug_name=>'SUBPROGRAMAS'
,p_parent_plug_id=>wwv_flow_api.id(12837990902983806)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12837875148983805)
,p_plug_name=>'SubProgramas'
,p_parent_plug_id=>wwv_flow_api.id(12838658697983813)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(a.id_sbprgrma) as cantidad,',
'       a.nmbre_sbprgrma',
'from v_fi_g_candidatos              a',
'join fi_g_fiscalizacion_expdnte     b   on  a.id_cnddto             =   b.id_cnddto',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and b.cdgo_expdnte_estdo = ''CER''',
'and a.id_prgrma = :P56_ID_PRGRMA',
'and a.id_sbprgrma = nvl(:P56_SBPRGRMA,a.id_sbprgrma)',
'and to_char(b.fcha_aprtra, ''DD/MM/YYYY'') between nvl(:P56_FCHA_INCIO, to_char(b.fcha_aprtra, ''DD/MM/YYYY'') ) and nvl(:P56_FCHA_FIN, to_char(b.fcha_aprtra, ''DD/MM/YYYY''))',
'group by a.nmbre_sbprgrma;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'CANTIDAD'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'NMBRE_SBPRGRMA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12838151283983808)
,p_plug_name=>'Sub_Programa'
,p_parent_plug_id=>wwv_flow_api.id(12838658697983813)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(12838279428983809)
,p_region_id=>wwv_flow_api.id(12838151283983808)
,p_chart_type=>'donut'
,p_title=>'SubPrograma'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
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
 p_id=>wwv_flow_api.id(12838369660983810)
,p_chart_id=>wwv_flow_api.id(12838279428983809)
,p_seq=>10
,p_name=>'Consulta SubProgramas'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_sbprgrma,',
'        count(a.id_sbprgrma) as cantidad,',
'       ''<b>'' || a.nmbre_sbprgrma  || '':</b> '' || count(a.id_sbprgrma) || ''<br>'' as tooltip',
'from v_fi_g_candidatos              a',
'join fi_g_fiscalizacion_expdnte     b on a.id_cnddto = b.id_cnddto',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_prgrma = :P56_ID_PRGRMA',
'and b.cdgo_expdnte_estdo = ''CER''',
'and a.id_sbprgrma = nvl(:P56_SBPRGRMA,a.id_sbprgrma)',
'and to_char(b.fcha_aprtra, ''DD/MM/YYYY'') between nvl(:P56_FCHA_INCIO, to_char(b.fcha_aprtra, ''DD/MM/YYYY'') ) and nvl(:P56_FCHA_FIN, to_char(b.fcha_aprtra, ''DD/MM/YYYY''))',
'group by a.nmbre_sbprgrma;'))
,p_items_value_column_name=>'CANTIDAD'
,p_items_label_column_name=>'NMBRE_SBPRGRMA'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12838889584983815)
,p_plug_name=>'Vigencia'
,p_parent_plug_id=>wwv_flow_api.id(12838658697983813)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(12839366490983820)
,p_region_id=>wwv_flow_api.id(12838889584983815)
,p_chart_type=>'bar'
,p_title=>'Vigencia'
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
 p_id=>wwv_flow_api.id(12839424616983821)
,p_chart_id=>wwv_flow_api.id(12839366490983820)
,p_seq=>10
,p_name=>'SubPrograma'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_sbprgrma,',
'        count(a.id_sbprgrma) as cantidad,',
'        c.vgncia,',
'        ''<b>Vigencia:</b> '' || c.vgncia || ''<br>'' ||',
'        ''<b>'' || a.nmbre_sbprgrma  || '':</b> '' || count(a.id_sbprgrma) || ''<br>'' as tooltip',
'from v_fi_g_candidatos              a',
'join fi_g_fiscalizacion_expdnte     b on a.id_cnddto =   b.id_cnddto',
'join fi_g_candidatos_vigencia       c on a.id_cnddto = c.id_cnddto  ',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_prgrma = :P56_ID_PRGRMA',
'and a.id_sbprgrma = nvl(:P56_SBPRGRMA,a.id_sbprgrma)',
'and to_char(b.fcha_aprtra, ''DD/MM/YYYY'') between nvl(:P56_FCHA_INCIO, to_char(b.fcha_aprtra, ''DD/MM/YYYY'') ) and nvl(:P56_FCHA_FIN, to_char(b.fcha_aprtra, ''DD/MM/YYYY''))',
'and b.cdgo_expdnte_estdo = ''CER''',
'group by a.nmbre_sbprgrma,',
'         c.vgncia;'))
,p_series_name_column_name=>'NMBRE_SBPRGRMA'
,p_items_value_column_name=>'CANTIDAD'
,p_items_label_column_name=>'VGNCIA'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(12839689502983823)
,p_chart_id=>wwv_flow_api.id(12839366490983820)
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
 p_id=>wwv_flow_api.id(12839554585983822)
,p_chart_id=>wwv_flow_api.id(12839366490983820)
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
 p_id=>wwv_flow_api.id(14544416915012603)
,p_plug_name=>'Recaudo Total'
,p_parent_plug_id=>wwv_flow_api.id(12838658697983813)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char( nvl( sum(b.vlor_hber) , 0 ) , ''FM$999G999G999G999G999G999G990'' ) as ttal_rcaudo,',
'        ''Total Recaudo'' as title',
'from gf_g_movimientos_financiero a',
'join gf_g_movimientos_detalle b on a.id_mvmnto_fncro = b.id_mvmnto_fncro',
'where a.cdgo_mvmnto_orgn = ''FS''',
'and b.cdgo_mvmnto_orgn = ''RE''',
'and exists (',
'                select  1',
'                from v_fi_g_candidatos          c',
'                join fi_g_candidatos_vigencia   d   on  c.id_cnddto             =   d.id_cnddto',
'                join fi_g_fiscalizacion_expdnte e   on  c.id_cnddto             =   e.id_cnddto',
'                where c.cdgo_clnte = :F_CDGO_CLNTE',
'                and d.id_lqdcion = a.id_orgen',
'                and c.id_prgrma = :P56_ID_PRGRMA',
'                and c.id_sbprgrma = nvl(:P56_SBPRGRMA,c.id_sbprgrma)',
'                and e.cdgo_expdnte_estdo = ''CER''',
'                and to_char(e.fcha_aprtra, ''DD/MM/YYYY'') between nvl(:P56_FCHA_INCIO, to_char(e.fcha_aprtra, ''DD/MM/YYYY'') ) and nvl(:P56_FCHA_FIN, to_char(e.fcha_aprtra, ''DD/MM/YYYY''))',
'           );'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'TTAL_RCAUDO'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TITLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94033884681056760)
,p_plug_name=>unistr('Par\00E1metros busquedas ')
,p_parent_plug_id=>wwv_flow_api.id(12837702948983804)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36491913657968646)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(51997870584615992)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'    </b>',
'</h5>',
unistr('<i>Funcionalidad que permite consultar, ingresar, modificar, eliminar y activar o desactivar los Programas de Fiscalizaci\00F3n.'),
'        ',
'<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.<i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(392574690167572523)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14549606140023260)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(392574690167572523)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:55:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12957863447814685)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(94033884681056760)
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
 p_id=>wwv_flow_api.id(12840432768983831)
,p_name=>'P56_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(12837702948983804)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12958657892814690)
,p_name=>'P56_SBPRGRMA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(94033884681056760)
,p_prompt=>'SubPrograma'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_sbprgrma as d,',
'        a.id_sbprgrma as r ',
'from fi_d_subprogramas a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_prgrma = :P56_ID_PRGRMA;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12959099871814690)
,p_name=>'P56_FCHA_INCIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(94033884681056760)
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
 p_id=>wwv_flow_api.id(12959495661814691)
,p_name=>'P56_FCHA_FIN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(94033884681056760)
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
 p_id=>wwv_flow_api.id(12962916668473901)
,p_name=>'P56_ID_PRGRMA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(12837702948983804)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12963224661473904)
,p_name=>'P56_CDGO_PRGRMA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(12837702948983804)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12963396473473905)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('C\00F3digo Programa')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select a.cdgo_prgrma',
'    into :P56_CDGO_PRGRMA',
'    from fi_d_programas a',
'    where a.id_prgrma = :P56_ID_PRGRMA;',
'',
'exception',
'    when others then',
'        :P56_CDGO_PRGRMA := null;',
'end;    '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
