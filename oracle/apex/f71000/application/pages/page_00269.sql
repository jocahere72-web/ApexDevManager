prompt --application/pages/page_00269
begin
wwv_flow_api.create_page(
 p_id=>269
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Actualizaci\00F3n de Actos Acuerdo de Pago')
,p_step_title=>unistr('Actualizaci\00F3n de Actos Acuerdo de Pago')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200429184326'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3002649607605413)
,p_plug_name=>'Actualizar Acto'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3002775665605414)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(3002649607605413)
,p_button_name=>'BTN_ACTUALIZAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Actualizar'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3002847340605415)
,p_name=>'P269_RSPSTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(3002649607605413)
,p_prompt=>'Respuesta'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3002938739605416)
,p_name=>'P269_ID_CNVNIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3002649607605413)
,p_prompt=>'Id Convenio'
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
 p_id=>wwv_flow_api.id(3002523284605412)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta       number := 0;',
'    o_mnsje_rspsta      clob   := '''';    ',
'    p_cdgo_clnte        number := 10;',
'    v_id_cnvnio         number := :P269_ID_CNVNIO; --2078;',
unistr('    p_id_plntlla        number := 113; -- 114 Plantilla de rechazo de solicitid 113; -- PLantilla de Aplicaci\00F3n de Acuerdos de pagos'),
'    v_id_acto           number ;',
'',
'begin',
'    begin ',
'        select id_acto',
'          into v_id_acto',
'          from gf_g_convenios',
'         where id_cnvnio = v_id_cnvnio;',
'    end;',
'    pkg_gf_convenios.prc_gn_reporte_acuerdo_pago(p_cdgo_clnte		=> p_cdgo_clnte,',
'                                                 p_id_cnvnio		=> v_id_cnvnio,',
'                                                 p_id_plntlla		=> p_id_plntlla, --113',
'                                                 p_id_acto			=> v_id_acto, --138392',
'                                                 o_mnsje_rspsta		=> o_mnsje_rspsta,',
'                                                 o_cdgo_rspsta		=> o_cdgo_rspsta);',
'    :P269_RSPSTA    := o_cdgo_rspsta || '' => '' || o_mnsje_rspsta;',
'end;',
''))
,p_process_error_message=>'&P269_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'&P269_RSPSTA.'
);
end;
/
