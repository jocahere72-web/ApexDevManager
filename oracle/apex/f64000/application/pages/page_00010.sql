prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(304917555609291792)
,p_name=>'Log Error'
,p_step_title=>'Log Error'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(304865460026291429)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JALCOCER'
,p_last_upd_yyyymmddhh24miss=>'20171212085940'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104097824055387358)
,p_plug_name=>'Filtros'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(304883916990291570)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104771913636883541)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_api.id(104097824055387358)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(304878479137291560)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104179839176313677)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(304888368427291580)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(304918791846291874)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(304907184148291642)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104180504749313679)
,p_plug_name=>'Log Error'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(304883410621291569)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_LOG_ERROR,',
'       FCHA_ERROR,',
'       CDGO_ERROR,',
'       MESSAGE,',
'       ADDITIONAL_INFO,',
'       DISPLAY_LOCATION,',
'       ASSOCIATION_TYPE,',
'       PAGE_ITEM_NAME,',
'       APPLICATION_ID,',
'       APPLICATION_NAME,',
'       PAGE_ID,',
'       PAGE_NAME,',
'       REGION_ID,',
'       REGION_NAME,',
'       COLUMN_ALIAS,',
'       ROW_NUM,',
'       IS_INTERNAL_ERROR,',
'       APEX_ERROR_CODE,',
'       ORA_SQLCODE,',
'       ORA_SQLERRM,',
'       ERROR_BACKTRACE,',
'       ERROR_STATEMENT',
'  from V_SG_G_LOG_ERROR  ',
'  where ( nvl(to_char(to_date(:P10_FCHA_ERROR,''DD/MM/YYYY''),''DD/MM/YYYY''),''XXX'') = ''XXX'' OR',
'        to_date(to_char(FCHA_ERROR,''DD/MM/YYYY''),''DD/MM/YYYY'') = TO_DATE(:P10_FCHA_ERROR,''DD/MM/YYYY'') )',
'  AND (NVL(:P10_APPLICATION_NAME ,''XXX'') = ''XXX'' OR APPLICATION_NAME = :P10_APPLICATION_NAME )',
'  AND (NVL(:P10_PAGE_NAME ,''XXX'') = ''XXX'' OR    PAGE_NAME = :P10_PAGE_NAME )',
'  AND (NVL(:P10_REGION_NAME,''XXX'') = ''XXX'' OR  REGION_NAME = :P10_REGION_NAME)',
'  ',
'      ',
'  ',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
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
 p_id=>wwv_flow_api.id(104352016802734334)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP:P11_ID_LOG_ERROR:#ID_LOG_ERROR#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JALCOCER'
