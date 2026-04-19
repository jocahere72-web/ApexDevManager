prompt --application/pages/page_00273
begin
wwv_flow_api.create_page(
 p_id=>273
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Generar Reporte'
,p_page_mode=>'MODAL'
,p_step_title=>'Generar Reporte'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'250'
,p_dialog_width=>'40%'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20221219183059'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(118903091840093757)
,p_plug_name=>'Reporte_ntrio'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(177374655004050691)
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'not (:P273_SUMA > 0)'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(118981034607152646)
,p_plug_name=>'Estado'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(59573958308889960)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(118903091840093757)
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
 p_id=>wwv_flow_api.id(59579129184889998)
,p_branch_name=>'imprimir'
,p_branch_action=>'f?p=&APP_ID.:273:&SESSION.::&DEBUG.:273::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(68546875291156225)
,p_branch_name=>'imprimir'
,p_branch_action=>'f?p=66000:37:&SESSION.::&DEBUG.::P37_ID_RPRTE,P37_NMBRE_RPRTE:&P273_ID_RPRTE.,PAZ_Y_SALVO_&P273_CNSCUTVO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(128472343840988303)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=&APP_ID.:273:&SESSION.:DOWNLOAD:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(59573958308889960)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59408806444262711)
,p_name=>'P273_CNSCUTVO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(118981034607152646)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59573272101889959)
,p_name=>'P273_ESTDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(118981034607152646)
,p_prompt=>'Estado:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59574332129889960)
,p_name=>'P273_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(118903091840093757)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59574784222889960)
,p_name=>'P273_SUMA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(118903091840093757)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59575144085889967)
,p_name=>'P273_ID_PLNTLLA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(118903091840093757)
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
 p_id=>wwv_flow_api.id(59575528001889967)
,p_name=>'P273_JSON'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(118903091840093757)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61472977934997136)
,p_name=>'P273_DLU'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(118903091840093757)
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
 p_id=>wwv_flow_api.id(61473716708997144)
,p_name=>'P273_CDGO_ACTO_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(118903091840093757)
,p_item_default=>'PYS'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68546702956156224)
,p_name=>'P273_ID_RPRTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(118903091840093757)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128472237707988302)
,p_name=>'P273_ID_ACTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(118903091840093757)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(59576772762889996)
,p_name=>'Mostrar Alerta'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_display_when_cond=>'(:P273_SUMA > 0)'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(59577246015889996)
,p_event_id=>wwv_flow_api.id(59576772762889996)
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
 p_id=>wwv_flow_api.id(61474058431997147)
