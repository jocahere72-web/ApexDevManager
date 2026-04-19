prompt --application/pages/page_00025
begin
wwv_flow_api.create_page(
 p_id=>25
,p_user_interface_id=>wwv_flow_api.id(72999165452094574)
,p_name=>unistr('\00CDtem de Tareas')
,p_step_title=>unistr('\00CDtem de Tareas')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id){',
'    if($(''#''+id).attr(''aria-expanded'') == ''true''){',
'        $(''#''+id).click();',
'    }',
'}',
'',
'buttonCollapse(''t_Button_rightControlButton'');'))
,p_step_template=>wwv_flow_api.id(72894757230094465)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(73037951423586621)
,p_last_upd_yyyymmddhh24miss=>'20200725113320'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(107780872664087101)
,p_plug_name=>unistr('\00CDtem de Tareas')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_trea_item,',
'       b.dscrpcion_trea,',
'       a.dscrpcion,',
'       case a.tpo_orgn',
unistr('           when ''E'' then ''Est\00E1tico'''),
unistr('           when ''I'' then ''\00CDtem de P\00E1gina'''),
'           when ''S'' then ''SQL''',
unistr('           when ''F'' then ''Funci\00F3n'''),
'       end tpo_orgn,',
'       case a.actvo',
unistr('           when ''S'' then ''S\00ED'''),
'           when ''N'' then ''No''',
'       end actvo',
'from gj_d_tareas_item a',
'inner join wf_d_tareas b on a.id_trea = b.id_trea',
'order by 1 desc'))
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
 p_id=>wwv_flow_api.id(32907637270309807)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'10'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:RP,31:P31_ID_TREA_ITEM:#ID_TREA_ITEM#'
,p_detail_link_text=>'<center><img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt=""></center>'
,p_owner=>'JCUAO'
,p_internal_uid=>32907637270309807
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(32907755561309808)
,p_db_column_name=>'ID_TREA_ITEM'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Trea Item'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(32907894863309809)
,p_db_column_name=>'DSCRPCION_TREA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tarea'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(32907911451309810)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(32908014076309811)
,p_db_column_name=>'TPO_ORGN'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Tipo de Origen'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(32908197437309812)
,p_db_column_name=>'ACTVO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(33055845721849760)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'330559'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_TREA_ITEM:DSCRPCION_TREA:DSCRPCION:TPO_ORGN:ACTVO'
,p_break_on=>'DSCRPCION_TREA:0:0:0:0:0'
,p_break_enabled_on=>'DSCRPCION_TREA:0:0:0:0:0'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1058387781424525107)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
unistr('<i>Funcionalidad que permite gestionar los \00EDtem que deben reg\00EDstrarse en las distintas tareas de un flujo.'),
'<br/>',
'<br/>',
'<p>',
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario'),
'</p>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(32908306944309814)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(107780872664087101)
,p_button_name=>'BTN_NUEVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:RP,31::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
end;
/