,p_internal_uid=>102148598327083401
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104352118315734335)
,p_db_column_name=>'ID_LOG_ERROR'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id log error'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104352122842734336)
,p_db_column_name=>'FCHA_ERROR'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Fecha Error'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104352284968734337)
,p_db_column_name=>'CDGO_ERROR'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('C\00F3digo Error')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104321277443675442)
,p_db_column_name=>'APPLICATION_NAME'
,p_display_order=>40
,p_column_identifier=>'S'
,p_column_label=>unistr('Nombre Aplicaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104321498786675444)
,p_db_column_name=>'PAGE_NAME'
,p_display_order=>50
,p_column_identifier=>'U'
,p_column_label=>unistr('Nombre P\00E1gina')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104321524243675445)
,p_db_column_name=>'REGION_NAME'
,p_display_order=>60
,p_column_identifier=>'V'
,p_column_label=>unistr('Nombre Regi\00F3n ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104352400024734338)
,p_db_column_name=>'MESSAGE'
,p_display_order=>70
,p_column_identifier=>'D'
,p_column_label=>'Mensaje'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104352471816734339)
,p_db_column_name=>'ADDITIONAL_INFO'
,p_display_order=>80
,p_column_identifier=>'E'
,p_column_label=>unistr('Informaci\00F3n Adicional')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104352521084734340)
,p_db_column_name=>'DISPLAY_LOCATION'
,p_display_order=>90
,p_column_identifier=>'F'
,p_column_label=>'Display location'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104352630543734341)
,p_db_column_name=>'ASSOCIATION_TYPE'
,p_display_order=>100
,p_column_identifier=>'G'
,p_column_label=>'Association type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104352814161734342)
,p_db_column_name=>'PAGE_ITEM_NAME'
,p_display_order=>110
,p_column_identifier=>'H'
,p_column_label=>'Page item name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104321172497675441)
,p_db_column_name=>'APPLICATION_ID'
,p_display_order=>120
,p_column_identifier=>'R'
,p_column_label=>unistr('Id Aplicaci\00F3n ')
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104321398917675443)
,p_db_column_name=>'PAGE_ID'
,p_display_order=>130
,p_column_identifier=>'T'
,p_column_label=>'Id Pagina'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104352862964734343)
,p_db_column_name=>'REGION_ID'
,p_display_order=>140
,p_column_identifier=>'I'
,p_column_label=>'Id Region '
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104352926999734344)
,p_db_column_name=>'COLUMN_ALIAS'
,p_display_order=>150
,p_column_identifier=>'J'
,p_column_label=>'Column alias'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104353063421734345)
,p_db_column_name=>'ROW_NUM'
,p_display_order=>160
,p_column_identifier=>'K'
,p_column_label=>'Row num'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104353142658734346)
,p_db_column_name=>'IS_INTERNAL_ERROR'
,p_display_order=>170
,p_column_identifier=>'L'
,p_column_label=>'Is internal error'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104353249965734347)
,p_db_column_name=>'APEX_ERROR_CODE'
,p_display_order=>180
,p_column_identifier=>'M'
,p_column_label=>'Apex error code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104353389323734348)
,p_db_column_name=>'ORA_SQLCODE'
,p_display_order=>190
,p_column_identifier=>'N'
,p_column_label=>'Ora sqlcode'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104353511925734349)
,p_db_column_name=>'ORA_SQLERRM'
,p_display_order=>200
,p_column_identifier=>'O'
,p_column_label=>'Ora sqlerrm'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104353533156734350)
,p_db_column_name=>'ERROR_BACKTRACE'
,p_display_order=>210
,p_column_identifier=>'P'
,p_column_label=>'Error backtrace'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104353705511734351)
,p_db_column_name=>'ERROR_STATEMENT'
,p_display_order=>220
,p_column_identifier=>'Q'
,p_column_label=>'Error statement'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(104370073949734755)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1021667'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_LOG_ERROR:FCHA_ERROR:CDGO_ERROR:MESSAGE:ADDITIONAL_INFO:DISPLAY_LOCATION:ASSOCIATION_TYPE:PAGE_ITEM_NAME:REGION_ID:COLUMN_ALIAS:ROW_NUM:IS_INTERNAL_ERROR:APEX_ERROR_CODE:ORA_SQLCODE:ORA_SQLERRM:ERROR_BACKTRACE:ERROR_STATEMENT:APPLICATION_ID:APPLIC'
||'ATION_NAME:PAGE_ID:PAGE_NAME:REGION_NAME'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(104771453953883537)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(104771913636883541)
,p_button_name=>'Limpiar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(304906801966291639)
,p_button_image_alt=>'Limpiar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-square-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104098004154387359)
,p_name=>'P10_FCHA_ERROR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(104097824055387358)
,p_prompt=>'Fecha Error'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(304906335439291628)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104321709110675446)
,p_name=>'P10_APPLICATION_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(104097824055387358)
,p_prompt=>unistr('Nombre Aplicaci\00F3n ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct application_name d, application_name r from V_SG_G_LOG_ERROR  ',
'order by 1'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(304906335439291628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104321752104675447)
,p_name=>'P10_PAGE_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(104097824055387358)
,p_prompt=>unistr('Nombre P\00E1gina')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct page_name d, page_name r from V_SG_G_LOG_ERROR  ',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(304906335439291628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104321868427675448)
,p_name=>'P10_REGION_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(104097824055387358)
,p_prompt=>unistr('Nombre Regi\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct region_name d, region_name  r from V_SG_G_LOG_ERROR  ',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(304906335439291628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(104098082615387360)
,p_name=>'Submit'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_FCHA_ERROR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(104098141086387361)
,p_event_id=>wwv_flow_api.id(104098082615387360)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(104321938766675449)
,p_name=>'SUBMIT'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_APPLICATION_NAME'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(104322051315675450)
,p_event_id=>wwv_flow_api.id(104321938766675449)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(104322189258675451)
,p_name=>'SUBMITT'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_PAGE_NAME'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(104322223395675452)
,p_event_id=>wwv_flow_api.id(104322189258675451)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(104322352655675453)
,p_name=>'SUBMITS'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_REGION_NAME'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(104322464611675454)
,p_event_id=>wwv_flow_api.id(104322352655675453)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(104771615504883538)
,p_name=>'Limpiar_Items'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(104771453953883537)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(104771665386883539)
,p_event_id=>wwv_flow_api.id(104771615504883538)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P10_REGION_NAME,P10_FCHA_ERROR,P10_APPLICATION_NAME,P10_PAGE_NAME'
,p_stop_execution_on_error=>'Y'
);
end;
/
