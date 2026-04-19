prompt --application/pages/page_00015
begin
wwv_flow_api.create_page(
 p_id=>15
,p_user_interface_id=>wwv_flow_api.id(71889596252951620)
,p_name=>'Actualizar Documentos'
,p_page_mode=>'MODAL'
,p_step_title=>'Actualizar Documentos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20231023091415'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(238219218479380634)
,p_plug_name=>'Documentos'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(238663490392453837)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(238219218479380634)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71814488075951563)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select md.id_mtvo_dcmnto',
'        , md.dscrpcion_dcmnto',
'        , blob001 file_blob',
'        , c002 file_name',
'        , c001 obsrvcion,',
'        case',
'            when dbms_lob.getlength(blob001) > 0 then ''Cargado''',
'            else  ''Pendiente''',
'        end Estado        ',
'     from pq_g_documentos d',
'  join v_pq_d_motivos_documento md',
'    on d.id_mtvo_dcmnto = md.id_mtvo_dcmnto',
'left join apex_collections c',
'       on md.id_mtvo_dcmnto = n001    ',
'      and collection_name = ''DOCUMENTOS''',
'    where d.id_slctud = NVL(:P11_ID_SLCTUD, :P15_ID_SLCTUD)',
'      and d.indcdor_actlzar = ''S'''))
,p_plug_source_type=>'NATIVE_IR'
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
 p_id=>wwv_flow_api.id(238665349105453855)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'MCARO'
