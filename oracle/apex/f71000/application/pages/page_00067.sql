prompt --application/pages/page_00067
begin
wwv_flow_api.create_page(
 p_id=>67
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Deuda por Destino IGAC'
,p_page_mode=>'MODAL'
,p_step_title=>'Dueda de &P66_NMBRE_IMPSTO.'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177318053164050589)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'580'
,p_dialog_width=>'80%'
,p_dialog_chained=>'N'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20190313165823'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(51185555937973212)
,p_plug_name=>'Deuda por Destinos IGAC - Vigencia &P66_VGNCIA'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody:t-Form--noPadding:t-Form--stretchInputs:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32619886619032610)
,p_plug_name=>'<i><b>Deuda por Destinos IGAC - Vigencia &P66_VGNCIA.</b></i>'
,p_region_name=>'pie1'
,p_parent_plug_id=>wwv_flow_api.id(51185555937973212)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P67_GRFCA_TPO'
,p_plug_display_when_cond2=>'DESTINO'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(32619924850032611)
,p_region_id=>wwv_flow_api.id(32619886619032610)
,p_chart_type=>'pie'
,p_height=>'310'
,p_animation_on_display=>'alphaFade'
,p_animation_on_data_change=>'slideToLeft'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
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
,p_legend_title=>'Destinos IGAC'
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
 p_id=>wwv_flow_api.id(32620013669032612)
,p_chart_id=>wwv_flow_api.id(32619924850032611)
,p_seq=>10
,p_name=>'Deuda por Destino IGAC S &P66_VGNCIA.'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select c.nmbre_dstno_igac, ',
'        count(a.id_sjto) count_sjto, ',
'        nvl(sum(vlor_dbe - vlor_hber),0) sldo_ttal,',
'       ''<b>Destino IGAC:</b> '' || c.nmbre_dstno_igac ||  '' <br> '' ||',
'       ''<b>Total Sujetos Impuestos:</b> '' || to_char(count(a.id_sjto),''999,999,999'') || '' <br> '' ||',
'       ''<b>Total Deuda:</b> $'' || to_char(nvl(sum(vlor_dbe - vlor_hber),0) ,''999,999,999,999,999'') tooltip',
'  from v_gf_g_movimientos_detalle a',
'  join si_i_predios b on a.id_sjto_impsto = b.id_sjto_impsto',
'  left join df_s_destinos_igac c on b.cdgo_dstno_igac = c.cdgo_dstno_igac',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'       and a.vgncia = :P66_VGNCIA ',
'       and a.id_impsto = :P66_ID_IMPSTO',
'  group by b.cdgo_dstno_igac, c.nmbre_dstno_igac',
' order by 3 desc'))
,p_items_value_column_name=>'SLDO_TTAL'
,p_items_label_column_name=>'NMBRE_DSTNO_IGAC'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_custom_column_name=>'SLDO_TTAL'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32620581442032617)
,p_plug_name=>'<i><b>Deuda por Uso de Suelo  - Vigencia &P66_VGNCIA.</b></i>'
,p_parent_plug_id=>wwv_flow_api.id(51185555937973212)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P67_GRFCA_TPO'
,p_plug_display_when_cond2=>'USO'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(32620798276032619)
,p_region_id=>wwv_flow_api.id(32620581442032617)
,p_chart_type=>'pie'
,p_animation_on_display=>'alphaFade'
,p_animation_on_data_change=>'slideToRight'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'smooth'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
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
,p_legend_title=>'Usos de Suelo'
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
 p_id=>wwv_flow_api.id(32620831191032620)
