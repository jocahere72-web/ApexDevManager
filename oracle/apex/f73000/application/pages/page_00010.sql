prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(76451776849582525)
,p_name=>'Expedientes'
,p_step_title=>'Expedientes'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(76345756650582452)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20191105094857'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10415403098664117)
,p_plug_name=>'Expedientes'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(76376636512582469)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_expdnte,',
'       nmro_expdnte,',
'       nmbre_expdnte,',
'       obsrvcion_expdnte,',
'       to_char(fcha_expdnte, ''dd/mm/yyyy'') fcha_expdnte,',
'       case ',
'           when actvo_expdnte = ''S'' ',
'           then ''<span class="fa fa-check-square"  style="color:#0572ce" aria-hidden="true"></span>''',
'           else ''<span aria-hidden="true" style="color:red" class="fa fa-times-square"></span>'' end actvo_expdnte,',
'       nmbre_area,',
'       nmbre_cldad,',
'       nmbre_sstma,',
'       cdgo_srie || ''-'' || nmbre_srie serie,',
'       cdgo_sbsrie || ''-'' || nmbre_sbsrie "sub-serie"',
'  from v_gd_g_expedientes',
' where cdgo_clnte = :F_CDGO_CLNTE;'))
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
 p_id=>wwv_flow_api.id(10415593256664118)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP,12:P12_ID_EXPDNTE:#ID_EXPDNTE#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'MCARO'
,p_internal_uid=>10415593256664118
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(10415668693664119)
,p_db_column_name=>'ID_EXPDNTE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Expdnte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(10415870504664121)
,p_db_column_name=>'NMRO_EXPDNTE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('N\00FAmero Expediente')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(10415990039664122)
,p_db_column_name=>'NMBRE_EXPDNTE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(10905395719783009)
,p_db_column_name=>'FCHA_EXPDNTE'
,p_display_order=>50
,p_column_identifier=>'AD'
,p_column_label=>'Fecha'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(10416346803664126)
,p_db_column_name=>'NMBRE_AREA'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>unistr('\00C1rea')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(10416531208664128)
,p_db_column_name=>'NMBRE_CLDAD'
,p_display_order=>80
,p_column_identifier=>'J'
,p_column_label=>'Proceso Calidad'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(10416854229664131)
,p_db_column_name=>'NMBRE_SSTMA'
,p_display_order=>90
,p_column_identifier=>'M'
,p_column_label=>'Proceso de sistema'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(10904754122783003)
,p_db_column_name=>'OBSRVCION_EXPDNTE'
,p_display_order=>120
,p_column_identifier=>'AC'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(10905483566783010)
,p_db_column_name=>'SERIE'
,p_display_order=>130
,p_column_identifier=>'AE'
,p_column_label=>'Serie'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(10905502919783011)
,p_db_column_name=>'sub-serie'
,p_display_order=>140
,p_column_identifier=>'AF'
,p_column_label=>'Subserie'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(10907243256783028)
,p_db_column_name=>'ACTVO_EXPDNTE'
,p_display_order=>150
,p_column_identifier=>'AG'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(10884945460721556)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'108850'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_EXPDNTE:NMBRE_EXPDNTE:FCHA_EXPDNTE:OBSRVCION_EXPDNTE:NMBRE_AREA:NMBRE_CLDAD:NMBRE_SSTMA:SERIE:sub-serie::ACTVO_EXPDNTE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10418476085664147)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10418586465664148)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>30
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
'Funcionalidad que permite consultar y gestionar expedientes.<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10418681929664149)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(10418476085664147)
,p_button_name=>'New'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP,12::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
end;
/
