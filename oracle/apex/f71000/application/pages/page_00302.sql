prompt --application/pages/page_00302
begin
wwv_flow_api.create_page(
 p_id=>302
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Generar Acto de Reversion AP'
,p_step_title=>'Generar Acto de Reversion AP'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P302_DCMNTO_DISPLAY{',
'    width: 99% !important;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_upd_yyyymmddhh24miss=>'20230911095352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(436181973918176635)
,p_plug_name=>unistr('Documento Reversi\00F3n Acuerdo')
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
 p_id=>wwv_flow_api.id(611454644922885528)
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
 p_id=>wwv_flow_api.id(611657338135642368)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>    ',
'    <p align="justify">Esta funcionalidad permite.<br><br> ',
unistr('        <b>1.</b> Visualizar y Editar Plantilla de Acto de reversi\00F3n de Acuerdo de Pago.<br><br>'),
unistr('        <b>2.</b> Generar y Visualizar el Acto de reversi\00F3n de Acuerdo de Pago.<br><br>'),
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>     ',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94691864003510289)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(611454644922885528)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:301:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94692278305510289)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(611454644922885528)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear Documento'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P302_ID_CNVNIO_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94692659856510289)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(611454644922885528)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios Documento'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>':P302_ID_CNVNIO_DCMNTO IS NOT NULL and :P302_ID_ACTO is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94693043425510289)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(611454644922885528)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar Documento'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>':P302_ID_CNVNIO_DCMNTO IS NOT NULL and :P302_ID_ACTO is null'
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94693478901510289)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(611454644922885528)
,p_button_name=>'BTN_APLICAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Aplicar Reversi\00F3n')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'        :P302_CDGO_ACCION = ''APL''',
'    and :P302_ID_ACTO is null ',
'    and :P302_ID_CNVNIO_DCMNTO is not null'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94693872588510290)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(611454644922885528)
,p_button_name=>'BTN_RECHAZAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Rechazar Reversi\00F3n')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P302_CDGO_ACCION = ''RCH'' and :P302_ID_ACTO is null and :P302_ID_CNVNIO_DCMNTO is not null'
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-clipboard-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94691475159510288)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(611454644922885528)
,p_button_name=>'BTN_VER_ACTO'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Ver Acto'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR,P127_COLUMNA_FILENAME:v_gn_g_actos,file_blob,file_mimetype,id_acto,&P302_ID_ACTO.,file_name'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists(select 1',
'      from gf_g_convenios_reversion',
'     where id_cnvnio_rvrsion = :P302_ID_CNVNIO_RVRSION',
'       and cdgo_cnvnio_rvrsion_estdo in (''APL'', ''RCH'')) and :P302_ID_ACTO is not null'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94684803328510278)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(436181973918176635)
,p_button_name=>'BTN_GNRAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Documento'
,p_button_position=>'BODY'
,p_button_condition=>':P302_ID_CNVNIO_DCMNTO is null or :P302_DCMNTO is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(94700876731510294)
,p_branch_name=>unistr('Ir a la p\00E1gina anterior - Sin Acto')
,p_branch_action=>'P302_BRANCH'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_when_button_id=>wwv_flow_api.id(94691864003510289)
,p_branch_sequence=>10
,p_branch_condition_type=>'ITEM_IS_NULL'
,p_branch_condition=>'P302_ID_ACTO'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(94701232720510294)
,p_branch_name=>unistr('Ir a la p\00E1gina anterior - Con Acto')
,p_branch_action=>'f?p=&APP_ID.:147:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(94691864003510289)
,p_branch_sequence=>20
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P302_ID_ACTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94685265171510278)
,p_name=>'P302_MTVO_RCHZO_SLCTUD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(436181973918176635)
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
 p_id=>wwv_flow_api.id(94685657478510279)