,p_chart_id=>wwv_flow_api.id(32620798276032619)
,p_seq=>10
,p_name=>'Deuda por Uso de Suelo'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select c.dscrpcion, ',
'        count(a.id_sjto) count_sjto, ',
'        nvl(sum(vlor_dbe - vlor_hber),0) sldo_ttal,',
'       ''<b>Uso de Suelo:</b> '' || c.dscrpcion ||  '' <br> '' ||',
'       ''<b>Total Sujetos Impuestos:</b> '' || to_char(count(a.id_sjto),''999,999,999'') || '' <br> '' ||',
'       ''<b>Total Deuda:</b> $'' || to_char(nvl(sum(vlor_dbe - vlor_hber),0) ,''999,999,999,999,999'') tooltip',
'  from v_gf_g_movimientos_detalle a',
'  join si_i_predios b on a.id_sjto_impsto = b.id_sjto_impsto',
'  left join df_c_predios_uso_suelo c on b.id_prdio_uso_slo = c.id_prdio_uso_slo',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'       and a.vgncia = :P66_VGNCIA ',
'       and a.id_impsto = :P66_ID_IMPSTO',
'  group by b.id_prdio_uso_slo, c.dscrpcion',
' order by c.dscrpcion'))
,p_items_value_column_name=>'SLDO_TTAL'
,p_items_label_column_name=>'DSCRPCION'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_custom_column_name=>'SLDO_TTAL'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32621118380032623)
,p_plug_name=>unistr('<i><b>Deuda por Clasificaci\00F3n de Predios  - Vigencia &P66_VGNCIA.</b></i>')
,p_parent_plug_id=>wwv_flow_api.id(51185555937973212)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P67_GRFCA_TPO'
,p_plug_display_when_cond2=>'CLASIFIACCION'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(32621221879032624)
,p_region_id=>wwv_flow_api.id(32621118380032623)
,p_chart_type=>'pie'
,p_animation_on_display=>'alphaFade'
,p_animation_on_data_change=>'slideToRight'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'smooth'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
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
,p_legend_title=>unistr('Clasificaci\00F3n de Predios')
,p_legend_position=>'end'
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
 p_id=>wwv_flow_api.id(32621395983032625)
,p_chart_id=>wwv_flow_api.id(32621221879032624)
,p_seq=>10
,p_name=>unistr('Deuda por Clasifiaci\00F3n de Predios')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.dscrpcion_prdio_clsfccion, ',
'        count(a.id_sjto) count_sjto, ',
'        nvl(sum(vlor_dbe - vlor_hber),0) sldo_ttal,',
unistr('       ''<b>Clasifiacci\00F3n:</b> '' || c.dscrpcion_prdio_clsfccion ||  '' <br> '' ||'),
'       ''<b>Total Sujetos Impuestos:</b> '' || to_char(count(a.id_sjto),''999,999,999'') || '' <br> '' ||',
'       ''<b>Total Deuda:</b> $'' || to_char(nvl(sum(vlor_dbe - vlor_hber),0) ,''999,999,999,999,999'') tooltip',
'  from v_gf_g_movimientos_detalle a',
'  join si_i_predios b on a.id_sjto_impsto = b.id_sjto_impsto',
'  left join df_s_predios_clasificacion c on b.cdgo_prdio_clsfccion = c.cdgo_prdio_clsfccion',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'       and a.vgncia = :P66_VGNCIA ',
'       and a.id_impsto = :P66_ID_IMPSTO',
'  group by b.cdgo_prdio_clsfccion, c.dscrpcion_prdio_clsfccion',
' order by c.dscrpcion_prdio_clsfccion'))
,p_items_value_column_name=>'SLDO_TTAL'
,p_items_label_column_name=>'DSCRPCION_PRDIO_CLSFCCION'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_custom_column_name=>'SLDO_TTAL'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32959470309518102)
,p_plug_name=>unistr('Regi\00F3n Bot\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(51185555937973212)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(32959580784518103)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(32959470309518102)
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32620432418032616)
,p_name=>'P67_GRFCA_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(32619886619032610)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51185480196973211)
,p_name=>'P67_SLDO_TTAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(51185555937973212)
,p_prompt=>'<i><b>Saldo Total:</b></i>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>9
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(32959656908518104)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(32959580784518103)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32959784393518105)
,p_event_id=>wwv_flow_api.id(32959656908518104)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
end;
/
