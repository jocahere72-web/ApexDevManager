prompt --application/pages/page_00015
begin
wwv_flow_api.create_page(
 p_id=>15
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Finalizaci\00F3n de Novedad de Predial')
,p_step_title=>unistr('Finalizaci\00F3n de Novedad de Predial')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20251016142111'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(244063196642589741)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center;">',
'        <b>',
'            <i>Opciones <i class="fa fa-gears" aria-hidden="true"></i>',
'			</i>',
'        </b>',
'    </div>',
'</h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(573264449098737157)
,p_plug_name=>'Workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15336477941164503)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(244063196642589741)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Ir a Gesti\00F3n')
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(15336525790164504)
,p_branch_name=>'Ir a gestion-22'
,p_branch_action=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(15336477941164503)
,p_branch_sequence=>10
);
end;
/
