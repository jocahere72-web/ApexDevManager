prompt --application/pages/page_00212
begin
wwv_flow_api.create_page(
 p_id=>212
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Generar Acto de Reversi\00F3n')
,p_step_title=>unistr('Generar Acto de Reversi\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function irFlujo(id_instancia){',
'    apex.server.process("IniciarFlujo", {f01: id_instancia}).then(function(data){',
'        if (data.type === ''OK'') {',
'            window.localStorage.clear();',
'            window.location.href = data.url;',
'        }else{',
'            apex.message.showErrors({',
'                type: apex.message.TYPE.ERROR,',
'                location: ["page"],',
'                message: data.msg,',
'                unsafe: false',
'            });',
'        }',
'    }); ',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P212_DCMNTO_DISPLAY{',
'    width: 99% !important;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_upd_yyyymmddhh24miss=>'20230911095352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(223942192152240376)
,p_plug_name=>'Documento Revocatoria Acuerdo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(399214863156949269)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(399417556369706109)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i></b>',
'</h5>',
'<i>Funcionalidad que Permite</i><br><br>',
unistr('<i><b>1.</b> Visualizar y editar plantilla de acto de reversi\00F3n de acuerdo de pago</i><br><br>'),
unistr('<i><b>2.</b> Generar acto de reversi\00F3n de acuerdo de pago</i><br><br>'),
unistr('<p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(49251923152826901)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(399214863156949269)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:268:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(116735818906207687)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(399214863156949269)
,p_button_name=>'BTN_REVERSAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Aplicar Reversi\00F3n')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P212_CDGO_RVRSION_ESTDO = ''RGS'' and :P212_ID_ACTO is null and :P212_ID_CNVNIO_DCMNTO is not null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(33821598321607106)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(399214863156949269)
,p_button_name=>'BTN_RCHZO'
,p_button_static_id=>'BTN_RCHZO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Rechazo Reversi\00F3n')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P212_CDGO_RVRSION_ESTDO = ''RCH'' and :P212_ID_ACTO is null and',
':P212_ID_CNVNIO_DCMNTO is not null'))
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(116735475226207687)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(399214863156949269)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P212_ID_CNVNIO_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(116734661074207686)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(399214863156949269)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>':P212_ID_CNVNIO_DCMNTO IS NOT NULL and :P212_ID_ACTO is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(116736272157207687)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(399214863156949269)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>':P212_ID_CNVNIO_DCMNTO IS NOT NULL and :P212_ID_ACTO is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(116730344756205975)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(223942192152240376)
,p_button_name=>'BTN_GNRAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Documento'
,p_button_position=>'BODY'
,p_button_condition=>'P212_ID_ACTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33821363677607104)
,p_name=>'P212_PGNA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(223942192152240376)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(34861344146956701)
,p_name=>'P212_MTVO_RCHZO_RVRSION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(223942192152240376)
,p_item_default=>'Cuotas Absolutamente Pagas.'
,p_prompt=>'Motivo Rechazo'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cHeight=>3
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_display_when=>':P212_CDGO_RVRSION_ESTDO = ''RCH'' and :P212_ID_ACTO is null'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_read_only_when=>'P212_ID_CNVNIO_DCMNTO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(34861564845956703)
,p_name=>'P212_ID_CNVNIO_RVRSION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(223942192152240376)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56997763163290701)
,p_name=>'P212_ID_INSTNCIA_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(223942192152240376)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(116730727108205975)
,p_name=>'P212_ID_PLNTLLA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(223942192152240376)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion d, ',
'       a.id_plntlla r',
'from gn_d_plantillas a',
'join gn_d_actos_tipo_tarea b on a.id_acto_tpo     = b.id_acto_tpo ',
'                            and b.id_fljo_trea    = :F_ID_FLJO_TREA',
'where a.cdgo_clnte     = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_colspan=>9
,p_display_when=>'P212_ID_ACTO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_read_only_when=>'P212_ID_ACTO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(116731160922205979)
,p_name=>'P212_DCMNTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(223942192152240376)
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (opt) {',
'    opt.skin = ''office2013,skins/office2013/'';',
'    opt.width = ''100%'';',
'    opt.height = 400;',
'    opt.resize_enabled = false; ',
'    opt.enterMode = 2;	opt.removePlugins = ''contextmenu,liststyle,tabletools'';	return opt;',
'}'))
,p_attribute_03=>'Y'
,p_attribute_04=>'kama'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(116731507065205980)
,p_name=>'P212_ID_CNVNIO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(223942192152240376)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(116731918321205980)
,p_name=>'P212_RSPSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(223942192152240376)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(116732388106205980)
,p_name=>'P212_ID_ACTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(223942192152240376)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(116732718421205981)
,p_name=>'P212_ID_RPRTE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(223942192152240376)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(116733126242205981)
,p_name=>'P212_RSPSTA_DCMNTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(223942192152240376)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(116733522290205981)
,p_name=>'P212_ID_CNVNIO_DCMNTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(223942192152240376)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_cnvnio_dcmnto',
'  from gf_g_convenios_documentos a',
'  where a.cdgo_clnte        = :F_CDGO_CLNTE',
'    and a.id_cnvnio         = :P212_ID_CNVNIO',
'    and a.id_plntlla        = :P212_ID_PLNTLLA',
'    and a.id_plntlla       is not null'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(116733955122205982)
,p_name=>'P212_CDGO_RVRSION_ESTDO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(223942192152240376)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(56997889772290702)
,p_computation_sequence=>10
,p_computation_item=>'P212_ID_INSTNCIA_FLJO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'F_ID_INSTNCIA_FLJO'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(116679772761801410)
,p_computation_sequence=>10
,p_computation_item=>'P212_ID_RPRTE'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_rprte ',
'  from gn_d_plantillas a',
'  join gn_d_reportes b',
'    on a.id_rprte = b.id_rprte',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_plntlla = :P212_ID_PLNTLLA'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(116743279069253546)
,p_validation_name=>'Plantilla No Nula'
,p_validation_sequence=>10
,p_validation=>'P212_ID_PLNTLLA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione la Plantilla Correspondiente!'
,p_always_execute=>'Y'
,p_validation_condition=>'BTN_GNRAR,CREATE,SAVE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(116743567004254501)
,p_validation_name=>'Documento No Nulo'
,p_validation_sequence=>20
,p_validation=>'P212_DCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('\00A1El documento no puede estar vac\00EDo!')
,p_validation_condition=>'BTN_REVERSAR,CREATE,SAVE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4063805498304001)
,p_name=>'Borrar Ruta'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(116735818906207687)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4063959345304002)
,p_event_id=>wwv_flow_api.id(4063805498304001)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.localStorage.removeItem(''wf_link'');',
'apex.submit(''BTN_REVERSAR'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(34861628016956704)
,p_name=>'Borrar Ruta '
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(33821598321607106)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34861703960956705)
,p_event_id=>wwv_flow_api.id(34861628016956704)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.localStorage.removeItem(''wf_link'');',
'apex.submit(''BTN_RCHZO'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(56991017388190401)
,p_name=>'Regresar Flujo'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(49251923152826901)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(56991114963190402)
,p_event_id=>wwv_flow_api.id(56991017388190401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'irFlujo($v(''P212_ID_INSTNCIA_FLJO''));'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(116741844092233992)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Generar Documento Reversi\00F3n Acuerdo de Pago')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin    ',
'    :P212_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''<COD_CLNTE>''|| :F_CDGO_CLNTE ||''</COD_CLNTE><MTVO_RCHZO>''||:P212_MTVO_RCHZO_RVRSION ||''</MTVO_RCHZO><ID_CNVNIO>''||:P212_ID_CNVNIO||''</ID_CNVNIO>'', :P212_ID_PLNTLLA);',
'exception',
'   when others then',
unistr('   RAISE_APPLICATION_ERROR(-20000, ''Seleccione la plantilla de aplicaci\00F3n'');    '),
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(116730344756205975)
,p_process_when=>'P212_ID_PLNTLLA'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>unistr('\00A1Documento Generado Satisfactoriamente!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(116743753174255667)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Gestionar Documento Reversi\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    ',
'begin',
'               ',
'    pkg_gf_convenios.prc_rg_documento_acuerdo_pago (p_cdgo_clnte    =>	:F_CDGO_CLNTE,',
'                                                    p_id_cnvnio     =>	:P212_ID_CNVNIO,',
'                                                    p_id_plntlla    =>	:P212_ID_PLNTLLA,',
'                                                    p_dcmnto        =>	:P212_DCMNTO,',
'                                                    p_request       =>	:REQUEST,',
'                                                    p_id_usrio		=>	:F_ID_USRIO,',
'                                                    o_cdgo_rspsta	=>	v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta	=>	:P212_RSPSTA_DCMNTO);',
'',
'    if v_cdgo_rspsta <> 0 then',
unistr('        :P212_RSPSTA_DCMNTO := ''Error en la generaci\00F3n del Documento!'';'),
'    end if;                                  ',
'    ',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('\00A1Petici\00F3n Procesada!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(116744082713257922)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Aplicar Reversi\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_cdgo_rspsta    number;',
'',
'begin',
'',
'    pkg_gf_convenios.prc_ap_reversion_acuerdo_pago ( p_cdgo_clnte           =>		:F_CDGO_CLNTE,',
'                                                    p_id_cnvnio         	=>		:P212_ID_CNVNIO,',
'                                                    p_id_usrio          	=>		:F_ID_USRIO,',
'                                                    p_id_plntlla        	=>		:P212_ID_PLNTLLA,',
'                                                    o_id_acto           	=>		:P212_ID_ACTO,',
'                                                    o_cdgo_rspsta       	=>		v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta      	=>		:P212_RSPSTA); ',
'                                                ',
'          if v_cdgo_rspsta = 0 then',
unistr('              :P212_RSPSTA := ''\00A1Aplicaci\00F3n de Reversi\00F3n Realizada Satisfactoriamente!'';'),
'          end if;',
'          ',
'    apex_util.set_session_state(''F_ID_FLJO_TREA'','''');',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(116735818906207687)
,p_process_success_message=>'&P212_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(116744384895258860)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Edittor'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P212_DCMNTO,P212_ID_CNVNIO_DCMNTO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(116736272157207687)
,p_process_when=>':REQUEST = ''DELETE'' or :P212_ID_PLNTLLA is null'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(34697858633851340)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Rechazar Reversi\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_cdgo_rspsta    number;    ',
'begin',
'     pkg_gf_convenios.prc_re_reversion_acrdo_pgo(p_cdgo_clnte             =>    :F_CDGO_CLNTE,',
'                                                 p_id_cnvnio              =>    :P212_ID_CNVNIO,',
'                                                 p_mtvo_rchzo_rvrsion     =>    initcap(:P212_MTVO_RCHZO_RVRSION),',
'                                                 p_id_usrio               =>    :F_ID_USRIO,',
'                                                 p_id_plntlla             =>    :P212_ID_PLNTLLA,  ',
'                                                 o_id_acto                =>    :P212_ID_ACTO,',
'                                                 o_cdgo_rspsta		      =>    v_cdgo_rspsta,',
'                                                 o_mnsje_rspsta           =>    :P212_RSPSTA);',
'',
'     apex_util.set_session_state(''F_ID_FLJO_TREA'','''');',
'',
'end;   ',
'   '))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(33821598321607106)
,p_process_success_message=>'&P212_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(35255391327289801)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>unistr('Limpiar Sesi\00F3n')
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'PAGELOAD'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(35240882018003403)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Datos Reversi\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select id_cnvnio',
'         , id_cnvnio_rvrsion',
'         , cdgo_cnvnio_rvrsion_estdo',
'      into :P212_ID_CNVNIO',
'         , :P212_ID_CNVNIO_RVRSION',
'         , :P212_CDGO_RVRSION_ESTDO',
'      from gf_g_convenios_reversion',
'     where id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO;',
'exception',
'    when no_data_found then',
'        null;     ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(34861457139956702)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Datos Reversi\00F3n Documento')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select b.id_plntlla',
'         , b.dcmnto',
'         , a.mtvo_rchzo_rvrsion',
'         , b.id_cnvnio_dcmnto',
'         , a.id_acto',
'      into :P212_ID_PLNTLLA',
'         , :P212_DCMNTO',
'         , :P212_MTVO_RCHZO_RVRSION',
'         , :P212_ID_CNVNIO_DCMNTO',
'         , :P212_ID_ACTO',
'     from gf_g_convenios_reversion a',
'left join gf_g_convenios_documentos b on a.id_cnvnio = b.id_cnvnio',
'     join gn_d_plantillas p on p.id_plntlla = b.id_plntlla',
'     join gn_d_actos_tipo_tarea t on t.id_acto_tpo = p.id_acto_tpo and t.id_fljo_trea    = :F_ID_FLJO_TREA',
'    where id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO;',
'',
'exception',
'    when no_data_found then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(56991274726190403)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IniciarFlujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_instncia_fljo number := apex_application.g_f01(1);',
'    v_id_fljo_trea number;',
'    v_url varchar2(4000);',
'    ',
'begin',
'    begin',
'        apex_json.open_object();  ',
'    ',
'    begin',
'    ',
'        select a.id_fljo_trea_orgen ',
'          into v_id_fljo_trea',
'          from wf_g_instancias_transicion a',
'         where a.id_instncia_fljo = v_id_instncia_fljo',
'           and a.id_estdo_trnscion in (1,2);',
'           ',
'    exception ',
'        when no_data_found then',
'              ',
'          begin                   ',
'              select distinct first_value(id_fljo_trea_orgen) over(order by id_instncia_trnscion desc) ',
'                into v_id_fljo_trea',
'                from wf_g_instancias_transicion ',
'               where id_instncia_fljo = v_id_instncia_fljo;',
'',
'          exception when no_data_found  then',
'                    v_id_fljo_trea := null;',
'          end;',
'    end;',
'    ',
'        if nvl(v_id_fljo_trea, -1) > 0 then',
'            apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo );',
'            apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea );            	',
'            v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => v_id_instncia_fljo,',
'                                                          p_id_fljo_trea     => v_id_fljo_trea,',
'                                                          p_clear_session    => ''S'');',
'        ',
'            apex_json.write(''type'', ''OK'');',
'            apex_json.write(''msg'', ''Url generada exitosamente'');',
'            apex_json.write(''url'', v_url);',
'        ',
'        else',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'', ''No existe tarea destino'');',
'        ',
'        end if;',
'        apex_json.close_object();',
'    ',
'    exception when others then ',
'      apex_json.open_object();',
'      apex_json.write(''type'', ''OK'');',
'      apex_json.write(''msg'',apex_escape.html(sqlerrm));',
'      apex_json.close_object();',
'  end;',
'  ',
'  apex_json.close_all();',
'  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
