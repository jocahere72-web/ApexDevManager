prompt --application/pages/page_00074
begin
wwv_flow_api.create_page(
 p_id=>74
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Preliquidaci\00F3n (Valorizaci\00F3n)')
,p_step_title=>unistr('Preliquidaci\00F3n (Valorizaci\00F3n)')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function revertirFlujo(){',
' var event = new Event(''eventRevertir'');',
' window.dispatchEvent(event);',
'}',
'',
'function procesoPreliquidacion(accion) {',
'  var $waitPopup;',
'    ',
'  apex.server.process(',
'    "Ajax_Preliquidacion",',
'    {',
'      f01: accion',
'    },',
'    {',
'      beforeSend: function() {',
'        /*Inicio el bloqueo de pantalla*/ ',
'        $waitPopup = apex.widget.waitPopup();',
'      },',
'      success: function(s) {',
'        ',
'        //console.log(s);',
'        ',
'        /*Finaliza el bloqueo de pantalla*/ ',
'        $waitPopup.remove();',
'          ',
'        if (s.err) {',
'            /*Mensaje de Error de la UP*/',
'            apex.message.showErrors({',
'                                        type: apex.message.TYPE.ERROR,',
'                                        location: ["page"],',
'                                        message: s.msg.split(":")[1].trim(),',
'                                        unsafe: false ',
'                                    });',
'            ',
'        } else {',
'            /*Mensaje de Exito de la UP*/ ',
'            apex.message.showPageSuccess(s.msg);',
'            ',
'            setTimeout(function(){',
'                                    if (accion === "R") {',
'                                      revertirFlujo();',
'                                    } else {',
'                                      apex.submit();',
'                                    }',
'                                 } , 2000 );',
'        }',
'      },',
'      error: function(e) {',
'          /*Finaliza el bloqueo de pantalla*/ ',
'          $waitPopup.remove();',
'          /*Mensaje de Error del servidor*/',
'          apex.message.showErrors({',
'                                      type: apex.message.TYPE.ERROR,',
'                                      location: ["page"],',
'                                      message: e.responseText,',
'                                      unsafe: false',
'                                  });',
'',
'          console.log("error", e);          ',
'      }',
'    }',
'  );',
'}',
''))
,p_css_file_urls=>'#IMAGE_PREFIX#css/infortributos/utilidades.css'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20191107150803'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(145424059818175525)
,p_plug_name=>'Flujo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'F_ID_INSTNCIA_FLJO'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(175313700471819082)
,p_plug_name=>'Ayuda '
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'<i>',
'    Funcionalidad que permite: <br/><br/>',
unistr('    <b>1.</b> Generar la Preliquidaci\00F3n.<br/><br/>'),
unistr('    <b>2.</b> Revertir la Preliquidaci\00F3n.<br/><br/>'),
unistr('    <b>3.</b> Visualizar las inconsistencias de la Preliquidaci\00F3n.<br/>'),
'    <b>Nota:</b> Click sobre el cuadro (Predios por Preliquidar).<br/><br/>',
unistr('    <b>4.</b> Visualizar la informaci\00F3n de las cr\00EDticas del archivo:<br/>'),
'	<b>a.</b> Registros Cargados.<br />',
'    <b>b.</b> Predios Cargados.<br/>',
'    <b>c.</b> Predios por Preliquidar.<br/>',
'    <b>d.</b> Predios Preliquidados.<br/>',
'	<b>e.</b> Predios Liquidados.<br/>',
'	<b>f.</b> Predios Sin liquidar.<br/>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(243468347112216437)
,p_plug_name=>'Opciones '
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center;">',
'        <b>',
'            <i>Opciones <i class="fa fa-gears" aria-hidden="true"></i>',
'			</i>',
'        </b>',
'    </div>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_plug_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from gi_g_cinta_igac ',
' where id_prcso_crga   = :P35_ARCHIVO',
'   and nmro_orden_igac = ''001''',
'   and estdo_rgstro    = ''L'''))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(292210954578283422)
,p_plug_name=>unistr('Proceso Liquidaci\00F3n - Preliquidaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>100
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(176869523632982132)
,p_plug_name=>'<b>Predios Cargados</b>'
,p_parent_plug_id=>wwv_flow_api.id(292210954578283422)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Predios Cargados'' as label ',
'      , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'   from v_gi_g_cinta_igac',
'  where nmro_orden_igac = ''001''',
'    and id_prcso_crga = :P74_ARCHIVO'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(292753214594617104)
,p_plug_name=>'<b>Registros Cargados</b>'
,p_parent_plug_id=>wwv_flow_api.id(292210954578283422)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_grid_column_css_classes=>'badgeListColor1'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Registros Cargados'' as label ',
'      , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'   from v_gi_g_cinta_igac',
'  where id_prcso_crga = :P74_ARCHIVO'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(292753220429617105)
,p_plug_name=>'<b>Predios por Pre-liquidar</b>'
,p_parent_plug_id=>wwv_flow_api.id(292210954578283422)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor3'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Predios por Preliquidar'' as label ',
'      , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'  from v_gi_g_cinta_igac',
' where nmro_orden_igac = ''001''',
'   and id_prcso_crga = :P74_ARCHIVO',
'   and estdo_rgstro = ''C'''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP,36:P36_ID_PRCSO_CRGA:&P74_ARCHIVO.'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(292753512368617107)
,p_plug_name=>'<b>Predios Pre-liquidados</b>'
,p_parent_plug_id=>wwv_flow_api.id(292210954578283422)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor4'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Predios Preliquidados'' as label ',
'     , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'  from v_gi_g_cinta_igac',
' where nmro_orden_igac = ''001''',
'   and id_prcso_crga   = :P74_ARCHIVO',
'   and estdo_rgstro    in ( ''P'' , ''L'' )'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(292753543809617108)
,p_plug_name=>'<b>Predios Liquidado</b>'
,p_parent_plug_id=>wwv_flow_api.id(292210954578283422)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'badgeListColor5'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ''Predios Liquidados'' as label ',
'       , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'   from v_gi_g_cinta_igac',
'  where nmro_orden_igac = ''001''',
'    and id_prcso_crga   = :P74_ARCHIVO',
'    and estdo_rgstro    = ''L'''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(292753663852617109)
,p_plug_name=>'<b>Predios Sin liquidar</b>'
,p_parent_plug_id=>wwv_flow_api.id(292210954578283422)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>70
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'badgeListColor6'
,p_plug_display_column=>5
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select l.label',
'      , to_char( c.value - l.value , ''FM999G999G999G999G999G999G990'') as value',
'   from (',
'          select count(*) as value',
'            from v_gi_g_cinta_igac',
'           where nmro_orden_igac = ''001''',
'             and id_prcso_crga   = :P74_ARCHIVO',
'      ) c',
'   join (',
'          select ''Predios Por liquidar'' as label ',
'               , count(*) as value',
'            from v_gi_g_cinta_igac',
'           where nmro_orden_igac = ''001''',
'             and id_prcso_crga = :P74_ARCHIVO',
'             and estdo_rgstro = ''L''',
'      ) l',
'     on 1 = 1'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76594961120157072)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(243468347112216437)
,p_button_name=>'Btn_Generar_Preliquidacion'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Generar Preliquidaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmro_crgdo number;',
'    v_nmro_lquddo number;',
'begin',
'',
'    select nvl( sum( case when estdo_rgstro = ''C'' then 1 else 0 end ) , 0 ) as nmro_crgdo',
'         , nvl( sum( case when estdo_rgstro = ''L'' then 1 else 0 end ) , 0 ) as nmro_lquddo',
'      into v_nmro_crgdo',
'         , v_nmro_lquddo',
'      from gi_g_cinta_igac ',
'     where id_prcso_crga   = :P74_ARCHIVO',
'       and nmro_orden_igac = ''001'';',
'       ',
'    if( v_nmro_lquddo > 0 ) then ',
'        return false;',
'    end if;',
'    ',
'    if( v_nmro_crgdo > 0 ) then',
'        return true;',
'    else ',
'        return false;',
'    end if;',
'',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76595273106157074)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(243468347112216437)
,p_button_name=>'Btn_Revertir_Preliquidacion'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Revertir Preliquidaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from gi_g_cinta_igac ',
' where id_prcso_crga   = :P74_ARCHIVO',
'   and nmro_orden_igac = ''001''',
'   and estdo_rgstro    = ''P'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76596540229157080)
,p_name=>'P74_ARCHIVO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(292210954578283422)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76596979647157082)
,p_name=>'P74_IMPUESTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(292210954578283422)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76597322308157083)
,p_name=>'P74_VGNCIA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(292210954578283422)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76597751131157083)
,p_name=>'P74_PERIODO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(292210954578283422)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76598190415157083)
,p_name=>'P74_IMPUESTO_SUBIMPUESTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(292210954578283422)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76603312570158401)
,p_name=>'P74_OBRA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(292210954578283422)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(76602494107157109)
,p_name=>'Al_Dar_Click_Revertir_Preliquidacion'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(76595273106157074)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76602922019157110)
,p_event_id=>wwv_flow_api.id(76602494107157109)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'procesoPreliquidacion("R");',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(76601569889157108)
,p_name=>'Al_Dar_Click_Generar_Preliquidacion'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(76594961120157072)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76602024575157109)
,p_event_id=>wwv_flow_api.id(76601569889157108)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'procesoPreliquidacion("G");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76601187534157104)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Revertir_Preliquidacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    pkg_gi_liquidacion_predio.prc_rv_preliquidacion( p_id_prcso_crga => :P74_ARCHIVO );',
'end;'))
,p_process_error_message=>unistr('Ocurri\00F3 un Error al Revertir la Preliquidaci\00F3n.')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(76595273106157074)
,p_process_when_type=>'NEVER'
,p_process_success_message=>unistr('Se ha Revertido la Preliquidaci\00F3n.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76600316647157104)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_Preliquidacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    pkg_gi_liquidacion_predio.prc_ge_preliquidacion( p_id_usrio          => :F_ID_USRIO',
'                                                   , p_cdgo_clnte        => :F_CDGO_CLNTE',
'                                                   , p_id_impsto         => :P74_IMPUESTO',
'                                                   , p_id_impsto_sbmpsto => :P74_IMPUESTO_SUBIMPUESTO',
'                                                   , p_id_prcso_crga     => :P74_ARCHIVO );',
'end;                                              '))
,p_process_error_message=>unistr('Ocurri\00F3 un Error al Generar la Preliquidaci\00F3n.')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(76594961120157072)
,p_process_when_type=>'NEVER'
,p_process_success_message=>unistr('Se ha Generado la Preliquidaci\00F3n con Exito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76600742599157104)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Ajax_Preliquidacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_accion varchar2(1);',
'begin',
'   ',
'   begin',
'        v_accion := apex_application.g_f01(1);',
'        ',
'        apex_json.initialize_output ( p_http_cache => false );',
'        owa_util.mime_header(''application/json'', false);',
'        htp.p(''cache-control: no-cache'');',
'        htp.p(''pragma: no-cache'');',
'        owa_util.http_header_close;',
'        apex_json.open_object();',
'        ',
'        if( v_accion = ''G'' ) then',
'            pkg_gi_liquidacion_predio.prc_ge_preliquidacion_vlrzcion( p_id_usrio          => :F_ID_USRIO',
'                                                                    , p_cdgo_clnte        => :F_CDGO_CLNTE',
'                                                                    , p_id_impsto         => :P74_IMPUESTO',
'                                                                    , p_id_impsto_sbmpsto => :P74_IMPUESTO_SUBIMPUESTO',
'                                                                    , p_id_prcso_crga     => :P74_ARCHIVO',
'                                                                    , p_id_obra           => :P74_OBRA );   ',
unistr('            apex_json.write(''msg'', ''Se ha Generado la Preliquidaci\00F3n con Exito.''); '),
'        ',
'        elsif( v_accion = ''R'' ) then',
'            pkg_gi_liquidacion_predio.prc_rv_preliquidacion_vlrzcion( p_id_prcso_crga => :P74_ARCHIVO ',
'                                                                    , p_id_obra       => :P74_OBRA );',
unistr('            apex_json.write(''msg'', ''Se ha Revertido la Preliquidaci\00F3n.'');            '),
'        end if;',
'        ',
'        apex_json.close_object();   ',
'    ',
'    exception',
'         when others then',
'              apex_json.write(''err'',true);',
'              apex_json.write(''msg'',apex_escape.html(sqlerrm));',
'              apex_json.close_object();',
'    end;',
'    apex_json.close_all();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(76595273106157074)
);
end;
/
