prompt --application/pages/page_00165
begin
wwv_flow_api.create_page(
 p_id=>165
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Generar Acto de Desembargo Remanente'
,p_step_title=>'Generar Acto de Desembargo Remanente'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P253_DCMNTO_DISPLAY{',
'    width: 99.5% !important;',
'}'))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20240612113451'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(661648453282168100)
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
 p_id=>wwv_flow_api.id(1064243629363794958)
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
 p_id=>wwv_flow_api.id(1179536412255104742)
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
'<i><b>1.</b> Visualizar y Editar Plantilla de Acto generado dentro de esta etapa de Desembargos de remanente.</i><br><br>',
'<i><b>2.</b> Generar el Acto asociado a la etapa de Desembargos de remanente.</i><br><br></i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(217345355803179673)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1064243629363794958)
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
 p_id=>wwv_flow_api.id(217345716669179677)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(1064243629363794958)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P165_ID_DSMBG_RMNTE_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(217346191254179677)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(1064243629363794958)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>':P165_ID_DSMBG_RMNTE_DCMNTO is not null and :P165_ID_ACTO is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(217344506086179673)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(1064243629363794958)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_button_condition=>':P165_ID_DSMBG_RMNTE_DCMNTO is not null and :P165_ID_ACTO is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(217344948675179673)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(1064243629363794958)
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
 p_id=>wwv_flow_api.id(217339428496179666)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(661648453282168100)
,p_button_name=>'BTN_GNRAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Documento'
,p_button_position=>'BODY'
,p_button_condition=>'P165_ID_DSMBG_RMNTE_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>2
,p_grid_column=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(217350948771179686)
,p_branch_name=>unistr('Ir a P\00E1gina Retorno')
,p_branch_action=>'f?p=&APP_ID.:&P165_PAGINA.:&SESSION.::&DEBUG.:RP,&P165_PAGINA.::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(217345355803179673)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(217351364849179686)
,p_branch_name=>unistr('Ir a P\00E1gina 127 Ver acto')
,p_branch_action=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR,P127_COLUMNA_FILENAME:v_gn_g_actos,file_blob,file_mimetype,id_acto,&P165_ID_ACTO.,file_name&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(217344948675179673)
,p_branch_sequence=>30
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P165_ID_ACTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217339854921179667)
,p_name=>'P165_ID_PLNTLLA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(661648453282168100)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      distinct a.dscrpcion',
'           ,a.id_plntlla',
'from        gn_d_plantillas        a',
'join  gn_d_actos_tipo_tarea   b   on  b.id_acto_tpo   =   a.id_acto_tpo',
'join  gn_d_actos_tipo         c   on  b.id_acto_tpo   =   c.id_acto_tpo',
'where       a.cdgo_clnte      =    :F_CDGO_CLNTE',
'--and         c.cdgo_acto_tpo     =  :P165_CDGO_TTLO_JDCIAL_ESTDO',
'and         b.id_fljo_trea    =    :P165_ID_FLJO_TREA',
'and         a.actvo = ''S''',
'',
'',
'/*select a.dscrpcion d, ',
'       a.id_plntlla r',
'from gn_d_plantillas a',
'join df_s_procesos b on a.id_prcso = b.id_prcso',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'  and b.id_prcso = pkg_gn_generalidades.fnc_cl_defniciones_cliente( p_cdgo_clnte                => a.cdgo_clnte,',
'                                                                    p_cdgo_dfncion_clnte_ctgria => ''TJP'',',
'                                                                    p_cdgo_dfncion_clnte        => :P165_CDGO_TTLO_JDCIAL_ESTDO);*/',
';'))
,p_lov_display_null=>'YES'
,p_colspan=>8
,p_grid_label_column_span=>2
,p_display_when=>'P165_ID_DSMBG_RMNTE_DCMNTO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217340202336179668)
,p_name=>'P165_DCMNTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(661648453282168100)
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
 p_id=>wwv_flow_api.id(217340631569179668)
,p_name=>'P165_ID_DSMBG_RMNTE_DCMNTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(661648453282168100)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217341087218179669)
,p_name=>'P165_ID_ACTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(661648453282168100)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217341497613179669)
,p_name=>'P165_RSPSTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(661648453282168100)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217341879144179669)
,p_name=>'P165_JSON'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(661648453282168100)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217342223087179669)
,p_name=>'P165_PAGINA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(661648453282168100)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217342600049179670)
,p_name=>'P165_ID_EMBRGOS_RMNTE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(661648453282168100)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217343012765179670)
,p_name=>'P165_ID_DSMBRGO_RMNTE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(661648453282168100)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217343469293179670)
,p_name=>'P165_ID_INSTNCIA_FLJO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(661648453282168100)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217343894062179672)
,p_name=>'P165_ID_FLJO_TREA'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(661648453282168100)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(217346981973179678)
,p_validation_name=>'Validar plantilla no nula'
,p_validation_sequence=>10
,p_validation=>'P165_ID_PLNTLLA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar una Plantilla'
,p_validation_condition=>'BTN_GNRAR,CREATE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(217339854921179667)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(217347389653179678)
,p_validation_name=>'Validar documento no nulo'
,p_validation_sequence=>20
,p_validation=>'P165_DCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El Documento no puede estar vac\00EDo.')
,p_when_button_pressed=>wwv_flow_api.id(217345716669179677)
,p_associated_item=>wwv_flow_api.id(217340202336179668)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(217349249455179685)
,p_process_sequence=>60
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_acto',
'      into :P165_ID_ACTO',
'      from mc_g_dsmbrg_remnte_dcmnto a',
'     where a.id_dsmbrg_rmnte = :P165_ID_DSMBRGO_RMNTE;',
'exception ',
'    when others then',
'        :P165_ID_ACTO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(217347630581179679)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Plantilla'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin                                                  ',
'    :P165_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''{"id_instncia_fljo":"'' ||:F_ID_INSTNCIA_FLJO || ''"}''',
'                                                       , :P165_ID_PLNTLLA);',
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
 p_id=>wwv_flow_api.id(217348083737179679)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar Plantilla'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_json           clob;',
