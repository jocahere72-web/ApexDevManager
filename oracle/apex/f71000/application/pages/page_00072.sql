prompt --application/pages/page_00072
begin
wwv_flow_api.create_page(
 p_id=>72
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Generaci\00F3n Acuerdo- Resumen Proyecci\00F3n')
,p_step_title=>unistr('Generaci\00F3n Acuerdo- Resumen Proyecci\00F3n')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id) {',
'  if ($("#" + id).attr("aria-expanded") == "true") {',
'    $("#" + id).click();',
'  }',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'buttonCollapse(''t_Button_rightControlButton'');',
'',
'console.log()',
''))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JGONZALEZ'
,p_last_upd_yyyymmddhh24miss=>'20230804153940'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94451468677059577)
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
 p_id=>wwv_flow_api.id(50981176616826201)
,p_plug_name=>'<b>SUJETO TRIBUTO</b>'
,p_parent_plug_id=>wwv_flow_api.id(94451468677059577)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(51328002343001703)
,p_plug_name=>'<b>DATOS DEL ACUERDO</b>'
,p_parent_plug_id=>wwv_flow_api.id(94451468677059577)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(140704845536987198)
,p_plug_name=>'Plan de Pago'
,p_parent_plug_id=>wwv_flow_api.id(51328002343001703)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select n001 nmro_cta, ',
'        N004 vlor_cptal,',
'        n005 vlor_intres,',
'        n003 vlor_fnccion,',
'        n002 vlor_cta, ',
'        d001 fcha_cta',
'  from gn_g_temporal ',
'  where id_ssion = :APP_SESSION',
' order by n001'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
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
 p_id=>wwv_flow_api.id(100075699967944098)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'<b>&P44_RSPSTA.</b>'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>100075699967944098
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(50999427314993275)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>20
,p_column_identifier=>'F'
,p_column_label=>unistr('N\00B0 Cuota')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122431922047633420)
,p_db_column_name=>'FCHA_CTA'
,p_display_order=>40
,p_column_identifier=>'K'
,p_column_label=>'Fecha Vencimiento <br> Cuota'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122432049098633421)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>50
,p_column_identifier=>'L'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122432127174633422)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>60
,p_column_identifier=>'M'
,p_column_label=>unistr('Valor Inter\00E9s')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122432210065633423)
,p_db_column_name=>'VLOR_FNCCION'
,p_display_order=>70
,p_column_identifier=>'N'
,p_column_label=>unistr('Valor Financiaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(50999858025993275)
,p_db_column_name=>'VLOR_CTA'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Valor Cuota'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(141980615967500076)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'510006'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CTA:FCHA_CTA:VLOR_CPTAL:VLOR_INTRES:VLOR_FNCCION:VLOR_CTA:'
,p_sum_columns_on_break=>'VLOR_CTA:VLOR_CPTAL:VLOR_INTRES'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94988997524414227)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>60
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(141062873836123475)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>70
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
'        <b> <center> Paso 5 Resumen </center> </b> <br>',
unistr('        Se muestra toda la informaci\00F3n del sujeto tributo seleccionado. <br> <br>'),
unistr('        Se muestra todos los datos de la proyecci\00F3n. <br> <br>'),
unistr('        Se muestra la informaci\00F3n del extracto de pago.<br>'),
'        Permite descargar el documento de pago de la cuota inicial.<br>',
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73549342170728612)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(51328002343001703)
,p_button_name=>'BTN_IMPRIMIR_CUOTA_INICIAL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Imprimir Cuota Inicial'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_exge_cta_incial        varchar2(1);',
'    v_dcmnto_pgdo            varchar2(1);',
'begin',
'    ',
'    begin',
'    ',
'        select a.indcdor_exge_cta_incial',
'          into v_exge_cta_incial ',
'          from gf_d_convenios_tipo a ',
'         where a.id_cnvnio_tpo = :P41_ID_CNVNIO_TPO;',
'     exception',
'         when no_data_found then',
'             v_exge_cta_incial := ''N'';',
'     end;',
'     ',
'     begin',
'     ',
'         select a.indcdor_pgo_aplcdo',
'          into v_dcmnto_pgdo',
'          from re_g_documentos a',
'          join gf_g_proyecciones b on a.id_dcmnto = b.id_dcmnto_cta_incial',
'         where b.id_pryccion = :P41_ID_PRYCCION;',
'      exception',
'         when no_data_found then',
'             v_dcmnto_pgdo := ''N'';',
'     end;',
'     ',
'     if(v_exge_cta_incial = ''S'') then',
'         if(v_dcmnto_pgdo = ''S'') then',
'             return false;',
'         else',
'             return true;',
'         end if;',
'     else',
'         return false;',
'     end if;',
'',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(50997592265993269)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(94451468677059577)
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
 p_id=>wwv_flow_api.id(50998332639993270)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(94451468677059577)
