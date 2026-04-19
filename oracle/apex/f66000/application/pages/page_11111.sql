prompt --application/pages/page_11111
begin
wwv_flow_api.create_page(
 p_id=>111111
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'prueba'
,p_step_title=>'prueba'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20210312093902'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18706855218957301)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18706901050957302)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(18706855218957301)
,p_button_name=>'Imprimir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(35794538727290432)
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(18707037782957303)
,p_branch_name=>'imprimir'
,p_branch_action=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP:P2_XML,P2_ID_RPRTE:''<data><id_dcmnto>1167</id_dcmnto><id_acto>8439841</id_acto><id_prscrpcion>62035</id_prscrpcion></data>'',211&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18222767829938604)
,p_name=>'P111111_NEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(18706855218957301)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'select dcmnto',
'  from gf_g_prscrpcns_dcmnto',
' where id_prscrpcion = 62035;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'New'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_cSize=>30
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(35794096676290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'N'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18222856485938605)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dcmnto',
'  into :P111111_NEW',
'  from gf_g_prscrpcns_dcmnto',
' where id_prscrpcion = 62035;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
