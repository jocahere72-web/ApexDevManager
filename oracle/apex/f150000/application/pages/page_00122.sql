prompt --application/pages/page_00122
begin
wwv_flow_api.create_page(
 p_id=>122
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Registrar Establecimiento'
,p_page_mode=>'MODAL'
,p_step_title=>'Registrar Establecimiento'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_last_updated_by=>'LARIZA'
,p_last_upd_yyyymmddhh24miss=>'20220120105705'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(163129113773869769)
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
 p_id=>wwv_flow_api.id(88048525266524501)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(163129113773869769)
,p_button_name=>'APLICAR_CAMBIOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P122_SEQ_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(88048980140524503)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(163129113773869769)
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
 p_id=>wwv_flow_api.id(88049356890524503)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(163129113773869769)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P122_SEQ_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(88049742928524503)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(163129113773869769)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_condition=>'P122_SEQ_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88037313736401303)
,p_name=>'P122_NOMBRE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(163129113773869769)
,p_prompt=>'Nombre Establecimiento'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88037481427401304)
,p_name=>'P122_EMAIL'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(163129113773869769)
,p_prompt=>unistr('Correo Electr\00F3nico')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88037575835401305)
,p_name=>'P122_DIRECCION'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(163129113773869769)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88037600625401306)
,p_name=>'P122_TELEFONO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(163129113773869769)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88039140621401321)
,p_name=>'P122_ID_CDGO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(163129113773869769)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88050149500524506)
,p_name=>'P122_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(163129113773869769)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88050527421524507)
,p_name=>'P122_ID_ACTVDAD_ECNMCA'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(163129113773869769)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo',
'from fi_d_codigos_ciiu a',
'where  a.cdgo = :P122_ID_CDGO;',
'',
''))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>unistr('Actividad Econ\00F3mica')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   a.cdgo  || '' - '' || a.dscrpcion  ,',
'         a.cdgo  cdgo_actvdad_ecnmca',
'from     fi_d_codigos_ciiu a ',
'order by cdgo_actvdad_ecnmca ',
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
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(88177311192670601)
,p_validation_name=>'Validar que el correo sea valido'
,p_validation_sequence=>10
,p_validation=>'regexp_like (:P122_EMAIL, ''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Ingrese un Email valido.'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(88037481427401304)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(88052967061524516)
,p_name=>'Cerrar Modal'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(88048980140524503)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(88053489732524517)
,p_event_id=>wwv_flow_api.id(88052967061524516)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(88051729912524514)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de Activiades Economicas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select   c001  ',
'          --  , n002 	',
'           -- , b.dscrpcion--c002  ',
'            , C002',
'            , C003',
'            , C004',
'            ,c005',
'      into ',
'           :P122_NOMBRE',
'        --  ,:P122_ID_ACTVDAD_ECNMCA',
'          ,:P122_DIRECCION',
'          ,:P122_EMAIL',
'          ,:P122_TELEFONO',
'          ,:P122_ID_CDGO',
'      from apex_collections		a',
'      join fi_d_codigos_ciiu b    on a.c005 = b.cdgo',
'     where collection_name		= ''ESTABLECIMIENTOS''',
'       and a.seq_id				= :P122_SEQ_ID;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P122_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(88051335244524513)
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
'        if (not apex_collection.collection_exists(p_collection_name => ''ESTABLECIMIENTOS'') ) then',
'            apex_collection.create_collection( p_collection_name => ''ESTABLECIMIENTOS'');',
'            ',
'        end if;',
'           -- apex_collection.delete_collection( p_collection_name => ''ACTIVIDADES_ECONOMICA'');',
'			-- Se valida si la actividad economica ya esta registrada',
'			begin',
'				select count(*)',
'				  into v_rgstros',
'				  from apex_collections		a',
'				 where collection_name		= ''ESTABLECIMIENTOS''',
'				 --  and a.n001				= :F_ID_INSTNCIA_FLJO',
'				   and a.C005				= :P122_ID_ACTVDAD_ECNMCA;',
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
'                    apex_collection.add_member(p_collection_name	=> ''ESTABLECIMIENTOS''',
'                                             , p_c001				=> :P122_NOMBRE',
'                                             , p_c005				=> :P122_ID_ACTVDAD_ECNMCA',
'                                             , p_c002				=> :P122_DIRECCION',
'                                             , p_c003				=> :P122_EMAIL',
'                                             , p_C004               => :P122_TELEFONO);',
'				end;-- FIN SE REGISTRA LA ACTIVIDAD ECONOMICA',
'			end if;',
'			-- FIN Se valida si la actividad economica ya esta registrada',
'',
'		when ''APLICAR_CAMBIOS'' then',
'         ',
'			-- Se valida si la actividad economica ya esta registrada',
'			begin',
'				select count(*)',
'				  into v_rgstros',
'				  from apex_collections		a',
'				 where collection_name		= ''ESTABLECIMIENTOS''',
'				   and a.seq_id				= :P122_SEQ_ID',
'				   and a.c005				= :P122_ID_CDGO  ;',
'			exception',
'				when others then ',
'					v_rgstros := 0;',
'			end;',
'			',
'			if v_rgstros < 0 then',
'             insert into muerto (v_001)values(''Entro en error '');',
'                commit;',
'				apex_error.add_error ( p_message		    => ''Sr(a). '' || :F_NMBRE_USRIO || '', La actividad economica ya se encuentra registrada para este establecimiento'',',
'                                       p_display_location	=> apex_error.c_inline_in_notification );',
'			else',
'				-- SE REGISTRA LA ACTIVIDAD ECONOMICA',
'                insert into muerto (v_001)values(''Entro en actualizar '');',
'                commit;',
'               ',
'               if :P122_ID_ACTVDAD_ECNMCA is not null then',
'                   :P122_ID_CDGO := :P122_ID_ACTVDAD_ECNMCA;',
'               end if; ',
'               ',
'              --  insert into muerto (v_001)values(''Valor de P122_ID_ACTVDAD_ECNMCA '' );             ',
'               --  commit;',
'                begin',
'                    apex_collection.update_member (p_collection_name 	=> ''ESTABLECIMIENTOS''',
'									             , p_seq     			=> :P122_SEQ_ID',
'                                                 , p_c001				=> :P122_NOMBRE',
'                                                 , p_c005				=> :P122_ID_CDGO',
'                                                 , p_c002				=> :P122_DIRECCION',
'                                                 , p_c003				=> :P122_EMAIL',
'                                                 , p_C004               => :P122_TELEFONO);',
'				end;-- FIN SE REGISTRA LA ACTIVIDAD ECONOMICA',
'			end if;',
'			-- FIN Se valida si la actividad economica ya esta registrada',
'',
'		when ''DELETE'' then',
'			 begin',
'                 apex_collection.delete_member (p_collection_name 	=> ''ESTABLECIMIENTOS''',
'									          , p_seq     		    => :P122_SEQ_ID);',
'                 :P122_SEQ_ID    := null;',
'             end;',
'	end case;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n Procesada con Exito')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(88052536045524515)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>unistr('Limpiar Sessi\00F3n')
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(88052180279524515)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n Procesada con Exito')
);
end;
/
