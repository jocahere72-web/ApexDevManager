prompt --application/pages/page_00119
begin
wwv_flow_api.create_page(
 p_id=>119
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Datos Causal de Desembargo'
,p_page_mode=>'MODAL'
,p_step_title=>'Datos Causal de Desembargo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'ABRACHE'
,p_last_upd_yyyymmddhh24miss=>'20200111160235'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55070817559137494)
,p_plug_name=>'Crear Pantalla'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17335434580919364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'MC_G_DESEMBARGOS_SOPORTE'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55077038568137638)
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
 p_id=>wwv_flow_api.id(55112418466350817)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_api.id(55070817559137494)
,p_button_name=>'btn_pagos'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Buscar Pagos'
,p_button_position=>'BODY'
,p_button_condition=>'P119_CDGO_CSAL'
,p_button_condition2=>'P'
,p_button_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="top:25px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55112779169353620)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_api.id(55070817559137494)
,p_button_name=>'btn_ajustes'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Buscar Ajustes'
,p_button_position=>'BODY'
,p_button_condition=>'P119_CDGO_CSAL'
,p_button_condition2=>'A'
,p_button_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="top:25px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55113095494355017)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_api.id(55070817559137494)
,p_button_name=>'btn_convenios'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Buscar Convenio'
,p_button_position=>'BODY'
,p_button_condition=>'P119_CDGO_CSAL'
,p_button_condition2=>'C'
,p_button_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="top:25px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55077422146137641)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(55077038568137638)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55079077631137658)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(55077038568137638)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P119_ID_DSMBRGO_SPRTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55079492789137658)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(55077038568137638)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P119_ID_DSMBRGO_SPRTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55079821768137658)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(55077038568137638)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P119_ID_DSMBRGO_SPRTE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(50350160840541127)
,p_branch_name=>unistr('Ir a P\00E1gina 105')
,p_branch_action=>'f?p=&APP_ID.:105:&SESSION.::&DEBUG.:RP,105:P105_ID_EMBRGOS_CRTRA,P105_ID_DSMBRGO_SPRTE,P105_ID_DSMBRGOS_RSLCION:&P119_ID_EMBRGOS_CRTRA.,&P119_ID_DSMBRGO_SPRTE.,&P119_ID_DSMBRGOS_RSLCION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(55112418466350817)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(50350273755541128)
,p_branch_name=>unistr('Ir a P\00E1gina 106')
,p_branch_action=>'f?p=&APP_ID.:106:&SESSION.::&DEBUG.:RP,106:P106_ID_EMBRGOS_CRTRA:&P119_ID_EMBRGOS_CRTRA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(55112779169353620)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(50350385584541129)
,p_branch_name=>unistr('Ir a P\00E1gina 107')
,p_branch_action=>'f?p=&APP_ID.:107:&SESSION.::&DEBUG.:RP,107:P107_ID_EMBRGOS_CRTRA:&P119_ID_EMBRGOS_CRTRA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(55113095494355017)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50349606428541122)
,p_name=>'P119_CDGO_CSAL'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(55070817559137494)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50350008377541126)
,p_name=>'P119_ID_EMBRGOS_CRTRA'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(55070817559137494)
,p_prompt=>'Nuevo'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(17408571111919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55071114371137503)
,p_name=>'P119_ID_DSMBRGO_SPRTE'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(55070817559137494)
,p_item_source_plug_id=>wwv_flow_api.id(55070817559137494)
,p_prompt=>'Nuevo'
,p_source=>'ID_DSMBRGOS_RSLCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(17408571111919398)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55071566474137543)
,p_name=>'P119_ID_DSMBRGOS_RSLCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(55070817559137494)
,p_item_source_plug_id=>wwv_flow_api.id(55070817559137494)
,p_prompt=>'Nuevo'
,p_source=>'ID_DSMBRGOS_RSLCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(17408571111919398)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55071940747137546)
,p_name=>'P119_ID_CSLES_DSMBRGO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(55070817559137494)
,p_item_source_plug_id=>wwv_flow_api.id(55070817559137494)
,p_prompt=>'Causal de Desembargo'
,p_source=>'ID_CSLES_DSMBRGO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55072709694137547)
,p_name=>'P119_NMRO_DCMNTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(55070817559137494)
,p_item_source_plug_id=>wwv_flow_api.id(55070817559137494)
,p_prompt=>'Numero de Documento'
,p_source=>'NMRO_DCMNTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_colspan=>3
,p_display_when=>'P119_CDGO_CSAL'
,p_display_when2=>'C:P:A:T'
,p_display_when_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55073145918137547)
,p_name=>'P119_FCHA_DCMNTO'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(55070817559137494)
,p_item_source_plug_id=>wwv_flow_api.id(55070817559137494)
,p_prompt=>'Fecha Documento'
,p_source=>'FCHA_DCMNTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when=>'P119_CDGO_CSAL'
,p_display_when2=>'C:P:A:T'
,p_display_when_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55073800979137631)
,p_name=>'P119_NMRO_OFCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(55070817559137494)
,p_item_source_plug_id=>wwv_flow_api.id(55070817559137494)
,p_prompt=>'Numero de Oficio'
,p_source=>'NMRO_OFCIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_colspan=>3
,p_display_when=>'P119_CDGO_CSAL'
,p_display_when2=>'T'
,p_display_when_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_field_template=>wwv_flow_api.id(17408571111919398)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55074281095137631)
,p_name=>'P119_VLOR_DCMNTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(55070817559137494)
,p_item_source_plug_id=>wwv_flow_api.id(55070817559137494)
,p_prompt=>'Valor Documento'
,p_source=>'VLOR_DCMNTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when=>'P119_CDGO_CSAL'
,p_display_when2=>'T'
,p_display_when_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_field_template=>wwv_flow_api.id(17408571111919398)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(50349723017541123)
,p_computation_sequence=>10
,p_computation_item=>'P119_CDGO_CSAL'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_csal',
'from mc_d_causales_desembargo',
'WHERE cdgo_clnte = :F_CDGO_CLNTE',
'and id_csles_dsmbrgo = :P119_ID_CSLES_DSMBRGO;'))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(55073507622137580)
,p_validation_name=>'P119_FCHA_DCMNTO must be timestamp'
,p_validation_sequence=>50
,p_validation=>'P119_FCHA_DCMNTO'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>unistr('#LABEL# debe ser un registro de hora v\00E1lido.')
,p_associated_item=>wwv_flow_api.id(55073145918137547)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(55119301958443275)
,p_validation_name=>'Validar veracidad de datos de soporte de causales'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'v_documento number := 0;',
'',
'begin',
'',
'    if :P119_CDGO_CSAL = ''P'' then',
'    ',
'        begin ',
'            select distinct a.NMRO_DCMNTO',
'              into v_documento',
'              from v_re_g_recaudos a',
'              join mc_g_embargos_sjto b on A.id_sjto = b.id_sjto ',
'                                       and b.id_embrgos_crtra = :P119_ID_EMBRGOS_CRTRA',
'             where A.cdgo_clnte = :F_CDGO_CLNTE',
'               and a.NMRO_DCMNTO = :P119_NMRO_DCMNTO;',
'               ',
'        exception when others then',
'            v_documento := 0;',
'        end;',
'        ',
'        if v_documento > 0 then',
'            return true;',
'        else',
'            return false;',
'        end if;',
'    ',
'    elsif :P119_CDGO_CSAL = ''C'' then',
'        begin ',
'            select a.NMRO_CNVNIO',
'              into v_documento',
'              from v_gf_g_convenios a',
'              join mc_g_embargos_sjto b on A.id_sjto = b.id_sjto and b.id_embrgos_crtra = :P119_ID_EMBRGOS_CRTRA',
'             where a.cdgo_cnvnio_estdo = ''APL''',
'               and A.cdgo_clnte = :F_CDGO_CLNTE',
'               and a.NMRO_CNVNIO = :P119_NMRO_DCMNTO',
'               and exists (select 1',
'                             from mc_g_embargos_cartera_detalle c',
'                             join gf_g_convenios_cartera d on D.vgncia = C.vgncia',
'                                                          and D.id_prdo = C.id_prdo',
'                                                          and D.id_cncpto = C.id_cncpto',
'                            where c.id_embrgos_crtra = b.id_embrgos_crtra);',
'               ',
'        exception when others then',
'            v_documento := 0;',
'        end;',
'        ',
'        if v_documento > 0 then',
'            return true;',
'        else',
'            return false;',
'        end if;',
'    elsif :P66_CDGO_CSAL = ''A'' then',
'        begin ',
'            ',
'            select distinct a.numro_ajste',
'              into v_documento',
'              from v_gf_g_ajustes a',
'              join mc_g_embargos_sjto b on A.id_sjto = b.id_sjto ',
'                                       and b.id_embrgos_crtra = :P119_ID_EMBRGOS_CRTRA',
'             where A.cdgo_clnte = :F_CDGO_CLNTE',
'               and a.numro_ajste = :P119_NMRO_DCMNTO;',
'                            ',
'        exception when others then',
'            v_documento := 0;',
'        end;',
'        ',
'        if v_documento > 0 then',
'            return true;',
'        else',
'            return false;',
'        end if;',
'    else',
'        return true;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El numero de documento de soporte de la causal no concuerda con uno asociado a la cartera del embargo.'
,p_validation_condition=>'SAVE,CREATE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(55119674297446619)
,p_validation_name=>unistr('Validar que los datos de soporte est\00E9n llenos')
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    if :P119_CDGO_CSAL in (''P'',''C'',''A'')then',
'    ',
'        if (:P119_NMRO_DCMNTO is null or :P119_FCHA_DCMNTO is null) then',
'            return ''Debe ingresar los datos de numero y fecha de documento.'';',
'        else',
'            return null;',
'        end if;',
'    ',
'    elsif :P119_CDGO_CSAL = ''T'' then',
'        if (:P119_NMRO_DCMNTO is null or :P119_FCHA_DCMNTO is null or :P119_NMRO_OFCIO is null or :P119_VLOR_DCMNTO is null) then',
'            return ''Debe ingresar los datos de numero y fecha de documento, numero de oficio y valor del documento.'';',
'        else',
'            return null;',
'        end if;',
'    else',
'        return null;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'SAVE,CREATE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(55077525665137641)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(55077422146137641)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(55078314130137656)
,p_event_id=>wwv_flow_api.id(55077525665137641)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50351014912541136)
,p_name=>'Al cambiar causal'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P119_ID_CSLES_DSMBRGO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50351138195541137)
,p_event_id=>wwv_flow_api.id(50351014912541136)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P119_NMRO_DCMNTO,P119_FCHA_DCMNTO,P119_NMRO_OFCIO,P119_VLOR_DCMNTO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(50352166214541147)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(55070817559137494)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>unistr('Pantalla - Procesamiento autom\00E1tico de filas (DML)')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE,DELETE,CREATE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55080986281137679)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>unistr('Cerrar Recuadro de Di\00E1logo')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55080213402137659)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(55070817559137494)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Inicializar pantalla Crear Pantalla'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
