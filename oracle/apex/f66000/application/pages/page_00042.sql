prompt --application/pages/page_00042
begin
wwv_flow_api.create_page(
 p_id=>42
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Acuerdo de Pago - Consolidado'
,p_step_title=>'Acuerdo de Pago - Consolidado'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(35710418378290397)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20220205090315'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22619100883403401)
,p_plug_name=>'Reportes Consolidados de Acuerdos de Pago'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22619255678403402)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
'    <p align="justify">Funcionalidad en donde se pueden generar los diferentes consolidados de acuerdos de pagos.<br> ',
'        ',
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(22620156000403411)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(22619100883403401)
,p_button_name=>'BTN_IMPRIMIR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(22620895610403418)
,p_branch_name=>'Imprimir Consolidado - Acuerdos de Pagos Realizados'
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP,42:P37_ID_RPRTE,P37_NMBRE_RPRTE:&P42_ID_RPRTE.,&P42_NMBRE_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(22620156000403411)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22619441350403404)
,p_name=>'P42_ID_RPRTE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(22619100883403401)
,p_prompt=>'Reporte'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select nmbre_rprte d',
'        , id_rprte r',
'     from gn_d_reportes',
'    where cdgo_rprte_grpo = ''CAP''',
'      and actvo            = ''S''',
';'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22619524966403405)
,p_name=>'P42_FCHA_INICIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(22619100883403401)
,p_prompt=>'Fecha Inicio'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>15
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22619687078403406)
,p_name=>'P42_FCHA_FIN'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(22619100883403401)
,p_prompt=>'Fecha Fin'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>15
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22620407981403414)
,p_name=>'P42_PLNTLLA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(22619100883403401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22622287671403432)
,p_name=>'P42_NMRO_CTAS_VNCIDAS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(22619100883403401)
,p_prompt=>unistr('N\00B0 Cuotas Vencidas')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'1'
,p_attribute_02=>'60'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(85163757845979603)
,p_name=>'P42_ID_CNVNIO_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(22619100883403401)
,p_prompt=>'Tipo Acuerdo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.dscrpcion, t.id_cnvnio_tpo',
'  from gf_d_convenios_tipo t',
' order by t.id_cnvnio_tpo'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35793844568290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22621555230403425)
,p_validation_name=>'Validar Fecha Inicio No nula'
,p_validation_sequence=>10
,p_validation=>'P42_FCHA_INICIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar #LABEL#'
,p_validation_condition=>'P42_PLNTLLA'
,p_validation_condition2=>'informe_acuerdo_pago_realizados:informe_acuerdo_pago_cuotas_pagadas:informe_acuerdo_pago_al_dia'
,p_validation_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_when_button_pressed=>wwv_flow_api.id(22620156000403411)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22621618523403426)
,p_validation_name=>'Validar Fecha Fin'
,p_validation_sequence=>20
,p_validation=>'P42_FCHA_FIN'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar #LABEL#'
,p_validation_condition=>'P42_PLNTLLA'
,p_validation_condition2=>'informe_acuerdo_pago_realizados:informe_acuerdo_pago_cuotas_pagadas'
,p_validation_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_when_button_pressed=>wwv_flow_api.id(22620156000403411)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22622661031403436)
,p_validation_name=>unistr('N\00B0 Cuotas Vendidas no nulo')
,p_validation_sequence=>30
,p_validation=>'P42_NMRO_CTAS_VNCIDAS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe ingresar #LABEL#'
,p_validation_condition=>'P42_PLNTLLA'
,p_validation_condition2=>'informe_acuerdo_pago_cuotas_vencidas'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(22620156000403411)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22620649677403416)
,p_name=>'Consultar plantilla'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_ID_RPRTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22620720768403417)
,p_event_id=>wwv_flow_api.id(22620649677403416)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_PLNTLLA'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select nmbre_plntlla',
'     from gn_d_reportes',
'    where id_rprte = :P42_ID_RPRTE'))
,p_attribute_07=>'P42_ID_RPRTE'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22621764446403427)
,p_name=>'Ocultar Fecha Fin'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_PLNTLLA'
,p_condition_element=>'P42_PLNTLLA'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'informe_acuerdo_pago_al_dia'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22621875398403428)
,p_event_id=>wwv_flow_api.id(22621764446403427)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_FCHA_FIN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22621902856403429)
,p_event_id=>wwv_flow_api.id(22621764446403427)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_FCHA_FIN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22622041441403430)
,p_name=>unistr('N\00FAmero de Cuotas Vencidas')
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_PLNTLLA'
,p_condition_element=>'P42_PLNTLLA'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'informe_acuerdo_pago_cuotas_vencidas,infrme_acrdo_pgo_ctas_vncdas_con'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22622121302403431)
,p_event_id=>wwv_flow_api.id(22622041441403430)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_NMRO_CTAS_VNCIDAS'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22622838458403438)
,p_event_id=>wwv_flow_api.id(22622041441403430)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_FCHA_INICIO,P42_FCHA_FIN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22622546726403435)
,p_event_id=>wwv_flow_api.id(22622041441403430)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_NMRO_CTAS_VNCIDAS'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22622730982403437)
,p_event_id=>wwv_flow_api.id(22622041441403430)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_FCHA_INICIO,P42_FCHA_FIN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(25327395526319102)
,p_name=>'Ocultar Fecha Fin_1'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_PLNTLLA'
,p_condition_element=>'P42_PLNTLLA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'informe_acuerdo_proximo_vencer'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25327484671319103)
,p_event_id=>wwv_flow_api.id(25327395526319102)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_FCHA_FIN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25327522436319104)
,p_event_id=>wwv_flow_api.id(25327395526319102)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_FCHA_FIN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22620917814403419)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Json'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_nmbre_rprte             gn_d_reportes.nmbre_rprte%type;',
'     v_object json_object_t := json_object_t(); ',
'     --v_id_rprte_prmtro         gn_t_reportes_parametro.id_rprte_prmtro%type;',
'     v_json                    clob;',
'begin     ',
'     --Busca el Nombre del Reporte',
'     select nmbre_rprte',
'       into v_nmbre_rprte',
'       from gn_d_reportes ',
'      where id_rprte = :P42_ID_RPRTE;',
'',
'    v_object.put(''fcha_incial''       ,:P42_FCHA_INICIO); ',
'    v_object.put(''fcha_fnal''         ,:P42_FCHA_FIN);',
'    v_object.put(''nmro_ctas_vncdas''  ,:P42_NMRO_CTAS_VNCIDAS);',
'    v_object.put(''id_cnvnio_tpo''     ,:P42_ID_CNVNIO_TPO);',
'    v_object.put(''nmbre_rprte''       ,v_nmbre_rprte);',
'    v_json   := v_object.to_clob();        ',
'         ',
'    apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );    ',
'    apex_util.set_session_state(''P37_JSON'', v_json);',
'    ',
'	exception',
'		 when no_data_found then',
'			  null;',
'	end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22619984446403409)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consolidado - Acuerdos de Pagos Realizados'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sssion             number  := :APP_SESSION;',
'    v_ttal_cnvnio           number  := 0;',
'    v_ttal_cptal_ap         number  := 0;',
'    v_ttal_intres_ap        number  := 0;',
'    v_ttal_ap               number  := 0;',
'    v_ttal_cptal_pgar       number  := 0;',
'    v_ttal_intres_pgar      number  := 0;',
'    v_ttal_pgar             number  := 0;',
'    ',
'    v_ttal_cnvnio_impsto        number  := 0;',
'    v_ttal_cptal_ap_gnral       number  := 0;',
'    v_ttal_intres_ap_gnral      number  := 0;',
'    v_ttal_ap_gnral             number  := 0;',
'    v_ttal_cptal_pgar_gnral     number  := 0;',
'    v_ttal_intres_pgar_gnral    number  := 0;',
'    v_ttal_pgar_gnral           number  := 0;',
'    ',
'begin',
'    delete from gn_g_temporal where id_ssion = v_id_sssion; commit;',
'    for c_cnvnios in ( select id_impsto',
'                            , nmbre_impsto',
'                            , count(a.id_cnvnio)        ttal_cnvnio',
'                        from v_gf_g_convenios           a',
'                       where a.cdgo_clnte               = :F_CDGO_CLNTE',
'                         and a.cdgo_cnvnio_estdo        = ''APL''',
'                         and trunc(a.fcha_slctud)      between :P42_FCHA_INICIO and :P42_FCHA_FIN',
'                     group by id_impsto',
'                            , nmbre_impsto',
'                     ) loop',
'            DBMS_OUTPUT.put_line(''Impuesto: '' || c_cnvnios.id_impsto || '' - '' || c_cnvnios.nmbre_impsto);',
'            v_ttal_cnvnio_impsto    := v_ttal_cnvnio_impsto + c_cnvnios.ttal_cnvnio;',
'            DBMS_OUTPUT.put_line(''Total Convenios: '' || v_ttal_cnvnio_impsto);',
'        for c_crtera in (select b.id_cncpto',
'                              , c.cdgo_cncpto',
'                              , c.dscrpcion',
'                              , sum(b.vlor_cptal)                             ttal_cptal_ap',
'                              , sum(b.vlor_intres)                            ttal_intres_ap',
'                              , sum(b.vlor_cptal) + sum(b.vlor_intres)        ttal_ap',
'                              , sum(d.vlor_sldo_cptal)                        ttal_cptal_pgar',
'                              , sum(d.vlor_intres)                            ttal_intres_pgar',
'                              , sum(d.vlor_sldo_cptal) + sum(d.vlor_intres)   ttal_pgar',
'                           from gf_g_convenios                a',
'                           join gf_g_convenios_cartera        b on a.id_cnvnio          = b.id_cnvnio',
'                           join v_df_i_conceptos              c on b.id_cncpto          = c.id_cncpto',
'                           join gf_g_mvmntos_cncpto_cnslddo   d on a.id_sjto_impsto     = d.id_sjto_impsto',
'                            and b.id_cncpto                   = d.id_cncpto',
'                          where c.id_impsto                   = c_cnvnios.id_impsto',
'                            and a.cdgo_cnvnio_estdo           = ''APL''',
'                            and trunc(a.fcha_slctud)          between :P42_FCHA_INICIO and :P42_FCHA_FIN',
'                       group by b.id_cncpto',
'                              , c.cdgo_cncpto',
'                              , c.dscrpcion',
'                        ) loop',
'            ',
'            insert into gn_g_temporal (id_ssion,                                c001,                       c002',
'                                     , c003,                                    n001',
'                                     , c004,                                    c005,                       c006,',
'                                       c007,                                    c008,                       c009)',
'                               values (v_id_sssion,                             c_cnvnios.nmbre_impsto,     v_ttal_cnvnio_impsto',
'                                     , c_crtera.cdgo_cncpto || '' - '' || initcap(c_crtera.dscrpcion), 1',
'                                     , c_crtera.ttal_cptal_ap,                  c_crtera.ttal_intres_ap,    c_crtera.ttal_ap',
'                                     , c_crtera.ttal_cptal_pgar,                c_crtera.ttal_intres_pgar,  c_crtera.ttal_pgar);',
'            commit;',
'            v_ttal_cptal_ap         := v_ttal_cptal_ap      + c_crtera.ttal_cptal_ap;',
'            v_ttal_intres_ap        := v_ttal_intres_ap     + c_crtera.ttal_intres_ap;',
'            v_ttal_ap               := v_ttal_ap            + c_crtera.ttal_ap;',
'            v_ttal_cptal_pgar       := v_ttal_cptal_pgar    + c_crtera.ttal_cptal_pgar;',
'            v_ttal_intres_pgar      := v_ttal_intres_pgar   + c_crtera.ttal_intres_pgar;',
'            v_ttal_pgar             := v_ttal_pgar          + c_crtera.ttal_pgar;',
'            ',
'        end loop;',
'        ',
'        insert into gn_g_temporal (id_ssion,                                c001,                       c002',
'                                 , c003,                                    n001',
'                                 , c004,                                    c005,                       c006,',
'                                   c007,                                    c008,                       c009)',
'                           values (v_id_sssion,                             c_cnvnios.nmbre_impsto,     v_ttal_cnvnio_impsto',
'                                 , ''SUBTOTAL '' || c_cnvnios.nmbre_impsto,   2',
'                                 , v_ttal_cptal_ap,                         v_ttal_intres_ap,           v_ttal_ap',
'                                 , v_ttal_cptal_pgar,                       v_ttal_intres_pgar,         v_ttal_pgar);',
'            commit;',
'        ',
'        v_ttal_cnvnio               := v_ttal_cnvnio            + v_ttal_cnvnio_impsto;        ',
'        v_ttal_cptal_ap_gnral       := v_ttal_cptal_ap_gnral    + v_ttal_cptal_ap;    ',
'        v_ttal_intres_ap_gnral      := v_ttal_intres_ap_gnral   + v_ttal_intres_ap;    ',
'        v_ttal_ap_gnral             := v_ttal_ap_gnral          + v_ttal_ap;    ',
'        v_ttal_cptal_pgar_gnral     := v_ttal_cptal_pgar_gnral  + v_ttal_cptal_pgar;    ',
'        v_ttal_intres_pgar_gnral    := v_ttal_intres_pgar_gnral + v_ttal_intres_pgar;    ',
'        v_ttal_pgar_gnral           := v_ttal_pgar_gnral        + v_ttal_pgar;    ',
'        ',
'        v_ttal_cnvnio_impsto    := 0;',
'        v_ttal_cptal_ap         := 0;',
'        v_ttal_intres_ap        := 0;',
'        v_ttal_ap               := 0;',
'        v_ttal_cptal_pgar       := 0;',
'        v_ttal_intres_pgar      := 0;',
'        v_ttal_pgar             := 0;',
'    end loop;',
'        ',
'        insert into gn_g_temporal (id_ssion,                    c001,                       c002',
'                                 , c003,                        n001',
'                                 , c004,                        c005,                       c006,',
'                                   c007,                        c008,                       c009)',
'                           values (v_id_sssion,                 '''',                         v_ttal_cnvnio',
'                                 , ''TOTAL '',                    3',
'                                 , v_ttal_cptal_ap_gnral,       v_ttal_intres_ap_gnral,     v_ttal_ap_gnral',
'                                 , v_ttal_cptal_pgar_gnral,     v_ttal_intres_pgar_gnral,   v_ttal_pgar_gnral);',
'            commit;',
'end;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(22620156000403411)
,p_process_when=>'P42_PLNTLLA'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'informe_acuerdo_pago_realizados'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22621062701403420)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consolidado - Acuerdos de Pagos Cuotas Pagadas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sssion             number  := :APP_SESSION;',
'    v_ttal_cnvnio           number  := 0;',
'    v_ttal_cptal_ap         number  := 0;',
'    v_ttal_intres_ap        number  := 0;',
'    v_ttal_ap               number  := 0;',
'    ',
'    v_ttal_cnvnio_impsto        number  := 0;',
'    v_ttal_cptal_ap_gnral       number  := 0;',
'    v_ttal_intres_ap_gnral      number  := 0;',
'    v_ttal_ap_gnral             number  := 0;',
'    ',
'begin',
'    delete from gn_g_temporal where id_ssion = v_id_sssion; commit;',
'',
'    for c_cnvnios in ( select a.id_impsto',
'                            , a.nmbre_impsto',
'                            , count(distinct a.id_cnvnio)   ttal_cnvnio',
'                         from v_gf_g_convenios              a',
'                         join gf_g_convenios_extracto       b on a.id_cnvnio        = b.id_cnvnio',
'                        where a.cdgo_clnte                  = :F_CDGO_CLNTE',
'                          and b.indcdor_cta_pgda            = ''S''',
'                          and trunc(b.fcha_pgo_cta)         between :P42_FCHA_INICIO and :P42_FCHA_FIN',
'                          and b.id_dcmnto_cta               is not null',
'                     group by a.id_impsto',
'                            , a.nmbre_impsto',
'                     ) loop',
'            v_ttal_cnvnio_impsto    := v_ttal_cnvnio_impsto + c_cnvnios.ttal_cnvnio;',
'            ',
'        for c_crtera in (  select c.id_cncpto',
'                                , d.cdgo_cncpto',
'                                , d.dscrpcion',
'                                , sum(nvl(c.vlor_dbe, 0))               ttal_cptal_ap',
'                                , sum((select nvl(sum(m.vlor_dbe) , 0)',
'                                     from re_g_documentos_detalle   m ',
'                                    where m.id_dcmnto               = b.id_dcmnto_cta ',
'                                      and m.cdgo_cncpto_tpo         = ''I'' ',
'                                      and m.id_mvmnto_dtlle         = c.id_mvmnto_dtlle)) ttal_intres_ap',
'                             from gf_g_convenios                a',
'                             join gf_g_convenios_extracto       b on a.id_cnvnio        = b.id_cnvnio',
'                             join re_g_documentos_detalle       c on b.id_dcmnto_cta    = c.id_dcmnto',
'                              and c.cdgo_cncpto_tpo             = ''C''',
'                             join v_df_i_conceptos              d on c.id_cncpto        = d.id_cncpto',
'                            where a.cdgo_clnte                  = :F_CDGO_CLNTE',
'                              and b.indcdor_cta_pgda            = ''S''',
'                              and trunc(b.fcha_pgo_cta)         between :P42_FCHA_INICIO and :P42_FCHA_FIN',
'                              and b.id_dcmnto_cta               is not null',
'                              and d.id_impsto                   = c_cnvnios.id_impsto',
'                         group by c.id_cncpto',
'                                , d.cdgo_cncpto',
'                                , d.dscrpcion',
'',
'                        ) loop',
'            ',
'            insert into gn_g_temporal (id_ssion,                                c001,                       c002',
'                                     , c003,                                    n001',
'                                     , c004,                                    c005,                       c006)',
'                               values (v_id_sssion,                             c_cnvnios.nmbre_impsto,     v_ttal_cnvnio_impsto',
'                                     , c_crtera.cdgo_cncpto || '' - '' || initcap(c_crtera.dscrpcion), 1',
'                                     , c_crtera.ttal_cptal_ap,                  c_crtera.ttal_intres_ap,    (c_crtera.ttal_cptal_ap + c_crtera.ttal_intres_ap));',
'            commit;',
'            v_ttal_cptal_ap         := v_ttal_cptal_ap      + c_crtera.ttal_cptal_ap;',
'            v_ttal_intres_ap        := v_ttal_intres_ap     + c_crtera.ttal_intres_ap;',
'            v_ttal_ap               := v_ttal_ap            + (c_crtera.ttal_cptal_ap + c_crtera.ttal_intres_ap);',
'            ',
'        end loop;',
'        ',
'        insert into gn_g_temporal (id_ssion,                                c001,                       c002',
'                                 , c003,                                    n001',
'                                 , c004,                                    c005,                       c006)',
'                           values (v_id_sssion,                             c_cnvnios.nmbre_impsto,     v_ttal_cnvnio_impsto',
'                                 , ''SUBTOTAL '' || c_cnvnios.nmbre_impsto,   2',
'                                 , v_ttal_cptal_ap,                         v_ttal_intres_ap,           v_ttal_ap);',
'        commit;',
'        ',
'        v_ttal_cnvnio               := v_ttal_cnvnio            + v_ttal_cnvnio_impsto;        ',
'        v_ttal_cptal_ap_gnral       := v_ttal_cptal_ap_gnral    + v_ttal_cptal_ap;    ',
'        v_ttal_intres_ap_gnral      := v_ttal_intres_ap_gnral   + v_ttal_intres_ap;    ',
'        v_ttal_ap_gnral             := v_ttal_ap_gnral          + v_ttal_ap;   ',
'        ',
'        v_ttal_cnvnio_impsto    := 0;',
'        v_ttal_cptal_ap         := 0;',
'        v_ttal_intres_ap        := 0;',
'        v_ttal_ap               := 0;',
'    end loop;',
'        ',
'        insert into gn_g_temporal (id_ssion,                    c001,                       c002',
'                                 , c003,                        n001',
'                                 , c004,                        c005,                       c006)',
'                           values (v_id_sssion,                 '''',                         v_ttal_cnvnio',
'                                 , ''TOTAL '',                    3',
'                                 , v_ttal_cptal_ap_gnral,       v_ttal_intres_ap_gnral,     v_ttal_ap_gnral);',
'        commit;',
'end;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(22620156000403411)
,p_process_when=>'P42_PLNTLLA'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'informe_acuerdo_pago_cuotas_pagadas'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22621203999403422)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consolidado - Acuerdos de Pagos al D\00EDa')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sssion                 number  := :APP_SESSION;',
'    ',
'    v_ttal_cnvnio_impsto        number  := 0;',
'    v_ttal_cptal_ap             number  := 0;',
'    v_ttal_intres_ap            number  := 0;',
'    v_ttal_ap                   number  := 0;    ',
'    ',
'    v_ttal_cnvnio               number  := 0;',
'    v_ttal_cptal_ap_gnral       number  := 0;',
'    v_ttal_intres_ap_gnral      number  := 0;',
'    v_ttal_ap_gnral             number  := 0;',
'    ',
'begin',
'    delete from gn_g_temporal where id_ssion = v_id_sssion; commit;',
'    for c_cnvnios in ( select *',
'                         from v_gf_g_convenios_extracto     a',
'                        where a.cdgo_clnte                  = :F_CDGO_CLNTE',
'                          and a.indcdor_cta_pgda            = ''S''',
'                          and a.fcha_vncmnto                >= a.fcha_pgo_cta',
'                          and a.nmro_cta                    = (select max(m.nmro_cta)',
'                                                                 from v_gf_g_convenios_extracto     m',
'                                                                where m.cdgo_clnte                  = :F_CDGO_CLNTE',
'                                                                  and m.id_cnvnio                   = a.id_cnvnio',
'                                                                  and m.fcha_vncmnto                <=  trunc(to_date(:P42_FCHA_INICIO)))',
'                     ) loop',
'            ',
'        for c_crtera in (  select d.id_impsto',
'                                , d.nmbre_impsto',
'                                , c.id_cncpto',
'                                , d.cdgo_cncpto',
'                                , d.dscrpcion',
'                                , sum(nvl(c.vlor_dbe, 0))               ttal_cptal_ap',
'                                , sum((select nvl(sum(m.vlor_dbe) , 0)',
'                                     from re_g_documentos_detalle   m ',
'                                    where m.id_dcmnto               = b.id_dcmnto_cta ',
'                                      and m.cdgo_cncpto_tpo         = ''I'' ',
'                                      and m.id_mvmnto_dtlle         = c.id_mvmnto_dtlle)) ttal_intres_ap',
'                             from gf_g_convenios                a',
'                             join gf_g_convenios_extracto       b on a.id_cnvnio        = b.id_cnvnio',
'                             join re_g_documentos_detalle       c on b.id_dcmnto_cta    = c.id_dcmnto',
'                              and c.cdgo_cncpto_tpo             = ''C''',
'                             join v_df_i_conceptos              d on c.id_cncpto        = d.id_cncpto',
'                            where a.cdgo_clnte                  = :F_CDGO_CLNTE',
'                              and a.id_cnvnio                   = c_cnvnios.id_cnvnio',
'                              and b.nmro_cta                    <= c_cnvnios.nmro_cta',
'                         group by d.id_impsto',
'                                , d.nmbre_impsto',
'                                , c.id_cncpto',
'                                , d.cdgo_cncpto',
'                                , d.dscrpcion',
'',
'                        ) loop',
'            ',
'            insert into gn_g_temporal (id_ssion,                                c001,                       c002',
'                                     , c003,                                    n001,                       n002',
'                                     , c004,                                    c005,                       c006)',
'                               values (v_id_sssion,                             c_crtera.nmbre_impsto,      c_cnvnios.id_cnvnio',
'                                     , c_crtera.cdgo_cncpto || '' - '' || initcap(c_crtera.dscrpcion), 0,     c_crtera.id_impsto',
'                                     , c_crtera.ttal_cptal_ap,                  c_crtera.ttal_intres_ap,    (c_crtera.ttal_cptal_ap + c_crtera.ttal_intres_ap));',
'            commit;',
'            v_ttal_cptal_ap         := v_ttal_cptal_ap      + c_crtera.ttal_cptal_ap;',
'            v_ttal_intres_ap        := v_ttal_intres_ap     + c_crtera.ttal_intres_ap;',
'            v_ttal_ap               := v_ttal_ap            + (c_crtera.ttal_cptal_ap + c_crtera.ttal_intres_ap);',
'            ',
'        end loop;',
'    end loop;',
'    ',
'    v_ttal_cnvnio_impsto        := 0;',
'    v_ttal_cptal_ap             := 0;',
'    v_ttal_intres_ap            := 0;',
'    v_ttal_ap                   := 0;    ',
'    ',
'    v_ttal_cnvnio               := 0;',
'    v_ttal_cptal_ap_gnral       := 0;',
'    v_ttal_intres_ap_gnral      := 0;',
'    v_ttal_ap_gnral             := 0;',
'    ',
'    -- Consolidado',
'    for c_impstos in ( select n002  id_impsto',
'                            , c001  nmbre_impsto',
'                            , count(distinct c002 ) ttal_cnvnio',
'                         from gn_g_temporal ',
'                        where id_ssion              = v_id_sssion',
'                          and n001                  = 0',
'                     group by n002',
'                            , c001',
'                     order by nmbre_impsto) loop',
'            DBMS_OUTPUT.put_line(''Impuesto: '' || c_impstos.nmbre_impsto);',
'            v_ttal_cnvnio_impsto    := v_ttal_cnvnio_impsto + c_impstos.ttal_cnvnio;',
'            DBMS_OUTPUT.put_line(''Total Convenios: '' || v_ttal_cnvnio_impsto);',
'    ',
'        for c_crtera in (  select c003          dscrpcion',
'                                , sum(c004)     ttal_cptal_ap',
'                                , sum(c005)     ttal_intres_ap',
'                                , sum(c006)     ttal_ap',
'                             from gn_g_temporal ',
'                            where id_ssion      = v_id_sssion',
'                              and n001          = 0',
'                              and n002          = c_impstos.id_impsto',
'                         group by c003',
'                         order by dscrpcion ) loop',
'        ',
'            insert into gn_g_temporal (id_ssion,                        c001,                       c002',
'                                     , c003,                            n001',
'                                     , c004,                            c005,                       c006)',
'                               values (v_id_sssion,                     c_impstos.nmbre_impsto,     v_ttal_cnvnio_impsto',
'                                     , c_crtera.dscrpcion,              1',
'                                     , c_crtera.ttal_cptal_ap,          c_crtera.ttal_intres_ap,    c_crtera.ttal_ap);',
'            commit;',
'            v_ttal_cptal_ap         := v_ttal_cptal_ap      + c_crtera.ttal_cptal_ap;',
'            v_ttal_intres_ap        := v_ttal_intres_ap     + c_crtera.ttal_intres_ap;',
'            v_ttal_ap               := v_ttal_ap            + c_crtera.ttal_ap; ',
'        end loop;',
'        ',
'        insert into gn_g_temporal (id_ssion,                                c001,                       c002',
'                                 , c003,                                    n001',
'                                 , c004,                                    c005,                       c006)',
'                           values (v_id_sssion,                             c_impstos.nmbre_impsto,     v_ttal_cnvnio_impsto',
'                                 , ''SUBTOTAL '' || c_impstos.nmbre_impsto,   2',
'                                 , v_ttal_cptal_ap,                         v_ttal_intres_ap,           v_ttal_ap);',
'        commit;',
'        ',
'        v_ttal_cnvnio               := v_ttal_cnvnio            + v_ttal_cnvnio_impsto;        ',
'        v_ttal_cptal_ap_gnral       := v_ttal_cptal_ap_gnral    + v_ttal_cptal_ap;    ',
'        v_ttal_intres_ap_gnral      := v_ttal_intres_ap_gnral   + v_ttal_intres_ap;    ',
'        v_ttal_ap_gnral             := v_ttal_ap_gnral          + v_ttal_ap;  ',
'        ',
'        v_ttal_cnvnio_impsto    := 0;',
'        v_ttal_cptal_ap         := 0;',
'        v_ttal_intres_ap        := 0;',
'        v_ttal_ap               := 0;',
'    end loop;',
'        ',
'    insert into gn_g_temporal (id_ssion,                    c001,                       c002',
'                             , c003,                        n001',
'                             , c004,                        c005,                       c006)',
'                       values (v_id_sssion,                 '''',                         v_ttal_cnvnio',
'                             , ''TOTAL '',                    3',
'                             , v_ttal_cptal_ap_gnral,       v_ttal_intres_ap_gnral,     v_ttal_ap_gnral);',
'    commit;',
'end;    '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(22620156000403411)
,p_process_when=>'P42_PLNTLLA'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'informe_acuerdo_pago_al_dia'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(25327293549319101)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consolidado - Acuerdos de Pago Terminados'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sssion                 number  := :APP_SESSION ;',
'    ',
'    v_ttal_cnvnio_impsto        number  := 0;',
'    v_ttal_cptal_ap             number  := 0;',
'    v_ttal_intres_ap            number  := 0;',
'    v_ttal_ap                   number  := 0;    ',
'    ',
'    v_ttal_cnvnio               number  := 0;',
'    v_ttal_cptal_ap_gnral       number  := 0;',
'    v_ttal_intres_ap_gnral      number  := 0;',
'    v_ttal_ap_gnral             number  := 0;',
'    ',
'begin',
'    delete from gn_g_temporal where id_ssion = v_id_sssion; commit;',
'    for c_cnvnios in ( select a.id_impsto',
'                            , a.nmbre_impsto',
'                            , count(distinct a.id_cnvnio)   ttal_cnvnio',
'                         from v_gf_g_convenios              a',
'                         join gf_g_convenios_extracto       b on a.id_cnvnio        = b.id_cnvnio',
'                          and b.actvo                       = ''S''',
'                          and b.indcdor_cta_pgda            = ''S''',
'                          and b.id_dcmnto_cta               is not null',
'                        where a.cdgo_clnte                  = :F_CDGO_CLNTE',
'                          and a.cdgo_cnvnio_estdo           = ''FNL''',
'                          --and trunc(a.fcha_fnlzcion)         between :P_FCHA_INCIO and :P_FCHA_FIN',
'                     group by a.id_impsto',
'                            , a.nmbre_impsto',
'                     ) loop',
'            v_ttal_cnvnio_impsto    := v_ttal_cnvnio_impsto + c_cnvnios.ttal_cnvnio;',
'            ',
'        for c_crtera in (  select a.nmro_cnvnio',
'                                , a.nmro_cta',
'                                , count(distinct b.nmro_cta)            ttal_ctas_pgdas',
'                                , c.id_cncpto',
'                                , d.cdgo_cncpto',
'                                , d.dscrpcion',
'                                , sum(nvl(c.vlor_dbe, 0))               ttal_cptal_ap',
'                                , sum((select nvl(sum(m.vlor_dbe) , 0)',
'                                     from re_g_documentos_detalle   m ',
'                                    where m.id_dcmnto               = b.id_dcmnto_cta ',
'                                      and m.cdgo_cncpto_tpo         = ''I'' ',
'                                      and m.id_mvmnto_dtlle         = c.id_mvmnto_dtlle)) ttal_intres_ap',
'                             from gf_g_convenios                a',
'                             join gf_g_convenios_extracto       b on a.id_cnvnio        = b.id_cnvnio',
'                              and b.actvo                       = ''S''',
'                              and b.indcdor_cta_pgda            = ''S''',
'                              and b.id_dcmnto_cta               is not null',
'                             join re_g_documentos_detalle       c on b.id_dcmnto_cta    = c.id_dcmnto',
'                              and c.cdgo_cncpto_tpo             = ''C''',
'                             join v_df_i_conceptos              d on c.id_cncpto        = d.id_cncpto',
'                            where a.cdgo_clnte                  = :F_CDGO_CLNTE',
'                              and a.cdgo_cnvnio_estdo           = ''FNL''',
'                              -- and trunc(a.fcha_fnlzcion)         between :P_FCHA_INCIO and :P_FCHA_FIN',
'                              and d.id_impsto                   = c_cnvnios.id_impsto',
'                         group by a.nmro_cnvnio',
'                                , a.nmro_cta',
'                                , c.id_cncpto',
'                                , d.cdgo_cncpto',
'                                , d.dscrpcion',
'',
'                        ) loop',
'            ',
'            insert into gn_g_temporal (id_ssion,                                c001,                       c002',
'                                     , c003,                                    n001',
'                                     , c004,                                    c005,                       c006',
'                                     , c007,                                    c008,                       c009)',
'                               values (v_id_sssion,                             c_cnvnios.nmbre_impsto,     v_ttal_cnvnio_impsto',
'                                     , c_crtera.cdgo_cncpto || '' - '' || initcap(c_crtera.dscrpcion), 1',
'                                     , c_crtera.ttal_cptal_ap,                  c_crtera.ttal_intres_ap,    (c_crtera.ttal_cptal_ap + c_crtera.ttal_intres_ap)',
'                                     , c_crtera.nmro_cnvnio,                    c_crtera.nmro_cta,          c_crtera.ttal_ctas_pgdas);',
'            commit;',
'            v_ttal_cptal_ap         := v_ttal_cptal_ap      + c_crtera.ttal_cptal_ap;',
'            v_ttal_intres_ap        := v_ttal_intres_ap     + c_crtera.ttal_intres_ap;',
'            v_ttal_ap               := v_ttal_ap            + (c_crtera.ttal_cptal_ap + c_crtera.ttal_intres_ap);',
'            ',
'        end loop;',
'        ',
'        insert into gn_g_temporal (id_ssion,                                c001,                       c002',
'                                 , c003,                                    n001',
'                                 , c004,                                    c005,                       c006)',
'                           values (v_id_sssion,                             c_cnvnios.nmbre_impsto,     v_ttal_cnvnio_impsto',
'                                 , ''SUBTOTAL '' || c_cnvnios.nmbre_impsto,   2',
'                                 , v_ttal_cptal_ap,                         v_ttal_intres_ap,           v_ttal_ap);',
'            commit;',
'        ',
'        v_ttal_cnvnio               := v_ttal_cnvnio            + v_ttal_cnvnio_impsto;        ',
'        v_ttal_cptal_ap_gnral       := v_ttal_cptal_ap_gnral    + v_ttal_cptal_ap;    ',
'        v_ttal_intres_ap_gnral      := v_ttal_intres_ap_gnral   + v_ttal_intres_ap;    ',
'        v_ttal_ap_gnral             := v_ttal_ap_gnral          + v_ttal_ap;  ',
'        ',
'        v_ttal_cnvnio_impsto    := 0;',
'        v_ttal_cptal_ap         := 0;',
'        v_ttal_intres_ap        := 0;',
'        v_ttal_ap               := 0;',
'    end loop;',
'        ',
'        insert into gn_g_temporal (id_ssion,                    c001,                       c002',
'                                 , c003,                        n001',
'                                 , c004,                        c005,                       c006)',
'                           values (v_id_sssion,                 '''',                         v_ttal_cnvnio',
'                                 , ''TOTAL '',                    3',
'                                 , v_ttal_cptal_ap_gnral,       v_ttal_intres_ap_gnral,     v_ttal_ap_gnral);',
'            commit;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(22620156000403411)
,p_process_when=>'P42_PLNTLLA'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'informe_acuerdo_terminados'
);
null;
end;
/
