prompt --application/pages/page_00026
begin
wwv_flow_api.create_page(
 p_id=>26
,p_user_interface_id=>wwv_flow_api.id(30413944355578333)
,p_name=>'Evidencia'
,p_page_mode=>'MODAL'
,p_step_title=>'Evidencia'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(30302372436578271)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'80%'
,p_dialog_chained=>'N'
,p_last_updated_by=>'ACARABALLO'
,p_last_upd_yyyymmddhh24miss=>'20240520072414'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44713907583448212)
,p_plug_name=>'Responsable'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44486867697159709)
,p_plug_name=>'Evidencia'
,p_parent_plug_id=>wwv_flow_api.id(44713907583448212)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30338884622578288)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P26_ID_MDIO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46407261655810948)
,p_plug_name=>'Evidencia'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P26_ID_NTFCION_MDIO_EVDNCIA'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25320349041448926)
,p_plug_name=>'Web'
,p_parent_plug_id=>wwv_flow_api.id(46407261655810948)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P26_CDGO_MDIO'
,p_plug_display_when_cond2=>'PWE'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25884669331567536)
,p_plug_name=>'Email'
,p_parent_plug_id=>wwv_flow_api.id(46407261655810948)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P26_CDGO_MDIO'
,p_plug_display_when_cond2=>'CEL'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44713497306448207)
,p_plug_name=>unistr('Notificaci\00F3n Personal')
,p_parent_plug_id=>wwv_flow_api.id(46407261655810948)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30328831919578284)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P26_CDGO_MDIO'
,p_plug_display_when_cond2=>'PPN'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(45536904619307404)
,p_plug_name=>'Correo Certificado'
,p_parent_plug_id=>wwv_flow_api.id(46407261655810948)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30328831919578284)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P26_CDGO_MDIO'
,p_plug_display_when_cond2=>'CCE'
,p_attribute_01=>'Y'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46407300929810949)
,p_plug_name=>'Archivo'
,p_parent_plug_id=>wwv_flow_api.id(46407261655810948)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30318497486578280)
,p_plug_display_sequence=>90
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52340486312779006)
,p_plug_name=>'Conducta Concluyente'
,p_parent_plug_id=>wwv_flow_api.id(46407261655810948)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P26_CDGO_MDIO'
,p_plug_display_when_cond2=>'CCY'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52874783847352223)
,p_plug_name=>'Edicto'
,p_parent_plug_id=>wwv_flow_api.id(46407261655810948)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P26_CDGO_MDIO'
,p_plug_display_when_cond2=>'EDT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52877310000352249)
,p_plug_name=>'Gaceta'
,p_parent_plug_id=>wwv_flow_api.id(46407261655810948)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P26_CDGO_MDIO'
,p_plug_display_when_cond2=>'GCT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55325149286462509)
,p_plug_name=>'Prensa'
,p_parent_plug_id=>wwv_flow_api.id(46407261655810948)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>80
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P26_CDGO_MDIO'
,p_plug_display_when_cond2=>'PSA'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(68592534697339712)
,p_plug_name=>'Notificar'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:margin-top-md'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>100
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44715774135448230)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(46407300929810949)
,p_button_name=>'BTN_VER_EVIDENCIA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapRight'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ver Evidencia'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P26_ID_NTFCION_MDIO_EVDNCIA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-materialized-view'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(25862830915991434)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(45536904619307404)
,p_button_name=>'BTN_CARGAR_EVIDENCIA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapRight'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Cargar Gu\00EDa')
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:35:&SESSION.::&DEBUG.:RP:P35_ID_NTFCION_MDIO_EVDNCIA,P35_ID_MDIO:&P26_ID_NTFCION_MDIO_EVDNCIA.,&P26_ID_MDIO.'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-file'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(99610723184982215)
,p_branch_name=>'Go To Page 127'
,p_branch_action=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR:NT_G_MEDIO_ENTIDAD_EVDNCIA,ID_NTFCION_MDIO_EVDNCIA,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,&P26_ID_NTFCION_MDIO_EVDNCIA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(44715774135448230)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25320471768448927)
,p_name=>'P26_FCHA_PRSNTCION_WEB'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(25320349041448926)
,p_prompt=>unistr('Fecha de Presentaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25320541592448928)
,p_name=>'P26_FCHA_RGSTRO_WEB'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(25320349041448926)
,p_prompt=>unistr('Fecha Reg\00EDstro')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25884577489567535)
,p_name=>'P26_CDGO_MDIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(44486867697159709)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25884768236567537)
,p_name=>'P26_FCHA_PRSNTCION_EMAIL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(25884669331567536)
,p_prompt=>unistr('Fecha de Presentaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25884848708567538)
,p_name=>'P26_FCHA_RGSTRO_EMAIL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(25884669331567536)
,p_prompt=>unistr('Fecha Reg\00EDstro')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26226178820189351)
,p_name=>'P26_FILE_EVDNCIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(68592534697339712)
,p_prompt=>'Cargar Evidencia'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(30391672326578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
,p_attribute_11=>'image/*,application/pdf'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26226523097189391)
,p_name=>'P26_FCHA_PRSNTCION1'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(68592534697339712)
,p_prompt=>unistr('Fecha de Cargue Gu\00EDa')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>' onkeydown="return false" '
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(30391672326578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44486946835159710)
,p_name=>'P26_ID_NTFCION_MDIO_EVDNCIA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(44486867697159709)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44712846130448201)
,p_name=>'P26_ID_MDIO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(44486867697159709)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44713238293448205)
,p_name=>'P26_FCHA_NTFCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(44713907583448212)
,p_prompt=>unistr('Fecha de Notificaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44714001624448213)
,p_name=>'P26_IDNTFCCION_TPO_R'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(44713907583448212)
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
 p_id=>wwv_flow_api.id(44714151193448214)
,p_name=>'P26_NMRO_IDNTFCCION_R'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(44713907583448212)
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
 p_id=>wwv_flow_api.id(44714694403448219)
,p_name=>'P26_NMRO_IDNTFCCION_PRSNT_P'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(44713497306448207)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44714727062448220)
,p_name=>'P26_PRMER_NMBRE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(44713497306448207)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44714895243448221)
,p_name=>'P26_SGNDO_NMBRE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(44713497306448207)
,p_prompt=>'Segundo Nombre'
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
 p_id=>wwv_flow_api.id(44714924011448222)
