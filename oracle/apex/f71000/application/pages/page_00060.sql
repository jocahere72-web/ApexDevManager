prompt --application/pages/page_00060
begin
wwv_flow_api.create_page(
 p_id=>60
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Emisi\00F3n de Recibos Masivos - Multiples Fechas')
,p_step_title=>unistr('Emisi\00F3n de Recibos Masivos - Multiples Fechas')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#registros_en_archivo .u-colors>:nth-child(45n+1) .u-color {',
' color: #fff;',
'     background-color: green;',
'--font-weight: bold;',
' font-size: 25px;    ',
'    ',
'}',
'',
'#Total_Sjtos_Imp_Vldos .u-colors>:nth-child(45n+1) .u-color {',
' color: #fff;',
' background-color: #ffa6f8;',
'-- font-weight: bold; ',
' font-size: 25px;',
'     ',
'}',
'',
'#Total_Sjtos_Imp_NO_Vldos .u-colors>:nth-child(45n+1) .u-color {',
' color: #fff;',
' background-color: red;',
'-- font-weight: bold; ',
' font-size: 25px;',
'     ',
'}',
'',
'#registros_bloqueados .u-colors>:nth-child(45n+1) .u-color {',
' color: #fff;',
' background-color: #00b7e2;',
'-- font-weight: bold; ',
' font-size: 25px;',
'      ',
'}',
'',
'#registros_sin_saldo .u-colors>:nth-child(45n+1) .u-color {',
'    color: #fff;',
'    background-color: orange;',
'    font-size: 25px;   ',
'}',
'',
'',
'#registros_duplicados .u-colors>:nth-child(45n+1) .u-color {',
'    color: #fff;',
'    background-color: #CE88F7;',
'    font-size: 25px;',
'}',
'',
'.t-BadgeList--circular.t-BadgeList--large .t-BadgeList-label {',
'    font-size: 14px;',
'    padding: 0.5px 8px;',
'}',
'',
''))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20191101165025'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4384637592902502)
,p_plug_name=>'Vigencias'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_component_template_options=>'t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(177337797773050609)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(4414536068966851)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(177351601973050625)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(368235754344494402)
,p_plug_name=>unistr('Lote de Facturaci\00F3n M\00E1siva - Multiples Fechas de Vencimiento')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:margin-top-sm:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(369977540832623177)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(371372911847457876)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
unistr('Para la creaci\00F3n de lote de facturaci\00F3n masiva con multiples fechas se deden realizar 4 pasos. En esta opci\00F3n se ejecutara el primer paso.<br>'),
'<center><b><i> Paso 1: Vigencias </i></b> </br></center>',
'<b><i> a. </i></b> Seleccionar Impuesto y Sub-Impuesto.</br>',
'<b><i> b. </i></b> Seleccionar Rango de Vigencias.</br>',
unistr('<b><i> c. </i></b> Ingresar Observaci\00F3n. (Opcional)</br>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(187455637699795390)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(369977540832623177)
,p_button_name=>'BTN_CONSULTAR_DESCUENTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Ver Descuentos'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4384711598902503)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(4384637592902502)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:61:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4384800901902504)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4384637592902502)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(187489678731795467)
,p_branch_name=>unistr('Ir P\00E1gina 58 Descuentos')
,p_branch_action=>'f?p=&APP_ID.:58:&SESSION.::&DEBUG.:RP,58:P58_ID_IMPSTO,P58_ID_IMSPTO_SBMPSTO,P58_VGNCIA_DSDE,P58_PRDO_DSDE,P58_VGNCIA_HSTA,P58_PRDO_HSTA,P58_FCHA_VNCMNTO:&P60_ID_IMPSTO.,&P60_ID_IMSPTO_SBMPSTO.,&P60_VGNCIA_DSDE.,&P60_PRDO_DSDE.,&P60_VGNCIA_HSTA.,&P60_PRDO_HSTA.,&P60_FCHA_VNCMNTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(187455637699795390)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4384950476902505)
,p_branch_name=>'Go To Page 62'
,p_branch_action=>'f?p=&APP_ID.:62:&SESSION.::&DEBUG.:RP,62::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4384800901902504)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187458268509795398)
,p_name=>'P60_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(368235754344494402)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187458641846795399)
,p_name=>'P60_ID_IMSPTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(368235754344494402)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_impsto_sbmpsto d, ',
'        id_impsto_sbmpsto r',
'   from df_i_impuestoS_subimpuesto ',
'  where cdgo_clnte = :F_CDGO_CLNTE ',
'    and id_impsto = :P60_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P60_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187459092183795403)
,p_name=>'P60_VGNCIA_DSDE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(368235754344494402)
,p_prompt=>'Vigencia Desde'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_colspan=>4
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187459481582795403)
,p_name=>'P60_PRDO_DSDE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(368235754344494402)
,p_prompt=>'Periodo Desde'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select prdo d, ',
'         prdo v',
'   from df_i_periodos ',
'  where cdgo_clnte = :F_CDGO_CLNTE ',
'    and id_impsto =:P60_ID_IMPSTO',
'    and id_impsto_sbmpsto = :P60_ID_IMSPTO_SBMPSTO',
'    and vgncia = :P60_VGNCIA_DSDE',
'order by prdo    '))
,p_lov_cascade_parent_items=>'P60_VGNCIA_DSDE,P60_ID_IMSPTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187459900976795404)
,p_name=>'P60_VGNCIA_HSTA'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(368235754344494402)
,p_prompt=>'Vigencia Hasta'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187460293664795404)
,p_name=>'P60_PRDO_HSTA'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(368235754344494402)
,p_prompt=>'Periodo Hasta'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select prdo d, ',
'         prdo v',
'   from df_i_periodos ',
'  where cdgo_clnte = :F_CDGO_CLNTE ',
'    and id_impsto =:P60_ID_IMPSTO',
'    and id_impsto_sbmpsto = :P60_ID_IMSPTO_SBMPSTO',
'    and vgncia = :P60_VGNCIA_HSTA',
'order by prdo    '))
,p_lov_cascade_parent_items=>'P60_VGNCIA_HSTA,P60_ID_IMSPTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187461454169795404)
,p_name=>'P60_OBSRVCION'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(368235754344494402)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>110
,p_cMaxlength=>1000
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187462316490795409)
,p_name=>'P60_ID_SQL'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(368235754344494402)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187462717879795409)
,p_name=>'P60_RSPSTA'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(368235754344494402)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187463102443795409)
,p_name=>'P60_ID_DCMNTO_LTE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(368235754344494402)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187463490745795410)
,p_name=>'P60_TTAL_SJTO_IMPSTO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(368235754344494402)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(187468213314795429)
,p_validation_name=>'Validar que la vigencia Hasta no sea menor a la Vigencia Desde'
,p_validation_sequence=>10
,p_validation=>':P60_VGNCIA_HSTA >= :P60_VGNCIA_DSDE'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La vigencia hasta no puede ser menor a la vigencia desde'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(187459900976795404)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(187473184685795443)
,p_name=>'Al cambiar. Si es Archivo se muestra el item para seleccionar un archivo'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P60_SLCCION_PBLCION'
,p_condition_element=>'P60_SLCCION_PBLCION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'ACV'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(187478647009795459)
,p_event_id=>wwv_flow_api.id(187473184685795443)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P60_ARCHVO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(187479182690795459)
,p_event_id=>wwv_flow_api.id(187473184685795443)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P60_ARCHVO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(187479738699795459)
,p_event_id=>wwv_flow_api.id(187473184685795443)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P60_ID_SQL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(187645874015438161)
,p_event_id=>wwv_flow_api.id(187473184685795443)
,p_event_result=>'FALSE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'BTN_SQL'
,p_attribute_02=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(187481981306795460)
,p_name=>unistr('Al cambiar el archivo se refresca la regi\00F3n de datos del archivo')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P60_ARCHVO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(187485982602795463)
,p_event_id=>wwv_flow_api.id(187481981306795460)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''IDNTFCCION_SJTO_IMPSTO''); ',
'APEX_UTIL.SET_SESSION_STATE(''P62_ARCHVO'',:P62_ARCHVO);'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(187470474682795437)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('\00CDtems en sesi\00F3n')
,p_process_sql_clob=>'APEX_UTIL.SET_SESSION_STATE(''P60_PRDO_DSDE'',:P60_PRDO_DSDE);'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(187455637699795390)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4634790800108826)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Borrar Coleccion de Sujetos Impuestos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin    ',
'    if apex_collection.collection_exists( p_collection_name => ''IDNTFCCION_SJTO_IMPSTO'' ) then ',
'        ',
'       for c_cllction in (select seq_id from apex_collections where collection_name = ''IDNTFCCION_SJTO_IMPSTO'' and d001 is null) loop ',
'           APEX_COLLECTION.DELETE_MEMBER( p_collection_name => ''IDNTFCCION_SJTO_IMPSTO'', p_seq => c_cllction.seq_id);',
'       end loop;',
'    ',
'        null;',
'     else ',
'         APEX_COLLECTION.CREATE_COLLECTION(p_collection_name => ''IDNTFCCION_SJTO_IMPSTO''); ',
'    end if;',
'end;',
'        ',
'        ',
'',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4384800901902504)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(187884130495471196)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Crear Colecci\00F3n de Fechas')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin    ',
'    if apex_collection.collection_exists( p_collection_name => ''FCHAS_VNCMNTO'' ) then ',
unistr('        insert into gti_aux (col1,col2) values (''0001'',''Si exite la colesi\00F3n'');'),
'        ',
'       for c_cllction in (select seq_id from apex_collections where collection_name = ''FCHAS_VNCMNTO'' and d001 is null) loop ',
'           APEX_COLLECTION.DELETE_MEMBER( p_collection_name => ''FCHAS_VNCMNTO'', p_seq => c_cllction.seq_id);',
'       end loop;',
'    ',
'        null;',
'     else ',
'         APEX_COLLECTION.CREATE_COLLECTION(p_collection_name => ''FCHAS_VNCMNTO''); ',
unistr('         insert into gti_aux (col1,col2) values (''0002'',''No exite la colesi\00F3n, se cre\00F3'');                                       '),
'    end if;',
'end;',
'        ',
'        ',
'',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
