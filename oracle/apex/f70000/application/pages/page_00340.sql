prompt --application/pages/page_00340
begin
wwv_flow_api.create_page(
 p_id=>340
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Cargue Declaraciones Archivos'
,p_page_mode=>'MODAL'
,p_step_title=>'Cargue Declaraciones Archivos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HGOMEZ'
,p_last_upd_yyyymmddhh24miss=>'20240822092543'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3478068888553710)
,p_plug_name=>'Declaraciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3478204939553712)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(3478068888553710)
,p_button_name=>'BTN_PRCSAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3478376643553713)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(3478068888553710)
,p_button_name=>'BTN_CRRAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'<b>Cerrar</b>'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3478152159553711)
,p_name=>'P340_ARCHVOS_DECLARACIONES'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3478068888553710)
,p_prompt=>unistr('Declaraci\00F3nes')
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'Y'
,p_attribute_11=>'application/pdf'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(3478766921553717)
,p_validation_name=>'Valida archivos Declaraciones'
,p_validation_sequence=>10
,p_validation=>'P340_ARCHVOS_DECLARACIONES'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor seleccione el archivo a procesar!'
,p_when_button_pressed=>wwv_flow_api.id(3478204939553712)
,p_associated_item=>wwv_flow_api.id(3478152159553711)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3479711921553727)
,p_name=>unistr('Al cambiar el archivo se refresca la regi\00F3n de datos del archivo')
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P340_ARCHVOS_DECLARACIONES'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3479870881553728)
,p_event_id=>wwv_flow_api.id(3479711921553727)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''CARGUE_DECLARACIONES''); ',
'APEX_UTIL.SET_SESSION_STATE(''P340_ARCHVOS_DECLARACIONES'',:P340_ARCHVOS_DECLARACIONES);'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3478487776553714)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Borra Coleccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_existe_coleccion boolean;',
'begin   ',
'    v_existe_coleccion := apex_collection.collection_exists(p_collection_name => ''CARGUE_DECLARACIONES'');',
'    if(v_existe_coleccion)then',
'        apex_collection.truncate_collection( p_collection_name => ''CARGUE_DECLARACIONES'');',
'    end if;',
'end;',
'--CARGUE_DECLARACIONES',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(3478376643553713)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3478531522553715)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar Ventana'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(3478376643553713)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3478636127553716)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Procesar Cargue Declaraciones'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_cdgo_rspsta            number := 0;',
'    v_mnsje_rspsta           varchar2(4000);',
'begin',
unistr('    -- Inicializaci\00F3n del estado de respuesta'),
'    v_cdgo_rspsta := 0;',
'    v_mnsje_rspsta := ''Inicio del proceso de cargue de declaraciones.'';',
'    ',
'    /*Creamos la coleccion*/',
'    apex_collection.create_or_truncate_collection(',
'        p_collection_name => ''CARGUE_DECLARACIONES'');',
'',
'    /*Recorremos las declaraciones y guardamos en la temporal*/',
'     for c_dclrcion in(select *',
'                   from apex_application_temp_files',
'                   where application_id = :APP_ID) loop',
'        /*Adicionamos el registro en la coleccion*/',
'        apex_collection.add_member (',
'            p_collection_name   => ''CARGUE_DECLARACIONES'',',
'            p_c001              => c_dclrcion.name,',
'            p_c002              => c_dclrcion.filename,',
'            p_c003              => c_dclrcion.mime_type,',
'            p_c004              => substr(c_dclrcion.filename, 1, instr(c_dclrcion.filename, ''.'' ) - 1),',
'            p_d001              => c_dclrcion.created_on,',
'            p_blob001           => c_dclrcion.blob_content',
'        );',
'',
'',
'    end loop;',
'',
'',
unistr('    -- Procesar la colecci\00F3n'),
'    for c_dcl in (',
'                select t.c004 as nmro_dclrcion, t.seq_id, t.blob001 as pdf',
'                from (',
'                    select distinct c004 as nmro_dclrcion',
'                    from apex_collections',
'                    where collection_name = ''CARGUE_DECLARACIONES''',
'                ) sub',
'                join apex_collections t',
'                on sub.nmro_dclrcion = t.c004',
'                and t.collection_name = ''CARGUE_DECLARACIONES''',
'',
'    ) loop',
unistr('        -- Procesar la identificaci\00F3n del sujeto impuesto'),
'        begin',
'',
'				pkg_gi_declaraciones.prc_rg_dclaracion_fisica(	p_cdgo_clnte   => :F_CDGO_CLNTE,',
'																p_nmro_dclrcion  => c_dcl.nmro_dclrcion,',
'																p_blob		   => c_dcl.pdf,',
'																o_cdgo_rspta   => v_cdgo_rspsta,',
'																o_msje_rspsta  => v_mnsje_rspsta );  ',
'					',
'			',
'        end;',
'    end loop;',
'',
'',
'      delete from apex_application_temp_files',
'      where application_id = :APP_ID;',
'      commit;',
'	apex_application.g_print_success_message := ''<span style="color:white">Proceso Ejecutado</span>'';',
'',
'',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(3478204939553712)
);
end;
/
