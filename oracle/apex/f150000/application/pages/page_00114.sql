prompt --application/pages/page_00114
begin
wwv_flow_api.create_page(
 p_id=>114
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Plan de Pago - Proyecci\00F3n de Acuerdos')
,p_step_title=>unistr('Plan de Pago - Proyecci\00F3n de Acuerdos')
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
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200710081431'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(116376923425280386)
,p_plug_name=>'Datos del Convenio'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall:t-Form--large'
,p_plug_template=>wwv_flow_api.id(252183924525651399)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(72870253246195914)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(252197199379651439)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(116377006141280386)
,p_plug_name=>'Datos del Convenio'
,p_parent_plug_id=>wwv_flow_api.id(116376923425280386)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252169105903651390)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(162630300285208007)
,p_plug_name=>unistr('Proyecci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(116376923425280386)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
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
 p_id=>wwv_flow_api.id(122001154716164907)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'&P114_RSPSTA.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>122001154716164907
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72933264688214091)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>20
,p_column_identifier=>'F'
,p_column_label=>unistr('N\00B0 Cuota')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72934072807214091)
,p_db_column_name=>'FCHA_CTA'
,p_display_order=>170
,p_column_identifier=>'AK'
,p_column_label=>'Fecha Vencimiento <br> Cuota'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72932094651214090)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>180
,p_column_identifier=>'AL'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72932425467214090)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>190
,p_column_identifier=>'AM'
,p_column_label=>'Valor Interes'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72932854020214090)
,p_db_column_name=>'VLOR_FNCNCION'
,p_display_order=>200
,p_column_identifier=>'AN'
,p_column_label=>unistr('Valor Financiaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72933650645214091)
,p_db_column_name=>'VLOR_CTA'
,p_display_order=>210
,p_column_identifier=>'AJ'
,p_column_label=>'Valor Cuota'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(163906070715720885)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'729344'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CTA:FCHA_CTA:VLOR_CPTAL:VLOR_INTRES:VLOR_FNCNCION:VLOR_CTA:'
,p_sum_columns_on_break=>'VLOR_CTA:VLOR_CPTAL:VLOR_INTRES:VLOR_FNCNCION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(117595820485594879)
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
 p_id=>wwv_flow_api.id(72924704206214082)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(116377006141280386)
,p_button_name=>'BTN_PROYECTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary:t-Button--iconRight:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Actualizar Plan de Pago'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72923234952214076)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(116376923425280386)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Salir de la Funcionalidad?, Tenga en Cuenta Pueden Perderse los Datos.'',''CANCEL'')'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72923692663214076)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(116376923425280386)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72924071108214076)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(116376923425280386)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(252201877336651464)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(72939653748214099)
,p_branch_name=>unistr('Ir a la P\00E1gina 115 - Resumen')
,p_branch_action=>'f?p=&APP_ID.:115:&SESSION.:BORRAR:&DEBUG.:115:P115_VLOR_CTA_INCIAL:&P114_VLOR_CTA_INCIAL.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72923692663214076)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(72938896768214099)
,p_branch_name=>unistr('Ir a la P\00E1gina 114 - Plan de Pago')
,p_branch_action=>'f?p=&APP_ID.:114:&SESSION.:PROYECTAR:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72924704206214082)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(70821892104843739)
,p_branch_name=>unistr('Ir a la P\00E1gina 110 - Inicio')
,p_branch_action=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:RP,111,112,113,114,115::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72923234952214076)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(72939276886214099)
,p_branch_name=>unistr('Ir a la P\00E1gina 113 - Cuota Inicial')
,p_branch_action=>'f?p=&APP_ID.:113:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72924071108214076)
,p_branch_sequence=>10
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select id_cnvnio_tpo ',
'  from gf_d_convenios_tipo a ',
' where a.id_cnvnio_tpo = :P111_ID_CNVNIO_TPO ',
'   and a.indcdor_exge_cta_incial= ''S'''))
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(72938429394214099)
,p_branch_name=>unistr('Ir a la P\00E1gina 112 - Cartera')
,p_branch_action=>'f?p=&APP_ID.:112:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72924071108214076)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70821449183843735)
,p_name=>'P114_CDGO_RSPSTA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(116377006141280386)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72925199914214082)
,p_name=>'P114_NMRO_PRYCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(116377006141280386)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00B0 Proyecci\00F3n')
,p_source=>'P111_NMRO_PRYCCION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P111_ID_PRYCCION'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72925548293214083)
,p_name=>'P114_FCHA_SLCTUD'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(116377006141280386)
,p_prompt=>'Fecha Solicitud'
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'sysdate'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_field_template=>wwv_flow_api.id(252201624512651457)
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
 p_id=>wwv_flow_api.id(72926422819214083)
