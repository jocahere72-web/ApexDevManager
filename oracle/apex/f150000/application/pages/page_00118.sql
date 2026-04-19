prompt --application/pages/page_00118
begin
wwv_flow_api.create_page(
 p_id=>118
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Inscripci\00F3n de Personas - Novedades Personas')
,p_step_title=>unistr('Inscripci\00F3n de Personas - Novedades Personas')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LARIZA'
,p_last_upd_yyyymmddhh24miss=>'20210622092917'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73193898016844422)
,p_plug_name=>unistr('Informaci\00F3n del Contribuyente')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--large'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73630461931537617)
,p_plug_name=>unistr('<b>Informaci\00F3n B\00E1sica</b>')
,p_parent_plug_id=>wwv_flow_api.id(73193898016844422)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73630517311537618)
,p_plug_name=>unistr('<b>Informaci\00F3n de Notificaci\00F3n</b>')
,p_parent_plug_id=>wwv_flow_api.id(73193898016844422)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73630621207537619)
,p_plug_name=>unistr('<b>Informaci\00F3n de Camara de Comercio</b>')
,p_parent_plug_id=>wwv_flow_api.id(73193898016844422)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73631158677537624)
,p_plug_name=>'Display Selector'
,p_parent_plug_id=>wwv_flow_api.id(73193898016844422)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73631280313537625)
,p_plug_name=>'Responsable'
,p_parent_plug_id=>wwv_flow_api.id(73631158677537624)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select seq_id',
'        , c003 cdgo_idntfccion_tpo',
'        , c004 idntfccion',
'        , c005 prmer_nmbre',
'        , c006 sgndo_nmbre',
'        , c007 prmer_aplldo',
'        , c008 sgndo_aplldo',
'        , c009 prncpal_s_n',
'        , c010 cdgo_tpo_rspnsble',
'        , c020 actvo',
'     from apex_collections    a',
'    where collection_name     = ''RESPONSABLES''',
'      and n001                = :F_ID_INSTNCIA_FLJO;'))
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
 p_id=>wwv_flow_api.id(73631972755537632)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:119:&SESSION.::&DEBUG.:RP,119:P119_SEQ_ID:#SEQ_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'SROMERO'
,p_internal_uid=>73631972755537632
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73632055126537633)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73632336342537636)
,p_db_column_name=>'CDGO_IDNTFCCION_TPO'
,p_display_order=>40
,p_column_identifier=>'B'
,p_column_label=>unistr('Tipo de<br> Indentificaci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(252841082283101712)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73632491327537637)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>50
,p_column_identifier=>'C'
,p_column_label=>unistr('Indentificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73632567737537638)
,p_db_column_name=>'PRMER_NMBRE'
,p_display_order=>60
,p_column_identifier=>'D'
,p_column_label=>'Primer Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73632677199537639)
,p_db_column_name=>'SGNDO_NMBRE'
,p_display_order=>70
,p_column_identifier=>'E'
,p_column_label=>'Segundo Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73632740850537640)
,p_db_column_name=>'PRMER_APLLDO'
,p_display_order=>80
,p_column_identifier=>'F'
,p_column_label=>'Primer Apellido'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73632856730537641)
,p_db_column_name=>'SGNDO_APLLDO'
,p_display_order=>90
,p_column_identifier=>'G'
,p_column_label=>'Segundo Apellido'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73632959963537642)
,p_db_column_name=>'PRNCPAL_S_N'
,p_display_order=>100
,p_column_identifier=>'H'
,p_column_label=>unistr('\00BFPrincipal?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(252387114161917710)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73633044597537643)
,p_db_column_name=>'CDGO_TPO_RSPNSBLE'
,p_display_order=>110
,p_column_identifier=>'I'
,p_column_label=>'Tipo de <br>Responsable'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(73756603882146158)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73746109745113403)
,p_db_column_name=>'ACTVO'
,p_display_order=>210
,p_column_identifier=>'J'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(252387114161917710)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(73766619513160820)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'737667'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SEQ_ID:CDGO_IDNTFCCION_TPO:IDNTFCCION:PRMER_NMBRE:SGNDO_NMBRE:PRMER_APLLDO:SGNDO_APLLDO:PRNCPAL_S_N:CDGO_TPO_RSPNSBLE:ACTVO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75045362313310005)
,p_plug_name=>unistr('Actividades Econ\00F3micas')
,p_parent_plug_id=>wwv_flow_api.id(73631158677537624)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select seq_id  ',
'	, n002                                id_actvdad_ecnmca ',
'	, b.dscrpcion 						  actvdad_ecnmca',
'	, d001                                fcha_incio_actvdad',
'	, c.nmbre_dclrcns_esqma_trfa_tpo	  nmbre_actvdad_ecnmca_tpo',
' from APEX_collections                    a',
' left join gi_d_dclrcns_esqma_trfa     	  b on a.n002                    = b.id_dclrcns_esqma_trfa',
' left join gi_d_dclrcns_esqma_trfa_tpo    c on b.id_dclrcns_esqma_trfa_tpo   = c.id_dclrcns_esqma_trfa_tpo',
'where collection_name                     = ''ACTIVIADES_ECONOMICA''',
'  and a.n001                              = :F_ID_INSTNCIA_FLJO  ',
' ',
' /*  select seq_id  ',
'        , n002                                id_actvdad_ecnmca ',
'        , b.dscrpcion actvdad_ecnmca',
'        , d001                                fcha_incio_actvdad',
'        , c.nmbre_actvdad_ecnmca_tpo',
'     from APEX_collections                    a',
'     left join gi_d_actividades_economica     b on a.n002                    = b.id_actvdad_ecnmca',
'     left join gi_d_actividades_ecnmca_tpo    c on b.id_actvdad_ecnmca_tpo   = c.id_actvdad_ecnmca_tpo',
'    where collection_name                     = ''ACTIVIADES_ECONOMICA''',
'      and a.n001                              = :F_ID_INSTNCIA_FLJO*/',
'      ',
'     '))
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
 p_id=>wwv_flow_api.id(75046453134310016)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:120:&SESSION.::&DEBUG.:RP,120:P120_SEQ_ID:#SEQ_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'SROMERO'
