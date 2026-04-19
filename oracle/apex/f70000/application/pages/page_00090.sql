prompt --application/pages/page_00090
begin
wwv_flow_api.create_page(
 p_id=>90
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Anulaci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Anulaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P90_MOTIVO{',
'  resize:none !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LTORRES'
,p_last_upd_yyyymmddhh24miss=>'20191016114033'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21896351508700301)
,p_plug_name=>unistr('Motivo anulaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21896710960700305)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(21896351508700301)
,p_button_name=>'BTN_GUARDAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'observation'
,p_button_condition_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(21981461768301001)
,p_branch_name=>unistr('Retorna a la pagina gesti\00F3n T\00EDtulo Ejecutivo')
,p_branch_action=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21896439944700302)
,p_name=>'P90_MOTIVO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(21896351508700301)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cHeight=>10
,p_begin_on_new_line=>'N'
,p_read_only_when=>'observation'
,p_read_only_when_type=>'REQUEST_EQUALS_CONDITION'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--xlarge'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21896944789700307)
,p_name=>'P90_TTLO_EJCTVO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(21896351508700301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22028444143543702)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Carga la Observaci\00F3n ')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    select t.obsrvcion',
'    into :P90_MOTIVO',
'    from gi_g_titulos_ejctvo_anldo t',
'    where t.id_ttlo_ejctvo = :P90_TTLO_EJCTVO;',
'    ',
'exception',
'    when no_data_found then',
'        :P90_MOTIVO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P90_TTLO_EJCTVO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21896874110700306)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Anular T\00EDtulo Ejecutivo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(1000);',
'begin',
'',
'    pkg_gi_titulos_ejecutivo.prc_rg_anulacion(p_cdgo_clnte       => :F_CDGO_CLNTE,',
'                                              p_id_usrio         => :F_ID_USRIO,',
'                                              p_id_instncia_fljo => :F_ID_INSTNCIA_FLJO,',
'                                              p_id_fljo_trea     => :F_ID_FLJO_TREA,',
'                                              p_ttlo_ejctvo      => :P90_TTLO_EJCTVO,',
'                                              p_obsrvcion        => :P90_MOTIVO,',
'                                              o_cdgo_rspsta      => v_cdgo_rspsta,',
'                                              o_mnsje_rspsta	 => v_mnsje_rspsta);',
'                                              ',
'                                              ',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20007, v_mnsje_rspsta);',
'    end if;',
'',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(21896710960700305)
,p_process_success_message=>unistr('Se anulo el T\00EDtulo Ejecutivo correctamente.')
);
end;
/
