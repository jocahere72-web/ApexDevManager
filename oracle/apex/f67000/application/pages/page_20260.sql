prompt --application/pages/page_20260
begin
wwv_flow_api.create_page(
 p_id=>2026001
,p_user_interface_id=>wwv_flow_api.id(71698179048188014)
,p_name=>unistr('Configuraci\00F3n Acciones Eventos')
,p_step_title=>'Configuracion Acciones Eventos'
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
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20260202113233'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35926896399109639)
,p_plug_name=>unistr('Configuraci\00F3n Acciones Eventos')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71623038711187958)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_prcso_accion, ',
'        cdgo_prcso_accion,',
'        cdgo_prcso,',
'        dscrpcion_evnto,',
'        dscrpcion_accion,',
'        nmbre_impsto,',
'        nmbre_impsto_sbmpsto',
'from v_df_c_procesos_accion',
'where cdgo_clnte = :F_CDGO_CLNTE',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(35927293386109639)
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
,p_detail_link=>'f?p=&APP_ID.:2026002:&SESSION.::&DEBUG.:2026002:P2026002_ID_PRCSO_ACCION:#ID_PRCSO_ACCION#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JCUAO'
,p_internal_uid=>35927293386109639
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16952750548030105)
,p_db_column_name=>'ID_PRCSO_ACCION'
,p_display_order=>10
,p_column_identifier=>'I'
,p_column_label=>'Id Prcso Accion'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16952833463030106)
,p_db_column_name=>'CDGO_PRCSO_ACCION'
,p_display_order=>20
,p_column_identifier=>'J'
,p_column_label=>'Proceso'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16952997541030107)
,p_db_column_name=>'CDGO_PRCSO'
,p_display_order=>30
,p_column_identifier=>'K'
,p_column_label=>'Proceso'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16953433714030112)
,p_db_column_name=>'DSCRPCION_EVNTO'
,p_display_order=>40
,p_column_identifier=>'P'
,p_column_label=>'Evento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16953510356030113)
,p_db_column_name=>'DSCRPCION_ACCION'
,p_display_order=>50
,p_column_identifier=>'Q'
,p_column_label=>unistr('Acci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16953683128030114)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>60
,p_column_identifier=>'R'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16953748230030115)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>70
,p_column_identifier=>'S'
,p_column_label=>'Sub Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(35940961506110039)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'313416'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>':ID_PRCSO_ACCION_ACCION:CDGO_PRCSO:DSCRPCION_EVNTO:DSCRPCION_ACCION:NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40646098241043412)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71624143472187958)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
' <br/>',
unistr('<i><p>Esta funcionalidad permite configurar las acciones que se ejecutan autom\00E1ticamente en el sistema cuando ocurre un evento espec\00EDfico dentro de un proceso, seg\00FAn el tributo y sub-tributo parametrizado.'),
' <br/> <br/>',
unistr('Mediante esta parametrizaci\00F3n es posible definir, que unidad de programa se debe ejecutar para realizar determinada acci\00F3n.</p>'),
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
 p_id=>wwv_flow_api.id(31342026857567689)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(35926896399109639)
,p_button_name=>'BTN_NUEVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:2026002:&SESSION.::&DEBUG.:2026002::'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(31342778893567687)
,p_name=>'Al hacer cerrar recuadro de dialogo modal'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(31342026857567689)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(31343258905567683)
,p_event_id=>wwv_flow_api.id(31342778893567687)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(35926896399109639)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(31343617445567682)
,p_name=>'Al cerrar recuadro de dialogo'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(35926896399109639)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(31344172638567682)
,p_event_id=>wwv_flow_api.id(31343617445567682)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(35926896399109639)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(31344504239567682)
,p_name=>'Al cerrar Dialogo'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(31345058347567682)
,p_event_id=>wwv_flow_api.id(31344504239567682)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(35926896399109639)
,p_stop_execution_on_error=>'Y'
);
end;
/
