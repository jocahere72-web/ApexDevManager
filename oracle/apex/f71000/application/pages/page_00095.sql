prompt --application/pages/page_00095
begin
wwv_flow_api.create_page(
 p_id=>95
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Registro '
,p_step_title=>'Registro '
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function validarEmail(id){',
'    var regex = /[\w-\.]{2,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;',
'',
'    if (!regex.test($(''#''+id).val().trim())) {',
unistr('        apex.message.alert ("La direcc\00F3n de correo no es v\00E1lida.");'),
'    }',
'};',
'',
'',
'function mayuscula(id){',
'	$(''#''+id).val($(''#''+id).val().toUpperCase());',
'}',
'',
'function recorrer_grid() { ',
'    ',
'   var region = apex.region("Vigencia_periodo");',
'    if (region) {',
'        ',
'       var view = apex.region("Vigencia_periodo").widget().interactiveGrid("getViews", "grid");',
'       var model = view.model;  ',
'       var records = view.view$.grid("getSelectedRecords");',
'   ',
'       var json = records.map(function(record){',
'           return { "vgncia"         : model.getValue(record, "VGNCIA").trim(),',
'                    "prdo"        : model.getValue(record, "ID_PRDO")',
'               };',
'       });',
'         $(''#P95_JSON'').val(json.length > 0 ? JSON.stringify(json) : '''');',
'    }    ',
'}',
' '))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20201222102136'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(49153741899160075)
,p_plug_name=>unistr('Prescripci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(54913213360698203)
,p_plug_name=>'TAB'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--pill'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(54913355323698204)
,p_plug_name=>'Sujeto Tributo & Vigencia'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50186491436521237)
,p_plug_name=>'Sujeto Tributo & Vigencia'
,p_parent_plug_id=>wwv_flow_api.id(54913355323698204)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50226665928621036)
,p_plug_name=>'Vigencia'
,p_parent_plug_id=>wwv_flow_api.id(54913355323698204)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(54913678494698207)
,p_plug_name=>'botones'
,p_parent_plug_id=>wwv_flow_api.id(54913355323698204)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113240938930789984)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(289712980846428267)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
unistr('Funcionalidad donde ayudara a gestionar una solicitud de prescripci\00F3n.<br>'),
'<ul><li>Primero selecione el tipo de responsable para poder adjuntar los archivos soportes de la solicitud(Documento soporte de la solicitud , Documento soporte dependiendo del tipo de responsable)</li></ul></i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(50598065940363921)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(113240938930789984)
,p_button_name=>'Adjuntar_Soportes'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Adjuntar <br> Documentos Soportes'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:96:&SESSION.::&DEBUG.:RP,96:P96_ID_PRNSCRPCION:&P95_ID_PRNSCRPCION_1.'
,p_icon_css_classes=>'fa-sign-in'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(49154035345160076)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(113240938930789984)
,p_button_name=>'Insertar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Radicar prescripci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P95_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(49154328630160076)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(113240938930789984)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Cancelar prescripci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(49154225998160076)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(54913678494698207)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P95_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(49154193240160076)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(54913678494698207)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P95_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49155915196160214)
,p_name=>'P95_ROWID'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_use_cache_before_default=>'NO'
,p_source=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49156200249160226)
,p_name=>'P95_ID_PRNSCRPCION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_PRSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49156619945160227)
,p_name=>'P95_CDGO_CLNTE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_use_cache_before_default=>'NO'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49157032275160228)
,p_name=>'P95_CDGO_PRSCRPCION_ESTDO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_use_cache_before_default=>'NO'
,p_source=>'CDGO_PRSCRPCION_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49157440627160228)
,p_name=>'P95_FECHA'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_use_cache_before_default=>'NO'
,p_source=>'FECHA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49158215545160230)
,p_name=>'P95_CDGO_RSPNSBLE_TPO'
,p_is_required=>true
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo Responsable'
,p_source=>'CDGO_RSPNSBLE_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_TIPO_RESPONSABLE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_rspnsble_tpo d,',
'       cdgo_rspnsble_tpo r',
'  from df_s_responsables_tipo',
'  order by 1;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Seleccione tipo de responsable , luego adjunte el documento soporte ',
'<br>',
unistr('<ul><li>Click en el bot\00F3n <u><b>Adjuntar documento soporte</b></u> ubicado en la parte derecha </li></ul>')))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49158660144160230)
,p_name=>'P95_CDGO_IDNTFCCION_TPO_SLCTNT'
,p_is_required=>true
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Tipo Identificaci\00F3n')
,p_source=>'CDGO_IDNTFCCION_TPO_SLCTNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Tipo identificaci\00F3n del Solicitante')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49159033731160230)
,p_name=>'P95_NMRO_IDNTFCCION_SLCTNTE'
,p_is_required=>true
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Identificaci\00F3n')
,p_source=>'NMRO_IDNTFCCION_SLCTNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Identificaci\00F3n del Solicitante')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49159453967160230)
,p_name=>'P95_PRMER_NMBRE_SLCTNTE'
,p_is_required=>true
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Primer Nombre'
,p_source=>'PRMER_NMBRE_SLCTNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'onkeyup="mayuscula(this.id)"'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49159894811160230)
,p_name=>'P95_SGNDO_NMBRE_SLCTNTE'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Segundo Nombre'
,p_source=>'SGNDO_NMBRE_SLCTNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'onkeyup="mayuscula(this.id)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49160253438160230)
,p_name=>'P95_PRMER_APLLDO_SLCTNTE'
,p_is_required=>true
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Primer Apellido'
,p_source=>'PRMER_APLLDO_SLCTNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'onkeyup="mayuscula(this.id)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49160681855160231)
,p_name=>'P95_SGNDO_APLLDO_SLCTNTE'
,p_is_required=>true
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Segundo Apellido'
,p_source=>'SGNDO_APLLDO_SLCTNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'onkeyup="mayuscula(this.id)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49161054442160231)
,p_name=>'P95_DRCCION_NTFCCION'
,p_is_required=>true
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Direcci\00F3n Notificaci\00F3n')
,p_source=>'DRCCION_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Direcci\00F3n del Solicitante')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49161413245160232)
,p_name=>'P95_ID_PAIS_NTFCCION'
,p_is_required=>true
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_item_default=>'&F_ID_PAIS_CLNTE.'
,p_prompt=>unistr('Pais Notificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PAIS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_pais as d,',
'       id_pais  as r',
'  from df_s_paises',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49161882525160232)
,p_name=>'P95_ID_DPRTMNTO_NTFCCION'
,p_is_required=>true
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_item_default=>'&F_ID_DPRTMNTO_CLNTE.'
,p_prompt=>unistr('Departamento Notificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(NMBRE_DPRTMNTO) as d,',
'       ID_DPRTMNTO as r',
'  from DF_S_DEPARTAMENTOS',
'  where id_pais = :P95_ID_PAIS_NTFCCION',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P95_ID_PAIS_NTFCCION'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49162206756160232)
,p_name=>'P95_ID_MNCPIO_NTFCCION'
,p_is_required=>true
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_item_default=>'&F_ID_MNCPIO_CLNTE.'
,p_prompt=>unistr('Municipio Notificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mncpio as d,',
'       id_mncpio as r',
'  from df_s_municipios',
' where id_dprtmnto = :P95_ID_DPRTMNTO_NTFCCION',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P95_ID_DPRTMNTO_NTFCCION'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49162619701160232)
,p_name=>'P95_EMAIL'
,p_is_required=>true
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Email'
,p_source=>'EMAIL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>320
,p_tag_attributes=>' onblur="validarEmail(this.id)"'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Email del Solicitante'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49163010019160232)
,p_name=>'P95_TLFNO'
,p_is_required=>true
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Tel\00E9fono')
,p_source=>'TLFNO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>28
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Tel\00E9fono del Solicitante')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49163418259160233)
,p_name=>'P95_OBSRVCION'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>75
,p_cMaxlength=>4000
,p_cHeight=>3
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49163870924160233)
,p_name=>'P95_ID_USRIO_CREO'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_USRIO_CREO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49164212878160233)
,p_name=>'P95_FCHA_CRCION'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_use_cache_before_default=>'NO'
,p_source=>'FCHA_CRCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49165039355160233)
,p_name=>'P95_ID_USRIO_APRBO'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_USRIO_APRBO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49165470113160234)
,p_name=>'P95_FCHA_APRBCION'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_use_cache_before_default=>'NO'
,p_source=>'FCHA_APRBCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49166229906160234)
,p_name=>'P95_NMRO_RSLCION'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_api.id(49153741899160075)
,p_use_cache_before_default=>'NO'
,p_source=>'NMRO_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50188628986521374)
,p_name=>'P95_ROWID_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(50186491436521237)
,p_use_cache_before_default=>'NO'
,p_source=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50188938024521387)
,p_name=>'P95_ID_PRNSCRPCION_SJTO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(50186491436521237)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_PRNSCRPCION_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50189329054521389)
,p_name=>'P95_ID_PRNSCRPCION_1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(50186491436521237)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_PRNSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50189769142521389)
,p_name=>'P95_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(50186491436521237)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tributo'
,p_source=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Impuesto al que solicita la prescripci\00F3n')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50190139491521389)
,p_name=>'P95_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(50186491436521237)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sub-Tributo'
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where id_impsto = :P95_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P95_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50190543431521390)
,p_name=>'P95_IDNTFCCION_SJTO_IMPSTO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(50186491436521237)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Identificaci\00F3n<br>Sujeto Tributo')
,p_source=>'IDNTFCCION_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>8
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50228879924621170)
,p_name=>'P95_ROWID_2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(50226665928621036)
,p_use_cache_before_default=>'NO'
,p_source=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50229126503621183)
,p_name=>'P95_ID_PRSCRPCION_VGNCIA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(50226665928621036)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_PRSCRPCION_VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50229543507621184)
,p_name=>'P95_ID_PRNSCRPCION_SJTO_IMPSTO_1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(50226665928621036)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_PRNSCRPCION_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52727173485805810)
,p_name=>'P95_JSON'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(50186491436521237)
,p_use_cache_before_default=>'NO'
,p_source=>'JSON'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54913487416698205)
,p_name=>'P95_ID_PRDO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(50226665928621036)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vigencia & Periodo'
,p_source=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Vigencia :'' || '' '' ||v.vgncia ||'' ''|| P.dscrpcion d ,',
'       id_prdo r from df_s_vigencias v join df_i_periodos p on (V.vgncia = p.vgncia)',
' order by 1 desc;'))
,p_lov_display_null=>'YES'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione la vigencia y el periodo que desea prescribir'
,p_attribute_01=>'MULTI'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54913723659698208)
,p_name=>'P95_VGNCIA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(50226665928621036)
,p_use_cache_before_default=>'NO'
,p_source=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(49157983284160228)
,p_validation_name=>'P95_FECHA must be timestamp'
,p_validation_sequence=>40
,p_validation=>'P95_FECHA'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_api.id(49157440627160228)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(49164768417160233)
,p_validation_name=>'P95_FCHA_CRCION must be timestamp'
,p_validation_sequence=>200
,p_validation=>'P95_FCHA_CRCION'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_api.id(49164212878160233)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(49165979750160234)
,p_validation_name=>'P95_FCHA_APRBCION must be timestamp'
,p_validation_sequence=>220
,p_validation=>'P95_FCHA_APRBCION'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_api.id(49165470113160234)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50599643517363937)
,p_name=>'Ocultar boton soporte'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P95_CDGO_RSPNSBLE_TPO'
,p_condition_element=>'P95_CDGO_RSPNSBLE_TPO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50599831790363939)
,p_event_id=>wwv_flow_api.id(50599643517363937)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(50598065940363921)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50599701653363938)
,p_event_id=>wwv_flow_api.id(50599643517363937)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(50598065940363921)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(49174222876160239)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from GF_G_PREINSCRIPCIONES'
,p_attribute_02=>'GF_G_PREINSCRIPCIONES'
,p_attribute_03=>'P95_ROWID'
,p_attribute_04=>'ROWID'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(50200044940521396)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from GF_G_PRNSCRPCNES_SJTO_IMPST'
,p_attribute_02=>'GF_G_PRNSCRPCNES_SJTO_IMPST'
,p_attribute_03=>'P95_ROWID'
,p_attribute_04=>'ROWID'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(50242005210621191)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from GF_G_PRNSCRPCNES_VIGENCIA'
,p_attribute_02=>'GF_G_PRNSCRPCNES_VIGENCIA'
,p_attribute_03=>'P95_ROWID'
,p_attribute_04=>'ROWID'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(50596008135363901)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Registrar Prescripci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_id_prnscrpcion_sjto_impsto gf_g_prscrpcnes_sjto_impsto.id_prscrpcion_sjto_impsto%type;',
'v_id_prescripcion gf_g_prescripciones.id_prscrpcion%type;',
'begin',
'pkg_gf_preinscripcion.prc_rg_prscrpcion( p_cdgo_prnscrpcion_estdo      => ''IN''  ',
'                                        ,p_cdgo_clnte                  => :F_CDGO_CLNTE',
'                                        ,p_cdgo_rspnsble_tpo           => :P95_CDGO_RSPNSBLE_TPO',
'                                        ,p_cdgo_idntfccion_tpo_slctnte => :P95_CDGO_IDNTFCCION_TPO_SLCTNT',
'                                        ,p_nmro_idntfccion_slctnte     => :P95_NMRO_IDNTFCCION_SLCTNTE',
'                                        ,p_prmer_nmbre_slctnte         => :P95_PRMER_NMBRE_SLCTNTE',
'                                        ,p_sgndo_nmbre_slctnte         => :P95_SGNDO_NMBRE_SLCTNTE ',
'                                        ,p_prmer_aplldo_slctnte        => :P95_PRMER_APLLDO_SLCTNTE',
'                                        ,p_sgndo_aplldo_slctnte        => :P95_SGNDO_APLLDO_SLCTNTE',
'                                        ,p_id_pais_ntfccion            => :P95_ID_PAIS_NTFCCION',
'                                        ,p_id_dprtmnto_ntfccion        => :P95_ID_DPRTMNTO_NTFCCION ',
'                                        ,p_id_mncpio_ntfccion          => :P95_ID_MNCPIO_NTFCCION',
'                                        ,p_drccion_ntfccion            => :P95_DRCCION_NTFCCION',
'                                        ,p_tlfno                       => :P95_TLFNO',
'                                        ,p_email                       => :P95_EMAIL ',
'                                        ,p_obsrvcion                   => :P95_OBSRVCION ',
'                                        ,p_fcha_crcion                 => :P95_FCHA_CRCION ',
'                                        ,p_id_usrio_creo               => :P95_ID_USRIO_CREO',
'                                        ,p_fcha_aprbcion               => :P95_FCHA_APRBCION',
'                                        ,p_id_usrio_aprbo              => :P95_ID_USRIO_APRBO ',
'                                        ,p_id_prnscrpcion              => v_id_prescripcion);',
'                                      ',
'    if v_id_prescripcion is not null then  ',
'    ',
'      pkg_gf_preinscripcion.prc_rg_prscrpcion_sjto_impsto(p_idntfccion_sjto_impsto          => :P95_IDNTFCCION_SJTO_IMPSTO',
'                                                         ,p_id_impsto                       => :P95_ID_IMPSTO',
'                                                         ,p_id_prscrpcion                   => v_id_prescripcion',
'                                                         ,p_id_impsto_sbmpsto               => :P95_ID_IMPSTO_SBMPSTO',
'                                                         ,p_id_prnscrpcion_sjto_impsto      => v_id_prnscrpcion_sjto_impsto);',
'        if v_id_prnscrpcion_sjto_impsto is not null then',
'    ',
'            pkg_gf_preinscripcion.prc_rg_prscrpcion_vgncia(p_id_prnscrpcion_sjto_impsto  => v_id_prnscrpcion_sjto_impsto,',
'                                                           p_id_prdo                     => :P95_ID_PRDO,',
'                                                           p_aprbdo                      => :P95_APRBDO );',
'',
'',
'            end if;',
'    pkg_gf_preinscripcion.prc_rg_prscrpcion_adjnto(p_id_prnscrpcion => v_id_prescripcion);',
'    ',
'    end if;',
'    ',
'',
'    ',
'   ',
'    ',
'    ',
'    ',
'    ',
'end;',
'',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(49154035345160076)
,p_process_success_message=>unistr('Prescripci\00F3n Registrada.!')
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(50599589796363936)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'clear Items'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(49154035345160076)
);
null;
end;
/
