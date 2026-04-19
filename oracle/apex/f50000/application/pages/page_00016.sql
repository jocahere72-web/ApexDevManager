prompt --application/pages/page_00016
begin
wwv_flow_api.create_page(
 p_id=>16
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Informe de Funcionarios'
,p_step_title=>'Funcionarios'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_upd_yyyymmddhh24miss=>'20191022165126'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95683551928412773)
,p_plug_name=>'Funcionarios'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29551431083068507)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_FNCNRIO,',
'       CDGO_IDNTFCCION_TPO,',
'       NMRO_IDNTFCCION,',
'       NMBRE_FNCNRIO,',
'       ID_OFCNA,',
'       DRCCION,',
'       TLFNO,',
'       EMAIL,',
'       ID_CRGO,',
'       CDGO_PRFSION,',
'       ACTVO',
'  from DF_C_FUNCIONARIOS'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(95683643284412773)
,p_name=>'Funcionarios'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP:P17_ID_FNCNRIO:#ID_FNCNRIO#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'AURUETA'
,p_internal_uid=>95683643284412773
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95684068340412791)
,p_db_column_name=>'ID_FNCNRIO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Fncnrio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95684468535412800)
,p_db_column_name=>'CDGO_IDNTFCCION_TPO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>unistr('Tipo de identificaci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(95877600331258891)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95684891270412801)
,p_db_column_name=>'NMRO_IDNTFCCION'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>unistr('N\00FAmero de identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95685271181412801)
,p_db_column_name=>'NMBRE_FNCNRIO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95685655929412801)
,p_db_column_name=>'ID_OFCNA'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Oficina'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(96947507370750692)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95686007822412802)
,p_db_column_name=>'DRCCION'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>unistr('Direcci\00F3n ')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95686401291412803)
,p_db_column_name=>'TLFNO'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>unistr('Tel\00E9fono')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95686839350412803)
,p_db_column_name=>'EMAIL'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Email'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95687206394412803)
,p_db_column_name=>'ID_CRGO'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Cargo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(96950450822767086)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95687696228412804)
,p_db_column_name=>'CDGO_PRFSION'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>unistr('Profesi\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(96951033975774003)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95688036170412804)
,p_db_column_name=>'ACTVO'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(95331998128508185)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(95695631863429452)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'956957'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_FNCNRIO:CDGO_IDNTFCCION_TPO:NMRO_IDNTFCCION:NMBRE_FNCNRIO:ID_OFCNA:DRCCION:TLFNO:EMAIL:ID_CRGO:CDGO_PRFSION:ACTVO'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95536289781538311)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(95683551928412773)
,p_button_name=>'BTN_NUEVO_FUNCIONARIO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo funcionario'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP,17::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(95536398748538312)
,p_name=>'Al cerrar dialogo'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95536445591538313)
,p_event_id=>wwv_flow_api.id(95536398748538312)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(95683551928412773)
,p_stop_execution_on_error=>'Y'
);
end;
/
