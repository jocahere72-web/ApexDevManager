prompt --application/pages/page_00093
begin
wwv_flow_api.create_page(
 p_id=>93
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Documentos Secuestre'
,p_step_title=>'Documentos Secuestre'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_upd_yyyymmddhh24miss=>'20230911095352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(156054469540176062)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <b>',
'        <center>Opciones ',
'            <i class="fa fa-gears" aria-hidden="true"></i>',
'        </center>',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(156057185325176089)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'     ',
'    </b>',
'</h5>',
'',
'<p>Esta funcionalidad permite gestionar los documentos de cada una de las etpas del proceso juridico de cobro.</p>',
'<p> </p>',
'<p> </p>',
'<p><b>Nota:</b> Solo se visualizara la opcion de seleccionar la plantilla cuando no exista el documento.</p>',
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(156099993827925236)
,p_plug_name=>'Documentos'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113567260158524014)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(156054469540176062)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:89:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113567638787524015)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(156054469540176062)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P93_ID_SCSTRE_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113568080637524015)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(156054469540176062)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P93_ID_SCSTRE_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113568495511524015)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(156054469540176062)
,p_button_name=>'BTN_IMPRMIR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P93_ID_ACTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113566483353524014)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(156054469540176062)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P93_ID_SCSTRE_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113561360966523998)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(156099993827925236)
,p_button_name=>'BTN_GNRAR_DCMNTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Documento'
,p_button_position=>'BODY'
,p_button_condition=>'P93_ID_SCSTRE_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(113570101455524034)
,p_branch_name=>'Go To Page 13'
,p_branch_action=>'f?p=&APP_ID.:93:&SESSION.::&DEBUG.:RP,93:P93_ID_ACTO_TPO,P93_BRANCH,P93_ID_SCSTRE_GSTION,P93_ID_FLJO_TREA:&P93_ID_ACTO_TPO.,&P93_BRANCH.,&P93_ID_SCSTRE_GSTION.,&P93_ID_FLJO_TREA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(113566483353524014)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(113570534279524034)
,p_branch_name=>'Go To Page 2'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP,2:P2_ID_RPRTE,P2_XML:19,<data> 	<id_prcsos_jrdco_dcmnto>&P93_ID_PRCSOS_JRDCO_DCMNTO.</id_prcsos_jrdco_dcmnto> 	<id_prcsos_jrdco>&P93_ID_PRCSOS_JRDCO.</id_prcsos_jrdco> 	<funcion>pkg_cb_proceso_juridico.prc_ac_acto(p_file_blob => Â¡file_blob ! p_id_acto => &P93_ID_ACTO.)</funcion> </data>&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(113568495511524015)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113537839171471711)
,p_name=>'P93_ID_SCSTRE_GSTION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(156099993827925236)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113538072489471713)
,p_name=>'P93_ID_SCSTRE_DCMNTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(156099993827925236)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113538176165471714)
,p_name=>'P93_ID_FLJO_TREA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(156099993827925236)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113539086518471723)
,p_name=>'P93_MOSTRAR_ELIMINAR'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(156099993827925236)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113563779132524011)
,p_name=>'P93_ID_PLNTLLA'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(156099993827925236)
,p_prompt=>'Plantilla'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,',
'       id_plntlla',
'  from gn_d_plantillas',
' where id_acto_tpo = :P93_ID_ACTO_TPO'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_prcsos_jrdc_dcmnt_plnt',
'  from cb_g_prcsos_jrdc_dcmnt_plnt ',
' where id_prcsos_jrdco_dcmnto = :P93_ID_PRCSOS_JRDCO_DCMNTO'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione la plantilla que corresponde al documento'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113564102956524012)
,p_name=>'P93_DCMNTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(156099993827925236)
,p_prompt=>'Documento'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (opt) {',
'    opt.skin = ''office2013,skins/office2013/'';',
'    opt.height = 400;',
'    opt.resize_enabled = false; ',
'    opt.enterMode = 2;	opt.removePlugins = ''contextmenu,liststyle,tabletools'';	return opt;',
'}'))
,p_attribute_02=>'Full'
,p_attribute_03=>'Y'
,p_attribute_04=>'kama'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113564526621524013)
,p_name=>'P93_ID_ACTO_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(156099993827925236)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113564963079524013)
,p_name=>'P93_BRANCH'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(156099993827925236)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113565791595524013)
,p_name=>'P93_ID_ACTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(156099993827925236)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(113569637059524033)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
' select id_plntlla,dcmnto,id_scstre_dcmnto',
'   into :P93_ID_PLNTLLA,',
'        :P93_DCMNTO,',
'        :P93_ID_SCSTRE_DCMNTO',
'   from mc_g_secuestre_documentos',
'  where id_scstre_gstion = :P93_ID_SCSTRE_GSTION',
'  and id_acto_tpo = :P93_ID_ACTO_TPO;',
'  ',
'/* select id_plntlla,dcmnto,id_scstre_dcmnto',
'   into :P93_ID_PLNTLLA,',
'        :P93_DCMNTO,',
'        :P93_ID_SCSTRE_DCMNTO',
'   from mc_g_secuestre_documentos',
'  where id_scstre_dcmnto = :P93_ID_SCSTRE_DCMNTO;*/',
'      ',
'exception when others then ',
'           null; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(113568862265524033)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P93_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''<id_scstre_gstion>''|| :P93_ID_SCSTRE_GSTION ||''</id_scstre_gstion>'', :P93_ID_PLNTLLA);',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(42494367543652112)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(113569292024524033)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Gestionar Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'                                              ',
'    pkg_cb_medidas_cautelares.prc_rg_documento_secuestre  ( p_id_scstre_dcmnto  => :P93_ID_SCSTRE_DCMNTO,',
'                                                            p_id_scstre_gstion  => :P93_ID_SCSTRE_GSTION,',
'                                                            p_id_fljo_trea      => :P93_ID_FLJO_TREA,',
'                                                            p_id_acto_tpo       => :P93_ID_ACTO_TPO,',
'                                                            p_id_plntlla        => :P93_ID_PLNTLLA,',
'                                                            p_dcmnto            => :P93_DCMNTO,',
'                                                            p_id_usrio          => :F_ID_USRIO,',
'                                                            p_request           => :REQUEST);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('Operaci\00F3n realizada de forma exitosa!!')
);
end;
/
