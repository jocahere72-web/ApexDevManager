prompt --application/pages/page_00038
begin
wwv_flow_api.create_page(
 p_id=>38
,p_user_interface_id=>wwv_flow_api.id(30413944355578333)
,p_name=>'Cargar Documento Acto Con Firma'
,p_page_mode=>'MODAL'
,p_step_title=>'Cargar Documento Acto Con Firma'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LCORTES'
,p_last_upd_yyyymmddhh24miss=>'20240704163443'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(30119746601115109)
,p_plug_name=>'Cargar Documento'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(30119996893115111)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(30119746601115109)
,p_button_name=>'BTN_GUADAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'CARGAR'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-file'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30119838809115110)
,p_name=>'P38_CRGAR_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(30119746601115109)
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30120296773115114)
,p_name=>'P38_ID_DOCUMENTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(30119746601115109)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30120494672115116)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar Nuevo Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_blob_content BLOB;',
'BEGIN',
'    -- Obtener el contenido BLOB del archivo temporal',
'    SELECT blob_content',
'    INTO l_blob_content',
'    FROM apex_application_temp_files',
'    WHERE name = :P38_CRGAR_DCMNTO;',
'',
'    -- Actualizar el campo BLOB en la tabla documentos',
'    UPDATE gd_g_documentos',
'    SET file_blob_nvo = l_blob_content',
'    WHERE id_dcmnto = :P38_ID_DOCUMENTO;',
'',
unistr('    -- Verificar si se actualiz\00F3 alg\00FAn registro'),
'    IF SQL%ROWCOUNT = 0 THEN',
unistr('        RAISE_APPLICATION_ERROR(-20001, ''No se encontr\00F3 ning\00FAn documento para actualizar'');'),
'    END IF;',
'',
unistr('    -- Eliminar el archivo temporal despu\00E9s de actualizar'),
'    DELETE FROM apex_application_temp_files',
'    WHERE name = :P38_CRGAR_DCMNTO;',
'',
'    -- Realizar commit para guardar los cambios',
'    COMMIT;',
'EXCEPTION',
'    WHEN NO_DATA_FOUND THEN',
unistr('        RAISE_APPLICATION_ERROR(-20001, ''No se encontr\00F3 ning\00FAn archivo temporal relacionado.'');'),
'    WHEN OTHERS THEN',
unistr('        -- Manejo de errores: Puedes personalizar el manejo de excepciones seg\00FAn tus necesidades'),
'        ROLLBACK;',
'        RAISE;',
'END;',
''))
,p_process_error_message=>'No se pudo guardar el documento'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Guardado Exitosamente'
);
end;
/
