prompt --application/pages/page_00011
begin
wwv_flow_api.create_page(
 p_id=>11
,p_user_interface_id=>wwv_flow_api.id(76451776849582525)
,p_name=>'TRD'
,p_page_mode=>'MODAL'
,p_step_title=>'TRD'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20191101165136'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9208179001864815)
,p_plug_name=>'TRD'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9208768133864821)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9208179001864815)
,p_button_name=>'AGRGAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9208263120864816)
,p_name=>'P11_ID_SRIE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(9208179001864815)
,p_prompt=>'Serie'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_srie',
'     , a.id_srie',
'  from gd_d_series a',
'  where id_srie in (select id_srie ',
'                      from gd_d_trd_serie b ',
'                      where b.id_trd in ( select c.id_trd ',
'                                            from gd_d_trd c ',
'                                           where c.id_area = :P11_ID_AREA',
'                                             and c.id_prcso   = :P11_ID_PRCSO ',
'                                        ) ',
'                   )'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P11_ID_AREA,P11_ID_PRCSO'
,p_ajax_items_to_submit=>'P11_ID_AREA,P11_ID_PRCSO,P11_ID_SRIE'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista la serie a la que pertenece el documento'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9208393857864817)
,p_name=>'P11_ID_AREA'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9208179001864815)
,p_prompt=>unistr('\00C1rea')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_area, id_area ',
'     from df_c_areas',
'    where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista el \00E1rea al que pertenece el documento.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9208465984864818)
,p_name=>'P11_ID_PRCSO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(9208179001864815)
,p_prompt=>'Proceso'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_prcso',
'     , id_prcso ',
'  from df_c_procesos',
' where id_area = :P11_ID_AREA'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P11_ID_AREA'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el proceso al que pertenece el documento.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9208529376864819)
,p_name=>'P11_ID_SBSRIE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(9208179001864815)
,p_prompt=>'Sub-Serie'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_srie',
'     , a.id_srie',
'  from gd_d_series a ',
' where a.id_srie_pdre = :P11_ID_SRIE'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P11_ID_SRIE'
,p_ajax_items_to_submit=>'P11_ID_SBSRIE,P11_ID_SRIE'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(76429181601582500)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista la subserie a la que corresponde el documento.(solo si aplica subserie)'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9208664812864820)
,p_name=>'P11_TRD_SRIE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(9208179001864815)
,p_prompt=>'TRD Documento'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre',
'     , id_trd_srie_dcmnto_tpo ',
'  from v_gd_d_trd_serie_dcmnto_tpo',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_area  = :P11_ID_AREA',
'   and id_prcso = :P11_ID_PRCSO',
'   and id_srie  = :P11_ID_SRIE',
'   and nvl(id_sbsrie,0) = nvl(:P11_ID_SBSRIE,0)'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P11_ID_AREA,P11_ID_PRCSO,P11_ID_SRIE,P11_ID_SBSRIE'
,p_ajax_items_to_submit=>'P11_ID_SBSRIE'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione la Tabla de retenci\00F3n documental a la que pertenece el documento.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9208811216864822)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar ventana modal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(9208768133864821)
);
end;
/
