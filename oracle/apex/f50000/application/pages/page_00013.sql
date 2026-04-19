prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Informe Aval\00FAos Vehiculos')
,p_step_title=>unistr('Informe Aval\00FAos Vehiculos')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180918161352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(109706794254872020)
,p_plug_name=>unistr('Informe Aval\00FAos Varia Vehiculos')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_VHCLO_AVLUO_VRIA,',
'       CDGO_CLNTE,',
'       VGNCIA,',
'       CDGO_VHCLO_VRCION_TPO,',
'       VLOR,',
'       TPO_OPRCION,',
'       TPO_VLOR,',
'       ORDEN',
'  from DF_C_VEHICULOS_AVALUO_VARIA'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(109706830552872020)
,p_name=>unistr('Informe Aval\00FAos Vehiculos')
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP:P5_ID_VHCLO_AVLUO_VRIA:#ID_VHCLO_AVLUO_VRIA#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JALCOCER'
,p_internal_uid=>109706830552872020
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(109707222356872049)
,p_db_column_name=>'ID_VHCLO_AVLUO_VRIA'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Vhclo Avluo Vria'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(109707651326872052)
,p_db_column_name=>'CDGO_CLNTE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>unistr('C\00F3digo Cliente')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(109708029870872052)
,p_db_column_name=>'VGNCIA'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(109708458675872053)
,p_db_column_name=>'CDGO_VHCLO_VRCION_TPO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>unistr('Tipo Variaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(109708843643872053)
,p_db_column_name=>'VLOR'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Valor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(109709232050872053)
,p_db_column_name=>'TPO_OPRCION'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>unistr('Tipo Operaci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(99535300782675535)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(109709691110872054)
,p_db_column_name=>'TPO_VLOR'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Tipo Valor'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(109710052484872054)
,p_db_column_name=>'ORDEN'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Orden'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(109711100791877556)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1097112'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_VHCLO_AVLUO_VRIA:CDGO_CLNTE:VGNCIA:CDGO_VHCLO_VRCION_TPO:VLOR:TPO_OPRCION:TPO_VLOR:ORDEN'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(109627790694348419)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(109706794254872020)
,p_button_name=>unistr('Nuevo_Aval\00FAos_Varia_Vehiculo')
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nuevo aval\00FAos varia vehiculo')
,p_button_position=>'TOP'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP,5::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(109662783562814902)
,p_name=>'Refresh_region'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(109706794254872020)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(109662894556814903)
,p_event_id=>wwv_flow_api.id(109662783562814902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(109706794254872020)
,p_stop_execution_on_error=>'Y'
);
end;
/
