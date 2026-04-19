prompt --application/pages/page_00194
begin
wwv_flow_api.create_page(
 p_id=>194
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Registro Plusvalia'
,p_step_title=>'Registro Plusvalia'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20260121135633'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104732351417181241)
,p_plug_name=>unistr('<b>Informaci\00F3n Plusvalia</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(110070359028340570)
,p_plug_name=>'Consultar Sujeto'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'EXISTS'
,p_plug_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   1',
'from gi_g_plusvalia_procso_dtlle',
'where id_plsvlia_dtlle = :P194_ID_PLSVLIA_DTLLE;        ',
' '))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(110070195759340568)
,p_plug_name=>'Datos Sujeto'
,p_parent_plug_id=>wwv_flow_api.id(110070359028340570)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P194_ID_SJTO_IMPSTO'
,p_attribute_01=>'P194_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(202873036423443447)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
unistr('Funcionalidad que permite  consultar los datos de un sujeto tributo especifico y Generar Oficios de Autorizaci\00F3n de Registro Plusval\00EDa y No Afectaci\00F3n Plusval\00EDa<br><br>'),
'',
unistr('<i><p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p></i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(105695500649934182)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(110070359028340570)
,p_button_name=>'Btn_cnsultar_x_idntfccion'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   1',
'from gi_g_plusvalia_procso_dtlle',
'where id_plsvlia_dtlle = :P194_ID_PLSVLIA_DTLLE;'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(105695970769934186)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(110070359028340570)
,p_button_name=>'Btn_cnsultar_x_prmtros'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Consultar por Parametros'
,p_button_position=>'BODY'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   1',
'from gi_g_plusvalia_procso_dtlle',
'where id_plsvlia_dtlle = :P194_ID_PLSVLIA_DTLLE;'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4892534984876217)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(104732351417181241)
,p_button_name=>'BTN_APLCAR_CMBIOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'(:P194_ID_PLSVLIA_DTLLE is not null and :P155_ID_LQDCION is null)'
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(105718442780279203)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(104732351417181241)
,p_button_name=>'BTN_REGISTRAR_PLUSVALIA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P194_ID_PLSVLIA_DTLLE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4892113524876213)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(104732351417181241)
,p_button_name=>'BTN_ACTLZAR_PLSVLIA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Actualizar Plusvalia'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:155:&SESSION.::&DEBUG.:RP:P155_ID_PLSVLIA_DTLLE,P155_BRANCH:&P194_ID_PLSVLIA_DTLLE.,&APP_PAGE_ID.'
,p_button_condition=>'(:P194_ID_PLSVLIA_DTLLE is not null)'
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-check-square-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(105703928233934215)
,p_branch_name=>'Ir a busqueda de Sujeto Impuesto'
,p_branch_action=>'f?p=71000:3:&SESSION.::&DEBUG.:RP:P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO,P3_IMPSTO_SBMPSTO,P3_NMBRE_ITEM_IMPSTO,P3_NMBRE_ITEM_SBIMPSTO:&APP_ID.,&APP_PAGE_ID.,P194_ID_SJTO_IMPSTO,&P194_ID_IMPSTO_PRE.,&P194_ID_IMPSTO_SBMPSTO_PRE.,P194_ID_IMPSTO_PRE,P194_ID_IMPSTO_SBMPSTO_PRE&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(105695970769934186)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4892453018876216)
,p_branch_name=>'Ir a la Pagina Anterior'
,p_branch_action=>'P194_BRANCH'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_when_button_id=>wwv_flow_api.id(4892113524876213)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4440680929236610)
,p_name=>'P194_ID_PRCSO_PLSVLIA'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(104732351417181241)
,p_prompt=>'<b> Proceso </b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct vgncia ||'' - ''|| id_prcso_plsvlia prcso ',
'        , id_prcso_plsvlia',
'from gi_g_plusvalia_proceso ; '))
,p_cHeight=>1
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4441417080236618)
,p_name=>'P194_RGSTRO_ERROR'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(104732351417181241)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4441858470236622)
,p_name=>'P194_RSPSTA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(104732351417181241)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4443028409236634)
,p_name=>'P194_ID_IMPSTO_PRE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(104732351417181241)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4443345996236637)
,p_name=>'P194_ID_IMPSTO_SBMPSTO_PRE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(104732351417181241)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4892333503876215)
,p_name=>'P194_BRANCH'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(104732351417181241)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4893833852876230)
,p_name=>'P194_ID_IMPSTO_ACTO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(104732351417181241)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104732446654181242)
,p_name=>'P194_AREA_OBJTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(104732351417181241)
,p_prompt=>unistr('<b>\00C1rea Objeto<br> de la Plusval\00EDa</b>')
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>7
,p_tag_attributes=>'onkeypress="return validarExpresion(event,''numeroComa'');"'
,p_begin_on_new_line=>'N'
,p_grid_column=>3
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'0'
,p_attribute_02=>'10000000000000000'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104732620704181244)
,p_name=>'P194_VLOR_P1'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(104732351417181241)
,p_prompt=>'<b>Valor Antes</b>'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>7
,p_tag_attributes=>'onkeypress="return validarExpresion(event,''numeroComa'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'0'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104732743137181245)
,p_name=>'P194_VLOR_P2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(104732351417181241)
,p_prompt=>'<b>Valor Despues</b>'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>7
,p_tag_attributes=>'onkeypress="return validarExpresion(event,''numeroComa'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'&P194_VLOR_P1.'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104732853317181246)
,p_name=>'P194_HCHO_GNRDOR'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(104732351417181241)
,p_prompt=>'<b>Hecho Generador </b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  nmbre_impsto_acto',
'        , id_impsto_acto ',
'from v_df_i_impuestos_acto',
'where cdgo_clnte = :F_CDGO_CLNTE',
'    and cdgo_impsto = ''PLU''',
'order by 1;'))
,p_cHeight=>1
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104732977250181247)
,p_name=>'P194_UDP'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(104732351417181241)
,p_prompt=>'<b>UDP</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>3
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104733071026181248)
,p_name=>'P194_ID_USO_LIQUIDADO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(104732351417181241)
,p_prompt=>'<b>Uso Liquidado</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
',   id_uso_lqddo',
'from gi_d_plusvalia_uso_lqddo',
'where cdgo_clnte = :F_CDGO_CLNTE',
'    and actvo = ''S'';'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104733280967181250)
,p_name=>'P194_MTRCLA_INMBLRIA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(104732351417181241)
,p_prompt=>'Matricula Inmobiliaria'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_grid_column=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105696363852934188)
,p_name=>'P194_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(110070359028340570)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto d, id_impsto r',
'from df_c_impuestos where cdgo_impsto = ''PLU'';'))
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'85%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105696707162934193)
,p_name=>'P194_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(110070359028340570)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto as d ',
'     , id_impsto_sbmpsto    as r',
'  from df_i_impuestos_subimpuesto',
' where id_impsto = ( select id_impsto from df_c_impuestos where cdgo_impsto = ''PLU'' );'))
,p_lov_cascade_parent_items=>'P194_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'85%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105697156552934193)
,p_name=>'P194_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(110070359028340570)
,p_prompt=>'Identificacion '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105697583235934193)
,p_name=>'P194_ID_SJTO_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(110070359028340570)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105697949406934193)
,p_name=>'P194_MSNJE_RSPSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(110070359028340570)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105718271556279201)
,p_name=>'P194_DRCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(104732351417181241)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105718382294279202)
,p_name=>'P194_PRPTRIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(104732351417181241)
,p_prompt=>'Responsable'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>8
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105718607670279205)
,p_name=>'P194_ID_PLSVLIA_DTLLE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(104732351417181241)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117411654850607301)
,p_name=>'P194_NMRO_RDCDO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(104732351417181241)
,p_prompt=>unistr('<b>Radicado Curadur\00EDa</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(105700946207934204)
,p_validation_name=>'Identificacion no nula'
,p_validation_sequence=>20
,p_validation=>'P194_IDNTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# debe tener un valor.'
,p_when_button_pressed=>wwv_flow_api.id(4375868959406407)
,p_associated_item=>wwv_flow_api.id(105697156552934193)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4440958843236613)
,p_validation_name=>'Valor P2 mayor a valor P1'
,p_validation_sequence=>30
,p_validation=>' to_number(:P194_VLOR_P2) > to_number(:P194_VLOR_P1)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('Valor Despu\00E9s no puede ser menor que valor Antes')
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(105718442780279203)
,p_associated_item=>wwv_flow_api.id(104732743137181245)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4441228505236616)
,p_validation_name=>'Area Objeto Mayor a cero'
,p_validation_sequence=>40
,p_validation=>':P194_AREA_OBJTO > 0'
,p_validation_type=>'SQL_EXPRESSION'
,p_error_message=>unistr('El Area Objeto debe tener alg\00FAn valor o ser mayor que cero')
,p_when_button_pressed=>wwv_flow_api.id(105718442780279203)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4440715582236611)
,p_validation_name=>'Valor P1 No Nulo'
,p_validation_sequence=>50
,p_validation=>':P194_VLOR_P1 > 0'
,p_validation_type=>'SQL_EXPRESSION'
,p_error_message=>unistr('El valor Antes debe tener alg\00FAn valor o ser mayor que cero')
,p_when_button_pressed=>wwv_flow_api.id(105718442780279203)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4440876117236612)
,p_validation_name=>'Valor P2 No nulo'
,p_validation_sequence=>60
,p_validation=>':P194_VLOR_P2 >0'
,p_validation_type=>'SQL_EXPRESSION'
,p_error_message=>unistr('El valor Despu\00E9s debe tener alg\00FAn valor o ser mayor que cero')
,p_when_button_pressed=>wwv_flow_api.id(105718442780279203)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4441335577236617)
,p_validation_name=>'UDP No Nulo'
,p_validation_sequence=>70
,p_validation=>'(:P194_UDP is not null )'
,p_validation_type=>'SQL_EXPRESSION'
,p_error_message=>'UDP no puede ser nulo'
,p_when_button_pressed=>wwv_flow_api.id(105718442780279203)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(105702483276934207)
,p_name=>'Al seleccionar reporte'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P194_ID_PLNTLLA'
,p_condition_element=>'P194_ID_PLNTLLA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(105701294475934206)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto x Identificacion '
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    v_estdo_blqdo_sjto      si_i_sujetos_impuesto.estdo_blqdo%type;',
'    v_id_sjto_estdo       si_i_sujetos_impuesto.id_sjto_estdo%type;',
'    ',
'begin',
'    select id_sjto_impsto,     estdo_blqdo_sjto,   id_sjto_estdo',
'      into v_id_sjto_impsto,   v_estdo_blqdo_sjto, v_id_sjto_estdo',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte       = :F_CDGO_CLNTE',
'       and (id_impsto       = :P194_ID_IMPSTO_PRE ',
'        or :P194_ID_IMPSTO_PRE is null)',
'       and (idntfccion_sjto   = :P194_IDNTFCCION ',
'        or idntfccion_antrior = :P194_IDNTFCCION ',
'        or mtrcla_inmblria    = :P194_IDNTFCCION);      ',
'    ',
'    if v_estdo_blqdo_sjto = ''N'' and v_id_sjto_estdo = 1 then ',
'        :P194_RSPSTA := '''';',
'        :P194_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'        ',
'    elsif v_estdo_blqdo_sjto = ''S'' then',
'        :P194_RSPSTA := ''El sujeto impuesto ingresado se encuentra bloqueado'';',
'        :P194_ID_SJTO_IMPSTO := null;',
'        v_id_sjto_impsto    := null;',
'    elsif v_id_sjto_estdo != 1 then',
'        :P194_RSPSTA := ''El sujeto impuesto ingresado No se encuentra activo'';',
'        :P194_ID_SJTO_IMPSTO := null;',
'        v_id_sjto_impsto    := null;',
'    end if;',
'exception',
'    when no_data_found then ',
'        :P194_ID_SJTO_IMPSTO := null;',
'        v_id_sjto_impsto    := null;',
'        :P194_RSPSTA := ''No Existe el Sujeto Impuesto'';',
'    when others then ',
'        :P194_RSPSTA := ''Error: '' || sqlerrm;',
'end  ;',
''))
,p_process_error_message=>'&P194_MSNJE_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4375868959406407)
,p_process_when_type=>'NEVER'
,p_process_success_message=>'&P194_MSNJE_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4442614686236630)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consutar sujeto por Item de Parametro'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);    ',
'begin',
'',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte    = :F_CDGO_CLNTE',
'       and (id_impsto    = :P194_ID_IMPSTO_PRE or :P194_ID_IMPSTO_PRE is null)',
'       and (idntfccion_sjto    = :P194_IDNTFCCION or idntfccion_antrior = :P194_IDNTFCCION or mtrcla_inmblria = :P194_IDNTFCCION)',
'       and cdgo_sjto_estdo = ''A'';      ',
'    ',
'    :P194_RSPSTA := '''';',
'    :P194_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'exception',
'    when no_data_found then ',
'    :P194_ID_SJTO_IMPSTO := null;',
unistr('    :P194_RSPSTA := ''No Existe el Sujeto Impuesto o no est\00E1 Activo'';'),
'end;'))
,p_process_error_message=>'&P194_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'&P194_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4442772696236631)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Cache de Id sujeto Impuesto'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P194_ID_SJTO_IMPSTO'
,p_process_error_message=>'&P194_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P194_ID_SJTO_IMPSTO IS NULL or :P194_ID_SJTO_IMPSTO = 0'
,p_process_when_type=>'SQL_EXPRESSION'
,p_process_success_message=>'&P194_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4443955158236643)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Items'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P194_VLOR_P1,P194_VLOR_P2,P194_HCHO_GNRDOR,P194_UDP,P194_ID_USO_LIQUIDADO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P194_ID_SJTO_IMPSTO IS NULL or :P194_ID_SJTO_IMPSTO = 0'
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4441727755236621)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Plusvalia'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_vgncia               number;',
'	v_exste_plsvlia        number; ',
'    v_rspta_plsvalia       varchar2(1);',
'	v_cdgo_rspsta		   number; ',
'    v_mnsje_rspsta		   varchar2(2000) := ''Inicio'';',
'begin',
'     ',
'    -- Se consutla si hay registro previo',
'	pkg_gi_plusvalia.prc_vl_rgstro_plsvlia(	p_cdgo_clnte         => :F_CDGO_CLNTE,',
'											p_idntfccion_sjto    => :P194_IDNTFCCION,',
'											p_id_prcso_plsvlia   => :P194_ID_PRCSO_PLSVLIA,',
'											o_rspta_plsvalia     => v_rspta_plsvalia,',
'											o_cdgo_rspsta        => v_cdgo_rspsta,',
'											o_mnsje_rspsta       => v_mnsje_rspsta',
'										  ); ',
'    ',
'    if v_rspta_plsvalia = ''S'' then',
'	    -- Se registra la plusvalia puntual',
'        pkg_gi_plusvalia.prc_rg_plusvalia_puntual (   p_id_usrio           =>  :F_ID_USRIO',
'                                                    , p_cdgo_clnte         =>  :F_CDGO_CLNTE        ',
'                                                    , p_id_impsto          =>  :P194_ID_IMPSTO        ',
'                                                    , p_id_impsto_sbmpsto  =>  :P194_ID_IMPSTO_SBMPSTO ',
'                                                    , p_id_sjto_impsto	   =>  :P194_ID_SJTO_IMPSTO	',
'                                                    , p_id_prcso_plsvlia   =>  :P194_ID_PRCSO_PLSVLIA  ',
'                                                    , p_idntfccion		   =>  :P194_IDNTFCCION		',
'                                                    , p_mtrcla_inmblria    =>  :P194_MTRCLA_INMBLRIA   ',
'                                                    , p_prptrio			   =>  :P194_PRPTRIO			',
'                                                    , p_drccion            =>  :P194_DRCCION           ',
'                                                    , p_area_objto		   =>  :P194_AREA_OBJTO		',
'                                                    , p_vlor_p1 		   =>  :P194_VLOR_P1 			',
'                                                    , p_vlor_p2 		   =>  :P194_VLOR_P2 			',
'                                                    , p_hcho_gnrdor		   =>  :P194_HCHO_GNRDOR		',
'                                                    , p_udp				   =>  :P194_UDP				',
'                                                    , p_id_uso_liquidado   =>  :P194_ID_USO_LIQUIDADO',
'                                                    , p_nmro_rdcdo         =>  :P194_NMRO_RDCDO',
'                                                    , o_id_plsvlia_dtlle   =>  :P194_ID_PLSVLIA_DTLLE',
'                                                    , o_cdgo_rspsta		   =>   v_cdgo_rspsta',
'                                                    , o_mnsje_rspsta	   =>   v_mnsje_rspsta);',
'',
'        if(v_cdgo_rspsta <> 0) then',
unistr('            :P194_RSPSTA := ''\00A1Error al Registrar la plusvalia!'';'),
'            raise_application_error(-20001, ''1. Error: '' || v_mnsje_rspsta);',
'        else',
'            :P194_RSPSTA := ''Plusvalia registrada exitosamente'';',
'        end if;',
'    else',
'            :P194_RSPSTA := v_mnsje_rspsta;',
'    end if;',
'            ',
'exception',
'    when others then ',
'        rollback;',
'        raise_application_error(-20001, ''2. '' ||v_mnsje_rspsta);',
'end;',
'    '))
,p_process_error_message=>'&P194_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(105718442780279203)
,p_process_when=>'BTN_REGISTRAR_PLUSVALIA'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'&P194_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4892625613876218)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aplicar Cambios Plusvalia'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	v_cdgo_rspsta		         number;',
'	v_mnsje_rspsta		         varchar2(2000)	:= ''Inicio'';',
'    ',
'begin',
'        -- Se actualiza  la plusvalia puntual',
'        pkg_gi_plusvalia.prc_ac_plusvalia_puntual (   p_cdgo_clnte         =>  :F_CDGO_CLNTE        ',
'                                                    , p_id_impsto          =>  :P194_ID_IMPSTO        ',
'                                                    , p_id_impsto_sbmpsto  =>  :P194_ID_IMPSTO_SBMPSTO ',
'                                                    , p_id_prcso_plsvlia   =>  :P194_ID_PRCSO_PLSVLIA',
'                                                    , p_id_plsvlia_dtlle   =>  :P194_ID_PLSVLIA_DTLLE',
' 	                                                , p_area_objto		   =>  :P194_AREA_OBJTO		',
'                                                    , p_vlor_p1 		   =>  :P194_VLOR_P1 			',
'                                                    , p_vlor_p2 		   =>  :P194_VLOR_P2 			',
'                                                    , p_hcho_gnrdor		   =>  :P194_HCHO_GNRDOR		',
'                                                    , p_udp				   =>  :P194_UDP				',
'                                                    , p_id_uso_liquidado   =>  :P194_ID_USO_LIQUIDADO  ',
'                                                    , o_cdgo_rspsta		   =>   v_cdgo_rspsta',
'                                                    , o_mnsje_rspsta	   =>   v_mnsje_rspsta);',
'',
'            if(v_cdgo_rspsta <> 0) then',
unistr('              :P194_RSPSTA := ''\00A1Error al actualizar la plusvalia!'';'),
'              raise_application_error(-20001, ''1. Error: '' || v_mnsje_rspsta);',
'            else',
'                :P194_RSPSTA := ''Plusvalia Actualizada exitosamente'';',
'            end if;',
'            ',
'exception',
'    when others then ',
'        rollback;',
'        raise_application_error(-20001, ''2. '' ||v_mnsje_rspsta);',
'end;',
'    '))
,p_process_error_message=>'&P194_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4892534984876217)
,p_process_success_message=>'&P194_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(105701665952934206)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Identificacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select idntfccion_sjto ',
'  into :P194_IDNTFCCION',
'  from v_si_i_sujetos_impuesto',
' where id_sjto_impsto = :P194_ID_SJTO_IMPSTO;',
'exception',
'    when no_data_found then',
'        null;',
'end; ',
' '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(104733155591181249)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Informacion basica'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'        select a.mtrcla_inmblria',
'             , a.drccion',
'             , b.prmer_nmbre ',
'        INTO :P194_MTRCLA_INMBLRIA',
'            , :P194_DRCCION',
'            , :P194_PRPTRIO',
'        from v_si_i_sujetos_impuesto a',
'        join si_i_sujetos_responsable b on a.id_sjto_impsto = b.id_sjto_impsto ',
'        where a.id_sjto_impsto = :P194_ID_SJTO_IMPSTO',
'             and PRNCPAL_S_N = ''S'';',
'        ',
'exception',
'    when no_data_found then',
'        null;',
'end; ',
' '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4443204818236636)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta impuesto predial'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto, id_impsto_sbmpsto',
'into :P194_ID_IMPSTO_PRE, :P194_ID_IMPSTO_SBMPSTO_PRE',
'from v_df_i_impuestos_subimpuesto',
'where cdgo_impsto =''IPU'';'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4893739386876229)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar por ID Plusvalia'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select    id_plsvlia_dtlle',
'        , id_prcso_plsvlia',
'        , area_objto',
'		, vlor_p1',
'        , vlor_p2',
'        , id_impsto_acto',
'        , id_uso_lqddo',
'        , udp',
'        , cdgo_prdial',
'	INTO ',
'	 :P194_ID_PLSVLIA_DTLLE',
'	, :P194_ID_PRCSO_PLSVLIA',
'	, :P194_AREA_OBJTO',
'	, :P194_VLOR_P1',
'	, :P194_VLOR_P2',
'	, :P194_HCHO_GNRDOR',
'	, :P194_ID_USO_LIQUIDADO',
'	, :P194_UDP	',
'    , :P194_IDNTFCCION',
'from gi_g_plusvalia_procso_dtlle',
'where id_plsvlia_dtlle = :P194_ID_PLSVLIA_DTLLE;        ',
' '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P194_ID_PLSVLIA_DTLLE'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
