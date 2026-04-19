prompt --application/pages/page_00353
begin
wwv_flow_api.create_page(
 p_id=>353
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Actualizar Fecha o Cuenta de Banco Recaudo'
,p_page_mode=>'MODAL'
,p_step_title=>'Actualizar Fecha o Cuenta de Banco Recaudo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'400'
,p_protection_level=>'C'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20220328175044'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14846793735411494)
,p_plug_name=>'Actualizar Fecha o Cuenta Banco'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'RE_G_RECAUDOS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14881685798818921)
,p_plug_name=>'Cuenta Banco'
,p_parent_plug_id=>wwv_flow_api.id(14846793735411494)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'RE_G_RECAUDOS_CONTROL'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14862776931411510)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(14846793735411494)
,p_button_name=>'BTN_GRDAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P353_ID_RCDO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14861563156411509)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(14846793735411494)
,p_button_name=>'BTN_CNCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:352:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-times'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(14863436309411510)
,p_branch_name=>'Go To Page 352'
,p_branch_action=>'f?p=&APP_ID.:352:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(14883443072818939)
,p_branch_name=>'Actualizar_Registros'
,p_branch_action=>'f?p=&APP_ID.:352:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(14862776931411510)
,p_branch_sequence=>11
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14847094299411494)
,p_name=>'P353_ID_RCDO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(14846793735411494)
,p_item_source_plug_id=>wwv_flow_api.id(14846793735411494)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Rcdo'
,p_source=>'ID_RCDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14849842612411496)
,p_name=>'P353_FCHA_INGRSO_BNCO'
,p_source_data_type=>'TIMESTAMP'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(14846793735411494)
,p_item_source_plug_id=>wwv_flow_api.id(14846793735411494)
,p_prompt=>'Fecha Ingreso Banco'
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'FCHA_INGRSO_BNCO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>10
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14881829311818923)
,p_name=>'P353_ID_RCDO_CNTROL'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(14881685798818921)
,p_item_source_plug_id=>wwv_flow_api.id(14881685798818921)
,p_source=>'ID_RCDO_CNTROL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14882260016818927)
,p_name=>'P353_ID_BNCO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(14881685798818921)
,p_item_source_plug_id=>wwv_flow_api.id(14881685798818921)
,p_prompt=>'Banco'
,p_source=>'ID_BNCO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_bnco as d,',
'       a.id_bnco as r',
'from df_c_bancos a',
'where a.rcddor =''S''',
'order by a.nmbre_bnco'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14882377424818928)
,p_name=>'P353_ID_BNCO_CNTA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(14881685798818921)
,p_item_source_plug_id=>wwv_flow_api.id(14881685798818921)
,p_prompt=>'Cuenta Banco'
,p_source=>'ID_BNCO_CNTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_cnta as d,',
'       a.id_bnco_cnta as r',
'from df_c_bancos_cuenta a',
'where a.id_bnco = :P353_ID_BNCO'))
,p_lov_cascade_parent_items=>'P353_ID_BNCO'
,p_ajax_items_to_submit=>'P353_ID_BNCO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14883369334818938)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar_Registros'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    update re_g_recaudos set fcha_ingrso_bnco = :P353_FCHA_INGRSO_BNCO where id_rcdo = :P353_ID_RCDO;',
'',
'    update re_g_recaudos_control set id_bnco_cnta = :P353_ID_BNCO_CNTA, id_bnco = :P353_ID_BNCO where id_rcdo_cntrol = :P353_ID_RCDO_CNTROL;commit;',
'end;'))
,p_process_error_message=>'Error No se pudieron actualizar los registros.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(14862776931411510)
,p_process_success_message=>'Se actualizaron los datos correctamente.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14863912273411511)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(14846793735411494)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Create Form'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14881767348818922)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(14881685798818921)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Actualizar_Fecha_Cuenta'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
