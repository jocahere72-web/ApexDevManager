prompt --application/pages/page_00031
begin
wwv_flow_api.create_page(
 p_id=>31
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('31.Validacion informaci\00F3n Representante Legal, Revisor Fiscal Contador')
,p_step_title=>unistr('31.Validacion informaci\00F3n Representante Legal, Revisor Fiscal Contador')
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
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20210305164925'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5239618060988735)
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
 p_id=>wwv_flow_api.id(9046084979285303)
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
 p_id=>wwv_flow_api.id(59786066958195308)
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
 p_id=>wwv_flow_api.id(60728264395242844)
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
 p_id=>wwv_flow_api.id(62991457620764081)
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
 p_id=>wwv_flow_api.id(5265527176065226)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9046084979285303)
,p_button_name=>'BTN_AGRGAR_CNTDOR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P31_LBEL_BTN_CNTDOR.'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5257247016065204)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(60728264395242844)
,p_button_name=>'BTN_AGRGAR_RPRSNTNTE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P31_LBEL_BTN_RPRSNTNTE_LGAL.'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5277672634065245)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(59786066958195308)
,p_button_name=>'BTN_RGRSAR_INCIO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar al Inicio'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:&P31_BRANCH.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5239335682988732)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(59786066958195308)
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
 p_id=>wwv_flow_api.id(5218175119825109)
,p_name=>'P31_IDNTFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5239618060988735)
,p_prompt=>'P31_IDNTFCCION'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5218255404825110)
,p_name=>'P31_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5239618060988735)
,p_prompt=>'P31_ID_IMPSTO'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5239183343988730)
,p_name=>'P31_ID_SJTO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5239618060988735)
,p_prompt=>'P31_ID_SJTO_IMPSTO'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5239769123988736)
,p_name=>'P31_BRANCH'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(5239618060988735)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5257641176065207)
,p_name=>'P31_PRNCPAL_S_N_L'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(60728264395242844)
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
 p_id=>wwv_flow_api.id(5258040766065217)
,p_name=>'P31_CDGO_TPO_RSPNSBLE_L'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(60728264395242844)
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
 p_id=>wwv_flow_api.id(5258483734065218)
,p_name=>'P31_CDGO_IDNTFCCION_TPO_L'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(60728264395242844)
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
 p_id=>wwv_flow_api.id(5258851561065218)
,p_name=>'P31_IDNTFCCION_L'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(60728264395242844)
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
 p_id=>wwv_flow_api.id(5259244217065219)
,p_name=>'P31_PRMER_NMBRE_L'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(60728264395242844)
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
 p_id=>wwv_flow_api.id(5259698626065219)
,p_name=>'P31_SGNDO_NMBRE_L'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(60728264395242844)
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
 p_id=>wwv_flow_api.id(5260021305065219)
,p_name=>'P31_PRMER_APLLDO_L'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(60728264395242844)
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
 p_id=>wwv_flow_api.id(5260482005065220)
,p_name=>'P31_SGNDO_APLLDO_L'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(60728264395242844)
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
 p_id=>wwv_flow_api.id(5260815652065221)
,p_name=>'P31_ID_PAIS_NTFCCION_L'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(60728264395242844)
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
 p_id=>wwv_flow_api.id(5261277250065221)
,p_name=>'P31_ID_DPRTMNTO_NTFCCION_L'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(60728264395242844)
,p_prompt=>'Departamento'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_dprtmnto as d,',
'        a.id_dprtmnto as r',
'   from df_s_departamentos a',
'  where a.id_pais = :P31_ID_PAIS_NTFCCION_L'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P31_ID_PAIS_NTFCCION_L'
,p_ajax_items_to_submit=>'P31_ID_DPRTMNTO_NTFCCION_L,P31_ID_MNCPIO_NTFCCION_L'
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
 p_id=>wwv_flow_api.id(5261674414065221)
,p_name=>'P31_ID_MNCPIO_NTFCCION_L'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(60728264395242844)
,p_prompt=>'Municipio'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_mncpio as d,',
'        a.id_mncpio as r',
'from df_s_municipios a',
'where a.id_dprtmnto = :P31_ID_DPRTMNTO_NTFCCION_L;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P31_ID_DPRTMNTO_NTFCCION_L'
,p_ajax_items_to_submit=>'P31_ID_MNCPIO_NTFCCION_L'
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
 p_id=>wwv_flow_api.id(5262065951065223)
