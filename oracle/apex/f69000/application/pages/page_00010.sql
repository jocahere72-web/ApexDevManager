prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>'Masivo de Novedades'
,p_step_title=>'Masivo de Novedades'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20191108164451'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(116351092948254020)
,p_plug_name=>'Workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(217069795586617732)
,p_plug_name=>unistr('<b>Datos b\00E1sicos de Novedades</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:margin-bottom-sm'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'EXISTS'
,p_plug_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1 ',
'   from wf_g_instancias_transicion',
'  where id_instncia_fljo   = :F_ID_INSTNCIA_FLJO',
'    and id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'    and id_estdo_trnscion  = 3'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109584782772282622)
,p_name=>'P10_NMRO_ACTO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(217069795586617732)
,p_prompt=>unistr('N\00FAmero Acto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111375076092941933)
,p_name=>'P10_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(217069795586617732)
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
,p_lov_null_text=>'Seleccione Tributo'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'350'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111375437504941938)
,p_name=>'P10_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(217069795586617732)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d',
'    , id_impsto_sbmpsto as r',
' from df_i_impuestos_subimpuesto',
'where cdgo_clnte = :F_CDGO_CLNTE',
'  and id_impsto  = :P10_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Sub-Impuesto'
,p_lov_cascade_parent_items=>'P10_ID_IMPSTO'
,p_ajax_items_to_submit=>'P10_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'350'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111375853349941938)
,p_name=>'P10_ID_ACTO_TPO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(217069795586617732)
,p_prompt=>'Tipo de Acto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion, id_acto_tpo',
'from gn_d_actos_tipo',
'where cdgo_acto_tpo in (''ACD'',''ACE'',''ACU'')',
'and cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Tipo Acto'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'auto'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111376271018941938)
,p_name=>'P10_ID_ENTDAD_NVDAD'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(217069795586617732)
,p_prompt=>'Entidad'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion, id_entdad_nvdad',
'from df_i_entidades_novedad',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and id_impsto = :P10_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Entidad'
,p_lov_cascade_parent_items=>'P10_ID_IMPSTO'
,p_ajax_items_to_submit=>'P10_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'auto'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111376691204941939)
,p_name=>'P10_FCHA_INCIO_APLCCION'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(217069795586617732)
,p_item_default=>'''01/01/'' || to_char( sysdate , ''YYYY'' )'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>unistr('Fecha de Aplicaci\00F3n')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(119698120935140002)
,p_name=>'P10_CDGO_ACTO_TPO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(217069795586617732)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123911059011788502)
,p_name=>'P10_FCHA_DCMNTO_SPRTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(217069795586617732)
,p_item_default=>'''01/01/'' || to_char( sysdate , ''YYYY'' )'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Acto'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(114287604426934336)
,p_name=>'HabilitarDatosMasivos'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_HBLTAR_DTOS_MSVOS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(114287879869934338)
,p_event_id=>wwv_flow_api.id(114287604426934336)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'habilitarCamposMasivos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(114432719405339917)
,p_name=>'IndicarSiDestinoUsaEstrato'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_ID_PRDIO_DSTNO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(114432857255339918)
,p_event_id=>wwv_flow_api.id(114432719405339917)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select d.indcdor_usa_estrto',
'      into :P10_INDCDOR_USA_ESTRTO',
'      from df_i_predios_destino d',
'     where d.cdgo_clnte = :F_CDGO_CLNTE',
'       and d.id_impsto = :P10_ID_IMPSTO',
'       and d.id_prdio_dstno = :P10_ID_PRDIO_DSTNO;',
'exception',
'    when no_data_found then',
'        :P10_INDCDOR_USA_ESTRTO := ''N'';',
'end;'))
,p_attribute_02=>'P10_INDCDOR_USA_ESTRTO,P10_ID_PRDIO_DSTNO'
,p_attribute_03=>'P10_INDCDOR_USA_ESTRTO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(114433238951339922)
,p_name=>'ActivarEstratoMasivo'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_INDCDOR_USA_ESTRTO'
,p_condition_element=>'P10_INDCDOR_USA_ESTRTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(114433384410339923)
,p_event_id=>wwv_flow_api.id(114433238951339922)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P10_CDGO_ESTRTO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(114433441148339924)
,p_event_id=>wwv_flow_api.id(114433238951339922)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P10_CDGO_ESTRTO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(119679670773013458)
,p_name=>'setearCodigoTipoActoSeleccionado'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_ID_ACTO_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(119680035810013461)
,p_event_id=>wwv_flow_api.id(119679670773013458)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_acto_tpo    gn_d_actos_tipo.cdgo_acto_tpo%type;',
'begin',
'    ',
'    select a.cdgo_acto_tpo',
'      into v_cdgo_acto_tpo',
'      from gn_d_actos_tipo a',
'     where a.cdgo_clnte = :F_CDGO_CLNTE',
'       and a.id_acto_tpo = :P10_ID_ACTO_TPO;',
'       ',
'    APEX_UTIL.SET_SESSION_STATE (',
'            p_name     => ''P10_CDGO_ACTO_TPO'',',
'            p_value    => v_cdgo_acto_tpo);',
'    ',
'exception',
'     when no_data_found then',
'     v_cdgo_acto_tpo := ''XXX'';',
'     ',
'     APEX_UTIL.SET_SESSION_STATE (',
'            p_name     => ''P10_CDGO_ACTO_TPO'',',
'            p_value    => v_cdgo_acto_tpo);',
'end;'))
,p_attribute_02=>'P10_CDGO_ACTO_TPO,P10_ID_ACTO_TPO'
,p_attribute_03=>'P10_CDGO_ACTO_TPO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
