prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(103265655096132800)
,p_name=>unistr('Gesti\00F3n Tercero')
,p_step_title=>unistr('Gesti\00F3n Tercero')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(29911946739317080)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(103270158884132846)
,p_last_upd_yyyymmddhh24miss=>'20200725113320'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(30999237145857510)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
'	Funcionalidad que permite:<br><br>',
unistr('     <b>1.</b> Consultar las personas naturales ingresadas en el sistema de gesti\00F3n tributaria<br><br>'),
unistr('    <b>2.</b> Ingresar las personas naturales en el sistema de gesti\00F3n tributaria, hacer clic en el bot\00F3n Nuevo Tercero se mostrar\00E1 una ventana para diligenciar la informaci\00F3n correspondiente.'),
'    ',
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'        </i>',
'		'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89831414537652501)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><b><center>Opciones <i class="fa fa-gears " aria-hidden="true"></center></i> </b></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(134140133253187322)
,p_plug_name=>unistr('Gesti\00F3n Tercero')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29943643729317093)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'	id_trcro,',
'	cdgo_clnte,',
'	nmbre_clnte,',
'	dscrpcion_idntfccion_tpo,',
'	idntfccion,',
'	nmbre_trcro,',
'	tlfno,',
'	nmbre_prfsion,',
'	indcdor_cntrbynte,',
'	indcdr_fncnrio',
'from  v_si_c_terceros',
'where cdgo_clnte = :F_CDGO_CLNTE'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(133609439922004805)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP:P2_ID_TRCRO:#ID_TRCRO#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JALCOCER'
,p_internal_uid=>133609439922004805
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(133609597807004806)
,p_db_column_name=>'ID_TRCRO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id trcro'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(133609672606004807)
,p_db_column_name=>'CDGO_CLNTE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Cdgo clnte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2127903271129301)
,p_db_column_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_display_order=>30
,p_column_identifier=>'BE'
,p_column_label=>unistr('Tipo Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(133609856482004809)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(133611296849004823)
,p_db_column_name=>'TLFNO'
,p_display_order=>50
,p_column_identifier=>'R'
,p_column_label=>unistr('Tel\00E9fono')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(133612224934004833)
,p_db_column_name=>'INDCDOR_CNTRBYNTE'
,p_display_order=>60
,p_column_identifier=>'AB'
,p_column_label=>'Ind. Contribuyente'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(103268944208132840)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(133612381188004834)
,p_db_column_name=>'INDCDR_FNCNRIO'
,p_display_order=>70
,p_column_identifier=>'AC'
,p_column_label=>'Ind. Funcionario'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(103268944208132840)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(133612505729004836)
,p_db_column_name=>'NMBRE_CLNTE'
,p_display_order=>80
,p_column_identifier=>'AE'
,p_column_label=>'Nombre Cliente'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(133612735278004838)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>90
,p_column_identifier=>'AG'
,p_column_label=>'Nombre Tercero'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134205555493287411)
,p_db_column_name=>'NMBRE_PRFSION'
,p_display_order=>100
,p_column_identifier=>'BD'
,p_column_label=>unistr('Profesi\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(134185690173213958)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1341857'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_IDNTFCCION_TPO:NMBRE_TRCRO:IDNTFCCION:TLFNO:INDCDOR_CNTRBYNTE:INDCDR_FNCNRIO:NMBRE_CLNTE:NMBRE_PRFSION:'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(89831579454652502)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(89831414537652501)
,p_button_name=>'BTN_NUEVO_TERCERO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Tercero'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP,2::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(134276432302758204)
,p_name=>'REFRESH_DIALOG_CLOSED'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(134140133253187322)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(134276554752758205)
,p_event_id=>wwv_flow_api.id(134276432302758204)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(134140133253187322)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(134159896220187353)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(134140133253187322)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>' - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
