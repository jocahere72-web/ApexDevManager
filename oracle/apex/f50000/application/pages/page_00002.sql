prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Excepciones Veh\00EDculos')
,p_step_title=>unistr('Excepciones Veh\00EDculos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20191010113358'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22328270333400701)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
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
unistr('	Funcionalidad que permite ingresar, consultar, modificar y eliminar las excepdiones de veh\00EDculos.'),
'<br>	',
unistr('	Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dirijase al Manual de Usuario.'),
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22328389282400702)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>' <br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98476357511832252)
,p_plug_name=>unistr('Excepciones Veh\00EDculos')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_VHCLO_EXCPCION,',
'       VGNCIA,',
'       NMBRE_VHCLO_MRCA,',
'       DSCRPCION_VHCLO_LNEA,',
'       NMBRE_VHCLO_CLSE,',
'       DSCRPCION_VHCLO_CRROCRIA,',
'       CLNDRJE,',
'       DSCRPCION_VHCLO_OPRCION,',
'       DSCRPCION_VHCLO_SRVCIO,',
'       CPCDAD_DSDE,',
'       CPCDAD_HSTA,',
'       MDLO_DSDE,',
'       MDLO_HSTA,',
'       GRPO',
'  from V_DF_S_VEHICULOS_EXCEPCION'))
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
 p_id=>wwv_flow_api.id(97470412368250904)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_detail_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP:P3_ID_VHCLO_EXCPCION:#ID_VHCLO_EXCPCION#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JALCOCER'
,p_internal_uid=>97470412368250904
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97470533933250905)
,p_db_column_name=>'ID_VHCLO_EXCPCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id vhclo excpcion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97470694187250906)
,p_db_column_name=>'VGNCIA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97470737176250907)
,p_db_column_name=>'NMBRE_VHCLO_MRCA'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Marca'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97470874627250908)
,p_db_column_name=>'DSCRPCION_VHCLO_LNEA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('L\00EDnea')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97470930966250909)
,p_db_column_name=>'NMBRE_VHCLO_CLSE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97471054530250910)
,p_db_column_name=>'DSCRPCION_VHCLO_CRROCRIA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Carrocer\00EDa')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97471156485250911)
,p_db_column_name=>'CLNDRJE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Cilindraje'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97471283001250912)
,p_db_column_name=>'DSCRPCION_VHCLO_OPRCION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Operaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97471379710250913)
,p_db_column_name=>'DSCRPCION_VHCLO_SRVCIO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Servicio'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97471482235250914)
,p_db_column_name=>'CPCDAD_DSDE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Capacidad Inicial'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97471530393250915)
,p_db_column_name=>'CPCDAD_HSTA'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Capacidad Final'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97471619996250916)
,p_db_column_name=>'MDLO_DSDE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Modelo Inicial'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97471722188250917)
,p_db_column_name=>'MDLO_HSTA'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Modelo Final'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97471889183250918)
,p_db_column_name=>'GRPO'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Grupo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(98605722115896794)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'986058'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_VHCLO_EXCPCION:VGNCIA:NMBRE_VHCLO_MRCA:DSCRPCION_VHCLO_LNEA:NMBRE_VHCLO_CLSE:DSCRPCION_VHCLO_CRROCRIA:CLNDRJE:DSCRPCION_VHCLO_OPRCION:DSCRPCION_VHCLO_SRVCIO:CPCDAD_DSDE:CPCDAD_HSTA:MDLO_DSDE:MDLO_HSTA:GRPO'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(97470342611250903)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(22328389282400702)
,p_button_name=>unistr('Btn_Nuevo_Excepci\00F3n_vehiculo')
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nueva Excepci\00F3n ')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(109628209454348424)
,p_name=>'Dialog_closed_Refresh'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(98476357511832252)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(109628356092348425)
,p_event_id=>wwv_flow_api.id(109628209454348424)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(98476357511832252)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98490583163832272)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(98476357511832252)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>' - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98625053035922517)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
