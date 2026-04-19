prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(71889596252951620)
,p_name=>'Informe de Motivo'
,p_step_title=>'Motivos PQR'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_step_template=>wwv_flow_api.id(71783507231951541)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'1064999002'
,p_last_upd_yyyymmddhh24miss=>'20260205112736'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71722341014264417)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
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
'Funcionalidad que permite consultar, ingresar, modificar y eliminar los tipos de motivos de una correspondencia.<br><br>',
unistr('<b>1.</b> Para ingresar un motivo, hacer clic en el bot\00F3n Nuevo Motivo, se mostrar\00E1 una ventana con los datos relacionados a la parametrizaci\00F3n del motivo, se deber\00E1 ingresar los datos marcados como obligatorios y hacer clic en el bot\00F3n insertar.<br>')
||'<br>',
unistr('<b>2.</b> Para editar un Motivo, hacer clic en el icono de l\00E1piz del motivo que desea editar,  se mostrar\00E1 una ventana con los datos relacionados a la parametrizaci\00F3n del motivo, se realizan los cambios en la parametrizaci\00F3n y se hace clic en el bot\00F3')
||'n Aplicar Cambios.<br><br>',
unistr('<b>3.</b> Para eliminar un Motivo, hacer clic en el icono de l\00E1piz del motivo que desea eliminar, se mostrar\00E1 una ventana con los datos relacionados a la parametrizaci\00F3n del motivo y se hace clic en el bot\00F3n Eliminar.'),
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(72582909304701115)
,p_plug_name=>'Motivos de Solicitud'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_mtvo,',
'       cdgo_clnte,',
'       id_fljo,',
'       dscrpcion_fljo,',
'       id_prcso,',
'       nmbre_prcso,',
'       dscrpcion_mtvo,',
'       dscrpcion_ntfcar_rspnsble,',
'       dscrpcion_actvo_mvto,',
'       initcap(dscrpcion_tpo) dscrpcion_tpo,',
'       dscrpcion_vldr_sjto_imsto',
'  from v_pq_d_motivos',
'where cdgo_clnte = :F_CDGO_CLNTE ',
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
 p_id=>wwv_flow_api.id(72583068367701116)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se ha encontrado ningun dato'
,p_max_rows_per_page=>'25'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP,8:P8_ID_MTVO:#ID_MTVO#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'ELAFAURIE'
,p_internal_uid=>72583068367701116
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72583224561701118)
,p_db_column_name=>'CDGO_CLNTE'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Cdgo Clnte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72583106346701117)
,p_db_column_name=>'ID_MTVO'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Id Mtvo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72583348281701119)
,p_db_column_name=>'ID_FLJO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Flujo de Trabajo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72583491347701120)
,p_db_column_name=>'ID_PRCSO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Proceso'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72685407542414333)
,p_db_column_name=>'DSCRPCION_MTVO'
,p_display_order=>50
,p_column_identifier=>'Q'
,p_column_label=>'Motivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72685052827414329)
,p_db_column_name=>'DSCRPCION_FLJO'
,p_display_order=>60
,p_column_identifier=>'M'
,p_column_label=>'Flujo de trabajo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72685120532414330)
,p_db_column_name=>'NMBRE_PRCSO'
,p_display_order=>70
,p_column_identifier=>'N'
,p_column_label=>'Proceso'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72685200767414331)
,p_db_column_name=>'DSCRPCION_NTFCAR_RSPNSBLE'
,p_display_order=>80
,p_column_identifier=>'O'
,p_column_label=>unistr('\00BFNotificar a <br>Responsables?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_help_text=>'Indicador si el responsable del tributo debe ser notificado'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72685364979414332)
,p_db_column_name=>'DSCRPCION_ACTVO_MVTO'
,p_display_order=>90
,p_column_identifier=>'P'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(119862593793278102)
,p_db_column_name=>'DSCRPCION_TPO'
,p_display_order=>100
,p_column_identifier=>'R'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(62644483138304706)
,p_db_column_name=>'DSCRPCION_VLDR_SJTO_IMSTO'
,p_display_order=>110
,p_column_identifier=>'S'
,p_column_label=>'Valida Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(72699756260602153)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'726998'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>25
,p_report_columns=>'DSCRPCION_TPO:DSCRPCION_MTVO:DSCRPCION_FLJO:NMBRE_PRCSO:DSCRPCION_NTFCAR_RSPNSBLE:DSCRPCION_ACTVO_MVTO::DSCRPCION_VLDR_SJTO_IMSTO'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(135680792100004172)
,p_report_id=>wwv_flow_api.id(72699756260602153)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'DSCRPCION_ACTVO_MVTO'
,p_operator=>'='
,p_expr=>unistr('S\00ED')
,p_condition_sql=>'"DSCRPCION_ACTVO_MVTO" = #APXWS_EXPR#'
,p_condition_display=>unistr('#APXWS_COL_NAME# = ''S\00ED''  ')
,p_enabled=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(72683221425414311)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72683101179414310)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(72683221425414311)
,p_button_name=>'Nuevo'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Motivo'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP,8::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(72585600945701142)
,p_name=>'Al cerrar la ventana modal '
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(72585736213701143)
,p_event_id=>wwv_flow_api.id(72585600945701142)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(72582909304701115)
,p_stop_execution_on_error=>'Y'
);
end;
/