,p_name=>'P31_DRCCION_NTFCCION_L'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(60728264395242844)
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
 p_id=>wwv_flow_api.id(5262409315065223)
,p_name=>'P31_TLFNO_L'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(60728264395242844)
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
 p_id=>wwv_flow_api.id(5262812178065224)
,p_name=>'P31_EMAIL_L'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(60728264395242844)
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
 p_id=>wwv_flow_api.id(5263288430065224)
,p_name=>'P31_ACTVO_L'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(60728264395242844)
,p_item_default=>'S'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5263602166065224)
,p_name=>'P31_ID_SJTO_RSPNSBLE_L'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(60728264395242844)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5264068498065224)
,p_name=>'P31_ID_SJTO_IMPSTO_L'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(60728264395242844)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5264417599065225)
,p_name=>'P31_ID_TRCRO_L'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(60728264395242844)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5264862617065225)
,p_name=>'P31_LBEL_BTN_RPRSNTNTE_LGAL'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(60728264395242844)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5265937236065227)
,p_name=>'P31_PRNCPAL_S_N_C'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9046084979285303)
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
 p_id=>wwv_flow_api.id(5266329755065228)
,p_name=>'P31_CDGO_TPO_RSPNSBLE_C'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(9046084979285303)
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
 p_id=>wwv_flow_api.id(5266713882065229)
,p_name=>'P31_CDGO_IDNTFCCION_TPO_C'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(9046084979285303)
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
 p_id=>wwv_flow_api.id(5267191368065229)
,p_name=>'P31_IDNTFCCION_C'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(9046084979285303)
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
 p_id=>wwv_flow_api.id(5267559962065229)
,p_name=>'P31_PRMER_NMBRE_C'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(9046084979285303)
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
 p_id=>wwv_flow_api.id(5267939733065229)
,p_name=>'P31_SGNDO_NMBRE_C'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(9046084979285303)
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
 p_id=>wwv_flow_api.id(5268377488065229)
,p_name=>'P31_PRMER_APLLDO_C'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(9046084979285303)
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
 p_id=>wwv_flow_api.id(5268743337065230)
,p_name=>'P31_SGNDO_APLLDO_C'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(9046084979285303)
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
 p_id=>wwv_flow_api.id(5269183963065230)
,p_name=>'P31_ID_PAIS_NTFCCION_C'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(9046084979285303)
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
 p_id=>wwv_flow_api.id(5269537342065230)
,p_name=>'P31_ID_DPRTMNTO_NTFCCION_C'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(9046084979285303)
,p_prompt=>'Departamento'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_dprtmnto as d,',
'        a.id_dprtmnto as r',
'   from df_s_departamentos a',
'  where a.id_pais = :P31_ID_PAIS_NTFCCION_C'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P31_ID_PAIS_NTFCCION_C'
,p_ajax_items_to_submit=>'P31_ID_DPRTMNTO_NTFCCION_C'
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
 p_id=>wwv_flow_api.id(5269916585065230)
,p_name=>'P31_ID_MNCPIO_NTFCCION_C'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(9046084979285303)
,p_prompt=>'Municipio'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_mncpio as d,',
'        a.id_mncpio as r',
'from df_s_municipios a',
'where a.id_dprtmnto = :P31_ID_DPRTMNTO_NTFCCION_C;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P31_ID_DPRTMNTO_NTFCCION_C'
,p_ajax_items_to_submit=>'P31_ID_MNCPIO_NTFCCION_C'
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
 p_id=>wwv_flow_api.id(5270328074065231)
,p_name=>'P31_DRCCION_NTFCCION_C'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(9046084979285303)
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
 p_id=>wwv_flow_api.id(5270768680065231)
,p_name=>'P31_TLFNO_C'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(9046084979285303)
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
 p_id=>wwv_flow_api.id(5271137057065232)
,p_name=>'P31_EMAIL_C'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(9046084979285303)
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
 p_id=>wwv_flow_api.id(5271535304065237)
