prompt --application/pages/page_00017
begin
wwv_flow_api.create_page(
 p_id=>17
,p_user_interface_id=>wwv_flow_api.id(323679016569283847)
,p_name=>'Instanciar Flujos'
,p_page_mode=>'MODAL'
,p_step_title=>'Instanciar Flujos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'400'
,p_dialog_width=>'40%'
,p_last_updated_by=>'HMARTINEZ'
,p_last_upd_yyyymmddhh24miss=>'20200608155008'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33554121688715601)
,p_plug_name=>'Datos'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(39299295614898312)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(33554554196715605)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(33554121688715601)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(39351872500898344)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(33554374137715603)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(33554121688715601)
,p_button_name=>'BTN_CREAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(39351872500898344)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear instancia'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(115761933013498304)
,p_branch_name=>'Branch To Function Returning URL'
,p_branch_action=>'begin'||wwv_flow.LF||
'    apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', :F_ID_INSTNCIA_FLJO );'||wwv_flow.LF||
'    apex_util.set_session_state(''F_ID_FLJO_TREA'', :F_ID_FLJO_TREA ); '||wwv_flow.LF||
'    return pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => :F_ID_INSTNCIA_FLJO, p_id_fljo_trea  => :F_ID_FLJO_TREA, p_clear_session => ''S'');'||wwv_flow.LF||
'end;'||wwv_flow.LF||
''||wwv_flow.LF||
'    '
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_FUNCTION_RETURNING_URL'
,p_branch_when_button_id=>wwv_flow_api.id(33554374137715603)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33554288486715602)
,p_name=>'P17_FLUJOS'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(33554121688715601)
,p_prompt=>'Flujos'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion_fljo r,',
'       a.id_fljo v ',
'  from v_wf_d_flujos a',
'  join wf_d_flujos_usuarios b',
'    on b.id_fljo    = a.id_fljo',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and b.id_usrio   = :F_ID_USRIO   ',
'   and a.id_prcso   = nvl(:P17_ID_PRCSO, a.id_prcso)',
'   and a.indcdor_incia_usrio_fnal = ''S''',
'   and b.actvo = ''S'''))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(39351319077898342)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112828439998963001)
,p_name=>'P17_OBSRVCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(33554121688715601)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>500
,p_cHeight=>5
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(39351056969898342)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(115761748931498302)
,p_name=>'P17_ID_PRCSO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(33554121688715601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(33554859910715608)
,p_name=>'al hacer clic en el boton cancelar'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(33554554196715605)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33554978414715609)
,p_event_id=>wwv_flow_api.id(33554859910715608)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(119104598905339004)
,p_name=>unistr('al hacer clic bot\00F3n crear')
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(33554374137715603)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(119104661116339005)
,p_event_id=>wwv_flow_api.id(119104598905339004)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.localStorage.removeItem(''wf_link'');',
'apex.submit(''BTN_CREAR'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(33555006988715610)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'crear instancia'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_instncia_fljo    number;',
'    v_id_fljo_trea        number;',
'    v_mnsje               varchar2(4000);',
'    ',
'begin',
'',
'    /*pkg_wf_flujo.prc_rg_instancias_flujo(p_id_fljo => :P17_FLUJOS, ',
'                                         p_id_usrio => :F_ID_USRIO,',
'                                         p_id_prtcpte => null);*/',
'                                         ',
'    pkg_pl_workflow_1_0.prc_rg_instancias_flujo( p_id_fljo          => :P17_FLUJOS',
'                                               , p_id_usrio         => :F_ID_USRIO',
'                                               , p_id_prtcpte       => :F_ID_USRIO',
'                                               , p_obsrvcion        => :P17_OBSRVCION ',
'                                               , o_id_instncia_fljo => v_id_instncia_fljo ',
'                                               , o_id_fljo_trea     => v_id_fljo_trea',
'                                               , o_mnsje            => v_mnsje);',
'    if v_id_instncia_fljo is null then        ',
'        raise_application_error( -20001 , v_mnsje );            ',
'    end if;',
'    :F_ID_INSTNCIA_FLJO := v_id_instncia_fljo;',
'    :F_ID_FLJO_TREA     := v_id_fljo_trea;',
'end ;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(33554374137715603)
,p_process_success_message=>'Instancia creada de forma exitosa!!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(50801831373296201)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'cerrar dialogo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
