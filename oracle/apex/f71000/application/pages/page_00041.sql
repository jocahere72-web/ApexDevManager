prompt --application/pages/page_00041
begin
wwv_flow_api.create_page(
 p_id=>41
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Proyecci\00F3n de Acuerdo - Sujeto Tributo')
,p_step_title=>unistr('Proyecci\00F3n de Acuerdo - Sujeto Tributo')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
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
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20220308135050'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44672821067380801)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
 p_id=>wwv_flow_api.id(72618321146183502)
,p_plug_name=>'Sujeto Tributo Wizard'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(177337797773050609)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(43441465037066295)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(177351601973050625)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43442111536066300)
,p_plug_name=>'Sujeto Tributo'
,p_parent_plug_id=>wwv_flow_api.id(72618321146183502)
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_plug_template=>wwv_flow_api.id(177337797773050609)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(47972215971622307)
,p_plug_name=>'PLugin'
,p_parent_plug_id=>wwv_flow_api.id(43442111536066300)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'P41_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(223119342763859285)
,p_plug_name=>unistr('Informaci\00F3n B\00E1sica / Responsables')
,p_parent_plug_id=>wwv_flow_api.id(43442111536066300)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-useLocalStorage:is-collapsed:t-Region--scrollBody:t-Form--noPadding:t-Form--stretchInputs:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(224604974316294135)
,p_plug_name=>'Predio'
,p_parent_plug_id=>wwv_flow_api.id(223119342763859285)
,p_region_template_options=>'#DEFAULT#:t-Region--hiddenOverflow:t-Form--slimPadding:t-Form--stretchInputs:margin-top-sm:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P41_CDGO_SJTO_TPO'
,p_plug_display_when_cond2=>'P'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(400307480476287153)
,p_plug_name=>'Responsables'
,p_parent_plug_id=>wwv_flow_api.id(223119342763859285)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' ',
' select a.nmbre_rzon_scial,',
'        a.dscrpcion_idntfccion_tpo ,',
'        a.idntfccion_rspnsble ,',
'        case when prncpal_s_n = ''S'' then',
'           ''<input type="checkbox" name="prncpal_s_n" disabled="disabled" checked>'' ',
'        else  ',
'           ''<input type="checkbox" name="prncpal_s_n" disabled="disabled">'' ',
'       end as prncpal_s_n',
'  from v_si_i_sujetos_responsable    a',
'  join si_i_sujetos_impuesto         b on a.id_sjto = b.id_sjto',
' where a.cdgo_clnte     = :F_CDGO_CLNTE',
' and b.id_sjto_impsto  = :P41_ID_SJTO_IMPSTO ;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(400718233005230923)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'La consulta no arrojo resultado'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AALFARO'
,p_internal_uid=>400718233005230923
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44176179276911810)
,p_db_column_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Tipo de Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44176551765911810)
,p_db_column_name=>'IDNTFCCION_RSPNSBLE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44176900034911811)
,p_db_column_name=>'PRNCPAL_S_N'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('\00BFPrincipal?')
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44175761860911806)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Nombre / Raz\00F3n Social')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(400740628616506425)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'441773'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_IDNTFCCION_TPO:IDNTFCCION_RSPNSBLE:PRNCPAL_S_N:NMBRE_RZON_SCIAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(224686321942510185)
,p_plug_name=>unistr('Informaci\00F3n B\00E1sica')
,p_parent_plug_id=>wwv_flow_api.id(43442111536066300)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146073644680834586)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
 p_id=>wwv_flow_api.id(51053293180244805)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(146073644680834586)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:71:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(177374472201050688)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(42344258255115411)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(43442111536066300)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>6
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(42344308570115412)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(43442111536066300)
,p_button_name=>'BTN_CONSULTA_PARAMETROS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Consulta Par\00E1metros')
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(77220754027794204)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(72618321146183502)
,p_button_name=>'CANCELAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:71:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72666540293254402)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(72618321146183502)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(43444928006066307)
,p_branch_name=>unistr('Ir a P\00E1gina 43 Cartera')
,p_branch_action=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.:43::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72666540293254402)
,p_branch_sequence=>20
,p_branch_condition_type=>'SQL_EXPRESSION'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' :P41_ID_SJTO_IMPSTO IS NOT NULL and :P41_INDCDOR_CNV_RVCD_OTRS_VGNC = ''S''  or ',
' (:P41_INDCDOR_CNV_RVCD_OTRS_VGNC = ''N'' and :P41_INDCDOR_CRTRA_RVCDA_SLDO =''N'')'))
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(18374842690363805)
,p_branch_name=>unistr('Ir a P\00E1gina 361 Validaciones')
,p_branch_action=>'f?p=&APP_ID.:361:&SESSION.::&DEBUG.:RP,361::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72666540293254402)
,p_branch_sequence=>30
,p_branch_condition_type=>'SQL_EXPRESSION'
,p_branch_condition=>':P41_INDCDOR_CNV_RVCD_OTRS_VGNC = ''N'' and :P41_INDCDOR_CRTRA_RVCDA_SLDO = ''S'''
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(44162961520893445)
,p_branch_name=>'Ir a Busqueda Sujeto Impuesto'
,p_branch_action=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP:P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_VLDAR_CRTRA,P3_ID_IMPSTO,P3_NMBRE_ITEM_IMPSTO,P3_NMBRE_ITEM_SBIMPSTO,P3_TNE_PRCSO_JRDCO:&APP_ID.,&APP_PAGE_ID.,P41_ID_SJTO_IMPSTO,S,&P41_ID_IMPSTO.,P41_ID_IMPSTO,P41_ID_IMPSTO_SBMPSTO,N&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(42344308570115412)
,p_branch_sequence=>30
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(47972359719622308)
,p_branch_name=>unistr('Ir a P\00E1gina 3')
,p_branch_action=>'f?p=71000:3:&SESSION.::&DEBUG.:RP:P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO,P3_VLDAR_CRTRA,P3_IMPSTO_SBMPSTO,P3_NMBRE_ITEM_IMPSTO,P3_NMBRE_ITEM_SBIMPSTO:&APP_ID.,&APP_PAGE_ID.,P41_ID_SJTO_IMPSTO,&P41_ID_IMPSTO.,S,&P41_ID_IMPSTO_SBMPSTO.,P41_ID_IMPSTO,P41_ID_IMPSTO_SBMPSTO&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(42344308570115412)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18374485940363801)
,p_name=>'P41_INDCDOR_CNV_RVCD_OTRS_VGNC'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(43442111536066300)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18374595658363802)
,p_name=>'P41_INDCDOR_CRTRA_RVCDA_SLDO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(43442111536066300)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28363131988873401)
,p_name=>'P41_ESTDO_BLQDO_SJTO_IMPSTO'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(224604974316294135)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28363289796873402)
,p_name=>'P41_ID_SJTO_ESTDO'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(224604974316294135)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42344193576115410)
,p_name=>'P41_IDNTFCCION_PRMT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(43442111536066300)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del sujeto y haga clic en el bot\00F3n "Consultar".')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42344487322115413)
,p_name=>'P41_RSPSTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(43442111536066300)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42344538563115414)
,p_name=>'P41_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(43442111536066300)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42344785015115416)
,p_name=>'P41_ID_CNVNIO_TPO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(43442111536066300)
,p_prompt=>'Tipo de Acuerdo de Pago'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_select clob;',
'    ',
'begin',
'    v_select := pkg_gf_convenios.fnc_cl_select_tipo_convenio (:F_CDGO_CLNTE, :P41_CDGO_SJTO_TPO, :P41_ID_SJTO_IMPSTO );',
'',
'    return v_select;',
'end;',
''))
,p_lov_cascade_parent_items=>'P41_ID_SJTO_IMPSTO'
,p_ajax_items_to_submit=>'P41_ID_CNVNIO_TPO'
,p_ajax_optimize_refresh=>'Y'
,p_display_when=>'P41_ID_SJTO_IMPSTO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355467780050629)
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
 p_id=>wwv_flow_api.id(44164526449906165)
