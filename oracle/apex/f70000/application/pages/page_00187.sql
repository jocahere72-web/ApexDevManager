prompt --application/pages/page_00187
begin
wwv_flow_api.create_page(
 p_id=>187
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Denegar Solicitud de Liquidaci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Denegar Solicitud de Liquidaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20201207164500'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105924755228869320)
,p_plug_name=>unistr('Denegar Solicitud de Liquidaci\00F3n de Rentas')
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
 p_id=>wwv_flow_api.id(100310092395126515)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(105924755228869320)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar / Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100310445501126516)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(105924755228869320)
,p_button_name=>'BTN_DENEGAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Denegar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿Esta seguro que desea rechazar esta solicitud?'', ''BTN_DENEGAR'');'
,p_icon_css_classes=>'fa-remove'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(100313044195126539)
,p_branch_name=>'Ir a Inicio'
,p_branch_action=>'f?p=&APP_ID.:135:&SESSION.::&DEBUG.:RP,136,137::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100310854225126518)
,p_name=>'P187_CSAL_DNGDO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(105924755228869320)
,p_prompt=>'Causal de Denegar'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion     d,',
'       id_csal_rchzo r',
'  from df_i_causales_rechazo',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   --and id_impsto  = :P135_ID_IMPSTO',
'   and id_impsto_sbmpsto = :P135_ID_IMPSTO_SBMPSTO',
'   and indcdor_cnclcion = ''N''',
';'))
,p_lov_display_null=>'YES'
,p_grid_column=>2
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_csal_rchzo',
'  from df_i_causales_rechazo',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   --and id_impsto  = :P135_ID_IMPSTO',
'   and id_impsto_sbmpsto = :P135_ID_IMPSTO_SBMPSTO'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100311288901126522)
,p_name=>'P187_OBSRVCION_DNGDO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(105924755228869320)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>1000
,p_cHeight=>1
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100312040695126533)
,p_name=>'Cerrar Modal'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(100310092395126515)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100312571224126537)
,p_event_id=>wwv_flow_api.id(100312040695126533)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(100311619893126530)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Denegar Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(1000);',
'begin',
'',
'    pkg_gi_rentas.prc_re_solicitud_renta( p_cdgo_clnte          => :F_CDGO_CLNTE',
'                                        , p_id_rnta             => :P136_ID_RNTA',
'                                        , p_id_usrio            => :F_ID_USRIO',
'                                        , p_obsrvcion_rchzo     => :P187_OBSRVCION_DNGDO',
'                                        , p_id_csal_rchzo       => :P187_CSAL_DNGDO',
'                                        , o_cdgo_rspsta         => v_cdgo_rspsta',
'                                        , o_mnsje_rspsta        => v_mnsje_rspsta );',
'   ',
'   if ( v_cdgo_rspsta > 0 ) then',
'       raise_application_error(-20001, ''1. Error en rechazo--> '' ||v_mnsje_rspsta);',
'   end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(100310445501126516)
,p_process_success_message=>unistr('\00A1Solicitud Rechazada Exitosamente!')
);
end;
/
