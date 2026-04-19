prompt --application/pages/page_00918
begin
wwv_flow_api.create_page(
 p_id=>918
,p_user_interface_id=>wwv_flow_api.id(103265655096132800)
,p_name=>unistr('Detalle de p\00E1gina')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Detalle de p\00E1gina')
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<script>',
'function cambiarRestriccionBoton(x)',
'{    ',
'    if($(x).hasClass(''t-Button-restringido'')== false)',
'    {',
'        $(x).removeClass(''t-Button-Norestringido'');',
'        $(x).addClass(''t-Button-restringido'');',
'    }else{',
'       $(x).removeClass(''t-Button-restringido'');',
'       $(x).addClass(''t-Button-Norestringido'');',
'    }',
'    return false;',
'}',
'    ',
'function cambiarRestriccionRegion (x, name){    ',
'    if($(x).is(":checked")) {',
'        $(''#''+name+''-header'').addClass(''t-Region-header-restringida'');',
'        $(''#''+name).addClass(''t-Region-restringida'');',
'    } else {',
'       $(''#''+name+''-header'').removeClass(''t-Region-header-restringida'');',
'       $(''#''+name).removeClass(''t-Region-restringida'');',
'    }',
'}',
'    ',
'</script>'))
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Button-restringido {',
'    border: none;',
'    color: #fafafa;',
'    background-clip: padding-box;',
'    background-color: #ff3b30;',
'    box-shadow: 0 0 0 1px rgba(0, 0, 0, .125) inset;',
'    border-radius: 2px;',
'    text-shadow: none;',
'    ',
'    font-size: 1.2rem;',
'    line-height: 1.6rem;',
'    padding: .8rem 1.2rem;',
'    padding-top: 0.8rem;',
'    padding-right: 1.2rem;',
'    padding-bottom: 0.8rem;',
'    padding-left: 1.2rem;',
'   font-weight: 400;',
'    margin: 1px;',
'  }',
'',
'.t-Button-Norestringido {',
'    border: none;',
'    color: #fafafa;',
'    background-clip: padding-box;',
'    background-color: #4cd964;',
'    box-shadow: 0 0 0 1px rgba(0, 0, 0, .125) inset;',
'    border-radius: 2px;',
'    text-shadow: none;',
'    ',
'    font-size: 1.2rem;',
'    line-height: 1.6rem;',
'    padding: .8rem 1.2rem;',
'    padding-top: 0.8rem;',
'    padding-right: 1.2rem;',
'    padding-bottom: 0.8rem;',
'    padding-left: 1.2rem;',
'   font-weight: 400;',
'    margin: 1px;',
'  }',
'',
'',
'.t-Region-restringida {',
'    display: block;',
'    border: 1px solid #ff3b30;',
'    background-clip: padding-box;',
'    box-shadow: 0 2px 2px rgba(0,0,0,.05);',
'}',
'  .t-Region-header-restringida {',
'    background-color: rgba(255, 137, 137, 0.21);',
'    border-bottom: 1px solid #ff3b30;',
'  }',
'    ',
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20191029150215'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(399068357192632135)
,p_plug_name=>'Regiones / Botones'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_html clob;',
'',
'begin',
'',
'    v_html :=  pkg_sg_autorizacion.fnc_get_html_x_pgna_btn_x_pgna(p_cdgo_clnte          => :F_CDGO_CLNTE, ',
'                                                                  p_id_aplccion_grpo    => :F_ID_APLCCION_GRPO,',
'                                                                  p_id_prfil            => :P918_ID_PRFIL, ',
'                                                                  p_id_aplccion         => :P918_ID_APLCCION, ',
'                                                                  p_id_mnu              => :P918_ID_MNU, ',
'                                                                  p_app_session         => :app_session);',
'',
'    htp.p(v_html);',
'',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(399825879020695424)
,p_plug_name=>'DETALLE_PAGINA'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29922468477317085)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(399826578921695425)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29924237099317086)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103450752316325685)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(399826578921695425)
,p_button_name=>'DELETE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103451106631325687)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(399826578921695425)
,p_button_name=>'Regresar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_image_alt=>'Cancelar / Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103451515588325688)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(399826578921695425)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103446540890325678)
,p_name=>'P918_RESTRICION_PERFIL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(399068357192632135)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103446934838325680)
,p_name=>'P918_BOTONES_SELECCIONADOS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(399068357192632135)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103447394006325681)
,p_name=>'P918_RESPUESTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(399068357192632135)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103448006742325683)
,p_name=>'P918_ID_PRFIL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(399825879020695424)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103448446267325683)
,p_name=>'P918_ID_APLCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(399825879020695424)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103448884096325683)
,p_name=>'P918_ID_MNU'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(399825879020695424)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103449283330325683)
,p_name=>'P918_MBRE_MNU'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(399825879020695424)
,p_prompt=>'Nombre'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mnu ',
'  from sg_g_menu ',
' where id_mnu = :P918_ID_MNU'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103449697077325684)
,p_name=>'P918_NMRO_PGNA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(399825879020695424)
,p_prompt=>unistr('Numero P\00E1gina')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmro_pgna ',
'  from sg_g_menu ',
' where id_mnu = :P918_ID_MNU'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103450030707325684)
,p_name=>'P918_ACTVO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(399825879020695424)
,p_prompt=>unistr('\00BFActivo?')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select actvo ',
'  from sg_g_menu ',
' where id_mnu = :P918_ID_MNU'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(103452758436325699)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(103451106631325687)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103453225165325700)
,p_event_id=>wwv_flow_api.id(103452758436325699)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(103453678385325701)
,p_name=>'AD_RECORRER_RESTRICIONES'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(103451515588325688)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103454164083325701)
,p_event_id=>wwv_flow_api.id(103453678385325701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//recorrerRestricciones();',
'',
'    var regionesSeleccionadas = "";',
'    var botonesSeleccionados = "";',
'    var i;  ',
'    ',
'    var checkRegiones = document.getElementsByName(''checkRegiones'');',
'    var botonesRegion = document.getElementsByName(''botonesRegion'');',
'    ',
'    for (i=0;i<checkRegiones.length;i++){',
'       if ( checkRegiones[i].checked ) {',
'           if (regionesSeleccionadas == "") {',
'               regionesSeleccionadas =  checkRegiones[i].value;',
'           }else{',
'               regionesSeleccionadas =  regionesSeleccionadas+ ":" + checkRegiones[i].value;',
'           }',
'               ',
'       }',
'    }',
'    ',
'    for (i=0;i<botonesRegion.length;i++){',
'           if ($(botonesRegion[i]).hasClass(''t-Button-restringido'')){',
'               ',
'               if (botonesSeleccionados == ""){',
'                   botonesSeleccionados =  botonesRegion[i].id;',
'               }else{',
'                   botonesSeleccionados =  botonesSeleccionados + ":" + botonesRegion[i].id;',
'               }               ',
'           }',
'    }        ',
'     ',
'    // alert("Regiones Seleccionados: " + regionesSeleccionadas );',
'    // alert("Botones Seleccionados: " + botonesSeleccionados );',
'   ',
'        $x(''P918_RESTRICION_PERFIL'').value = regionesSeleccionadas;',
'        $x(''P918_BOTONES_SELECCIONADOS'').value = botonesSeleccionados;',
'        ',
'    apex.submit(''RESTRICION_PERFIL''); ',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(103454511527325702)
,p_name=>'AD_ELIMINAR_MENU'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(103450752316325685)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103455097797325702)
,p_event_id=>wwv_flow_api.id(103454511527325702)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_msj varchar2(1000);',
'',
'begin',
'',
' v_msj := pkg_sg_autorizacion.fnc_eliminar_pagina_perfil (:F_CDGO_CLNTE, :P918_ID_PRFIL, :P918_ID_APLCCION, :P918_ID_MNU);',
'',
':P918_RESPUESTA := v_msj;',
'--:P919_RESPUESTA := v_msj;',
'--:P919_NODO_SELECCIONADO_D := :P918_COD_MENU;',
'',
'end;'))
,p_attribute_02=>'P918_ID_APLCCION,P918_ID_PRFIL,P918_ID_MNU'
,p_attribute_03=>'P918_RESPUESTA'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103455517482325702)
,p_event_id=>wwv_flow_api.id(103454511527325702)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103452349674325699)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103451973638325698)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RESTRICION_PERFIL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_id_aplccion number;',
'',
'begin',
'',
unistr('    -- Buscando codigo de la aplicaci\00F3n'),
'    begin',
'        select id_aplccion ',
'          into v_id_aplccion  ',
'          from v_sg_g_menu ',
'         where id_aplccion_grpo    = :F_ID_APLCCION_GRPO',
'           and cdgo_clnte          = :F_CDGO_CLNTE ',
'           and id_mnu              = :P918_ID_MNU;',
'        ',
'        :P918_RESPUESTA := pkg_sg_autorizacion.fnc_restriciones_perfil (:F_CDGO_CLNTE, :P918_ID_PRFIL ,v_id_aplccion, :P918_ID_MNU, :P918_RESTRICION_PERFIL, :P918_BOTONES_SELECCIONADOS, :APP_USER, SYSTIMESTAMP);',
'    exception',
'        when others then',
unistr('            :P918_RESPUESTA := ''No se encontro la aplicaci\00F3n'';'),
'    end;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RESTRICION_PERFIL'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
