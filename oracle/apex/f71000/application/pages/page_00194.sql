prompt --application/pages/page_00194
begin
wwv_flow_api.create_page(
 p_id=>194
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Aplicaci\00F3n Modificaci\00F3n Acuerdo de Pago ')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Motivo de Aplicaci\00F3n Acuerdo de Pago ')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20191101165025'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(218839734057674981)
,p_plug_name=>unistr('<b>Aplicaci\00F3n Modificaci\00F3n Acuerdo de Pago </b>')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(109864883329137397)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(218839734057674981)
,p_button_name=>'BTN_APLICAR_CVN_MDFCCION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Aplicar Modificaci\00F3n')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(109866998855137418)
,p_branch_name=>unistr('Ir a P\00E1giina 193')
,p_branch_action=>'f?p=&APP_ID.:193:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(109864883329137397)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109866087574137408)
,p_name=>'P194_ID_PLNTLLA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(218839734057674981)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select  a.dscrpcion,',
'          a.id_plntlla',
'  from gn_d_plantillas a',
'  join gn_d_actos_tipo b on a.id_acto_tpo = b.id_acto_tpo',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and b.cdgo_acto_tpo = :P194_CDGO_ACTO_TPO;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110028796396947201)
,p_name=>'P194_RSPSTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(218839734057674981)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(120619309607139102)
,p_name=>'P194_CDGO_ACTO_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(218839734057674981)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109868187956165610)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Aplicar Modificaci\00F3n de Acuerdo de Pagos')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_cdgo_rspsta  number;',
'',
'begin',
'',
'    prc_apl_mdfccion_acuerdo_pago(p_cdgo_clnte	 =>    :F_CDGO_CLNTE,',
'                                  p_json_cnvnio	 =>    :P187_ID_CNVNIO_MDFCCION,  ',
'                                  p_id_usrio     =>    :F_ID_USRIO,  ',
'                                  p_id_plntlla   =>    :P194_ID_PLNTLLA,  ',
'                                  o_cdgo_rspsta	 =>    v_cdgo_rspsta,  ',
'                                  o_mnsje_rspsta =>    :P194_RSPSTA);                            ',
'                            ',
' end ; '))
,p_process_error_message=>'&P194_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(109864883329137397)
,p_process_success_message=>'&P194_RSPSTA.'
);
end;
/