,p_name=>'Al cambiar reporte'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P273_ID_PLNTLLA'
,p_condition_element=>'P273_ID_PLNTLLA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(61474164026997148)
,p_event_id=>wwv_flow_api.id(61474058431997147)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(59573958308889960)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(61474288956997149)
,p_event_id=>wwv_flow_api.id(61474058431997147)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(59573958308889960)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(62644138880304703)
,p_name=>'Mostrar Alerta No Activo'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'SQL_EXPRESSION'
,p_display_when_cond=>':P273_ESTDO = ''No Activo'''
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(62644283070304704)
,p_event_id=>wwv_flow_api.id(62644138880304703)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.message.alert(''Sujeto no esta activo, no es posible emitir el paz y salvo'');',
'apex.navigation.dialog.cancel(true);',
'   '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(59576392015889995)
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
'    select b.id_rprte ',
'      into :P273_ID_RPRTE',
'      from gn_d_plantillas b',
'     where b.id_plntlla = :P273_ID_PLNTLLA;',
'',
'    ',
'  -- :P273_CNSCUTVO := pkg_gn_generalidades.fnc_cl_consecutivo(:F_CDGO_CLNTE, ''PYZ'');',
'',
'    v_object.put(''id_impsto'', :P272_ID_IMPSTO);',
'    v_object.put(''id_impsto_sbimpsto'',:P272_ID_IMPSTO_SBIMPSTO);',
'    v_object.put(''cdgo_clnte'', :F_CDGO_CLNTE);',
'    v_object.put(''usrio'', :F_NMBRE_USRIO);',
'    v_object.put(''id_sjto_impsto'',:P273_ID_SJTO_IMPSTO);',
'    -- v_object.put(''nmbre_rprte'',v_nmbre_rprte);',
'    v_object.put(''cnsctvo'',:P273_CNSCUTVO);',
'    v_object.put(''id_rprte'',:P273_ID_PLNTLLA);',
'    --:P273_JSON := v_object.to_clob();   ',
'    v_json := v_object.to_clob();   ',
'    apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );    ',
'    apex_util.set_session_state(''P37_JSON'', v_json);',
'    apex_session.attach ( p_app_id => 71000, p_page_id => 273, p_session_id => :APP_SESSION );    ',
'',
'    exception',
'         when no_data_found then',
'              null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(59573958308889960)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(59408795573262710)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar_paz_y_salvo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'    v_cdgo_rspsta  	   number;',
'    v_mnsje_rspsta 	   varchar2(4000);',
'    v_id_acto  	   number;',
'    ',
'begin',
'',
'    pkg_gf_paz_y_salvo.prc_rg_paz_salvo( p_cdgo_clnte        => :F_CDGO_CLNTE ',
'                                       , p_id_impsto         => :P272_ID_IMPSTO',
'                                       , p_id_impsto_sbmpsto => :P272_ID_IMPSTO_SBIMPSTO',
'                                       , p_id_sjto_impsto    => :P273_ID_SJTO_IMPSTO',
'                                       , p_id_usrio          => :F_ID_USRIO',
'                                       , p_cnsctvo           => :P273_CNSCUTVO  ',
'                                       , p_cdgo_cnsctvo      => ''PYZ''',
'                                       , p_id_plntlla        => :P273_ID_PLNTLLA ',
'                                       , o_id_acto           => v_id_acto',
'                                       , o_cdgo_rspsta       => v_cdgo_rspsta',
'                                       , o_mnsje_rspsta      => v_mnsje_rspsta);',
'',
'    if(v_cdgo_rspsta <> 0 ) then ',
'        raise_application_error( -20001 , v_mnsje_rspsta);',
'    else',
'       apex_util.set_session_state(''P273_ID_ACTO'', v_id_acto);  ',
'    end if;',
'                                   ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(59573958308889960)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(59575992262889968)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar_cartera'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_suma          number;',
'   v_cdgo_sjto_tpo varchar2(1);',
'',
'   v_vgncia_matricula number;',
'   vgncia_inicia      number := null;',
'   v_cont             number := 0;',
'   v_cont_vgncia      number := 0;',
'   v_estdo_sjto       number;',
'begin',
'',
'',
'   --consulta de impuestos ',
'   begin',
'      select jk.cdgo_sjto_tpo,id_sjto_estdo',
'        into v_cdgo_sjto_tpo,v_estdo_sjto',
'        from v_si_i_sujetos_impuesto jk',
'       where jk.cdgo_clnte = :F_CDGO_CLNTE',
'         and jk.id_sjto_impsto = :P273_ID_SJTO_IMPSTO;',
'   exception',
'      when others then',
'         null;',
'   end;',
'   ',
'   if v_estdo_sjto = 1 then',
'   ',
'       pkg_gf_movimientos_financiero.prc_ac_concepto_consolidado(p_cdgo_clnte             => :F_CDGO_CLNTE,',
'                                                                 p_id_sjto_impsto         => :P273_ID_SJTO_IMPSTO);',
'       commit;',
'',
'',
'       if v_cdgo_sjto_tpo = ''V'' then',
'          /*consulta la vigencia de matrticula del vehiculo*/',
'          select to_number(to_char(vi.fcha_mtrcla, ''yyyy'')) as fecha_matricula',
'            into v_vgncia_matricula',
'            from si_i_vehiculos vi',
'           where vi.id_sjto_impsto = :P273_ID_SJTO_IMPSTO;',
'',
'',
'          /*parametro inicial de vigencia de vehiculo */',
'          vgncia_inicia := pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte                => :F_CDGO_CLNTE,',
'                                                                           p_cdgo_dfncion_clnte_ctgria => ''GFN'',',
'                                                                           p_cdgo_dfncion_clnte        => ''VMC'');',
'',
'',
'          if v_vgncia_matricula > vgncia_inicia then',
'             vgncia_inicia := v_vgncia_matricula;',
'          end if;',
'',
'',
'          select count(*)',
'            into v_cont',
'            from gi_g_liquidaciones a',
'           where a.cdgo_clnte = :F_CDGO_CLNTE',
'             and a.id_impsto = :P272_ID_IMPSTO',
'             and a.id_impsto_sbmpsto = :P272_ID_IMPSTO_SBIMPSTO',
'             and a.id_sjto_impsto = :P273_ID_SJTO_IMPSTO',
'             and a.vgncia between vgncia_inicia and to_number(to_char(sysdate, ''yyyy''))',
'             and exists (select 1',
'                    from v_gf_g_cartera_x_vigencia x',
'                   where a.id_sjto_impsto = x.id_sjto_impsto',
'                     and a.id_lqdcion = x.id_orgen',
'                     and x.vgncia = a.vgncia',
'                     and x.cdgo_mvnt_fncro_estdo <> ''AN''',
'                     and vlor_sldo_cptal + vlor_intres = 0)',
'             and a.cdgo_lqdcion_estdo = ''L'';',
'',
'          v_cont_vgncia := to_number(to_char(sysdate, ''yyyy'')) - vgncia_inicia + 1;',
'',
'',
'          if v_cont = v_cont_vgncia then',
'              :P273_SUMA := 0;',
'             :P273_ESTDO := ''Paz y Salvo.'';',
'          else',
'              :P273_SUMA := 1;',
'             :P273_ESTDO := ''Con deuda.'';',
'          end if;',
'',
'',
'       else',
'',
'',
'          --Consultamos suma de todas las vigencias',
'          select nvl(sum(nvl(vlor_intres,0) + nvl(vlor_sldo_cptal,0)),0)',
'            into v_suma',
'            from v_gf_g_cartera_x_vigencia',
'           where id_sjto_impsto = :P273_ID_SJTO_IMPSTO',
'             and cdgo_clnte = :F_CDGO_CLNTE',
'             and id_impsto = :P272_ID_IMPSTO',
'             and id_impsto_sbmpsto = :P272_ID_IMPSTO_SBIMPSTO',
'             and cdgo_mvnt_fncro_estdo <> ''AN'';',
'',
'          :P273_SUMA := v_suma;',
'          if (v_suma > 0) then',
'             :P273_ESTDO := ''Con deuda.'';',
'          elsif (v_suma = 0) then',
'             :P273_ESTDO := ''Paz y Salvo.'';',
'          end if;',
'       end if;',
'    else',
'        :P273_ESTDO := ''No Activo'';',
'    end if;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(128472193337988301)
,p_process_sequence=>20
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
'     where id_acto = :P273_ID_ACTO; */',
'',
'',
'    select d.file_name ',
'        , d.file_mimetype',
'        ,(select pkg_gd_utilidades.fnc_co_blob(:P273_ID_ACTO) from dual) file_blob',
'      into v_file_name',
'         , v_file_mimetype ',
'         , v_file_blob',
'    from v_gn_g_actos d',
'    where id_acto = :P273_ID_ACTO; ',
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
