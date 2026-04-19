prompt --application/pages/page_00044
begin
wwv_flow_api.create_page(
 p_id=>44
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Proyecci\00F3n de Acuerdos - Plan de Pago')
,p_step_title=>unistr('Proyecci\00F3n de Acuerdos - Plan de Pago')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id) {',
'  if ($("#" + id).attr("aria-expanded") == "true") {',
'    $("#" + id).click();',
'  }',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'buttonCollapse(''t_Button_rightControlButton'');',
''))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20220601072002'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43454239091066311)
,p_plug_name=>'Datos del Convenio'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_plug_template=>wwv_flow_api.id(177337797773050609)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(43441465037066295)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(177351601973050625)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43454321807066311)
,p_plug_name=>'Datos del Convenio'
,p_parent_plug_id=>wwv_flow_api.id(43454239091066311)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177322596503050602)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89707615950993932)
,p_plug_name=>unistr('Proyecci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(43454239091066311)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select n001 nmro_cta,',
'        n004 vlor_cptal,',
'        n005 vlor_intres,',
'        n003 vlor_fncncion,',
'        n002  vlor_cta,',
'        d001 fcha_cta',
'  from gn_g_temporal ',
'  where id_ssion = :APP_SESSION',
' order by n001',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
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
 p_id=>wwv_flow_api.id(49078470381950832)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'&P44_RSPSTA.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>49078470381950832
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46249691478927635)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>20
,p_column_identifier=>'F'
,p_column_label=>unistr('N\00B0 Cuota')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122431607477633417)
,p_db_column_name=>'FCHA_CTA'
,p_display_order=>170
,p_column_identifier=>'AK'
,p_column_label=>'Fecha Vencimiento <br> Cuota'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3001763099605404)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>180
,p_column_identifier=>'AL'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3001894482605405)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>190
,p_column_identifier=>'AM'
,p_column_label=>'Valor Interes'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3001913038605406)
,p_db_column_name=>'VLOR_FNCNCION'
,p_display_order=>200
,p_column_identifier=>'AN'
,p_column_label=>unistr('Valor Financiaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(118661806246384928)
,p_db_column_name=>'VLOR_CTA'
,p_display_order=>210
,p_column_identifier=>'AJ'
,p_column_label=>'Valor Cuota'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(90983386381506810)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'462508'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CTA:FCHA_CTA:VLOR_CPTAL:VLOR_INTRES:VLOR_FNCNCION:VLOR_CTA:'
,p_sum_columns_on_break=>'VLOR_CTA:VLOR_CPTAL:VLOR_INTRES:VLOR_FNCNCION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44673136151380804)
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
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
unistr('    <p align="justify"> Proyecci\00F3n de Acuerdo de Pago.<br> '),
'        <b> <center> Paso 4 Datos de Acuerdo de Pago </center> </b> <br>',
'        Debe seleccionar la fecha de la primera cuota.<br><br> ',
unistr('        Debe ingresar el n\00FAmero de cuotas por las que desea hacer el acuerdo de pago, respetando el n\00FAmero m\00E1ximo de cuotas.</br><br>'),
'        Debe seleccionar la periodicidad de las cuotas.<br><br>',
'        Debe tener en cuenta la fecha limite de cuotas para presentar la solicitud y la fecha en la cual va a pagar la cuota inicial.</br> <br>',
unistr('        Se muestra la proyecci\00F3n de las cuotas generadas.<br> '),
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46251267450927638)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(43454321807066311)
,p_button_name=>'BTN_PROYECTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Actualizar Plan de Pago'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(43456019012066312)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(43454239091066311)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:71:&SESSION.::&DEBUG.:RP,41,43,53,44,72::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(43456339035066312)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(43454239091066311)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(43456292839066312)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(43454239091066311)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355657869050631)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(51328581184001708)
,p_branch_name=>unistr('Ir a P\00E1gina 72')
,p_branch_action=>'f?p=&APP_ID.:72:&SESSION.:BORRAR:&DEBUG.:72:P72_VLOR_CTA_INCIAL:&P44_VLOR_CTA_INCIAL.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(43456339035066312)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(50164085755213303)
,p_branch_name=>unistr('Ir a P\00E1gina 44')
,p_branch_action=>'f?p=&APP_ID.:44:&SESSION.:PROYECTAR:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(46251267450927638)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(50984155262826231)
,p_branch_name=>'Go To Page 53'
,p_branch_action=>'f?p=&APP_ID.:53:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(43456292839066312)
,p_branch_sequence=>10
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select id_cnvnio_tpo ',
'  from gf_d_convenios_tipo a ',
' where a.id_cnvnio_tpo = :P41_ID_CNVNIO_TPO ',
'   and a.indcdor_exge_cta_incial= ''S'''))
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(43457132308066312)
,p_branch_name=>'Go To Page 43'
,p_branch_action=>'f?p=&APP_ID.:43:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(43456292839066312)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3002202674605409)
,p_name=>'P44_VLOR_CTA_INCIAL'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(43454321807066311)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42345643335115425)
,p_name=>'P44_CDGO_PRDCDAD_CTA'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(43454321807066311)
,p_item_default=>'MNS'
,p_prompt=>'Periodicidad Cuota'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_prdcdad_cta',
'   from gf_g_proyecciones',
'  where id_pryccion = :P41_ID_PRYCCION;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PERIODICIDAD'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_prdcdad as r',
'  from df_s_periodicidad',
' order by cntdad_vce_anio desc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Frecuencia en la cual se pagar\00E1n las cuotas del acuerdo de pago.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42347152233115440)
,p_name=>'P44_RSPSTA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(43454321807066311)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43328433812292149)
,p_name=>'P44_FCHA_SLCTUD'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(43454321807066311)
,p_prompt=>'Fecha Solicitud'
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'sysdate'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Seleccione la fecha en la que la solicitud de acuerdos de pago quedar\00E1 registrada en el sistema.'),
''))
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43966551114358307)
,p_name=>'P44_NMRO_MXMO_CTAS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(43454321807066311)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('M\00E1ximo de Cuotas')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmro_mxmo_ctas ',
'   from gf_d_convenios_tipo ',
'  where id_cnvnio_tpo = :P41_ID_CNVNIO_TPO'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>15
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('El n\00FAmero de cuotas para pagar el acuerdo de pago no puede ser superior al n\00FAmero m\00E1ximo de cuotas.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43966748440358309)
,p_name=>'P44_NMRO_CTAS'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(43454321807066311)
,p_item_default=>'1'
,p_prompt=>unistr('N\00B0 Cuotas')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmro_cta',
'   from gf_g_proyecciones',
'  where id_pryccion = :P41_ID_PRYCCION;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_tag_attributes=>' onkeypress="return  validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('N\00FAmero de cuotas en las que va a dividir el monto total del acuerdo de pago.')
,p_attribute_01=>'1'
,p_attribute_02=>'&P44_NMRO_MXMO_CTAS.'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43966855430358310)
,p_name=>'P44_FCHA_PRMRA_CTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(43454321807066311)
,p_item_default=>'to_date(:P53_FCHA_PGO_CTA_INCIAL) + 1'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Primera Cuota'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select fcha_prmra_cta',
'   from gf_g_proyecciones',
'  where id_pryccion = :P41_ID_PRYCCION;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha en la cual se realizar\00E1 el pago de la cuota inicial del acuerdo de pago.')
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43967810554358320)
,p_name=>'P44_FCHA_MXMO_CTAS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(43454321807066311)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Fecha L\00EDmite de Cuotas')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  FCHA_MXMA_CTAS',
'  from gf_d_convenios_tipo ',
'  where id_cnvnio_tpo = :P41_ID_CNVNIO_TPO'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Muestra la fecha l\00EDmite para proyectar las cuotas (incluyendo la cuota inicial) del acuerdo de pago, donde esta es la m\00E1xima fecha de vencimiento de la \00FAltima cuota y es establecida seg\00FAn el tipo de acuerdo de pago.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52514486435153529)
,p_name=>'P44_NMRO_PRYCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(43454321807066311)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00B0 Proyecci\00F3n')
,p_source=>'P41_NMRO_PRYCCION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P41_ID_PRYCCION'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73100275674681001)
,p_name=>'P114_CDGO_RSPSTA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(43454321807066311)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(46255132987954950)
,p_validation_name=>unistr('Proyecci\00F3n Exista')
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_nmro_pryccion    number; ',
'begin ',
'     begin',
'         select count (id_ssion) ',
'           into v_nmro_pryccion',
'           from gn_g_temporal ',
'          where id_ssion = :APP_SESSION;   ',
'          ',
'     exception  ',
'         when no_data_found then ',
'             v_nmro_pryccion := 0;',
'     end;',
'    ',
'    if v_nmro_pryccion  > 0 then ',
'        return true;',
'    else ',
'        return false;',
'    end if;',
'',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'No se ha actualizado el plan de pago.'
,p_when_button_pressed=>wwv_flow_api.id(43456339035066312)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(92584856541225617)
,p_validation_name=>unistr('Fecha Solicitud H\00E1bil ')
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_hbil    varchar2(1);',
'    ',
'begin',
'    v_hbil := pk_util_calendario.fnc_cl_fecha_habil(:F_CDGO_CLNTE, :P44_FCHA_SLCTUD);',
'',
'    if v_hbil = ''S'' then ',
'        return true;',
'    else',
'        return false;',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('La fecha de Solicitud seleccionada no es H\00E1bil')
,p_associated_item=>wwv_flow_api.id(43328433812292149)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(92584945307225618)
,p_validation_name=>unistr('Fecha Primera Cuota H\00E1bil')
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_hbil    varchar2(1);',
'    ',
'begin',
'    v_hbil := pk_util_calendario.fnc_cl_fecha_habil(:F_CDGO_CLNTE, :P44_FCHA_PRMRA_CTA);',
'',
'    if v_hbil = ''S'' then ',
'        return true;',
'    else',
'        return false;',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('La fecha de la primera cuota seleccionada no es H\00E1bil')
,p_associated_item=>wwv_flow_api.id(43966855430358310)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(122430417062633405)
,p_validation_name=>'Fecha Mayor que la fecha de pago limite de pago de la cuota inicial'
,p_validation_sequence=>50
,p_validation=>'to_date(:P44_FCHA_PRMRA_CTA) > to_date(:P53_FCHA_PGO_CTA_INCIAL)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La fecha de la primera cuota debe ser mayor que la fecha limite de pago de la cuota inicial. [Fecha Limite de pago de cuota inicial &P53_FCHA_PGO_CTA_INCIAL.]'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(43966855430358310)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(73100360331681002)
,p_name=>unistr('Calcular Proyecci\00F3n al Cambiar ')
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P44_NMRO_CTAS,P44_FCHA_PRMRA_CTA,P44_CDGO_PRDCDAD_CTA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73100423111681003)
,p_event_id=>wwv_flow_api.id(73100360331681002)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16444380145758601)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar datos cuando la proyecci\00F3n exista')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select nmro_pryccion',
'      into :P44_NMRO_PRYCCION',
'      from gf_g_proyecciones',
'      where id_pryccion = :P41_ID_PRYCCION;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>'aaaaa'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(122431759922633418)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Generaci\00F3n de plan de pago')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    ',
'    v_cdgo_rspsta       number;',
'    v_mnsje_rspsta      varchar2(1000);',
'    v_fcha_prmra_cta    gf_g_convenios.fcha_prmra_cta%type      := :P44_FCHA_PRMRA_CTA;',
'    v_cdgo_prdcdad_cta  gf_g_convenios.cdgo_prdcdad_cta%type    := :P44_CDGO_PRDCDAD_CTA;',
'    v_nmro_ctas_cnvnio  gf_g_convenios.nmro_cta%type            := :P44_NMRO_CTAS;',
'    ',
'begin',
'    ',
'    pkg_gf_convenios.prc_gn_convenio_extracto (p_cdgo_clnte          => :F_CDGO_CLNTE ,',
'                                               p_id_ssion            => :APP_SESSION ,',
'                                               p_id_sjto_impsto      => :P41_ID_SJTO_IMPSTO ,',
'                                               p_id_cnvnio_tpo       => :P41_ID_CNVNIO_TPO ,',
'                                               p_fcha_slctud         => :P44_FCHA_SLCTUD,',
'                                               p_nmro_ctas           => v_nmro_ctas_cnvnio ,',
'                                               p_fcha_prmra_cta      => v_fcha_prmra_cta ,',
'                                               p_cdgo_prdcdad_cta    => v_cdgo_prdcdad_cta ,',
'                                               p_vlor_cta_incial     => :P53_VLOR_CTA_INCIAL ,',
'                                               p_prcntje_cta_incial  => :P53_CTA_INCIAL_PRCNTJE_VGNCIA,',
'                                               p_cdna_vgncia_prdo    => :P43_VGNCIA_PRDO ,',
'                                               p_indcdor_inslvncia   => :P43_INSLVNCIA,',
'                                               p_indcdor_clcla_intres=> :P43_CLCLA_INTRES ,',
'                                               p_fcha_cngla_intres    => :P43_FCHA_CNGLA_INTRES , ',
'                                               p_cdgo_rspsta         => v_cdgo_rspsta ,',
'                                               p_mnsje_rspsta        => :P44_RSPSTA);',
'',
'end;'))
,p_process_error_message=>'&P44_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(46251267450927638)
,p_process_when_type=>'NEVER'
,p_process_success_message=>'&P44_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(102878405771618406)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta de los datos de la proyecci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select fcha_prmra_cta,',
'        nmro_cta,',
'        cdgo_prdcdad_cta,',
'        trunc(fcha_pryccion)',
'   into :P44_FCHA_PRMRA_CTA,',
'        :P44_NMRO_CTAS,',
'        :P44_CDGO_PRDCDAD_CTA,',
'        :P44_FCHA_SLCTUD',
'   from gf_g_proyecciones ',
'  where id_pryccion = :P41_ID_PRYCCION;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P41_ID_PRYCCION is not null and :request is null'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(122431882433633419)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Generaci\00F3n del Plan de pago')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    ',
'    v_cdgo_rspsta       number;',
'    v_mnsje_rspsta      varchar2(1000);',
'    v_fcha_prmra_cta    gf_g_convenios.fcha_prmra_cta%type      := :P44_FCHA_PRMRA_CTA;',
'    v_cdgo_prdcdad_cta  gf_g_convenios.cdgo_prdcdad_cta%type    := :P44_CDGO_PRDCDAD_CTA;',
'    v_nmro_ctas_cnvnio  gf_g_convenios.nmro_cta%type            := :P44_NMRO_CTAS;',
'    v_fcha_slctud       date                                    := trunc(to_date(:P44_FCHA_SLCTUD));',
'    ',
'begin',
'    delete from gn_g_temporal where id_ssion = :APP_SESSION; commit;',
'    if v_nmro_ctas_cnvnio is null then ',
'        begin',
'            if :P41_ID_PRYCCION is not null then ',
'                select a.nmro_cta',
'                  into v_nmro_ctas_cnvnio',
'                 from gf_g_proyecciones  a',
'                 where id_pryccion = :P41_ID_PRYCCION;',
'            else',
'                v_nmro_ctas_cnvnio := 1;',
'            end if;',
'        exception ',
'            when others then ',
'                v_nmro_ctas_cnvnio := 1;',
'        end;',
'        ',
'    end if;',
'    ',
'    if v_fcha_prmra_cta is null then ',
'        begin',
'            if :P41_ID_PRYCCION is not null then ',
'                select a.fcha_prmra_cta',
'                  into v_fcha_prmra_cta',
'                 from gf_g_proyecciones  a',
'                 where id_pryccion = :P41_ID_PRYCCION;            ',
'            end if;',
'        end;',
'    end if;',
'    ',
'    if v_cdgo_prdcdad_cta is null then ',
'        begin',
'            if :P41_ID_PRYCCION is not null then',
'               select a.cdgo_prdcdad_cta',
'                 into v_cdgo_prdcdad_cta',
'                 from gf_g_proyecciones  a',
'                where id_pryccion = :P41_ID_PRYCCION;',
'            else ',
'                v_cdgo_prdcdad_cta := ''MNS'';',
'            end if;',
'        exception ',
'            when others then ',
'                v_cdgo_prdcdad_cta := ''MNS'';',
'        end;',
'    end if; ',
'    ',
'    if v_fcha_slctud is null then         ',
'        v_fcha_slctud := to_date(sysdate,''DD/MM/YYYY'');',
'    end if; ',
'    ',
'    pkg_gf_convenios.prc_gn_convenio_extracto (p_cdgo_clnte          => :F_CDGO_CLNTE ,',
'                                               p_id_ssion            => :APP_SESSION ,',
'                                               p_id_sjto_impsto      => :P41_ID_SJTO_IMPSTO ,',
'                                               p_id_cnvnio_tpo       => :P41_ID_CNVNIO_TPO ,',
'                                               p_fcha_slctud         => v_fcha_slctud,',
'                                               p_nmro_ctas           => v_nmro_ctas_cnvnio ,',
'                                               p_fcha_prmra_cta      => v_fcha_prmra_cta ,',
'                                               p_cdgo_prdcdad_cta    => v_cdgo_prdcdad_cta ,',
'                                               p_vlor_cta_incial     => :P53_VLOR_CTA_INCIAL ,',
'                                               p_prcntje_cta_incial  => :P53_CTA_INCIAL_PRCNTJE_VGNCIA,',
'                                               p_cdna_vgncia_prdo    => :P43_VGNCIA_PRDO ,',
'                                               p_indcdor_inslvncia   => :P43_INSLVNCIA,',
'                                               p_indcdor_clcla_intres=> :P43_CLCLA_INTRES ,',
'                                               p_fcha_cngla_intres    => :P43_FCHA_CNGLA_INTRES ,',
'                                               p_cdgo_rspsta         => v_cdgo_rspsta ,',
'                                               p_mnsje_rspsta        => v_mnsje_rspsta );',
'    if v_cdgo_rspsta = 0  or v_cdgo_rspsta is null then ',
'        :P44_RSPSTA := ''Plan de Pago generado exitosamente'';',
'        :P114_CDGO_RSPSTA    := nvl(v_cdgo_rspsta,0);',
'    else',
'        :P44_RSPSTA          := v_mnsje_rspsta;',
'        :P114_CDGO_RSPSTA    := v_cdgo_rspsta;',
'        delete from gn_g_temporal where id_ssion = :APP_SESSION; commit;',
'        apex_error.add_error(p_message          => v_mnsje_rspsta,',
'                             p_display_location => apex_error.c_inline_in_notification );',
'    end if;',
'',
'end;'))
,p_process_error_message=>'&P44_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
