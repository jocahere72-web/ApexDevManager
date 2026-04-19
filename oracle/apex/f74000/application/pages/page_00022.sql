prompt --application/pages/page_00022
begin
wwv_flow_api.create_page(
 p_id=>22
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Finalizaci\00F3n')
,p_step_title=>unistr('Finalizaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(36470205860968633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20240708134718'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(59050948863549201)
,p_plug_name=>'Flow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(59051252168549204)
,p_plug_name=>unistr('Proceso Fiscalizaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.CANDIDATO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'F_ID_INSTNCIA_FLJO'
,p_attribute_02=>'F_ID_FLJO_TREA'
,p_attribute_03=>'P22_ID_SJTO_IMPSTO'
,p_attribute_04=>'F_ID_FNCNRIO'
,p_attribute_05=>'P22_ID_FSCLZCION_EXPDNTE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(158950625390285462)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'    </b>',
'</h5>',
'<p align="justify">',
'    <i>',
unistr('        Funcionalidad que permite consultar, ingresar, modificar, eliminar los Programas de Fiscalizaci\00F3n parametrizados con un valor de sanci\00F3n.'),
'    </i>',
'<p>',
'<p align="justify">',
'    <i>',
unistr('        Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'    </i>',
'<p>',
'',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(374387138705553283)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(60889024389647875)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(374387138705553283)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(60889491189647878)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(374387138705553283)
,p_button_name=>'BTN_PRGRMA_FNCNRIO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555595557968673)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Programa Sancionatorio'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:RP,28::'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_fsclzcion_expdnte_pdre',
'from fi_g_fiscalizacion_expdnte',
'where id_fsclzcion_expdnte_pdre = (select id_fsclzcion_expdnte from fi_g_fiscalizacion_expdnte',
'                                           where id_instncia_fljo = :F_INSTNCIA_FLJO)'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59051019347549202)
,p_name=>'P22_ID_CNDDTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(59051252168549204)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59051188720549203)
,p_name=>'P22_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(59051252168549204)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69419157947973101)
,p_name=>'P22_ID_FSCLZCION_EXPDNTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(59051252168549204)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(59057271079560055)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar Informaci\00F3n Candidato')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select a.id_cnddto,',
'           a.id_sjto_impsto,',
'           c.id_fsclzcion_expdnte',
'    into   :P22_ID_CNDDTO,',
'           :P22_ID_SJTO_IMPSTO,',
'           :P22_ID_FSCLZCION_EXPDNTE',
'    from v_fi_g_candidatos          a',
'    join fi_g_fiscalizacion_expdnte c on a.id_cnddto        = c.id_cnddto',
'    join v_si_i_sujetos_impuesto    d on a.id_sjto_impsto   = d.id_sjto_impsto',
'    where c.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'    ',
'',
'exception',
'    when others then',
'        :P22_ID_CNDDTO    := null;',
'        :P22_ID_SJTO_IMPSTO := null;',
'        :P22_ID_FSCLZCION_EXPDNTE := null;',
'',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
