prompt --application/pages/page_00050
begin
wwv_flow_api.create_page(
 p_id=>50
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Declaraciones Entre Fechas'
,p_step_title=>'Declaraciones Entre Fechas'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_step_template=>wwv_flow_api.id(35710418378290397)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20210531161735'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73732964025992804)
,p_plug_name=>'Parametros'
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
 p_id=>wwv_flow_api.id(73734119844992816)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<br>',
'Funcionalidad que permite generar un Reporte con las declaraciones presentadas en un rango de fecha.',
unistr('	<br><br>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73734217128992817)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(73732964025992804)
,p_button_name=>'Imprimir'
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
 p_id=>wwv_flow_api.id(73734536859992820)
,p_branch_name=>'Ir al reporte'
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE:570&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(73734217128992817)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73733014280992805)
,p_name=>'P50_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(73732964025992804)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73733111032992806)
,p_name=>'P50_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(73732964025992804)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_impsto_sbmpsto,',
'        a.id_impsto_sbmpsto',
'from    df_i_impuestos_subimpuesto  a',
'where   a.id_impsto =   :P50_ID_IMPSTO',
'order by    a.nmbre_impsto_sbmpsto;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P50_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73733267821992807)
,p_name=>'P50_ID_DCLRCN_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(73732964025992804)
,p_prompt=>'Tipo Declaracion'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_dclrcn_tpo',
'from    gi_d_declaraciones_tipo a',
'where   a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and     a.id_impsto         =   nvl(:P50_ID_IMPSTO, a.id_impsto)',
'and     a.id_impsto_sbmpsto =   nvl(:P50_ID_IMPSTO_SBMPSTO, a.id_impsto_sbmpsto)',
'order by    a.dscrpcion;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P50_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73733321676992808)
,p_name=>'P50_VGNCIA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(73732964025992804)
,p_prompt=>'Vigencia'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.vgncia as text,',
'        a.vgncia as value',
'from    gi_d_dclrcnes_tpos_vgncias  a',
'where   a.id_dclrcn_tpo =   nvl(:P50_ID_DCLRCN_TPO, a.id_dclrcn_tpo)',
'group by    a.vgncia',
'order by    a.vgncia desc;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P50_ID_DCLRCN_TPO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73733472277992809)
,p_name=>'P50_ID_PRDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(73732964025992804)
,p_prompt=>'Periodo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.dscrpcion,',
'            b.id_prdo',
'from        gi_d_dclrcnes_tpos_vgncias  a',
'inner join  df_i_periodos               b   on  b.id_prdo   =   a.id_prdo',
'where       a.id_dclrcn_tpo =   :P50_ID_DCLRCN_TPO',
'and         a.vgncia        =   :P50_VGNCIA',
'order by    b.prdo;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P50_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73733566113992810)
,p_name=>'P50_IDNTFCCION_SJTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(73732964025992804)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73733655266992811)
,p_name=>'P50_ID_SJTO_TPO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(73732964025992804)
,p_prompt=>'Tipo de Sujeto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_sjto_tpo,',
'        a.id_sjto_tpo',
'from    DF_I_SUJETOS_TIPO   a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE',
'and     a.id_impsto     =   nvl(:P50_ID_IMPSTO, a.id_impsto)',
'order by    a.nmbre_sjto_tpo;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P50_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73733717286992812)
,p_name=>'P50_FCHA_INCIAL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(73732964025992804)
,p_item_default=>'add_months(sysdate, -1)'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Inicial'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" '
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73733872963992813)
,p_name=>'P50_FCHA_FNAL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(73732964025992804)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Final'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P50_FCHA_INCIAL.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(73733934447992814)
,p_name=>unistr('Fecha final m\00EDnima')
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P50_FCHA_INCIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73734098173992815)
,p_event_id=>wwv_flow_api.id(73733934447992814)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P50_FCHA_FNAL").datepicker( ''option'' , ''minDate'' , $("#P50_FCHA_FNAL").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73734491382992819)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Generar JSON impresi\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmbre_rprte gn_d_reportes.nmbre_rprte%type;',
'    v_object json_object_t := json_object_t();  ',
'    v_json                 clob;  ',
'begin    ',
'    select nmbre_rprte',
'      into v_nmbre_rprte',
'      from gn_d_reportes',
'     where id_rprte = 572;--:P39_ID_RPRTE;',
'',
'   v_object.put(''nmbre_rprte'', v_nmbre_rprte);',
'   v_object.put(''p_id_impsto'', :P50_ID_IMPSTO);',
'   v_object.put(''p_id_impsto_sbmpsto'', :P50_ID_IMPSTO_SBMPSTO);',
'   v_object.put(''p_id_dclrcn_tpo'', :P50_ID_DCLRCN_TPO);',
'   v_object.put(''p_vgncia'', :P50_VGNCIA);',
'   v_object.put(''p_id_prdo'', :P50_ID_PRDO);',
'   v_object.put(''p_idntfccion_sjto'', :P50_IDNTFCCION_SJTO);',
'   v_object.put(''p_id_sjto_tpo'', :P50_ID_SJTO_TPO);',
'   v_object.put(''p_fcha_incial'', :P50_FCHA_INCIAL);',
'   v_object.put(''p_fcha_fnal'', :P50_FCHA_FNAL);',
'   v_json := v_object.to_clob();  ',
'   delete muerto;',
'   insert into muerto (c_001) values (v_json);',
'   apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );  ',
'   apex_util.set_session_state(''P37_JSON'', v_json);      ',
' ',
'exception',
'    when no_data_found then',
'         null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(73734217128992817)
);
end;
/
