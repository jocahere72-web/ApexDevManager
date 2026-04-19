prompt --application/pages/page_00036
begin
wwv_flow_api.create_page(
 p_id=>36
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Generar registros de d\00EDas h\00E1biles y no h\00E1biles para una vigencia')
,p_page_mode=>'MODAL'
,p_step_title=>'Vigencia a generar'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(29518229835068493)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'300'
,p_dialog_width=>'400'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180918161352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(137843426862588714)
,p_plug_name=>'Vigencia'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(138071710325860512)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(137843426862588714)
,p_button_name=>'BT_ASIGNAR_HABILES'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P36_VIGENCIA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(137843509471588715)
,p_name=>'P36_VIGENCIA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(137843426862588714)
,p_prompt=>'Vigencia'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select vgncia as d,',
'       vgncia as r',
'  from df_s_vigencias',
unistr(' where vgncia not in (select distinct a\00F1o '),
'                        from df_c_calendario_general ',
'                       where cdgo_clnte = :F_CDGO_CLNTE)',
'   and vgncia >= extract(year from sysdate)',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'(No hay vigencias disponibles para generar)'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(138078918593864358)
,p_name=>unistr('Al presionar bot\00F3n asignar d\00EDas h\00E1biles')
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(138071710325860512)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(138079301529864363)
,p_event_id=>wwv_flow_api.id(138078918593864358)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>unistr('El asignar nuevamente los d\00EDas h\00E1biles para el a\00F1o escogido no afectar\00E1 los c\00E1lculos realizados previamente. \00BFDesea continuar?')
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(138079860442864365)
,p_event_id=>wwv_flow_api.id(138078918593864358)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'BT_CALCULAR_HABILES'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
end;
/
