prompt --application/pages/page_00116
begin
wwv_flow_api.create_page(
 p_id=>116
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Solicitud de Desembargo Funcionario'
,p_page_mode=>'MODAL'
,p_step_title=>'Solicitud de Desembargo Funcionario'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'400'
,p_protection_level=>'C'
,p_last_updated_by=>'ACARABALLO'
,p_last_upd_yyyymmddhh24miss=>'20220516155934'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12156077033025431)
,p_plug_name=>'DESEMBARGO '
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17335434580919364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'MC_G_DESEMBARGOS_SOLICITUD'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12161990578025444)
,p_plug_name=>'Botones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17336422472919364)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12162340870025444)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(12161990578025444)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12163948390025451)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(12161990578025444)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P116_ID_DSMBRGO_SLCTUD'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12164306214025452)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(12161990578025444)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P116_ID_DSMBRGO_SLCTUD'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12164745305025452)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(12161990578025444)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P116_ID_DSMBRGO_SLCTUD'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(11690291592080240)
,p_branch_action=>'f?p=&APP_ID.:115:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11690377506080241)
,p_name=>'P116_OBSRVCION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(12156077033025431)
,p_item_source_plug_id=>wwv_flow_api.id(12156077033025431)
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSRVCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_help_text=>unistr('Ingrese la observaci\00F3n correspondiente a la solicitud de desembargo.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12156361851025432)
,p_name=>'P116_ID_DSMBRGO_SLCTUD'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(12156077033025431)
,p_item_source_plug_id=>wwv_flow_api.id(12156077033025431)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Dsmbrgo Slctud'
,p_source=>'ID_DSMBRGO_SLCTUD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17408571111919398)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12156732200025439)
,p_name=>'P116_CDGO_CLNTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(12156077033025431)
,p_item_source_plug_id=>wwv_flow_api.id(12156077033025431)
,p_item_default=>':F_CDGO_CLNTE '
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12157576634025441)
,p_name=>'P116_ESTADO_SLCTUD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(12156077033025431)
,p_item_source_plug_id=>wwv_flow_api.id(12156077033025431)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_aprbcion_drcta varchar2(3);',
'    v_estdo_slctud varchar2(3);',
'begin',
'    v_aprbcion_drcta := pkg_cb_proceso_persuasivo.fnc_cl_parametro_configuracion(p_cdgo_clnte => :F_CDGO_CLNTE,',
'                                                                                       p_cdgo_cnfgrcion => ''ADD'');',
'    ',
'    v_estdo_slctud := ''S''; -- Solicitado',
'    ',
unistr('    -- Si el par\00E1metro de configraci\00F3n "ADD" retorna "S"'),
'    -- entonces el estado de la solicitd se registra en aprobada (A)',
'    if v_aprbcion_drcta = ''S'' then',
'        v_estdo_slctud := ''A''; -- Aprobada',
'    end if;',
'    ',
'    return v_estdo_slctud;',
'    ',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_source=>'ESTADO_SLCTUD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12157993146025441)
,p_name=>'P116_ID_EMBRGOS_RSLCION'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(12156077033025431)
,p_item_source_plug_id=>wwv_flow_api.id(12156077033025431)
,p_prompt=>unistr('Resoluci\00F3n de Embargo')
,p_source=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_acto||'' - ''||a.fcha_acto||'' - ''||a.dscrpcion_tipo_embargo||'' - ''||a.idntfccion||'' - ''||a.vgncias,a.id_embrgos_rslcion',
'from v_mc_g_embargos_resolucion a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.nmro_acto is not null',
'and not exists (select 1',
'                  from mc_g_desembargos_solicitud b',
'                 where b.id_embrgos_rslcion = a.id_embrgos_rslcion',
'                   and b.estado_slctud in (''S'',''A''))',
'/*and exists (select 1',
'              from mc_g_embrgs_rslcion_rspnsbl b',
'              join mc_g_embargos_responsable c on c.id_embrgos_rspnsble = b.id_embrgos_rspnsble',
'             where b.id_embrgos_rslcion = a.id_embrgos_rslcion',
'               and (:P116_IDNTFCCION_RSPNSBLE is null or c.idntfccion = :P116_IDNTFCCION_RSPNSBLE) )*/'))
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista la resoluci\00F3n de embargo a procesar.')
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12158321105025441)
,p_name=>'P116_ID_CSLES_DSMBRGO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(12156077033025431)
,p_item_source_plug_id=>wwv_flow_api.id(12156077033025431)
,p_prompt=>'Causal de Desembargo'
,p_source=>'ID_CSLES_DSMBRGO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_csal,id_csles_dsmbrgo',
'from mc_d_causales_desembargo',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and slctud_fncnrio = ''S'''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista la causal de desembargo a aplicar. '
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12158754234025441)
,p_name=>'P116_TPO_SLCTUD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(12156077033025431)
,p_item_source_plug_id=>wwv_flow_api.id(12156077033025431)
,p_item_default=>'FN'
,p_source=>'TPO_SLCTUD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12159121632025442)
,p_name=>'P116_ID_FNCNRIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(12156077033025431)
,p_item_source_plug_id=>wwv_flow_api.id(12156077033025431)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select u.id_fncnrio',
'  from v_sg_g_usuarios u',
' where u.id_usrio = :F_ID_USRIO;'))
,p_item_default_type=>'SQL_QUERY'
,p_source=>'ID_FNCNRIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12384727607040420)
,p_name=>'P116_IDNTFCCION_RSPNSBLE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(12156077033025431)
,p_use_cache_before_default=>'NO'
,p_item_default=>'1065376176'
,p_source=>'IDNTFCCION_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12162485283025444)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(12162340870025444)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12163237031025450)
,p_event_id=>wwv_flow_api.id(12162485283025444)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12165514171025452)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(12156077033025431)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Procesar pantalla Crear Pantalla'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>'Registro exitoso.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12165918898025452)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>unistr('Cerrar Recuadro de Di\00E1logo')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(153792020559278303)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar_Datos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_resolucion number;',
'  v_id_dsmbrgo_slctud number;',
'begin',
'  insert into mc_g_desembargos_solicitud ',
'              (  CDGO_CLNTE',
'                , DRCCION_ENVIO',
'                , ESTADO_SLCTUD',
'                , FCHA_SLCTUD',
'                , ID_CSLES_DSMBRGO',
'                , ID_EMBRGOS_RSLCION',
'                , ID_FNCNRIO',
'                , IDNTFCCION_RSPNSBLE',
'                , NMBRE_RSPNSBLE',
'                , NMRO_CPIAS',
'                , OBSRVCION',
'                , TPO_SLCTUD)',
'          values',
'                ( :F_CDGO_CLNTE',
'                , :DRCCION_ENVIO',
'                , :P116_ESTADO_SLCTUD',
'                , sysdate',
'                , :P116_ID_CSLES_DSMBRGO',
'                , :P116_ID_EMBRGOS_RSLCION',
'                , :P116_ID_FNCNRIO',
'                , :IDNTFCCION_RSPNSBLE',
'                , :NMBRE_RSPNSBLE',
'                , :NMRO_CPIAS',
'                , :P116_OBSRVCION',
'                , ''FN'')',
'        returning id_dsmbrgo_slctud into v_id_dsmbrgo_slctud;',
'        ',
'        for c_datos in (select *',
'                      from v_mc_g_solicitudes_y_oficios a',
'                     where a.id_embrgos_rslcion = :P116_ID_EMBRGOS_RSLCION) loop',
'                     ',
'                     insert into mc_g_dsmbrgs_slctd_entdds',
'                     (  ID_DSMBRGO_SLCTUD',
'                        ,ID_EMBRGOS_RSLCION',
'                        ,ID_ENTDDES',
'                        ,ID_SLCTD_OFCIO) ',
'                     values',
'                     (  v_id_dsmbrgo_slctud',
'                      , :P116_ID_EMBRGOS_RSLCION',
'                      , c_datos.ID_ENTDDES',
'                      , c_datos.ID_SLCTD_OFCIO',
'                     );',
'        end loop;',
'     exception when others then',
unistr('      raise_application_error(-20001, ''No se pudo realizar la inserci\00F3n: ''||SQLERRM);'),
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12165186453025452)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(12156077033025431)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Inicializar pantalla Crear Pantalla'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