,p_name=>'P41_IDNTFCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(224686321942510185)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>25
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44164956465906167)
,p_name=>'P41_IDNTFCCION_ANTRIOR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(224686321942510185)
,p_prompt=>unistr('Identificaci\00F3n Anterior')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>25
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44165337287906168)
,p_name=>'P41_UBCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(224686321942510185)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44165760005906168)
,p_name=>'P41_DRCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(224686321942510185)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44166131381906168)
,p_name=>'P41_UBCCION_NTFCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(224686321942510185)
,p_prompt=>unistr('Ubicaci\00F3n Notificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44166504981906168)
,p_name=>'P41_DRCCION_NTFCCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(224686321942510185)
,p_prompt=>unistr('Direcci\00F3n Notificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44166937992906168)
,p_name=>'P41_TLFNO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(224686321942510185)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44167380698906169)
,p_name=>'P41_EMAIL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(224686321942510185)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>320
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44167754212906169)
,p_name=>'P41_DSCRPCION_SJTO_ESTDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(224686321942510185)
,p_prompt=>'Estado'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SUJETO_ESTADO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_sjto_estdo as d,',
'       id_sjto_estdo as r',
'  from df_i_sujetos_estado',
'  where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44168102531906169)
,p_name=>'P41_ESTDO_BLQDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(224686321942510185)
,p_prompt=>unistr('\00BFBloqueado?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(177372678491050686)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44168564862906170)
,p_name=>'P41_CDGO_SJTO_TPO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(224686321942510185)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44169555956911797)
,p_name=>'P41_ID_PRDIO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(224604974316294135)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P41_ID_SJTO_IMPSTO is not null then ',
'        select id_prdio into :P41_ID_PRDIO from si_i_predios where id_sjto_impsto = :P41_ID_SJTO_IMPSTO;',
'    end if;',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44169941628911798)
,p_name=>'P41_ID_PRDIO_DSTNO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(224604974316294135)
,p_prompt=>'Destino'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44170370572911798)
,p_name=>'P41_CDGO_ESTRTO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(224604974316294135)
,p_prompt=>'Estrato'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44170791661911798)
,p_name=>'P41_CDGO_DSTNO_IGAC'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(224604974316294135)
,p_prompt=>'Destino IGAC'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44171058598911798)
,p_name=>'P41_CDGO_PRDIO_CLSFCCION'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(224604974316294135)
,p_prompt=>unistr('Clasificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_CLASIFICACION_PREDIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_prdio_clsfccion d,',
'       cdgo_prdio_clsfccion  r   ',
'  from df_s_predios_clasificacion',
'  order by cdgo_prdio_clsfccion'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44171489649911799)
,p_name=>'P41_ID_PRDIO_USO_SLO'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(224604974316294135)
,p_prompt=>'Uso del Suelo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44171895958911802)
,p_name=>'P41_MTRCLA_INMBLRIA'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(224604974316294135)
,p_prompt=>unistr('Matr\00EDcula Inmobiliaria ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44172222263911802)
,p_name=>'P41_AVLUO_CTSTRAL'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(224604974316294135)
,p_prompt=>unistr('Aval\00FAo Catastral')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44172609275911803)
,p_name=>'P41_AVLUO_CMRCIAL'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(224604974316294135)
,p_prompt=>unistr('Aval\00FAo Comercial')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44173081514911803)
,p_name=>'P41_AREA_TRRNO'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(224604974316294135)
,p_prompt=>unistr('\00C1rea Terreno')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44173467837911803)
,p_name=>'P41_AREA_CNSTRDA'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(224604974316294135)
,p_prompt=>unistr('\00C1rea Construida')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44173889443911803)
,p_name=>'P41_AREA_GRVBLE'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(224604974316294135)
,p_prompt=>unistr('\00C1rea Gravable')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44174244595911804)
,p_name=>'P41_INDCDOR_PRDIO_MNCPIO'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(224604974316294135)
,p_prompt=>unistr('\00BFPredio del Municipio?')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44174603153911804)
,p_name=>'P41_ID_BRRIO'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(224604974316294135)
,p_prompt=>'Barrio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44175031681911804)
,p_name=>'P41_ID_ENTDAD'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(224604974316294135)
,p_prompt=>'Entidad'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46592256106325217)
,p_name=>'P41_ID_SJTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(224686321942510185)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50985027395826240)
,p_name=>'P41_ID_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(43442111536066300)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tributo desea asociar a la proyecci\00F3n de acuerdo de pago.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50985134680826241)
,p_name=>'P41_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(43442111536066300)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_impsto_sbmpsto, ',
'        id_impsto_sbmpsto ',
'   from df_i_impuestos_subimpuesto ',
'   where id_impsto = :P41_ID_IMPSTO',
'   order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P41_ID_IMPSTO'
,p_ajax_items_to_submit=>'P41_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el sub tributo desea asociar a la proyecci\00F3n de acuerdo de pago.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52513801373153523)
,p_name=>'P41_ID_PRYCCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(43442111536066300)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52514019684153525)
,p_name=>'P41_NMRO_PRYCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(43442111536066300)
,p_prompt=>unistr('N\00B0 Proyecci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P41_ID_PRYCCION'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(18374744388363804)
,p_computation_sequence=>10
,p_computation_item=>'P41_INDCDOR_CRTRA_RVCDA_SLDO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>'select pkg_gf_convenios.fnc_cl_crtra_rvcda_con_saldo (:F_CDGO_CLNTE, :P41_ID_IMPSTO,  :P41_ID_IMPSTO_SBMPSTO, :P41_ID_SJTO_IMPSTO) from dual '
,p_compute_when=>'P41_ID_SJTO_IMPSTO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(18374679799363803)
,p_computation_sequence=>10
,p_computation_item=>'P41_INDCDOR_CNV_RVCD_OTRS_VGNC'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_cnv_rvcd_otrs_vgnc',
'from gf_d_convenios_cnfgrcion',
'where cdgo_clnte = :F_CDGO_CLNTE'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(50985234429826242)
,p_validation_name=>'Impuesto no sea nulo'
,p_validation_sequence=>10
,p_validation=>'P41_ID_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Se debe seleccionar un tributo.'
,p_associated_item=>wwv_flow_api.id(50985027395826240)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(50985357756826243)
,p_validation_name=>'Sub-Impuesto no sea nulo'
,p_validation_sequence=>20
,p_validation=>'P41_ID_IMPSTO_SBMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Se debe seleccionar un sub-tributo.'
,p_associated_item=>wwv_flow_api.id(50985134680826241)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(42344612182115415)
,p_validation_name=>'Id Sujeto Impuesto no es nulo'
,p_validation_sequence=>30
,p_validation=>'P41_ID_SJTO_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe consultar un sujeto tributo, antes de continuar.'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(72666540293254402)
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(46592067046325215)
,p_validation_name=>'Tipo de Convenio no sea Nulo'
,p_validation_sequence=>40
,p_validation=>':P41_ID_CNVNIO_TPO is null or :P41_ID_CNVNIO_TPO > 0'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Debe seleccionar un Tipo de Convenio para continuar'
,p_when_button_pressed=>wwv_flow_api.id(72666540293254402)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52511851052153503)
,p_validation_name=>unistr('Identificaci\00F3n par\00E1metro no nulo')
,p_validation_sequence=>50
,p_validation=>'P41_IDNTFCCION_PRMT'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Para consultar ingrese una identificaci\00F3n')
,p_when_button_pressed=>wwv_flow_api.id(42344258255115411)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(99206988216054101)
,p_validation_name=>'Sujeto Activo'
,p_validation_sequence=>60
,p_validation=>'P41_ID_SJTO_ESTDO'
,p_validation2=>'1'
,p_validation_type=>'ITEM_IN_VALIDATION_EQ_STRING2'
,p_error_message=>'El Sujeto No esta Activo'
,p_when_button_pressed=>wwv_flow_api.id(72666540293254402)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(99207068978054102)
,p_validation_name=>'Sujeto Bloqueado'
,p_validation_sequence=>70
,p_validation=>'P41_ESTDO_BLQDO_SJTO_IMPSTO'
,p_validation2=>'N'
,p_validation_type=>'ITEM_IN_VALIDATION_EQ_STRING2'
,p_error_message=>'El Sujeto esta Bloqueado'
,p_when_button_pressed=>wwv_flow_api.id(72666540293254402)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(43324598149292110)
,p_name=>unistr('mostrar regi\00F3n Predio')
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P41_TIPO_SJTO_IMPSTO'
,p_condition_element=>'P41_TIPO_SJTO_IMPSTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'P'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(52513753389153522)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Automatic Row Fetch GF_G_PROYECCIONES'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.nmro_pryccion,',
'            a.id_sjto_impsto,',
'            a.idntfccion_sjto,',
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
'      into :P41_NMRO_PRYCCION,',
'           :P41_ID_SJTO_IMPSTO,',
'           :P41_IDNTFCCION_PRMT,',
'           :P41_ID_IMPSTO,',
'           :P41_ID_IMPSTO_SBMPSTO,',
'           :P41_ID_CNVNIO_TPO,',
'           :P44_NMRO_CTAS,',
'           :P44_CDGO_PRDCDAD_CTA,',
'           :P44_FCHA_PRMRA_CTA,',
'           :P53_FCHA_PGO_CTA_INCIAL,',
'           :P53_CTA_INCIAL_PRCNTJE_VGNCIA,',
'           :P44_FCHA_SLCTUD',
'',
'      from v_gf_g_proyecciones a ',
'     where a.id_pryccion = :P41_ID_PRYCCION;',
'exception',
'    when no_data_found then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P41_ID_PRYCCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44177916833918050)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Automatic Row Fetch V_I_SUJETO_IMPSTO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select ',
'        idntfccion_sjto_frmtda,',
'        idntfccion_antrior_frmtda,',
'        upper(a.nmbre_pais || '' '' || a.nmbre_dprtmnto || '' '' || a.nmbre_mncpio),',
'        a.drccion,',
'        a.drccion_ntfccion,',
'        b.id_sjto_impsto,',
'        b.id_prdio,',
'        upper(a.nmbre_pais_ntfccion || '' '' || a.nmbre_dprtmnto_ntfccion || '' '' || a.nmbre_mncpio_ntfccion),',
'        a.tlfno,',
'        a.email,',
'        initcap(a.dscrpcion_sjto_estdo),',
unistr('        decode(a.estdo_blqdo_sjto_impsto, ''S'', ''S\00ED'', ''No''), '),
'        a.cdgo_sjto_tpo,',
'        b.dscrpcion_prdo_dstno,',
'        b.dscrpcion_estrto,',
'        b.nmbre_dstno_igac,',
'        b.cdgo_prdio_clsfccion,',
'        b.dscrpcion_uso_suelo,',
'        b.mtrcla_inmblria,',
'        to_char(b.avluo_ctstral,:F_FRMTO_MNDA)avluo_ctstral,',
'        to_char(b.avluo_cmrcial, :F_FRMTO_MNDA)avluo_cmrcial,',
'        (b.area_trrno|| '' '' || ''mts2''),',
'        (b.area_cnstrda|| '' '' || ''mts2''),',
'        (b.area_grvble|| '' '' || ''mts2''),',
unistr('        decode(b.indcdor_prdio_mncpio, ''S'', ''S\00ED'', ''No''),'),
'        nvl2(b.nmbre_brrio,b.nmbre_brrio,''NO DEFINIDO''),',
'        nvl2(b.nmbre_entdad,upper(b.nmbre_entdad),''NO DEFINIDO''),',
'        a.id_sjto_estdo,',
'        a.estdo_blqdo_sjto_impsto',
'      into :P41_IDNTFCCION,',
'           :P41_IDNTFCCION_ANTRIOR,',
'           :P41_UBCCION,',
'           :P41_DRCCION,',
'           :P41_DRCCION_NTFCCION,',
'           :P41_ID_SJTO,',
'           :P41_ID_PRDIO,',
'           :P41_UBCCION_NTFCCION,',
'           :P41_TLFNO,',
'           :P41_EMAIL,',
'           :P41_DSCRPCION_SJTO_ESTDO,',
'           :P41_ESTDO_BLQDO,',
'           :P41_CDGO_SJTO_TPO,',
'           :P41_ID_PRDIO_DSTNO,',
'           :P41_CDGO_ESTRTO,',
'           :P41_CDGO_DSTNO_IGAC,',
'           :P41_CDGO_PRDIO_CLSFCCION,',
'           :P41_ID_PRDIO_USO_SLO,',
'           :P41_MTRCLA_INMBLRIA,',
'           :P41_AVLUO_CTSTRAL,',
'           :P41_AVLUO_CMRCIAL,',
'           :P41_AREA_TRRNO,',
'           :P41_AREA_CNSTRDA,',
'           :P41_AREA_GRVBLE,',
'           :P41_INDCDOR_PRDIO_MNCPIO,',
'           :P41_ID_BRRIO,',
'           :P41_ID_ENTDAD,',
'           :P41_ID_SJTO_ESTDO,',
'           :P41_ESTDO_BLQDO_SJTO_IMPSTO',
'      from V_SI_I_SUJETOS_IMPUESTO a ',
' left join v_si_i_predios b on a.id_sjto_impsto = b.id_sjto_impsto',
'     where a.id_sjto_impsto = :P41_ID_SJTO_IMPSTO;',
'exception',
'    when no_data_found then',
'        null;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44158319781853073)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto Impuesto x BTN_CONSULTAR'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    ',
'begin',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte    = :F_CDGO_CLNTE',
'       and id_impsto = :P41_ID_IMPSTO',
'       and idntfccion_sjto    = :P41_IDNTFCCION_PRMT;',
'    ',
'   :P41_RSPSTA := ''Consulta Exitosa'';',
'   :P41_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'exception',
'    when no_data_found then ',
'    :P41_ID_SJTO_IMPSTO := null;',
'    :P41_RSPSTA := ''No Existe el Sujeto Impuesto'';',
'end;'))
,p_process_error_message=>'&P41_RSPSTA. '
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(42344258255115411)
,p_process_when=>'P41_IDNTFCCION_PRMT'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'&P41_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44160364711874585)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto Impuesto X enter del item identificacion_prmt'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    ',
'begin',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte    = :F_CDGO_CLNTE',
'       and id_impsto = :P41_ID_IMPSTO',
'       and idntfccion_sjto    = :P41_IDNTFCCION_PRMT;',
'    ',
'    :P41_RSPSTA := '''';',
'    :P41_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'exception',
'    when no_data_found then ',
'    :P41_ID_SJTO_IMPSTO := null;',
'    :P41_RSPSTA := ''No Existe el Sujeto Impuesto'';',
'end;'))
,p_process_error_message=>'&P41_RSPSTA. '
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P41_IDNTFCCION_PRMT'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'&P41_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44161116914883839)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Cache de Id sujeto Impuesto'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_error_message=>'&P41_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(42344258255115411)
,p_process_when=>'P41_ID_SJTO_IMPSTO'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>'&P41_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(52511940163153504)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Cache de toda la pagina'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_error_message=>'&P41_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(42344258255115411)
,p_process_when=>'P41_ID_SJTO_IMPSTO'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>'&P41_RSPSTA.'
);
end;
/
