prompt --application/pages/page_00908
begin
wwv_flow_api.create_page(
 p_id=>908
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Nueva Consulta'
,p_page_mode=>'MODAL'
,p_step_title=>'Nueva Consulta'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'MCARO'
,p_last_upd_yyyymmddhh24miss=>'20190606175203'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(87094338494103304)
,p_plug_name=>'Consulta'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(87170610175701701)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(87094338494103304)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(87111401206142401)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(87094338494103304)
,p_button_name=>'BTN_SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87094428636103305)
,p_name=>'P908_COD_PROCESO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(87094338494103304)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87094599530103306)
,p_name=>'P908_CNSLTA_MSTRO_PDRE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(87094338494103304)
,p_prompt=>'Consulta General'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_cnslta,',
'       id_cnslta_mstro ',
'  from cs_g_consultas_maestro m',
'  join cs_d_procesos_sql p',
'    on p.id_prcso_sql = m.id_prcso_sql',
' where p.cdgo_clnte = :F_CDGO_CLNTE ',
'   and p.cdgo_prcso_sql = :P908_COD_PROCESO',
'   and tpo_cndcion is null',
'   and id_cnslta_mstro_gnral is null'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87105391938135501)
,p_name=>'P908_NMBRE_CNSLTA'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(87094338494103304)
,p_prompt=>'Nombre Consulta'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>99
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(87178735522711501)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Copiar regla general'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_cs_constructorsql.prc_rg_copiar_consulta_general( p_id_cnslta_mstro => :P908_CNSLTA_MSTRO_PDRE',
'                                                    , p_nmbre_cnslta    => :P908_NMBRE_CNSLTA);',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(87111401206142401)
,p_process_success_message=>'Consulta General Copiada exitosamente !!!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(87170766847701702)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar Ventana Modal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
