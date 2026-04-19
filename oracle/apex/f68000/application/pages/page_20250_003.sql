prompt --application/pages/page_20250_003
begin
wwv_flow_api.create_page(
 p_id=>2025005
,p_user_interface_id=>wwv_flow_api.id(71889596252951620)
,p_name=>'Registrar Rechazo'
,p_page_mode=>'MODAL'
,p_step_title=>'Registrar Rechazo'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DBALDOVINO'
,p_last_upd_yyyymmddhh24miss=>'20250911170457'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14180594703981801)
,p_plug_name=>unistr('Observaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14180957901981805)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(14180594703981801)
,p_button_name=>'BTN_GRDAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(14104392958995726)
,p_branch_name=>unistr('Ir a la p\00E1gina 26 Gesti\00F3n')
,p_branch_action=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14104716386995730)
,p_name=>'P2025005_USRIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(14180594703981801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14180611488981802)
,p_name=>'P2025005_OBSRVCION'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(14180594703981801)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>90
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(71867355103951593)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14180712051981803)
,p_name=>'P2025005_FILE_BLOB'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(14180594703981801)
,p_prompt=>'Seleccionar Archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(71867177152951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14271722770220301)
,p_name=>'P2025005_ID_QJA_RCLMO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(14180594703981801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14271826897220302)
,p_name=>'P2025005_ID_INSTNCIA_FLJO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(14180594703981801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14271976213220303)
,p_name=>'P2025005_ID_RVSION_TREA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(14180594703981801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14272413682220308)
,p_name=>'P2025005_ID_FLJO_TREA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(14180594703981801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14272545427220309)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Rechazar etapa'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_blob                     blob;  ',
'     v_seq                      varchar2(4000);',
'     r_temp_files               apex_application_temp_files%rowtype;',
'     v_obsrvcion                varchar2(4000);',
'     v_cdgo_rspsta              number;',
'     v_mnsje_rspsta             varchar2(1000);',
'     v_mime_type                varchar2(400);',
'     v_file_name                varchar2(400);',
'     ',
'    v_id_fljo_trea_dstno number;',
'    v_type               varchar2(1);',
'    v_error              varchar2(4000);',
'    v_mnsje              varchar2(4000);',
'     ',
'begin',
'    begin',
'        select *',
'          into r_temp_files',
'          from apex_application_temp_files',
'         where name = :P2025005_FILE_BLOB;',
'    exception ',
'        when no_data_found then',
'            v_blob := null;  ',
'    end;',
'    ',
'    if r_temp_files.filename is not null then',
'    ',
'        if (not apex_collection.collection_exists(p_collection_name => ''DOCUMENTO_RECHAZO'') ) then',
'            apex_collection.create_collection( p_collection_name => ''DOCUMENTO_RECHAZO'');',
'        end if;',
'',
'        begin',
'            select seq_id',
'              into v_seq',
'              from apex_collections',
'             where collection_name = ''DOCUMENTO_RECHAZO''',
'               --and n001 = :P2025003_ID_MTVO_DCMNTO;',
'               --and c002 = r_temp_files.filename',
'               ;',
'                           ',
'            apex_collection.update_member( p_collection_name => ''DOCUMENTO_RECHAZO''',
'                                          , p_seq  => v_seq  ',
'                                          , p_c002 => r_temp_files.filename',
'                                          , p_c003 => r_temp_files.mime_type',
'                                          --, p_n001 => :P2025003_ID_MTVO_DCMNTO',
'                                          , p_blob001 => r_temp_files.blob_content );        ',
'        exception ',
'            when others then',
'                apex_collection.add_member( p_collection_name => ''DOCUMENTO_RECHAZO''',
'                                          , p_c002 => r_temp_files.filename',
'                                          , p_c003 => r_temp_files.mime_type',
'                                          --, p_n001 => :P2025003_ID_MTVO_DCMNTO',
'                                          , p_blob001 => r_temp_files.blob_content );        ',
'        end;       ',
'    end if;',
'    ',
'',
'    --Se consulta el adjunto',
'    begin',
'        select  c002 , c003 , blob001',
'          into  v_file_name, v_mime_type, v_blob                            ',
'          from apex_collections',
'         where collection_name = ''DOCUMENTO_RECHAZO'';',
'     exception',
'         when others then',
'         v_file_name := null;',
'         v_mime_type := null;',
'         v_blob := null;',
'     end;',
'         ',
unistr('    --2. Se inserta la revisi\00F3n de rechazo.'),
'    begin       ',
'        -- Se inserta la revision',
'        pkg_pl_workflow_1_0.prc_gn_rvsion_trea_fljo(p_cdgo_clnte          => :F_CDGO_CLNTE,',
'                                                    p_id_qja_rclmo       => :P2025005_ID_QJA_RCLMO,',
'                                                    p_id_fljo_trea       => :P2025005_ID_FLJO_TREA,',
'                                                    p_id_instncia_fljo   => :P2025005_ID_INSTNCIA_FLJO,',
'                                                    p_id_usrio           => :F_ID_USRIO,',
'                                                    p_cdgo_estdo         => ''R'',',
'                                                    p_obsrvcion          => :P2025005_OBSRVCION,',
'                                                    p_dcmnto             => v_blob,',
'                                                    p_file_name			 => v_file_name,',
'                                                    p_file_mimetype	     => v_mime_type,',
'                                                    o_cdgo_rspsta        => v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta       => v_mnsje_rspsta);',
'           if v_cdgo_rspsta <> 0 then',
unistr('               raise_application_error(-20000, ''1. Error al rechazar la revisi\00F3n. '' ||v_mnsje_rspsta );'),
'           end if;',
'           ',
'           commit;',
'           ',
'    exception',
'        when others then',
unistr('            raise_application_error(-20000, ''2. Error al rechazar la revisi\00F3n.'' || sqlerrm);'),
'    end;',
'    ',
'    --3. Se transita la tarea',
'    begin',
'    ',
'        pkg_pl_workflow_1_0.prc_rg_instancias_transicion(p_id_instncia_fljo => :P2025005_ID_INSTNCIA_FLJO,',
'                                                         p_id_fljo_trea     => :P2025005_ID_FLJO_TREA,',
'                                                         p_json             => ''[]'',',
'                                                         p_id_usrio_espcfco => :P2025005_USRIO,',
'                                                         o_type             => v_type, -- ''S => Hubo algun error ''',
'                                                         o_mnsje            => v_mnsje,',
'                                                         o_id_fljo_trea     => v_id_fljo_trea_dstno,',
'                                                         o_error            => v_error);',
'        if v_type = ''S'' then',
unistr('            raise_application_error(-20000, ''3. Error al rechazar la revisi\00F3n.'');'),
'        else',
unistr('            apex_application.g_print_success_message := ''<span style="color:white">Revisi\00F3n Rechazada!</span>'';'),
'        end if;',
'        ',
'        ',
'    exception',
'        when others then',
unistr('            raise_application_error(-20000, ''4. Error al rechazar la revisi\00F3n.'' || sqlerrm);       '),
'   end;',
unistr('        -- Limpiar colecci\00F3n'),
'           if apex_collection.collection_exists(p_collection_name => ''DOCUMENTO_RECHAZO'') then',
'              apex_collection.delete_collection(p_collection_name => ''DOCUMENTO_RECHAZO'');',
'           end if;',
'           ',
'exception',
'    when others then',
unistr('        raise_application_error(-20000, ''5. Error al rechazar la revisi\00F3n. '' || sqlerrm); '),
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14104442417995727)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'Cerrar Modal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14104292629995725)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar items'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P2025005_OBSRVCION,P2025005_FILE_BLOB'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
