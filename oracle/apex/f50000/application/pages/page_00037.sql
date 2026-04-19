prompt --application/pages/page_00037
begin
wwv_flow_api.create_page(
 p_id=>37
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Opciones de fecha'
,p_step_title=>'Opciones de fecha'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180918161352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138215026873786124)
,p_plug_name=>'Opciones'
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
 p_id=>wwv_flow_api.id(138215265977786126)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(138215026873786124)
,p_button_name=>'BT_ASIGNAR_COMO_FESTIVO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(29604648415068538)
,p_button_image_alt=>'Asignar como festivo'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
end;
/