,p_name=>'P31_ACTVO_C'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(9046084979285303)
,p_item_default=>'S'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5271914780065238)
,p_name=>'P31_ID_SJTO_RSPNSBLE_C'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(9046084979285303)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5272327947065238)
,p_name=>'P31_ID_SJTO_IMPSTO_C'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(9046084979285303)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5272703530065238)
,p_name=>'P31_ID_TRCRO_C'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(9046084979285303)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5273105357065238)
,p_name=>'P31_LBEL_BTN_CNTDOR'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(9046084979285303)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5278049539065245)
,p_name=>'P31_ID_DCLRCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(59786066958195308)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5278405964065246)
,p_name=>'P31_CDGO_DCLRCION_ESTDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(59786066958195308)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5278864704065246)
,p_name=>'P31_INDCDOR_ADJNTOS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(59786066958195308)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(5239200671988731)
,p_computation_sequence=>30
,p_computation_item=>'P31_ID_SJTO_IMPSTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select id_sjto_impsto',
'     from v_si_i_sujetos_impuesto',
'    where cdgo_clnte                   = :F_CDGO_CLNTE',
'      and id_impsto                    = :P31_ID_IMPSTO',
'      and idntfccion_sjto              = :P31_IDNTFCCION'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5297282231065339)
,p_validation_name=>unistr('Tipo identificaci\00F3n no null Representante Legal')
,p_validation_sequence=>10
,p_validation=>'P31_CDGO_IDNTFCCION_TPO_L'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_RPRSNTNTE,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5258483734065218)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5297612168065340)
,p_validation_name=>'Identificacion no null Representante Legal'
,p_validation_sequence=>20
,p_validation=>'P31_IDNTFCCION_L'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_RPRSNTNTE,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5258851561065218)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5298039665065340)
,p_validation_name=>'primer nombre no null Representante Legal'
,p_validation_sequence=>30
,p_validation=>'P31_PRMER_NMBRE_L'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_RPRSNTNTE,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5259244217065219)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5298428621065340)
,p_validation_name=>'Primer apellido no null Representante Legal'
,p_validation_sequence=>40
,p_validation=>'P31_PRMER_APLLDO_L'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_RPRSNTNTE,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5260021305065219)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5298848432065340)
,p_validation_name=>'Pais no null Representante Legal'
,p_validation_sequence=>50
,p_validation=>'P31_ID_PAIS_NTFCCION_L'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_RPRSNTNTE,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5260815652065221)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5299250566065340)
,p_validation_name=>'Departamento no null Representante Legal'
,p_validation_sequence=>60
,p_validation=>'P31_ID_DPRTMNTO_NTFCCION_L'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_RPRSNTNTE,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5261277250065221)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5299643985065340)
,p_validation_name=>'Municipio no null Representante Legal'
,p_validation_sequence=>70
,p_validation=>'P31_ID_MNCPIO_NTFCCION_L'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_RPRSNTNTE,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5261674414065221)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5300079276065340)
,p_validation_name=>unistr('Direcci\00F3n no null Representante Legal')
,p_validation_sequence=>80
,p_validation=>'P31_DRCCION_NTFCCION_L'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_RPRSNTNTE,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5262065951065223)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5300444795065341)
,p_validation_name=>'Email no null Representante Legal'
,p_validation_sequence=>90
,p_validation=>'P31_EMAIL_L'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_RPRSNTNTE,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5262812178065224)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5301209289065341)
,p_validation_name=>'Email Valido Representante Legal'
,p_validation_sequence=>110
,p_validation=>'P31_EMAIL_L'
,p_validation2=>'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('#LABEL# debe tener el formato de un correo electr\00F3nico.')
,p_validation_condition=>'BTN_AGRGAR_RPRSNTNTE,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5262812178065224)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5293684144065338)
,p_validation_name=>unistr('Tipo identificaci\00F3n no null Contador')
,p_validation_sequence=>200
,p_validation=>'P31_CDGO_IDNTFCCION_TPO_C'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_CNTDOR,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5266713882065229)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5294045301065338)
,p_validation_name=>'Identificacion no null Contador'
,p_validation_sequence=>210
,p_validation=>'P31_IDNTFCCION_C'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_CNTDOR,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5267191368065229)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5294447968065338)
,p_validation_name=>'primer nombre no null Contador'
,p_validation_sequence=>220
,p_validation=>'P31_PRMER_NMBRE_C'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_CNTDOR,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5267559962065229)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5294848975065338)
,p_validation_name=>'Primer apellido no null Contador'
,p_validation_sequence=>220
,p_validation=>'P31_PRMER_APLLDO_C'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_CNTDOR,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5268377488065229)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5295292140065339)
,p_validation_name=>'Pais no null Contador'
,p_validation_sequence=>230
,p_validation=>'P31_ID_PAIS_NTFCCION_C'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_CNTDOR,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5269183963065230)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5295670451065339)
,p_validation_name=>'Departamento no null'
,p_validation_sequence=>240
,p_validation=>'P31_ID_DPRTMNTO_NTFCCION_C'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_CNTDOR,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5269537342065230)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5296015738065339)
,p_validation_name=>'Municipio no null'
,p_validation_sequence=>250
,p_validation=>'P31_ID_MNCPIO_NTFCCION_C'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_CNTDOR,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5269916585065230)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5296451378065339)
,p_validation_name=>unistr('Direcci\00F3n no null Contador')
,p_validation_sequence=>270
,p_validation=>'P31_DRCCION_NTFCCION_C'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_CNTDOR,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5270328074065231)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5296885551065339)
,p_validation_name=>'Email no null Contador'
,p_validation_sequence=>290
,p_validation=>'P31_EMAIL_C'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'BTN_AGRGAR_CNTDOR,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5271137057065232)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5300827946065341)
,p_validation_name=>'Email valido Contador'
,p_validation_sequence=>300
,p_validation=>'P31_EMAIL_C'
,p_validation2=>'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('#LABEL# debe tener el formato de un correo electr\00F3nico.')
,p_validation_condition=>'BTN_AGRGAR_CNTDOR,BTN_ACTUALIZAR__TODO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5271137057065232)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5303189077065342)
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
'                                            , p_id_sjto_rspnsble		=> :P31_ID_SJTO_RSPNSBLE_L',
'                                            , p_id_sjto_impsto			=> :P31_ID_SJTO_IMPSTO',
'                                            , p_cdgo_idntfccion_tpo     => :P31_CDGO_IDNTFCCION_TPO_L',
'                                            , p_idntfccion 				=> :P31_IDNTFCCION_L',
'                                            , p_prmer_nmbre 			=> :P31_PRMER_NMBRE_L',
'                                            , p_sgndo_nmbre 			=> :P31_SGNDO_NMBRE_L',
'                                            , p_prmer_aplldo 			=> :P31_PRMER_APLLDO_L',
'                                            , p_sgndo_aplldo 			=> :P31_SGNDO_APLLDO_L',
'                                            , p_prncpal_s_n 			=> :P31_PRNCPAL_S_N_L',
'                                            , p_cdgo_tpo_rspnsble		=> :P31_CDGO_TPO_RSPNSBLE_L',
'                                            , p_prcntje_prtcpcion 		=> null',
'                                            , p_orgen_dcmnto 			=> null',
'                                            , p_id_pais_ntfccion 		=> :P31_ID_PAIS_NTFCCION_L',
'                                            , p_id_dprtmnto_ntfccion 	=> :P31_ID_DPRTMNTO_NTFCCION_L',
'                                            , p_id_mncpio_ntfccion 		=> :P31_ID_MNCPIO_NTFCCION_L',
'                                            , p_drccion_ntfccion 		=> :P31_DRCCION_NTFCCION_L',
'                                            , p_email 					=> :P31_EMAIL_L',
'                                            , p_tlfno 					=> :P31_TLFNO_L',
'                                            , p_cllar 					=> null',
'                                            , p_actvo 					=> :P31_ACTVO_L',
'                                            , p_id_trcro 				=> :P31_ID_TRCRO_L',
'                                            , p_indcdor_mgrdo 			=> ''N''',
'                                            , p_indcdor_cntrbynte		=> ''N''',
'                                            , p_indcdr_fncnrio			=> ''N''',
'                                            , p_accion					=> case when :P31_ID_SJTO_RSPNSBLE_L is null then',
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
'        if :P31_ID_SJTO_RSPNSBLE_L is not null then',
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
 p_id=>wwv_flow_api.id(5303555767065343)
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
'                                            , p_id_sjto_rspnsble		=> :P31_ID_SJTO_RSPNSBLE_C',
'                                            , p_id_sjto_impsto			=> :P31_ID_SJTO_IMPSTO',
'                                            , p_cdgo_idntfccion_tpo     => :P31_CDGO_IDNTFCCION_TPO_C',
'                                            , p_idntfccion 				=> :P31_IDNTFCCION_C',
'                                            , p_prmer_nmbre 			=> :P31_PRMER_NMBRE_C',
'                                            , p_sgndo_nmbre 			=> :P31_SGNDO_NMBRE_C',
'                                            , p_prmer_aplldo 			=> :P31_PRMER_APLLDO_C',
'                                            , p_sgndo_aplldo 			=> :P31_SGNDO_APLLDO_C',
'                                            , p_prncpal_s_n 			=> :P31_PRNCPAL_S_N_C',
'                                            , p_cdgo_tpo_rspnsble		=> :P31_CDGO_TPO_RSPNSBLE_C',
'                                            , p_prcntje_prtcpcion 		=> null',
'                                            , p_orgen_dcmnto 			=> null',
'                                            , p_id_pais_ntfccion 		=> :P31_ID_PAIS_NTFCCION_C',
'                                            , p_id_dprtmnto_ntfccion 	=> :P31_ID_DPRTMNTO_NTFCCION_C',
'                                            , p_id_mncpio_ntfccion 		=> :P31_ID_MNCPIO_NTFCCION_C',
'                                            , p_drccion_ntfccion 		=> :P31_DRCCION_NTFCCION_C',
'                                            , p_email 					=> :P31_EMAIL_C',
'                                            , p_tlfno 					=> :P31_TLFNO_C',
'                                            , p_cllar 					=> null',
'                                            , p_actvo 					=> :P31_ACTVO_C',
'                                            , p_id_trcro 				=> :P31_ID_TRCRO_C',
'                                            , p_indcdor_mgrdo 			=> ''N''',
'                                            , p_indcdor_cntrbynte		=> ''N''',
'                                            , p_indcdr_fncnrio			=> ''N''',
'                                            , p_accion					=> case when :P31_ID_SJTO_RSPNSBLE_C is null then',
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
'        if :P31_ID_SJTO_RSPNSBLE_C is not null then',
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
 p_id=>wwv_flow_api.id(5302327764065342)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Recuperar datos del Representante Legal'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    :P31_LBEL_BTN_RPRSNTNTE_LGAL := ''Actualizar Datos del Representante Legal'';',
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
'      into :P31_ID_SJTO_IMPSTO_L',
'         , :P31_CDGO_IDNTFCCION_TPO_L',
'         , :P31_IDNTFCCION_L',
'         , :P31_PRMER_NMBRE_L',
'         , :P31_SGNDO_NMBRE_L',
'         , :P31_PRMER_APLLDO_L',
'         , :P31_SGNDO_APLLDO_L',
'         , :P31_PRNCPAL_S_N_L',
'         , :P31_CDGO_TPO_RSPNSBLE_L',
'         , :P31_ID_PAIS_NTFCCION_L',
'         , :P31_ID_DPRTMNTO_NTFCCION_L',
'         , :P31_ID_MNCPIO_NTFCCION_L',
'         , :P31_DRCCION_NTFCCION_L',
'         , :P31_EMAIL_L',
'         , :P31_TLFNO_L',
'        -- , :P31_CLLAR_L',
'         , :P31_ACTVO_L',
'         , :P31_ID_TRCRO_L',
'         , :P31_ID_SJTO_RSPNSBLE_L',
'       from si_i_sujetos_responsable',
'      where id_sjto_impsto            = :P31_ID_SJTO_IMPSTO ',
'        and cdgo_tpo_rspnsble         = ''L''',
'        and actvo                     = ''S'';    ',
'    exception',
'        when no_data_found then',
'            :P31_LBEL_BTN_RPRSNTNTE_LGAL   := ''Guardar Datos del Representante Legal'';',
'            :P31_ID_SJTO_IMPSTO_L          := null;',
'            :P31_CDGO_IDNTFCCION_TPO_L     := null;',
'            :P31_IDNTFCCION_L              := null;',
'            :P31_PRMER_NMBRE_L             := null;',
'            :P31_SGNDO_NMBRE_L             := null;',
'            :P31_PRMER_APLLDO_L            := null;',
'            :P31_SGNDO_APLLDO_L            := null;',
'            :P31_PRNCPAL_S_N_L             := null;',
'            :P31_CDGO_TPO_RSPNSBLE_L       := null;',
'            :P31_ID_PAIS_NTFCCION_L        := null;',
'            :P31_ID_DPRTMNTO_NTFCCION_L    := null;',
'            :P31_ID_MNCPIO_NTFCCION_L      := null;',
'            :P31_DRCCION_NTFCCION_L        := null;',
'            :P31_EMAIL_L                   := null;',
'            :P31_TLFNO_L                   := null;',
'            :P31_CLLAR_L                   := null;',
'            :P31_ACTVO_L                   := null;',
'            :P31_ID_TRCRO_L                := null;',
'            :P31_ID_SJTO_RSPNSBLE_L        := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P31_ID_SJTO_IMPSTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5302785754065342)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Recuperar datos del Contador'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' :P31_LBEL_BTN_CNTDOR := ''Actualizar Datos del Contador'';',
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
'        :P31_ID_SJTO_IMPSTO_C,',
'        :P31_CDGO_IDNTFCCION_TPO_C,',
'        :P31_IDNTFCCION_C,',
'        :P31_PRMER_NMBRE_C,',
'        :P31_SGNDO_NMBRE_C,',
'        :P31_PRMER_APLLDO_C,',
'        :P31_SGNDO_APLLDO_C,',
'        :P31_PRNCPAL_S_N_C,',
'        :P31_CDGO_TPO_RSPNSBLE_C,',
'        --:P31_PRCNTJE_PRTCPCION_C,',
'        --:P31_ORGEN_DCMNTO_C,',
'        :P31_ID_PAIS_NTFCCION_C,',
'        :P31_ID_DPRTMNTO_NTFCCION_C,',
'        :P31_ID_MNCPIO_NTFCCION_C,',
'        :P31_DRCCION_NTFCCION_C,',
'        :P31_EMAIL_C,',
'        :P31_TLFNO_C,',
'       -- :P31_CLLAR_C,',
'        :P31_ACTVO_C,',
'        :P31_ID_TRCRO_C,',
'        :P31_ID_SJTO_RSPNSBLE_C',
'  from si_i_sujetos_responsable',
' where id_sjto_impsto  = :P31_ID_SJTO_IMPSTO',
'   and (cdgo_tpo_rspnsble = ''CO'' or cdgo_tpo_rspnsble = ''RF'')',
'   and actvo             = ''S'' ',
'    and rownum = 1    ',
'order by cdgo_tpo_rspnsble desc;',
'     ',
'exception',
'    when no_data_found then',
'        :P31_LBEL_BTN_CNTDOR := ''Guardar Datos del Contador'';',
'        :P31_ID_SJTO_IMPSTO_C		:= '''';',
'        :P31_CDGO_IDNTFCCION_TPO_C   := '''';',
'        :P31_IDNTFCCION_C	        := '''';',
'        :P31_PRMER_NMBRE_C	        := '''';',
'        :P31_SGNDO_NMBRE_C	        := '''';',
'        :P31_PRMER_APLLDO_C		    := '''';',
'        :P31_SGNDO_APLLDO_C		    := '''';',
'        :P31_PRNCPAL_S_N_C		    := '''';',
'        :P31_CDGO_TPO_RSPNSBLE_C		:= '''';	',
'        --:P31_PRCNTJE_PRTCPCION_C	:= '''';',
'        --:P31_ORGEN_DCMNTO_C		:= '''';	',
'        :P31_ID_PAIS_NTFCCION_C	    := '''';',
'        :P31_ID_DPRTMNTO_NTFCCION_C	:= '''';	',
'        :P31_ID_MNCPIO_NTFCCION_C	:= '''';		',
'        :P31_DRCCION_NTFCCION_C		:= '''';	',
'        :P31_EMAIL_C			        := '''';',
'        :P31_TLFNO_C			        := '''';',
'        :P31_CLLAR_C					:= '''';	',
'        :P31_ACTVO_C			        := '''';',
'        :P31_ID_TRCRO_C			    := '''';',
'        :P31_ID_SJTO_RSPNSBLE_C	    := '''';',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P31_ID_SJTO_IMPSTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
