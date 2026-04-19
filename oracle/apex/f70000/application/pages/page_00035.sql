prompt --application/pages/page_00035
begin
wwv_flow_api.create_page(
 p_id=>35
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Proceso Liquidaci\00F3n - Preliquidaci\00F3n')
,p_step_title=>unistr('Preliquidaci\00F3n')
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
'  apex.message.clearErrors();',
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
'                ',
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
'        } else {',
'            /*Mensaje de Exito de la UP*/ ',
'            apex.message.showPageSuccess(s.msg);',
'            ',
'            setTimeout(function(){ ',
'                                    accion === "R" ? revertirFlujo() : apex.submit()',
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
,p_last_updated_by=>'HMARTINEZ'
,p_last_upd_yyyymmddhh24miss=>'20210114131413'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(68829801086018461)
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
 p_id=>wwv_flow_api.id(98719441739662018)
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
'    <b>e.</b> Predios por Liquidar.<br/>',
'	<b>f.</b> Predios Liquidados.<br/><br/>',
'    ',
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(166874088380059373)
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
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1 ',
'   from wf_g_instancias_transicion',
'  where id_instncia_fljo   = :F_ID_INSTNCIA_FLJO',
'    and id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'    and id_estdo_trnscion  in ( 1 , 2 )'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(215616695846126358)
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
 p_id=>wwv_flow_api.id(100275264900825068)
,p_plug_name=>'<b>Predios Cargados</b>'
,p_parent_plug_id=>wwv_flow_api.id(215616695846126358)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Predios Cargados'' as label ',
'      , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'   from v_gi_g_cinta_igac',
'  where nmro_orden_igac = ''001''',
'    and id_prcso_crga = :P35_ARCHIVO'))
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
 p_id=>wwv_flow_api.id(115557411690301401)
,p_plug_name=>unistr('Duraci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(215616695846126358)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''HH:MI:SS'' as label',
'     , nvl( regexp_substr((fcha_incio - fcha_fnal), ''[[0-9]{2}:[[0-9]{2}:[[0-9]{2}.[[0-9]{2}'', 1 ,  1 ) , ''0'' ) as value',
unistr('     , ''Duraci\00F3n del proceso'' as value2'),
'  from wf_g_instncs_trnscn_estdtca',
' where id_instncia_trnscion = :P35_ID_INSTNCIA_TRNSCION'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'LABEL'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'VALUE2'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(216158955862460040)
,p_plug_name=>'<b>Registros Cargados</b>'
,p_parent_plug_id=>wwv_flow_api.id(215616695846126358)
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
'  where id_prcso_crga = :P35_ARCHIVO'))
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
 p_id=>wwv_flow_api.id(216158961697460041)
,p_plug_name=>'<b>Predios por Pre-liquidar</b>'
,p_parent_plug_id=>wwv_flow_api.id(215616695846126358)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor3'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Predios por Preliquidar'' as label ',
'      , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'  from v_gi_g_cinta_igac',
' where nmro_orden_igac = ''001''',
'   and id_prcso_crga = :P35_ARCHIVO',
'   and estdo_rgstro = ''C'''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP,36:P36_ID_PRCSO_CRGA:&P35_ARCHIVO.'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(216159253636460043)
,p_plug_name=>'<b>Predios Pre-liquidados</b>'
,p_parent_plug_id=>wwv_flow_api.id(215616695846126358)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor4'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Predios Preliquidados'' as label ',
'     , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'  from v_gi_g_cinta_igac',
' where nmro_orden_igac = ''001''',
'   and id_prcso_crga   = :P35_ARCHIVO',
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
 p_id=>wwv_flow_api.id(216159285077460044)
,p_plug_name=>'<b>Predios Liquidado</b>'
,p_parent_plug_id=>wwv_flow_api.id(215616695846126358)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'badgeListColor5'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ''Predios Liquidados'' as label ',
'       , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'   from v_gi_g_cinta_igac',
'  where nmro_orden_igac = ''001''',
'    and id_prcso_crga   = :P35_ARCHIVO',
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
 p_id=>wwv_flow_api.id(216159405120460045)