,p_button_name=>'BTN_FINALIZAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Finalizar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 ',
'      from gf_d_convenios_tipo a ',
'     where a.id_cnvnio_tpo = :P41_ID_CNVNIO_TPO ',
'       and (a.indcdor_exge_cta_incial= ''N''',
'       or :F_ID_DCMNTO is not null)'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(50997962904993270)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(94451468677059577)
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
 p_id=>wwv_flow_api.id(51328679135001709)
,p_branch_name=>unistr('Ir a P\00E1gina 44 - Previous')
,p_branch_action=>'f?p=&APP_ID.:44:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(50997962904993270)
,p_branch_sequence=>50
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(50985635723826246)
,p_branch_name=>unistr('Ir a la p\00E1gina 71 - Finalizar')
,p_branch_action=>'f?p=&APP_ID.:71:&SESSION.::&DEBUG.:RP,41,43,53,44,72::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(50998332639993270)
,p_branch_sequence=>60
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(49861955460389017)
,p_branch_name=>'Go To Page 72'
,p_branch_action=>'f?p=&APP_ID.:72:&SESSION.:BTN_IMPRIMIR_CUOTA_INICIAL:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(73549342170728612)
,p_branch_sequence=>70
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33174694011297718)
,p_name=>'P72_VLOR_CTA_INCIAL_MSTRAR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(51328002343001703)
,p_prompt=>'Valor Cuota Inicial'
,p_source=>'P53_VLOR_CTA_INCIAL_MSTRAR'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47972494817622309)
,p_name=>'P72_JSON_ARRAY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(50981176616826201)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49861579780389013)
,p_name=>'P72_ID_DCMNTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(50981176616826201)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50981402802826204)
,p_name=>'P72_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(50981176616826201)
,p_use_cache_before_default=>'NO'
,p_source=>'P41_ID_SJTO_IMPSTO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50981596400826205)
,p_name=>'P72_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(50981176616826201)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Identificaci\00F3n')
,p_source=>'P41_IDNTFCCION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50981698369826206)
,p_name=>'P72_ID_CNVNIO_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(50981176616826201)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de Acuerdo'
,p_source=>'P41_ID_CNVNIO_TPO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_CONVENIO_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       ID_CNVNIO_TPO as r',
'  from gf_d_convenios_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50981707000826207)
,p_name=>'P72_DRCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(50981176616826201)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Direcci\00F3n')
,p_source=>'P41_DRCCION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50983034555826220)
,p_name=>'P72_RSPSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(50981176616826201)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50985913983826249)
,p_name=>'P72_VLOR_CTA_INCIAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(51328002343001703)
,p_source=>'P53_VLOR_CTA_INCIAL'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select id_cnvnio_tpo ',
'  from gf_d_convenios_tipo a ',
' where a.id_cnvnio_tpo = :P41_ID_CNVNIO_TPO ',
'   and a.indcdor_exge_cta_incial= ''S'''))
,p_display_when_type=>'EXISTS'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50986001743826250)
,p_name=>'P72_FCHA_PGO_CTA_INCIAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(51328002343001703)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr(' Fecha L\00EDmite Pago ')
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'P53_FCHA_PGO_CTA_INCIAL'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select id_cnvnio_tpo ',
'  from gf_d_convenios_tipo a ',
' where a.id_cnvnio_tpo = :P41_ID_CNVNIO_TPO ',
'   and a.indcdor_exge_cta_incial= ''S'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51328172058001704)
,p_name=>'P72_FCHA_PRMRA_CTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(51328002343001703)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Primera Cuota'
,p_source=>'P44_FCHA_PRMRA_CTA'
,p_source_type=>'ITEM'
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
 p_id=>wwv_flow_api.id(51328265043001705)
,p_name=>'P72_NMRO_CTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(51328002343001703)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00B0 Cuotas')
,p_source=>'P44_NMRO_CTAS'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51328369502001706)
,p_name=>'P72_CDGO_PRDCDAD'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(51328002343001703)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Periodicidad'
,p_source=>'P44_CDGO_PRDCDAD_CTA'
,p_source_type=>'ITEM'
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
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52514652656153531)
,p_name=>'P72_NMRO_PRYCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(50981176616826201)
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
 p_id=>wwv_flow_api.id(52514988453153534)