,p_internal_uid=>238665349105453855
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82726065809338182)
,p_db_column_name=>'ID_MTVO_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Mtvo Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82726497785338183)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82726862140338183)
,p_db_column_name=>'FILE_BLOB'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Archivo'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82727282110338183)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82727673148338183)
,p_db_column_name=>'ESTADO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82728073890338184)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(238768997525746644)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'827284'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:OBSRVCION:ESTADO::FILE_NAME'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(82723342856338175)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(238219218479380634)
,p_button_name=>'BTN_SCANNER'
,p_button_static_id=>'BTN_SCANNER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_image_alt=>'Escaner'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>8
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(82723737812338176)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(238219218479380634)
,p_button_name=>'BTN_AGRGAR'
,p_button_static_id=>'BTN_AGRGAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_image_alt=>'Agregar'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>8
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(82752874262518515)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(238219218479380634)
,p_button_name=>'Cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(82752780662518514)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(238219218479380634)
,p_button_name=>'BTN_SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82724125482338177)
,p_name=>'P15_ID_MTVO_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(238219218479380634)
,p_prompt=>'Tipo Documento'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select md.dscrpcion_dcmnto',
'     , md.id_mtvo_dcmnto',
' from pq_g_documentos d',
'  join v_pq_d_motivos_documento md',
'    on d.id_mtvo_dcmnto = md.id_mtvo_dcmnto',
' where id_slctud = :P15_ID_SLCTUD',
'   and indcdor_actlzar = ''S'''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P15_ID_MTVO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82724519126338179)
,p_name=>'P15_OPCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(238219218479380634)
,p_item_default=>'F'
,p_prompt=>'<p></p>'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Explorador de Archivos;F,Escaner;E'
,p_colspan=>6
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82724974691338179)
,p_name=>'P15_FILE_BLOB'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(238219218479380634)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82725384803338179)
,p_name=>'P15_OBSRVCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(238219218479380634)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>35
,p_cMaxlength=>99
,p_cHeight=>2
,p_colspan=>7
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82751455074518501)
,p_name=>'P15_ID_SLCTUD'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(238219218479380634)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(82752543350518512)
,p_validation_name=>'validar archivo no sea nulo'
,p_validation_sequence=>10
,p_validation=>'P15_FILE_BLOB'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe escoger un archivo'
,p_when_button_pressed=>wwv_flow_api.id(82723737812338176)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(82752619686518513)
,p_validation_name=>'validar que el tipo de documento no sea nulo'
,p_validation_sequence=>20
,p_validation=>'P15_ID_MTVO_DCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar tipo de documento'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(82751592033518502)
,p_name=>unistr('al cambiar de opci\00F3n')
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P15_OPCION'
,p_condition_element=>'P15_OPCION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'E'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(82751640791518503)
,p_event_id=>wwv_flow_api.id(82751592033518502)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P15_FILE_BLOB'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(82751933345518506)
,p_event_id=>wwv_flow_api.id(82751592033518502)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P15_FILE_BLOB'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(82751779574518504)
,p_event_id=>wwv_flow_api.id(82751592033518502)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(82723737812338176)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(82752020554518507)
,p_event_id=>wwv_flow_api.id(82751592033518502)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(82723737812338176)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(82751860813518505)
,p_event_id=>wwv_flow_api.id(82751592033518502)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(82723342856338175)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(82752137337518508)
,p_event_id=>wwv_flow_api.id(82751592033518502)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(82723342856338175)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(82752976401518516)
,p_name=>unistr('al presionar el bot\00F3n cancelar')
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(82752874262518515)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(82753068761518517)
,p_event_id=>wwv_flow_api.id(82752976401518516)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(82752472667518511)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'agregar_archivos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_blob blob;',
'     v_seq  varchar2(4000);',
'     r_temp_files apex_application_temp_files%rowtype;',
'begin',
'    begin',
'        select *',
'          into r_temp_files',
'          from apex_application_temp_files',
'         where name = :P15_FILE_BLOB;',
'    exception ',
'        when no_data_found then',
'            v_blob := null;  ',
'    end;',
'    ',
'    if r_temp_files.filename is not null then',
'    ',
'        if (not apex_collection.collection_exists(p_collection_name => ''DOCUMENTOS'') ) then',
'            apex_collection.create_collection( p_collection_name => ''DOCUMENTOS'');',
'        end if;',
'',
'        begin',
'            select seq_id',
'              into v_seq',
'              from apex_collections',
'             where collection_name = ''DOCUMENTOS''',
'               and n001 = :P15_ID_MTVO_DCMNTO;',
'            ',
'            apex_collection.update_member( p_collection_name => ''DOCUMENTOS''',
'                                          , p_seq  => v_seq  ',
'                                          , p_c001 => :P15_OBSRVCION',
'                                          , p_c002 => r_temp_files.filename',
'                                          , p_c003 => r_temp_files.mime_type',
'                                          , p_n001 => :P15_ID_MTVO_DCMNTO',
'                                          , p_blob001 => r_temp_files.blob_content );        ',
'        exception ',
'            when others then',
'                apex_collection.add_member( p_collection_name => ''DOCUMENTOS''',
'                                          , p_c001 => :P15_OBSRVCION',
'                                          , p_c002 => r_temp_files.filename',
'                                          , p_c003 => r_temp_files.mime_type',
'                                          , p_n001 => :P15_ID_MTVO_DCMNTO',
'                                          , p_blob001 => r_temp_files.blob_content );        ',
'        end;       ',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(82723737812338176)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(82753164104518518)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar documentos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_mnsje varchar2(4000);',
'begin',
'',
'    for c_documentos in (',
'                            select md.id_mtvo_dcmnto',
'                                 , md.dscrpcion_dcmnto',
'                                 , blob001 file_blob',
'                                 , c002 file_name',
'                                 , c003 mime_type',
'                                 , c001 obsrvcion',
'                              from pq_g_documentos d',
'                              join v_pq_d_motivos_documento md',
'                                on d.id_mtvo_dcmnto = md.id_mtvo_dcmnto',
'                              join apex_collections c',
'                                on md.id_mtvo_dcmnto = n001    ',
'                               and collection_name = ''DOCUMENTOS''',
'                             where d.id_slctud = :P15_ID_SLCTUD',
'                               and d.indcdor_actlzar = ''S''',
'                         )',
'    loop',
'        ',
'        update pq_g_documentos',
'           set indcdor_actlzar = ''N''',
'             , actvo           = ''N''',
'         where id_mtvo_dcmnto  = c_documentos.id_mtvo_dcmnto',
'           and id_slctud       = :P15_ID_SLCTUD;',
'           ',
'            insert into pq_g_documentos( id_slctud              , id_mtvo_dcmnto             , file_blob ',
'                                        , file_name             , file_mimetype              , obsrvcion             ) ',
'                                 values( :P15_ID_SLCTUD         , c_documentos.id_mtvo_dcmnto, c_documentos.file_blob',
'                                        , c_documentos.file_name, c_documentos.mime_type , c_documentos.obsrvcion);',
'    end loop;',
'',
'exception ',
'    when others then',
'        v_mnsje := ''No se Pudieron Actualizar los Documentos'';',
'        apex_error.add_error (  p_message          => v_mnsje,',
'                                p_display_location => apex_error.c_inline_in_notification );',
'        raise_application_error( -20001 , v_mnsje );',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(82752780662518514)
,p_process_success_message=>'Documentos actualizados de forma exitosa!!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(82753280250518519)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar la ventana'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(82752780662518514)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(82753592395518522)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'borrar coleccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if apex_collection.collection_exists(p_collection_name => ''DOCUMENTOS'') then ',
'    apex_collection.delete_collection( p_collection_name => ''DOCUMENTOS'');            ',
'end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BORRAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