,p_internal_uid=>75046453134310016
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75046525735310017)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75046776187310019)
,p_db_column_name=>'ID_ACTVDAD_ECNMCA'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Actividad Econ\00F3mica')
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75049063056310042)
,p_db_column_name=>'ACTVDAD_ECNMCA'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>unistr('Actividad Econ\00F3mica')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75046887950310020)
,p_db_column_name=>'FCHA_INCIO_ACTVDAD'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Fecha de Inicio'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75230124187935802)
,p_db_column_name=>'NMBRE_ACTVDAD_ECNMCA_TPO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Tipo de Actividad'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(75079941912295461)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'750800'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_ACTVDAD_ECNMCA_TPO:ACTVDAD_ECNMCA:FCHA_INCIO_ACTVDAD:'
,p_break_on=>'NMBRE_ACTVDAD_ECNMCA_TPO'
,p_break_enabled_on=>'NMBRE_ACTVDAD_ECNMCA_TPO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73631409607537627)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>	'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73631548641537628)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
unistr('    <p align="justify">Funcionalidad que permite registrar la solicitus de inscripci\00F3n de un nuevo contribuyente.<br> '),
'        ',
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73631738105537630)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(73631409607537627)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿Esta seguro que desea cancelar?'',''BTN_CANCELAR'');'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73631678127537629)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(73631409607537627)
,p_button_name=>'BTN_REGISTRAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar Solicitud'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73631828735537631)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(73631409607537627)
,p_button_name=>'BTN_NUEVO_RESPONSABLE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Nuevo Responsable'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:119:&SESSION.::&DEBUG.:RP,119::'
,p_icon_css_classes=>'fa-user-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(75046946391310021)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(73631409607537627)
,p_button_name=>'BTN_ACTIVIDAD_ECONOMICA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>unistr('Nueva Actividad Ec\00F3nomica')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:120:&SESSION.::&DEBUG.:RP,120::'
,p_icon_css_classes=>'fa-sitemap'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(73748727217113429)
,p_branch_name=>'Ir al inicio - PQR'
,p_branch_action=>'f?p=&APP_ID.:301:&SESSION.::&DEBUG.:RP,118,119::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(73631678127537629)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(73748033849113422)
,p_branch_name=>'Ir al Inicio-  PQR'
,p_branch_action=>'f?p=&APP_ID.:301:&SESSION.::&DEBUG.:RP,118,119::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(73631738105537630)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73194313216844427)
,p_name=>'P118_ID_INSTNCIA_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(73193898016844422)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73194570681844429)
,p_name=>'P118_TPO_PRSNA'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(73630461931537617)
,p_prompt=>'Tipo de Persona'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Natural;N,Jur\00EDdica;J')
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73194682909844430)
,p_name=>'P118_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(73630461931537617)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73194721259844431)
,p_name=>'P118_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(73630461931537617)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select idntfccion',
'      from v_pq_g_solicitudes',
'     where id_instncia_fljo = :P118_ID_INSTNCIA_FLJO;',
''))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73194882184844432)
,p_name=>'P118_NMBRE_RZON_SCIAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(73630461931537617)
,p_prompt=>unistr('Raz\00F3n Social')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumeroEspacio'');" onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73194902336844433)
,p_name=>'P118_PRMER_NMBRE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(73630461931537617)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73195074884844434)
,p_name=>'P118_SGNDO_NMBRE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(73630461931537617)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73195154403844435)
,p_name=>'P118_PRMER_APLLDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(73630461931537617)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73195201709844436)
,p_name=>'P118_SGNDO_APLLDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(73630461931537617)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73195358799844437)
,p_name=>'P118_ID_DPRTMNTO'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(73630461931537617)
,p_item_default=>'select id_dprtmnto from df_s_clientes where cdgo_clnte = :F_CDGO_CLNTE'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Departamento'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_DEPARTAMENTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NMBRE_DPRTMNTO as d,',
'       ID_DPRTMNTO as r',
'  from DF_S_DEPARTAMENTOS',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73195431802844438)
,p_name=>'P118_ID_MNCPIO'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(73630461931537617)
,p_item_default=>'select id_mncpio from df_s_clientes where cdgo_clnte = :F_CDGO_CLNTE'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Municipio'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>'select nmbre_mncpio, id_mncpio from df_s_municipios where id_dprtmnto = :P118_ID_DPRTMNTO'
,p_lov_cascade_parent_items=>'P118_ID_DPRTMNTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73195550933844439)
,p_name=>'P118_DRCCION'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(73630461931537617)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumeroEspacio'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73195610572844440)
,p_name=>'P118_ID_DPRTMNTO_NTFCCION'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(73630517311537618)
,p_item_default=>'select id_dprtmnto from df_s_clientes where cdgo_clnte = :F_CDGO_CLNTE'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>unistr('Departamento Notificaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_DEPARTAMENTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NMBRE_DPRTMNTO as d,',
'       ID_DPRTMNTO as r',
'  from DF_S_DEPARTAMENTOS',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73195710611844441)
,p_name=>'P118_ID_MNCPIO_NTFCCION'
,p_is_required=>true
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(73630517311537618)
,p_item_default=>'select id_mncpio from df_s_clientes where cdgo_clnte = :F_CDGO_CLNTE'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>unistr('Municipio Notificaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>'select nmbre_mncpio, id_mncpio from df_s_municipios where id_dprtmnto = :P118_ID_DPRTMNTO_NTFCCION'
,p_lov_cascade_parent_items=>'P118_ID_DPRTMNTO_NTFCCION'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73195890152844442)
,p_name=>'P118_DRCCION_NTFCCION'
,p_is_required=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(73630517311537618)
,p_prompt=>unistr('Direcci\00F3n Notificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumeroEspacio'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73195989794844443)
,p_name=>'P118_TLFNO'
,p_is_required=>true
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(73630517311537618)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73196016293844444)
,p_name=>'P118_EMAIL'
,p_is_required=>true
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(73630517311537618)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73196169354844445)
,p_name=>'P118_ID_ACTVDAD_ECNMCA'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(73630621207537619)
,p_prompt=>unistr('Actividad Ec\00F3nomica Principal')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_dclrcns_esqma_trfa         id_actvdad_ecnmca,',
'        a.cdgo_dclrcns_esqma_trfa       cdgo_actvdad_ecnmca',
'from    gi_d_dclrcns_esqma_trfa     a',
'join    gi_d_dclrcns_esqma_trfa_tpo b   on  b.id_dclrcns_esqma_trfa_tpo =   a.id_dclrcns_esqma_trfa_tpo',
'where   b.cdgo_clnte                =   :F_CDGO_CLNTE',
'        and cdgo_dclrcns_esqma_trfa_tpo in (''1'',''2'',''3'',''4'')',
'        and sysdate between fcha_dsde and fcha_hsta',
'order by  cdgo_actvdad_ecnmca',
'  ',
' /* select b.dscrpcion',
'        , b.id_actvdad_ecnmca',
'        , b.cdgo_actvdad_ecnmca',
'     from gi_d_actividades_ecnmca_tpo    a',
'     join gi_d_actividades_economica     b on a.id_actvdad_ecnmca_tpo = b.id_actvdad_ecnmca_tpo',
'    where a.cdgo_clnte                   = :F_CDGO_CLNTE',
' order by b.cdgo_actvdad_ecnmca*/'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73196296621844446)
,p_name=>'P118_FCHA_RGSTRO_CMRA_CMRCIO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(73630621207537619)
,p_prompt=>'Fecha Registro de Camara Comercio'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73196301149844447)
,p_name=>'P118_NMRO_RGSTRO_CMRA_CMRCIO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(73630621207537619)
,p_prompt=>'Camara de Comercio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73196479121844448)
,p_name=>'P118_FCHA_INCIO_ACTVDDES'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(73630621207537619)
,p_prompt=>'Fecha inicio Actividades'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P118_FCHA_RGSTRO_CMRA_CMRCIO.'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73196532939844449)
,p_name=>'P118_NMRO_SCRSLES'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(73630621207537619)
,p_prompt=>'N.  Sucursales'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73196672585844450)
,p_name=>'P118_DRCCION_CMRA_CMRCIO'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(73630621207537619)
,p_prompt=>unistr('Direcci\00F3n de Cam\00E1ra Comercio')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumeroEspacio'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73749333215113435)
,p_name=>'P118_CLLAR'
,p_is_required=>true
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(73630517311537618)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73749764896113439)
,p_name=>'P118_ID_SJTO_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(73630461931537617)
,p_prompt=>'Tipo de Sujeto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select nmbre_sjto_tpo',
'        , id_sjto_tpo',
'     from df_i_sujetos_tipo',
'    where cdgo_clnte            = :F_CDGO_CLNTE',
'      and id_impsto             = :P118_ID_IMPSTO',
'      and sysdate               between fcha_dsde and fcha_hsta',
' order by nmbre_sjto_tpo'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73749831440113440)
,p_name=>'P118_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(73193898016844422)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(73194481355844428)
,p_computation_sequence=>10
,p_computation_item=>'F_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P118_ID_INSTNCIA_FLJO'
,p_compute_when=>'P118_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(73748628654113428)
,p_computation_sequence=>20
,p_computation_item=>'P118_IDNTFCCION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select idntfccion',
'      from v_pq_g_solicitudes',
'     where id_instncia_fljo_gnrdo = :P118_ID_INSTNCIA_FLJO;',
''))
,p_compute_when=>'P118_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(73749958660113441)
,p_computation_sequence=>30
,p_computation_item=>'P118_ID_IMPSTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select id_impsto',
'     from v_pq_g_solicitudes',
'    where id_instncia_fljo_gnrdo = :P118_ID_INSTNCIA_FLJO'))
,p_compute_when=>'P118_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73748166615113423)
,p_validation_name=>unistr('Validad que el Tipo de Indentificaci\00F3n no sea nulo')
,p_validation_sequence=>10
,p_validation=>'P118_CDGO_IDNTFCCION_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'P118_TPO_PRSNA'
,p_validation_condition2=>'N'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(73631678127537629)
,p_associated_item=>wwv_flow_api.id(73194682909844430)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73748269136113424)
,p_validation_name=>'Validar que el primer nombre no este vacio'
,p_validation_sequence=>20
,p_validation=>'P118_PRMER_NMBRE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'P118_TPO_PRSNA'
,p_validation_condition2=>'N'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(73631678127537629)
,p_associated_item=>wwv_flow_api.id(73194902336844433)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73748326758113425)
,p_validation_name=>'Validar que el primer apellidos no sea nulo'
,p_validation_sequence=>30
,p_validation=>'P118_PRMER_APLLDO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'P118_TPO_PRSNA'
,p_validation_condition2=>'N'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(73631678127537629)
,p_associated_item=>wwv_flow_api.id(73195154403844435)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73630129414537614)
,p_validation_name=>'Validar que el correo sea valido'
,p_validation_sequence=>40
,p_validation=>'regexp_like (:P118_EMAIL, ''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Ingrese un Email valido.'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(73196016293844444)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(75381896025736303)
,p_validation_name=>'Validar que el la razon social no sea nulo'
,p_validation_sequence=>50
,p_validation=>'P118_NMBRE_RZON_SCIAL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'P118_TPO_PRSNA'
,p_validation_condition2=>'J'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(73631678127537629)
,p_associated_item=>wwv_flow_api.id(73194882184844432)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(75381960416736304)
,p_validation_name=>'Validar que el la actividad principal no sea nulo'
,p_validation_sequence=>60
,p_validation=>'P118_ID_ACTVDAD_ECNMCA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'P118_TPO_PRSNA'
,p_validation_condition2=>'J'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(73631678127537629)
,p_associated_item=>wwv_flow_api.id(73196169354844445)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73747624391113418)
,p_validation_name=>'Validar que Exista un Responsable Principal cuando sera persona natural'
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select seq_id',
'     from apex_collections    a',
'    where collection_name     = ''RESPONSABLES''',
'      and n001                = :F_ID_INSTNCIA_FLJO',
'      and c009                = ''S'';'))
,p_validation_type=>'EXISTS'
,p_error_message=>unistr('Para registrar la solicitud de inscripci\00F3n debe ingregar un responsable principal')
,p_always_execute=>'Y'
,p_validation_condition=>'P118_TPO_PRSNA'
,p_validation_condition2=>'J'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(73631678127537629)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73747827845113420)
,p_validation_name=>'Validar que exista un flujo'
,p_validation_sequence=>80
,p_validation=>'F_ID_INSTNCIA_FLJO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'No se puede registrar la novedad'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(73631678127537629)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73749490777113436)
,p_validation_name=>'Validar que el numero de Celular sea valido'
,p_validation_sequence=>90
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if length(:P118_CLLAR) != 10 then ',
unistr('        return ''El n\00FAmero de celular ingresado no es valido, por favor ingrese 10 n\00FAmeros'';    '),
'    elsif substr(:P118_CLLAR, 1, 1) != ''3'' then',
unistr('        return ''El n\00FAmero de celular ingresado no es valido, debe iniciar con 3'';    '),
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73749585210113437)
,p_validation_name=>'Validar que el numero de telefono sea valido'
,p_validation_sequence=>100
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if length(:P118_TLFNO) != 7 then ',
unistr('        return ''El n\00FAmero de tel\00E9fono ingresado no es valido, por favor ingrese 7 n\00FAmeros'';  '),
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(73628897403537601)
,p_name=>'Ocultar / Mostrar Cuando es Persona Natural'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_TPO_PRSNA'
,p_condition_element=>'P118_TPO_PRSNA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73628927005537602)
,p_event_id=>wwv_flow_api.id(73628897403537601)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_PRMER_NMBRE,P118_SGNDO_NMBRE,P118_PRMER_APLLDO,P118_SGNDO_APLLDO,P118_CDGO_IDNTFCCION_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73629037428537603)
,p_event_id=>wwv_flow_api.id(73628897403537601)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_PRMER_NMBRE,P118_SGNDO_NMBRE,P118_PRMER_APLLDO,P118_SGNDO_APLLDO,P118_CDGO_IDNTFCCION_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73629139960537604)
,p_event_id=>wwv_flow_api.id(73628897403537601)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_NMBRE_RZON_SCIAL,P118_ID_SJTO_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73629252080537605)
,p_event_id=>wwv_flow_api.id(73628897403537601)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_NMBRE_RZON_SCIAL,P118_ID_SJTO_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73630993942537622)
,p_event_id=>wwv_flow_api.id(73628897403537601)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(73630621207537619)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73631014028537623)
,p_event_id=>wwv_flow_api.id(73628897403537601)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(73630621207537619)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73747294187113414)
,p_event_id=>wwv_flow_api.id(73628897403537601)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(73631158677537624)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73747345074113415)
,p_event_id=>wwv_flow_api.id(73628897403537601)
,p_event_result=>'FALSE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(73631158677537624)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73747446892113416)
,p_event_id=>wwv_flow_api.id(73628897403537601)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(73631828735537631)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73747539732113417)
,p_event_id=>wwv_flow_api.id(73628897403537601)
,p_event_result=>'FALSE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(73631828735537631)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(75381608632736301)
,p_event_id=>wwv_flow_api.id(73628897403537601)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(75046946391310021)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(75381781581736302)
,p_event_id=>wwv_flow_api.id(73628897403537601)
,p_event_result=>'FALSE'
,p_action_sequence=>70
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(75046946391310021)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(73629603302537609)
,p_name=>'Limitar la fecha de inicio de actividades con la fecha de registro en camara de comercio'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_FCHA_RGSTRO_CMRA_CMRCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73629759712537610)
,p_event_id=>wwv_flow_api.id(73629603302537609)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P118_FCHA_INCIO_ACTVDDES").datepicker( ''option'' , ''minDate'' , $("#P118_FCHA_RGSTRO_CMRA_CMRCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(73629846566537611)
,p_name=>unistr('Si el tipo de persona es Juridica calcular el valor de raz\00F3n social')
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_TPO_PRSNA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73629918091537612)
,p_event_id=>wwv_flow_api.id(73629846566537611)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    var rzon_scial ;',
'    rzon_scial = $v("P118_PRMER_NMBRE") + " " + $v("P118_SGNDO_NMBRE") + " " + $v("P118_PRMER_APLLDO") + " " + $v("P118_SGNDO_APLLDO");',
'    apex.item("P118_NMBRE_RZON_SCIAL").setValue(rzon_scial);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(73630723653537620)
,p_name=>unistr('Actualizar Direcci\00F3n de Notificacci\00F3n')
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_DRCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73630841584537621)
,p_event_id=>wwv_flow_api.id(73630723653537620)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    var drccion ;',
'    drccion = $v("P118_DRCCION");',
'     apex.item("P118_DRCCION_NTFCCION").setValue(drccion);  ',
'     apex.item("P118_DRCCION_CMRA_CMRCIO").setValue(drccion);  ',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(73748447004113426)
,p_name=>unistr('Refrescar la region de responsables cuando se cierra la modal de gesti\00F3n de responsables')
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(73631280313537625)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73748526972113427)
,p_event_id=>wwv_flow_api.id(73748447004113426)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(73631280313537625)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(73748857893113430)
,p_name=>unistr('Refrescar la region de responsables y actividades economicas cuando se cierra la modal desde la regi\00F3n de opciones')
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(73631409607537627)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73748964605113431)
,p_event_id=>wwv_flow_api.id(73748857893113430)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(73631280313537625)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(75230558605935806)
,p_event_id=>wwv_flow_api.id(73748857893113430)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(75045362313310005)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(75230685929935807)
,p_name=>unistr('Refrescar region de Actividades econ\00F3micas al cerrar modeal desde la regi\00F3n de actividades econ\00F3micas')
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(75045362313310005)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(75230726122935808)
,p_event_id=>wwv_flow_api.id(75230685929935807)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(75045362313310005)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(63537802358772201)
,p_name=>'Al cambiar calcular el nmbre_rzon_scial'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_PRMER_NMBRE,P118_SGNDO_NMBRE,P118_PRMER_APLLDO,P118_SGNDO_APLLDO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(63537987407772202)
,p_event_id=>wwv_flow_api.id(63537802358772201)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var rzon_scial ;',
'rzon_scial = $v("P118_PRMER_NMBRE") + " " + $v("P118_SGNDO_NMBRE") + " " + $v("P118_PRMER_APLLDO") + " " + $v("P118_SGNDO_APLLDO");',
'apex.item("P118_NMBRE_RZON_SCIAL").setValue(rzon_scial);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73630290775537615)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_idntffcion_tpo      varchar2(3)    := ''N'';',
'    v_id_impsto                number;',
'    v_id_impsto_sbmpsto        number;',
'    v_cdgo_rspsta              number;',
'    v_mnsje_rspsta             varchar2(1000);',
'    v_id_nvdad_prsna           number;',
'    ',
'begin',
'    begin',
'        select id_impsto',
'              , id_impsto_sbmpsto',
'            into v_id_impsto',
'               , v_id_impsto_sbmpsto',
'           from v_pq_g_solicitudes',
'          where id_instncia_fljo_gnrdo = :F_ID_INSTNCIA_FLJO;',
'    exception',
'        when others then',
'            raise_application_error(-20003, ''Sr(a). '' || :F_NMBRE_USRIO || '', Error al consultar la solicitud'');  ',
'    end;',
'    ',
'    pkg_si_novedades_persona.prc_rg_novedad_persona (p_cdgo_clnte				=> :F_CDGO_CLNTE,',
'                                                     p_ssion					=> :APP_SESSION,',
'                                                     p_id_impsto				=> v_id_impsto,',
'                                                     p_id_impsto_sbmpsto		=> v_id_impsto_sbmpsto,',
'                                                     p_id_instncia_fljo			=> :F_ID_INSTNCIA_FLJO,',
'                                                     p_cdgo_nvdad_tpo			=> ''INS'',',
unistr('                                                     p_obsrvcion                => ''Inscripci\00F3n de Persona por PQR Portal'','),
'                                                     p_id_usrio_rgstro			=> :F_ID_USRIO,',
'                                                     -- Datos de Inscripcion --',
'                                                     p_tpo_prsna                => :P118_TPO_PRSNA,',
'                                                     p_cdgo_idntfccion_tpo		=> nvl(:P118_CDGO_IDNTFCCION_TPO,v_cdgo_idntffcion_tpo ),',
'                                                     p_idntfccion				=> :P118_IDNTFCCION,',
'                                                     p_prmer_nmbre				=> :P118_PRMER_NMBRE,',
'                                                     p_sgndo_nmbre				=> :P118_SGNDO_NMBRE,',
'                                                     p_prmer_aplldo				=> :P118_PRMER_APLLDO,',
'                                                     p_sgndo_aplldo				=> :P118_SGNDO_APLLDO,',
'                                                     p_nmbre_rzon_scial			=> :P118_NMBRE_RZON_SCIAL,',
'                                                     p_drccion					=> :P118_DRCCION,',
'                                                     p_id_pais					=> :P118_ID_PAIS,',
'                                                     p_id_dprtmnto				=> :P118_ID_DPRTMNTO,',
'                                                     p_id_mncpio				=> :P118_ID_MNCPIO,',
'                                                     p_drccion_ntfccion			=> :P118_DRCCION_NTFCCION,',
'                                                     p_id_pais_ntfccion			=> :P118_ID_PAIS_NTFCCION,',
'                                                     p_id_dprtmnto_ntfccion		=> :P118_ID_DPRTMNTO_NTFCCION,',
'                                                     p_id_mncpio_ntfccion		=> :P118_ID_MNCPIO_NTFCCION,',
'                                                     p_email					=> :P118_EMAIL,',
'                                                     p_tlfno					=> :P118_TLFNO,',
'                                                     p_cllar					=> :P118_CLLAR,',
'                                                     p_nmro_rgstro_cmra_cmrcio	=> :P118_NMRO_RGSTRO_CMRA_CMRCIO,',
'                                                     p_fcha_rgstro_cmra_cmrcio	=> :P118_FCHA_RGSTRO_CMRA_CMRCIO,',
'                                                     p_fcha_incio_actvddes		=> :P118_FCHA_INCIO_ACTVDDES,',
'                                                     p_nmro_scrsles				=> :P118_NMRO_SCRSLES,',
'                                                     p_drccion_cmra_cmrcio		=> :P118_DRCCION_CMRA_CMRCIO,',
'                                                     p_id_actvdad_ecnmca		=> :P118_ID_ACTVDAD_ECNMCA,',
'                                                     p_id_sjto_tpo              => :P118_ID_SJTO_TPO,',
'                                                     -- Fin Datos de Inscripcion--',
'                                                     o_id_nvdad_prsna			=> v_id_nvdad_prsna,',
'                                                     o_cdgo_rspsta				=> v_cdgo_rspsta,',
'                                                     o_mnsje_rspsta				=> v_mnsje_rspsta);',
'    if v_cdgo_rspsta != 0 then ',
'        raise_application_error(-20003, ''Sr(a). '' || :F_NMBRE_USRIO || '', Error al registrar la solicitud. '' || v_mnsje_rspsta);  ',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(73631678127537629)
,p_process_success_message=>'Solicitud registrada exitosamente'
);
end;
/