,p_name=>'P72_NMRO_DCMNTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(50981176616826201)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74131737264629135)
,p_name=>'P72_ID_RPRTE_CTA_INCIAL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(51328002343001703)
,p_prompt=>'Plantilla Cuota Inicial'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_rprte d ,',
'        id_rprte r',
'   from gn_d_reportes',
'  where cdgo_rprte_grpo = ''RPG'';'))
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select id_cnvnio_tpo ',
'  from gf_d_convenios_tipo a ',
' where a.id_cnvnio_tpo = :P41_ID_CNVNIO_TPO ',
'   and a.indcdor_exge_cta_incial= ''S'''))
,p_display_when_type=>'EXISTS'
,p_read_only_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione el documento de pago.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73549454138728613)
,p_validation_name=>'Reporte de Cuota Inicial no Nulo'
,p_validation_sequence=>20
,p_validation=>'P72_ID_RPRTE_CTA_INCIAL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un reporte para Generar la cuota Inicial'
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(74131737264629135)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73549550229728614)
,p_validation_name=>'Generar Cuota Inicial'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_dcmnto_cta_incial',
'  from gf_g_proyecciones ',
' where id_pryccion = :P41_ID_PRYCCION;'))
,p_validation_type=>'EXISTS'
,p_error_message=>'Primero debe generar el documento de cuota inicial'
,p_validation_condition=>'P72_NMRO_PRYCCION'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(50998332639993270)
,p_associated_item=>wwv_flow_api.id(74131737264629135)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(49862391037389021)
,p_name=>'al hacer clic en imprimir'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(73549342170728612)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49862419757389022)
,p_event_id=>wwv_flow_api.id(49862391037389021)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function imprimir(){',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        var data = await apex.server.process(''GenerarDocumento'', { pageItems: ''#P72_VLOR_CTA_INCIAL,#P72_JSON_ARRAY,#P72_FCHA_PGO_CTA_INCIAL,#P72_ID_RPRTE_CTA_INCIAL'' });',
'        let a = document.createElement("a");',
'        document.body.appendChild(a);',
'        let v_blob = await fecth_async(data.url_reporte);',
'        let v_url = window.URL.createObjectURL(v_blob);',
'        a.download = data.nmbre_rprte;',
'        a.href = v_url;',
'        a.click();',
'        document.body.removeChild(a);',
'        window.URL.revokeObjectURL(v_url);',
'        window.open(data.url, ''_self'');',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        if($waitPopup) $waitPopup.remove();',
'    }     ',
'}',
'',
' function fecth_async(url) {',
'        var miInit = {',
'            method: "GET",',
'            cache: "default"',
'        };',
'        return fetch(url, miInit).then(resp => {',
'            return resp.blob();',
'        });',
'    }',
' ',
'',
'imprimir();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(52514500694153530)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Actualizar Proyecci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_pryccion    number;',
'    v_nmro_pryccion  number;',
'    v_mnsje          varchar2(2000);',
'    ',
'begin',
'    pkg_gf_convenios.prc_ac_proyeccion(p_cdgo_clnte 			=> :F_CDGO_CLNTE,',
'							           p_id_pryccion			=> :P41_ID_PRYCCION,',
'                                       p_id_impsto              => :P41_ID_IMPSTO,',
'                                       p_id_impsto_sbmpsto      => :P41_ID_IMPSTO_SBMPSTO,',
'							           p_id_sjto_impsto		    => :P72_ID_SJTO_IMPSTO ,',
'							           p_id_cnvnio_tpo		    => :P72_ID_CNVNIO_TPO ,',
'							           p_nmro_cta				=> :P44_NMRO_CTAS ,',
'							           p_cdgo_prdcdad_cta		=> :P44_CDGO_PRDCDAD_CTA ,',
'							           p_fcha_prmra_cta 		=> :P44_FCHA_PRMRA_CTA ,',
'							           p_id_usrio       		=> :F_ID_USRIO ,',
'                                       p_vlor_cta_incial		=> :P72_VLOR_CTA_INCIAL,',
'                                       p_prcntje_cta_incial     => :P53_CTA_INCIAL_PRCNTJE_VGNCIA,',
'								       p_fcha_lmte_cta_incial	=> :P72_FCHA_PGO_CTA_INCIAL,',
'							           p_vgncia_prdo			=> :P43_VGNCIA_PRDO ,',
'							           p_nmro_pryccion			=> :P41_NMRO_PRYCCION,',
'                                       p_indcdor_inslvncia      => nvl(:P43_INSLVNCIA, ''N''),',
'                                       p_indcdor_clcla_intres   => NVL(:P43_CLCLA_INTRES, ''S'') ,',
'                                       p_fcha_cngla_intres      => :P43_FCHA_CNGLA_INTRES ,  ',
'                                       p_fcha_rslcion           => :P43_FCHA_RSLCION , ',
'                                       p_nmro_rslcion           => :P43_NMRO_RSLCION , ',
'                                       p_mnsje					=> v_mnsje);',
'    :P72_RSPSTA := v_mnsje;',
'    update gf_g_proyecciones set id_dcmnto_cta_incial = :F_ID_DCMNTO where id_pryccion = :P41_ID_PRYCCION;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(50998332639993270)
,p_process_when=>'P41_ID_PRYCCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'&P72_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(50982909391826219)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Crear Proyecci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_pryccion    number;',
'    v_nmro_pryccion  number;',
'    v_mnsje          varchar2(2000);',
'    ',
'begin',
'    pkg_gf_convenios.prc_rg_proyeccion(p_cdgo_clnte 			=> :F_CDGO_CLNTE,',
'                                       p_id_impsto              => :P41_ID_IMPSTO,',
'                                       p_id_impsto_sbmpsto      => :P41_ID_IMPSTO_SBMPSTO,',
'							           p_id_sjto_impsto		    => :P41_ID_SJTO_IMPSTO ,',
'							           p_id_cnvnio_tpo		    => :P41_ID_CNVNIO_TPO ,',
'							           p_nmro_cta				=> :P44_NMRO_CTAS ,',
'							           p_cdgo_prdcdad_cta		=> :P44_CDGO_PRDCDAD_CTA ,',
'							           p_fcha_prmra_cta 		=> :P44_FCHA_PRMRA_CTA ,',
'							           p_id_usrio       		=> :F_ID_USRIO ,',
'                                       p_vlor_cta_incial		=> :P72_VLOR_CTA_INCIAL,',
'								       p_fcha_lmte_cta_incial	=> :P72_FCHA_PGO_CTA_INCIAL,',
'							           p_vgncia_prdo			=> :P43_VGNCIA_PRDO,',
'                                       p_indcdor_inslvncia      => nvl(:P43_INSLVNCIA, ''N''),',
'                                       p_indcdor_clcla_intres   => NVL(:P43_CLCLA_INTRES, ''S'') ,',
'                                       p_fcha_cngla_intres      => :P43_FCHA_CNGLA_INTRES ,  ',
'                                       p_fcha_rslcion           => :P43_FCHA_RSLCION , ',
'                                       p_nmro_rslcion           => :P43_NMRO_RSLCION , ',
'                                       p_id_ssion               => :APP_SESSION,',
'							           p_id_pryccion			=> :P41_ID_PRYCCION,',
'							           p_nmro_pryccion			=> v_nmro_pryccion,',
'							           p_mnsje					=> v_mnsje);',
'    :P72_RSPSTA := v_mnsje;',
'    update gf_g_proyecciones set id_dcmnto_cta_incial = :F_ID_DCMNTO where id_pryccion = :P41_ID_PRYCCION;',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(50998332639993270)
,p_process_when=>'P41_ID_PRYCCION'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>'&P72_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(50163846420213301)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Borrar Documento'
,p_process_sql_clob=>':F_ID_DCMNTO := NULL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BORRAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73242781540000683)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GenerarDocumento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_id_dcmnto            re_g_documentos.id_dcmnto%type;',
'v_vlor_ttal_dcmnto     number;',
'',
'begin',
'    v_vlor_ttal_dcmnto := :P72_VLOR_CTA_INCIAL;',
'    ',
'    begin',
'    ',
'    select JSON_OBJECT (''VGNCIA_PRDO''   value JSON_ARRAYAGG(',
'           JSON_OBJECT (''vgncia''    value vgncia,',
'                        ''prdo''      value prdo,',
'                        ''id_orgen''  value id_orgen))) vgncias_prdo',
'      into :P72_JSON_ARRAY',
'      from ( select vgncia',
'                ,   prdo',
'                ,   cdgo_mvmnto_orgn',
'                ,   id_orgen',
'              ',
'                               from v_gf_g_cartera_x_vigencia       a',
'                               join table( pkg_gn_generalidades.fnc_ca_split_table ( p_cdna           => :P43_VGNCIA_PRDO ',
'                                                                                   , p_crcter_dlmtdor => '':'')) b on b.cdna is not null ',
'                                and (a.vgncia||a.prdo||a.cdgo_mvmnto_orgn||id_orgen) = b.cdna',
'                              where id_sjto_impsto  = :P41_ID_SJTO_IMPSTO',
'           group by vgncia',
'                ,   prdo',
'                ,   cdgo_mvmnto_orgn',
'                ,   id_orgen);',
'    exception',
'        when others then',
'            null;',
'    end;',
'    ',
'    v_id_dcmnto := pkg_re_documentos.fnc_gn_documento (p_cdgo_clnte 			=> :F_CDGO_CLNTE, ',
'                                                       p_id_impsto 			    => :P41_ID_IMPSTO, ',
'                                                       p_id_impsto_sbmpsto 	    => :P41_ID_IMPSTO_SBMPSTO, ',
'                                                       p_cdna_vgncia_prdo		=> :P72_JSON_ARRAY,',
'							                           p_cdna_vgncia_prdo_ps	=> null,',
'							                           p_id_dcmnto_lte		    => null,',
'                                                       p_id_sjto_impsto         => :P41_ID_SJTO_IMPSTO,',
'                                                       p_fcha_vncmnto			=> :P72_FCHA_PGO_CTA_INCIAL,',
'                                                       p_cdgo_dcmnto_tpo        => ''DAB'',',
'                                                       p_nmro_dcmnto            => null,',
'                                                       p_vlor_ttal_dcmnto       => v_vlor_ttal_dcmnto,',
'                                                       p_indcdor_entrno         => ''PRVDO'',',
'                                                       p_indcdor_aplca_dscnto_cnvnio 	=> :P53_INDCDOR_APLCA_DSCNTO,',
'                                                       p_indcdor_cnvnio         => ''S'',',
'                                                       p_id_cnvnio_tpo          => :P41_ID_CNVNIO_TPO,',
'                                                       p_cta_incial_prcntje_vgncia => :P53_CTA_INCIAL_PRCNTJE_VGNCIA,',
'                                                       p_indcdor_inslvncia       => nvl(:P43_INSLVNCIA,''N''),',
'                                                       p_indcdor_clcla_intres    => nvl(:P43_CLCLA_INTRES,''S''),',
'                                                       p_fcha_cngla_intres       => :P43_FCHA_CNGLA_INTRES); ',
' ',
'    if v_id_dcmnto  > 0  then ',
'         :F_ID_DCMNTO := to_number(v_id_dcmnto);',
'         select nmro_dcmnto into :P72_NMRO_DCMNTO from re_g_documentos where id_dcmnto = :F_ID_DCMNTO;',
'         update gf_g_proyecciones set id_dcmnto_cta_incial = :F_ID_DCMNTO where id_pryccion = :P41_ID_PRYCCION;',
'    end if;',
'    ',
'    ',
'    apex_json.open_object; ',
'    apex_json.write(''url_reporte'', apex_util.prepare_url( p_url => ''f?p=66000:2:''||:APP_SESSION||''::no::P2_ID_RPRTE,P2_XML,P2_NMBRE_RPRTE:'' || :P72_ID_RPRTE_CTA_INCIAL || '',<P_ID_DCMNTO>'' || :F_ID_DCMNTO  ||''</P_ID_DCMNTO>,DOCUMENTO_'' || :P72_NMRO_DC'
||'MNTO ));',
'    apex_json.write(''nmbre_rprte'', ''DOCUMENTO_'' || :P72_NMRO_DCMNTO || ''.pdf'');',
'    apex_json.write(''url'', apex_util.prepare_url( p_url => ''f?p=71000:72:''||:APP_SESSION||'':BTN_IMPRIMIR_CUOTA_INICIAL:no::''));',
'    apex_json.close_object;    ',
'end;',
'',
''))
,p_process_error_message=>'Error al generar el documento, por favor consulte con el adiministrador'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(73549342170728612)
,p_process_success_message=>unistr('<br> Documento Generado Exitosamente N\00B0 &P53_NMRO_DCMNTO.')
);
end;
/
