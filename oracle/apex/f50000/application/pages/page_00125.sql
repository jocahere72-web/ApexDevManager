prompt --application/pages/page_00125
begin
wwv_flow_api.create_page(
 p_id=>125
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Reglas de Negocio Cliente'
,p_step_title=>'Reglas de Negocio Cliente'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20191028152036'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(84450843604652154)
,p_plug_name=>'Reglas de Negocio'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29551431083068507)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_rgla_ngcio_clnte,',
'        cdgo_clnte,',
'        id_impsto,',
'	    dscrp_rgla_ngcio_clnte,',
'        nmbre_impsto,',
'        id_impsto_sbmpsto,',
'        nmbre_impsto_sbmpsto,',
'        id_rgla_ngcio,',
'        indcdor_edta_rgla        ',
'from v_gn_d_reglas_negocio_cliente',
'where cdgo_clnte = :f_cdgo_clnte',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(84451259984652154)
,p_name=>'Report 1'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:128:&SESSION.::&DEBUG.:128:P128_ID_RGLA_NGCIO_CLNTE:#ID_RGLA_NGCIO_CLNTE#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'ELAFAURIE'
,p_internal_uid=>84451259984652154
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84452196117652157)
,p_db_column_name=>'CDGO_CLNTE'
,p_display_order=>10
,p_column_identifier=>'C'
,p_column_label=>'Cdgo Clnte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84452566715652158)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>'Id Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84288256030513342)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>35
,p_column_identifier=>'L'
,p_column_label=>'Sub Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84453355712652158)
,p_db_column_name=>'ID_RGLA_NGCIO'
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>'Id Rgla Ngcio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84288361904513343)
,p_db_column_name=>'DSCRP_RGLA_NGCIO_CLNTE'
,p_display_order=>50
,p_column_identifier=>'M'
,p_column_label=>unistr('Regla de Negocio Espec\00EDfica')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84451762719652157)
,p_db_column_name=>'ID_RGLA_NGCIO_CLNTE'
,p_display_order=>60
,p_column_identifier=>'B'
,p_column_label=>unistr('\00BFRegla Editable?')
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84453741433652159)
,p_db_column_name=>'INDCDOR_EDTA_RGLA'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('\00BFRegla Editable?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84477519333936403)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>80
,p_column_identifier=>'N'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84477627189936404)
,p_db_column_name=>'ID_IMPSTO_SBMPSTO'
,p_display_order=>90
,p_column_identifier=>'O'
,p_column_label=>'Id Impsto Sbmpsto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(84464061947711554)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'844641'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_RGLA_NGCIO_CLNTE:CDGO_CLNTE:ID_IMPSTO:ID_RGLA_NGCIO:INDCDOR_EDTA_RGLA_SBMPSTO:DSCRP_RGLA_NGCIO_CLNTE:NMBRE_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(84477381526936401)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(84477485017936402)
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
'Funcionalidad que permite ingresar y consultar las reglas de negocio que pueden ser aplicadas.<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'',
'',
'',
'',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(84456247102652161)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(84477381526936401)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva Regla'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'f?p=&APP_ID.:128:&SESSION.::&DEBUG.:128::'
,p_icon_css_classes=>'fa-window-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(84455348633652160)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(84450843604652154)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(84455827130652160)
,p_event_id=>wwv_flow_api.id(84455348633652160)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(84450843604652154)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(84456637244652161)
,p_name=>'Create Button - Dialog Closed'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(84457191587652161)
,p_event_id=>wwv_flow_api.id(84456637244652161)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(84450843604652154)
,p_stop_execution_on_error=>'Y'
);
end;
/
