prompt --application/pages/page_00066
begin
wwv_flow_api.create_page(
 p_id=>66
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Deuda por Tributos y Estratos'
,p_page_mode=>'MODAL'
,p_step_title=>'Deuda por Tributos y Estratos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'520'
,p_dialog_width=>'80%'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20190313165704'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(31773402959501135)
,p_plug_name=>'Deuda por Tributos y Estratos'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(31773522098501136)
,p_region_id=>wwv_flow_api.id(31773402959501135)
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
 p_id=>wwv_flow_api.id(31773660236501137)
,p_chart_id=>wwv_flow_api.id(31773522098501136)
,p_seq=>10
,p_name=>'Vigencia Actual: &P66_VGNCIA.'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.dscrpcion_estrto, ',
'        count(c.id_sjto) count_sjto, ',
'        nvl(sum(vlor_dbe - vlor_hber),0) sldo_ttal,',
'       ''<b>VIGENCIA ACTUAL</b> <br>''||',
'       ''<b>Estrato:</b> '' || a.dscrpcion_estrto ||  '' <br> '' ||',
'       ''<b>Total Sujetos Impuestos:</b> '' || to_char(count(c.id_sjto),''999,999,999'') || '' <br> '' ||',
'       ''<b>Total Deuda:</b> $'' || to_char(nvl(sum(vlor_dbe - vlor_hber),0) ,''999,999,999,999,999'') tooltip',
'     from df_s_estratos a',
'     left join si_i_predios b on a.cdgo_estrto = b.cdgo_estrto',
'     left join v_gf_g_movimientos_detalle c on b.id_sjto_impsto = c.id_sjto_impsto ',
'       and cdgo_clnte = :F_CDGO_CLNTE',
'       and c.vgncia = :P66_VGNCIA ',
'       and c.id_impsto = :P66_ID_IMPSTO',
'     group by a.cdgo_estrto, a.dscrpcion_estrto',
' order by a.cdgo_estrto;'))
,p_items_value_column_name=>'SLDO_TTAL'
,p_items_label_column_name=>'DSCRPCION_ESTRTO'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'#FAE282'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(32619687395032608)
,p_chart_id=>wwv_flow_api.id(31773522098501136)
,p_seq=>20
,p_name=>'Vigencia Anterior: &P66_VGNCIA_ANTRIOR.'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.dscrpcion_estrto, ',
'        count(c.id_sjto) count_sjto, ',
'        nvl(sum(vlor_dbe - vlor_hber),0) sldo_ttal,',
'       ''<b>VIGENCIA ANTERIOR</b> <br>''||',
'       ''<b>Estrato:</b> '' || a.dscrpcion_estrto ||  '' <br> '' ||',
'       ''<b>Total Sujetos Impuestos:</b> '' || to_char(count(c.id_sjto),''999,999,999'') || '' <br> '' ||',
'       ''<b>Total Deuda:</b> $'' || to_char(nvl(sum(vlor_dbe - vlor_hber),0) ,''999,999,999,999,999'') tooltip',
'     from df_s_estratos a',
'     left join si_i_predios b on a.cdgo_estrto = b.cdgo_estrto',
'     left join v_gf_g_movimientos_detalle c on b.id_sjto_impsto = c.id_sjto_impsto ',
'       and cdgo_clnte = :F_CDGO_CLNTE',
'       and c.vgncia = :P66_VGNCIA - 1',
'       and c.id_impsto = :P66_ID_IMPSTO',
'     group by a.cdgo_estrto, a.dscrpcion_estrto',
' order by a.cdgo_estrto;'))
,p_items_value_column_name=>'SLDO_TTAL'
,p_items_label_column_name=>'DSCRPCION_ESTRTO'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(32621582685032627)
,p_chart_id=>wwv_flow_api.id(31773522098501136)
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
 p_id=>wwv_flow_api.id(32621681162032628)
,p_chart_id=>wwv_flow_api.id(31773522098501136)
,p_axis=>'y'
,p_is_rendered=>'on'
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(32960040156518108)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(31773402959501135)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(32619745766032609)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(31773402959501135)
,p_button_name=>'BTN_VER_DESTINO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Destinos IGAC'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:67:&SESSION.::&DEBUG.:RP:P67_GRFCA_TPO,P67_SLDO_TTAL:DESTINO,&P66_SLDO_TTAL.'
,p_icon_css_classes=>'fa-badges'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(32621421691032626)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(31773402959501135)
,p_button_name=>'BTN_VER_CLASIFICACION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Clasificaci\00F3n')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:67:&SESSION.::&DEBUG.:RP:P67_GRFCA_TPO:CLASIFIACCION'
,p_icon_css_classes=>'fa-pie-chart'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(32620319059032615)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(31773402959501135)
,p_button_name=>'BTN_VER_USO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Uso Suelo'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:67:&SESSION.::&DEBUG.:RP:P67_GRFCA_TPO:USO'
,p_icon_css_classes=>'fa-shapes'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31774039940501141)
,p_name=>'P66_VGNCIA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(31773402959501135)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31774245941501143)
,p_name=>'P66_ID_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(31773402959501135)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32620924257032621)
,p_name=>'P66_NMBRE_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(31773402959501135)
,p_source=>'select nmbre_impsto from df_c_impuestos where id_impsto = :P66_ID_IMPSTO'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>1
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32960305190518111)
,p_name=>'P66_VGNCIA_ANTRIOR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(31773402959501135)
,p_source=>'&P65_VGNCIA. - 1'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51185324827973210)
,p_name=>'P66_SLDO_TTAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(31773402959501135)
,p_prompt=>'<b>Saldo Total: </b>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(32960111817518109)
,p_name=>'Close Dialoog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(32960040156518108)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32960229330518110)
,p_event_id=>wwv_flow_api.id(32960111817518109)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(32960512435518113)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calcular Vigencia anterior'
,p_process_sql_clob=>'select &P66_VGNCIA. - 1 into :P66_VGNCIA_ANTRIOR from dual;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