'begin      ',
'    pkg_cb_medidas_cautelares.prc_rg_documento_dsmbrg_rmnte( p_cdgo_clnte                  =>   :F_CDGO_CLNTE,',
'                                                             p_id_dsmbrgo_rmnte            =>   :P165_ID_DSMBRGO_RMNTE,',
'                                                             p_id_plntlla                  =>   :P165_ID_PLNTLLA,',
'                                                             p_dcmnto                      =>   :P165_DCMNTO,  ',
'                                                             p_id_usrio		               =>   :F_ID_USRIO,',
'                                                             o_id_dsmbrg_rmnt_dcmnt        =>   :P165_ID_DSMBG_RMNTE_DCMNTO,',
'                                                             o_cdgo_rspsta	               =>   v_cdgo_rspsta,',
'                                                             o_mnsje_rspsta	               =>   :P165_RSPSTA',
'                                                            );',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20001, :P165_RSPSTA);',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(217345716669179677)
,p_process_success_message=>'&P165_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(217350086457179685)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar Plantilla'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_json           clob;',
'begin      ',
'    pkg_cb_medidas_cautelares.prc_ac_documento_dsmbrg_rmnte( p_cdgo_clnte                  =>   :F_CDGO_CLNTE,',
'                                                             p_id_dsmbrgo_rmnte            =>   :P165_ID_DSMBRGO_RMNTE,',
'                                                             p_dcmnto                      =>   :P165_DCMNTO,  ',
'                                                             p_id_usrio		               =>   :F_ID_USRIO,',
'                                                             p_id_dsmbrg_rmnt_dcmnt        =>   :P165_ID_DSMBG_RMNTE_DCMNTO,',
'                                                             o_cdgo_rspsta	               =>   v_cdgo_rspsta,',
'                                                             o_mnsje_rspsta	               =>   :P165_RSPSTA',
'                                                            );',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20001, :P165_RSPSTA);',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(217346191254179677)
,p_process_when=>'P165_ID_DSMBG_RMNTE_DCMNTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'&P165_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(217350401187179685)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Plantilla'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_json           clob;',
'begin      ',
'    pkg_cb_medidas_cautelares.prc_el_documento_dsmbrg_rmnte( p_cdgo_clnte                  =>   :F_CDGO_CLNTE,',
'                                                             p_id_dsmbrgo_rmnte             =>  :P165_ID_DSMBRGO_RMNTE,',
'                                                             p_id_usrio		               =>   :F_ID_USRIO,',
'                                                             p_id_dsmbrg_rmnt_dcmnt         =>  :P165_ID_DSMBG_RMNTE_DCMNTO,',
'                                                             o_cdgo_rspsta	               =>   v_cdgo_rspsta,',
'                                                             o_mnsje_rspsta	               =>   :P165_RSPSTA',
'                                                            );',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20001, :P165_RSPSTA);',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(217344506086179673)
,p_process_when=>'P165_ID_DSMBG_RMNTE_DCMNTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'&P165_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(217348831403179679)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'begin',
'        pkg_gf_titulos_judicial.prc_rg_acto_ttlo_jdcial(p_cdgo_clnte		       =>    :F_CDGO_CLNTE,',
'                                                         p_id_ttlo_jdcial		   =>    json_value(:P165_JSON_FRCCNR, ''$.id_ttlo_jdcial''),--:P165_ID_TTLO_JDCIAL,',
'                                                         p_id_ttlo_jdcial_dcmnto   =>    :P165_ID_TTLO_JDCIAL_DCMNTO,',
'                                                         p_id_usrio			       =>    :F_ID_USRIO,',
'                                                         p_id_plntlla		       =>    :P165_ID_PLNTLLA,',
'                                                         p_cdgo_ttlo_jdcial_estdo  =>    :P165_CDGO_TTLO_JDCIAL_ESTDO,',
'                                                         p_obsrvcion_estdo		   =>    ''Titulo Fraccionado'',',
'                                                         o_id_acto			       =>    :P165_ID_ACTO,',
'                                                         o_cdgo_rspsta		       =>    v_cdgo_rspsta,',
'                                                         o_mnsje_rspsta		       =>    :P165_RSPSTA);',
'        if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P165_RSPSTA);',
'        end if;',
'     ',
'    apex_util.set_session_state(''F_ID_FLJO_TREA'','''');',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(217344948675179673)
,p_process_when=>'P165_ID_ACTO'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>'&P165_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(217348402872179679)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Editor'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P165_ID_PLNTLLA,P165_DCMNTO,P165_ID_DSMBG_RMNTE_DCMNTO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(217344506086179673)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(217349661756179685)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargue Datos Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    select a.id_dsmbg_rmnte_dcmnto',
'          ,a.dcmnto',
'          ,a.id_plntlla',
'      into :P165_ID_DSMBG_RMNTE_DCMNTO     ',
'          ,:P165_DCMNTO',
'          ,:P165_ID_PLNTLLA',
'      from mc_g_dsmbrg_remnte_dcmnto a',
'     where a.id_dsmbrg_rmnte = :P165_ID_DSMBRGOS_RMNTE;',
'exception ',
'    when others then',
'        :P165_ID_DSMBG_RMNTE_DCMNTO := null;',
'        :P165_DCMNTO := null;',
'        :P165_ID_PLNTLLA := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P165_DCMNTO'
,p_process_when_type=>'ITEM_IS_NULL'
);
end;
/
