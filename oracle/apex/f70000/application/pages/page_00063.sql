prompt --application/pages/page_00063
begin
wwv_flow_api.create_page(
 p_id=>63
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Generar Documentos Determinaci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Generaci\00F3n de Actos / Documentos del Lote de Determinaci\00F3n No. &P63_ID_DTRMNCION_LTE. - Tipo de Generaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_dialog_width=>'80%'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20191125141224'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(39659352116056203)
,p_name=>unistr('Tipo de Generaci\00F3n')
,p_template=>wwv_flow_api.id(164080910676707690)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--featured:t-Cards--displayIcons:t-Cards--cols:t-Cards--animColorFill'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ''ACTOS'' card_title, ',
'        ''fa-file-code-o'' card_icon,',
unistr('        ''Seleccione para generar un archivo de texto con la especificaci\00F3n dada para enviar al impresor.''card_text,'),
'        '''' card_subtext,',
'         APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID ||'':106:'' || :APP_SESSION || ''::::P63_GNRCION_TPO:ACT'' ) card_link',
'  from dual',
' union  ',
' select ''DOCUMENTOS DE PAGO'' card_title, ',
'        ''fa-file-pdf-o'' card_icon,',
'        ''Seleccione para generar las Liquidaciones Factura en PDF.''card_text,',
'        '''' card_subtext,',
'         APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID ||'':103:'' || :APP_SESSION || ''::::P63_GNRCION_TPO:DCM'' ) card_link',
'  from dual '))
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(164088115137707710)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39660015838056210)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39660357493056213)
,p_query_column_id=>2
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>2
,p_column_heading=>'Card Icon'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39660404292056214)
,p_query_column_id=>3
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39660518375056215)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>4
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39660619280056216)
,p_query_column_id=>5
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>5
,p_column_heading=>'Card Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2378311517094044)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(39659352116056203)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-calendar-ban'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2376919299094030)
,p_name=>'P63_ID_DTRMNCION_LTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(39659352116056203)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33509658787844313)
,p_name=>'P63_GNRCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(39659352116056203)
,p_item_default=>'ACT'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106239241320463804)
,p_name=>'P63_ID_DCMNTO_LTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(39659352116056203)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2378484536094045)
,p_name=>unistr('Al hacer clic en el bot\00F3n de regresar cerrar la modal')
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2378311517094044)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2378567937094046)
,p_event_id=>wwv_flow_api.id(2378484536094045)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
end;
/
