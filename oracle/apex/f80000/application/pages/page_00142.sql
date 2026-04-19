prompt --application/pages/page_00142
begin
wwv_flow_api.create_page(
 p_id=>142
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Nuevo Lote de Impresion de Actos'
,p_page_mode=>'MODAL'
,p_step_title=>'Nuevo Lote de Impresion de Actos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JAGUAS'
,p_last_upd_yyyymmddhh24miss=>'20211001125010'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146797986093898532)
,p_plug_name=>'Datos del lote'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(146798224588898535)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(146797986093898532)
,p_button_name=>'BTN_CREAR_LTE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear Lote'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(146798052753898533)
,p_name=>'P142_CDGO_PRCSO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(146797986093898532)
,p_prompt=>unistr('C\00F3digo del Proceso')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion, cdgo_prcso',
'from gn_d_codigos_proceso',
'where cdgo_prcso in (''GCB'',''MCA'')'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(146798163159898534)
,p_name=>'P142_ID_ACTO_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(146797986093898532)
,p_prompt=>'Tipo de Actos'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion, id_acto_tpo',
'from gn_d_actos_tipo',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and id_prcso = 4'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(146798592316898538)
,p_name=>'P142_OBSRVCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(146797986093898532)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>90
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(146798648545898539)
,p_name=>'P142_ID_LTE_GNRDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(146797986093898532)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(146798706211898540)
,p_validation_name=>'P142_CDGO_PRCSO is NOT NULL'
,p_validation_sequence=>10
,p_validation=>'P142_CDGO_PRCSO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un #LABEL#'
,p_associated_item=>wwv_flow_api.id(146798052753898533)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(146798857759898541)
,p_validation_name=>'P142_ID_ACTO_TPO is NOT NULL'
,p_validation_sequence=>20
,p_validation=>'P142_ID_ACTO_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un #LABEL#'
,p_associated_item=>wwv_flow_api.id(146798163159898534)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(146798975206898542)
,p_validation_name=>'P142_OBSRVCION is NOT NULL'
,p_validation_sequence=>30
,p_validation=>'P142_OBSRVCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo #LABEL# no debe estar vac\00EDo.')
,p_associated_item=>wwv_flow_api.id(146798592316898538)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(146798447744898537)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Crear_lote'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    ',
'    v_cdgo_rspsta number;',
'    v_mnsje_rspsta varchar2(1000);',
'begin',
'    pkg_cb_proceso_juridico.prc_rg_lote_impresion_documentos(p_cdgo_clnte   => :F_CDGO_CLNTE,',
'                                                             p_cdgo_prcso   => :P142_CDGO_PRCSO,',
'                                                             p_id_acto_tpo  => :P142_ID_ACTO_TPO,',
'                                                             p_id_usrio     => :F_ID_USRIO,',
'                                                             p_obsrvcion    => :P142_OBSRVCION,',
'                                                             o_lte_gnrdo    => :P142_ID_LTE_GNRDO,',
'                                                             o_cdgo_rspsta  => v_cdgo_rspsta,',
'                                                             o_mnsje_rspsta => v_mnsje_rspsta);',
'    if v_cdgo_rspsta <> 0 then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(146798224588898535)
);
end;
/