,p_name=>'P26_PRMER_APLLDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(44713497306448207)
,p_prompt=>'Primer Apellido'
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
 p_id=>wwv_flow_api.id(44715086475448223)
,p_name=>'P26_SGNDO_APLLDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(44713497306448207)
,p_prompt=>'Segundo Apellido'
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
 p_id=>wwv_flow_api.id(44715118375448224)
,p_name=>'P26_NMRO_TRJETA_PRFSNAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(44713497306448207)
,p_prompt=>'No. Tarjeta Profesional'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44715398165448226)
,p_name=>'P26_DSCRPCION_RSPNSBLE_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(44713497306448207)
,p_prompt=>'Tipo de Responsable'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44715429891448227)
,p_name=>'P26_DSCRPCION_IDNTFCCION_TPO_P'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(44713497306448207)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
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
 p_id=>wwv_flow_api.id(44715518850448228)
,p_name=>'P26_NMBRE_MNCPIO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(44713497306448207)
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
 p_id=>wwv_flow_api.id(45537029391307405)
,p_name=>'P26_NMRO_ORDEN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(45536904619307404)
,p_prompt=>'No. Orden'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45537120406307406)
,p_name=>'P26_NMRO_GUIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(45536904619307404)
,p_prompt=>'No. Guia'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45537282833307407)
,p_name=>'P26_CDGO_CSAL_ENTDAD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(45536904619307404)
,p_prompt=>unistr('C\00F3digo Causal Entidad')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45537321419307408)
,p_name=>'P26_NMRO_IDNTFCCION_CC'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(45536904619307404)
,p_prompt=>unistr('N\00FAmero de Indentificaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45537481563307409)
,p_name=>'P26_NMBRE_NTFCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(45536904619307404)
,p_prompt=>'Nombre'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46406253294810938)
,p_name=>'P26_PRMER_NMBRE_R'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(44713907583448212)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46406305589810939)
,p_name=>'P26_SGNDO_NMBRE_R'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(44713907583448212)
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
 p_id=>wwv_flow_api.id(46406499028810940)
