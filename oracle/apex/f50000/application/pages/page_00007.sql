prompt --application/pages/page_00007
begin
wwv_flow_api.create_page(
 p_id=>7
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Informe de recursos instancias'
,p_step_title=>'Informe de recursos instancias'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id){',
'if($(''#''+id).attr(''aria-expanded'') !== ''true''){',
'$(''#''+id).click();',
'}',
'}'))
,p_javascript_code_onload=>'buttonCollapse(''t_Button_rightControlButton'');'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20181024175052'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29429422084772715)
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
'    </b>',
'</h5>',
'Funcionalidad que permite ingresar',
'        </i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(36335145077352201)
,p_plug_name=>'Opcion'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><center><b><i> Opciones<i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100253068870165436)
,p_plug_name=>'Informe de recursos instancias'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29551431083068507)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_rcrso_instncia,',
'       cdgo_clnte,',
'       dscrpcion_rcrso_tpo,',
'       dscrpcion_instncia_tpo,',
'       orden,',
'       nmro_dias,',
'       dscrpcion_tpo_dias,',
'       dscrpcion_instncia_tpo_sgnte,',
'       dscrpcion_mtdo_asgncion,',
'       dscrpcion_mnjo_a_i_r',
'  from v_gj_d_recursos_instncia'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(100253196724165437)
,p_name=>'Informe de recursos instancias'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP,8:P8_ID_RCRSO_INSTNCIA,F_BRANCH:#ID_RCRSO_INSTNCIA#,&APP_PAGE_ID.'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'AURUETA'
,p_internal_uid=>100253196724165437
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100253567803165461)
,p_db_column_name=>'ID_RCRSO_INSTNCIA'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Rcrso Instncia'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100253836862165467)
,p_db_column_name=>'CDGO_CLNTE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Cdgo Clnte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100255099570165468)
,p_db_column_name=>'ORDEN'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Orden'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100255435663165469)
,p_db_column_name=>'NMRO_DIAS'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>unistr('N\00FAmero <br>de d\00EDas')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100188702918681803)
,p_db_column_name=>'DSCRPCION_RCRSO_TPO'
,p_display_order=>20
,p_column_identifier=>'K'
,p_column_label=>'Tipo de recurso'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100188899385681804)
,p_db_column_name=>'DSCRPCION_INSTNCIA_TPO'
,p_display_order=>30
,p_column_identifier=>'L'
,p_column_label=>'Tipo de instancia'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100188986634681805)
,p_db_column_name=>'DSCRPCION_TPO_DIAS'
,p_display_order=>40
,p_column_identifier=>'M'
,p_column_label=>unistr('Tipo de d\00EDas')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100189072504681806)
,p_db_column_name=>'DSCRPCION_INSTNCIA_TPO_SGNTE'
,p_display_order=>50
,p_column_identifier=>'N'
,p_column_label=>'Instancia siguiente'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100189173211681807)
,p_db_column_name=>'DSCRPCION_MTDO_ASGNCION'
,p_display_order=>60
,p_column_identifier=>'O'
,p_column_label=>unistr('M\00E9todo de asignaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100189212618681808)
,p_db_column_name=>'DSCRPCION_MNJO_A_I_R'
,p_display_order=>70
,p_column_identifier=>'P'
,p_column_label=>unistr('Manejo <br>Admisi\00F3n/Inadmisi\00F3n/Rechazo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(100263227678222431)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1002633'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_RCRSO_TPO:DSCRPCION_INSTNCIA_TPO:ORDEN:DSCRPCION_TPO_DIAS:NMRO_DIAS:DSCRPCION_INSTNCIA_TPO_SGNTE:DSCRPCION_MTDO_ASGNCION:DSCRPCION_MNJO_A_I_R:'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100189301049681809)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(36335145077352201)
,p_button_name=>'BTN_NUEVA_INSTANCIA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva instancia'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP,8:F_BRANCH:&APP_PAGE_ID.'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
end;
/
