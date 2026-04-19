prompt --application/pages/page_00071
begin
wwv_flow_api.create_page(
 p_id=>71
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Tipo de recurso'
,p_step_title=>'Tipo de recurso'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id){',
'	if($(''#''+id).attr(''aria-expanded'') !== ''true''){',
'		$(''#''+id).click();',
'	}',
'}'))
,p_javascript_code_onload=>'buttonCollapse(''t_Button_rightControlButton'');'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_upd_yyyymmddhh24miss=>'20191022165126'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(30246734273576406)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(30246806282576407)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'Funcionalidad que permite ingresar </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100116115975452444)
,p_plug_name=>'Tipo de recurso'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29551431083068507)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_rcrso_tpo,',
'       cdgo_clnte,',
'       nmbre_clnte,',
'       dscrpcion,',
'       nmro_dias,',
'       dscrpcion_tpo_dia,',
'       dscrpcion_mtdo_asgncion,',
'       dscrpcion_mnjo_a_i_r,',
'       dscrpcion_etpa_admsion,',
'       dscrpcion_etpa_indmsion,',
'       dscrpcion_etpa_rchzo,',
'       dscrpcion_actvo',
'  from v_gj_d_recursos_tipo ',
'  order by dscrpcion '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(100116230639452444)
,p_name=>'Tipo de recurso'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:72:&SESSION.::&DEBUG.:RP,72:P72_CDGO_RCRSO_TPO:#CDGO_RCRSO_TPO#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'AURUETA'
,p_internal_uid=>100116230639452444
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100116929247452493)
,p_db_column_name=>'CDGO_CLNTE'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Cdgo Clnte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100117330239452493)
,p_db_column_name=>'NMBRE_CLNTE'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Nmbre Clnte'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100116503375452481)
,p_db_column_name=>'CDGO_RCRSO_TPO'
,p_display_order=>30
,p_column_identifier=>'A'
,p_column_label=>unistr('C\00F3digo')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100117778849452494)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100118189707452494)
,p_db_column_name=>'NMRO_DIAS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('N\00FAmero<br>de d\00EDas')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96899655209650743)
,p_db_column_name=>'DSCRPCION_TPO_DIA'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('Tipo de d\00EDa')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96899744971650744)
,p_db_column_name=>'DSCRPCION_MTDO_ASGNCION'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>unistr('M\00E9todo de asignaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96899843048650745)
,p_db_column_name=>'DSCRPCION_MNJO_A_I_R'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>unistr('Manejo de <br>Admisi\00F3n/Inadmisi\00F3n/Rechazo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110670105994648603)
,p_db_column_name=>'DSCRPCION_ACTVO'
,p_display_order=>150
,p_column_identifier=>'P'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110670257324648604)
,p_db_column_name=>'DSCRPCION_ETPA_ADMSION'
,p_display_order=>160
,p_column_identifier=>'Q'
,p_column_label=>unistr('Instancia admisi\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110670348355648605)
,p_db_column_name=>'DSCRPCION_ETPA_INDMSION'
,p_display_order=>170
,p_column_identifier=>'R'
,p_column_label=>unistr('Instancia inadmisi\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110670406340648606)
,p_db_column_name=>'DSCRPCION_ETPA_RCHZO'
,p_display_order=>180
,p_column_identifier=>'S'
,p_column_label=>'Instancia rechazo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(100135214089983760)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1001353'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CDGO_RCRSO_TPO:DSCRPCION:NMRO_DIAS:DSCRPCION_TPO_DIA:DSCRPCION_MTDO_ASGNCION:DSCRPCION_MNJO_A_I_R:DSCRPCION_ETPA_ADMSION:DSCRPCION_ETPA_INDMSION:DSCRPCION_ETPA_RCHZO:DSCRPCION_ACTVO:'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(96899992914650746)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(30246734273576406)
,p_button_name=>'BTN_NUEVO_TIPO_RECURSO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo tipo recurso'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:72:&SESSION.::&DEBUG.:RP,72::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100188587461681801)
,p_name=>'Al cerrar dialogo'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100188648372681802)
,p_event_id=>wwv_flow_api.id(100188587461681801)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(100116115975452444)
,p_stop_execution_on_error=>'Y'
);
end;
/
