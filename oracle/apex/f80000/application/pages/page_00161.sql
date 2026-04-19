prompt --application/pages/page_00161
begin
wwv_flow_api.create_page(
 p_id=>161
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Generar Acto de Embargo Remanente'
,p_step_title=>'Generar Acto de Embargo Remanente'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P253_DCMNTO_DISPLAY{',
'    width: 99.5% !important;',
'}'))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20240612113148'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(444761231695119996)
,p_plug_name=>unistr('Generaci\00F3n de Actos')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(847356407776746854)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_api.id(962649190668056638)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i></b>',
'</h5>',
'<i>Funcionalidad que Permite:</i><br><br>',
unistr('<i><b>1.</b> Visualizar y Editar Plantilla del Auto de Anotaci\00F3n de embargo de remanente.</i><br><br>'),
'<i><b>2.</b> Generar el Acto asociado a la etapa.</i><br><br></i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(217052576235144854)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(847356407776746854)
,p_button_name=>'REGRESAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(217052926290144854)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(847356407776746854)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P161_ID_EMBG_RMNTE_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(217053305931144854)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(847356407776746854)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>':P161_ID_EMBG_RMNTE_DCMNTO is not null and :P161_ID_ACTO is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(217051761679144853)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(847356407776746854)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_button_condition=>':P161_ID_EMBG_RMNTE_DCMNTO is not null and :P161_ID_ACTO is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(217052145713144854)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(847356407776746854)
,p_button_name=>'BTN_GNRAR_OFCIO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Confirmar/Ver Acto'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(217047028906144831)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(444761231695119996)
,p_button_name=>'BTN_GNRAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Documento'
,p_button_position=>'BODY'
,p_button_condition=>'P161_ID_EMBG_RMNTE_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>2
,p_grid_column=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(217058124860144862)
,p_branch_name=>unistr('Ir a P\00E1gina Retorno')
,p_branch_action=>'f?p=&APP_ID.:&P161_PAGINA.:&SESSION.::&DEBUG.:RP,&P161_PAGINA.::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(217052576235144854)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(217058596224144863)
,p_branch_name=>unistr('Ir a P\00E1gina 127 Ver acto')
,p_branch_action=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR,P127_COLUMNA_FILENAME:v_gn_g_actos,file_blob,file_mimetype,id_acto,&P161_ID_ACTO.,file_name&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(217052145713144854)
,p_branch_sequence=>30
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P161_ID_ACTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22934571389226602)
,p_name=>'P161_CDGO_ESTDO_EMBRGO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(444761231695119996)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217047455982144832)
,p_name=>'P161_ID_PLNTLLA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(444761231695119996)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select    distinct a.dscrpcion',
'         ,a.id_plntlla',
'from      gn_d_plantillas         a',
'join      gn_d_actos_tipo_tarea   b   on  b.id_acto_tpo   =   a.id_acto_tpo',
'join      gn_d_actos_tipo         c   on  b.id_acto_tpo   =   c.id_acto_tpo',
'join      mc_d_remanentes_rspsta  d   on  a.id_plntlla    =   d.id_plntlla',
'where     a.cdgo_clnte      =    :F_CDGO_CLNTE',
'and       b.id_fljo_trea    =    :P161_ID_FLJO_TREA',
'and       a.actvo           =    ''S''',
'and       d.cdgo_rspsta     =    :P161_CDGO_ESTDO_EMBRGO',
';'))
,p_lov_display_null=>'YES'
,p_colspan=>8
,p_grid_label_column_span=>2
,p_display_when=>'P161_ID_EMBG_RMNTE_DCMNTO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217047818430144832)
,p_name=>'P161_DCMNTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(444761231695119996)
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_field_template=>wwv_flow_api.id(17408492887919397)
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
 p_id=>wwv_flow_api.id(217048245642144833)
