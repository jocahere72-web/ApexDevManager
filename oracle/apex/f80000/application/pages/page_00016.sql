prompt --application/pages/page_00016
begin
wwv_flow_api.create_page(
 p_id=>16
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Constructor de Consultas'
,p_step_title=>'Constructor de Consultas'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).on("scroll",function() {',
'  apex.navigation.dialog.close(true);',
'});'))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(17445683081942948)
,p_last_upd_yyyymmddhh24miss=>'20200725113320'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44110445249046734)
,p_plug_name=>'Constructor de Consultas'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_cnslta_mstro,',
'       b.nmbre_cnslta,',
'       a.nmbre_prcso_sql,',
'       a.cdgo_prcso_sql',
'  from ge_p_procesos_sql a',
'  join ge_p_consulta_maestro b',
'    on b.id_prcso_sql = a.id_prcso_sql',
' where a.cdgo_prcso_sql = ''GCB''',
'   and b.id_sbcnslta_mstro is null',
'   and b.tpo_cndcion is null'))
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
 p_id=>wwv_flow_api.id(44110604353046736)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=50000:902:&SESSION.::&DEBUG.:RP:P902_COD_PROCESO,P902_ID_CONSULTA,P902_APP_ID,P902_PAGE_ID,P902_ACCION:#CDGO_PRCSO_SQL#,#ID_CNSLTA_MSTRO#,&APP_ID.,&APP_PAGE_ID.,EDIT'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'MCARO'
,p_internal_uid=>44110604353046736
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44110744177046737)
,p_db_column_name=>'ID_CNSLTA_MSTRO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Consecutivo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44110844004046738)
,p_db_column_name=>'NMBRE_CNSLTA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Consulta'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44110936276046739)
,p_db_column_name=>'NMBRE_PRCSO_SQL'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Proceso'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44111034611046740)
,p_db_column_name=>'CDGO_PRCSO_SQL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('C\00F3digo del Proceso')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(46005304322630511)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'460054'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_CNSLTA_MSTRO:CDGO_PRCSO_SQL:NMBRE_PRCSO_SQL:NMBRE_CNSLTA:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44111272517046742)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44111379003046743)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i>',
'    </b>',
'</h5>',
'',
'Funcionalidad permite :<br><br>',
'',
unistr('<p><b>1.</b> Consultar las caracter\00EDsticas parametrizadas de la poblaci\00F3n para los procesos jur\00EDdicos.<br></p>'),
'',
unistr('<p><b>2.</b> Modificar y consultar el detalle de las caracter\00EDsticas de la consulta de la poblaci\00F3n: hacer clic en el \00EDcono de l\00E1piz, se redireccionar\00E1 a una p\00E1gina con el detalle de la consulta seleccionada.<br></p>'),
unistr('<p><b>3.</b> Ingresar una nueva consulta: hacer clic en el bot\00F3n Nueva Consulta se redireccionar\00E1 a la p\00E1gina para diligenciar los datos para la consulta de la poblaci\00F3n.<br><br></p>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'',
'        </i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44111150505046741)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(44111272517046742)
,p_button_name=>'BTN_NVA_CNSLTA'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva Consulta'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=50000:902:&SESSION.::&DEBUG.:RP,902:P902_APP_ID,P902_PAGE_ID,P902_COD_PROCESO:&APP_ID.,&APP_PAGE_ID.,GCB'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
end;
/
