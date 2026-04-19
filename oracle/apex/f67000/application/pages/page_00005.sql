prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(71698179048188014)
,p_name=>unistr('Configuraci\00F3n Medios de Env\00EDos')
,p_step_title=>unistr('Configuracion Medios de Env\00EDos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id){',
'    if($(''#''+id).attr(''aria-expanded'') == ''true''){',
'        $(''#''+id).click();',
'    }',
'}',
'',
'buttonCollapse(''t_Button_rightControlButton'');'))
,p_step_template=>wwv_flow_api.id(71592158849187941)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20191106164633'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4588608487541941)
,p_plug_name=>unistr('Configuraci\00F3n Medios de Env\00EDos')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71623038711187958)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_envio_mdio_cnfgrcion, ',
'        cdgo_envio_mdio,',
'        dscrpcion_envio_mdio,',
'        mxmo_crctres,',
'        undad_prgrma,',
'        actvo,',
'        actvo_dscrpcion',
'from v_ma_d_envios_medio_cnfgrcion',
'where cdgo_clnte = :F_CDGO_CLNTE',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(4589005474541941)
,p_name=>'Configuracion Medios de Envios'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>unistr('El recuento m\00E1ximo de filas de este informe es #MAX_ROW_COUNT# filas. Aplique un filtro para reducir el n\00FAmero de registros de la consulta.')
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6:P6_ID_ENVIO_MDIO_CNFGRCION:#ID_ENVIO_MDIO_CNFGRCION#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JCUAO'
,p_internal_uid=>4589005474541941
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4589167354541941)
,p_db_column_name=>'ID_ENVIO_MDIO_CNFGRCION'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Envio Mdio Cnfgrcion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4589904170541942)
,p_db_column_name=>'CDGO_ENVIO_MDIO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Cdgo Envio Mdio'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4246266831872046)
,p_db_column_name=>'DSCRPCION_ENVIO_MDIO'
,p_display_order=>13
,p_column_identifier=>'G'
,p_column_label=>unistr('Medio de Env\00EDo')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4590312794541942)
,p_db_column_name=>'MXMO_CRCTRES'
,p_display_order=>23
,p_column_identifier=>'D'
,p_column_label=>unistr('Cantidad M\00E1xima de Caracteres')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4590706092541943)
,p_db_column_name=>'UNDAD_PRGRMA'
,p_display_order=>33
,p_column_identifier=>'E'
,p_column_label=>'Unidad de Programa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4591180175541943)
,p_db_column_name=>'ACTVO'
,p_display_order=>43
,p_column_identifier=>'F'
,p_column_label=>'Actvo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4246373224872047)
,p_db_column_name=>'ACTVO_DSCRPCION'
,p_display_order=>53
,p_column_identifier=>'H'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(4602673594542341)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'46027'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ENVIO_MDIO:UNDAD_PRGRMA:MXMO_CRCTRES:ACTVO_DSCRPCION:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9307810329475714)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71624143472187958)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
'<i><p>Funcionalidad que permite gestionar las configuraciones de los medios de envio.</p>',
'    <br/>',
'    <br/>',
'    <p>',
unistr('        Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario'),
'    </p>',
'',
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4591566994541943)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(4588608487541941)
,p_button_name=>'BTN_NUEVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4649256594726701)
,p_name=>'Al hacer cerrar recuadro de dialogo modal'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4591566994541943)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4649318780726702)
,p_event_id=>wwv_flow_api.id(4649256594726701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4588608487541941)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4649420265726703)
,p_name=>'Al cerrar recuadro de dialogo'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(4588608487541941)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4649581770726704)
,p_event_id=>wwv_flow_api.id(4649420265726703)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4588608487541941)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(34918773851542703)
,p_name=>'Al cerrar Dialogo'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34918843809542704)
,p_event_id=>wwv_flow_api.id(34918773851542703)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4588608487541941)
,p_stop_execution_on_error=>'Y'
);
end;
/
