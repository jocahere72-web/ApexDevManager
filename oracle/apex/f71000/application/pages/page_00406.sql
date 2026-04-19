prompt --application/pages/page_00406
begin
wwv_flow_api.create_page(
 p_id=>406
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Descargar Paz y Salvos'
,p_page_mode=>'MODAL'
,p_step_title=>'Descargar Paz y Salvo Masivo'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177318053164050589)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'250'
,p_last_updated_by=>'HGOMEZ'
,p_last_upd_yyyymmddhh24miss=>'20240607101630'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(156922990708138519)
,p_plug_name=>'Plantilla Paz y Salvo'
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
 p_id=>wwv_flow_api.id(156923565876138525)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(156922990708138519)
,p_button_name=>'BTN_PRCSAR_PZ_SLVOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CONTAR NUMBER;',
'BEGIN',
'    SELECT COUNT(*)',
'    INTO CONTAR',
'    FROM gn_g_temporal',
'    WHERE C005 = ''Paz y Salvo''',
'      AND ID_SSION = :APP_SESSION;',
'',
'    RETURN CONTAR <= 50;',
'END;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(156923118939138521)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(156922990708138519)
,p_button_name=>'BTN_DSCGAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'<b>Descargar .ZIP'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' DECLARE',
'   CONTAR NUMBER;',
'BEGIN',
'    SELECT COUNT(*)',
'    INTO CONTAR',
'    FROM gn_g_temporal',
'    WHERE C005 = ''Paz y Salvo'' AND BLOB001 IS NOT NULL',
'      AND ID_SSION = :APP_SESSION;',
'',
'    RETURN CONTAR > 0 AND CONTAR<51;',
'END;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-cloud-download'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(156924688065138536)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(156922990708138519)
,p_button_name=>'BTN_EJCTAR_JOB'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de procesar?  Nota: Al aceptar el procesamiento masivo, se realizarÃ¡ en segundo plano. En cuanto termine el procesamiento el sistema le notificarÃ¡ de manera automÃ¡tica que este ha terminado. '',''BTN_EJCTAR_JOB'');'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CONTAR NUMBER;',
'BEGIN',
'    SELECT COUNT(*)',
'    INTO CONTAR',
'    FROM gn_g_temporal',
'    WHERE C005 = ''Paz y Salvo''',
'      AND ID_SSION = :APP_SESSION;',
'',
'    RETURN CONTAR > 50;',
'END;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(156923454436138524)
,p_branch_name=>'Ir a 406'
,p_branch_action=>'f?p=&APP_ID.:406:&SESSION.:Descargar:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(156923118939138521)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(156923094704138520)
,p_name=>'P406_ID_PLNTLLA'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(156922990708138519)
,p_prompt=>'Plantilla:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion  as d',
'     , id_plntlla as r      ',
'  from gn_d_plantillas',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_rprte in (',
'                     select id_rprte ',
'                       from gn_d_reportes  a',
'                      where cdgo_rprte_grpo = ''PYZ''',
'                        and id_rprte in (',
'                                            select id_rprte',
'                                              from v_gn_d_reportes_x_usuarios',
'                                              where id_usrio = :F_ID_USRIO',
'                                              ',
'                                         ) ',
'                   );'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(156923278345138522)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar_paz_y_salvo masivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'    v_cdgo_rspsta  	   number;',
'    v_mnsje_rspsta 	   varchar2(4000);',
'  --  v_documento  	   number;',
'    ',
'    BEGIN',
'    ',
'    ',
'         pkg_gf_paz_y_salvo.PRC_GENERA_PAZ_SALVO_MASIVO(',
'                                                p_cdgo_clnte    =>    :F_CDGO_CLNTE,',
'                                                p_id_usuario    =>    :F_ID_USRIO,',
'                                                p_id_session    =>    :APP_SESSION,',
'                                                p_id_plntlla    =>    :P406_ID_PLNTLLA,',
'                                                o_cdgo_rspsta   =>    v_cdgo_rspsta,',
'                                                o_mnsje_rspsta  =>    v_mnsje_rspsta',
'         ) ;',
'                                                ',
'            IF v_cdgo_rspsta > 0 THEN   ',
'                ROLLBACK;',
'                RAISE_APPLICATION_ERROR(-20001, v_mnsje_rspsta);                                                ',
'            END IF;',
'            apex_application.g_print_success_message := ''<span style="color:white">Registro de Paz y Salvos Ejecutado</span>'';',
'        EXCEPTION',
'            WHEN OTHERS THEN',
'                ROLLBACK;',
'                RAISE_APPLICATION_ERROR(-20001, ''No se pudo registrar paz y Salvo '' || SQLERRM);',
'        END;',
'',
'',
'    '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(156923565876138525)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(156924772012138537)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'JOB Paz y Salvos Masivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_error varchar2(1000);',
'',
'begin',
'',
'    insert into gti_aux (col1, col2) values (''F_CDGO_CLNTE'', :F_CDGO_CLNTE);',
'    insert into gti_aux (col1, col2) values (''F_ID_USRIO'', :F_ID_USRIO);',
'    insert into gti_aux (col1, col2) values (''p_id_session'', :APP_SESSION);',
'	insert into gti_aux (col1, col2) values (''p_id_plntlla'', :P406_ID_PLNTLLA);',
'    commit;',
'    BEGIN',
'        DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_GF_GENERAR_PAZ_Y_SALVOS"'', attribute => ''job_action'', value => ''PKG_GF_PAZ_Y_SALVO.PRC_GENERA_PAZ_SALVO_MASIVO_JOB'');',
'',
'        DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_GF_GENERAR_PAZ_Y_SALVOS"'', attribute => ''number_of_arguments'', value => ''4'');',
'',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GF_GENERAR_PAZ_Y_SALVOS'', argument_position => 1, argument_value => :F_CDGO_CLNTE);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GF_GENERAR_PAZ_Y_SALVOS'', argument_position => 2, argument_value => :F_ID_USRIO);',
'		DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GF_GENERAR_PAZ_Y_SALVOS'', argument_position => 3, argument_value => :APP_SESSION);',
'		DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GF_GENERAR_PAZ_Y_SALVOS'', argument_position => 4, argument_value => :P406_ID_PLNTLLA);',
'	',
'',
'    END; ',
'',
'    ',
'    BEGIN',
'        DBMS_SCHEDULER.ENABLE(''"GENESYS"."IT_GF_GENERAR_PAZ_Y_SALVOS"'');',
'    END; ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(156924688065138536)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(156923363744138523)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar .ZIP'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_app_id        NUMBER := v(''APP_ID'');',
'    v_app_page_id   NUMBER := v(''APP_PAGE_ID'');',
'    v_zip_file      BLOB;',
'BEGIN',
unistr('    -- A\00F1adir archivos al BLOB ZIP'),
'    FOR c_paz_salvos IN (    ',
'        SELECT c.file_blob, c.file_name ',
'        FROM gn_g_temporal a ',
'        JOIN v_gn_g_actos b ON a.n003 = b.id_acto',
'        LEFT JOIN gd_g_documentos c ON b.id_dcmnto = c.id_dcmnto',
'        WHERE b.id_dcmnto IS NOT NULL AND a.ID_SSION = :APP_SESSION',
'    ) LOOP',
'        apex_zip.add_file(',
'            p_zipped_blob => v_zip_file,',
'            p_file_name   => c_paz_salvos.file_name,',
'            p_content     => c_paz_salvos.file_blob',
'        );',
'    END LOOP;',
'',
'    -- Finalizar el BLOB ZIP',
'    apex_zip.finish(p_zipped_blob => v_zip_file);',
'    ',
'    -- Configurar los encabezados para la descarga',
'    owa_util.mime_header(''application/zip'', FALSE); ',
'    htp.p(''Content-length: '' || DBMS_LOB.getlength(v_zip_file));',
'    htp.p(''Content-Disposition: attachment; filename="PAZ_Y_SALVOS.zip"'');',
'    owa_util.http_header_close;',
'    wpg_docload.download_file(v_zip_file);',
'',
unistr('    -- Adjuntar la sesi\00F3n APEX'),
'    apex_session.attach(',
'        p_app_id     => v_app_id,',
'        p_page_id    => v_app_page_id,',
'        p_session_id => v(''APP_SESSION'')',
'    );',
'',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        -- Manejo de errores',
'        RAISE_APPLICATION_ERROR(-20001, ''Error en el procedimiento: '' || SQLERRM);',
'END;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Descargar'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
