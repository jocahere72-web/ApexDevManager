prompt --application/pages/page_00103
begin
wwv_flow_api.create_page(
 p_id=>103
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Tipos de Sujeto Impuesto'
,p_page_mode=>'MODAL'
,p_step_title=>'Tipos de Sujeto Tributo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_last_upd_yyyymmddhh24miss=>'20190201031553'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(185139895751252519)
,p_plug_name=>'Predio'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(185140247490252638)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(185139895751252519)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P103_ID_PRDIO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(185140465538252641)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(185139895751252519)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(29604648415068538)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(185141879976252976)
,p_name=>'P103_ID_PRDIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(185139895751252519)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Prdio'
,p_source=>'ID_PRDIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(185142476846253094)
,p_name=>'P103_ID_PRDIO_DSTNO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(185139895751252519)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Destino'
,p_source=>'ID_PRDIO_DSTNO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    dscrpcion,',
'    id_prdio_dstno ',
' from df_i_predios_destino'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(185142880825253109)
,p_name=>'P103_CDGO_ESTRTO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(185139895751252519)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Estrato'
,p_source=>'CDGO_ESTRTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    dscrpcion_estrto,',
'    cdgo_estrto ',
' from df_s_estratos'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(185143244676253109)
,p_name=>'P103_CDGO_DSTNO_IGAC'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(185139895751252519)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Destino IGAC'
,p_source=>'CDGO_DSTNO_IGAC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    nmbre_dstno_igac,',
'    cdgo_dstno_igac',
' from df_s_destinos_igac '))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(185143618570253110)
,p_name=>'P103_CDGO_PRDIO_CLSFCCION'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(185139895751252519)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Clasificaci\00F3n')
,p_source=>'CDGO_PRDIO_CLSFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    dscrpcion_prdio_clsfccion,',
'    cdgo_prdio_clsfccion',
' from df_s_predios_clasificacion'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(185144043707253110)
,p_name=>'P103_ID_PRDIO_USO_SLO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(185139895751252519)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Uso del Suelo'
,p_source=>'ID_PRDIO_USO_SLO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    dscrpcion,',
'    id_prdio_uso_slo',
' from df_c_predios_uso_suelo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(185144459601253111)
,p_name=>'P103_AVLUO_CTSTRAL'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(185139895751252519)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Aval\00FAo Catastral')
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'AVLUO_CTSTRAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(185144886819253111)
,p_name=>'P103_AVLUO_CMRCIAL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(185139895751252519)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Aval\00FAo Comercial')
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'AVLUO_CMRCIAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(185145270654253112)
,p_name=>'P103_AREA_TRRNO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(185139895751252519)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00C1rea Terreno')
,p_source=>'AREA_TRRNO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(185145611196253113)
,p_name=>'P103_AREA_CNSTRDA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(185139895751252519)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00C1rea Construida')
,p_source=>'AREA_CNSTRDA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(185146054996253113)
,p_name=>'P103_AREA_GRVBLE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(185139895751252519)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00C1rea Gravable')
,p_source=>'AREA_GRVBLE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(185146487883253113)
,p_name=>'P103_MTRCLA_INMBLRIA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(185139895751252519)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Matr\00EDcula Inmobiliaria')
,p_source=>'MTRCLA_INMBLRIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(185147254819253113)
,p_name=>'P103_ID_ENTDAD'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(185139895751252519)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Entidad'
,p_source=>'ID_ENTDAD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    nmbre_entdad || ''-'' || idntfccion,',
'    id_entdad ',
' from df_i_entidades'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(185147689787253114)
,p_name=>'P103_ID_BRRIO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(185139895751252519)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Barrio'
,p_source=>'ID_BRRIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    nmbre_brrio,',
'    id_brrio ',
' from df_c_barrios'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(185148481015253123)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from SI_I_PREDIOS'
,p_attribute_02=>'SI_I_PREDIOS'
,p_attribute_03=>'P103_ID_PRDIO'
,p_attribute_04=>'ID_PRDIO'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(185148879060253211)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of SI_I_PREDIOS'
,p_attribute_02=>'SI_I_PREDIOS'
,p_attribute_03=>'P103_ID_PRDIO'
,p_attribute_04=>'ID_SJTO_IMPSTO'
,p_attribute_11=>'U'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
end;
/
