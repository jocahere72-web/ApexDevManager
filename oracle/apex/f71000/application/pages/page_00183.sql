prompt --application/pages/page_00183
begin
wwv_flow_api.create_page(
 p_id=>183
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'colecciones test'
,p_step_title=>'colecciones test'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LTORRES'
,p_last_upd_yyyymmddhh24miss=>'20190430140108'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103986746452655509)
,p_plug_name=>'Nuevo'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103987148939655513)
,p_plug_name=>'Nuevo'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SEQ_ID , c001, c002, n001, d001',
'   FROM APEX_collections',
' WHERE collection_name = ''TEST'''))
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
 p_id=>wwv_flow_api.id(103989464436655536)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:183:&SESSION.::&DEBUG.:RP:P183_SEQ:#SEQ_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'LTORRES'
,p_internal_uid=>103989464436655536
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103989576816655537)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103989663256655538)
,p_db_column_name=>'C001'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'C001'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103989701559655539)
,p_db_column_name=>'C002'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'C002'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103989816933655540)
,p_db_column_name=>'N001'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'N001'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103989968553655541)
,p_db_column_name=>'D001'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'D001'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(104211774424490166)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1042118'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SEQ_ID:C001:C002:N001:D001'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103987796898655519)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(103986746452655509)
,p_button_name=>'Crear'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Crear'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103986884189655510)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(103986746452655509)
,p_button_name=>'Llenar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Llenar'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103990158649655543)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(103986746452655509)
,p_button_name=>'Borrar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Borrar'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103990383037655545)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(103986746452655509)
,p_button_name=>'Actualizar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Actualizar'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103990537046655547)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(103986746452655509)
,p_button_name=>'Guardar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Guardar'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103990015543655542)
,p_name=>'P183_SEQ'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(103986746452655509)
,p_prompt=>'Nuevo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(104446504030194601)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Crear colecci\00F3n')
,p_process_sql_clob=>'null;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103987001852655512)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Llenar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_COLLECTION.ADD_MEMBER (',
'    p_collection_name => ''test'',',
'    p_c001 => ''nelson'' ,',
'    p_c002 => ''nelson 2'' ,',
'    p_n001 => 1,',
'    p_d001 => sysdate );',
'    ',
'    ',
'    APEX_COLLECTION.ADD_MEMBER (',
'    p_collection_name => ''test'',',
'    p_c001 => ''nelson1'' ,',
'    p_c002 => ''nelson 21'' ,',
'    p_n001 => 1,',
'    p_d001 => sysdate );',
'    ',
'    ',
'    ',
'    APEX_COLLECTION.ADD_MEMBER (',
'    p_collection_name => ''test'',',
'    p_c001 => ''nelson2'' ,',
'    p_c002 => ''nelson 22'' ,',
'    p_n001 => 1,',
'    p_d001 => sysdate );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(103986884189655510)
,p_process_success_message=>'llenado'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103987855223655520)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Crear'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(',
'        p_collection_name => ''test'');'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(103987796898655519)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103990276034655544)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Borrar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_COLLECTION.DELETE_MEMBER (',
'  p_collection_name => ''test'',',
'    p_seq => :P183_SEQ );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(103990158649655543)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103990427685655546)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_COLLECTION.UPDATE_MEMBER (',
'       p_collection_name => ''test'',',
'       p_seq => :P183_SEQ ,',
'       p_c001 => ''luis'' ,',
'       p_c002 => ''luis 2'' ,',
'       p_n001 => 2,',
'       p_d001 => sysdate + 1 );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(103990383037655545)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103990613408655548)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'for x in (SELECT SEQ_ID , c001, c002, n001, d001',
'   FROM APEX_collections',
' WHERE collection_name = ''TEST'' ) loop',
'          null;',
'          ',
'          end loop;',
'',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(103990537046655547)
);
end;
/