,p_name=>'P26_PRMER_APLLDO_R'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(44713907583448212)
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
 p_id=>wwv_flow_api.id(46406593338810941)
,p_name=>'P26_SGNDO_APLLDO_R'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(44713907583448212)
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
 p_id=>wwv_flow_api.id(46406607573810942)
,p_name=>'P26_DRCCION_NTFCCION_R'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(44713907583448212)
,p_prompt=>unistr('Direcci\00F3n de Notificaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46406707611810943)
,p_name=>'P26_NMBRE_PAIS_R'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(44713907583448212)
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
 p_id=>wwv_flow_api.id(46406869851810944)
,p_name=>'P26_NMBRE_DPRTMNTO_R'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(44713907583448212)
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
 p_id=>wwv_flow_api.id(46406941025810945)
,p_name=>'P26_NMBRE_MNCPIO_R'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(44713907583448212)
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
 p_id=>wwv_flow_api.id(46407078038810946)
,p_name=>'P26_EMAIL_R'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(44713907583448212)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46407173200810947)
,p_name=>'P26_TLFNO_R'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(44713907583448212)
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
 p_id=>wwv_flow_api.id(52340501202779007)
,p_name=>'P26_FCHA_PRSNTCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(52340486312779006)
,p_prompt=>unistr('Fecha de Presentaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52340641871779008)
,p_name=>'P26_FCHA_RGSTRO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(52340486312779006)
,p_prompt=>unistr('Fecha Reg\00EDstro')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52874871737352224)
,p_name=>'P26_FCHA_INCIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(52874783847352223)
,p_prompt=>unistr('Fecha de Fijaci\00F3n')
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
 p_id=>wwv_flow_api.id(52874901472352225)
,p_name=>'P26_FCHA_FIN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(52874783847352223)
,p_prompt=>unistr('Fecha de Desfijaci\00F3n')
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
 p_id=>wwv_flow_api.id(52875053375352226)
,p_name=>'P26_DRCION_DIAS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(52874783847352223)
,p_prompt=>unistr('Duraci\00F3n (Dias)')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52875153683352227)
,p_name=>'P26_DIA_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(52874783847352223)
,p_prompt=>'Tipo de Dia'
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
 p_id=>wwv_flow_api.id(52875243152352228)
,p_name=>'P26_UBCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(52874783847352223)
,p_prompt=>unistr('Ubicaci\00F3n')
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
 p_id=>wwv_flow_api.id(52875352343352229)
