prompt --application/pages/page_00183
begin
wwv_flow_api.create_page(
 p_id=>183
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Tipo de Declaraci\00F3n a Digitar.')
,p_step_title=>unistr('Tipo de Declaraci\00F3n a Digitar.')
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
'                            message:    pData.o_mnsje_rspsta,',
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
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20201202142405'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(198380359075817448)
,p_plug_name=>unistr('Tipo de Declaraci\00F3n a Digitar.')
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
 p_id=>wwv_flow_api.id(198818682199577242)
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
 p_id=>wwv_flow_api.id(99813244255573255)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(198818682199577242)
,p_button_name=>'BTN_RFRCAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Refrescar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:180:&SESSION.::&DEBUG.:RP:P180_ID_IMPSTO:&P183_ID_IMPSTO.'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99812804387573254)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(198818682199577242)
,p_button_name=>'BTN_RGRSAR_INCIO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar a Inicio'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:182:&SESSION.::&DEBUG.:RP,182::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99007761946004018)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(198380359075817448)
,p_button_name=>'BTN_INCIAR_DGTCION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Iniciar Digitaci\00F3n')
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_icon_css_classes=>'fa-angle-double-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(99007965625004020)
,p_branch_name=>'ir a la 180'
,p_branch_action=>'f?p=&APP_ID.:180:&SESSION.::&DEBUG.:RP:P180_ID_IMPSTO,P180_ID_SUB_IMSPTO,P180_ID_DCLRCN_TPO,P180_VGNCIA,P180_ID_PRDO,P180_ID_DCLRCION_VGNCIA_FRMLRIO:&P183_ID_IMPSTO.,&P183_ID_SUB_IMSPTO.,&P183_ID_DCLRCN_TPO.,&P183_VGNCIA.,&P183_ID_PRDO.,&P183_ID_DCLRCION_VGNCIA_FRMLRIO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(99007761946004018)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99814649937573264)
,p_name=>'P183_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(198380359075817448)
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
 p_id=>wwv_flow_api.id(99815050123573265)
,p_name=>'P183_ID_SUB_IMSPTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(198380359075817448)
,p_prompt=>'<b>Sub - Impuesto</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  nmbre_impsto_sbmpsto,',
'   id_impsto_sbmpsto ',
'from df_i_impuestos_subimpuesto',
'where id_impsto = :P183_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P183_ID_IMPSTO'
,p_ajax_items_to_submit=>'P183_ID_IMPSTO'
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
 p_id=>wwv_flow_api.id(99815443036573265)
,p_name=>'P183_ID_DCLRCN_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(198380359075817448)
,p_prompt=>unistr('<b>Tipo de Declaraci\00F3n</b>')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  dscrpcion,',
'        id_dclrcn_tpo ',
'from    gi_d_declaraciones_tipo',
'where   cdgo_clnte = :F_CDGO_CLNTE',
'and     id_impsto  = :P183_ID_IMPSTO',
'and     actvo = ''S'''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P183_ID_IMPSTO'
,p_ajax_items_to_submit=>'P183_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99815855080573265)
,p_name=>'P183_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(198380359075817448)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99816223139573266)
,p_name=>'P183_VGNCIA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(198380359075817448)
,p_prompt=>'<b>Vigencia</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct(vgncia) dscrpcion_vgncia,vgncia from gi_d_dclrcnes_tpos_vgncias',
'where id_dclrcn_tpo = :P183_id_dclrcn_tpo'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P183_ID_DCLRCN_TPO'
,p_ajax_items_to_submit=>'P183_ID_DCLRCN_TPO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99816648916573266)
,p_name=>'P183_ID_PRDO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(198380359075817448)
,p_prompt=>'<b>Periodo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct(a.dscrpcion),a.id_prdo from df_i_periodos a',
'where a.id_prdo in (',
'select distinct(id_prdo) from gi_d_dclrcnes_tpos_vgncias where id_dclrcn_tpo = :P183_id_dclrcn_tpo and vgncia = :P183_VGNCIA',
')'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P183_ID_DCLRCN_TPO,P183_VGNCIA'
,p_ajax_items_to_submit=>'P183_ID_DCLRCN_TPO,P183_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99817029826573266)
,p_name=>'P183_ID_SJTO_IMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(198380359075817448)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99817405020573266)
,p_name=>'P183_MSTRAR_FRMLRIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(198380359075817448)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(99819266701573275)
,p_name=>'Calculo Vigencia Formulario'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P183_ID_DCLRCN_TPO'
,p_condition_element=>'P183_ID_DCLRCN_TPO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(99819777608573276)
,p_event_id=>wwv_flow_api.id(99819266701573275)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'       ',
'    select  a.id_dclrcion_vgncia_frmlrio',
'    into    :P183_ID_DCLRCION_VGNCIA_FRMLRIO',
'    from    gi_d_dclrcnes_vgncias_frmlr a',
'    join    gi_d_dclrcnes_tpos_vgncias  b   on b.id_dclrcion_tpo_vgncia = a.id_dclrcion_tpo_vgncia',
'    where   b.id_dclrcn_tpo                = :P183_ID_DCLRCN_TPO',
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
,p_attribute_02=>'P183_ID_DCLRCN_TPO'
,p_attribute_03=>'P183_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99818979029573274)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_validarSujetoTributo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_prmtros        varchar2(2000) := ''validaSujetoTributo:''|| :F_CDGO_CLNTE ||'':''|| :P183_ID_DCLRCION_VGNCIA_FRMLRIO ||'':'' || :P183_IDNTFCCION;',
'    v_json           json_object_t;',
'    v_prueba         varchar2(1000);',
'begin',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestion'',',
'                                                                     p_http_method  => ''POST'',',
'                                                                     p_parm_name    => apex_util.string_to_table(''p_accion:p_cdgo_clnte:p_id_dclrcion_vgncia_frmlrio:p_idntfccion''),',
'                                                                     p_parm_value   => apex_util.string_to_table(v_prmtros)));',
'                        ',
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
'            apex_json.write(''o_mnsje_rspsta'', ''<details>'' ||  ',
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
