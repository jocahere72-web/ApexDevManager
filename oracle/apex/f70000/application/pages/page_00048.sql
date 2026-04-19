prompt --application/pages/page_00048
begin
wwv_flow_api.create_page(
 p_id=>48
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Fecha Formulario Vigencia-Periodo'
,p_page_mode=>'MODAL'
,p_step_title=>'Fecha Formulario Vigencia-Periodo'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'400'
,p_dialog_width=>'800'
,p_dialog_chained=>'N'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20190826142338'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13893282554102219)
,p_plug_name=>'Fecha Formulario Vigencia-Periodo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13894237599102229)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(13893282554102219)
,p_button_name=>'BTN_SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P48_ID_FRMLRIOS_VGNCIA_PRDO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-floppy-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13894099927102227)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(13893282554102219)
,p_button_name=>'BTN_INSRTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P48_ID_FRMLRIOS_VGNCIA_PRDO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13893310506102220)
,p_name=>'P48_FCHA_INCIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(13893282554102219)
,p_prompt=>'Fecha Inicio'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13893407544102221)
,p_name=>'P48_FCHA_FIN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(13893282554102219)
,p_prompt=>'Fecha Fin'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13893632630102223)
,p_name=>'P48_ID_FRMLRIOS_VGNCIA_PRDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(13893282554102219)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13893731342102224)
,p_name=>'P48_ID_FRMLRIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(13893282554102219)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13893838477102225)
,p_name=>'P48_VGNCIA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(13893282554102219)
,p_prompt=>'Vigencia'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13893916320102226)
,p_name=>'P48_PRDO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(13893282554102219)
,p_prompt=>'Periodo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PERIODO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d,',
'         id_prdo r ',
'  from df_i_periodos',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P48_VGNCIA'
,p_ajax_items_to_submit=>'P48_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13894626981102233)
,p_name=>'Al cambiar la fecha de inicio'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P48_FCHA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13894724142102234)
,p_event_id=>wwv_flow_api.id(13894626981102233)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P48_FCHA_FIN").datepicker( ''option'' , ''minDate'' , $("#P48_FCHA_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13894373801102230)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'insert gi_d_frmlrios_vgncia_prdo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'insert into gi_d_frmlrios_vgncia_prdo (id_frmlrio,fcha_incio,fcha_fin,vgncia,id_prdo)',
'                                        values',
'                                       (:P48_ID_FRMLRIO,:P48_FCHA_INCIO,:P48_FCHA_FIN,:P48_VGNCIA,:P48_PRDO);',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(13894099927102227)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13894557923102232)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update gi_d_frmlrios_vgncia_prdo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update gi_d_frmlrios_vgncia_prdo',
'set fcha_incio = :P48_FCHA_INCIO,',
'    fcha_fin   = :P48_FCHA_FIN,',
'    vgncia     = :P48_VGNCIA,',
'    id_prdo    = :P48_PRDO',
'where   id_frmlrios_vgncia_prdo = :P48_ID_FRMLRIOS_VGNCIA_PRDO;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(13894099927102227)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13894110165102228)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Recuperaci\00F3n de Datos gi_d_frmlrios_vgncia_prdo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_frmlrios_vgncia_prdo,',
'       id_frmlrio,',
'       fcha_incio,',
'       fcha_fin,',
'       vgncia,',
'       id_prdo ',
'into',
'      :P48_ID_FRMLRIOS_VGNCIA_PRDO,',
'      :P48_ID_FRMLRIO,',
'      :P48_FCHA_INCIO,',
'      :P48_FCHA_FIN,',
'      :P48_VGNCIA,',
'      :P48_PRDO',
'',
'from gi_d_frmlrios_vgncia_prdo;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_frmlrios_vgncia_prdo,id_frmlrio,fcha_incio,fcha_fin,vgncia,id_prdo ',
'from gi_d_frmlrios_vgncia_prdo',
'where id_frmlrio =:P48_ID_FRMLRIO;'))
,p_process_when_type=>'EXISTS'
);
end;
/
