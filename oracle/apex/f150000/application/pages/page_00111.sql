prompt --application/pages/page_00111
begin
wwv_flow_api.create_page(
 p_id=>111
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Contribuyente  - Proyecci\00F3n de Acuerdo')
,p_step_title=>unistr('Contribuyente  - Proyecci\00F3n de Acuerdo')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(74203737602129439)
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id) {',
'  if ($("#" + id).attr("aria-expanded") == "true") {',
'    $("#" + id).click();',
'  }',
'}',
'',
'',
'var coll = document.getElementsByClassName("collapsible");',
'var i;',
'',
'for (i = 0; i < coll.length; i++) {',
'  coll[i].addEventListener("click", function() {',
'    this.classList.toggle("active");',
'    var content = this.nextElementSibling;',
'    if (content.style.maxHeight){',
'      content.style.maxHeight = null;',
'    } else {',
'      content.style.maxHeight = content.scrollHeight + "px";',
'    } ',
'  });',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'buttonCollapse(''t_Button_rightControlButton'');',
''))
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.collapsible {',
'    background-color: #2e76f3;',
'    color: #fcfcfc;',
'    cursor: pointer;',
'    padding: 8px;',
'    width: 100%;',
'    border: none;',
'    text-align: left;',
'    outline: none;',
'    font-size: 12px;',
'}',
'',
'.active, .collapsible:hover {',
'  background-color: #5a93f8;    ',
'}',
'',
'.collapsible:after {',
'  content: ''\002B'';',
'  color: white;',
'  font-weight: bold;',
'  float: right;',
'  margin-left: 5px;',
'}',
'',
'.active:after {',
'  content: "\2212";',
'}',
'',
'.content {',
'  padding: 0 8px;',
'  max-height: 0;',
'  overflow: hidden;',
'  transition: max-height 0.2s ease-out;',
'  background-color: #f1f1f1;',
'}',
'',
''))
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200730082905'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(117510738169576555)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>    ',
unistr('    <p align="justify">Funcionalidad de Proyecci\00F3n de Acuerdos de Pago.<br> '),
'    <b> <center> Paso 1 Sujeto Tributo </center> </b>',
'    En este paso se consulta un sujeto tributo y se selecciona un tipo de acuerdo de pago.<br><br>',
'</p>',
'    ',
'    <div class="collapsible">Consulta Sujetos Tributos</div>',
'    <div class="content"><br>',
'        Para Consultar un Sujeto tributo tiene dos opciones: <br><br>',
unistr('            <b>a. Consulta por Identificaci\00F3n: </b> <br> Se debe ingresar la identificaci\00F3n en el \00EDtem de <i style="color:#0572CE";>"Identificaci\00F3n"</i> y hacer clic en el bot\00F3n <i style="color:#0572CE";>"Consultar"</i> o presionar la tecla <i style=')
||'"color:#0572CE";>"Enter"</i>. <br><br>',
unistr('            <b>b. Consulta por Par\00E1metros:</b><br> Hacer clic en el bot\00F3n <i style="color:#0572CE";>"Consulta Par\00E1metros"</i>.<br> '),
unistr('            Se muestra una ventana emergente donde pueden consultar un sujeto tributo por diferentes par\00E1metros. <br><br>'),
unistr('            Al consultar un sujeto tributo se muestra toda la informaci\00F3n b\00E1sica y la informaci\00F3n del los responsables. <br><br>'),
'    </div>',
'    <br> ',
'    <div class="collapsible">Tipos de acuerdo de pago</div>',
'    <div class="content"><br>',
unistr('        Los tipos de acuerdo de pago que se listan, son cuyas condiciones enlazan con las caracter\00EDsticas del sujeto tributo seleccionado.'),
'    </div><br><br>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>     '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(145456238248379256)
,p_plug_name=>'Sujeto Tributo Wizard'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall:t-Form--large'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(252183924525651399)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(72870253246195914)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(252197199379651439)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(414418544499300846)
,p_plug_name=>'Contribuyente'
,p_parent_plug_id=>wwv_flow_api.id(145456238248379256)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73191920749844403)
,p_plug_name=>'Tipo de Acuerdo de Pago'
,p_parent_plug_id=>wwv_flow_api.id(414418544499300846)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--xlarge'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P111_ID_SJTO_IMPSTO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(142438260089105973)
,p_plug_name=>unistr('Informaci\00F3n B\00E1sica')
,p_region_name=>'informacion_basica'
,p_parent_plug_id=>wwv_flow_api.id(414418544499300846)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P111_ID_SJTO_IMPSTO'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(218911561783030340)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
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
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72861215937195820)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(218911561783030340)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:RP,111,112,113,114,115::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(158216624079733932)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73137056902641479)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_api.id(414418544499300846)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P111_ID_PRYCCION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72838811853195756)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(145456238248379256)
,p_button_name=>'CANCELAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Salir de la Funcionalidad?, Tenga en Cuenta Pueden Perderse los Datos.'',''CANCELAR'')'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72839210268195760)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(145456238248379256)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(72867330374195881)
,p_branch_name=>unistr('Ir a P\00E1gina 112 Cartera')
,p_branch_action=>'f?p=&APP_ID.:112:&SESSION.::&DEBUG.:112::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72839210268195760)
,p_branch_sequence=>20
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P111_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(70821703567843738)
,p_branch_name=>unistr('Ir a P\00E1gina 110 - Inicio')
,p_branch_action=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:RP,111,112,113,114,115::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72838811853195756)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72840745693195764)
,p_name=>'P111_NMRO_PRYCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(73191920749844403)
,p_prompt=>unistr('N\00B0 Proyecci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>4
,p_display_when=>'P111_ID_PRYCCION'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72841126831195764)
,p_name=>'P111_ID_SJTO_IMPSTO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(414418544499300846)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72844639478195766)
,p_name=>'P111_ID_CNVNIO_TPO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(73191920749844403)
,p_prompt=>'Tipo de Acuerdo de Pago'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_select clob;',
'    ',
'begin',
'    v_select := pkg_gf_convenios.fnc_cl_select_tipo_convenio (:F_CDGO_CLNTE, :P111_CDGO_SJTO_TPO, :P111_ID_SJTO_IMPSTO );',
'',
'    return v_select;',
'end;',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione un Tipo de Acuerdo de Pago --'
,p_lov_cascade_parent_items=>'P111_ID_SJTO_IMPSTO'
,p_ajax_items_to_submit=>'P111_ID_CNVNIO_TPO,P111_DSCRPCION_CNVNIO_TPO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_display_when=>'P111_ID_SJTO_IMPSTO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Tipos de acuerdo de pago disponibles para el sujeto de tributo ingresado.',
'Los tipos de acuerdos de pago que se visualizan son aquellos con los que el sujeto tributo cumple las condiciones.'))
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72845490677195786)
,p_name=>'P111_ID_PRYCCION'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(414418544499300846)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73137448614641488)
,p_name=>'P111_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(414418544499300846)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_help_text=>'Seleccione el tributo asociado al acuerdo de pago.'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73138332669641504)
,p_name=>'P111_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(414418544499300846)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_help_text=>'Seleccione el sub tributo asociado al acuerdo de pago.'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73139140078641505)
,p_name=>'P111_CDGO_SJTO_TPO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(414418544499300846)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73139593632641505)
,p_name=>'P111_TPO_BSQDA_PRDIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(414418544499300846)
,p_prompt=>'Tipo de busqueda'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Direcci\00F3n;DIR,Referencia;IDN,Referencia Anterior;IDA,Matricula;MTR')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_column=>2
,p_display_when=>':P111_CDGO_SJTO_TPO_IMPSTO = ''P'' and :P111_ID_PRYCCION is null'
,p_display_when_type=>'SQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73139907779641506)
,p_name=>'P111_TPO_BSQDA_PRSNA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(414418544499300846)
,p_prompt=>'Tipo de busqueda'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Identificaci\00F3n / NIT;IDN')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_display_when=>':P111_CDGO_SJTO_TPO_IMPSTO = ''E'' and :P111_ID_PRYCCION is null'
,p_display_when_type=>'SQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73140329545641507)
,p_name=>'P111_TPO_BSQDA_VHCLO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(414418544499300846)
,p_prompt=>'Tipo de busqueda'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Placa;IDN'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_display_when=>':P111_CDGO_SJTO_TPO_IMPSTO = ''V'' and :P111_ID_PRYCCION is null'
,p_display_when_type=>'SQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73142361187641508)
,p_name=>'P111_PRMTRO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(414418544499300846)
,p_prompt=>'Contribuyente'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_display_when=>'P111_ID_PRYCCION'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del sujeto al que se le realiz\00F3 el acuerdo de pago.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73143218865641508)
,p_name=>'P111_RSPSTA'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(414418544499300846)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73143690521641527)
,p_name=>'P111_CDGO_RSPSTA'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(414418544499300846)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73144751999641533)
,p_name=>'P111_IDNTFCCION_SJTO_FRMTDA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(142438260089105973)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73145141241641534)
,p_name=>'P111_IDNTFCCION_ANTRIOR_FRMTDA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(142438260089105973)
,p_prompt=>unistr('Identificaci\00F3n Anterior')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P111_CDGO_SJTO_TPO_IMPSTO'
,p_display_when2=>'P'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73145514356641534)
,p_name=>'P111_MTRCLA_INMBLRIA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(142438260089105973)
,p_prompt=>'Matricula Inmobiliaria'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when=>'P111_CDGO_SJTO_TPO_IMPSTO'
,p_display_when2=>'P'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73145925978641535)
,p_name=>'P111_UBCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(142438260089105973)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73146390610641543)
,p_name=>'P111_DRCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(142438260089105973)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73146724983641544)
,p_name=>'P111_CDGO_SJTO_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(142438260089105973)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73192056943844404)
,p_name=>'P111_DSCRPCION_CNVNIO_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(73191920749844403)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''Este tipo de Acuerdo de pago tiene como fecha limite de elaboraci\00F3n '' ||  to_char(fcha_lmte_elbrcion, ''DD/MM/YYYY'')   ||'),
'        decode (indcdor_exge_cta_incial, ''S'',',
'            '', exige como valor de cuota inicial el '' || cta_incial_prcntje_vgncia || ''% '' || ''de la deuda a convenir'',',
'        '''') ||',
'        '', la tasa efectiva anual es: '' || tsa_prfrncial_ea ||',
unistr('        '', . M\00E1ximo puede ser elaborado con '' || nmro_mxmo_ctas || '' cuotas'' ||'),
unistr('        '', la fecha de pago de la \00FAltima cuota m\00E1ximo puede ser hasta '' || to_char(fcha_mxma_ctas, ''DD/MM/YYYY'') ||'),
'        decode ( indcdor_rqre_grntia, ''S'', '', este tipo de acuerdo de pago requiere garantia'', '''') dscrpcion        ',
'  from gf_d_convenios_tipo   ',
'    where id_cnvnio_tpo = :P111_ID_CNVNIO_TPO'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>unistr('Descripci\00F3n de Tipo de Acuerdo de Pago')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''Este tipo de Acuerdo de pago tiene como fecha limite de elaboraci\00F3n '' ||  to_char(fcha_lmte_elbrcion, ''DD/MM/YYYY'')   ||'),
'        decode (indcdor_exge_cta_incial, ''S'',',
'            '', exige como valor de cuota inicial el '' || cta_incial_prcntje_vgncia || ''% '' || ''de la deuda a convenir'',',
'        '''') ||',
'        '', la tasa efectiva anual es: '' || tsa_prfrncial_ea ||',
unistr('        '', . M\00E1ximo puede ser elaborado con '' || nmro_mxmo_ctas || '' cuotas'' ||'),
unistr('        '', la fecha de pago de la \00FAltima cuota m\00E1ximo puede ser hasta '' || to_char(fcha_mxma_ctas, ''DD/MM/YYYY'') ||'),
'        decode ( indcdor_rqre_grntia, ''S'', '', este tipo de acuerdo de pago requiere garantia'', '''') dscrpcion        ',
'  from gf_d_convenios_tipo   ',
'    where id_cnvnio_tpo = :P111_ID_CNVNIO_TPO'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(70822092391843741)
,p_computation_sequence=>10
,p_computation_item=>'P111_CDGO_SJTO_TPO_IMPSTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_sjto_tpo',
'  from df_c_impuestos    a',
' where a.cdgo_clnte      = :F_CDGO_CLNTE',
'   and a.id_impsto       = :P111_ID_IMPSTO'))
,p_compute_when=>'P111_ID_IMPSTO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72861798915195847)
,p_validation_name=>'Id Sujeto Impuesto no es nulo'
,p_validation_sequence=>30
,p_validation=>'P111_ID_SJTO_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe consultar un sujeto tributo, antes de continuar.'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(72666540293254402)
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72862182617195856)
,p_validation_name=>'Tipo de Convenio no sea Nulo'
,p_validation_sequence=>40
,p_validation=>':P111_ID_CNVNIO_TPO is null or :P111_ID_CNVNIO_TPO > 0'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Debe seleccionar un Tipo de Convenio para continuar'
,p_when_button_pressed=>wwv_flow_api.id(72666540293254402)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72863330280195857)
,p_validation_name=>unistr('Identificaci\00F3n par\00E1metro no nulo')
,p_validation_sequence=>50
,p_validation=>'P111_PRMTRO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Para consultar ingrese una identificaci\00F3n')
,p_when_button_pressed=>wwv_flow_api.id(42344258255115411)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(72866853479195880)
,p_name=>unistr('mostrar regi\00F3n Predio')
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P111_TIPO_SJTO_IMPSTO'
,p_condition_element=>'P111_TIPO_SJTO_IMPSTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'P'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70822273003843743)
,p_name=>unistr('Al hacer clic en el bot\00F3n consultar')
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(73137056902641479)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70822371564843744)
,p_event_id=>wwv_flow_api.id(70822273003843743)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    v_tpo_bsqda             varchar2(3);',
'    v_id_sjto_estdo         number;',
'    ',
'begin',
'    ',
'    if :P111_CDGO_SJTO_TPO_IMPSTO = ''P'' then',
'        v_tpo_bsqda    := :P111_TPO_BSQDA_PRDIO;',
'    elsif :P111_CDGO_SJTO_TPO_IMPSTO = ''E'' then',
'        v_tpo_bsqda    := :P111_TPO_BSQDA_PRSNA;',
'    elsif :P111_CDGO_SJTO_TPO_IMPSTO = ''V'' then',
'        v_tpo_bsqda    := :P111_TPO_BSQDA_VHCLO;',
'    end if;',
'    ',
'    if v_tpo_bsqda  in (''IDN'', ''IDA'', ''DIR'', ''MTR'')  then',
'        begin ',
'            select a.id_sjto_impsto, id_sjto_estdo',
'              into v_id_sjto_impsto, v_id_sjto_estdo',
'              from v_si_i_sujetos_impuesto    a',
'              left join si_i_predios          b on a.id_sjto_impsto    = b.id_sjto_impsto',
'               and :P111_CDGO_SJTO_TPO_IMPSTO = ''P''',
'             where cdgo_clnte                 = :F_CDGO_CLNTE',
'               and id_impsto                  = :P111_ID_IMPSTO',
'               and (',
'                       (v_tpo_bsqda           = ''IDN'' and a.idntfccion_sjto     = :P111_PRMTRO) or',
'                       (v_tpo_bsqda           = ''IDA'' and a.idntfccion_antrior  = :P111_PRMTRO) or',
'                       (v_tpo_bsqda           = ''DIR'' and a.drccion             = :P111_PRMTRO) or',
'                       (v_tpo_bsqda           = ''MTR'' and b.mtrcla_inmblria     = :P111_PRMTRO) ',
'                    );',
'',
'            if v_id_sjto_estdo = 1 then ',
'                :P111_RSPSTA            := ''1'';',
'                :P111_ID_SJTO_IMPSTO    := v_id_sjto_impsto;',
'                apex_util.set_session_state(''P111_RSPSTA'', ''1'');',
'                apex_util.set_session_state(''P111_ID_SJTO_IMPSTO'', v_id_sjto_impsto);',
'           else ',
'                :P111_RSPSTA            := ''2'';',
'                :P111_ID_SJTO_IMPSTO    := null;',
'                apex_util.set_session_state(''P111_RSPSTA'', ''2'');',
'                apex_util.set_session_state(''P111_ID_SJTO_IMPSTO'', null);',
'               ',
'           end if;',
'           ',
'        exception',
'            when no_data_found then ',
'            :P111_RSPSTA                := ''0'';',
'            :P111_ID_SJTO_IMPSTO        := null;',
'            apex_util.set_session_state(''P111_RSPSTA'', ''0'');',
'            apex_util.set_session_state(''P111_ID_SJTO_IMPSTO'', null);',
'        end;',
'    end if;',
'end;'))
,p_attribute_02=>'P111_PRMTRO,P111_TPO_BSQDA_PRDIO,P111_TPO_BSQDA_PRSNA,P111_TPO_BSQDA_VHCLO'
,p_attribute_03=>'P111_ID_SJTO_IMPSTO,P111_RSPSTA'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73191842062844402)
,p_event_id=>wwv_flow_api.id(70822273003843743)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P111_ID_SJTO_IMPSTO'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($v(''P111_RSPSTA'') == ''1'' ){',
'    // Si existe el sujeto',
'    apex.submit();',
'}',
'else if  ($v(''P111_RSPSTA'') == ''0'' ){',
'    // No existe el sujeto impuesto',
'    Swal.fire({',
'        icon: ''error'',',
unistr('        title:  ''<H2 >PROYECCI\00D3N DE ACUERDOS DE PAGOS</H2>'','),
'        html: ''<H4>El Sujeto Impuesto ingresado NO existe.</H4>''',
'    });',
unistr('    // Se ocultan las regiones de informaci\00F3n b\00E1sica,'),
'    apex.item( "informacion_basica" ).hide();',
'}',
'else if  ($v(''P111_RSPSTA'') == ''2'' ){',
'    // Sujeto Impuesto Inactivo',
'    Swal.fire({',
'        icon: ''error'',',
unistr('        title:  ''<H2 >PROYECCI\00D3N DE ACUERDOS DE PAGOS</H2>'','),
'        html: ''<H4>El Sujeto Impuesto ingresado esta Inactivo.</H4>''',
'    });',
unistr('    // Se ocultan las regiones de informaci\00F3n b\00E1sica,'),
'    apex.item( "informacion_basica" ).hide();',
'}',
'',
';',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70822579305843746)
,p_name=>unistr('Al cambiar el tipo de busqueda para predio actualizar el label del \00EDtem de parametros')
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P111_TPO_BSQDA_PRDIO'
,p_condition_element=>'P111_TPO_BSQDA_PRDIO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70822607066843747)
,p_event_id=>wwv_flow_api.id(70822579305843746)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var valor = $(''#P111_TPO_BSQDA_PRDIO'').find(''[value='' + $(''#P111_TPO_BSQDA_PRDIO'').val() + '']'').text();',
'$(''#P111_PRMTRO_LABEL'').text(valor);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70822722116843748)
,p_name=>unistr('Al cambiar el tipo de busqueda para persona actualizar el label del \00EDtem de parametros')
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P111_TPO_BSQDA_PRSNA'
,p_condition_element=>'P111_TPO_BSQDA_PRSNA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70822811137843749)
,p_event_id=>wwv_flow_api.id(70822722116843748)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var valor = $(''#P111_TPO_BSQDA_PRSNA'').find(''[value='' + $(''#P111_TPO_BSQDA_PRSNA'').val() + '']'').text();',
'$(''#P111_PRMTRO_LABEL'').text(valor);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70822954137843750)
,p_name=>unistr('Al cambiar el tipo de busqueda para vehiculo actualizar el label del \00EDtem de parametro')
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P111_TPO_BSQDA_VHCLO'
,p_condition_element=>'P111_TPO_BSQDA_VHCLO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73191726734844401)
,p_event_id=>wwv_flow_api.id(70822954137843750)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var valor = $(''#P111_TPO_BSQDA_VHCLO'').find(''[value='' + $(''#P111_TPO_BSQDA_VHCLO'').val() + '']'').text();',
'$(''#P111_PRMTRO_LABEL'').text(valor);'))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(73192194569844405)
,p_name=>unistr('Actualizar Descripci\00F3n')
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P111_ID_CNVNIO_TPO'
,p_condition_element=>'P111_ID_CNVNIO_TPO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73192280637844406)
,p_event_id=>wwv_flow_api.id(73192194569844405)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
unistr('    select ''Este tipo de Acuerdo de pago tiene como fecha limite de elaboraci\00F3n '' ||  to_char(fcha_lmte_elbrcion, ''DD/MM/YYYY'')   ||'),
'        decode (indcdor_exge_cta_incial, ''S'',',
'            '', exige como valor de cuota inicial el '' || cta_incial_prcntje_vgncia || ''% '' || ''de la deuda a convenir'',',
'        '''') ||',
'        '', la tasa efectiva anual es: '' || tsa_prfrncial_ea ||',
unistr('        '', . M\00E1ximo puede ser elaborado con '' || nmro_mxmo_ctas || '' cuotas'' ||'),
unistr('        '', la fecha de pago de la \00FAltima cuota m\00E1ximo puede ser hasta '' || to_char(fcha_mxma_ctas, ''DD/MM/YYYY'') ||'),
'        decode ( indcdor_rqre_grntia, ''S'', '', este tipo de acuerdo de pago requiere garantia'', '''') dscrpcion        ',
'            into :P111_DSCRPCION_CNVNIO_TPO',
'      from gf_d_convenios_tipo   ',
'        where id_cnvnio_tpo = :P111_ID_CNVNIO_TPO;',
'end;'))
,p_attribute_02=>'P111_ID_CNVNIO_TPO'
,p_attribute_03=>'P111_DSCRPCION_CNVNIO_TPO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72866409742195880)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Automatic Row Fetch GF_G_PROYECCIONES'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.nmro_pryccion,',
'            a.id_sjto_impsto,',
'            a.id_impsto,',
'            a.id_impsto_sbmpsto,',
'            a.id_cnvnio_tpo,',
'            a.nmro_cta,',
'            a.cdgo_prdcdad_cta,',
'            a.fcha_prmra_cta,',
'            a.fcha_lmte_cta_incial,',
'            (select distinct m.prcntje from gf_g_pryccnes_cta_incl_vgnc m where m.id_pryccion = a.id_pryccion) prcntje,',
'            a.fcha_pryccion',
'',
'      into :P111_NMRO_PRYCCION,',
'           :P111_ID_SJTO_IMPSTO,',
'           :P111_ID_IMPSTO,',
'           :P111_ID_IMPSTO_SBMPSTO,',
'           :P111_ID_CNVNIO_TPO,',
'           :P114_NMRO_CTAS,',
'           :P114_CDGO_PRDCDAD_CTA,',
'           :P114_FCHA_PRMRA_CTA,',
'           :P113_FCHA_PGO_CTA_INCIAL,',
'           :P113_CTA_INCIAL_PRCNTJE_VGNCIA,',
'           :P114_FCHA_SLCTUD',
'',
'      from v_gf_g_proyecciones a ',
'     where a.id_pryccion = :P111_ID_PRYCCION;',
'exception',
'    when no_data_found then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P111_ID_PRYCCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70822168216843742)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de Datos del Sujeto Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'select a.idntfccion_sjto_frmtda',
'        , a.idntfccion_antrior_frmtda',
'        , upper(a.nmbre_pais || '' '' || a.nmbre_dprtmnto || '' '' || a.nmbre_mncpio)',
'        , a.drccion',
'        , a.cdgo_sjto_tpo',
'        , nvl(b.mtrcla_inmblria, ''--'')',
'     into :P111_IDNTFCCION_SJTO_FRMTDA',
'        , :P111_IDNTFCCION_ANTRIOR_FRMTDA',
'        , :P111_UBCCION',
'        , :P111_DRCCION',
'        , :P111_CDGO_SJTO_TPO   ',
'        , :P111_MTRCLA_INMBLRIA',
'     from v_si_i_sujetos_impuesto    a',
'     left join si_i_predios          b on a.id_sjto_impsto = b.id_sjto_impsto',
'    where a.id_sjto_impsto           = :P111_ID_SJTO_IMPSTO;',
'',
'exception',
'    when others then',
'        :P111_IDNTFCCION_SJTO_FRMTDA       := null;',
'        :P111_IDNTFCCION_ANTRIOR_FRMTDA    := null;',
'        :P111_UBCCION                      := null;',
'        :P111_DRCCION                      := null;',
'        :P111_CDGO_SJTO_TPO                := null;',
'        :P111_MTRCLA_INMBLRIA              := null;',
'        :P111_ID_SJTO_IMPSTO               := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P111_ID_SJTO_IMPSTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72865274758195862)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Cache de Id sujeto Impuesto'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_error_message=>'&P111_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(42344258255115411)
,p_process_when=>'P111_ID_SJTO_IMPSTO'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>'&P111_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72866038572195880)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Cache de toda la pagina'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_error_message=>'&P111_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(42344258255115411)
,p_process_when=>'P111_ID_SJTO_IMPSTO'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>'&P111_RSPSTA.'
);
end;
/
