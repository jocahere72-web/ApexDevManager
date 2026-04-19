prompt --application/pages/page_00185
begin
wwv_flow_api.create_page(
 p_id=>185
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Generar Acto de Revocatoria'
,p_step_title=>'Generar Acto de Revocatoria'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P185_DCMNTO_DISPLAY{',
'    width: 99% !important;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_upd_yyyymmddhh24miss=>'20230911095352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(107212095625034401)
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
 p_id=>wwv_flow_api.id(282480480760741584)
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
 p_id=>wwv_flow_api.id(282680948816496837)
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
'<i>Funcionalidad que Permite:</i><br><br>',
'<i><b>1.</b> Visualizar y editar plantilla de acto de revocatoria de acuerdo de pago.</i><br><br>',
'<i><b>2.</b> Crear documento del acto de revocatoria.</i><br><br>',
'<i><b>3.</b> Registrar revocatoria y generar acto de revocatoria de acuerdo de pago.<br><br>',
unistr('<p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(107219370907134699)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(282480480760741584)
,p_button_name=>'REGRESAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(107219772522134700)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(282480480760741584)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P185_ID_CNVNIO_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(107218992147134697)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(282480480760741584)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>':P185_ID_CNVNIO_DCMNTO IS NOT NULL and :P185_ID_ACTO is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(107220959215134704)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(282480480760741584)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>':P185_ID_CNVNIO_DCMNTO IS NOT NULL and :P185_ID_ACTO is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(107220123352134704)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(282480480760741584)
,p_button_name=>'BTN_REVOCAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Registrar Revocatoria'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>':P185_ID_CNVNIO_DCMNTO is not null and :P185_ID_ACTO is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(117769881655596083)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(282480480760741584)
,p_button_name=>'BTN_VER_ACTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Ver Acto'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>':P185_ID_ACTO is not null'
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(107212422101034405)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(107212095625034401)
,p_button_name=>'BTN_GNRAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar'
,p_button_position=>'BODY'
,p_button_condition=>'P185_ID_CNVNIO_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(117770128765597327)
,p_branch_name=>unistr('Ir a P\00E1gina 127 App 50000')
,p_branch_action=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR,P127_COLUMNA_FILENAME:v_gn_g_actos,file_blob,file_mimetype,id_acto,&P185_ID_ACTO.,file_name&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(117769881655596083)
,p_branch_sequence=>80
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(50165302325213316)
,p_branch_name=>unistr('Ir a P\00E1gina 175')
,p_branch_action=>'f?p=&APP_ID.:175:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(107219370907134699)
,p_branch_sequence=>90
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107212110721034402)
,p_name=>'P185_ID_PLNTLLA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(107212095625034401)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.dscrpcion',
'        , a.id_plntlla',
'     from gn_d_plantillas           a',
'     join gf_d_revocatoria_metodo   b on a.id_acto_tpo  = b.id_acto_tpo_rvctria',
'    where b.id_rvctria_mtdo         = :P175_ID_RVCTRIA_MTDO'))
,p_lov_display_null=>'YES'
,p_display_when=>'P185_ID_ACTO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_read_only_when=>'P185_ID_CNVNIO_DCMNTO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione la plantilla de acto a generar en la revocatoria de acuerdo de pago.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107212267421034403)
,p_name=>'P185_DCMNTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(107212095625034401)
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
 p_id=>wwv_flow_api.id(107407154310550303)
