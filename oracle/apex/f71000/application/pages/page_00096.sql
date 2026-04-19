prompt --application/pages/page_00096
begin
wwv_flow_api.create_page(
 p_id=>96
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Soportes'
,p_page_mode=>'MODAL'
,p_step_title=>'Soportes'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(177318053164050589)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JALCOCER'
,p_last_upd_yyyymmddhh24miss=>'20190109091838'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50598553084363926)
,p_plug_name=>'Botones'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody:margin-top-lg:margin-bottom-lg'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50880825728721810)
,p_plug_name=>'Soportes'
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100253859055829594)
,p_plug_name=>'Informe Adjunto'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.seq_id, ',
'       a.c001 Obsrvcion, ',
'       a.c002 filename,',
'       a.blob001 blob,',
'       a.n001 as id_archvo,',
'CASE',
'        when a.c002=''image/jpeg'' then ',
'        ''<center><i class="fa fa-file-image-o fa-1x" aria-hidden="true" ></i><br><b>Archivo Imagen</b></br></center>''',
'        ',
'         when a.c002=''image/jpg'' then ',
'        ''<center><i class="fa fa-file-image-o fa-1x" aria-hidden="true" ></i></br><b>Imagen </b></center>''',
'        ',
'        when a.c002=''image/png'' then ',
'        ''<center><i class="fa fa-file-image-o fa-1x" aria-hidden="true" ></i></br><b>Imagen </b></center>''',
'        ',
'         when a.c002=''image/gif'' then ',
'        ''<center><i class="fa fa-file-image-o fa-1x" aria-hidden="true" ></i></br><b>Imagen </b></center>''',
'        ',
'         when a.c002=''image/bmp'' then ',
'        ''<center><i class="fa fa-file-image-o fa-1x" aria-hidden="true" ></i></br><b>Imagen </b></center>''',
'        ',
'        when a.c002=''application/pdf'' then',
'       ''<center><i class="fa fa-file-pdf-o fa-1x" aria-hidden="true" ></i></br><b>Archivo pdf</b></center>''',
'       ',
'        when a.c002=''application/x-msdownload'' then',
'       ''<center><i class="fa fa-cogs fa-1x" aria-hidden="true"></i></br><b>Archivo DLL</b></center>''',
'      ',
'       when a.c002 = ''text/csv'' then',
'       ''<center><i class="fa fa-file-excel-o fa-1x" aria-hidden="true"></i></br><b>Archivo csv</b></center>''',
'      ',
'        when a.c002=''text/plain'' then',
'       ''<center><i class="fa fa-file-text-o fa-1x" aria-hidden="true"></i></br><b>Archivo txt</b></center>''',
'       ',
'       when a.c002=''application/vnd.openxmlformats-officedocument.wordprocessingml.document'' then',
'        ''<center><i class="fa fa-file-word-o fa-1x" aria-hidden="true"></i></br><b>Archivo Doc</b></center>''',
'      ',
'       -- when a.c002=''application/octet-stream'' then',
'      -- ''<center><i class="fa fa-file-excel-o fa-1x" aria-hidden="true"></i></br><b>Archivo xmls</b></center>''',
'       ',
'        when a.c002=''application/vnd.ms-powerpoint'' then',
'       ''<center><i class="fa fa-file-powerpoint-o fa-1x" aria-hidden="true"></i></br><b>Archivo pptx</b></center>''',
'       ',
'        when a.c002=''application/octet-stream'' then',
'       ''<center><i class="fa fa-file-archive-o fa-1x" aria-hidden="true"></i></br><b>Archivo zip</b></center>''',
'       ',
'        when a.c002=''audio/mp3'' then',
'       ''<center><i class="fa fa-file-audio-o fa-1x" aria-hidden="true"></i></br><b>Audio mp3</b></center>''',
'       ',
'        when a.c002=''video/x-ms-wmv'' then',
'       ''<center><i class="fa fa-file-video-o fa-1x" aria-hidden="true"></i></br><b>Video wmv</b></center>''',
'       ',
'       when a.c002 = ''application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'' then',
'       ''<center><i class="fa fa-file-excel-o fa-1x" aria-hidden="true"></i></br><b>Archivo xlsx</b></center>''',
'       ',
'       when a.c002=''video/mp4'' then',
'       ''<center><i class="fa fa-file-video-o fa-1x" aria-hidden="true"></i></br><b>Video mp4</b></center>''',
'       ',
'       when a.C002= ''application/rtf''then',
'       ''<center><i class="fa fa-file-word-o fa-1x" aria-hidden="true"></i></br><b>Archivo rtf</b></center>''',
'       ',
'end as "blob"',
'  from apex_collections a',
'  where collection_name = ''ADJUNTAR_SOPORTES''',
'  order by seq_id',
'',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P96_ID'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(54916408052698235)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_detail_link=>'f?p=&APP_ID.:96:&SESSION.::&DEBUG.:RP:P96_ID,P96_FILE_NAME,P96_OBSRVCION:#SEQ_ID#,#FILENAME#,#OBSRVCION#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JALCOCER'
,p_internal_uid=>54916408052698235
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(54916512510698236)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(54916625717698237)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(54916724221698238)
,p_db_column_name=>'FILENAME'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Filename'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(54916873727698239)
,p_db_column_name=>'BLOB'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Blob'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(54916980928698240)
,p_db_column_name=>'ID_ARCHVO'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Id Archvo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(54917709040698248)
,p_db_column_name=>'blob'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Archivo<br> Soporte'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(55194878610422419)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'551949'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SEQ_ID:OBSRVCION:FILENAME:BLOB:ID_ARCHVO:blob'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(50881337411721812)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(50598553084363926)
,p_button_name=>'BTN_DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_button_condition=>'P96_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(50881415500721812)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(50598553084363926)
,p_button_name=>'BTN_CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(50881258260721812)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(50598553084363926)
,p_button_name=>'BTN_SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_button_condition=>'P96_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(50881170866721812)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(50598553084363926)
,p_button_name=>'BTN_CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P96_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50596330232363904)
,p_name=>'P96_ID'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(50880825728721810)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50884715527721963)
,p_name=>'P96_ID_PRSCRPCION_ADJNTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(50880825728721810)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50885044114721964)
,p_name=>'P96_ID_PRNSCRPCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(50880825728721810)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50885404056721965)
,p_name=>'P96_OBSRVCION'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(50880825728721810)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>4
,p_grid_column=>3
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Digite una descripci\00F3n corta y clara')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50885818551721965)
,p_name=>'P96_FILE_BLOB'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(50880825728721810)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_grid_column=>3
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione uno o mas archivos adjuntar'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50886291562721965)
,p_name=>'P96_FILE_NAME'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(50880825728721810)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50886690548721965)
,p_name=>'P96_MIMETYPE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(50880825728721810)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(50598966564363930)
,p_validation_name=>'Validar si existe Archivo'
,p_validation_sequence=>20
,p_validation=>'P96_FILE_BLOB'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por favor Seleccionar un archivo soporte para la Prescripci\00F3n.')
,p_validation_condition=>'BTN_NUEVA_COLECCION'
,p_validation_condition_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50599992829363940)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(50881170866721812)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50600004146363941)
,p_event_id=>wwv_flow_api.id(50599992829363940)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(50596213229363903)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Recuperaci\00F3n de Datos por Id')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin  ',
'       select  c001,',
'               c002,',
'               c003,',
'               n001',
'          into :P96_OBSRVCION,',
'               :P96_MIMETYPE,',
'               :P96_FILE_NAME,',
'               :P96_ID_PRSCRPCION_ADJNTO',
'          from apex_collections ',
'         where collection_name = ''ADJUNTAR_SOPORTES''',
'           and seq_id = :P96_ID ;',
'exception',
'     when no_data_found then',
'     null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(50596127384363902)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Crear Prescripci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    --APEX_COLLECTION.DELETE_COLLECTION ( ''ADJUNTAR_SOPORTES'');',
'    if not apex_collection.collection_exists(''ADJUNTAR_SOPORTES'') then',
'        apex_Collection.Create_Collection( p_collection_name => ''ADJUNTAR_SOPORTES'');',
'    end if;    ',
'    ',
'end;        ',
'     '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(51272782881191108)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Proceso Eliminar Prescripci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    APEX_COLLECTION.DELETE_MEMBER( p_collection_name => ''ADJUNTAR_SOPORTES'',',
'                               p_seq => :P96_ID );'))
,p_process_error_message=>'Error'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(50881337411721812)
,p_process_success_message=>'Se Elimino Exitosamente.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(54914167794698212)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Proceso Eliminar Prescripci\00F3n_1')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_COLLECTION.TRUNCATE_COLLECTION (',
'    p_collection_name => ''ADJUNTAR_SOPORTES'');',
''))
,p_process_error_message=>'Error'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>'Se Elimino Exitosamente.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(50596596070363906)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Proceso Agregar Prescripci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    l_file_names apex_t_varchar2; ',
'    l_file  apex_application_temp_files%rowtype; ',
'begin',
'       ',
'       l_file_names := apex_string.split (',
'                        p_str => :P96_FILE_BLOB,',
'                        p_sep => '':'' ); ',
'     ',
'      for i in 1 .. l_file_names.count loop ',
'      ',
'    select *',
'      into l_file',
'      from apex_application_temp_files',
'     where application_id = :APP_ID',
'       and name = l_file_names(i);',
'       ',
'    if( l_file.id is not null ) then ',
'	apex_collection.add_member( p_collection_name => ''ADJUNTAR_SOPORTES'' ,',
'                                p_n001            => l_file.id,',
'                                p_c001            => :P96_OBSRVCION,',
'                                p_c002            => l_file.mime_type,',
'                                p_c003            => l_file.filename,                           ',
'                                p_blob001         => l_file.blob_content ); ',
'',
'     end if;',
'     ',
'     end loop;',
'exception',
'      when no_data_found then',
'           insert into gti_aux (col1, col2) values (1, ''No se encontro el adjunto'');commit;    ',
'end;',
''))
,p_process_error_message=>'No se agrego el Adjunto..!'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(50881170866721812)
,p_process_success_message=>'Se agrego el Adjunto Exitosamente..!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(50596790912363908)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Proceso Actualizar Prescripci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare  ',
'    l_file apex_application_temp_files%rowtype; ',
'begin',
'',
'     if( :P96_FILE_BLOB is null ) then ',
'         select *',
'           into l_file',
'           from apex_application_temp_files',
'          where application_id = :APP_ID',
'            and id             = :P96_ID_PRSCRPCION_ADJNTO;',
'     else',
'        ',
'         select *',
'           into l_file',
'           from apex_application_temp_files',
'          where application_id = :APP_ID',
'            and name           = :P96_FILE_BLOB;',
'     end if;',
'     ',
'     apex_collection.update_member ( p_collection_name => ''ADJUNTAR_SOPORTES'' ,',
'                                p_seq             => :P96_ID,',
'                                p_c001            => :P96_OBSRVCION,',
'                                p_n001            => l_file.id,',
'                                p_c002            => l_file.mime_type,',
'                                p_c003            => l_file.filename,                           ',
'                                p_blob001         => l_file.blob_content );',
'',
'exception',
'      when no_data_found then',
'           insert into gti_aux (col1, col2) values (1, ''No se encontro el adjunto'');',
'           commit;',
'end;',
'        ',
'        '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(50881258260721812)
,p_process_success_message=>unistr('Se Actualiz\00F3 Exitosamente')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(51272841469191109)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Session State'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_CREATE,BTN_DELETE,BTN_SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
