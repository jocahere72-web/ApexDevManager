prompt --application/pages/page_00999
begin
wwv_flow_api.create_page(
 p_id=>999
,p_user_interface_id=>wwv_flow_api.id(103265655096132800)
,p_name=>'Terceros Portal'
,p_step_title=>'Terceros Portal'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(29911946739317080)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20221128161214'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(169146641440911568)
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
 p_id=>wwv_flow_api.id(227978818832706559)
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
 p_id=>wwv_flow_api.id(272287537548241380)
,p_plug_name=>unistr('Gesti\00F3n Tercero')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29943643729317093)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_trcro_prtal,',
'       cdgo_clnte,',
'       dscrpcion_idntfccion_tpo,',
'       idntfccion,',
'       nmbre_trcro,',
'       drccion_ntfccion,',
'       nmbre_pais_ntfccion,',
'       nmbre_dprtmnto_ntfccion,',
'       nmbre_mncpio_ntfccion,',
'       cllar,',
'       tlfno,',
'       email,',
'       indcdor_prcsdo',
'  from v_si_c_terceros_portal',
' where cdgo_clnte = :F_CDGO_CLNTE',
''))
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
 p_id=>wwv_flow_api.id(271756844217058863)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:998:&SESSION.::&DEBUG.:RP:P998_ID_TRCRO_PRTAL:#ID_TRCRO_PRTAL#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JALCOCER'
,p_internal_uid=>271756844217058863
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(138149752282054086)
,p_db_column_name=>'CDGO_CLNTE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Cdgo clnte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(138148993547054084)
,p_db_column_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_display_order=>30
,p_column_identifier=>'BE'
,p_column_label=>unistr('Tipo Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(138150131295054086)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(138163109512103605)
,p_db_column_name=>'CLLAR'
,p_display_order=>50
,p_column_identifier=>'BL'
,p_column_label=>'Celular'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(138150505101054086)
,p_db_column_name=>'TLFNO'
,p_display_order=>60
,p_column_identifier=>'R'
,p_column_label=>unistr('Tel\00E9fono')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(138152117387054087)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>70
,p_column_identifier=>'AG'
,p_column_label=>'Nombre Tercero'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85168337063979649)
,p_db_column_name=>'ID_TRCRO_PRTAL'
,p_display_order=>80
,p_column_identifier=>'BF'
,p_column_label=>'Id Trcro Prtal'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85168495616979650)
,p_db_column_name=>'EMAIL'
,p_display_order=>90
,p_column_identifier=>'BG'
,p_column_label=>'Email'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(138162720860103601)
,p_db_column_name=>'DRCCION_NTFCCION'
,p_display_order=>100
,p_column_identifier=>'BH'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(138162853317103602)
,p_db_column_name=>'NMBRE_PAIS_NTFCCION'
,p_display_order=>110
,p_column_identifier=>'BI'
,p_column_label=>unistr('Pa\00EDs')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(138162989550103603)
,p_db_column_name=>'NMBRE_DPRTMNTO_NTFCCION'
,p_display_order=>120
,p_column_identifier=>'BJ'
,p_column_label=>'Departamento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(138163043188103604)
,p_db_column_name=>'NMBRE_MNCPIO_NTFCCION'
,p_display_order=>130
,p_column_identifier=>'BK'
,p_column_label=>'Municipio'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(138163212744103606)
,p_db_column_name=>'INDCDOR_PRCSDO'
,p_display_order=>140
,p_column_identifier=>'BM'
,p_column_label=>'Procesado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(272333094468268016)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1381529'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_IDNTFCCION_TPO:NMBRE_TRCRO:IDNTFCCION:TLFNO::ID_TRCRO_PRTAL:EMAIL:DRCCION_NTFCCION:NMBRE_PAIS_NTFCCION:NMBRE_DPRTMNTO_NTFCCION:NMBRE_MNCPIO_NTFCCION:CLLAR:INDCDOR_PRCSDO'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(138153720215054107)
,p_name=>'REFRESH_DIALOG_CLOSED'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(272287537548241380)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(138154205847054110)
,p_event_id=>wwv_flow_api.id(138153720215054107)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(272287537548241380)
,p_stop_execution_on_error=>'Y'
);
end;
/