,p_plug_name=>'<b>Predios Sin liquidar</b>'
,p_parent_plug_id=>wwv_flow_api.id(215616695846126358)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>60
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'badgeListColor6'
,p_plug_display_column=>4
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select l.label',
'      , to_char( c.value - l.value , ''FM999G999G999G999G999G999G990'') as value',
'   from (',
'          select count(*) as value',
'            from v_gi_g_cinta_igac',
'           where nmro_orden_igac = ''001''',
'             and id_prcso_crga   = :P35_ARCHIVO',
'      ) c',
'   join (',
'          select ''Predios por liquidar'' as label ',
'               , count(*) as value',
'            from v_gi_g_cinta_igac',
'           where nmro_orden_igac = ''001''',
'             and id_prcso_crga = :P35_ARCHIVO',
'             and estdo_rgstro = ''L''',
'      ) l',
'     on 1 = 1'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(164503578202064087)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(166874088380059373)
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
'     where id_prcso_crga   = :P35_ARCHIVO',
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
 p_id=>wwv_flow_api.id(171580783667171391)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(166874088380059373)
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
' where id_prcso_crga   = :P35_ARCHIVO',
'   and nmro_orden_igac = ''001''',
'   and estdo_rgstro    = ''P'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(58434197316264401)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(166874088380059373)
,p_button_name=>'Btn_Actualizar_Matricula'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Actualizar Matricula'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:123:&SESSION.::&DEBUG.:RP,123:P123_IMPSTO,P123_IMPUESTO_SUBIMPUESTO,P123_VGNCIA,P123_PRDO,P123_BRANCH_APP,P123_BRANCH_PAGE:&P35_IMPUESTO.,&P35_IMPUESTO_SUBIMPUESTO.,&P35_VGNCIA.,&P35_PERIODO.,&APP_ID.,&APP_PAGE_ID.'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33601531039724602)
,p_name=>'P35_ARCHIVO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(215616695846126358)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33601675569724603)
,p_name=>'P35_IMPUESTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(215616695846126358)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33601784131724604)
,p_name=>'P35_VGNCIA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(215616695846126358)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33601890468724605)
,p_name=>'P35_PERIODO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(215616695846126358)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33601989859724606)
,p_name=>'P35_IMPUESTO_SUBIMPUESTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(215616695846126358)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(115504668996036901)
,p_name=>'P35_ID_INSTNCIA_TRNSCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(215616695846126358)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(115504728558036902)
,p_computation_sequence=>10
,p_computation_item=>'P35_ID_INSTNCIA_TRNSCION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_instncia_trnscion ',
'  from wf_g_instancias_transicion ',
' where id_instncia_fljo   = :F_ID_INSTNCIA_FLJO',
'   and id_fljo_trea_orgen = :F_ID_FLJO_TREA'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(34066642583952701)
,p_name=>'Al_Dar_Click_Revertir_Preliquidacion'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(171580783667171391)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34066767101952702)
,p_event_id=>wwv_flow_api.id(34066642583952701)
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
 p_id=>wwv_flow_api.id(34183445633613601)
,p_name=>'Al_Dar_Click_Generar_Preliquidacion'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(164503578202064087)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34183544439613602)
,p_event_id=>wwv_flow_api.id(34183445633613601)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'procesoPreliquidacion("G");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(34067086041952705)
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
'        ',
'        apex_json.open_object();',
'        ',
'        if( v_accion = ''G'' ) then',
'            ',
'            --Inicia la Estadistica',
'            insert into wf_g_instncs_trnscn_estdtca ( id_instncia_trnscion , obsrvcion )',
unistr('                 values ( :P35_ID_INSTNCIA_TRNSCION , ''Proceso de Preliquidaci\00F3n'');'),
'   ',
'            --if ( :P35_VGNCIA = to_char(sysdate,''YYYY'') ) then',
'                pkg_gi_liquidacion_predio.prc_ge_preliquidacion( p_id_usrio          => :F_ID_USRIO',
'                                                               , p_cdgo_clnte        => :F_CDGO_CLNTE',
'                                                               , p_id_impsto         => :P35_IMPUESTO',
'                                                               , p_id_impsto_sbmpsto => :P35_IMPUESTO_SUBIMPUESTO',
'                                                               , p_id_prcso_crga     => :P35_ARCHIVO );               ',
'            ',
'            /*else -- para liquidar atipica',
'                pkg_gi_liquidacion_predio_crzl.prc_ge_preliquidacion( p_id_usrio          => :F_ID_USRIO',
'                                                                   , p_cdgo_clnte        => :F_CDGO_CLNTE',
'                                                                   , p_id_impsto         => :P35_IMPUESTO',
'                                                                   , p_id_impsto_sbmpsto => :P35_IMPUESTO_SUBIMPUESTO',
'                                                                   , p_id_prcso_crga     => :P35_ARCHIVO );   ',
'            end if;*/',
'            ',
'            --Borra las Estadistica',
'            delete wf_g_instncs_trnscn_estdtca',
'             where id_instncia_trnscion = :P35_ID_INSTNCIA_TRNSCION;',
'             ',
'            --Finaliza la Estadistica',
'            update wf_g_instncs_trnscn_estdtca',
'               set fcha_fnal            = systimestamp',
'             where id_instncia_trnscion = :P35_ID_INSTNCIA_TRNSCION;',
'           ',
unistr('            apex_json.write(''msg'', ''Se ha Generado la Preliquidaci\00F3n con Exito.''); '),
'        ',
'        elsif( v_accion = ''R'' ) then',
'            --if ( :P35_VGNCIA = to_char(sysdate,''YYYY'') ) then',
'                pkg_gi_liquidacion_predio.prc_rv_preliquidacion( p_id_prcso_crga => :P35_ARCHIVO );',
'            /*else',
'                pkg_gi_liquidacion_predio_crzl.prc_rv_preliquidacion( p_id_prcso_crga => :P35_ARCHIVO );',
'            end if;*/',
'            --Elimina la Estadistica',
'            delete wf_g_instncs_trnscn_estdtca',
'             where id_instncia_trnscion = :P35_ID_INSTNCIA_TRNSCION;',
'             ',
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
,p_process_when_button_id=>wwv_flow_api.id(171580783667171391)
);
end;
/
