prompt --application/pages/page_00034
begin
wwv_flow_api.create_page(
 p_id=>34
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>unistr('Imprimir Certificado Declaraci\00F3n ')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Imprimir Certificado Declaraci\00F3n ')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20200519140445'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27492675713010912)
,p_plug_name=>'Imprimir'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(27493415164010920)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(27492675713010912)
,p_button_name=>'Btn_imprimir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(27493525436010921)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE:&P34_ID_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(27493415164010920)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27492788805010913)
,p_name=>'P34_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(27492675713010912)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27492992452010915)
,p_name=>'P34_ID_DCLRCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(27492675713010912)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27493229513010918)
,p_name=>'P34_INDCDOR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(27492675713010912)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27493328704010919)
,p_name=>'P34_ID_RPRTE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(27492675713010912)
,p_prompt=>'Reporte'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select dscrpcion  as d ',
'       , id_rprte   as r',
'    from gn_d_plantillas',
'   where cdgo_clnte  = :F_CDGO_CLNTE',
'     and id_acto_tpo = (select id_acto_tpo',
'                          from gn_d_actos_tipo ',
'                         where cdgo_acto_tpo = ''CDU'')'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27493745497010923)
,p_name=>'P34_JSON'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(27492675713010912)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27493814562010924)
,p_name=>'P34_CNSCUTVO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(27492675713010912)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27755322610739704)
,p_name=>'P34_NMRO_DCLRCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(27492675713010912)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27493045348010916)
,p_name=>'Mostrar alerta'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_cond=>'P34_INDCDOR'
,p_display_when_cond2=>'0'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27493115038010917)
,p_event_id=>wwv_flow_api.id(27493045348010916)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.alert(''Aun no se ha realizado el pago para la declaraci\00F3n Seleccionada'');'),
'apex.navigation.dialog.cancel(true);',
'   ',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27755084246739701)
,p_name=>'Al seleccionar reporte'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P34_ID_RPRTE'
,p_condition_element=>'P34_ID_RPRTE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27755194770739702)
,p_event_id=>wwv_flow_api.id(27755084246739701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(27493415164010920)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27755221661739703)
,p_event_id=>wwv_flow_api.id(27755084246739701)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(27493415164010920)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(27493610841010922)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_object       json_object_t := json_object_t();',
'    v_id_plntlla   gn_d_plantillas.id_plntlla%type;',
'    v_id_acto_tpo  gn_d_plantillas.id_acto_tpo%type;',
'    ---Consultar datos de la declaracion',
'    v_lcncia clob;',
'    v_id_dstno clob;',
'    v_vlor_mtrs clob;',
'    v_cntdad_mtrs clob;',
'    v_vlor_cnclado clob;',
'    v_csto_mnmo_mtrs clob;',
'    v_dstno_obra varchar2(400);',
'    o_cdgo_rspsta number;',
'    o_mnsje_rspsta varchar2(400);',
'begin',
'            ',
'    begin',
'        --Consultamos el Destino de la obra',
'        pkg_gi_declaraciones.prc_co_homologacion   (  p_cdgo_clnte    => :F_CDGO_CLNTE,',
'                                                     p_cdgo_hmlgcion => ''FCD'',',
'                                                     p_cdgo_prpdad   => ''DLO'',',
'                                                     p_id_dclrcion   => :P34_ID_DCLRCION,',
'                                                     o_vlor          => v_id_dstno,',
'                                                     o_cdgo_rspsta   => o_cdgo_rspsta,',
'                                                     o_mnsje_rspsta  => o_mnsje_rspsta);',
'        select dscrpcion',
'          into v_dstno_obra   ',
'          from gi_d_dclrcns_esqma_trfa',
'          where id_dclrcns_esqma_trfa = to_number(v_id_dstno);',
'',
unistr('        --Consultamos el valor del metro cuadrado/c\00FAbico'),
'        pkg_gi_declaraciones.prc_co_homologacion   (  p_cdgo_clnte    => :F_CDGO_CLNTE,',
'                                                     p_cdgo_hmlgcion => ''FCD'',',
'                                                     p_cdgo_prpdad   => ''VM2'',',
'                                                     p_id_dclrcion   => :P34_ID_DCLRCION,',
'                                                     o_vlor          => v_vlor_mtrs,',
'                                                     o_cdgo_rspsta   => o_cdgo_rspsta,',
'                                                     o_mnsje_rspsta  => o_mnsje_rspsta);',
'',
'        --Consultamos la cantidad de metros',
'         pkg_gi_declaraciones.prc_co_homologacion   (  p_cdgo_clnte    => :F_CDGO_CLNTE,',
'                                                     p_cdgo_hmlgcion => ''FCD'',',
'                                                     p_cdgo_prpdad   => ''CM2'',',
'                                                     p_id_dclrcion   => :P34_ID_DCLRCION,',
'                                                     o_vlor          => v_cntdad_mtrs,',
'                                                     o_cdgo_rspsta   => o_cdgo_rspsta,',
'                                                     o_mnsje_rspsta  => o_mnsje_rspsta);',
'        --Consultamos el costo minimo',
'        pkg_gi_declaraciones.prc_co_homologacion   (  p_cdgo_clnte    => :F_CDGO_CLNTE,',
'                                                     p_cdgo_hmlgcion => ''FCD'',',
'                                                     p_cdgo_prpdad   => ''CMM2'',',
'                                                     p_id_dclrcion   => :P34_ID_DCLRCION,',
'                                                     o_vlor          => v_csto_mnmo_mtrs,',
'                                                     o_cdgo_rspsta   => o_cdgo_rspsta,',
'                                                     o_mnsje_rspsta  => o_mnsje_rspsta);',
'',
'        --Consultamos el valor cancelado',
'        pkg_gi_declaraciones.prc_co_homologacion   (  p_cdgo_clnte    => :F_CDGO_CLNTE,',
'                                                     p_cdgo_hmlgcion => ''FCD'',',
'                                                     p_cdgo_prpdad   => ''VLC'',',
'                                                     p_id_dclrcion   => :P34_ID_DCLRCION,',
'                                                     o_vlor          => v_vlor_cnclado,',
'                                                     o_cdgo_rspsta   => o_cdgo_rspsta,',
'                                                     o_mnsje_rspsta  => o_mnsje_rspsta);',
'        --Consultamos el numero Licencia',
'        pkg_gi_declaraciones.prc_co_homologacion   (  p_cdgo_clnte    => :F_CDGO_CLNTE,',
'                                                      p_cdgo_hmlgcion => ''FCD'',',
'                                                      p_cdgo_prpdad   => ''LCA'',',
'                                                      p_id_dclrcion   => :P34_ID_DCLRCION,',
'                                                      o_vlor          => v_lcncia,',
'                                                      o_cdgo_rspsta   => o_cdgo_rspsta,',
'                                                      o_mnsje_rspsta  => o_mnsje_rspsta);                                                         ',
'     exception',
'         when others then',
'             raise_application_error(-20111,''Error: No. ''||o_cdgo_rspsta||'' ''|| o_mnsje_rspsta);',
'    end;',
'          select id_plntlla',
'               , id_acto_tpo',
'            into v_id_plntlla',
'               , v_id_acto_tpo',
'            from gn_d_plantillas',
'           where cdgo_clnte = :F_CDGO_CLNTE',
'             and id_acto_tpo = (select id_acto_tpo',
'                                  from gn_d_actos_tipo ',
'                                 where cdgo_acto_tpo  = ''CDU'');',
'   :P34_CNSCUTVO := pkg_gn_generalidades.fnc_cl_consecutivo(:F_CDGO_CLNTE, ''CDU'');',
'',
'   v_object.put(''id_plntlla'', v_id_plntlla);',
'   v_object.put(''id_sjto_impsto'',:P34_ID_SJTO_IMPSTO);',
'   v_object.put(''id_dclrcion'', :P34_ID_DCLRCION);',
'   v_object.put(''id_acto_tpo'', v_id_acto_tpo);',
'   v_object.put(''cnsctvo'',:P34_CNSCUTVO);',
'   v_object.put(''vlor_mtrs'',v_vlor_mtrs);',
'   v_object.put(''cntdad_mtrs'',v_cntdad_mtrs);',
'   v_object.put(''vlor_cnclado'',v_vlor_cnclado);',
'   v_object.put(''csto_mnmo_mtrs'',v_csto_mnmo_mtrs);   ',
'   v_object.put(''dstno_obra'',v_dstno_obra);   ',
'   v_object.put(''lcncia'',v_lcncia);   ',
'   ',
'',
'   :P34_JSON :=v_object.to_clob();   ',
'    apex_util.set_session_state(''P37_JSON'', :P34_JSON );',
'null;',
'    exception',
'         when no_data_found then',
'              null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(27492845921010914)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Declaraci\00F3n ')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    select 1',
'      into :P34_INDCDOR',
'      from gi_g_declaraciones a',
'      join re_g_recaudos b  on a.id_rcdo = b.id_rcdo                                ',
'     where a.id_dclrcion = :P34_ID_DCLRCION',
'       and b.cdgo_rcdo_estdo =  ''AP'';',
'    ',
'exception ',
'    when no_data_found then ',
'      :P34_INDCDOR := 0;',
'   ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
