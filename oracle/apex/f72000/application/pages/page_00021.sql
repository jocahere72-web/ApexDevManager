prompt --application/pages/page_00021
begin
wwv_flow_api.create_page(
 p_id=>21
,p_user_interface_id=>wwv_flow_api.id(72999165452094574)
,p_name=>'Acciones Item'
,p_page_mode=>'MODAL'
,p_step_title=>'Acciones Item'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'75%'
,p_dialog_chained=>'N'
,p_last_updated_by=>'JCUAO'
,p_last_upd_yyyymmddhh24miss=>'20191118142256'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(236111365282233954)
,p_plug_name=>'Parametros'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_prmtro, ',
'        a.id_rcrso_tpo_accion,',
'        a.nmbre_prmtro,',
unistr('        case a.tpo_orgn when ''I'' then ''\00CDtem'''),
unistr('                      when ''F'' then ''Funci\00F3n'''),
unistr('                      when ''E'' then ''Est\00E1tico'''),
unistr('                      when ''A'' then ''Elemento de Aplicaci\00F3n'''),
'        end tpo_orgn,',
'        b.dscrpcion,',
'        a.orgen,',
unistr('        case a.actvo when ''S'' then ''S\00ED'''),
'                   when ''N'' then ''No''',
'        end actvo,',
'        a.orden',
'from gj_d_parametros a',
'left join gj_d_tareas_item b on a.id_trea_item = b.id_trea_item',
'where a.id_rcrso_tpo_accion = :P21_ID_RCRSO_TPO_ACCION'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(236111846703233954)
,p_name=>'Informe 1'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>unistr('El recuento m\00E1ximo de filas de este informe es #MAX_ROW_COUNT# filas. Aplique un filtro para reducir el n\00FAmero de registros de la consulta.')
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.::P30_ID_PRMTRO,P30_ID_RCRSO_TPO_ACCION:#ID_PRMTRO#,&P21_ID_RCRSO_TPO_ACCION.'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Editar">'
,p_owner=>'JCUAO'
,p_internal_uid=>236111846703233954
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(118059276800119241)
,p_db_column_name=>'ID_PRMTRO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Prmtro'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(118059574448119242)
,p_db_column_name=>'ID_RCRSO_TPO_ACCION'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Id Rcrso Tpo Accion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(118060392577119242)
,p_db_column_name=>'NMBRE_PRMTRO'
,p_display_order=>12
,p_column_identifier=>'D'
,p_column_label=>'Nombre Parametro'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(118061536561119243)
,p_db_column_name=>'TPO_ORGN'
,p_display_order=>22
,p_column_identifier=>'G'
,p_column_label=>'Tipo Origen'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(118119783616378038)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>32
,p_column_identifier=>'J'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(118119696867378037)
,p_db_column_name=>'ORGEN'
,p_display_order=>42
,p_column_identifier=>'I'
,p_column_label=>'Origen'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(118061149067119243)
,p_db_column_name=>'ACTVO'
,p_display_order=>52
,p_column_identifier=>'F'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(118060730707119243)
,p_db_column_name=>'ORDEN'
,p_display_order=>62
,p_column_identifier=>'E'
,p_column_label=>'Orden'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(236117312991234624)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1180623'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_PRMTRO:TPO_ORGN:DSCRPCION:ORGEN:ACTVO:ORDEN:'
,p_sort_column_1=>'ORDEN'
,p_sort_direction_1=>'ASC'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(118062783485119247)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(236111365282233954)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:30:P30_ID_RCRSO_TPO_ACCION:&P21_ID_RCRSO_TPO_ACCION.'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107782047964087113)
,p_name=>'P21_ID_RCRSO_TPO_ACCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(236111365282233954)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(118063341476123107)
,p_name=>unistr('Crear Bot\00F3n: Cuadro de Di\00E1logo Cerrado')
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(118062783485119247)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(118063755270123108)
,p_event_id=>wwv_flow_api.id(118063341476123107)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(118119301038378034)
,p_name=>'Al cerrar cuadro de dialogo actualizar parametros'
,p_event_sequence=>80
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(236111365282233954)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(118119467160378035)
,p_event_id=>wwv_flow_api.id(118119301038378034)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(236111365282233954)
,p_stop_execution_on_error=>'Y'
);
end;
/
