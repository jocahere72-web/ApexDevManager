prompt --application/pages/page_00214
begin
wwv_flow_api.create_page(
 p_id=>214
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Generar Acto de Modificaci\00F3n')
,p_step_title=>unistr('Generar Acto de Modificaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P214_DCMNTO_DISPLAY{',
'    width: 99% !important;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_upd_yyyymmddhh24miss=>'20230911095352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(119205180633903101)
,p_plug_name=>'workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'false'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(341497764049666358)
,p_plug_name=>unistr('Documento Modificaci\00F3n Acuerdo')
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
 p_id=>wwv_flow_api.id(516770435054375251)
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
 p_id=>wwv_flow_api.id(516973128267132091)
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
unistr('<i><b>1.</b> Visualizar y Editar Plantilla de Acto de Modificaci\00F3n de Acuerdo de Pago.</i><br><br>'),
unistr('<i><b>2.</b> Generar y Visualizar el Acto de Modificaci\00F3n de Acuerdo de Pago.</i><br><br>'),
'.</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(121241430801706145)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(516770435054375251)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:187:&SESSION.::&DEBUG.:RP,187::'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(117561209033426044)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(516770435054375251)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Crear Documento'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'not exists(select id_cnvnio_dcmnto',
'           from gf_g_convenios_documentos ',
'          where cdgo_clnte        = :F_CDGO_CLNTE',
'            and id_cnvnio_mdfccion = :P214_ID_CNVNIO_MDFCCION',
'            and id_plntlla        = :P214_ID_PLNTLLA) and :P214_ID_ACTO_TPO is not null'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(117560468956426042)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(516770435054375251)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios Documento'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists(select id_cnvnio_dcmnto',
'       from gf_g_convenios_documentos',
'      where cdgo_clnte = :F_CDGO_CLNTE',
'        and id_cnvnio_mdfccion = :P214_ID_CNVNIO_MDFCCION',
'        and id_plntlla = :P214_ID_PLNTLLA) and :P214_ID_ACTO is null'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(117562010486426044)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(516770435054375251)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar Documento'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists(select id_cnvnio_dcmnto',
'       from gf_g_convenios_documentos',
'      where cdgo_clnte = :F_CDGO_CLNTE',
'        and id_cnvnio_mdfccion = :P214_ID_CNVNIO_MDFCCION',
'        and id_plntlla = :P214_ID_PLNTLLA) and :P214_ID_ACTO is null'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(117576103039740101)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(516770435054375251)
,p_button_name=>'BTN_APLICAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Aplicar Modificaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (select 1',
'          from gf_g_convenios_documentos a',
'          join gf_g_convenios_modificacion b on a.id_cnvnio_mdfccion = b.id_cnvnio_mdfccion',
'         where a.id_cnvnio = :P214_ID_CNVNIO',
'          and a.id_plntlla = :P214_ID_PLNTLLA',
'          and b.cdgo_cnvnio_mdfccion_estdo = ''APB'') ',
'          and :P16_ID_CNVNIO_MDFCCION is not null and :P214_CDGO_ESTDO_TRNSCION = ''APL'';'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(117576268505740102)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(516770435054375251)
,p_button_name=>'BTN_RECHAZAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Rechazar Modificaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (select b.id_cnvnio_dcmnto',
'          from gf_g_convenios_modificacion a',
'          join gf_g_convenios_documentos b on a.id_cnvnio = b.id_cnvnio',
'         where a.id_cnvnio = :P214_ID_CNVNIO',
'           and b.id_plntlla = :P214_ID_PLNTLLA',
'           and a.cdgo_cnvnio_mdfccion_estdo in (''APB'', ''RGS'')) and :P214_CDGO_ESTDO_TRNSCION = ''RCH'';'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-clipboard-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(120235886528149652)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(516770435054375251)
,p_button_name=>'BTN_VER_ACTO'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Ver Acto'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR,P127_COLUMNA_FILENAME:v_gn_g_actos,file_blob,file_mimetype,id_acto,&P214_ID_ACTO.,file_name'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists(select 1',
'      from gf_g_convenios_modificacion',
'     where id_cnvnio_mdfccion = :P214_ID_CNVNIO_MDFCCION',
'       and cdgo_cnvnio_mdfccion_estdo in (''APL'', ''RCH'')) and :P214_ID_ACTO is not null'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(117556249209426020)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(341497764049666358)
,p_button_name=>'BTN_GNRAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Documento'
,p_button_position=>'BODY'
,p_button_condition=>':P214_ID_CNVNIO_DCMNTO is null or :P214_DCMNTO is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117556634094426027)
,p_name=>'P214_ID_PLNTLLA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(341497764049666358)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion d, ',
'       a.id_plntlla r',
'from gn_d_plantillas a',
'inner join gn_d_actos_tipo_tarea b on a.id_acto_tpo     = b.id_acto_tpo and',
'                                      b.id_fljo_trea    = :F_ID_FLJO_TREA',
'where a.cdgo_clnte     = :F_CDGO_CLNTE',
''))
,p_lov_display_null=>'YES'
,p_display_when=>'P214_ID_ACTO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_read_only_when=>'P214_ID_CNVNIO_DCMNTO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117557031029426037)
,p_name=>'P214_DCMNTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(341497764049666358)
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
 p_id=>wwv_flow_api.id(117557471181426038)
,p_name=>'P214_ID_CNVNIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(341497764049666358)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117557867608426038)
,p_name=>'P214_RSPSTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(341497764049666358)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117558200651426038)
,p_name=>'P214_ID_ACTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(341497764049666358)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117558651355426039)
,p_name=>'P214_ID_RPRTE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(341497764049666358)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117559087202426039)
,p_name=>'P214_RSPSTA_DCMNTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(341497764049666358)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117559452974426040)
,p_name=>'P214_ID_CNVNIO_DCMNTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(341497764049666358)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_cnvnio_dcmnto',
'  from gf_g_convenios_documentos a',
'  where a.cdgo_clnte        = :F_CDGO_CLNTE',
'    and a.id_cnvnio         = :P214_ID_CNVNIO',
'    and a.id_plntlla        = :P214_ID_PLNTLLA'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117559768911426040)
,p_name=>'P214_CDGO_RVCTRIA_ESTDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(341497764049666358)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(119175806406720102)
,p_name=>'P214_ID_CNVNIO_MDFCCION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(341497764049666358)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(119965065609445407)
,p_name=>'P214_ID_ACTO_TPO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(341497764049666358)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(120037201004014601)
,p_name=>'P214_MTVO_RCHZO_SLCTUD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(341497764049666358)
,p_prompt=>'Motivo Rechazo'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cHeight=>3
,p_display_when=>'P16_A_O_R'
,p_display_when2=>'R'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123134120570453001)
,p_name=>'P214_CDGO_ESTDO_TRNSCION'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(341497764049666358)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(117562838818426065)
,p_computation_sequence=>10
,p_computation_item=>'P214_ID_RPRTE'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_rprte ',
'  from gn_d_plantillas a',
'  join gn_d_reportes b',
'    on a.id_rprte = b.id_rprte',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_plntlla = :P214_ID_PLNTLLA'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(119982750184525125)
,p_computation_sequence=>50
,p_computation_item=>'P214_ID_ACTO_TPO'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_acto_tpo',
'  from gn_d_plantillas',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_plntlla = :P214_ID_PLNTLLA;'))
,p_compute_when=>'P214_ID_PLNTLLA'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(117563215231426068)
,p_validation_name=>'Plantilla No Nula'
,p_validation_sequence=>10
,p_validation=>'P214_ID_PLNTLLA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione la Plantilla'
,p_when_button_pressed=>wwv_flow_api.id(117576103039740101)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(117563682362426071)
,p_validation_name=>'Documento No Nulo'
,p_validation_sequence=>20
,p_validation=>'P214_DCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'El documento no puede ser nulo!'
,p_when_button_pressed=>wwv_flow_api.id(117576103039740101)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(122333339037760203)
,p_name=>'Borrar Ruta Actual'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(117576103039740101)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122333488521760204)
,p_event_id=>wwv_flow_api.id(122333339037760203)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.localStorage.removeItem(''wf_link'');',
'apex.submit(''BTN_APLICAR'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(122333598620760205)
,p_name=>'Borrar Ruta Actual 2'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(117576268505740102)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122333666357760206)
,p_event_id=>wwv_flow_api.id(122333598620760205)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.localStorage.removeItem(''wf_link'');',
'apex.submit(''BTN_RECHAZAR'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(120422665551866101)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga de Datos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_cnvnio,',
'       a.id_cnvnio_mdfccion,',
'       a.id_acto,',
'       a.cdgo_estdo_trnscion',
'  into  :P214_ID_CNVNIO,',
'        :P214_ID_CNVNIO_MDFCCION,',
'        :P214_ID_ACTO,',
'        :P214_CDGO_ESTDO_TRNSCION',
'  from gf_g_convenios_modificacion a',
' where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(119175797351720101)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Datos Modificaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_plntlla,',
'        b.dcmnto,',
'        b.id_cnvnio_dcmnto,',
'        a.cdgo_estdo_trnscion',
'  into  :P214_ID_PLNTLLA,',
'        :P214_DCMNTO,',
'        :P214_ID_CNVNIO_DCMNTO,',
'        :P214_CDGO_ESTDO_TRNSCION',
'  from gf_g_convenios_modificacion a',
'  join gf_g_convenios_documentos b on a.id_cnvnio = b.id_cnvnio',
' where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO',
'   and b.id_acto = :P214_ID_ACTO;',
'   ',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P214_ID_CNVNIO_MDFCCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(119175910261720103)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    :P214_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''<COD_CLNTE>''|| :F_CDGO_CLNTE ||''</COD_CLNTE><ID_CNVNIO_MDFCCION>''|| :P214_ID_CNVNIO_MDFCCION ||''</ID_CNVNIO_MDFCCION><ID_CNVNIO>''|| :P214_ID_CNVNIO ||''</ID_CNVNIO><ID_ACTO_TPO>''|| :P214_ID_ACTO_'
||'TPO ||''</ID_ACTO_TPO><ID_PLNTLLA>''|| :P214_ID_PLNTLLA ||''</ID_PLNTLLA>'', :P214_ID_PLNTLLA);',
'exception',
'   when others then',
unistr('   RAISE_APPLICATION_ERROR(-20000, ''Seleccione la plantilla de aplicaci\00F3n'');    '),
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(117556249209426020)
,p_process_success_message=>'Documento Generado Satisfactoriamente!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(120214775205660501)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Gestionar Documento de modificaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'begin',
'    ',
'       pkg_gf_convenios.prc_rg_dcmnto_mdfccion_acrdo (p_cdgo_clnte            =>    :F_CDGO_CLNTE,',
'                                                       p_id_cnvnio             =>    :P214_ID_CNVNIO,',
'                                                       p_id_cnvnio_mdfccion    =>    :P214_ID_CNVNIO_MDFCCION,',
'                                                       p_id_plntlla            =>    :P214_ID_PLNTLLA,',
'                                                       p_dcmnto                =>    :P214_DCMNTO,',
'                                                       p_request               =>    :REQUEST,',
'                                                       p_id_usrio              =>    :F_ID_USRIO,',
'                                                       p_id_cnvnio_dcmnto      =>    :P214_ID_CNVNIO_DCMNTO,',
'                                                       o_cdgo_rspsta           =>    v_cdgo_rspsta,',
'                                                       o_mnsje_rspsta          =>    :P214_RSPSTA_DCMNTO);',
'                                                    ',
'    if v_cdgo_rspsta <> 0 then',
unistr('        :P214_RSPSTA_DCMNTO := ''\00A1Error en la generaci\00F3n del Documento!'';'),
'    end if;',
'                                    ',
'    ',
'end;'))
,p_process_error_message=>'&P214_RSPSTA_DCMNTO.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'&P214_RSPSTA_DCMNTO.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(119856710290232701)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('aplicar modificaci\00F3n acuerdo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_cdgo_rspsta       number;',
'    v_mro_cnvnio        number;',
'    v_mnsje_rspsta      varchar2(2000);  ',
'    ',
'begin',
'',
'    prc_apl_mdfccion_acuerdo_pntal( p_cdgo_clnte            =>    :F_CDGO_CLNTE,',
'                                    p_id_cnvnio_mdfccion    =>    :P214_ID_CNVNIO_MDFCCION,',
'                                    p_id_usrio              =>    :F_ID_USRIO,',
'                                    p_id_plntlla            =>    :P214_ID_PLNTLLA,',
'                                    o_id_acto               =>    :P214_ID_ACTO,',
'                                    o_cdgo_rspsta           =>    v_cdgo_rspsta,',
'                                    o_mnsje_rspsta          =>    :P214_RSPSTA);',
'    ',
'    begin',
'        select nmro_cnvnio',
'          into v_mro_cnvnio',
'          from gf_g_convenios',
'         where id_cnvnio = :P214_ID_CNVNIO;  ',
'    exception',
'        when others then',
'            raise_application_error(-20001, ''error al encontrar acuerdo de pago''||sqlerrm);',
'    end;',
'    ',
'    if v_cdgo_rspsta <> 0 then',
unistr('        v_mnsje_rspsta:= ''Error Al Aplicar Modificaci\00F3n de Acuerdo de Pago No. ''||v_mro_cnvnio;'),
'        :P214_RSPSTA := v_mnsje_rspsta;',
'    end if;',
'    ',
'    apex_util.set_session_state(''F_ID_FLJO_TREA'','''');',
'end;'))
,p_process_error_message=>'&P214_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(117576103039740101)
,p_process_success_message=>'&P214_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(119856975578232703)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('rechazar modificaci\00F3n acuerdo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_cdgo_rspsta       number;',
'    v_mro_cnvnio        number;',
'    v_mnsje_rspsta      varchar2(2000);  ',
'',
'begin',
'    prc_rcz_mdfccion_acuerdo_pntal(p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                  p_id_cnvnio_mdfccion  => :P214_ID_CNVNIO_MDFCCION,',
'                                  p_mtvo_rchzo_slctud   => :P214_MTVO_RCHZO_SLCTUD,',
'                                  p_id_usrio            => :F_ID_USRIO,  ',
'                                  p_id_plntlla          => :P214_ID_PLNTLLA,   ',
'                                  o_id_acto             => :P214_ID_ACTO,',
'                                  o_cdgo_rspsta         => v_cdgo_rspsta, ',
'                                  o_mnsje_rspsta        => :P214_RSPSTA); ',
'   ',
'    begin',
'        select nmro_cnvnio',
'          into v_mro_cnvnio',
'          from gf_g_convenios',
'         where id_cnvnio = :P214_ID_CNVNIO;  ',
'    exception',
'        when others then',
'            raise_application_error(-20001, ''error al encontrar acuerdo de pago''||sqlerrm);',
'    end;',
'    ',
'    if v_cdgo_rspsta <> 0 then',
unistr('        v_mnsje_rspsta:= ''Error Al Rechazar Modificaci\00F3n de Acuerdo de Pago No. ''||v_mro_cnvnio;'),
'        :P214_RSPSTA := v_mnsje_rspsta;',
'    end if;',
'    ',
'        apex_util.set_session_state(''F_ID_FLJO_TREA'','''');',
'    ',
'end;'))
,p_process_error_message=>'&P214_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(117576268505740102)
,p_process_success_message=>'&P214_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(120229492122037102)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P214_DCMNTO,P214_MTVO_RCHZO_SLCTUD,P214_ID_CNVNIO_DCMNTO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(117562010486426044)
);
end;
/
