prompt --application/pages/page_00062
begin
wwv_flow_api.create_page(
 p_id=>62
,p_user_interface_id=>wwv_flow_api.id(237318207209524256)
,p_name=>unistr('Verificaci\00F3n De Informaci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Verificaci\00F3n De Informaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(237217490731524186)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'RROBLEDO'
,p_last_upd_yyyymmddhh24miss=>'20201027122713'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95091739427200042)
,p_plug_name=>unistr('Verificaci\00F3n De Informaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95092263937200047)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(95091739427200042)
,p_button_name=>'Siguiente'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(237296397635524233)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-arrow-right-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(96012935059701006)
,p_branch_name=>'validacion de proceso'
,p_branch_action=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:RP:P40_INDICADOR:&P62_INDICADOR.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(95092263937200047)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95091841700200043)
,p_name=>'P62_IDENTIFICACION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(95091739427200042)
,p_prompt=>'Identificacion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_field_template=>wwv_flow_api.id(237295687231524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95091920843200044)
,p_name=>'P62_MODELO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(95091739427200042)
,p_prompt=>'Modelo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(237295687231524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95092068447200045)
,p_name=>'P62_MARCA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(95091739427200042)
,p_prompt=>'Marca'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion_vhclo_mrca as d',
'     , a.cdgo_vhclo_mrca  as r',
'  from df_s_vehiculos_marca a',
'',
''))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(237295687231524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96012860546701005)
,p_name=>'P62_PLACA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(95091739427200042)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96013123594701008)
,p_name=>'P62_INDICADOR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(95091739427200042)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96240856860249801)
,p_name=>'P62_SITE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(95091739427200042)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(96013210095701009)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validacion de informacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'begin',
'select 1  into :P62_INDICADOR ',
'  from si_i_sujetos_responsable j',
'  join si_i_sujetos_impuesto s',
'    on s.id_sjto_impsto = j.id_sjto_impsto',
'  join si_c_sujetos x',
'    on x.id_sjto = s.id_sjto',
'  join si_i_vehiculos v',
'    on v.id_sjto_impsto = j.id_sjto_impsto',
' where j.idntfccion = :P62_IDENTIFICACION',
'   and x.idntfccion = :P62_PLACA',
'   and v.cdgo_vhclo_mrca = :P62_MARCA',
'   and v.mdlo = :P62_MODELO',
'   and j.prncpal_s_n = ''S''; ',
'  ',
' exception ',
' when others then ',
' :P62_INDICADOR := 0;',
'   ',
'end; '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(95092263937200047)
);
end;
/
