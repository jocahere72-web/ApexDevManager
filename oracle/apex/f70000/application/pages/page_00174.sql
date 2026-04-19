prompt --application/pages/page_00174
begin
wwv_flow_api.create_page(
 p_id=>174
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Observaci\00F3n de la Solicitud de Productos ')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Observaci\00F3n de la Solicitud de Productos ')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066978207707637)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'270'
,p_dialog_width=>'40%'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20201214132124'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96503476624541701)
,p_plug_name=>unistr('Descripci\00F3n de la Solicitud')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100344510499774281)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(96503476624541701)
,p_button_name=>'Btn_aprobar_solicitud'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aprobar Solicitud'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P174_CDGO_ESTDO'
,p_button_condition2=>'APR'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-check-circle-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(96509849555552482)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(96503476624541701)
,p_button_name=>'Btn_rechazar_solicitud'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Rechazar Solicitud'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P174_CDGO_ESTDO'
,p_button_condition2=>'RCH'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(96503720300541704)
,p_branch_name=>unistr('Ir a P\00E1gina 172')
,p_branch_action=>'f?p=70000:172:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'Btn_rechazar_solicitud,Btn_aprobar_solicitud'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96503584547541702)
,p_name=>'P174_ID_RNTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(96503476624541701)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96503606367541703)
,p_name=>'P174_OBSERVCION'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(96503476624541701)
,p_prompt=>unistr('Observaci\00F3n ')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>50
,p_cMaxlength=>1000
,p_cHeight=>7
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100338912710756401)
,p_name=>'P174_CDGO_ESTDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(96503476624541701)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(96794548840069225)
,p_name=>'Rechazo de la Solicitud'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(96509849555552482)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(96794635465069226)
,p_event_id=>wwv_flow_api.id(96794548840069225)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de Rechazar la solicitud?", function( okPressed ) { '),
'    if( okPressed ) {',
'        apex.submit(''Btn_rechazar_solicitud'');',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100339175487756403)
,p_name=>'Aprobar_Solicitud'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(100344510499774281)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100339228364756404)
,p_event_id=>wwv_flow_api.id(100339175487756403)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de Aprobar la solicitud?", function( okPressed ) { '),
'    if( okPressed ) {',
'        apex.submit(''Btn_aprobar_solicitud'');',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(96503169320538775)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Rechazo de la Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_cdgo_rspsta number;',
'    v_mnsje_rspsta  varchar2(4000);',
'begin',
'    pkg_gi_productos.prc_re_solicitud_producto (  p_cdgo_clnte        => :F_CDGO_CLNTE',
'                                                , p_id_rnta           => :P174_ID_RNTA',
'                                                , p_id_usrio          => :F_ID_USRIO',
'                                                , p_obsrvcion_rchzo   => :P174_OBSERVCION',
'                                                , o_cdgo_rspsta       => v_cdgo_rspsta',
'                                                , o_mnsje_rspsta      => v_mnsje_rspsta);',
'     if v_cdgo_rspsta <> 0 then',
'         raise_application_error(-20000, v_mnsje_rspsta);',
'     end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Btn_rechazar_solicitud'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(100347052909817914)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aprobar Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_dcmnto        number;',
'    v_nmro_dcmnto      number;',
'    v_vlor_ttal        number;',
'    v_cdgo_rspsta      number;',
'    v_mnsje_rspsta     varchar2(4000);',
'    ',
'begin',
'',
'    -- Consultamos el total del pedido    ',
'    select sum(vlor_ttal)',
'      into v_vlor_ttal',
'      from gi_g_rentas_producto',
'     where id_rnta = :P168_ID_RNTA;',
'     ',
'     ',
'     -- Actualizamos en la tabla de rentas',
'     update gi_g_rentas',
'        set vlor_bse_grvble = v_vlor_ttal',
'      where id_rnta         = :P168_ID_RNTA;',
'      ',
'    pkg_gi_productos.prc_ap_solicitud_producto (  p_cdgo_clnte          	    => :F_CDGO_CLNTE',
'                                                , p_id_rnta                         => :P174_ID_RNTA',
'                                                , p_id_usrio                        => :F_ID_USRIO',
'                                                , p_obsrvcion                       => :P174_OBSERVCION                                                ',
'                                                , o_id_dcmnto           	    => v_id_dcmnto',
'                                                , o_nmro_dcmnto         	    => v_nmro_dcmnto',
'                                                , o_cdgo_rspsta         	    => v_cdgo_rspsta',
'                                                , o_mnsje_rspsta        	    => v_mnsje_rspsta);',
'                                                ',
'                                                ',
'    if v_cdgo_rspsta <> 0 then',
'        raise_application_error(-20000, v_mnsje_rspsta);',
'    end if;',
'exception',
'        when others then',
'                raise_application_error(-20000, ''Ocurrio un error inesperado: '' || sqlerrm);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Btn_aprobar_solicitud'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