,p_name=>'P114_FCHA_MXMO_CTAS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(116377006141280386)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Fecha L\00EDmite de Cuotas')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  FCHA_MXMA_CTAS',
'  from gf_d_convenios_tipo ',
'  where id_cnvnio_tpo = :P111_ID_CNVNIO_TPO'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Muestra la fecha l\00EDmite para proyectar las cuotas (incluyendo la cuota inicial) del acuerdo de pago, donde esta es la m\00E1xima fecha de vencimiento de la \00FAltima cuota y es establecida seg\00FAn el tipo de acuerdo de pago.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72927325163214083)
,p_name=>'P114_FCHA_PRMRA_CTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(116377006141280386)
,p_prompt=>'Fecha Primera Cuota'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P111_ID_PRYCCION is not null then ',
'      select fcha_prmra_cta ',
'      into :P114_FCHA_PRMRA_CTA',
'      from gf_g_proyecciones  where id_pryccion = :P111_ID_PRYCCION;',
'elsif :P113_FCHA_PGO_CTA_INCIAL is not null  then ',
'    :P114_FCHA_PRMRA_CTA := to_date(:P113_FCHA_PGO_CTA_INCIAL) + 1;',
'else',
'    :P114_FCHA_PRMRA_CTA := last_day(sysdate);',
'end if;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha en la cual se realizar\00E1 el pago de la cuota inicial del acuerdo de pago.')
,p_attribute_02=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72928219886214086)
,p_name=>'P114_NMRO_MXMO_CTAS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(116377006141280386)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('M\00E1ximo de Cuotas')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmro_mxmo_ctas ',
'   from gf_d_convenios_tipo ',
'  where id_cnvnio_tpo = :P111_ID_CNVNIO_TPO'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>15
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('El n\00FAmero de cuotas para pagar el acuerdo de pago no puede ser superior al n\00FAmero m\00E1ximo de cuotas.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72929144721214087)
,p_name=>'P114_NMRO_CTAS'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(116377006141280386)
,p_item_default=>'1'
,p_prompt=>unistr('N\00B0 Cuotas')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmro_cta',
'   from gf_g_proyecciones',
'  where id_pryccion = :P111_ID_PRYCCION;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_tag_attributes=>' onkeypress="return  validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('N\00FAmero de cuotas en las que va a dividir el monto total del acuerdo de pago.')
,p_attribute_01=>'1'
,p_attribute_02=>'&P114_NMRO_MXMO_CTAS.'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72930012687214088)
,p_name=>'P114_CDGO_PRDCDAD_CTA'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(116377006141280386)
,p_item_default=>'MNS'
,p_prompt=>'Periodicidad Cuota'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_prdcdad_cta',
'   from gf_g_proyecciones',
'  where id_pryccion = :P111_ID_PRYCCION;'))
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
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Frecuencia en la cual se pagar\00E1n las cuotas del acuerdo de pago.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72930942466214089)
,p_name=>'P114_RSPSTA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(116377006141280386)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72931312219214089)
,p_name=>'P114_VLOR_CTA_INCIAL'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(116377006141280386)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72935239172214093)
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
,p_when_button_pressed=>wwv_flow_api.id(72923692663214076)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72935606711214093)
,p_validation_name=>unistr('Fecha Solicitud H\00E1bil ')
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_hbil    varchar2(1);',
'    ',
'begin',
'    v_hbil := pk_util_calendario.fnc_cl_fecha_habil(:F_CDGO_CLNTE, :P114_FCHA_SLCTUD);',
'',
'    if v_hbil = ''S'' then ',
'        return true;',
'    else',
'        return false;',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('La fecha de Solicitud seleccionada no es H\00E1bil')
,p_associated_item=>wwv_flow_api.id(72925548293214083)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72936007394214093)
,p_validation_name=>unistr('Fecha Primera Cuota H\00E1bil')
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_hbil    varchar2(1);',
'    ',
'begin',
'    v_hbil := pk_util_calendario.fnc_cl_fecha_habil(:F_CDGO_CLNTE, :P114_FCHA_PRMRA_CTA);',
'',
'    if v_hbil = ''S'' then ',
'        return true;',
'    else',
'        return false;',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('La fecha de la primera cuota seleccionada no es H\00E1bil')
,p_associated_item=>wwv_flow_api.id(72927325163214083)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72936402592214093)
,p_validation_name=>'Fecha Mayor que la fecha de pago limite de pago de la cuota inicial'
,p_validation_sequence=>50
,p_validation=>'to_date(:P114_FCHA_PRMRA_CTA) > to_date(:P113_FCHA_PGO_CTA_INCIAL)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La fecha de la primera cuota debe ser mayor que la fecha limite de pago de la cuota inicial. [Fecha Limite de pago de cuota inicial &P113_FCHA_PGO_CTA_INCIAL.]'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(72927325163214083)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70821982538843740)
,p_validation_name=>'Validar datos del plan de pagos estan actualizados'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmro_ctas         number;',
'    v_fcha_prmra_cta    date;',
'    ',
'begin',
'   select max(n001)',
'        , min(to_date(d001))',
'     into v_nmro_ctas',
'        , v_fcha_prmra_cta',
'  from gn_g_temporal ',
'  where id_ssion = :APP_SESSION;',
' ',
'    if v_nmro_ctas <> :P114_NMRO_CTAS then',
'        return ''El Plan de pago no esta actualizado, el numero de cuotas no correponde'';',
'    elsif trunc(v_fcha_prmra_cta) !=  :P114_FCHA_PRMRA_CTA then ',
unistr('        return ''El Plan de pago no esta actualizado, la fecha de la primera cuota ['' || :P114_FCHA_PRMRA_CTA|| ''] no correponde a la fecha de vencimiento de la cuota N\00B0 1 ['' || v_fcha_prmra_cta  || '']'';'),
'    end if;        ',
' end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_api.id(72923692663214076)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72937122677214096)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta de los datos de la proyecci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select fcha_prmra_cta,',
'        nmro_cta,',
'        cdgo_prdcdad_cta,',
'        trunc(fcha_pryccion)',
'   into :P114_FCHA_PRMRA_CTA,',
'        :P114_NMRO_CTAS,',
'        :P114_CDGO_PRDCDAD_CTA,',
'        :P114_FCHA_SLCTUD',
'   from gf_g_proyecciones ',
'  where id_pryccion = :P111_ID_PRYCCION;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P111_ID_PRYCCION is not null and :request is null'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72937958674214098)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Generaci\00F3n del Plan de pago')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    ',
'    v_cdgo_rspsta       number;',
'    v_mnsje_rspsta      varchar2(1000);',
'    v_fcha_prmra_cta    gf_g_convenios.fcha_prmra_cta%type      := :P114_FCHA_PRMRA_CTA;',
'    v_cdgo_prdcdad_cta  gf_g_convenios.cdgo_prdcdad_cta%type    := :P114_CDGO_PRDCDAD_CTA;',
'    v_nmro_ctas_cnvnio  gf_g_convenios.nmro_cta%type            := :P114_NMRO_CTAS;',
'    v_fcha_slctud       date                                    := trunc(to_date(:P114_FCHA_SLCTUD));',
'    ',
'begin',
'    delete from gn_g_temporal where id_ssion = :APP_SESSION; commit;',
'    if v_nmro_ctas_cnvnio is null then ',
'        begin',
'            if :P111_ID_PRYCCION is not null then ',
'                select a.nmro_cta',
'                  into v_nmro_ctas_cnvnio',
'                 from gf_g_proyecciones  a',
'                 where id_pryccion = :P111_ID_PRYCCION;',
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
'            if :P111_ID_PRYCCION is not null then ',
'                select a.fcha_prmra_cta',
'                  into v_fcha_prmra_cta',
'                 from gf_g_proyecciones  a',
'                 where id_pryccion = :P111_ID_PRYCCION;',
'            end if;',
'        end;',
'    end if;',
'    ',
'    if v_cdgo_prdcdad_cta is null then ',
'        begin',
'            if :P111_ID_PRYCCION is not null then',
'               select a.cdgo_prdcdad_cta',
'                 into v_cdgo_prdcdad_cta',
'                 from gf_g_proyecciones  a',
'                where id_pryccion = :P111_ID_PRYCCION;',
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
'                                               p_id_sjto_impsto      => :P111_ID_SJTO_IMPSTO ,',
'                                               p_id_cnvnio_tpo       => :P111_ID_CNVNIO_TPO ,',
'                                               p_fcha_slctud         => v_fcha_slctud,',
'                                               p_nmro_ctas           => v_nmro_ctas_cnvnio ,',
'                                               p_fcha_prmra_cta      => v_fcha_prmra_cta ,',
'                                               p_cdgo_prdcdad_cta    => v_cdgo_prdcdad_cta ,',
'                                               p_vlor_cta_incial     => :P113_VLOR_CTA_INCIAL ,',
'                                               p_prcntje_cta_incial  => :P113_CTA_INCIAL_PRCNTJE_VGNCIA,',
'                                               p_cdna_vgncia_prdo    => :P112_VGNCIA_PRDO ,',
'                                               p_cdgo_rspsta         => v_cdgo_rspsta ,',
'                                               p_mnsje_rspsta        => v_mnsje_rspsta );',
'    if v_cdgo_rspsta = 0  or v_cdgo_rspsta is null then ',
'        :P114_RSPSTA         := ''Plan de Pago generado exitosamente'';',
'        :P114_CDGO_RSPSTA    := nvl(v_cdgo_rspsta,0);',
'    else        ',
'        :P114_RSPSTA         := v_mnsje_rspsta;',
'        :P114_CDGO_RSPSTA    := v_cdgo_rspsta;',
'        delete from gn_g_temporal where id_ssion = :APP_SESSION; commit;',
'        apex_error.add_error(p_message          => v_mnsje_rspsta,',
'                             p_display_location => apex_error.c_inline_in_notification );',
'    end if;',
'',
'end;'))
,p_process_error_message=>'&P114_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