,p_name=>'P185_ID_CNVNIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(107212095625034401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107407314793550305)
,p_name=>'P185_RSPSTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(107212095625034401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107568105961223601)
,p_name=>'P185_ID_ACTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(107212095625034401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107602998597478201)
,p_name=>'P185_ID_RPRTE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(107212095625034401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107621800008608002)
,p_name=>'P185_RSPSTA_DCMNTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(107212095625034401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107649802332011001)
,p_name=>'P185_ID_CNVNIO_DCMNTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(107212095625034401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107758747050605701)
,p_name=>'P185_CDGO_RVCTRIA_ESTDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(107212095625034401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(119964633261445403)
,p_name=>'P185_ID_ACTO_TPO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(107212095625034401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(107601799367445206)
,p_computation_sequence=>20
,p_computation_item=>'P185_ID_RPRTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select b.id_rprte ',
'      from gn_d_plantillas a',
'      join gn_d_reportes b',
'        on a.id_rprte = b.id_rprte',
'      where a.cdgo_clnte = :F_CDGO_CLNTE',
'        and a.id_plntlla = :P185_ID_PLNTLLA'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(119964837518445405)
,p_computation_sequence=>10
,p_computation_item=>'P185_ID_ACTO_TPO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_acto_tpo',
'  from gn_d_actos_tipo ',
' where cdgo_clnte     = :F_CDGO_CLNTE',
'   and cdgo_acto_tpo  = ''REA'';',
''))
,p_compute_when=>'P185_ID_PLNTLLA'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(107407474569550306)
,p_validation_name=>'Plantilla No Nula'
,p_validation_sequence=>10
,p_validation=>'P185_ID_PLNTLLA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione la Plantilla'
,p_when_button_pressed=>wwv_flow_api.id(107220123352134704)
,p_associated_item=>wwv_flow_api.id(107212110721034402)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(107407580116550307)
,p_validation_name=>'Documento No Nulo'
,p_validation_sequence=>20
,p_validation=>'P185_DCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('\00A1El documento no puede ser nulo!')
,p_when_button_pressed=>wwv_flow_api.id(107219772522134700)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4184626392453601)
,p_validation_name=>'Valida Registro Revocatoria'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'not exists( select 1',
'             from gf_g_convenios_revocatoria',
'            where id_cnvnio = :P185_ID_CNVNIO',
'              and cdgo_cnvnio_rvctria_estdo not in (''ANL'')',
'         )'))
,p_validation_type=>'SQL_EXPRESSION'
,p_error_message=>'Revocatoria Registrada Previamente'
,p_when_button_pressed=>wwv_flow_api.id(107220123352134704)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(107744119778352902)
,p_name=>unistr('Cargar P\00E1gina')
,p_event_sequence=>30
,p_condition_element=>'P185_ID_ACTO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(107744259625352903)
,p_event_id=>wwv_flow_api.id(107744119778352902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(107220123352134704)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50165170799213314)
,p_name=>'Nuevo'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P185_ID_PLNTLLA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50165216165213315)
,p_event_id=>wwv_flow_api.id(50165170799213314)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P185_ID_ACTO_TPO'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_acto_tpo',
'  from gn_d_plantillas',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_plntlla = :P185_ID_PLNTLLA;'))
,p_attribute_07=>'P185_ID_PLNTLLA'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(54242783526546802)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select   a.id_cnvnio_dcmnto',
'   ,     a.dcmnto',
'   ,     a.id_plntlla',
'   ,     a.id_acto',
'  into   :P185_ID_CNVNIO_DCMNTO',
'   ,     :P185_DCMNTO',
'   ,     :P185_ID_PLNTLLA',
'   ,     :P185_ID_ACTO ',
'  from gf_g_convenios_documentos a',
'  join gn_d_plantillas b on a.id_plntlla = b.id_plntlla',
'  join gn_d_actos_tipo c on b.id_acto_tpo = c.id_acto_tpo',
' where b.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_cnvnio = :P185_ID_CNVNIO',
'   and c.cdgo_acto_tpo  = ''REA'';',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(107585828630298114)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Documento Revocatoria Acuerdo de Pago'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    :P185_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''<COD_CLNTE>''|| :F_CDGO_CLNTE ||''</COD_CLNTE><ID_CNVNIO>''|| :P185_ID_CNVNIO ||''</ID_CNVNIO><ID_ACTO_TPO>''||:P185_ID_ACTO_TPO||''</ID_ACTO_TPO>'', :P185_ID_PLNTLLA);',
'exception',
'   when others then',
unistr('   RAISE_APPLICATION_ERROR(-20000, ''Seleccione la plantilla de aplicaci\00F3n'');'),
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(107212422101034405)
,p_process_when=>'P185_ID_PLNTLLA'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>unistr('\00A1Documento Generado Satisfactoriamente!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(107621738455608001)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Gestionar Documento Revocatoria'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'begin',
'    ',
'   pkg_gf_convenios.prc_rg_documento_acuerdo_pago (  p_cdgo_clnte   =>	:F_CDGO_CLNTE,',
'                                                    p_id_cnvnio     =>	:P185_ID_CNVNIO,',
'                                                    p_id_plntlla    =>	:P185_ID_PLNTLLA,',
'                                                    p_dcmnto        =>	:P185_DCMNTO,',
'                                                    p_request       =>	:REQUEST,',
'                                                    p_id_usrio		=>	:F_ID_USRIO,',
'                                                    o_cdgo_rspsta	=>	v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta	=>	:P185_RSPSTA_DCMNTO);',
'                                                    ',
'    if v_cdgo_rspsta <> 0 then',
unistr('        :P185_RSPSTA_DCMNTO := ''\00A1Error en la generaci\00F3n del Documento!'';'),
'    end if;',
'                                    ',
'    ',
'end;'))
,p_process_error_message=>'&P185_RSPSTA_DCMNTO.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'&P185_RSPSTA_DCMNTO.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(107407232060550304)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Solicitud Revocatoria'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_cdgo_rspsta                number;',
'    v_indcdor_rvctria_aplcda    varchar2(1);',
' ',
'begin',
'',
'    pkg_gf_convenios.prc_rg_revocatoria_acrdo_pgo ( p_cdgo_clnte        	=>		:F_CDGO_CLNTE,',
'                                                    p_id_cnvnio         	=>		:P185_ID_CNVNIO,',
'                                                    p_id_rvctria_mtdo   	=>		:P175_ID_RVCTRIA_MTDO, ',
'                                                    p_id_usrio          	=>		:F_ID_USRIO,',
'                                                    p_id_plntlla        	=>		:P185_ID_PLNTLLA,',
'                                                    o_id_acto           	=>		:P185_ID_ACTO,',
'                                                    o_indcdor_rvctria_aplcda =>     v_indcdor_rvctria_aplcda,',
'                                                    o_cdgo_rspsta       	=>		v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta      	=>		:P185_RSPSTA); ',
'                                                ',
'          if v_cdgo_rspsta = 0 then',
unistr('              :P185_RSPSTA := ''\00A1Solicitud de Revocatoria de Acuerdo de Pago Registrada Satisfactoriamente!'';'),
'          else',
'              raise_application_error(-20001, :P185_RSPSTA);',
'          end if;    ',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(107220123352134704)
,p_process_success_message=>'&P185_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(107587353025309657)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Edittor'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P185_DCMNTO,P185_ID_CNVNIO_DCMNTO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST IN (''DELETE'',''REGRESAR'') or (:P185_ID_PLNTLLA IS NULL and :REQUEST = ''BTN_GNRAR'') '
,p_process_when_type=>'PLSQL_EXPRESSION'
);
end;
/
