prompt --application/pages/page_00167
begin
wwv_flow_api.create_page(
 p_id=>167
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Configuraciones de Plusval\00EDa')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Configuraciones de Plusval\00EDa')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_protection_level=>'C'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20201006135736'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112515445024773709)
,p_plug_name=>unistr('Configuraciones Plusval\00EDa')
,p_region_name=>'configuraciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(93095004321987686)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(112515445024773709)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(93095486611987687)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(112515445024773709)
,p_button_name=>'CREATE'
,p_button_static_id=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P167_ID_PLSV_CNFGRCION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(93095897784987687)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(112515445024773709)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P167_ID_PLSV_CNFGRCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(93096250467987688)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(112515445024773709)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de eliminar la configuraciÃ³n?'',''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P167_ID_PLSV_CNFGRCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(93117007438987808)
,p_branch_name=>unistr('Ir a P\00E1gina 166')
,p_branch_action=>'f?p=&APP_ID.:166:&SESSION.::&DEBUG.:167::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93096687699987688)
,p_name=>'P167_ID_PLSV_CNFGRCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(112515445024773709)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_PLSVLIA_CNFGRCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93097099741987708)
,p_name=>'P167_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(112515445024773709)
,p_use_cache_before_default=>'NO'
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93097419222987708)
,p_name=>'P167_INDCDOR_MDFCA_ARCHVO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(112515445024773709)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFModifica todos los<br>registros del archivo?')
,p_source=>'INDCDOR_MDFCA_ARCHVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si la renta a liquidar ser\00E1 de origen privado y p\00FAblico.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93103776068987732)
,p_name=>'P167_ID_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(112515445024773709)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93104138761987733)
,p_name=>'P167_USER_DGTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(112515445024773709)
,p_use_cache_before_default=>'NO'
,p_source=>'USER_DGTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93104500094987733)
,p_name=>'P167_FCHA_DGTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(112515445024773709)
,p_use_cache_before_default=>'NO'
,p_source=>'FCHA_DGTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93104928180987733)
,p_name=>'P167_USER_MDFCA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(112515445024773709)
,p_use_cache_before_default=>'NO'
,p_source=>'USER_MDFCA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93105358186987733)
,p_name=>'P167_FCHA_MDFCA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(112515445024773709)
,p_use_cache_before_default=>'NO'
,p_source=>'FCHA_MDFCA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93517890654184906)
,p_name=>'P167_BNCO_RCDDOR'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(112515445024773709)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Banco<br>Recaudador'
,p_source=>'BNCO_RCDDOR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_bnco as d,',
'       id_bnco as r',
'  from df_c_bancos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_bnco in ( select cdna ',
'                      from table ( pkg_gn_generalidades.fnc_ca_split_table ( p_cdna => :P167_BNCO_RCDDOR, ',
'													                         p_crcter_dlmtdor => '':''  ) ) ) ',
'union',
'select nmbre_bnco,',
'       id_bnco',
'  from df_c_bancos',
' where cdgo_clnte = :F_CDGO_CLNTE',
';'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Indica si la renta a liquidar ser\00E1 de origen privado y p\00FAblico.')
,p_attribute_01=>'MULTI'
,p_attribute_08=>'CIC'
,p_attribute_10=>'70%'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(93112968437987803)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Secuencia'
,p_process_sql_clob=>':P167_ID_PLSV_CNFGRCION := sq_gi_d_plusvalia_configurcion.nextval(); '
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(93095486611987687)
,p_process_when=>'P167_ID_PLSV_CNFGRCION'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(92955141197064510)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select a.id_impsto',
'    into :P167_ID_IMPSTO',
'    from df_c_impuestos  a',
'   where a.cdgo_clnte   = :F_CDGO_CLNTE',
'     and a.cdgo_impsto  = ''PLU'';'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(93113753480987803)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Procesar pantalla configuraciones'
,p_attribute_02=>'GI_D_PLUSVALIA_CONFIGURCION'
,p_attribute_03=>'P167_ID_PLSV_CNFGRCION'
,p_attribute_04=>'ID_PLSVLIA_CNFGRCION'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('\00A1Petici\00F3n Procesada!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(93113329564987803)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Inicializar pantalla configuraciones'
,p_attribute_02=>'GI_D_PLUSVALIA_CONFIGURCION'
,p_attribute_03=>'P167_ID_PLSV_CNFGRCION'
,p_attribute_04=>'ID_PLSVLIA_CNFGRCION'
);
end;
/
