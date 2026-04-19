prompt --application/pages/page_00300
begin
wwv_flow_api.create_page(
 p_id=>300
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Validaci\00F3n de informaci\00F3n Representante Legal y Revisor Fiscal o Contador')
,p_step_title=>unistr('Validaci\00F3n de informaci\00F3n Representante Legal y Revisor Fiscal o Contador')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.formulario_declaracion/1.0/js/app.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/js/pdfjs-2.4.456-dist/build/pdf.js'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.pdfobject-container {',
'    height: 60rem;',
'    border: 1rem solid rgba(0, 0, 0, .1);',
'}',
''))
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20210611163902'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67908929630516031)
,p_plug_name=>'Items'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71715396548812599)
,p_plug_name=>'Revisor Fiscal y /o Contador'
,p_region_name=>'rspnsble'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_indcdor    varchar2(3);',
'begin',
'    -- Consultar definicion del cliente',
'    select  pkg_gn_generalidades.fnc_cl_defniciones_cliente(  p_cdgo_clnte 					=> :F_CDGO_CLNTE',
'                                                           , p_cdgo_dfncion_clnte_ctgria 	=> ''PCN''',
'                                                           , p_cdgo_dfncion_clnte 			=> ''MAS'' )',
'      into v_indcdor                                                                      ',
'      from dual;    ',
'      ',
'    if v_indcdor = ''S'' then',
'        return true;',
'    else',
'        return false;',
'    end if;',
'end;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122455378527722604)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(123397575964770140)
,p_plug_name=>'Representante legal'
,p_region_name=>'rspnsble'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_indcdor    varchar2(3);',
'begin',
'    -- Consultar definicion del cliente',
'    select  pkg_gn_generalidades.fnc_cl_defniciones_cliente(  p_cdgo_clnte 					=> :F_CDGO_CLNTE',
'                                                           , p_cdgo_dfncion_clnte_ctgria 	=> ''PCN''',
'                                                           , p_cdgo_dfncion_clnte 			=> ''MAS'' )',
'      into v_indcdor                                                                      ',
'      from dual;    ',
'      ',
'    if v_indcdor = ''S'' then ',
'        return true;',
'    else',
'        return false;',
'    end if;',
'end;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(125660769190291377)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i>',
'    </b>',
'</h5>',
unistr('<!-- <i style=" color: red; font-weight: 500; font-size: 18px;">Se debe autorizar la impresi\00F3n de la declaraci\00F3n con el fin de habilitar la presentaci\00F3n de la misma ante la administraci\00F3n.</i>-->'),
unistr('<i>La declaraci\00F3n debe ser autorizada para poder ser presentada ante la administraci\00F3n.</i>'),
'<br><br>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(62671803722527313)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(71715396548812599)
,p_button_name=>'BTN_AGRGAR_CNTDOR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P300_LBEL_BTN_CNTDOR.'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(62682449216527322)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(123397575964770140)
,p_button_name=>'BTN_AGRGAR_RPRSNTNTE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P300_LBEL_BTN_RPRSNTNTE_LGAL.'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(62680155061527320)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(122455378527722604)
,p_button_name=>'BTN_RGRSAR_INCIO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar al Inicio'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:&P300_BRANCH.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(62680552661527321)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(122455378527722604)
,p_button_name=>'BTN_ACTUALIZAR__TODO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar Todo'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62669958650527308)
,p_name=>'P300_IDNTFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(67908929630516031)
,p_prompt=>'P300_IDNTFCCION'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62670355714527311)
,p_name=>'P300_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(67908929630516031)
,p_prompt=>'P300_ID_IMPSTO'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62670713936527311)
,p_name=>'P300_ID_SJTO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(67908929630516031)
,p_prompt=>'P300_ID_SJTO_IMPSTO'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62671144973527311)
,p_name=>'P300_BRANCH'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(67908929630516031)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62672200001527315)
,p_name=>'P300_PRNCPAL_S_N_C'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(71715396548812599)
,p_item_default=>'N'
,p_prompt=>'Principal'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Si;S,No;N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62672628829527315)
,p_name=>'P300_CDGO_TPO_RSPNSBLE_C'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(71715396548812599)
,p_item_default=>'CO'
,p_prompt=>'Tipo Responsable'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.dscrpcion_rspnsble_tpo as d,',
'       r.cdgo_rspnsble_tpo      as r',
' from df_s_responsables_tipo r',
'where r.cdgo_rspnsble_tpo in( ''CO'', ''RF'')'))
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62673042922527316)
,p_name=>'P300_CDGO_IDNTFCCION_TPO_C'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(71715396548812599)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion_idntfccion_tpo as d,',
'        a.cdgo_idntfccion_tpo as r',
'from df_s_identificaciones_tipo a',
'order by a.dscrpcion_idntfccion_tpo; '))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62673442683527316)
,p_name=>'P300_IDNTFCCION_C'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(71715396548812599)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62673837422527316)
,p_name=>'P300_PRMER_NMBRE_C'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(71715396548812599)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62674219442527317)
,p_name=>'P300_SGNDO_NMBRE_C'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(71715396548812599)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62674670777527317)
,p_name=>'P300_PRMER_APLLDO_C'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(71715396548812599)
,p_prompt=>'Primer Aperllido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62675019288527317)
,p_name=>'P300_SGNDO_APLLDO_C'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(71715396548812599)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62675497605527317)
,p_name=>'P300_ID_PAIS_NTFCCION_C'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(71715396548812599)
,p_prompt=>unistr('Pa\00EDs ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_pais as d',
'     , id_pais    as r  ',
'  from df_s_paises'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62675841096527318)
,p_name=>'P300_ID_DPRTMNTO_NTFCCION_C'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(71715396548812599)
,p_prompt=>'Departamento'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_dprtmnto as d,',
'        a.id_dprtmnto as r',
'   from df_s_departamentos a',
'  where a.id_pais = :P300_ID_PAIS_NTFCCION_C'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P300_ID_PAIS_NTFCCION_C'
,p_ajax_items_to_submit=>'P300_ID_DPRTMNTO_NTFCCION_C'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62676284482527318)
,p_name=>'P300_ID_MNCPIO_NTFCCION_C'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(71715396548812599)
,p_prompt=>'Municipio'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_mncpio as d,',
'        a.id_mncpio as r',
'from df_s_municipios a',
'where a.id_dprtmnto = :P300_ID_DPRTMNTO_NTFCCION_C;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P300_ID_DPRTMNTO_NTFCCION_C'
,p_ajax_items_to_submit=>'P300_ID_MNCPIO_NTFCCION_C'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62676639634527318)
,p_name=>'P300_DRCCION_NTFCCION_C'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(71715396548812599)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62677001866527318)
,p_name=>'P300_TLFNO_C'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(71715396548812599)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62677499797527318)
,p_name=>'P300_EMAIL_C'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(71715396548812599)
,p_prompt=>'Correo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62677886747527319)
,p_name=>'P300_ACTVO_C'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(71715396548812599)
,p_item_default=>'S'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62678259053527319)
,p_name=>'P300_ID_SJTO_RSPNSBLE_C'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(71715396548812599)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62678679529527319)
,p_name=>'P300_ID_SJTO_IMPSTO_C'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(71715396548812599)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62679009567527319)
,p_name=>'P300_ID_TRCRO_C'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(71715396548812599)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62679412196527319)
,p_name=>'P300_LBEL_BTN_CNTDOR'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(71715396548812599)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62680965447527321)
,p_name=>'P300_ID_DCLRCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(122455378527722604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62681349574527321)
,p_name=>'P300_CDGO_DCLRCION_ESTDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(122455378527722604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62681778609527321)
,p_name=>'P300_INDCDOR_ADJNTOS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(122455378527722604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62682883919527322)
,p_name=>'P300_PRNCPAL_S_N_L'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(123397575964770140)
,p_item_default=>'N'
,p_prompt=>'Principal'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Si;S,No;N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62683251793527322)
,p_name=>'P300_CDGO_TPO_RSPNSBLE_L'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(123397575964770140)
,p_item_default=>'L'
,p_prompt=>'Tipo Responsable'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.dscrpcion_rspnsble_tpo as d,',
'       r.cdgo_rspnsble_tpo      as r',
' from df_s_responsables_tipo r',
'where r.cdgo_rspnsble_tpo = ''L'''))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62683641160527323)
,p_name=>'P300_CDGO_IDNTFCCION_TPO_L'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(123397575964770140)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion_idntfccion_tpo as d,',
'        a.cdgo_idntfccion_tpo as r',
'from df_s_identificaciones_tipo a',
'order by a.dscrpcion_idntfccion_tpo; '))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62684013528527323)
,p_name=>'P300_IDNTFCCION_L'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(123397575964770140)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62684481677527323)
,p_name=>'P300_PRMER_NMBRE_L'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(123397575964770140)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62684882815527323)
,p_name=>'P300_SGNDO_NMBRE_L'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(123397575964770140)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62685211868527324)
,p_name=>'P300_PRMER_APLLDO_L'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(123397575964770140)
,p_prompt=>'Primer Aperllido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62685671214527324)
,p_name=>'P300_SGNDO_APLLDO_L'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(123397575964770140)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62686086593527324)
,p_name=>'P300_ID_PAIS_NTFCCION_L'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(123397575964770140)
,p_prompt=>unistr('Pa\00EDs ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_pais as d',
'     , id_pais    as r  ',
'  from df_s_paises'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62686459638527324)
,p_name=>'P300_ID_DPRTMNTO_NTFCCION_L'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(123397575964770140)
,p_prompt=>'Departamento'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_dprtmnto as d,',
'        a.id_dprtmnto as r',
'   from df_s_departamentos a',
'  where a.id_pais = :P300_ID_PAIS_NTFCCION_L'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P300_ID_PAIS_NTFCCION_L'
,p_ajax_items_to_submit=>'P300_ID_DPRTMNTO_NTFCCION_L,P300_ID_MNCPIO_NTFCCION_L'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62686829657527325)
,p_name=>'P300_ID_MNCPIO_NTFCCION_L'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(123397575964770140)
,p_prompt=>'Municipio'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_mncpio as d,',
'        a.id_mncpio as r',
'from df_s_municipios a',
'where a.id_dprtmnto = :P300_ID_DPRTMNTO_NTFCCION_L;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P300_ID_DPRTMNTO_NTFCCION_L'
,p_ajax_items_to_submit=>'P300_ID_MNCPIO_NTFCCION_L'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62687249750527325)
,p_name=>'P300_DRCCION_NTFCCION_L'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(123397575964770140)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62687634198527325)
,p_name=>'P300_TLFNO_L'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(123397575964770140)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62688045233527325)
,p_name=>'P300_EMAIL_L'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(123397575964770140)
,p_prompt=>'Correo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62688466073527326)
,p_name=>'P300_ACTVO_L'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(123397575964770140)
,p_item_default=>'S'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62688817909527326)
,p_name=>'P300_ID_SJTO_RSPNSBLE_L'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(123397575964770140)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62689299166527326)
,p_name=>'P300_ID_SJTO_IMPSTO_L'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(123397575964770140)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62689609327527326)
,p_name=>'P300_ID_TRCRO_L'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(123397575964770140)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62690099601527326)
,p_name=>'P300_LBEL_BTN_RPRSNTNTE_LGAL'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(123397575964770140)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(62690867068527336)
,p_computation_sequence=>30
,p_computation_item=>'P300_ID_SJTO_IMPSTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select id_sjto_impsto',
'     from v_si_i_sujetos_impuesto',
'    where cdgo_clnte                   = :F_CDGO_CLNTE',
'      and id_impsto                    = :P300_ID_IMPSTO',
'      and idntfccion_sjto              = :P300_IDNTFCCION'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(62694841390527338)
,p_validation_name=>unistr('Tipo identificaci\00F3n no null Representante Legal')
,p_validation_sequence=>10
,p_validation=>'P300_CDGO_IDNTFCCION_TPO_L'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_RPRSNTNTE,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(62683641160527323)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(62695247726527338)
,p_validation_name=>'Identificacion no null Representante Legal'
,p_validation_sequence=>20
,p_validation=>'P300_IDNTFCCION_L'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_RPRSNTNTE,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(62684013528527323)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(62695679258527338)
,p_validation_name=>'primer nombre no null Representante Legal'
,p_validation_sequence=>30
,p_validation=>'P300_PRMER_NMBRE_L'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_RPRSNTNTE,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(62684481677527323)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(62696014207527339)
,p_validation_name=>'Primer apellido no null Representante Legal'
,p_validation_sequence=>40
,p_validation=>'P300_PRMER_APLLDO_L'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_RPRSNTNTE,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(62685211868527324)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(62696499602527339)
,p_validation_name=>'Pais no null Representante Legal'
,p_validation_sequence=>50
,p_validation=>'P300_ID_PAIS_NTFCCION_L'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_RPRSNTNTE,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(62686086593527324)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(62696841793527339)
,p_validation_name=>'Departamento no null Representante Legal'
,p_validation_sequence=>60
,p_validation=>'P300_ID_DPRTMNTO_NTFCCION_L'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_RPRSNTNTE,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(62686459638527324)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(62697217857527339)
,p_validation_name=>'Municipio no null Representante Legal'
,p_validation_sequence=>70
,p_validation=>'P300_ID_MNCPIO_NTFCCION_L'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_RPRSNTNTE,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(62686829657527325)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(62697678711527339)
,p_validation_name=>unistr('Direcci\00F3n no null Representante Legal')
,p_validation_sequence=>80
,p_validation=>'P300_DRCCION_NTFCCION_L'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_RPRSNTNTE,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(62687249750527325)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(62698009132527339)
,p_validation_name=>'Email no null Representante Legal'
,p_validation_sequence=>90
,p_validation=>'P300_EMAIL_L'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_RPRSNTNTE,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(62688045233527325)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(62698857897527340)
,p_validation_name=>'Email Valido Representante Legal'
,p_validation_sequence=>110
,p_validation=>'P300_EMAIL_L'
,p_validation2=>'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('#LABEL# debe tener el formato de un correo electr\00F3nico.')
,p_validation_condition=>'BTN_AGRGAR_RPRSNTNTE,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(62688045233527325)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(62691242861527336)
,p_validation_name=>unistr('Tipo identificaci\00F3n no null Contador')
,p_validation_sequence=>200
,p_validation=>'P300_CDGO_IDNTFCCION_TPO_C'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_CNTDOR,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(62673042922527316)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(62691695082527337)
,p_validation_name=>'Identificacion no null Contador'
,p_validation_sequence=>210
,p_validation=>'P300_IDNTFCCION_C'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_CNTDOR,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(62673442683527316)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(62692090429527337)
,p_validation_name=>'primer nombre no null Contador'
,p_validation_sequence=>220
,p_validation=>'P300_PRMER_NMBRE_C'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_CNTDOR,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(62673837422527316)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(62692478511527337)
,p_validation_name=>'Primer apellido no null Contador'
,p_validation_sequence=>220
,p_validation=>'P300_PRMER_APLLDO_C'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_CNTDOR,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(62674670777527317)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(62692819687527337)
,p_validation_name=>'Pais no null Contador'
,p_validation_sequence=>230
,p_validation=>'P300_ID_PAIS_NTFCCION_C'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_CNTDOR,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(62675497605527317)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(62693245617527337)
,p_validation_name=>'Departamento no null'
,p_validation_sequence=>240
,p_validation=>'P300_ID_DPRTMNTO_NTFCCION_C'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_CNTDOR,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(62675841096527318)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(62693635028527338)
,p_validation_name=>'Municipio no null'
,p_validation_sequence=>250
,p_validation=>'P300_ID_MNCPIO_NTFCCION_C'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_CNTDOR,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(62676284482527318)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(62694085085527338)
,p_validation_name=>unistr('Direcci\00F3n no null Contador')
,p_validation_sequence=>270
,p_validation=>'P300_DRCCION_NTFCCION_C'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_CNTDOR,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(62676639634527318)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(62694448809527338)
,p_validation_name=>'Email no null Contador'
,p_validation_sequence=>290
,p_validation=>'P300_EMAIL_C'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_CNTDOR,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(62677499797527318)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(62698488499527340)
,p_validation_name=>'Email valido Contador'
,p_validation_sequence=>300
,p_validation=>'P300_EMAIL_C'
,p_validation2=>'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('#LABEL# debe tener el formato de un correo electr\00F3nico.')
,p_validation_condition=>'BTN_AGRGAR_CNTDOR,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(62677499797527318)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(62699920439527341)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar o crear Representante legal'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta       number;',
'    v_mnsje_rspsta      varchar2(4000)  ;',
'begin',
'    -- llamamos la UP que crea o actualiza el reponsable',
'    pkg_si_sujeto_impuesto.prc_ac_sujeto_responsable (',
'                                              p_cdgo_clnte				=> :F_CDGO_CLNTE',
'                                            , p_id_sjto_rspnsble		=> :P300_ID_SJTO_RSPNSBLE_L',
'                                            , p_id_sjto_impsto			=> :P300_ID_SJTO_IMPSTO',
'                                            , p_cdgo_idntfccion_tpo     => :P300_CDGO_IDNTFCCION_TPO_L',
'                                            , p_idntfccion 				=> :P300_IDNTFCCION_L',
'                                            , p_prmer_nmbre 			=> :P300_PRMER_NMBRE_L',
'                                            , p_sgndo_nmbre 			=> :P300_SGNDO_NMBRE_L',
'                                            , p_prmer_aplldo 			=> :P300_PRMER_APLLDO_L',
'                                            , p_sgndo_aplldo 			=> :P300_SGNDO_APLLDO_L',
'                                            , p_prncpal_s_n 			=> :P300_PRNCPAL_S_N_L',
'                                            , p_cdgo_tpo_rspnsble		=> :P300_CDGO_TPO_RSPNSBLE_L',
'                                            , p_prcntje_prtcpcion 		=> null',
'                                            , p_orgen_dcmnto 			=> null',
'                                            , p_id_pais_ntfccion 		=> :P300_ID_PAIS_NTFCCION_L',
'                                            , p_id_dprtmnto_ntfccion 	=> :P300_ID_DPRTMNTO_NTFCCION_L',
'                                            , p_id_mncpio_ntfccion 		=> :P300_ID_MNCPIO_NTFCCION_L',
'                                            , p_drccion_ntfccion 		=> :P300_DRCCION_NTFCCION_L',
'                                            , p_email 					=> :P300_EMAIL_L',
'                                            , p_tlfno 					=> :P300_TLFNO_L',
'                                            , p_cllar 					=> null',
'                                            , p_actvo 					=> :P300_ACTVO_L',
'                                            , p_id_trcro 				=> :P300_ID_TRCRO_L',
'                                            , p_indcdor_mgrdo 			=> ''N''',
'                                            , p_indcdor_cntrbynte		=> ''N''',
'                                            , p_indcdr_fncnrio			=> ''N''',
'                                            , p_accion					=> case when :P300_ID_SJTO_RSPNSBLE_L is null then',
'                                                                                     ''I'' -- Insertar',
'                                                                                else',
'                                                                                     ''A'' --Actualizar',
'                                                                            end         ',
'                                            , o_cdgo_rspsta 			=> v_cdgo_rspsta',
'                                            , o_mnsje_rspsta 			=> v_mnsje_rspsta',
'    );',
'    -- Validamos si Hubo errores',
'    if v_cdgo_rspsta <> 0 then',
'        raise_application_error(-20000, v_mnsje_rspsta);',
'    else',
'        if :P300_ID_SJTO_RSPNSBLE_L is not null then',
unistr('            apex_application.g_print_success_message:= ''Actualizaci\00F3n de exitosa'';'),
'         else',
'             apex_application.g_print_success_message:= ''Registro de exitoso'';',
'         end if;',
'    end if;',
'    ',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_AGRGAR_RPRSNTNTE,BTN_ACTUALIZAR__TODO'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(62700399212527342)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar o crear Contador'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta       number;',
'    v_mnsje_rspsta      varchar2(4000)  ;',
'begin',
'    -- llamamos la UP que crea o actualiza el reponsable',
'    pkg_si_sujeto_impuesto.prc_ac_sujeto_responsable (',
'                                              p_cdgo_clnte				=> :F_CDGO_CLNTE',
'                                            , p_id_sjto_rspnsble		=> :P300_ID_SJTO_RSPNSBLE_C',
'                                            , p_id_sjto_impsto			=> :P300_ID_SJTO_IMPSTO',
'                                            , p_cdgo_idntfccion_tpo     => :P300_CDGO_IDNTFCCION_TPO_C',
'                                            , p_idntfccion 				=> :P300_IDNTFCCION_C',
'                                            , p_prmer_nmbre 			=> :P300_PRMER_NMBRE_C',
'                                            , p_sgndo_nmbre 			=> :P300_SGNDO_NMBRE_C',
'                                            , p_prmer_aplldo 			=> :P300_PRMER_APLLDO_C',
'                                            , p_sgndo_aplldo 			=> :P300_SGNDO_APLLDO_C',
'                                            , p_prncpal_s_n 			=> :P300_PRNCPAL_S_N_C',
'                                            , p_cdgo_tpo_rspnsble		=> :P300_CDGO_TPO_RSPNSBLE_C',
'                                            , p_prcntje_prtcpcion 		=> null',
'                                            , p_orgen_dcmnto 			=> null',
'                                            , p_id_pais_ntfccion 		=> :P300_ID_PAIS_NTFCCION_C',
'                                            , p_id_dprtmnto_ntfccion 	=> :P300_ID_DPRTMNTO_NTFCCION_C',
'                                            , p_id_mncpio_ntfccion 		=> :P300_ID_MNCPIO_NTFCCION_C',
'                                            , p_drccion_ntfccion 		=> :P300_DRCCION_NTFCCION_C',
'                                            , p_email 					=> :P300_EMAIL_C',
'                                            , p_tlfno 					=> :P300_TLFNO_C',
'                                            , p_cllar 					=> null',
'                                            , p_actvo 					=> :P300_ACTVO_C',
'                                            , p_id_trcro 				=> :P300_ID_TRCRO_C',
'                                            , p_indcdor_mgrdo 			=> ''N''',
'                                            , p_indcdor_cntrbynte		=> ''N''',
'                                            , p_indcdr_fncnrio			=> ''N''',
'                                            , p_accion					=> case when :P300_ID_SJTO_RSPNSBLE_C is null then',
'                                                                                     ''I'' -- Insertar',
'                                                                                else',
'                                                                                     ''A'' --Actualizar',
'                                                                            end         ',
'                                            , o_cdgo_rspsta 			=> v_cdgo_rspsta',
'                                            , o_mnsje_rspsta 			=> v_mnsje_rspsta',
'    );',
'',
'    -- Validamos si Hubo errores',
'    if v_cdgo_rspsta <> 0 then',
'        raise_application_error(-20000, v_mnsje_rspsta);',
'    else',
'        if :P300_ID_SJTO_RSPNSBLE_C is not null then',
unistr('            apex_application.g_print_success_message:= ''Actualizaci\00F3n de exitosa'';'),
'         else',
'             apex_application.g_print_success_message:= ''Registro de exitoso'';',
'         end if;',
'    end if;',
'    ',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_AGRGAR_CNTDOR,BTN_ACTUALIZAR__TODO'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(62699158458527340)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Recuperar datos del Representante Legal'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    :P300_LBEL_BTN_RPRSNTNTE_LGAL := ''Actualizar Datos del Representante Legal'';',
'    select id_sjto_impsto ',
'         , cdgo_idntfccion_tpo',
'         , idntfccion',
'         , prmer_nmbre',
'         , sgndo_nmbre',
'         , prmer_aplldo',
'         , sgndo_aplldo',
'         , prncpal_s_n',
'         , cdgo_tpo_rspnsble',
'         , id_pais_ntfccion',
'         , id_dprtmnto_ntfccion',
'         , id_mncpio_ntfccion',
'         , drccion_ntfccion',
'         , email',
'         , tlfno',
'        -- , cllar',
'         , actvo',
'         , id_trcro',
'         , id_sjto_rspnsble',
'      into :P300_ID_SJTO_IMPSTO_L',
'         , :P300_CDGO_IDNTFCCION_TPO_L',
'         , :P300_IDNTFCCION_L',
'         , :P300_PRMER_NMBRE_L',
'         , :P300_SGNDO_NMBRE_L',
'         , :P300_PRMER_APLLDO_L',
'         , :P300_SGNDO_APLLDO_L',
'         , :P300_PRNCPAL_S_N_L',
'         , :P300_CDGO_TPO_RSPNSBLE_L',
'         , :P300_ID_PAIS_NTFCCION_L',
'         , :P300_ID_DPRTMNTO_NTFCCION_L',
'         , :P300_ID_MNCPIO_NTFCCION_L',
'         , :P300_DRCCION_NTFCCION_L',
'         , :P300_EMAIL_L',
'         , :P300_TLFNO_L',
'        -- , :P300_CLLAR_L',
'         , :P300_ACTVO_L',
'         , :P300_ID_TRCRO_L',
'         , :P300_ID_SJTO_RSPNSBLE_L',
'       from si_i_sujetos_responsable',
'      where id_sjto_impsto            = :P300_ID_SJTO_IMPSTO ',
'        and cdgo_tpo_rspnsble         = ''L''',
'        and actvo                     = ''S'';    ',
'    exception',
'        when no_data_found then',
'            :P300_LBEL_BTN_RPRSNTNTE_LGAL   := ''Guardar Datos del Representante Legal'';',
'            :P300_ID_SJTO_IMPSTO_L          := null;',
'            :P300_CDGO_IDNTFCCION_TPO_L     := null;',
'            :P300_IDNTFCCION_L              := null;',
'            :P300_PRMER_NMBRE_L             := null;',
'            :P300_SGNDO_NMBRE_L             := null;',
'            :P300_PRMER_APLLDO_L            := null;',
'            :P300_SGNDO_APLLDO_L            := null;',
'            :P300_PRNCPAL_S_N_L             := null;',
'            :P300_CDGO_TPO_RSPNSBLE_L       := null;',
'            :P300_ID_PAIS_NTFCCION_L        := null;',
'            :P300_ID_DPRTMNTO_NTFCCION_L    := null;',
'            :P300_ID_MNCPIO_NTFCCION_L      := null;',
'            :P300_DRCCION_NTFCCION_L        := null;',
'            :P300_EMAIL_L                   := null;',
'            :P300_TLFNO_L                   := null;',
'            :P300_CLLAR_L                   := null;',
'            :P300_ACTVO_L                   := null;',
'            :P300_ID_TRCRO_L                := null;',
'            :P300_ID_SJTO_RSPNSBLE_L        := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P300_ID_SJTO_IMPSTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(62699575719527341)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Recuperar datos del Contador'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' :P300_LBEL_BTN_CNTDOR := ''Actualizar Datos del Contador'';',
' select ',
'        id_sjto_impsto ,',
'        cdgo_idntfccion_tpo ,',
'        idntfccion ,',
'        prmer_nmbre ,',
'        sgndo_nmbre ,',
'        prmer_aplldo ,',
'        sgndo_aplldo ,',
'        prncpal_s_n ,',
'        cdgo_tpo_rspnsble ,',
'        --prcntje_prtcpcion ,',
'        --orgen_dcmnto ,',
'        id_pais_ntfccion ,',
'        id_dprtmnto_ntfccion ,',
'        id_mncpio_ntfccion ,',
'        drccion_ntfccion ,',
'        email ,',
'        tlfno ,',
'        --cllar ,',
'        actvo ,',
'        id_trcro ,',
'        id_sjto_rspnsble',
'  into  ',
'        :P300_ID_SJTO_IMPSTO_C,',
'        :P300_CDGO_IDNTFCCION_TPO_C,',
'        :P300_IDNTFCCION_C,',
'        :P300_PRMER_NMBRE_C,',
'        :P300_SGNDO_NMBRE_C,',
'        :P300_PRMER_APLLDO_C,',
'        :P300_SGNDO_APLLDO_C,',
'        :P300_PRNCPAL_S_N_C,',
'        :P300_CDGO_TPO_RSPNSBLE_C,',
'        --:P300_PRCNTJE_PRTCPCION_C,',
'        --:P300_ORGEN_DCMNTO_C,',
'        :P300_ID_PAIS_NTFCCION_C,',
'        :P300_ID_DPRTMNTO_NTFCCION_C,',
'        :P300_ID_MNCPIO_NTFCCION_C,',
'        :P300_DRCCION_NTFCCION_C,',
'        :P300_EMAIL_C,',
'        :P300_TLFNO_C,',
'       -- :P300_CLLAR_C,',
'        :P300_ACTVO_C,',
'        :P300_ID_TRCRO_C,',
'        :P300_ID_SJTO_RSPNSBLE_C',
'  from si_i_sujetos_responsable',
' where id_sjto_impsto  = :P300_ID_SJTO_IMPSTO',
'   and (cdgo_tpo_rspnsble = ''CO'' or cdgo_tpo_rspnsble = ''RF'')',
'   and actvo             = ''S'' ',
'    and rownum = 1    ',
'order by cdgo_tpo_rspnsble desc;',
'     ',
'exception',
'    when no_data_found then',
'        :P300_LBEL_BTN_CNTDOR := ''Guardar Datos del Contador'';',
'        :P300_ID_SJTO_IMPSTO_C		:= '''';',
'        :P300_CDGO_IDNTFCCION_TPO_C   := '''';',
'        :P300_IDNTFCCION_C	        := '''';',
'        :P300_PRMER_NMBRE_C	        := '''';',
'        :P300_SGNDO_NMBRE_C	        := '''';',
'        :P300_PRMER_APLLDO_C		    := '''';',
'        :P300_SGNDO_APLLDO_C		    := '''';',
'        :P300_PRNCPAL_S_N_C		    := '''';',
'        :P300_CDGO_TPO_RSPNSBLE_C		:= '''';	',
'        --:P300_PRCNTJE_PRTCPCION_C	:= '''';',
'        --:P300_ORGEN_DCMNTO_C		:= '''';	',
'        :P300_ID_PAIS_NTFCCION_C	    := '''';',
'        :P300_ID_DPRTMNTO_NTFCCION_C	:= '''';	',
'        :P300_ID_MNCPIO_NTFCCION_C	:= '''';		',
'        :P300_DRCCION_NTFCCION_C		:= '''';	',
'        :P300_EMAIL_C			        := '''';',
'        :P300_TLFNO_C			        := '''';',
'        :P300_CLLAR_C					:= '''';	',
'        :P300_ACTVO_C			        := '''';',
'        :P300_ID_TRCRO_C			    := '''';',
'        :P300_ID_SJTO_RSPNSBLE_C	    := '''';',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P300_ID_SJTO_IMPSTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
