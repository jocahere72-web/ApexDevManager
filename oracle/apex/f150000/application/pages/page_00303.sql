prompt --application/pages/page_00303
begin
wwv_flow_api.create_page(
 p_id=>303
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Cargue de Documentos'
,p_page_mode=>'MODAL'
,p_step_title=>'Cargue de Documentos'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.formule {',
'    padding-top: 15px;',
'    padding-bottom: 30px;',
'    background-color: #ebebeb;',
'    margin-bottom: 30px;',
'}',
'',
'@media (min-width: 768px)',
'.col-md-2 {',
'    -webkit-box-flex: 0;',
'    -webkit-flex: 0 0 16.666667%;',
'    -ms-flex: 0 0 16.666667%;',
'    flex: 0 0 16.666667%;',
'    max-width: 16.666667%;',
'}',
'',
'formule img {',
'    margin-top: 30px;',
'    margin-left: 35px;',
'}',
'.img-fluid {',
'    max-width: 100%;',
'    height: auto;',
'}',
'img {',
'    vertical-align: middle;',
'}',
'img {',
'    border-style: none;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20210205160636'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5075407872370501)
,p_plug_name=>'Documentos PQR'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5085326073407308)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5075407872370501)
,p_button_name=>'BTN_AGREGAR_DOCUMENTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Agregar Documento'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-file-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5238504450988724)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5075407872370501)
,p_button_name=>'BTN_ELIMINAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_condition=>'P303_SEQ_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5085069748407305)
,p_name=>'P303_FILE_BLOB'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5075407872370501)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5085177019407306)
,p_name=>'P303_ID_MTVO_DCMNTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5075407872370501)
,p_prompt=>'Documento'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select dscrpcion_dcmnto',
'        , id_mtvo_dcmnto',
'     from v_pq_d_motivos_documento',
'    where id_mtvo_dcmnto = :P303_ID_MTVO_DCMNTO',
'       and actvo =''S'''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5238392089988722)
,p_name=>'P303_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5075407872370501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5238740401988726)
,p_validation_name=>'File Blob No nulo'
,p_validation_sequence=>10
,p_validation=>'P303_FILE_BLOB'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# No puede ser nulo'
,p_when_button_pressed=>wwv_flow_api.id(5085326073407308)
,p_associated_item=>wwv_flow_api.id(5085069748407305)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5085413913407309)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Agregar Documento'
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
'         where name = :P303_FILE_BLOB;',
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
'               and n001 = :P303_ID_MTVO_DCMNTO;',
'            ',
'            apex_collection.update_member( p_collection_name => ''DOCUMENTOS''',
'                                          , p_seq  => v_seq  ',
'                                          , p_c001 => ''Documento Cargado por Portal'' --:P302_OBSRVCION',
'                                          , p_c002 => r_temp_files.filename',
'                                          , p_c003 => r_temp_files.mime_type',
'                                          , p_n001 => :P303_ID_MTVO_DCMNTO',
'                                          , p_blob001 => r_temp_files.blob_content );        ',
'        exception ',
'            when others then',
'                apex_collection.add_member( p_collection_name => ''DOCUMENTOS''',
'                                          , p_c001 => ''Documento Cargado por Portal'' --:P302_OBSRVCION',
'                                          , p_c002 => r_temp_files.filename',
'                                          , p_c003 => r_temp_files.mime_type',
'                                          , p_n001 => :P303_ID_MTVO_DCMNTO',
'                                          , p_blob001 => r_temp_files.blob_content );        ',
'        end;       ',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5085326073407308)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5238662506988725)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_COLLECTION.DELETE_MEMBER (p_collection_name => ''DOCUMENTOS'',',
'                               p_seq             => :P303_SEQ_ID);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5238504450988724)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5085615196407311)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
