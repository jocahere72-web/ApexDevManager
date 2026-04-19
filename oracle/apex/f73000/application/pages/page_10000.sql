prompt --application/pages/page_10000
begin
wwv_flow_api.create_page(
 p_id=>10000
,p_user_interface_id=>wwv_flow_api.id(76451776849582525)
,p_name=>'Adjuntos'
,p_page_mode=>'MODAL'
,p_step_title=>'Nuevo adjunto'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20251126093950'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(208961412051123604)
,p_plug_name=>'Adjuntos'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(76356263645582458)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'GN_G_ADJUNTOS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(208971989336123671)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(76357285744582459)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(208972325541123671)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(208971989336123671)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>wwv_flow_api.id(76429829180582502)
,p_button_image_alt=>'Cancelar / Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(208973843932123703)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(208971989336123671)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(76429829180582502)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(208974264127123703)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(208971989336123671)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(76429829180582502)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gn_g_adjuntos',
'where id_adjnto = :P10000_ID_ADJNTO'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(208974636969123715)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(208971989336123671)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(76429829180582502)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gn_g_adjuntos',
'where id_adjnto = :P10000_ID_ADJNTO'))
,p_button_condition_type=>'NOT_EXISTS'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(142105801581294108)
,p_branch_name=>'Go To Page'
,p_branch_action=>'f?p=&P10000_APP.:&P10000_PAGE.:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(208972325541123671)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55882335579721108)
,p_name=>'P10000_RESPUESTA'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(208961412051123604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55882430983721109)
,p_name=>'P10000_CDGO_RSPSTA'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(208961412051123604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(142105551152294105)
,p_name=>'P10000_APP'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(208961412051123604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(142105676052294106)
,p_name=>'P10000_PAGE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(208961412051123604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(142106096298294110)
,p_name=>'P10000_BRANCH'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(208961412051123604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(208961748665123617)
,p_name=>'P10000_ID_ADJNTO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(208961412051123604)
,p_item_source_plug_id=>wwv_flow_api.id(208961412051123604)
,p_source=>'ID_ADJNTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(208962138501123644)
,p_name=>'P10000_CDGO_PRCSO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(208961412051123604)
,p_item_source_plug_id=>wwv_flow_api.id(208961412051123604)
,p_prompt=>'Proceso'
,p_source=>'CDGO_PRCSO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    cdgo_prcso || '' - '' || nmbre_prcso d,',
'    cdgo_prcso  v',
'from df_c_procesos',
'where cdgo_clnte = :F_CDGO_CLNTE',
'order by 1 '))
,p_lov_display_null=>'YES'
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(76429618671582500)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'70%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(208962574152123645)
,p_name=>'P10000_ID_ADJNTO_TPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(208961412051123604)
,p_item_source_plug_id=>wwv_flow_api.id(208961412051123604)
,p_prompt=>'Tipo de adjunto'
,p_source=>'ID_ADJNTO_TPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    b.cdgo_adjnto_tpo || '' - '' || b.dscrpcion d,',
'    b.id_adjnto_tpo  v',
'from gn_d_procesos_adjunto_tipo a',
'join gn_d_adjuntos_tipo b on b.id_adjnto_tpo = a.id_adjnto_tpo ',
'where a.cdgo_prcso = :P10000_CDGO_PRCSO',
'order by 1 '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P10000_CDGO_PRCSO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(76429586900582500)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'70%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(208962940210123651)
,p_name=>'P10000_CDGO_ORGEN_TPO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(208961412051123604)
,p_item_source_plug_id=>wwv_flow_api.id(208961412051123604)
,p_source=>'CDGO_ORGEN_TPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(208963321238123652)
,p_name=>'P10000_ID_ORGEN'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(208961412051123604)
,p_item_source_plug_id=>wwv_flow_api.id(208961412051123604)
,p_source=>'ID_ORGEN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(208963739853123652)
,p_name=>'P10000_ID_INSTNCIA_FLJO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(208961412051123604)
,p_item_source_plug_id=>wwv_flow_api.id(208961412051123604)
,p_source=>'ID_INSTNCIA_FLJO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(208964150642123652)
,p_name=>'P10000_ID_FLJO_TREA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(208961412051123604)
,p_item_source_plug_id=>wwv_flow_api.id(208961412051123604)
,p_source=>'ID_FLJO_TREA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(208964552017123652)
,p_name=>'P10000_FCHA_RGSTRO'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(208961412051123604)
,p_item_source_plug_id=>wwv_flow_api.id(208961412051123604)
,p_prompt=>unistr('\00DAltima fecha de Registro')
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'FCHA_RGSTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(76429618671582500)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(208965367254123665)
,p_name=>'P10000_OBSRVCION'
,p_source_data_type=>'CLOB'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(208961412051123604)
,p_item_source_plug_id=>wwv_flow_api.id(208961412051123604)
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSRVCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>255
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(76429315276582500)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(208965719865123666)
,p_name=>'P10000_FILE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(208961412051123604)
,p_item_source_plug_id=>wwv_flow_api.id(208961412051123604)
,p_prompt=>'Nombre de Archivo'
,p_source=>'FILE_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_field_template=>wwv_flow_api.id(76429315276582500)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(208966153046123666)
,p_name=>'P10000_FILE_MIMETYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(208961412051123604)
,p_item_source_plug_id=>wwv_flow_api.id(208961412051123604)
,p_source=>'FILE_MIMETYPE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(208966963523123668)
,p_name=>'P10000_FILE_BLOB'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(208961412051123604)
,p_prompt=>'Seleccionar archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(76429315276582500)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(208967365221123668)
,p_name=>'P10000_ID_USRIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(208961412051123604)
,p_item_source_plug_id=>wwv_flow_api.id(208961412051123604)
,p_item_default=>'F_ID_USRIO'
,p_item_default_type=>'ITEM'
,p_source=>'ID_USRIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(16014915820491601)
,p_validation_name=>'Tipo de Adjunto no nullo'
,p_validation_sequence=>10
,p_validation=>'P10000_ID_ADJNTO_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor seleccione un Tipo de Adjunto'
,p_when_button_pressed=>wwv_flow_api.id(208974636969123715)
,p_associated_item=>wwv_flow_api.id(208962574152123645)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(208972489880123671)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(208972325541123671)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(208973234963123696)
,p_event_id=>wwv_flow_api.id(208972489880123671)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55881857992721103)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Antes de Insertar Adjunto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	c_adjunto apex_application_temp_files%rowtype;',
'	v_directorio	varchar2(255) := ''TS_ADJUNTOS'';',
'	v_file_name		varchar2(255);',
'	v_file_bfile	bfile;',
'    ',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar2(2000); ',
'	v_sqlerrm        varchar2(1000);',
'begin',
'    :P10000_ID_ADJNTO        := sq_gn_g_adjuntos.nextval;',
'',
'	select * into c_adjunto',
'	from apex_application_temp_files',
'	where name = :P10000_FILE_BLOB;',
'',
'	-- a.id			-- a.application_id		-- a.name			-- a.filename	',
'	-- a.mime_type	-- a.created_on			-- a.blob_content',
'	',
'	v_file_name := :P10000_CDGO_PRCSO || ''_'' || :P10000_CDGO_ORGEN_TPO || ''_ADJ_'' || :P10000_ID_ADJNTO || ''_'' || c_adjunto.filename;',
'    ',
'    :P10000_FILE_NAME := v_file_name;',
'    :P10000_FILE_MIMETYPE := c_adjunto.mime_type;',
'    :P10000_ID_USRIO := :F_ID_USRIO;',
'	',
'    v_file_bfile := bfilename( v_directorio, v_file_name );',
'    ',
'    pkg_gd_utilidades.prc_rg_dcmnto_dsco (',
'                                p_blob          => c_adjunto.blob_content',
'                              , p_directorio    => v_directorio',
'                              , p_nmbre_archvo  => v_file_name',
'                              , o_cdgo_rspsta   => v_cdgo_rspsta',
'                              , o_mnsje_rspsta  => v_mnsje_rspsta);',
'',
'    :P10000_CDGO_RSPSTA := v_cdgo_rspsta;',
'    :P10000_RESPUESTA   := v_mnsje_rspsta;',
'exception',
'    when others then',
'        v_sqlerrm := ''Antes de insertar: '' || sqlerrm;',
'        :P10000_RESPUESTA := v_sqlerrm;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(208974636969123715)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(208975469207123722)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(208961412051123604)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Create Form'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P10000_CDGO_RSPSTA'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'0'
,p_process_success_message=>unistr('Acci\00F3n Satisfactoria')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55882100048721106)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Despues de Insertar Adjunto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	c_adjunto apex_application_temp_files%rowtype;',
'	v_directorio	varchar2(255) := ''TS_ADJUNTOS'';',
'	v_file_name		varchar2(255);',
'	v_file_bfile	bfile;',
'    v_sqlerrm        varchar2(1000);',
'	',
'begin',
'',
'	select * into c_adjunto',
'	from apex_application_temp_files',
'	where name = :P10000_FILE_BLOB;',
'',
'	-- a.id			-- a.application_id		-- a.name			-- a.filename	',
'	-- a.mime_type	-- a.created_on			-- a.blob_content',
'	',
'	--:P10000_FILE_NAME := :P10000_CDGO_PRCSO || ''_'' || :P10000_CDGO_ORGEN_TPO || ''_ADJ_'' || :P10000_ID_ADJNTO || ''_'' || c_adjunto.filename;',
'	',
'    v_file_bfile := bfilename( v_directorio, :P10000_FILE_NAME );',
'    ',
'    update gn_g_adjuntos',
'    set file_bfile = v_file_bfile',
'    where id_adjnto = :P10000_ID_ADJNTO;',
'    ',
'    ',
'exception',
'    when others then',
'        v_sqlerrm := ''Despues de insertar: '' || sqlerrm;',
'        :P10000_RESPUESTA := v_sqlerrm;    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(208974636969123715)
,p_process_when=>'P10000_CDGO_RSPSTA'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'0'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(208975816695123723)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(208975063566123716)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(208961412051123604)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Create Form'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gn_g_adjuntos',
'where id_adjnto = :P10000_ID_ADJNTO'))
,p_process_when_type=>'EXISTS'
);
end;
/
