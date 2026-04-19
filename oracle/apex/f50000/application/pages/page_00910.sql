prompt --application/pages/page_00910
begin
wwv_flow_api.create_page(
 p_id=>910
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Migraci\00F3n M\00F3dulos')
,p_step_title=>unistr('Migraci\00F3n M\00F3dulos')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function setLabel() {',
'    var $popup = apex.widget.waitPopup();',
'    try {',
'        var rs = await apex.server.process(''obtenerParametro'', { pageItems: ''#P910_ID_MDLO'' });',
unistr('        $(''#P910_BSQDA_LABEL'').text(rs.type === ''OK'' ? rs.label : ''Par\00E1metro de B\00FAsqueda'');'),
'    } catch (error) {',
'        console.log(error);',
'    } finally {',
'        $popup.remove();',
'    }',
'}',
'',
'async function validarModulo() {',
'    var $popup = apex.widget.waitPopup();',
'    try {',
'        var rs = await apex.server.process(''validarModulo'', { pageItems: ''#P910_ID_MDLO,#P910_BSQDA'' });',
'        showMessage(rs);',
'        rs.type === ''OK'' ? apex.item(''BTN_PRCSAR'').show() : apex.item(''BTN_PRCSAR'').hide();',
'    } catch (error) {',
'        console.log(error);',
'    } finally {',
'        $popup.remove();',
'    }',
'}',
'',
'function showMessage(obj) {',
'    apex.message.clearErrors();',
'    if (obj.type === ''OK'') {',
'        apex.message.showPageSuccess(obj.msg);',
'    } else {',
'        apex.message.showErrors([',
'            {',
'                type: "error",',
'                location: ["page"],',
'                message: obj.msg,',
'                unsafe: false',
'            }]);',
'    }',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'MCARO'
,p_last_upd_yyyymmddhh24miss=>'20200612145213'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(72097557900408747)
,p_plug_name=>unistr('Migraci\00F3n M\00F3dulos')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74927647243269206)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(72097557900408747)
,p_button_name=>'BTN_PRCSAR'
,p_button_static_id=>'BTN_PRCSAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>3
,p_grid_column=>8
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72097623625408748)
,p_name=>'P910_DB_LINK'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(72097557900408747)
,p_prompt=>'Origen'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select db_link r',
'     , db_link v',
'  from all_db_links',
' where owner = ''PUBLIC'';'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72097759507408749)
,p_name=>'P910_CDGO_CLNTE_O'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(72097557900408747)
,p_prompt=>'Cliente Origen'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_sql varchar2(4000) := ''select 1, 2 from dual where 1 = 2'';',
'begin',
'    if :P910_DB_LINK is not null then',
'        v_sql := ''select cdgo_clnte || '''' - '''' || nmbre_clnte, cdgo_clnte from df_s_clientes@'' || :P910_DB_LINK || '' where actvo = ''''S'''' order by  2'';',
'    end if;',
'    return v_sql; ',
'end;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P910_DB_LINK'
,p_ajax_items_to_submit=>'P910_DB_LINK'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72097848051408750)
,p_name=>'P910_CDGO_CLNTE_D'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(72097557900408747)
,p_prompt=>'Cliente Destino'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_clnte || '' - '' || nmbre_clnte',
'     , cdgo_clnte ',
'  from df_s_clientes ',
' where actvo = ''S''',
'   and :P910_CDGO_CLNTE_O is not null ',
' order by  2'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P910_CDGO_CLNTE_O'
,p_ajax_items_to_submit=>'P910_CDGO_CLNTE_O'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74927111848269201)
,p_name=>'P910_BSQDA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(72097557900408747)
,p_prompt=>unistr('Par\00E1metro de B\00FAsqueda')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74927254624269202)
,p_name=>'P910_ID_MDLO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(72097557900408747)
,p_prompt=>'Modulo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre',
'     , id_mdlo',
'  from mm_d_modulos',
' where actvo = ''S''',
'   and :P910_CDGO_CLNTE_D is not null'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P910_CDGO_CLNTE_D'
,p_ajax_items_to_submit=>'P910_CDGO_CLNTE_D'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(74927397569269203)
,p_name=>'al cambiar el modulo'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P910_ID_MDLO'
,p_condition_element=>'P910_ID_MDLO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74927447869269204)
,p_event_id=>wwv_flow_api.id(74927397569269203)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'setLabel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74929060195269220)
,p_event_id=>wwv_flow_api.id(74927397569269203)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P910_BSQDA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74928588115269215)
,p_event_id=>wwv_flow_api.id(74927397569269203)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(74927647243269206)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74928457951269214)
,p_event_id=>wwv_flow_api.id(74927397569269203)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P910_BSQDA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74928870123269218)
,p_event_id=>wwv_flow_api.id(74927397569269203)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P910_BSQDA'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(74927965042269209)
,p_name=>'al cambiar parametro'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P910_BSQDA'
,p_condition_element=>'P910_BSQDA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74928059263269210)
,p_event_id=>wwv_flow_api.id(74927965042269209)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validarModulo();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74929122597269221)
,p_event_id=>wwv_flow_api.id(74927965042269209)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(74927647243269206)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74929311496269223)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ejecutar migracion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta number;',
'    v_mnsje_rspsta  varchar2(4000);',
'begin',
'    pkg_mm_migracion_modulo.prc_rg_ejecutar_migracion(p_db_link             => :P910_DB_LINK',
'                                                    , p_id_mdlo             => :P910_ID_MDLO',
'                                                    , p_cdgo_clnte_orgen    => :P910_CDGO_CLNTE_O',
'                                                    , p_cdgo_clnte_dstno    => :P910_CDGO_CLNTE_D',
'                                                    , p_bsqda               => :P910_BSQDA',
'                                                    , o_cdgo_rspsta         => v_cdgo_rspsta',
'                                                    , o_mnsje_rspsta        => v_mnsje_rspsta);',
'    if (v_cdgo_rspsta != 0 ) then',
'        apex_error.add_error( p_message             => v_mnsje_rspsta',
'                            , p_display_location    => apex_error.c_inline_in_notification );',
'        rollback;',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('\00A1Proceso de migraci\00F3n realizado de forma exitosa!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74927544279269205)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'obtenerParametro'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_nmbre_prmtro   varchar2(4000); ',
'begin',
'    apex_json.open_object;',
'    begin',
'        select nmbre_prmtro ',
'          into v_nmbre_prmtro',
'          from mm_d_modulos',
'         where id_mdlo = :P910_ID_MDLO;',
'        apex_json.write(''type'', ''OK'');',
'        apex_json.write(''label'', v_nmbre_prmtro);',
'    exception',
'        when others then ',
'            apex_json.write(''type'', ''ERROR'');',
'    end;',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74928171682269211)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validarModulo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta   number;',
'    v_mnsje_rspsta  varchar2(4000) ;',
'',
'begin',
'',
'    pkg_mm_migracion_modulo.prc_vl_existe_modulo(p_db_link          => :P910_DB_LINK',
'                                               , p_id_mdlo          => :P910_ID_MDLO',
'                                               , p_cdgo_clnte_orgen => :P910_CDGO_CLNTE_O',
'                                               , p_cdgo_clnte_dstno => :P910_CDGO_CLNTE_D',
'                                               , p_bsqda            => :P910_BSQDA',
'                                               , o_cdgo_rspsta      => v_cdgo_rspsta',
'                                               , o_mnsje_rspsta     => v_mnsje_rspsta );',
'',
'    apex_json.open_object;',
'    apex_json.write(''type'', case when v_cdgo_rspsta = 0  then ''OK'' else ''ERROR'' end);',
'    apex_json.write(''msg'' , v_mnsje_rspsta);',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
