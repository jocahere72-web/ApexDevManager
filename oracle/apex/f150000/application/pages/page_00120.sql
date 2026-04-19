prompt --application/pages/page_00120
begin
wwv_flow_api.create_page(
 p_id=>120
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Actividades Econ\00F3micas - Solicitud de Novedades')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Actividades Econ\00F3micas - Solicitud de Novedades')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_last_updated_by=>'HMARTINEZ'
,p_last_upd_yyyymmddhh24miss=>'20201228102641'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75081197869345285)
,p_plug_name=>unistr('Actividades Econ\00F3micas')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--large'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(75047409888310026)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(75081197869345285)
,p_button_name=>'APLICAR_CAMBIOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P120_SEQ_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(75047757960310029)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(75081197869345285)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar / Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(75047323231310025)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(75081197869345285)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P120_SEQ_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(75047655410310028)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(75081197869345285)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_condition=>'P120_SEQ_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75047020981310022)
,p_name=>'P120_ID_ACTVDAD_ECNMCA'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(75081197869345285)
,p_prompt=>unistr('Actividad Econ\00F3mica')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion                         actvdad_ecnmca,',
'        a.id_dclrcns_esqma_trfa             id_actvdad_ecnmca,',
'      --  b.nmbre_dclrcns_esqma_trfa_tpo      nmbre_actvdad_ecnmca_tpo',
'           a.cdgo_dclrcns_esqma_trfa       cdgo_actvdad_ecnmca',
'from    gi_d_dclrcns_esqma_trfa     a',
'join    gi_d_dclrcns_esqma_trfa_tpo b   on  b.id_dclrcns_esqma_trfa_tpo =   a.id_dclrcns_esqma_trfa_tpo',
'where   b.cdgo_clnte                =   :F_CDGO_CLNTE',
'        and cdgo_dclrcns_esqma_trfa_tpo in (''1'',''2'',''3'',''4'')',
'order by  a.cdgo_dclrcns_esqma_trfa',
'',
'  ',
'/*  select a.dscrpcion actvdad_ecnmca',
'        , a.id_actvdad_ecnmca',
'        , b.nmbre_actvdad_ecnmca_tpo',
'     from gi_d_actividades_economica     a',
'     join gi_d_actividades_ecnmca_tpo    b on a.id_actvdad_ecnmca_tpo   = b.id_actvdad_ecnmca_tpo */',
'      ',
'     '))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75047130279310023)
,p_name=>'P120_FCHA_INCIO_ACTVDAD'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(75081197869345285)
,p_prompt=>'Fecha de Inicio de Actividad'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75047533893310027)
,p_name=>'P120_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(75081197869345285)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(75048834793310040)
,p_name=>'Cerrar Modal'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(75047757960310029)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(75048931797310041)
,p_event_id=>wwv_flow_api.id(75048834793310040)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(75049150487310043)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de Activiades Economicas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select n002',
'         , d001',
'      into :P120_ID_ACTVDAD_ECNMCA',
'         , :P120_FCHA_INCIO_ACTVDAD',
'      from apex_collections		a',
'     where collection_name		= ''ACTIVIADES_ECONOMICA''',
'       and a.seq_id				= :P120_SEQ_ID',
'       and a.n001				= :F_ID_INSTNCIA_FLJO;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P120_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(75047809226310030)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Proceso DML'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	v_rgstros		number;',
'',
'begin',
'	case :REQUEST',
'		when ''CREATE'' then',
'        if (not apex_collection.collection_exists(p_collection_name => ''ACTIVIADES_ECONOMICA'') ) then',
'            apex_collection.create_collection( p_collection_name => ''ACTIVIADES_ECONOMICA'');',
'        end if;',
'			-- Se valida si la actividad economica ya esta registrada',
'			begin',
'				select count(*)',
'				  into v_rgstros',
'				  from apex_collections		a',
'				 where collection_name		= ''ACTIVIADES_ECONOMICA''',
'				   and a.n001				= :F_ID_INSTNCIA_FLJO',
'				   and a.n002				= :P120_ID_ACTVDAD_ECNMCA;',
'			exception',
'				when others then ',
'					v_rgstros := 0;',
'			end;',
'			',
'			if v_rgstros > 0 then',
'				apex_error.add_error ( p_message		    => ''Sr(a). '' || :F_NMBRE_USRIO || '', La actividad economica ya se encuentra registrada'',',
'                                       p_display_location	=> apex_error.c_inline_in_notification );',
'                                    ',
'			else',
'				-- SE REGISTRA LA ACTIVIDAD ECONOMICA',
'				begin',
'                    apex_collection.add_member(p_collection_name	=> ''ACTIVIADES_ECONOMICA''',
'                                             , p_n001				=> :F_ID_INSTNCIA_FLJO',
'                                             , p_n002				=> :P120_ID_ACTVDAD_ECNMCA',
'                                             , p_d001               => :P120_FCHA_INCIO_ACTVDAD);',
'				end;-- FIN SE REGISTRA LA ACTIVIDAD ECONOMICA',
'			end if;',
'			-- FIN Se valida si la actividad economica ya esta registrada',
'',
'		when ''APLICAR_CAMBIOS'' then',
'			-- Se valida si la actividad economica ya esta registrada',
'			begin',
'				select count(*)',
'				  into v_rgstros',
'				  from apex_collections		a',
'				 where collection_name		= ''ACTIVIADES_ECONOMICA''',
'				   and a.n001				= :F_ID_INSTNCIA_FLJO',
'				   and a.n002				= :P120_ID_ACTVDAD_ECNMCA;',
'			exception',
'				when others then ',
'					v_rgstros := 0;',
'			end;',
'			',
'			if v_rgstros > 0 then',
'				apex_error.add_error ( p_message		    => ''Sr(a). '' || :F_NMBRE_USRIO || '', La actividad economica ya se encuentra registrada'',',
'                                       p_display_location	=> apex_error.c_inline_in_notification );',
'			else',
'				-- SE REGISTRA LA ACTIVIDAD ECONOMICA',
'				begin',
'                    apex_collection.update_member (p_collection_name 	=> ''ACTIVIADES_ECONOMICA''',
'									             , p_seq     			=> :P120_SEQ_ID',
'                                                 , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                                 , p_n002               => :P120_ID_ACTVDAD_ECNMCA',
'                                                 , p_d001               => :P120_FCHA_INCIO_ACTVDAD);',
'				end;-- FIN SE REGISTRA LA ACTIVIDAD ECONOMICA',
'			end if;',
'			-- FIN Se valida si la actividad economica ya esta registrada',
'',
'		when ''DELETE'' then',
'			 begin',
'                 apex_collection.delete_member (p_collection_name 	=> ''ACTIVIADES_ECONOMICA''',
'									          , p_seq     		    => :P120_SEQ_ID);',
'                 :P120_SEQ_ID    := null;',
'             end;',
'	end case;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n Procesada con Exito')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(75230465699935805)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>unistr('Limpiar Sessi\00F3n')
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(75230363169935804)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n Procesada con Exito')
);
end;
/