,p_name=>'P302_ID_PLNTLLA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(436181973918176635)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.dscrpcion                   d',
'        , a.id_plntlla                  r',
'     from gn_d_plantillas               a',
'     join gn_d_actos_tipo               b on a.id_acto_tpo = b.id_acto_tpo',
'    where a.cdgo_clnte                  = :F_CDGO_CLNTE',
'      and b.cdgo_acto_tpo               = ''RAC''',
'      and :P302_CDGO_ACCION             = ''APL''',
'union ',
'   select a.dscrpcion                   d',
'        , a.id_plntlla                  r',
'     from gn_d_plantillas               a',
'     join gn_d_actos_tipo               b on a.id_acto_tpo = b.id_acto_tpo',
'    where a.cdgo_clnte                  = :F_CDGO_CLNTE',
'      and b.cdgo_acto_tpo               = ''RRA''',
'      and :P302_CDGO_ACCION             = ''RCH'''))
,p_lov_display_null=>'YES'
,p_display_when=>'P302_ID_ACTO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_read_only_when=>'P302_ID_CNVNIO_DCMNTO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94686016512510279)
,p_name=>'P302_DCMNTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(436181973918176635)
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
 p_id=>wwv_flow_api.id(94686392131510285)
,p_name=>'P302_ID_CNVNIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(436181973918176635)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94686748084510286)
,p_name=>'P302_RSPSTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(436181973918176635)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94687123515510286)
,p_name=>'P302_ID_ACTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(436181973918176635)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94687519904510286)
,p_name=>'P302_ID_RPRTE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(436181973918176635)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94687953480510286)
,p_name=>'P302_RSPSTA_DCMNTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(436181973918176635)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94688399083510286)
,p_name=>'P302_ID_CNVNIO_DCMNTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(436181973918176635)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_cnvnio_dcmnto',
'  from gf_g_convenios_documentos a',
'  where a.cdgo_clnte        = :F_CDGO_CLNTE',
'    and a.id_cnvnio         = :P302_ID_CNVNIO',
'    and a.id_plntlla        = :P302_ID_PLNTLLA'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94688746326510287)
,p_name=>'P302_CDGO_RVCTRIA_ESTDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(436181973918176635)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94689580807510287)
,p_name=>'P302_ID_ACTO_TPO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(436181973918176635)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94689947553510287)
,p_name=>'P302_CDGO_ESTDO_TRNSCION'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(436181973918176635)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94690328512510287)
,p_name=>'P302_CDGO_ACCION'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(436181973918176635)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94690794256510288)
,p_name=>'P302_BRANCH'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(436181973918176635)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94788266016027802)
,p_name=>'P302_ID_CNVNIO_RVRSION'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(436181973918176635)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94822372471073801)
,p_name=>'P302_CDGO_CNVNIO_RVRSION_ESTDO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(436181973918176635)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(94694616341510290)
,p_computation_sequence=>10
,p_computation_item=>'P302_ID_RPRTE'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_rprte ',
'  from gn_d_plantillas a',
'  join gn_d_reportes b',
'    on a.id_rprte = b.id_rprte',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_plntlla = :P302_ID_PLNTLLA'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(94695059634510291)
,p_computation_sequence=>50
,p_computation_item=>'P302_ID_ACTO_TPO'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_acto_tpo',
'  from gn_d_plantillas',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_plntlla = :P302_ID_PLNTLLA;'))
,p_compute_when=>'P302_ID_PLNTLLA'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(94695465148510291)
,p_validation_name=>'Plantilla No Nula'
,p_validation_sequence=>10
,p_validation=>'P302_ID_PLNTLLA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione la Plantilla'
,p_when_button_pressed=>wwv_flow_api.id(94693478901510289)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(94695836366510291)
,p_validation_name=>'Documento No Nulo'
,p_validation_sequence=>20
,p_validation=>'P302_DCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('\00A1El documento no puede ser nulo!')
,p_when_button_pressed=>wwv_flow_api.id(94693478901510289)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94698956349510293)
,p_name=>'Borrar Ruta Actual'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(94693478901510289)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94699427056510293)
,p_event_id=>wwv_flow_api.id(94698956349510293)
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
 p_id=>wwv_flow_api.id(94699842574510293)