,p_name=>'P161_ID_EMBG_RMNTE_DCMNTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(444761231695119996)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217048602238144833)
,p_name=>'P161_ID_ACTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(444761231695119996)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217049003750144833)
,p_name=>'P161_RSPSTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(444761231695119996)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217049498766144844)
,p_name=>'P161_JSON'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(444761231695119996)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217049892584144844)
,p_name=>'P161_PAGINA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(444761231695119996)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217050247902144850)
,p_name=>'P161_ID_EMBRGOS_RMNTE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(444761231695119996)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217050670332144851)
,p_name=>'P161_ID_INSTNCIA_FLJO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(444761231695119996)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217051083834144851)
,p_name=>'P161_ID_FLJO_TREA'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(444761231695119996)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(217054185701144857)
,p_validation_name=>'Validar plantilla no nula'
,p_validation_sequence=>10
,p_validation=>'P161_ID_PLNTLLA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar una Plantilla'
,p_validation_condition=>'BTN_GNRAR,CREATE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(217047455982144832)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(217054523700144858)
,p_validation_name=>'Validar documento no nulo'
,p_validation_sequence=>20
,p_validation=>'P161_DCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El Documento no puede estar vac\00EDo.')
,p_when_button_pressed=>wwv_flow_api.id(217052926290144854)
,p_associated_item=>wwv_flow_api.id(217047818430144832)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(217056401972144861)
,p_process_sequence=>60
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_acto',
'      into :P161_ID_ACTO',
'      from mc_g_embrg_remnte_dcmnto a',
'     where a.id_embrgos_rmnte = :P161_ID_EMBRGOS_RMNTE;',
'exception ',
'    when others then',
'        :P161_ID_ACTO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22934474084226601)
,p_process_sequence=>70
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Codigo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.cdgo_estdo_embrgo',
'      into :P161_CDGO_ESTDO_EMBRGO',
'      from mc_g_embargos_remanente a',
'     where a.id_embrgos_rmnte = :P161_ID_EMBRGOS_RMNTE;',
'exception ',
'    when others then',
'        :P161_CDGO_ESTDO_EMBRGO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(217054875567144859)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Plantilla'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin                                                  ',
'    :P161_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''{"id_instncia_fljo":"'' ||:F_ID_INSTNCIA_FLJO || ''"}''',
'                                                       , :P161_ID_PLNTLLA);',
'exception',
'    when others then',
'           RAISE_APPLICATION_ERROR(-20000, ''Seleccione una plantilla.''); ',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(12049702376728272)
,p_process_success_message=>'Documento Generado Satisfactoriamente!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(217055238871144859)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar Plantilla'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_json           clob;',
'begin      ',
'    pkg_cb_medidas_cautelares.prc_rg_documento_embrg_rmnte(  p_cdgo_clnte                  =>   :F_CDGO_CLNTE,',
'                                                             p_id_embrgo_rmnte             =>   :P161_ID_EMBRGOS_RMNTE,',
'                                                             p_id_plntlla                  =>   :P161_ID_PLNTLLA,',
'                                                             p_dcmnto                      =>   :P161_DCMNTO,  ',
'                                                             p_id_usrio		               =>   :F_ID_USRIO,',
'                                                             o_id_embrg_rmnt_dcmnt         =>   :P161_ID_EMBG_RMNTE_DCMNTO,',
'                                                             o_cdgo_rspsta	               =>   v_cdgo_rspsta,',
'                                                             o_mnsje_rspsta	               =>   :P161_RSPSTA',
'                                                            );',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20001, :P161_RSPSTA);',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(217052926290144854)
,p_process_success_message=>'&P161_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(217057204663144862)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar Plantilla'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_json           clob;',
'begin      ',
'    pkg_cb_medidas_cautelares.prc_ac_documento_embrg_rmnte(  p_cdgo_clnte                  =>   :F_CDGO_CLNTE,',
'                                                             p_id_embrgo_rmnte             =>   :P161_ID_EMBRGOS_RMNTE,',
'                                                             p_dcmnto                      =>   :P161_DCMNTO,  ',
'                                                             p_id_usrio		               =>   :F_ID_USRIO,',
'                                                             p_id_embrg_rmnt_dcmnt         =>   :P161_ID_EMBG_RMNTE_DCMNTO,',
'                                                             o_cdgo_rspsta	               =>   v_cdgo_rspsta,',
'                                                             o_mnsje_rspsta	               =>   :P161_RSPSTA',
'                                                            );',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20001, :P161_RSPSTA);',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(217053305931144854)
,p_process_when=>'P161_ID_EMBG_RMNTE_DCMNTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'&P161_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(217057621063144862)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Plantilla'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_json           clob;',
'begin      ',
'    pkg_cb_medidas_cautelares.prc_el_documento_embrg_rmnte(  p_cdgo_clnte                  =>   :F_CDGO_CLNTE,',
'                                                             p_id_embrgo_rmnte             =>   :P161_ID_EMBRGOS_RMNTE,',
'                                                             p_id_usrio		               =>   :F_ID_USRIO,',
'                                                             p_id_embrg_rmnt_dcmnt         =>   :P161_ID_EMBG_RMNTE_DCMNTO,',
'                                                             o_cdgo_rspsta	               =>   v_cdgo_rspsta,',
'                                                             o_mnsje_rspsta	               =>   :P161_RSPSTA',
'                                                            );',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20001, :P161_RSPSTA);',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(217051761679144853)
,p_process_when=>'P161_ID_EMBG_RMNTE_DCMNTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'&P161_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(217056030676144860)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'begin',
'        pkg_gf_titulos_judicial.prc_rg_acto_ttlo_jdcial(p_cdgo_clnte		       =>    :F_CDGO_CLNTE,',
'                                                         p_id_ttlo_jdcial		   =>    json_value(:P161_JSON_FRCCNR, ''$.id_ttlo_jdcial''),--:P161_ID_TTLO_JDCIAL,',
'                                                         p_id_ttlo_jdcial_dcmnto   =>    :P161_ID_TTLO_JDCIAL_DCMNTO,',
'                                                         p_id_usrio			       =>    :F_ID_USRIO,',
'                                                         p_id_plntlla		       =>    :P161_ID_PLNTLLA,',
'                                                         p_cdgo_ttlo_jdcial_estdo  =>    :P161_CDGO_TTLO_JDCIAL_ESTDO,',
'                                                         p_obsrvcion_estdo		   =>    ''Titulo Fraccionado'',',
'                                                         o_id_acto			       =>    :P161_ID_ACTO,',
'                                                         o_cdgo_rspsta		       =>    v_cdgo_rspsta,',
'                                                         o_mnsje_rspsta		       =>    :P161_RSPSTA);',
'        if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P161_RSPSTA);',
'        end if;',
'     ',
'    apex_util.set_session_state(''F_ID_FLJO_TREA'','''');',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(217052145713144854)
,p_process_when=>'P161_ID_ACTO'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>'&P161_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(217055667410144859)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Editor'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P161_ID_PLNTLLA,P161_DCMNTO,P161_ID_EMBG_RMNTE_DCMNTO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(217051761679144853)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(217056874923144862)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargue Datos Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    select a.id_embg_rmnte_dcmnto',
'          ,a.dcmnto',
'          ,a.id_plntlla',
'      into :P161_ID_EMBG_RMNTE_DCMNTO     ',
'          ,:P161_DCMNTO',
'          ,:P161_ID_PLNTLLA',
'      from mc_g_embrg_remnte_dcmnto a',
'     where a.id_embrgos_rmnte = :P161_ID_EMBRGOS_RMNTE;',
'exception ',
'    when others then',
'        :P161_ID_EMBG_RMNTE_DCMNTO := null;',
'        :P161_DCMNTO := null;',
'        :P161_ID_PLNTLLA := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P161_DCMNTO'
,p_process_when_type=>'ITEM_IS_NULL'
);
end;
/
