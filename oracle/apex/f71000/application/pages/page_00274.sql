prompt --application/pages/page_00274
begin
wwv_flow_api.create_page(
 p_id=>274
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Generar Reporte Paz y Salvo'
,p_page_mode=>'MODAL'
,p_step_title=>'Generar Reporte Paz y Salvo'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'300'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20250528175025'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(123952945062982437)
,p_plug_name=>'Reporte_ntrio'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(177374655004050691)
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'not (:P274_CDGO_ESTDO != ''AP'')'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(124030887830041326)
,p_plug_name=>'Estado'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5050473179888747)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(123952945062982437)
,p_button_name=>'Btn_Imprimir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(128500505233831696)
,p_branch_name=>'imprimir'
,p_branch_action=>'f?p=&APP_ID.:274:&SESSION.:DOWNLOAD:&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5050473179888747)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5032756453430208)
,p_name=>'P274_CDGO_ESTDO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(123952945062982437)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5032891597430209)
,p_name=>'P274_ID_DCMNTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(123952945062982437)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5051233101888773)
,p_name=>'P274_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(123952945062982437)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5051679269888773)
,p_name=>'P274_ID_PLNTLLA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(123952945062982437)
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
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5052064997888774)
,p_name=>'P274_ID_RPRTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(123952945062982437)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5052495767888775)
,p_name=>'P274_JSON'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(123952945062982437)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5052810487888775)
,p_name=>'P274_DLU'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(123952945062982437)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select id_impsto     ',
'      from df_c_impuestos ',
'     where cdgo_clnte  = :F_CDGO_CLNTE',
'       and cdgo_impsto = ''ICA'';'))
,p_item_default_type=>'SQL_QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5053276399888776)
,p_name=>'P274_CDGO_ACTO_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(123952945062982437)
,p_item_default=>'PYS'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5053900346888777)
,p_name=>'P274_ESTDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(124030887830041326)
,p_prompt=>'Estado:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5054318314888777)
,p_name=>'P274_CNSCUTVO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(124030887830041326)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9970974459852302)
,p_name=>'P274_TXTO_ASCDA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(123952945062982437)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128473146679988311)
,p_name=>'P274_ID_ACTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(123952945062982437)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5055859629888825)
,p_name=>'Mostrar Alerta'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_display_when_cond=>':P274_CDGO_ESTDO != ''AP'''
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5056384572888842)
,p_event_id=>wwv_flow_api.id(5055859629888825)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.message.alert(''No se encuentra a Paz y Salvo. '');',
'apex.navigation.dialog.cancel(true);',
'   ',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5056783157888850)
,p_name=>'Al cambiar reporte'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P274_ID_PLNTLLA'
,p_condition_element=>'P274_ID_PLNTLLA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5057207487888851)
,p_event_id=>wwv_flow_api.id(5056783157888850)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(5050473179888747)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5057719590888853)
,p_event_id=>wwv_flow_api.id(5056783157888850)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(5050473179888747)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5055442480888818)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_object json_object_t := json_object_t();',
'    v_json                clob;',
'begin',
'    ',
'     select b.id_rprte ',
'      into :P274_ID_RPRTE',
'      from gn_d_plantillas b',
'     where b.id_plntlla = :P274_ID_PLNTLLA;',
'',
' ',
'   -- if :P270_ID_IMPSTO_SBIMPSTO = 23001147 then',
'  --      :P274_CNSCUTVO := pkg_gn_generalidades.fnc_cl_consecutivo(:F_CDGO_CLNTE, ''PPE'');',
'  --  else',
'  --      :P274_CNSCUTVO := pkg_gn_generalidades.fnc_cl_consecutivo(:F_CDGO_CLNTE, ''PZD'');',
'  --  end if;',
'   ',
'    v_object.put(''id_impsto'', :P270_ID_IMPSTO);',
'    v_object.put(''id_impsto_sbimpsto'',:P270_ID_IMPSTO_SBIMPSTO);',
'    v_object.put(''cdgo_clnte'', :F_CDGO_CLNTE);',
'    v_object.put(''usrio'', :F_NMBRE_USRIO);',
'    v_object.put(''id_sjto_impsto'',:P274_ID_SJTO_IMPSTO);',
'    -- v_object.put(''nmbre_rprte'',v_nmbre_rprte);',
'    --v_object.put(''cnsctvo'',:P274_CNSCUTVO);',
'    v_object.put(''id_rprte'',:P274_ID_PLNTLLA);',
'    v_object.put(''txto_ascda'',:P274_TXTO_ASCDA);',
'    v_object.put(''id_dcmnto'',:P274_ID_DCMNTO);',
'',
'    v_json := v_object.to_clob();   ',
'    --:P274_JSON := v_object.to_clob();   ',
'   ',
'    --insert into muerto5 (v_001, c_001) values (''PAZYSALVO'', v_json); commit;',
'    ',
'    apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );    ',
'    apex_util.set_session_state(''P37_JSON'', v_json);',
'    apex_session.attach ( p_app_id => 71000, p_page_id => 274, p_session_id => :APP_SESSION );    ',
'',
'    exception',
'         when no_data_found then',
'              null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5050473179888747)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5054742720888808)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar_paz_y_salvo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'    v_cdgo_rspsta  	           number;',
'    v_mnsje_rspsta 	           varchar2(4000);',
'    v_id_acto  	               number;',
'    v_cdgo_impsto_smbpsto      df_i_impuestos_subimpuesto.CDGO_IMPSTO_SBMPSTO%type;',
'begin',
'    begin',
'    ',
'        select CDGO_IMPSTO_SBMPSTO',
'        into v_cdgo_impsto_smbpsto',
'        from  df_i_impuestos_subimpuesto',
'        where ID_IMPSTO_SBMPSTO =  :P270_ID_IMPSTO_SBIMPSTO;',
'    ',
'    ',
'    exception',
'        when others then',
'            v_mnsje_rspsta:= ''No se encontro el sub tributo del Paz y Salvo ''|| '' - ''||sqlerrm;',
'            apex_error.add_error (  p_message          => v_mnsje_rspsta,',
'                                    p_display_location => apex_error.c_inline_in_notification );',
'    end;',
'',
'    --insert into muerto5 (n_001, v_001) values (222,'' P274_ID_DCMNTO : ''||:P274_ID_DCMNTO); commit;',
'    begin',
'        pkg_gf_paz_y_salvo.prc_rg_paz_salvo( p_cdgo_clnte        => :F_CDGO_CLNTE ',
'                                           , p_id_impsto         => :P270_ID_IMPSTO',
'                                           , p_id_impsto_sbmpsto => :P270_ID_IMPSTO_SBIMPSTO',
'                                           , p_id_sjto_impsto    => :P274_ID_SJTO_IMPSTO',
'                                           , p_id_usrio          => :F_ID_USRIO',
'                                           , p_cnsctvo           => :P274_CNSCUTVO  ',
'                                           , p_cdgo_cnsctvo      => (case when v_cdgo_impsto_smbpsto =  ''PEV'' then --:P270_ID_IMPSTO_SBIMPSTO = 23001147 then Publicidad Exterior Visual',
'                                                                        ''PPE''',
'                                                                      when v_cdgo_impsto_smbpsto =  ''DUB'' then  --Delineacion Urbana',
'                                                                        ''PZD''',
'                                                                      when v_cdgo_impsto_smbpsto =  ''AEP'' then  --APROVECHAMIENTO DEL ESPACIO PUBLICO',
'                                                                         ''PZAEP''',
'                                                                     end)',
'                                           , p_id_plntlla        => :P274_ID_PLNTLLA ',
'                                           , p_txto_ascda        => :P274_TXTO_ASCDA',
'                                           , p_id_dcmnto         => :P274_ID_DCMNTO',
'                                           , o_id_acto           => v_id_acto',
'                                           , o_cdgo_rspsta       => v_cdgo_rspsta',
'                                           , o_mnsje_rspsta      => v_mnsje_rspsta);',
'    if(v_cdgo_rspsta <> 0 ) then ',
'        raise_application_error( -20001 , v_mnsje_rspsta);',
'    else',
'       -- :P274_ID_ACTO :=v_id_acto;',
'       apex_util.set_session_state(''P274_ID_ACTO'', v_id_acto);  ',
'       ',
'      -- insert into muerto (n_001, v_001) values (222,'' apex_util.set_session_state P274_ID_ACTO : ''||:P274_ID_ACTO); commit;',
'      -- insert into muerto (n_001, v_001) values (222,'' apex_util.set_session_state v_id_acto : ''||v_id_acto); commit;',
'    end if;',
'    ',
'     exception',
'      when others then',
'        v_mnsje_rspsta:= ''Error al ejecutar registra paz y salvo ''|| '' - ''||sqlerrm;',
'        apex_error.add_error (  p_message          => v_mnsje_rspsta,',
'                                p_display_location => apex_error.c_inline_in_notification );',
'                            ',
'    end;',
'                                   ',
'end; '))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5050473179888747)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5032618106430207)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultamos Estado del Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_estdo    varchar2(2);',
'begin',
'--Consultamos Estado del documento',
'     select cdgo_rcdo_estdo',
'    into v_cdgo_estdo',
'    from re_g_recaudos',
'    where id_orgen = :P274_ID_DCMNTO ',
'    and cdgo_rcdo_estdo = ''AP'';',
'    ',
'    :P274_CDGO_ESTDO := v_cdgo_estdo;',
'    ',
'    if (:P274_CDGO_ESTDO != ''AP'') then ',
'       :P274_ESTDO := ''Documento no Pagado.'';',
'    elsif (:P274_CDGO_ESTDO = ''AP'') then',
'       :P274_ESTDO := ''Paz y Salvo.'';',
'    end if;    ',
'',
'exception',
'    when others then',
'        :P274_ESTDO := ''Documento sin Recaudo'';',
'        :P274_CDGO_ESTDO := ''NP'';',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(128499092733817405)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	',
'--Consulta',
'declare',
'    v_file_name         varchar2(2000);',
'    v_file_blob         blob;',
'    v_file_mimetype     varchar2(1000);',
'    v_file_bfile        bfile;',
'begin',
' ',
'  /*   select file_name',
'         , file_mimetype',
'         , file_blob',
'         , file_bfile',
'      into v_file_name',
'         , v_file_mimetype ',
'         , v_file_blob',
'         , v_file_bfile',
'      from v_gn_g_actos ',
'     where id_acto = :P274_ID_ACTO; */',
'',
'--insert into muerto (n_001, v_001) values (222,''Entro a descargar el archivo   ''); commit;',
'--insert into muerto (n_001, v_001) values (222,''Entro a descargar el archivo  P274_ID_ACTO :  ''||:P274_ID_ACTO); commit;',
'',
'    select d.file_name ',
'        , d.file_mimetype',
'        ,(select pkg_gd_utilidades.fnc_co_blob(:P274_ID_ACTO) from dual) file_blob',
'      into v_file_name',
'         , v_file_mimetype ',
'         , v_file_blob',
'    from v_gn_g_actos d',
'    where id_acto = :P274_ID_ACTO; ',
'    ',
'    if(v_file_blob is not null and v_file_name is not null and v_file_mimetype is not null) then',
'        htp.init;',
'        owa_util.mime_header(v_file_mimetype, FALSE );',
'        htp.p(''Content-length: '' ||dbms_lob.getlength(v_file_blob));',
'        htp.p(''Content-Disposition: attachment; filename="'' ||v_file_name || ''"'' );',
'        htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'        owa_util.http_header_close;',
'        wpg_docload.download_file(v_file_blob);',
'        apex_application.stop_apex_engine;',
'    end if;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DOWNLOAD'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
