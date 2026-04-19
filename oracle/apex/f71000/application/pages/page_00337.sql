prompt --application/pages/page_00337
begin
wwv_flow_api.create_page(
 p_id=>337
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Actualizaci\00F3n de fecha de Recaudo')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Actualizaci\00F3n de fecha de Recaudo')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const cambiarFecha = async function() {',
'        await apex.server.process(',
'                "Actualizar_fecha_recaudo",',
'                {    ',
'                    pageItems: ''#P337_ID_RCDO_LTE_CNCLCION,#P337_ID_RCDO,#P337_FCHA_RCDO,#P337_ID_USRIO''',
'                },',
'                {',
'                    //dataType: ''text'',',
'                    success: function( resp ){            ',
'                        if (resp.o_cdgo_rspsta > 0){ ',
'                            apex.message.clearErrors();',
'                            apex.message.showErrors([',
'                                {',
'                                    type: "error",',
'                                    location: "page",',
'                                    message: ''No ha sido posible actualizar la fecha del recaudo'',',
'                                    unsafe: false',
'                                }',
'                            ]);',
'',
'                        }else{',
'                            apex.message.showPageSuccess("La fecha del recaudo ha sido actualizada!");',
'                            //window.localStorage.removeItem(''wf_link'')',
'                            //apex.submit();',
'                        }',
'                    }',
'                }',
'            );',
'}'))
,p_step_template=>wwv_flow_api.id(177318053164050589)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'auto'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20210204182323'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7818203412684540)
,p_plug_name=>unistr('<b>Actualicaci\00F3n de fecha de recaudo</b>')
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
 p_id=>wwv_flow_api.id(7818672720684544)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(7818203412684540)
,p_button_name=>'BTN_ACTUALIZAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Actualizar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3748089207474312)
,p_name=>'P337_ID_USRIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(7818203412684540)
,p_item_default=>'F_ID_USRIO'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7818397617684541)
,p_name=>'P337_FCHA_RCDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(7818203412684540)
,p_prompt=>'<b>Fecha de Recaudo</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7818441463684542)
,p_name=>'P337_ID_RCDO_LTE_CNCLCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(7818203412684540)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7818586099684543)
,p_name=>'P337_ID_RCDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(7818203412684540)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3748331511474315)
,p_name=>'Al dar click en BTN_ACTUALIZAR'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(7818672720684544)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3748431605474316)
,p_event_id=>wwv_flow_api.id(3748331511474315)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'cambiarFecha();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7819040767684548)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar_fecha_recaudo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     o_cdgo_rspsta    number;',
'     o_mnsje_rspsta   varchar2(2000);',
'     e_no_fecha       exception;',
'begin',
'',
'    if :P337_FCHA_RCDO is not null then',
'        pkg_re_recaudos_conciliacion.prc_ac_fechas_recaudos_cnclcn(p_id_rcdo_lte_cnclcion    => :P337_ID_RCDO_LTE_CNCLCION',
'                                                                 , p_id_rcdo                 => :P337_ID_RCDO',
'                                                                 , p_fcha_rcdo               => :P337_FCHA_RCDO',
'                                                                 , p_id_usrio                => :P337_ID_USRIO',
'                                                                 , o_cdgo_rspsta             => o_cdgo_rspsta',
'                                                                 , o_mnsje_rspsta            => o_mnsje_rspsta);',
'',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'        apex_json.close_all();',
'    else',
'        raise e_no_fecha;',
'    end if;',
'',
'exception',
'    when e_no_fecha then',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'', 80);',
'        apex_json.write(''o_mnsje_rspsta'', ''No ha especificado una fecha de recaudo.'');',
'        apex_json.close_all();',
'    when others then',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'', 99);',
'        apex_json.write(''o_mnsje_rspsta'', ''Error al intentar cambiar la fecha del recaudo'');',
'        apex_json.close_all();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
