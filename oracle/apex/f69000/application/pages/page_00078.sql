prompt --application/pages/page_00078
begin
wwv_flow_api.create_page(
 p_id=>78
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Crear Predio en Valorizaci\00F3n por Resoluci\00F3n')
,p_step_title=>unistr('Crear Predio en Valorizaci\00F3n por Resoluci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HGOMEZ'
,p_last_upd_yyyymmddhh24miss=>'20240530164638'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(199156306538345236)
,p_plug_name=>unistr('Crear Predio en el Impuesto de  Valorizaci\00F3n por Resoluci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(312540692670629736)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(312542817354629758)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'<i>',
'  Funcionalidad que permite',
'  Inscripcion de predios a valorizacion con base a una resolucion o referencia catastral.<br/><br/>',
unistr('  Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(156455467814913808)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(312540692670629736)
,p_button_name=>'BTN_GSTION_PNTUAL_PRDIO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Gesti\00F3n Puntual Predio')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:79:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-plus-square-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(156455899686913809)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(312540692670629736)
,p_button_name=>'BTN_ACTLZA_MSVO'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'<b>Actualizar Masivo'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de procesar es?  Nota: Al aceptar el procesamiento masivo, se realizarÃ¡ en segundo plano. En cuanto termine el procesamiento el sistema le notificarÃ¡ de manera automÃ¡tica que este ha terminado. '',''BTN_ACTLZA_MSVO'');'
,p_icon_css_classes=>'fa-pie-chart-10'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(156377253929190024)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(312540692670629736)
,p_button_name=>'BTN_CRGR_ARCHVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'<b>Cargar Archivo'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:80:&SESSION.::&DEBUG.:RP::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(156454445159913783)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(199156306538345236)
,p_button_name=>'BTN_PRCSR_RSLCION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Procesar Resoluci\00F3n')
,p_button_position=>'BODY'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(156454870101913792)
,p_name=>'P78_RSLCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(199156306538345236)
,p_prompt=>unistr('N\00FAmero de Resoluci\00F3n')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(156842137327926739)
,p_validation_name=>unistr('Verificar  Par\00E1metro')
,p_validation_sequence=>10
,p_validation=>'(:P78_RSLCION is not null)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('Digitar Numero de Resoluci\00F3n a Procesar')
,p_when_button_pressed=>wwv_flow_api.id(156454445159913783)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(156839662815926714)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Creaci\00F3n Masiva de Valorizaci\00F3n por Resoluci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   v_cdgo_rspsta  NUMBER;',
'   v_mnsje_rspsta VARCHAR2(4000);',
'BEGIN',
'',
'          PKG_GI_PREDIO_VALORIZACION.PRC_CREA_PRDIO_VAL(',
'            p_rslcion_igac  => :P78_RSLCION,',
'            p_cdgo_clnte    => :F_CDGO_CLNTE,',
'            p_id_usuario    => :F_ID_USRIO,                                          ',
'            o_cdgo_rspsta   => v_cdgo_rspsta,',
'            o_mnsje_rspsta  => v_mnsje_rspsta',
'          );',
'           apex_application.g_print_success_message := ''<span style="color:white">Proceso Ejecutado</span>'';',
'  IF v_cdgo_rspsta > 0 THEN   ',
'    ROLLBACK;',
'    RAISE_APPLICATION_ERROR(-20001, v_mnsje_rspsta);                                               ',
'  END IF;',
'  ',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    ROLLBACK;',
unistr('    RAISE_APPLICATION_ERROR(-20001, ''No se pudo registrar la resolucion para Valorizaci\00F3n '' || SQLERRM);'),
'END;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(156454445159913783)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(156841900361926737)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'JOB_Actualiza_Masivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_error varchar2(1000);',
'	--v_cdgo_rspsta  NUMBER;',
'   --v_mnsje_rspsta VARCHAR2(4000);  ',
'begin',
'',
'    insert into gti_aux (col1, col2) values (''F_CDGO_CLNTE'', :F_CDGO_CLNTE);',
'    insert into gti_aux (col1, col2) values (''F_ID_USRIO'', :F_ID_USRIO);',
'   -- insert into gti_aux (col1, col2) values (''o_cdgo_rspsta'', 11111111111);',
'--	insert into gti_aux (col1, col2) values (''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    commit;',
'    BEGIN',
'        DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_GI_ACTUALIZAR_VALORIZACION"'', attribute => ''job_action'', value => ''PKG_GI_PREDIO_VALORIZACION.PRC_ACTLZA_PRDIOS_VAL_MASIVO'');',
'',
'        DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_GI_ACTUALIZAR_VALORIZACION"'', attribute => ''number_of_arguments'', value => ''3'');',
'',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_ACTUALIZAR_VALORIZACION'', argument_position => 1, argument_value => :F_CDGO_CLNTE);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_ACTUALIZAR_VALORIZACION'', argument_position => 2, argument_value => :F_ID_USRIO);',
'		DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_ACTUALIZAR_VALORIZACION'', argument_position => 3, argument_value => NULL);',
'	--	DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_ACTUALIZAR_VALORIZACION'', argument_position => 4, argument_value => v_cdgo_rspsta);',
'	--	DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_ACTUALIZAR_VALORIZACION'', argument_position => 5, argument_value => v_mnsje_rspsta);',
'',
'',
'    END; ',
'',
'    ',
'    BEGIN',
'        DBMS_SCHEDULER.ENABLE(''"GENESYS"."IT_GI_ACTUALIZAR_VALORIZACION"'');',
'    END; ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(156455899686913809)
);
end;
/
