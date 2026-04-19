prompt --application/pages/page_00029
begin
wwv_flow_api.create_page(
 p_id=>29
,p_user_interface_id=>wwv_flow_api.id(30413944355578333)
,p_name=>'Registro de Evidencia'
,p_page_mode=>'MODAL'
,p_step_title=>'Registro de Evidencia'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_step_template=>wwv_flow_api.id(30302372436578271)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'550'
,p_dialog_width=>'80%'
,p_dialog_chained=>'N'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20191223172338'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89847790851801446)
,p_plug_name=>'Acciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(134626603969414832)
,p_plug_name=>'Responsable'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30328831919578284)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(135449601005274024)
,p_plug_name=>'Correo Certificado'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P29_CDGO_MDIO'
,p_plug_display_when_cond2=>'CCE'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(142787480233318843)
,p_plug_name=>'Edicto'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P29_CDGO_MDIO'
,p_plug_display_when_cond2=>'EDT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(142790006386318869)
,p_plug_name=>'Gaceta'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P29_CDGO_MDIO'
,p_plug_display_when_cond2=>'GCT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(145237845672429129)
,p_plug_name=>'Prensa'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P29_CDGO_MDIO'
,p_plug_display_when_cond2=>'PSA'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(90984271345321305)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(89847790851801446)
,p_button_name=>'BTN_ESCANEAR'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_image_alt=>'Escaner'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=50000:906:&SESSION.::&DEBUG.:RP:P906_APP_PAGE_ID,P906_APP_ID:&APP_PAGE_ID.,&APP_ID.'
,p_icon_css_classes=>'fa-box-arrow-out-north'
,p_button_cattributes=>'style = "margin-top: 25px; !important"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>2
,p_grid_column=>11
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(89847842674801447)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(89847790851801446)
,p_button_name=>'BTN_RGSTRAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(30392085768578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Reg\00EDstrar Evidencia')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89847425726801443)
,p_name=>'P29_ID_MDIO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(134626603969414832)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89847543526801444)
,p_name=>'P29_EVDNCIA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(89847790851801446)
,p_prompt=>'Evidencia'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391508947578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89847911363801448)
,p_name=>'P29_ID_ENTDAD_CLNTE_MDIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(89847790851801446)
,p_prompt=>'Entidad'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_entdad d, id_entdad_clnte_mdio r  ',
'from v_nt_d_ntfccion_mdio_entdd',
'where cdgo_clnte = :F_CDGO_CLNTE and',
'      id_mdio = :P29_ID_MDIO'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89913353818966630)
,p_name=>'P29_ID_NTFCCION_RSPNSBLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(134626603969414832)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89914190497966632)
,p_name=>'P29_IDNTFCCION_TPO_R'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(134626603969414832)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89914539664966632)
,p_name=>'P29_NMRO_IDNTFCCION_R'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(134626603969414832)
,p_prompt=>unistr('No. Identificaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89914914488966632)
,p_name=>'P29_PRMER_NMBRE_R'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(134626603969414832)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89915316263966632)
,p_name=>'P29_SGNDO_NMBRE_R'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(134626603969414832)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89915725579966632)
,p_name=>'P29_PRMER_APLLDO_R'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(134626603969414832)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89916196853966632)
,p_name=>'P29_SGNDO_APLLDO_R'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(134626603969414832)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89916538513966633)
,p_name=>'P29_DRCCION_NTFCCION_R'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(134626603969414832)
,p_prompt=>unistr('Direcci\00F3n de Notificaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89916972224966633)
,p_name=>'P29_NMBRE_PAIS_R'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(134626603969414832)
,p_prompt=>unistr('Pa\00EDs')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89917328124966633)
,p_name=>'P29_NMBRE_DPRTMNTO_R'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(134626603969414832)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89917714990966633)
,p_name=>'P29_NMBRE_MNCPIO_R'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(134626603969414832)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89918198942966633)
,p_name=>'P29_EMAIL_R'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(134626603969414832)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89918595430966635)
,p_name=>'P29_TLFNO_R'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(134626603969414832)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89920619694966640)
,p_name=>'P29_NMRO_ORDEN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(135449601005274024)
,p_prompt=>'No. Orden'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>' onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89921019908966640)
,p_name=>'P29_NMRO_GUIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(135449601005274024)
,p_prompt=>'No. Guia'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>' onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89921424648966641)
,p_name=>'P29_CDGO_CSAL_ENTDAD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(89847790851801446)
,p_prompt=>unistr('C\00F3digo Causal Entidad')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_csal_entdad||'' - ''||a.dscrpcion d, a.cdgo_csal_entdad r ',
'from nt_d_causales_entidad a',
'inner join (select cdgo_entdad ',
'            from v_nt_d_ntfccion_mdio_entdd ',
'            where id_entdad_clnte_mdio = :P29_ID_ENTDAD_CLNTE_MDIO) b on a.cdgo_entdad = b.cdgo_entdad'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P29_ID_ENTDAD_CLNTE_MDIO'
,p_ajax_items_to_submit=>'P29_CDGO_CSAL_ENTDAD'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89921846068966641)
,p_name=>'P29_NMRO_IDNTFCCION_CC'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(135449601005274024)
,p_prompt=>unistr('N\00FAmero de Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_tag_attributes=>' onkeypress="return validarExpresion(event, ''letraNumero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89922216726966641)
,p_name=>'P29_NMBRE_NTFCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(135449601005274024)
,p_prompt=>'Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>250
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89923397147966642)
,p_name=>'P29_FCHA_INCIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(142787480233318843)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>unistr('Fecha de Fijaci\00F3n')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"  onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89923770783966642)
,p_name=>'P29_FCHA_FIN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(142787480233318843)
,p_prompt=>unistr('Fecha de Desfijaci\00F3n')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"  onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89924554210966642)
,p_name=>'P29_DIA_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(142787480233318843)
,p_prompt=>'Tipo de Dia'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Habil;H,Calendario;C'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89924992185966642)
,p_name=>'P29_UBCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(142787480233318843)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89926732458966643)
,p_name=>'P29_NMRO_GCETA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(142790006386318869)
,p_prompt=>unistr('N\00FAmero Gaceta')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>300
,p_tag_attributes=>' onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89927179434966644)
,p_name=>'P29_FCHA_PBLCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(142790006386318869)
,p_prompt=>unistr('Fecha de Publicaci\00F3n')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>' onkeydown="return false"  onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89927838306966644)
,p_name=>'P29_UBCCION_PSA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(145237845672429129)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>500
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89928220216966644)
,p_name=>'P29_FCHA_RGSTRO_PSA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(145237845672429129)
,p_prompt=>unistr('Fecha de Reg\00EDstro')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>' onkeydown="return false"  onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90289132548279601)
,p_name=>'P29_FCHA_NTFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(89847790851801446)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha de Notificacion'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>' onkeydown="return false"  onfocus="this.value=''''"'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90656439273961601)
,p_name=>'P29_CDGO_MDIO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(134626603969414832)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90983853508321301)
,p_name=>'P29_OPCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(89847790851801446)
,p_item_default=>'F'
,p_prompt=>'Adjuntar evidencia desde'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Explorador de Archivos;F,Escaner;E'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(90656579272961602)
,p_computation_sequence=>10
,p_computation_item=>'P29_CDGO_MDIO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_mdio ',
'from nt_d_medio ',
'where id_mdio = :P29_ID_MDIO'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(90983904235321302)
,p_name=>'Al cambiar opcion de archivo'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P29_OPCION'
,p_condition_element=>'P29_OPCION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'E'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(90984084855321303)
,p_event_id=>wwv_flow_api.id(90983904235321302)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P29_EVDNCIA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(90984162072321304)
,p_event_id=>wwv_flow_api.id(90983904235321302)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P29_EVDNCIA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(90984398960321306)
,p_event_id=>wwv_flow_api.id(90983904235321302)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(90984271345321305)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(90984472820321307)
,p_event_id=>wwv_flow_api.id(90983904235321302)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(90984271345321305)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(89848124175801450)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Evidencia'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_msgerror varchar2(4000);',
'    v_xml clob;',
'begin',
unistr('    --Generamos el XML dependiendo del mdio de notificaci\00F3n'),
'    ',
'    if(:P29_ID_MDIO = 1)then--Correo Certificado ',
'        v_xml := ''<nmro_orden>''||:P29_NMRO_ORDEN||''</nmro_orden>',
'                  <nmro_guia>''||:P29_NMRO_GUIA||''</nmro_guia>',
'                  <cdgo_csal_entdad>''||:P29_CDGO_CSAL_ENTDAD||''</cdgo_csal_entdad>',
'                  <nmro_idntfccion>''||:P29_NMRO_IDNTFCCION_CC||''</nmro_idntfccion>',
'                  <nmbre_ntfccion>''||:P29_NMBRE_NTFCCION||''</nmbre_ntfccion>',
'                  <fcha_ntfccion>''||:P29_FCHA_NTFCCION||''</fcha_ntfccion>'';',
'                   ',
'    elsif(:P29_ID_MDIO = 3)then--Edicto',
'        v_xml := ''<fcha_incio>''||:P29_FCHA_INCIO||''</fcha_incio>',
'                  <fcha_fin>''||:P29_FCHA_FIN||''</fcha_fin>',
'                  <dia_tpo>''||:P29_DIA_TPO||''</dia_tpo>',
'                  <ubccion>''||:P29_UBCCION||''</ubccion>',
'                  <fcha_ntfccion>''||:P29_FCHA_NTFCCION||''</fcha_ntfccion>'';',
'                  ',
'    elsif(:P29_ID_MDIO = 4)then--Prensa',
'        v_xml := ''<ubccion>''||:P29_UBCCION_PSA||''</ubccion>',
'                  <fcha_rgstro>''||:P29_FCHA_RGSTRO_PSA||''</fcha_rgstro>',
'                  <fcha_ntfccion>''||:P29_FCHA_NTFCCION||''</fcha_ntfccion>'';',
'                  ',
'    elsif(:P29_ID_MDIO = 9)then--Gaceta',
'        v_xml := ''<nmro_gceta>''||:P29_NMRO_GCETA||''</nmro_gceta>',
'                  <fcha_pblccion>''||:P29_FCHA_PBLCCION||''</fcha_pblccion>',
'                  <fcha_ntfccion>''||:P29_FCHA_NTFCCION||''</fcha_ntfccion>'';',
'    end if;',
'    ',
'    --Registramos evidencia',
'    ',
'    pkg_nt_notificacion.prc_rg_evidencia_puntual(',
'        p_cdgo_clnte           => :F_CDGO_CLNTE,',
'        p_id_entdad_clnte_mdio => :P29_ID_ENTDAD_CLNTE_MDIO,',
'        p_id_ntfccion_rspnsble => :P29_ID_NTFCCION_RSPNSBLE,',
'        p_file_evdncia         => :P29_EVDNCIA,',
'        p_id_fncnrio           => :F_ID_FNCNRIO,',
'        p_xml                  => v_xml,',
'        p_id_mdio              => :P29_ID_MDIO,',
'        o_mnsje                => v_msgerror',
'    );',
'    if(v_msgerror is not null)then',
'        raise_application_error(-20000, v_msgerror);',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(89847842674801447)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(90139612792247001)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar Dialogo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(89847842674801447)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(89933654675966657)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar datos del responsable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select dscrpcion_idntfccion_tpo,',
'       nmro_idntfccion,',
'       prmer_nmbre,',
'       sgndo_nmbre,',
'       prmer_aplldo,',
'       sgndo_aplldo,',
'       drccion_ntfccion,',
'       nmbre_pais,',
'       nmbre_dprtmnto,',
'       nmbre_mncpio,',
'       email,',
'       tlfno',
'  into :P29_IDNTFCCION_TPO_R,',
'       :P29_NMRO_IDNTFCCION_R,',
'       :P29_PRMER_NMBRE_R,',
'       :P29_SGNDO_NMBRE_R,',
'       :P29_PRMER_APLLDO_R,',
'       :P29_SGNDO_APLLDO_R,',
'       :P29_DRCCION_NTFCCION_R,',
'       :P29_NMBRE_PAIS_R,',
'       :P29_NMBRE_DPRTMNTO_R,',
'       :P29_NMBRE_MNCPIO_R,',
'       :P29_EMAIL_R,',
'       :P29_TLFNO_R',
'  from v_nt_g_ntfccnes_rspnsble',
'  where id_ntfccion_rspnsble = :P29_ID_NTFCCION_RSPNSBLE;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
