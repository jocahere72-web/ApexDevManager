prompt --application/pages/page_00357
begin
wwv_flow_api.create_page(
 p_id=>357
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Configuraciones Cliente Acuerdos Pago'
,p_step_title=>'Configuraciones Cliente'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20220318140225'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(171512287452140902)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(171512454900140903)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'    <p align="justify">Funcionalidad que permite consultar las diferentes configuraciones de cada cliente conforme al proceso de Acuerdos de Pago.</p><br>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(253046328024141406)
,p_plug_name=>unistr('<b>CONFIGURACI\00D3N DE ACUERDOS DE PAGO</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(152207858449353943)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(171512287452140902)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(152192204100353883)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(253046328024141406)
,p_button_name=>'SAVE'
,p_button_static_id=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P357_ID_CNVNIO_CNFGRCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(152192696090353905)
,p_name=>'P357_ID_CNVNIO_CNFGRCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(253046328024141406)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_CNVNIO_CNFGRCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(152193406954353920)
,p_name=>'P357_CDGO_CLNTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(253046328024141406)
,p_use_cache_before_default=>'NO'
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(152201045169353926)
,p_name=>'P357_INDCDOR_CNVNIO_CRTRA_RVCDA'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(253046328024141406)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>\00BFPermite Acuerdos de pago a Carteras Revocadas?</b>')
,p_source=>'INDCDOR_CNVNIO_CRTRA_RVCDA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indica si para el cliente se puede realizar Acuerdos de Pago a Carteras que han sido Revocadas'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(152203755319353933)
,p_name=>'P357_USER_DGTA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(253046328024141406)
,p_use_cache_before_default=>'NO'
,p_source=>'USER_DGTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(152204179867353933)
,p_name=>'P357_FCHA_DGTA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(253046328024141406)
,p_use_cache_before_default=>'NO'
,p_source=>'FCHA_DGTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(152204571419353933)
,p_name=>'P357_USER_MDFCA'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(253046328024141406)
,p_use_cache_before_default=>'NO'
,p_source=>'USER_MDFCA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(152204964892353933)
,p_name=>'P357_FCHA_MDFCA'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(253046328024141406)
,p_use_cache_before_default=>'NO'
,p_source=>'FCHA_MDFCA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(152252999977390801)
,p_name=>'P357_INDCDOR_CNV_RVCD_OTRS_VGNC'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(253046328024141406)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>\00BFPermite Acuerdos de pago con Saldo en Carteras Revocadas?</b>')
,p_source=>'INDCDOR_CNV_RVCD_OTRS_VGNC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si para el cliente se podr\00E1n realizar Acuerdos de Pago a otras vigencas a\00FAn teniendo saldo en las Carteras Revocadas.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(152209470291353971)
,p_computation_sequence=>20
,p_computation_item=>'P357_ID_CNVNIO_CNFGRCION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_CNVNIO_CNFGRCION',
'from GF_D_CONVENIOS_CNFGRCION',
'where cdgo_clnte = :F_CDGO_CLNTE'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(152214784000353990)
,p_name=>unistr('Tipos de Liquidaci\00F3n')
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P357_INDCDOR_USA_MXTO'
,p_condition_element=>'P357_INDCDOR_USA_MXTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(152215249695353991)
,p_event_id=>wwv_flow_api.id(152214784000353990)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P357_PRCNTJE_LQDCION_PRVDO,P357_PRCNTJE_LQDCION_PBLCO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(152215779977353991)
,p_event_id=>wwv_flow_api.id(152214784000353990)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P357_PRCNTJE_LQDCION_PRVDO,P357_PRCNTJE_LQDCION_PBLCO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(152216206042353991)
,p_event_id=>wwv_flow_api.id(152214784000353990)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P357_PRCNTJE_LQDCION_PRVDO,,P357_PRCNTJE_LQDCION_PBLCO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(152212915568353981)
,p_name=>'Definiciones Extranjero'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P357_INDCDOR_USA_EXTRNJRO'
,p_condition_element=>'P357_INDCDOR_USA_EXTRNJRO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(152213377009353987)
,p_event_id=>wwv_flow_api.id(152212915568353981)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P357_TPO_DIAS,P357_DIAS_MRGN_MRA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(152213837986353989)
,p_event_id=>wwv_flow_api.id(152212915568353981)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P357_TPO_DIAS,P357_DIAS_MRGN_MRA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(152214340301353990)
,p_event_id=>wwv_flow_api.id(152212915568353981)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P357_DIAS_MRGN_MRA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(152216639549353991)
,p_name=>unistr('Mostrar el intervalo de d\00EDas si el n\00FAmero de documentos a generar es mayor que 1')
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P357_NMRO_DCMNTOS'
,p_condition_element=>'P357_NMRO_DCMNTOS'
,p_triggering_condition_type=>'GREATER_THAN'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(152217141087353992)
,p_event_id=>wwv_flow_api.id(152216639549353991)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P357_INTRVLO_DIAS'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(152217642998353992)
,p_event_id=>wwv_flow_api.id(152216639549353991)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P357_INTRVLO_DIAS'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(152212534491353981)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Procesar pantalla configuraciones'
,p_attribute_02=>'GF_D_CONVENIOS_CNFGRCION'
,p_attribute_03=>'P357_ID_CNVNIO_CNFGRCION'
,p_attribute_04=>'ID_CNVNIO_CNFGRCION'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('\00A1Petici\00F3n Procesada!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(152212188329353980)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Inicializar pantalla configuraciones'
,p_attribute_02=>'GF_D_CONVENIOS_CNFGRCION'
,p_attribute_03=>'P357_ID_CNVNIO_CNFGRCION'
,p_attribute_04=>'ID_CNVNIO_CNFGRCION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(152211742156353978)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Configuracion Rentas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'	select ',
'          id_cnvnio_cnfgrcion    ',
'        , cdgo_clnte           ',
'        , indcdor_cnvnio_crtra_rvcda',
'        , indcdor_cnv_rvcd_otrs_vgnc      ',
'        , user_dgta            ',
'        , fcha_dgta            ',
'        , user_mdfca           ',
'        , fcha_mdfca    ',
'	INTO',
'          :P357_ID_CNVNIO_CNFGRCION',
'        , :P357_CDGO_CLNTE ',
'        , :P357_INDCDOR_CNVNIO_CRTRA_RVCDA',
'        , :P357_INDCDOR_CNV_RVCD_OTRS_VGNC',
'        , :P357_USER_DGTA            ',
'        , :P357_FCHA_DGTA            ',
'        , :P357_USER_MDFCA           ',
'        , :P357_FCHA_MDFCA    ',
'    from gf_d_convenios_cnfgrcion',
'	where cdgo_clnte = :F_CDGO_CLNTE;',
'end;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
