prompt --application/pages/page_00025
begin
wwv_flow_api.create_page(
 p_id=>25
,p_user_interface_id=>wwv_flow_api.id(323679016569283847)
,p_name=>unistr('Gesti\00F3n de traslado de procesos')
,p_step_title=>unistr('Gesti\00F3n de traslado de procesos')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(39266481085898285)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JBADRAN'
,p_last_upd_yyyymmddhh24miss=>'20251125220320'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24184987591668942)
,p_plug_name=>unistr('Gesti\00F3n de traslado de procesos')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(39298132994898311)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.id_instncia_fljo_trsldo',
'     , to_char(t.fcha, ''dd/mm/yyyy hh:mi:ss am'') fcha',
'     , b.nmro_rdcdo_dsplay',
'     , t.id_usrio',
'     , ut.nmbre_trcro usrio_trsldo',
'     , t.id_usrio_rspnsble',
'     , ur.nmbre_trcro usrio_rspnsble',
'     , t.id_usrio_asgndo',
'     , ua.nmbre_trcro usrio_asgndo',
'     , count(1) ttal',
'     , t.obsrvcion',
' from wf_g_instancias_fljo_trsldo t',
' join wf_g_instancias_transicion a ',
'   on a.id_instncia_trnscion = t.id_instncia_trnscion',
' join v_pq_g_solicitudes b',
'   on a.id_instncia_fljo = b.id_instncia_fljo_gnrdo',
' join v_sg_g_usuarios ut ',
'   on ut.id_usrio = t.id_usrio',
' join v_sg_g_usuarios ur ',
'   on ur.id_usrio = t.id_usrio_rspnsble',
' join v_sg_g_usuarios ua ',
'   on ua.id_usrio = t.id_usrio_asgndo',
'where t.cdgo_clnte  = :F_CDGO_CLNTE',
'  group by t.id_instncia_fljo_trsldo',
'         , b.nmro_rdcdo_dsplay',
'         , to_char(t.fcha, ''dd/mm/yyyy hh:mi:ss am'')',
'         , t.id_usrio',
'         , ut.nmbre_trcro',
'         , t.id_usrio_rspnsble',
'         , ur.nmbre_trcro ',
'         , t.id_usrio_asgndo',
'         , ua.nmbre_trcro',
'         , ur.nmbre_trcro ',
'         , t.id_usrio_asgndo',
'         , ua.nmbre_trcro ',
'         , t.obsrvcion',
'order by id_instncia_fljo_trsldo desc;'))
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
 p_id=>wwv_flow_api.id(24185077771668943)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:RP,26:P26_ID_USRIO,P26_ID_USRIO_ASGNDO,P26_ID_USRIO_RSPNSBLE,P26_FCHA:#ID_USRIO#,#ID_USRIO_ASGNDO#,#ID_USRIO_RSPNSBLE#,#FCHA#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'MCARO'
,p_internal_uid=>24185077771668943
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24185122608668944)
,p_db_column_name=>'FCHA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Fecha'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24185273392668945)
,p_db_column_name=>'ID_USRIO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Usrio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24185320582668946)
,p_db_column_name=>'USRIO_TRSLDO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Usuario Hizo Traslado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24185451680668947)
,p_db_column_name=>'ID_USRIO_RSPNSBLE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Id Usrio Rspnsble'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24185553207668948)
,p_db_column_name=>'USRIO_RSPNSBLE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Usuario Responsable'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24185614208668949)
,p_db_column_name=>'ID_USRIO_ASGNDO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Id Usrio Asgndo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24185783187668950)
,p_db_column_name=>'USRIO_ASGNDO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Usuario Asignado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25451180014305101)
,p_db_column_name=>'TTAL'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Total de Traslados'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80218329838128101)
,p_db_column_name=>'NMRO_RDCDO_DSPLAY'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Nmro Rdcdo Dsplay'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15925154557549502)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15178403908511403)
,p_db_column_name=>'ID_INSTNCIA_FLJO_TRSLDO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Id Instncia Fljo Trsldo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(25459312075305487)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'254594'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FCHA:ID_USRIO:USRIO_TRSLDO:ID_USRIO_RSPNSBLE:USRIO_RSPNSBLE:ID_USRIO_ASGNDO:USRIO_ASGNDO:TTAL:NMRO_RDCDO_DSPLAY:OBSRVCION:ID_INSTNCIA_FLJO_TRSLDO'
,p_sort_column_1=>'0'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25451250451305102)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(39299295614898312)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center;">',
'        <b>',
'            <i>Opciones <i class="fa fa-gears" aria-hidden="true"></i>',
'			</i>',
'        </b>',
'    </div>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25451358141305103)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(39299295614898312)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'<i>',
'  Funcionalidad que permite gestionar los traslados de flujo de proceso<br/><br/>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(25452680905305116)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(25451250451305102)
,p_button_name=>'BTN_NVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(39351872500898344)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:RP,21::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
end;
/
