prompt --application/pages/page_00180
begin
wwv_flow_api.create_page(
 p_id=>180
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Digitar Declaraciones'
,p_step_title=>'Digitar Declaraciones'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function validarSujetoTributo(){',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        await apex.server.process ( "ajax_validarSujetoTributo", {',
'            pageItems: "#P180_ID_DCLRCION_VGNCIA_FRMLRIO,#P180_IDNTFCCION"',
'        }, {',
'            success: function( pData ){',
'                console.log(pData);',
'                if (pData.o_cdgo_rspsta != 0){',
'                    console.log(pData.o_cdgo_rspsta);',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors ([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    pData.o_cdgo_rspsta + pData.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                }else{',
'                    apex.item( "P180_ID_SJTO_IMPSTO" ).setValue( pData.o_mnsje_rspsta );',
'                    apex.item( "P180_MSTRAR_FRMLRIO" ).setValue( "S" );',
'                    apex.submit();',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'};'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HMARTINEZ'
,p_last_upd_yyyymmddhh24miss=>'20230711083624'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98568005261244210)
,p_plug_name=>unistr('Formulario de Declaraci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.FORMULARIO_DECLARACION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P180_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P180_IDNTFCCION is not null and :P180_MSTRAR_FRMLRIO = ''S'''
,p_attribute_01=>'P180_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_attribute_02=>'P180_ID_DCLRCION'
,p_attribute_03=>'Y'
,p_attribute_04=>'Y'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_07=>'Y'
,p_attribute_08=>'P180_ID_SJTO_IMPSTO'
,p_attribute_09=>'P180_IDNTFCCION'
,p_attribute_10=>'f?p=&APP_ID.:181:&SESSION.::&DEBUG.:RP,181:P181_ID_DCLRCION:&P180_ID_DCLRCION.'
,p_attribute_11=>'declaraciones/gestion'
,p_attribute_13=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98568127794244211)
,p_plug_name=>'Encabezado Formulario'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98568857406244218)
,p_plug_name=>unistr('B\00FAsqueda Sujeto Tributo')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99006450918004005)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99006544808004006)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(99006450918004005)
,p_button_name=>'BTN_RFRCAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Refrescar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:180:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99007648730004017)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(99006450918004005)
,p_button_name=>'BTN_RGRSAR_INCIO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Volver a Digitar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:183:&SESSION.::&DEBUG.:RP,183::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(98569029179244220)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(98568857406244218)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98568249046244212)
,p_name=>'P180_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(98568127794244211)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98568347262244213)
,p_name=>'P180_VGNCIA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(98568127794244211)
,p_prompt=>'<b>Vigencia</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct(vgncia) dscrpcion_vgncia,vgncia from gi_d_dclrcnes_tpos_vgncias',
'where id_dclrcn_tpo = :P180_id_dclrcn_tpo'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P180_ID_DCLRCN_TPO'
,p_ajax_items_to_submit=>'P180_ID_DCLRCN_TPO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98568414030244214)
,p_name=>'P180_ID_PRDO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(98568127794244211)
,p_prompt=>'<b>Periodo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct(a.dscrpcion),a.id_prdo from df_i_periodos a',
'where a.id_prdo in (',
'select distinct(id_prdo) from gi_d_dclrcnes_tpos_vgncias where id_dclrcn_tpo = :P180_id_dclrcn_tpo and vgncia = :P180_VGNCIA',
')'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P180_VGNCIA'
,p_ajax_items_to_submit=>'P180_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98568585573244215)
,p_name=>'P180_ID_SJTO_IMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(98568127794244211)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98568679535244216)
,p_name=>'P180_MSTRAR_FRMLRIO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(98568127794244211)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98568793111244217)
,p_name=>'P180_ID_DCLRCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(98568005261244210)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98568902465244219)
,p_name=>'P180_IDNTFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(98568857406244218)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98569585905244225)
,p_name=>'P180_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(98568127794244211)
,p_prompt=>'<b>Impuesto</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98569643306244226)
,p_name=>'P180_ID_SUB_IMSPTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(98568127794244211)
,p_prompt=>'<b>Sub - Impuesto</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  nmbre_impsto_sbmpsto,',
'   id_impsto_sbmpsto ',
'from df_i_impuestos_subimpuesto',
'where id_impsto = :P180_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P180_ID_IMPSTO'
,p_ajax_items_to_submit=>'P180_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98569847237244228)
,p_name=>'P180_ID_DCLRCN_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(98568127794244211)
,p_prompt=>unistr('<b>Tipo de Declaraci\00F3n</b>')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  dscrpcion,',
'        id_dclrcn_tpo ',
'from    gi_d_declaraciones_tipo',
'where   cdgo_clnte            = :F_CDGO_CLNTE',
'and     id_impsto             = :P180_ID_IMPSTO',
'and     indcdor_prsntcion_web = ''S''',
'and     actvo                 = ''S'''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P180_ID_IMPSTO'
,p_ajax_items_to_submit=>'P180_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(98569195524244221)
,p_name=>'Clic BTN_CNSLTAR'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(98569029179244220)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(98569298493244222)
,p_event_id=>wwv_flow_api.id(98569195524244221)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de haber digitado bien la identificaci\00F3n?", function( okPressed ) {'),
'        if( okPressed ) {',
'            validarSujetoTributo();',
'        }',
'    });'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(99006289446004003)
,p_name=>'Calculo Vigencia Formulario'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P180_ID_DCLRCN_TPO,P180_ID_PRDO,P180_VGNCIA'
,p_condition_element=>'P180_ID_PRDO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(99006302197004004)
,p_event_id=>wwv_flow_api.id(99006289446004003)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'       ',
'    select  a.id_dclrcion_vgncia_frmlrio',
'    into    :P180_ID_DCLRCION_VGNCIA_FRMLRIO',
'    from    gi_d_dclrcnes_vgncias_frmlr a',
'    join    gi_d_dclrcnes_tpos_vgncias  b   on b.id_dclrcion_tpo_vgncia = a.id_dclrcion_tpo_vgncia',
'    where   b.id_dclrcn_tpo                    = :P180_ID_DCLRCN_TPO',
'    and     b.vgncia                          = :P180_VGNCIA',
'    and     b.id_prdo                         = :P180_ID_PRDO',
'    and     a.actvo = ''S''; ',
'    ',
'exception',
'  when others then ',
'  null;',
'end;    ',
'',
'',
'',
'',
''))
,p_attribute_02=>'P180_ID_DCLRCN_TPO,P180_VGNCIA,P180_ID_PRDO'
,p_attribute_03=>'P180_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(99008022209004021)
,p_name=>'Nuevo'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(99006544808004006)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(99008140202004022)
,p_event_id=>wwv_flow_api.id(99008022209004021)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(98568857406244218)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(99008239623004023)
,p_event_id=>wwv_flow_api.id(99008022209004021)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(98568005261244210)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98569484707244224)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_validarSujetoTributo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_prmtros        varchar2(2000) := ''validaSujetoTributo:''|| :F_CDGO_CLNTE ||'':''|| :P180_ID_DCLRCION_VGNCIA_FRMLRIO ||'':'' || :P180_IDNTFCCION;',
'    v_json           json_object_t;',
'    v_prueba         varchar2(1000);',
'    v_prueba1         number;',
'begin',
'    v_prueba1:= 1;',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'     v_prueba1:= 2;',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'     v_prueba1:= 3;',
'     v_prueba:=      v_prmtros;',
'     ',
'     insert into muerto (v_001) values (''p_url -> '' || :F_DRCCION_SRVDOR_PBLCO || ''declaraciones/gestion'');',
'      commit;',
'      ',
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PBLCO || ''declaraciones/gestion'',',
'                                                                     p_http_method  => ''POST'',',
'                                                                     p_parm_name    => apex_util.string_to_table(''p_accion:p_cdgo_clnte:p_id_dclrcion_vgncia_frmlrio:p_idntfccion''),',
'                                                                     p_parm_value   => apex_util.string_to_table(v_prmtros)));',
'                                                                     ',
'      ',
'      ',
'      ',
'      v_prueba1:= 4;                   ',
'    apex_json.open_object;',
'    --apex_json.write(''o_cdgo_rspsta'', v_json.get(''o_cdgo_rspsta'').to_string);',
'    --apex_json.write(''o_mnsje_rspsta'', v_json.get(''o_mnsje_rspsta'').to_string);',
'    apex_json.write(''o_cdgo_rspsta'', v_json.get_string (''o_cdgo_rspsta''));',
'    apex_json.write(''o_mnsje_rspsta'', v_json.get_string (''o_mnsje_rspsta''));',
'    apex_json.close_object;',
'                                                                     ',
'    exception',
'        when others then',
'            apex_json.open_object;',
'            apex_json.write(''o_cdgo_rspsta'', 100);',
'            apex_json.write(''o_mnsje_rspsta'', v_prueba1||'' '' ||v_prmtros||'' <details>'' ||  ',
unistr('													''<summary>'' || ''No fue posible validar la identificaci\00F3n del declarante, '' ||'),
'													''por favor intente nuevamente.</summary>'' ||',
'													''<p>'' || ''El servicio no pudo ser gestionado.'' || ''</p>'' ||',
'											  ''</details>'' || sqlerrm);',
'            apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
