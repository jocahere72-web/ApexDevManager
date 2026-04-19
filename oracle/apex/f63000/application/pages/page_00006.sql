prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6
,p_user_interface_id=>wwv_flow_api.id(197944602441250185)
,p_name=>'Carga'
,p_step_title=>'Carga'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id){',
'if($(''#''+id).attr(''aria-expanded'') != ''true''){',
'$(''#''+id).click();',
'}',
'}'))
,p_javascript_code_onload=>'buttonCollapse(''t_Button_rightControlButton'');'
,p_step_template=>wwv_flow_api.id(197896201223250006)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20191122095119'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(30998663352857504)
,p_plug_name=>'Ayudar'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(197911058427250046)
,p_plug_display_sequence=>40
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
unistr('    <b>1.</b> Observar los atributos que delimitan los campos en los archivos que ser\00E1n procesados por el sistema.<br><br>'),
unistr('    <b>2.</b> Ingresar una nueva carga, hacer clic en el bot\00F3n Nueva carga, el usuario ser\00E1 direccionado a la p\00E1gina para diligenciar la carga de los archivos.<br><br>'),
'    <b>3.</b> Consultar los datos diligenciados de un archivo de carga parametrizado <br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46533228489301401)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(197911058427250046)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones </i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103031452107560183)
,p_plug_name=>'Carga'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(197910552558250045)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_CRGA,',
'       NMBRE_CRGA,',
'       DSCRPCION_CRGA,',
'       CDGO_ARCHVO_TPO,',
'       CRCTER_DLMTDO,',
'       CRCTER_FIN_LNEA',
'  from ET_G_CARGA'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(103031508875560183)
,p_name=>'Carga'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP,5:P5_ID_CRGA:#ID_CRGA#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JALCOCER'
,p_internal_uid=>100831631709916042
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103031957114560203)
,p_db_column_name=>'ID_CRGA'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Crga'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(111757970279630364)
,p_db_column_name=>'NMBRE_CRGA'
,p_display_order=>11
,p_column_identifier=>'G'
,p_column_label=>'Nombre carga'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(111758035681630365)
,p_db_column_name=>'DSCRPCION_CRGA'
,p_display_order=>21
,p_column_identifier=>'H'
,p_column_label=>unistr('Descripci\00F3n carga')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103033020801560211)
,p_db_column_name=>'CDGO_ARCHVO_TPO'
,p_display_order=>31
,p_column_identifier=>'D'
,p_column_label=>'Tipo Archivo'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_api.id(102947041143382910)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103033377188560218)
,p_db_column_name=>'CRCTER_DLMTDO'
,p_display_order=>41
,p_column_identifier=>'E'
,p_column_label=>unistr('Car\00E1cter Delimitador')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103033824605560219)
,p_db_column_name=>'CRCTER_FIN_LNEA'
,p_display_order=>51
,p_column_identifier=>'F'
,p_column_label=>unistr('Car\00E1cter Fin L\00EDnea')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(103034993015561135)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1008352'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_CRGA:DSCRPCION_CRGA:CDGO_ARCHVO_TPO:CRCTER_DLMTDO:CRCTER_FIN_LNEA:'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(102949186161397053)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(46533228489301401)
,p_button_name=>'Nueva_Carga'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(197933931608250119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP,5::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
end;
/
