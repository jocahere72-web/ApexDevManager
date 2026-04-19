prompt --application/pages/page_00139
begin
wwv_flow_api.create_page(
 p_id=>139
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'prueba eventos item'
,p_step_title=>'prueba eventos item'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const codigoBarra = function(event, valor){',
'    if (event.keyCode === 13){',
'        console.log(''Hola has presionado una tecla'');',
'        event.preventDefault();',
'    }',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JAGUAS'
,p_last_upd_yyyymmddhh24miss=>'20211213164649'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(151396351461785903)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(151396486158785904)
,p_name=>'P139_NEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(151396351461785903)
,p_prompt=>'New'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return codigoBarra(event,''numeroEntero'');" '
,p_field_template=>wwv_flow_api.id(17408571111919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
