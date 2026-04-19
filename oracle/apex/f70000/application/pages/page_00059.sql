prompt --application/pages/page_00059
begin
wwv_flow_api.create_page(
 p_id=>59
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Liquidaci\00F3n de Renta')
,p_step_title=>unistr('Liquidaci\00F3n de Renta')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ABRACHE'
,p_last_upd_yyyymmddhh24miss=>'20190902164515'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13017069803732741)
,p_plug_name=>unistr('Liquidaci\00F3n de Impuestos de Renta')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13017195044732742)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13017289773732743)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
'Funcionalidad que permite realizar la liquidacion de los impuesos de rentas.',
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13017395506732744)
,p_name=>'P59_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(13017069803732741)
,p_prompt=>'Sujeto de Impuesto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13017424465732745)
,p_name=>'P59_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(13017069803732741)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto,id_impsto',
'from v_DF_C_IMPUESTOS',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13017570213732746)
,p_name=>'P59_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(13017069803732741)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_impsto_sbmpsto||''-''|| nmbre_impsto_sbmpsto ,id_impsto_sbmpsto',
'from v_DF_I_IMPUESTOS_SUBIMPUESTO ',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and id_impsto = :P59_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P59_ID_IMPSTO'
,p_ajax_items_to_submit=>'P59_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13017695978732747)
,p_name=>'P59_ID_IMPSTO_ASCDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(13017069803732741)
,p_prompt=>'Tipo de Asociado'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_ascdo,id_impsto_ascdo',
'from df_i_impuesto_asociado',
'where id_impsto = :P59_ID_IMPSTO',
'and id_impsto_sbmpsto = :P59_ID_IMPSTO_SBMPSTO',
'and activo = ''S'''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P59_ID_IMPSTO_SBMPSTO'
,p_ajax_items_to_submit=>'P59_ID_IMPSTO_ASCDO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13017701376732748)
,p_name=>'P59_ID_IMPSTO_ACTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(13017069803732741)
,p_prompt=>'Acto'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_acto,id_impsto_acto',
'from df_i_impuestos_acto ',
'where id_impsto = :P59_ID_IMPSTO',
'and id_impsto_sbmpsto = :P59_ID_IMPSTO_SBMPSTO',
'and actvo = ''S'''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P59_ID_IMPSTO_SBMPSTO'
,p_ajax_items_to_submit=>'P59_ID_IMPSTO_ACTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13017861517732749)
,p_name=>'P59_FECHA_SUSCRIPCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(13017069803732741)
,p_prompt=>unistr('Fecha de Suscripci\00F3n')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14941492310320501)
,p_name=>'P59_BASE_GRAVABLE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(13017069803732741)
,p_prompt=>'Base Gravable'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14941566383320502)
,p_name=>'P59_FECHA_VENCIMIENTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(13017069803732741)
,p_prompt=>'Fecha de Vencimiento'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14941645558320503)
,p_name=>'P59_NMRO_SOPORTE_ASOCIADO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(13017069803732741)
,p_prompt=>'No. de Soporte de Asociado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
