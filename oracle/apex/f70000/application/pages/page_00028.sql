prompt --application/pages/page_00028
begin
wwv_flow_api.create_page(
 p_id=>28
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Declaraciones Propiedades Atributos'
,p_page_mode=>'MODAL'
,p_step_title=>'Declaraciones Propiedades Atributos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20191220100334'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(206747061067792887)
,p_plug_name=>'Propiedades Atributo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39152904613294817)
,p_plug_name=>'Opciones'
,p_parent_plug_id=>wwv_flow_api.id(206747061067792887)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164075504857707680)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103511530675476123)
,p_button_sequence=>260
,p_button_plug_id=>wwv_flow_api.id(39152904613294817)
,p_button_name=>'BTN_VLRES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--pillStart'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Ver Valores'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:RP,34:P34_ID_RGION_ATRBTO,P34_ID_FRMLRIO,P34_CDGO_ATRBTO_TPO:&P28_A_ID_RGION_ATRBTO.,&P28_A_ID_FRMLRIO.,&P28_A_CDGO_ATRBTO_TPO.'
,p_button_condition=>'P28_A_ID_RGION_ATRBTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6050632085209310)
,p_button_sequence=>270
,p_button_plug_id=>wwv_flow_api.id(39152904613294817)
,p_button_name=>'BTN_ORGN'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--pill'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Ver Origen'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP,32:P32_ID_FRMLRIO_RGION_ATRBTO,P32_ID_FRMLRIO:&P28_A_ID_RGION_ATRBTO.,&P28_A_ID_FRMLRIO.'
,p_button_condition=>'P28_A_ID_RGION_ATRBTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13522463699694035)
,p_button_sequence=>280
,p_button_plug_id=>wwv_flow_api.id(39152904613294817)
,p_button_name=>'BTN_LSTA_VLRES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--pill'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Ver Lista de Valores'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP,49:P49_ID_FRMLRIO,P49_ID_FRMLRIO_RGION_ATRBTO:&P28_A_ID_FRMLRIO.,&P28_A_ID_RGION_ATRBTO.'
,p_button_condition=>':P28_A_ID_RGION_ATRBTO is not null and :P28_A_CDGO_ATRBTO_TPO = ''SLQ'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39152810532294816)
,p_button_sequence=>290
,p_button_plug_id=>wwv_flow_api.id(39152904613294817)
,p_button_name=>'BTN_PRPDDES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--pillEnd'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Ver Propiedades'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:113:&SESSION.::&DEBUG.:RP,113:P113_ID_FRMLRIO_RGION_ATRBTO:&P28_A_ID_RGION_ATRBTO.'
,p_button_condition=>':P28_A_ID_RGION_ATRBTO is not null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103563288267748885)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(206747061067792887)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P28_A_ID_RGION_ATRBTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103702246285605810)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(206747061067792887)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103563637232748886)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(206747061067792887)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_condition=>'P28_A_ID_RGION_ATRBTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103564056084748886)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(206747061067792887)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P28_A_ID_RGION_ATRBTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(103511241868476120)
,p_branch_name=>'Ir a pagina 26'
,p_branch_action=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:RP,26:P26_NODO_SELECCIONADO:&P28_NODO_SELECCIONADO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'DELETE,SAVE,CREATE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39151359022294801)
,p_name=>'P28_A_INDCDOR_ENLNEA'
,p_is_required=>true
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(206747061067792887)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>unistr('\00BFIndicador en l\00EDnea?')
,p_source=>'INDCDOR_ENLNEA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41148139541660901)
,p_name=>'P28_CNTDAD_MXMA_CRCTRES'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(206747061067792887)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Cantidad M\00E1xima de Caracteres')
,p_source=>'CNTDAD_MXMA_CRCTRES'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_tag_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:0});"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103510782599476115)
,p_name=>'P28_NODO_SELECCIONADO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(206747061067792887)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103564467029748887)
,p_name=>'P28_A_ID_RGION_ATRBTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(206747061067792887)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103564863905748889)
,p_name=>'P28_A_ID_FRMLRIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(206747061067792887)
,p_prompt=>'Formulario'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.dscrpcion,',
'            a.id_frmlrio',
'from        gi_d_formularios    a',
'where       a.cdgo_clnte    =   :F_CDGO_CLNTE',
'order by    a.dscrpcion;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103565213599748890)
,p_name=>'P28_A_ID_RGION'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(206747061067792887)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Regi\00F3n')
,p_source=>'ID_FRMLRIO_RGION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.dscrpcion,',
'            a.id_frmlrio_rgion',
'from        gi_d_formularios_region    a',
'where       a.id_frmlrio    =   :P28_A_ID_FRMLRIO',
'order by    a.dscrpcion;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P28_A_ID_FRMLRIO'
,p_ajax_items_to_submit=>'P28_A_ID_RGION'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103565683988748890)
,p_name=>'P28_A_CDGO_ATRBTO_TPO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(206747061067792887)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo Atributo'
,p_source=>'CDGO_ATRBTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.dscrpcion,',
'            a.cdgo_atrbto_tpo',
'from        gi_d_atributos_tipo     a',
'order by    a.dscrpcion;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103566061923748893)
,p_name=>'P28_A_DSCRPCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(206747061067792887)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>115
,p_cHeight=>2
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103566434959748893)
,p_name=>'P28_A_NMBRE_DSPLAY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(206747061067792887)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nombre en Formulario'
,p_source=>'NMBRE_DSPLAY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>115
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103566837646748893)
,p_name=>'P28_A_NMBRE_RPRTE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(206747061067792887)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nombre en Reporte'
,p_source=>'NMBRE_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>115
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103567219374748893)
,p_name=>'P28_A_ALNCION_CBCRA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(206747061067792887)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Alineaci\00F3n Cabecera')
,p_source=>'ALNCION_CBCRA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Derecha;D,Centro;C,Izquierda;I'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103567661610748894)
,p_name=>'P28_A_ALNCION_VLOR'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(206747061067792887)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Alineaci\00F3n Valor')
,p_source=>'ALNCION_VLOR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Derecha;R,Centro;C,Izquierda;L'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103568003969748894)
,p_name=>'P28_A_MSCRA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(206747061067792887)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('M\00E1scara')
,p_source=>'MSCRA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>'STATIC:MONEDA;MONEDA,NUMERO;NUMERO'
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103568423357748894)
,p_name=>'P28_A_INDCDOR_INCIA_NVA_FLA'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(206747061067792887)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFNueva Fila?')
,p_source=>'INDCDOR_INCIA_NVA_FLA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103568872663748894)
,p_name=>'P28_A_NMRO_CLMNA'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(206747061067792887)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00FAmero de Columna')
,p_source=>'NMRO_CLMNA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'STATIC:12;12,',
'       11;11,',
'       10;10,',
'       09;9,',
'       08;8,',
'       07;7,',
'       06;6,',
'       05;5,',
'       04;4,',
'       03;3,',
'       02;2,',
'       01;1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103569266719748894)
,p_name=>'P28_A_AMPLCION_CLMNA'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(206747061067792887)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Ampliaci\00F3n Columna')
,p_source=>'AMPLCION_CLMNA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'STATIC:12;12,',
'       11;11,',
'       10;10,',
'       09;9,',
'       08;8,',
'       07;7,',
'       06;6,',
'       05;5,',
'       04;4,',
'       03;3,',
'       02;2,',
'       01;1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103569603272748895)
,p_name=>'P28_A_VLOR_DFCTO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(206747061067792887)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Valor por Defecto'
,p_source=>'VLOR_DFCTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103570065270748895)
,p_name=>'P28_A_ORDEN'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(206747061067792887)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Orden'
,p_source=>'ORDEN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:0});"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103571233582748897)
,p_name=>'P28_A_INDCDOR_OBLGTRIO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(206747061067792887)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFObligatorio?')
,p_source=>'INDCDOR_OBLGTRIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103571626220748897)
,p_name=>'P28_A_INDCDOR_EDTBLE'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(206747061067792887)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFEditable?')
,p_source=>'INDCDOR_EDTBLE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103572089903748897)
,p_name=>'P28_A_ACTVO'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(206747061067792887)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(103572409520752169)
,p_computation_sequence=>40
,p_computation_item=>'P28_A_ID_RGION_ATRBTO'
,p_computation_point=>'AFTER_HEADER'
,p_computation=>'regexp_substr(:P28_NODO_SELECCIONADO, ''[0-9][0-9]*'')'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(103511095527476118)
,p_computation_sequence=>10
,p_computation_item=>'P28_A_ID_FRMLRIO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select      a.id_frmlrio',
'from        gi_d_regiones        a',
'where       a.id_rgion        =   :P28_A_ID_RGION;*/',
'',
'select    a.id_frmlrio ',
'from      gi_d_formularios_region a',
'where     a.id_frmlrio_rgion  =:P28_A_ID_RGION;'))
,p_compute_when=>'P28_A_ID_RGION'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(13522199131694032)
,p_validation_name=>'validar_SQL_P28_LSTA_VLRES'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_sql    clob;',
'begin',
'    if :P28_A_CDGO_ATRBTO_TPO = ''SLQ'' then',
'        v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for '' || :P28_LSTA_VLRES;',
'        execute immediate v_sql ;',
'    end if;',
'exception when others then',
'    return regexp_replace(sqlerrm,''(ORA|PLS)-[0-9]{0,5}: '','''');   ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition_type=>'NEVER'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103510925333476117)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from gi_d_regiones_atributo'
,p_attribute_02=>'GI_D_FRMLRIOS_RGION_ATRBTO'
,p_attribute_03=>'P28_A_ID_RGION_ATRBTO'
,p_attribute_04=>'ID_FRMLRIO_RGION_ATRBTO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P28_A_ID_RGION_ATRBTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103511186504476119)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>unistr('Procesamiento Autom\00E1tico gi_d_regiones_atributo')
,p_attribute_02=>'GI_D_FRMLRIOS_RGION_ATRBTO'
,p_attribute_03=>'P28_A_ID_RGION_ATRBTO'
,p_attribute_04=>'ID_FRMLRIO_RGION_ATRBTO'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada con \00C9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(37971735899700403)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar Ventana'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CANCEL,CREATE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
