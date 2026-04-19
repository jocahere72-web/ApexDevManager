prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(71698179048188014)
,p_name=>'test'
,p_step_title=>'test'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JCUAO'
,p_last_upd_yyyymmddhh24miss=>'20190719120838'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(5990682863474611)
,p_name=>'Nuevo'
,p_template=>wwv_flow_api.id(71624143472187958)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'FUNC_BODY_RETURNING_SQL'
,p_source=>'RETURN NVL(:P2_SQL,''select * from dual'');'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P2_SQL'
,p_query_row_template=>wwv_flow_api.id(71648462176187972)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5990798125474612)
,p_query_column_id=>1
,p_column_alias=>'DUMMY'
,p_column_display_sequence=>1
,p_column_heading=>'Dummy'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5990848625474613)
,p_plug_name=>'Nuevo'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71624143472187958)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6012110343689102)
,p_plug_name=>'Nuevo'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71624143472187958)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6012595391689106)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6012110343689102)
,p_button_name=>'BTN_ENVIAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(71676231379187991)
,p_button_image_alt=>'Enviar'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6012825867689109)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(6012110343689102)
,p_button_name=>'BTN_CNFRMAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(71676231379187991)
,p_button_image_alt=>'cONFIRMAR'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5991143080474616)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5990848625474613)
,p_button_name=>'CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(71676231379187991)
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5991335495474618)
,p_branch_action=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP,2:P2_SQL:&P2_SQL.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5990946749474614)
,p_name=>'P2_SQL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5990848625474613)
,p_prompt=>'Nuevo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(71675717475187989)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6012946747689110)
,p_name=>'P2_EMAIL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6012110343689102)
,p_prompt=>'Nuevo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(71675717475187989)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6012692449689107)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Nuevo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Example Two: Plain Text / HTML message',
'DECLARE',
'    l_body      CLOB;',
'    l_body_html CLOB;',
'BEGIN',
'    l_body := ''To view the content of this message, please use an HTML enabled mail client.''||utl_tcp.crlf;',
'',
'    l_body_html := ''<html>',
'        <head>',
'            <style type="text/css">',
'                body{font-family: Arial, Helvetica, sans-serif;',
'                    font-size:10pt;',
'                    margin:30px;',
'                    background-color:#ffffff;}',
'',
'                span.sig{font-style:italic;',
'                    font-weight:bold;',
'                    color:#811919;}',
'             </style>',
'         </head>',
'         <body>''||utl_tcp.crlf;',
'    l_body_html := l_body_html ||''<p>Thank you for your interest in the <strong>APEX_MAIL</strong> package.</p>''||utl_tcp.crlf;',
'    l_body_html := l_body_html ||''  Sincerely,<br />''||utl_tcp.crlf;',
'    l_body_html := l_body_html ||''  <span class="sig">The Application Express Dev Team</span><br />''||utl_tcp.crlf;',
'    l_body_html := l_body_html ||''</body></html>''; ',
'    apex_mail.send(',
'    p_to   => :P2_EMAIL,   -- change to your email address',
'    p_from => ''infortributos.sas@gmail.com'', -- change to a real senders email address',
'    p_body      => l_body,',
'    p_body_html => l_body_html,',
'    p_subj      => ''APEX_MAIL Package - HTML formatted message'');',
'END;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(6012595391689106)
,p_process_success_message=>'Enviado'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6012791888689108)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Confirmar'
,p_process_sql_clob=>'APEX_MAIL.PUSH_QUEUE();'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(6012825867689109)
);
end;
/
