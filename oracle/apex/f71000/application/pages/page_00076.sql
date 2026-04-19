prompt --application/pages/page_00076
begin
wwv_flow_api.create_page(
 p_id=>76
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Garant\00EDa')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Garant\00EDa')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LOBREDOR'
,p_last_upd_yyyymmddhh24miss=>'20200117172950'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(45397075236476320)
,p_plug_name=>'Garantia'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46305078842452835)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(45397075236476320)
,p_button_name=>'BTN_APLICAR_CAMBIOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P76_ID_SECUENCIA_COLECCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46304915718452834)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(45397075236476320)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(45397548089476325)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(45397075236476320)
,p_button_name=>'BTN_INSERTAR_GARANTIA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P76_ID_SECUENCIA_COLECCION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46305105955452836)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(45397075236476320)
,p_button_name=>'BTN_ELIMINAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_condition=>'P76_ID_SECUENCIA_COLECCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(46304874794452833)
,p_branch_name=>unistr('Ir a la P\00E1gina 70')
,p_branch_action=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43969218005358334)
,p_name=>'P76_TIPO_GARANTIA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(45397075236476320)
,p_prompt=>unistr('Tipo de Garant\00EDa')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion',
'  ,   a.id_grntia_tpo',
' from gf_d_convenios_tipo_grntia a',
' join gf_d_garantias_tipo b on a.id_grntia_tpo = b.id_grntia_tpo',
'where a.id_cnvnio_tpo = :P69_ID_CNVNIO_TPO ',
'  and a.actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45397344236476323)
,p_name=>'P76_DSCRPCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(45397075236476320)
,p_prompt=>unistr('Descripci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>65
,p_cHeight=>3
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45397473459476324)
,p_name=>'P76_ADJNTAR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(45397075236476320)
,p_prompt=>'Adjunto'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46305571921452840)
,p_name=>'P76_ID_SECUENCIA_COLECCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(45397075236476320)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48192932173435005)
,p_name=>'P76_FILENAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(45397075236476320)
,p_prompt=>'Archivo Adjunto'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P76_ID_SECUENCIA_COLECCION'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48193063673435006)
,p_name=>'P76_MIME_TYPE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(45397075236476320)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48193150555435007)
,p_name=>'P76_FILENAME1'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(45397075236476320)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48193290988435008)
,p_name=>'P76_BLOB_CONTENT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(45397075236476320)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(43967720645358319)
,p_validation_name=>'Validar si existe Archivo'
,p_validation_sequence=>10
,p_validation=>'P76_ADJNTAR'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por Favor Seleccionar un archivo soporte para la garant\00EDa.')
,p_when_button_pressed=>wwv_flow_api.id(45397548089476325)
,p_associated_item=>wwv_flow_api.id(45397473459476324)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(46305247430452837)
,p_name=>'Cerrar Modal'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(46304915718452834)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(46305336336452838)
,p_event_id=>wwv_flow_api.id(46305247430452837)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(43967678894358318)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Proceso Agregar Garant\00EDa')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    l_file_names apex_t_varchar2;    ',
'    l_file  apex_application_temp_files%rowtype; ',
'begin',
'     ',
'    l_file_names := apex_string.split (',
'                        p_str => :P76_ADJNTAR,',
'                        p_sep => '':'' ); ',
'                        ',
'    for i in 1 .. l_file_names.count loop ',
'       ',
'    ',
'         select *',
'           into l_file',
'           from apex_application_temp_files',
'          where application_id = :APP_ID',
'            and name = l_file_names(i);',
'          if( l_file.id is not null ) then ',
'				apex_collection.add_member( p_collection_name => ''ADJUNTAR_GARANTIA'',',
'                                     p_n001            => :P76_TIPO_GARANTIA,',
'                                     p_c001            => :P76_DSCRPCION ,',
'                                     p_c004            => ''ACTIVA'',',
'                                     p_c002            => l_file.mime_type,',
'                                     p_c003            => l_file_names(i),',
'                                     p_blob001         => l_file.blob_content ); ',
'			end if;',
'            ',
'    end loop; ',
'             exception',
'           when no_data_found then',
'               insert into gti_aux (col1, col2) values (1, ''No se encontro el adjunto'');commit; ',
'end;',
''))
,p_process_error_message=>'Error al procesar la garantia'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(45397548089476325)
,p_process_success_message=>unistr('\00A1Se agreg\00F3 la garant\00EDa satisfactoriamente!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46306066936452845)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Proceso Eliminar Garant\00EDa')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    /*APEX_COLLECTION.DELETE_MEMBER(',
'        p_collection_name => ''ADJUNTAR_GARANTIA'',',
'        p_seq => :P76_ID_SECUENCIA_COLECCION);*/',
'        ',
'    APEX_COLLECTION.UPDATE_MEMBER ( p_collection_name => ''ADJUNTAR_GARANTIA'',',
'                                    p_seq             => :P76_ID_SECUENCIA_COLECCION,',
'                                    p_c004            => ''INACTIVA'' );   ',
'End;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(46305105955452836)
,p_process_success_message=>unistr('\00A1Se elimin\00F3 la garant\00EDa satisfactoriamente!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46306148063452846)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Proceso Aplicar Cambios Garant\00EDa')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    l_file_names             apex_t_varchar2;    ',
'    l_file                   apex_application_temp_files%rowtype; ',
'    l_file_temp              apex_application_temp_files%rowtype; ',
'begin',
'  ',
'    if (:P76_ADJNTAR is not null) then',
'        l_file_names := apex_string.split (p_str => :P76_ADJNTAR, p_sep => '':'' ); ',
'								',
'        if (l_file_names.count>1) then',
'            for i in 1 .. l_file_names.count loop ',
'                select *',
'                  into l_file',
'                  from apex_application_temp_files',
'                 where application_id = :APP_ID',
'                   and name = l_file_names(i);',
'',
'                  if( l_file.id is not null ) then ',
'                        apex_collection.add_member(  p_collection_name => ''ADJUNTAR_GARANTIA'',',
'                                                     p_n001            => :P76_TIPO_GARANTIA,',
'                                                     p_c001            => :P76_DSCRPCION ,',
'                                                     p_c004            => ''ACTIVA'',',
'                                                     p_c002            => l_file.mime_type,',
'                                                     p_c003            => l_file_names(i),',
'                                                     p_blob001         => l_file.blob_content ); ',
'                    end if;',
'',
'                end loop; ',
'		else',
'            for i in 1 .. l_file_names.count loop ',
'                select *',
'                  into l_file',
'                  from apex_application_temp_files',
'                 where application_id = :APP_ID',
'                    and name = l_file_names(i);',
'                    ',
'                if( l_file.id is not null ) then ',
'                    APEX_COLLECTION.UPDATE_MEMBER ( p_collection_name => ''ADJUNTAR_GARANTIA'',',
'                                                    p_seq             => :P76_ID_SECUENCIA_COLECCION,',
'                                                    p_n001            => :P76_TIPO_GARANTIA, ',
'                                                    p_c001            => :P76_DSCRPCION ,',
'                                                    p_c004            => ''ACTIVA'',',
'                                                    p_c002            => l_file.mime_type,',
'                                                    p_c003            => l_file.filename,',
'                                                    p_blob001         => l_file.blob_content );   ',
'                end if;',
'            end loop; ',
'	    end if;            ',
'    else',
'        select c002,',
'               c003, ',
'               blob001',
'          into l_file_temp.mime_type,',
'               l_file_temp.filename,',
'               l_file_temp.blob_content',
'          from apex_collections ',
'         where collection_name = ''ADJUNTAR_GARANTIA''',
'           and seq_id = :P76_ID_SECUENCIA_COLECCION;',
'           ',
'        APEX_COLLECTION.UPDATE_MEMBER ( p_collection_name => ''ADJUNTAR_GARANTIA'',',
'                                        p_seq             => :P76_ID_SECUENCIA_COLECCION,',
'                                        p_n001            => :P76_TIPO_GARANTIA, ',
'                                        p_c001            => :P76_DSCRPCION ,',
'                                        p_c004            => ''ACTIVA'',',
'                                        p_c002            => l_file_temp.mime_type,',
'                                        p_c003            => l_file_temp.filename,',
'                                        p_blob001         => l_file_temp.blob_content );   ',
'        ',
'    end if; ',
'exception',
'    when no_data_found then',
'        insert into gti_aux (col1, col2) values (1, ''No se encontro el adjunto'');commit; ',
'end;',
'        ',
'        '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(46305078842452835)
,p_process_success_message=>unistr('\00A1Se modific\00F3 la garant\00EDa satisfactoriamente!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(48192660421435002)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Recuperaci\00F3n de Datos por Id_secuencia_colecci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'        l_file_temp  apex_application_temp_files%rowtype; ',
'',
'',
'begin  ',
'       select n001, ',
'                   c001,',
'                   c002,',
'                   c003, ',
'                   blob001, ',
'                   SUBSTR(c003, INSTR(c003, ''/'')+1) ',
'               --    c003',
'              into :P76_TIPO_GARANTIA,',
'                   :P76_DSCRPCION,',
'                   l_file_temp.mime_type,',
'                   l_file_temp.filename,',
'                   l_file_temp.blob_content,',
'                   :P76_FILENAME',
'              from apex_collections ',
'              where collection_name = ''ADJUNTAR_GARANTIA''',
'                    and seq_id = :P76_ID_SECUENCIA_COLECCION;',
'     --          insert into gti_aux (col1, col2) values (1, ''Entro en la recuperacion de los datos de la coleccion '');commit; ',
'',
'   ',
'exception',
'     when no_data_found then',
'           insert into gti_aux (col1, col2) values (1, ''NOO Entro en la recuperacion de los datos de la coleccion '');commit; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46304793884452832)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Crear Colecci\00F3n Agregar Garant\00EDa.')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if not apex_collection.collection_exists(''ADJUNTAR_GARANTIA'') then',
'        apex_Collection.Create_Collection( p_collection_name => ''ADJUNTAR_GARANTIA'');',
'    ',
'    end if;    ',
'end;        ',
'        '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