,p_name=>'P26_FCHA_RGSTRO_EDT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(52874783847352223)
,p_prompt=>unistr('Fecha de Reg\00EDstro')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52877409454352250)
,p_name=>'P26_NMRO_GCETA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(52877310000352249)
,p_prompt=>unistr('N\00FAmero Gaceta')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55324375652462501)
,p_name=>'P26_FCHA_PBLCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(52877310000352249)
,p_prompt=>unistr('Fecha de Publicaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55325227221462510)
,p_name=>'P26_UBCCION_PSA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(55325149286462509)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55325366610462511)
,p_name=>'P26_FCHA_RGSTRO_PSA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(55325149286462509)
,p_prompt=>unistr('Fecha de Reg\00EDstro')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89129368876979115)
,p_name=>'P26_ID_NTFCCION_RSPNSBLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(44713907583448212)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44713347437448206)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Recuperaci\00F3n automatica EVIDENCIA')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select id_mdio, ',
'           cdgo_mdio,',
'           to_char(fcha_ntfccion,''dd/MM/yyyy'')',
'    into   :P26_ID_MDIO, ',
'           :P26_CDGO_MDIO, ',
'           :P26_FCHA_NTFCCION',
'    from v_nt_g_medio_entidad_evdncia',
'    where id_ntfcion_mdio_evdncia = :P26_ID_NTFCION_MDIO_EVDNCIA;',
'    ',
unistr('    --Presentaci\00F3n Personal'),
'    if  :P26_CDGO_MDIO = ''PPN'' then -- (:P26_ID_MDIO = 6) then',
'        begin',
'            select b.dscrpcion_rspnsble_tpo,',
'                   c.dscrpcion_idntfccion_tpo,',
'                   a.nmro_idntfccion,',
'                   d.nmbre_mncpio,',
'                   a.prmer_nmbre, ',
'                   a.sgndo_nmbre, ',
'                   a.prmer_aplldo, ',
'                   a.sgndo_aplldo, ',
'                   a.nmro_trjeta_prfsnal',
'            into   :P26_DSCRPCION_RSPNSBLE_TPO,',
'                   :P26_DSCRPCION_IDNTFCCION_TPO_P,',
'                   :P26_NMRO_IDNTFCCION_PRSNT_P,',
'                   :P26_NMBRE_MNCPIO,',
'                   :P26_PRMER_NMBRE, ',
'                   :P26_SGNDO_NMBRE, ',
'                   :P26_PRMER_APLLDO, ',
'                   :P26_SGNDO_APLLDO, ',
'                   :P26_NMRO_TRJETA_PRFSNAL',
'            from nt_g_presentacion_personal a',
'            inner join df_s_responsables_tipo     b on a.cdgo_rspnsble_tpo     = b.cdgo_rspnsble_tpo',
'            inner join df_s_identificaciones_tipo c on a.cdgo_idntfccion_tpo   = c.cdgo_idntfccion_tpo',
'            inner join v_df_s_municipios          d on a.cdgo_mncpio           = d.cdgo_mncpio',
'            where a.id_ntfcion_mdio_evdncia = :P26_ID_NTFCION_MDIO_EVDNCIA;',
'        exception ',
'            when no_data_found then',
'                null;',
'        end;',
'    --Conducta Concluyente',
'    elsif  :P26_CDGO_MDIO = ''CCY'' then --(:P26_ID_MDIO = 7)then',
'        begin',
'            select    to_char(fcha_prsntcion,''dd/MM/yyyy''), ',
'                      to_char(fcha_rgstro, ''dd/MM/yyyy'')',
'            into      :P26_FCHA_PRSNTCION,',
'                      :P26_FCHA_RGSTRO',
'            from      nt_g_conducta_concluyente',
'            where    id_ntfcion_mdio_evdncia = :P26_ID_NTFCION_MDIO_EVDNCIA;',
'        exception',
'            when no_data_found then',
'                null;',
'        end;',
'    --Correo Certificado',
'    elsif  :P26_CDGO_MDIO = ''CCE'' then  --(:P26_ID_MDIO = 1)then',
'        begin',
'           select   nmro_orden,',
'                    nmro_guia,',
'                    cdgo_csal_entdad,',
'                    nmro_idntfccion,',
'                    nmbre_ntfccion',
'           into     :P26_NMRO_ORDEN,',
'                    :P26_NMRO_GUIA,',
'                    :P26_CDGO_CSAL_ENTDAD,',
'                    :P26_NMRO_IDNTFCCION_CC,',
'                    :P26_NMBRE_NTFCCION',
'           from     nt_g_correo_certificado',
'           where    id_ntfcion_mdio_evdncia = :P26_ID_NTFCION_MDIO_EVDNCIA;',
'        exception',
'            when no_data_found then',
'                    null;',
'        end;',
'    --Edicto',
'    elsif :P26_CDGO_MDIO = ''EDT'' then --(:P26_ID_MDIO = 3)then',
'        begin',
'            select  fcha_incio,',
'                    fcha_fin,',
'                    drcion_dias,',
'                    case dia_tpo',
unistr('                        when ''H'' then ''H\00E1bil '''),
'                        when ''C'' then ''Calendario''',
'                    end dia_tpo,',
'                    ubccion,',
'                    fcha_rgstro',
'            into    :P26_FCHA_INCIO,',
'                    :P26_FCHA_FIN,',
'                    :P26_DRCION_DIAS,',
'                    :P26_DIA_TPO,',
'                    :P26_UBCCION,',
'                    :P26_FCHA_RGSTRO_EDT',
'            from nt_g_edicto',
'            where id_ntfcion_mdio_evdncia = :P26_ID_NTFCION_MDIO_EVDNCIA;',
'        exception',
'            when no_data_found then',
'                    null;',
'        end;',
'    --Gaceta',
'    elsif :P26_CDGO_MDIO = ''GCT'' then -- (:P26_ID_MDIO = 9)then',
'        begin',
'            select  nmro_gceta, to_char(fcha_pblccion,''dd/MM/yyyy'')',
'            into    :P26_NMRO_GCETA, :P26_FCHA_PBLCCION ',
'            from nt_g_gaceta',
'            where id_ntfcion_mdio_evdncia = :P26_ID_NTFCION_MDIO_EVDNCIA;',
'        exception',
'            when no_data_found then',
'                null;',
'        end;',
'    --Prensa',
'    elsif :P26_CDGO_MDIO = ''PSA'' then --(:P26_ID_MDIO = 4)then',
'        begin',
'            select  ubccion, to_char(fcha_rgstro,''dd/MM/yyyy'')',
'            into    :P26_UBCCION_PSA, :P26_FCHA_RGSTRO_PSA ',
'            from nt_g_prensa',
'            where id_ntfcion_mdio_evdncia = :P26_ID_NTFCION_MDIO_EVDNCIA;',
'        exception',
'            when no_data_found then',
'                null;',
'        end;',
'    --Email',
'    elsif :P26_CDGO_MDIO = ''CEL'' then --(:P26_ID_MDIO = 10) then',
'        begin',
'            select    to_char(fcha_prsntcion,''dd/MM/yyyy''), ',
'                      to_char(fcha_rgstro, ''dd/MM/yyyy'')',
'            into      :P26_FCHA_PRSNTCION_EMAIL,',
'                      :P26_FCHA_RGSTRO_EMAIL',
'            from nt_g_email',
'            where id_ntfcion_mdio_evdncia = :P26_ID_NTFCION_MDIO_EVDNCIA;',
'        exception',
'            when no_data_found then',
'                null;',
'        end;',
'   ',
'   --WEB',
'    elsif :P26_CDGO_MDIO = ''PWE'' then --(:P26_ID_MDIO = 10) then',
'        begin',
'            select    to_char(fcha_prsntcion,''dd/MM/yyyy''), ',
'                      to_char(fcha_rgstro, ''dd/MM/yyyy'')',
'            into      :P26_FCHA_PRSNTCION_WEB,',
'                      :P26_FCHA_RGSTRO_WEB',
'            from nt_g_web',
'            where id_ntfcion_mdio_evdncia = :P26_ID_NTFCION_MDIO_EVDNCIA;',
'        exception',
'            when no_data_found then',
'                null;',
'        end;',
'',
'    end if;',
'    ',
'exception',
'      when no_data_found then',
'          null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(89129708323979119)
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
'  into :P26_IDNTFCCION_TPO_R,',
'       :P26_NMRO_IDNTFCCION_R,',
'       :P26_PRMER_NMBRE_R,',
'       :P26_SGNDO_NMBRE_R,',
'       :P26_PRMER_APLLDO_R,',
'       :P26_SGNDO_APLLDO_R,',
'       :P26_DRCCION_NTFCCION_R,',
'       :P26_NMBRE_PAIS_R,',
'       :P26_NMBRE_DPRTMNTO_R,',
'       :P26_NMBRE_MNCPIO_R,',
'       :P26_EMAIL_R,',
'       :P26_TLFNO_R',
'  from v_nt_g_ntfccnes_rspnsble',
'  where id_ntfccion_rspnsble = :P26_ID_NTFCCION_RSPNSBLE;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
null;
end;
/