,p_name=>'Borrar Ruta Actual 2'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(94693872588510290)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94700353220510293)
,p_event_id=>wwv_flow_api.id(94699842574510293)
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
 p_id=>wwv_flow_api.id(94698566811510293)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga de Datos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_cnvnio,',
'       a.id_cnvnio_rvrsion,',
'       a.id_acto ',
'  into  :P302_ID_CNVNIO,',
'        :P302_ID_CNVNIO_RVRSION,',
'        :P302_ID_ACTO',
'  from gf_g_convenios_reversion a',
' where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94696161830510291)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Datos Reversion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select b.id_plntlla',
'         , b.dcmnto ',
'         , b.id_cnvnio_dcmnto',
'         , a.id_acto',
'         , a.cdgo_cnvnio_rvrsion_estdo',
'      into :P302_ID_PLNTLLA',
'         , :P302_DCMNTO ',
'         , :P302_ID_CNVNIO_DCMNTO',
'         , :P302_ID_ACTO',
'         , :P302_CDGO_CNVNIO_RVRSION_ESTDO',
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
,p_process_when=>'P302_ID_CNVNIO_RVRSION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94696539323510291)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    :P302_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''<COD_CLNTE>''|| :F_CDGO_CLNTE ||''</COD_CLNTE>',
'                                                       <ID_CNVNIO_RVRSION>''|| :P302_ID_CNVNIO_RVRSION ||''</ID_CNVNIO_RVRSION>',
'                                                       <ID_CNVNIO>''|| :P302_ID_CNVNIO ||''</ID_CNVNIO>',
'                                                       <ID_ACTO_TPO>''|| :P302_ID_ACTO_TPO ||''</ID_ACTO_TPO>',
'                                                       <ID_PLNTLLA>''|| :P302_ID_PLNTLLA ||''</ID_PLNTLLA>'', :P302_ID_PLNTLLA);',
'exception',
'   when others then',
unistr('   RAISE_APPLICATION_ERROR(-20000, ''Seleccione la plantilla de aplicaci\00F3n'');    '),
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(117556249209426020)
,p_process_success_message=>unistr('\00A1Documento Generado Satisfactoriamente!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94697754000510292)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Gestionar Documento de reversion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    ',
'begin',
'               ',
'    pkg_gf_convenios.prc_rg_documento_acuerdo_pago (p_cdgo_clnte    =>	:F_CDGO_CLNTE,',
'                                                    p_id_cnvnio     =>	:P302_ID_CNVNIO,',
'                                                    p_id_plntlla    =>	:P302_ID_PLNTLLA,',
'                                                    p_dcmnto        =>	:P302_DCMNTO,',
'                                                    p_request       =>	:REQUEST,',
'                                                    p_id_usrio		=>	:F_ID_USRIO,',
'                                                    o_cdgo_rspsta	=>	v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta	=>	:P302_RSPSTA_DCMNTO);',
'',
'    if v_cdgo_rspsta <> 0 then',
unistr('        :P302_RSPSTA_DCMNTO := ''\00A1Error en la generaci\00F3n del Documento!'';'),
'    end if;                                  ',
'    ',
'end;'))
,p_process_error_message=>'&P302_RSPSTA_DCMNTO.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'&P302_RSPSTA_DCMNTO.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94696945795510292)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'aplicar reversion de acuerdo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta          number;',
'    v_id_slctud            number;',
'    v_exste                varchar2(1);',
'    v_mnsje_rspsta         varchar2(2000);',
'    v_json_parametros      clob;  ',
'begin',
'    ',
'    begin',
'        select ''S''',
'          into v_exste',
'          from gf_g_convenios_reversion ',
'         where id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO;         ',
'    exception',
'        when no_data_found then',
'            v_exste    := ''N'';',
'    end;',
'    ',
'    /*if (v_exste = ''N'') then',
'    ',
'        --Radica la PQR',
'        begin ',
'            pkg_pq_pqr.prc_rg_radicar_solicitud( p_id_slctud => :P151_ID_SLCTUD, p_cdgo_clnte =>:F_CDGO_CLNTE );',
'        commit;',
'        exception ',
'          when others then',
'           rollback;',
'           raise_application_error(-20001, ''La solicitud no ha sido radicada '' || SQLCODE || '' - '' || SQLERRM);      ',
'        end;',
'        ',
'        begin',
'            select json_object( key ''p_id_slctud'' is :P151_ID_SLCTUD) ',
'              into v_json_parametros',
'              from dual;',
'',
'            --CONSULTAMOS SI HAY ENVIOS PROGRAMADOS',
'            pkg_ma_envios.prc_co_envio_programado( p_cdgo_clnte     => :F_CDGO_CLNTE',
'                                                 , p_idntfcdor      => ''PKG_GF_CONVENIOS.PRC_RG_REVERSION_ACUERDO_PAGO''',
'                                                 , p_json_prmtros   => v_json_parametros',
'                                                 );',
'        exception',
'            when others then',
'                null;',
'        end;',
'        ',
'    end if;*/',
'    ',
'    begin',
'        pkg_gf_convenios.prc_ap_aplccion_reversion_pntl(p_cdgo_clnte          =>    :F_CDGO_CLNTE,',
'                                                        p_id_cnvnio           =>    :P302_ID_CNVNIO,',
'                                                        p_id_instncia_fljo    =>    :F_ID_INSTNCIA_FLJO,',
'                                                        p_id_usrio            =>    :F_ID_USRIO,',
'                                                        p_id_plntlla          =>    :P302_ID_PLNTLLA,',
'                                                        p_id_slctud           =>    :P151_ID_SLCTUD,',
'                                                        o_id_acto             =>    :P302_ID_ACTO,',
'                                                        o_cdgo_rspsta         =>    v_cdgo_rspsta,',
'                                                        o_mnsje_rspsta        =>    v_mnsje_rspsta);',
'        if (v_cdgo_rspsta <> 0) then',
'            raise_application_error(-20001, v_mnsje_rspsta);',
'        else',
'            :P233_RSPSTA := v_mnsje_rspsta;',
'        end if;',
'        ',
'    end;',
'',
'end;    '))
,p_process_error_message=>'&P302_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(94693478901510289)
,p_process_success_message=>'&P302_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94697317649510292)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'rechazar reversion de acuerdo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_cdgo_rspsta    number;    ',
'begin',
'     pkg_gf_convenios.prc_rc_reversion_acrdo_pgo(p_cdgo_clnte             =>    :F_CDGO_CLNTE,',
'                                                 p_id_cnvnio              =>    :P302_ID_CNVNIO,',
'                                                 p_id_instncia_fljo       =>    :F_ID_INSTNCIA_FLJO,',
'                                                 p_mtvo_rchzo_rvrsion     =>    initcap(:P301_MTVO_RCHZO_RVRSION),',
'                                                 p_id_usrio               =>    :F_ID_USRIO,',
'                                                 p_id_plntlla             =>    :P302_ID_PLNTLLA,  ',
'                                                 o_id_acto                =>    :P302_ID_ACTO,',
'                                                 o_cdgo_rspsta		      =>    v_cdgo_rspsta,',
'                                                 o_mnsje_rspsta           =>    :P302_RSPSTA);',
'',
'     apex_util.set_session_state(''F_ID_FLJO_TREA'','''');',
'',
'end;   ',
'   '))
,p_process_error_message=>'&P302_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(94693872588510290)
,p_process_success_message=>'&P302_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94698159826510292)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P302_DCMNTO,P302_MTVO_RCHZO_SLCTUD,P302_ID_CNVNIO_DCMNTO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(94693043425510289)
);
end;
/
