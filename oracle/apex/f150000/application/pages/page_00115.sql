prompt --application/pages/page_00115
begin
wwv_flow_api.create_page(
 p_id=>115
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Resumen Proyecci\00F3n - Generaci\00F3n Acuerdo')
,p_step_title=>unistr('Resumen Proyecci\00F3n - Generaci\00F3n Acuerdo')
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
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'10944674'
,p_last_upd_yyyymmddhh24miss=>'20250905095011'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(167396980646279745)
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
 p_id=>wwv_flow_api.id(123926688586046369)
,p_plug_name=>'<b>SUJETO TRIBUTO</b>'
,p_parent_plug_id=>wwv_flow_api.id(167396980646279745)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(124273514312221871)
,p_plug_name=>'<b>DATOS DEL ACUERDO</b>'
,p_parent_plug_id=>wwv_flow_api.id(167396980646279745)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
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
 p_id=>wwv_flow_api.id(213650357506207366)
,p_plug_name=>'Plan de Pago'
,p_parent_plug_id=>wwv_flow_api.id(124273514312221871)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
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
 p_id=>wwv_flow_api.id(173021211937164266)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'<b>&P114_RSPSTA.</b>'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>173021211937164266
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72955818832220195)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>20
,p_column_identifier=>'F'
,p_column_label=>unistr('N\00B0 Cuota')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72956605464220197)
,p_db_column_name=>'FCHA_CTA'
,p_display_order=>40
,p_column_identifier=>'K'
,p_column_label=>'Fecha Vencimiento <br> Cuota'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72957051343220197)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>50
,p_column_identifier=>'L'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72957441273220197)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>60
,p_column_identifier=>'M'
,p_column_label=>unistr('Valor Inter\00E9s')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72957864961220198)
,p_db_column_name=>'VLOR_FNCCION'
,p_display_order=>70
,p_column_identifier=>'N'
,p_column_label=>unistr('Valor Financiaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72956220010220197)
,p_db_column_name=>'VLOR_CTA'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Valor Cuota'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(214926127936720244)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'729582'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CTA:FCHA_CTA:VLOR_CPTAL:VLOR_INTRES:VLOR_FNCCION:VLOR_CTA:'
,p_sum_columns_on_break=>'VLOR_CTA:VLOR_CPTAL:VLOR_INTRES:VLOR_FNCCION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(167934509493634395)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
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
 p_id=>wwv_flow_api.id(214008385805343643)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
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
 p_id=>wwv_flow_api.id(72951872570220185)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(124273514312221871)
,p_button_name=>'BTN_IMPRIMIR_CUOTA_INICIAL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
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
'         where a.id_cnvnio_tpo = :P111_ID_CNVNIO_TPO;',
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
'         where b.id_pryccion = :P111_ID_PRYCCION;',
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
 p_id=>wwv_flow_api.id(72946488092220171)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(167396980646279745)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Salir de la Funcionalidad?, Tenga en Cuenta Pueden Perderse los Datos.'',''CANCEL'')'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72946889615220172)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(167396980646279745)
,p_button_name=>'BTN_FINALIZAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Finalizar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 ',
'      from gf_d_convenios_tipo a ',
'     where a.id_cnvnio_tpo = :P111_ID_CNVNIO_TPO ',
'       and (a.indcdor_exge_cta_incial= ''N''',
'       or :F_ID_DCMNTO is not null)'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72947216399220172)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(167396980646279745)
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
 p_id=>wwv_flow_api.id(72962767709220203)
,p_branch_name=>unistr('Ir a la p\00E1gina 110 - Inicio')
,p_branch_action=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:RP,111,112,113,114,115::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72946889615220172)
,p_branch_sequence=>60
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(72962375789220203)
,p_branch_name=>unistr('Ir a P\00E1gina 115 - Resumen')
,p_branch_action=>'f?p=&APP_ID.:115:&SESSION.:BTN_IMPRIMIR_CUOTA_INICIAL:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72951872570220185)
,p_branch_sequence=>70
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(72963172322220203)
,p_branch_name=>unistr('Ir a P\00E1gina 114 - Plan de Pagos')
,p_branch_action=>'f?p=&APP_ID.:114:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72947216399220172)
,p_branch_sequence=>50
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(70821518615843736)
,p_branch_name=>unistr('Ir a P\00E1gina 110 - Inicio')
,p_branch_action=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:RP,111,112,113,114,115::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72946488092220171)
,p_branch_sequence=>60
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72947970252220173)
,p_name=>'P115_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(123926688586046369)
,p_use_cache_before_default=>'NO'
,p_source=>'P111_ID_SJTO_IMPSTO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72948329195220173)
,p_name=>'P115_NMRO_DCMNTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(123926688586046369)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72948793695220173)
,p_name=>'P115_NMRO_PRYCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(123926688586046369)
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
 p_id=>wwv_flow_api.id(72949142871220178)
,p_name=>'P115_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(123926688586046369)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Identificaci\00F3n')
,p_source=>'P111_IDNTFCCION_SJTO_FRMTDA'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72949555675220179)
,p_name=>'P115_DRCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(123926688586046369)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Direcci\00F3n')
,p_source=>'P111_DRCCION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72949918588220179)
,p_name=>'P115_ID_CNVNIO_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(123926688586046369)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de Acuerdo'
,p_source=>'P111_ID_CNVNIO_TPO'
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
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72950359859220179)
,p_name=>'P115_RSPSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(123926688586046369)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72950749165220180)
,p_name=>'P115_JSON_ARRAY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(123926688586046369)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72951112001220184)
,p_name=>'P115_ID_DCMNTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(123926688586046369)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72952224222220185)
,p_name=>'P115_VLOR_CTA_INCIAL_MSTRAR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(124273514312221871)
,p_prompt=>'Valor Cuota Inicial'
,p_source=>'P113_VLOR_CTA_INCIAL_MSTRAR'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select id_cnvnio_tpo ',
'  from gf_d_convenios_tipo a ',
' where a.id_cnvnio_tpo = :P111_ID_CNVNIO_TPO ',
'   and a.indcdor_exge_cta_incial= ''S'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72952661576220185)
,p_name=>'P115_VLOR_CTA_INCIAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(124273514312221871)
,p_source=>'P113_VLOR_CTA_INCIAL'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select id_cnvnio_tpo ',
'  from gf_d_convenios_tipo a ',
' where a.id_cnvnio_tpo = :P111_ID_CNVNIO_TPO ',
'   and a.indcdor_exge_cta_incial= ''S'''))
,p_display_when_type=>'EXISTS'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72953084107220186)
,p_name=>'P115_FCHA_PGO_CTA_INCIAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(124273514312221871)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr(' Fecha L\00EDmite Pago ')
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'P113_FCHA_PGO_CTA_INCIAL'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select id_cnvnio_tpo ',
'  from gf_d_convenios_tipo a ',
' where a.id_cnvnio_tpo = :P111_ID_CNVNIO_TPO ',
'   and a.indcdor_exge_cta_incial= ''S'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72953493639220186)
,p_name=>'P115_FCHA_PRMRA_CTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(124273514312221871)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Primera Cuota'
,p_source=>'P114_FCHA_PRMRA_CTA'
,p_source_type=>'ITEM'
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
 p_id=>wwv_flow_api.id(72953840582220186)
,p_name=>'P115_NMRO_CTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(124273514312221871)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00B0 Cuotas')
,p_source=>'P114_NMRO_CTAS'
,p_source_type=>'ITEM'
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
 p_id=>wwv_flow_api.id(72954208188220193)
,p_name=>'P115_CDGO_PRDCDAD'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(124273514312221871)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Periodicidad'
,p_source=>'P114_CDGO_PRDCDAD_CTA'
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
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72954649627220194)
,p_name=>'P115_ID_RPRTE_CTA_INCIAL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(124273514312221871)
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
' where a.id_cnvnio_tpo = :P111_ID_CNVNIO_TPO ',
'   and a.indcdor_exge_cta_incial= ''S'''))
,p_display_when_type=>'EXISTS'
,p_read_only_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione el documento de pago.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72959480215220199)
,p_validation_name=>'Generar Cuota Inicial'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_dcmnto_cta_incial',
'  from gf_g_proyecciones ',
' where id_pryccion = :P111_ID_PRYCCION;'))
,p_validation_type=>'EXISTS'
,p_error_message=>'Primero debe generar el documento de cuota inicial'
,p_validation_condition=>'P115_NMRO_PRYCCION'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(72946889615220172)
,p_associated_item=>wwv_flow_api.id(72954649627220194)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(72961346122220201)
,p_name=>'al hacer clic en imprimir'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(72951872570220185)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(72961822787220201)
,p_event_id=>wwv_flow_api.id(72961346122220201)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function imprimir(){',
'        var popup = apex.widget.waitPopup();',
'        var v_app_id = $v(''pFlowId''),',
'        v_page_id = $v(''pFlowStepId''),',
'        v_session = $v(''pInstance'');',
'    try{',
'        var rs = await apex.server.process(''GenerarDocumento'', { pageItems: ''#P115_VLOR_CTA_INCIAL,#P115_JSON_ARRAY,#P115_FCHA_PGO_CTA_INCIAL,#P115_ID_RPRTE_CTA_INCIAL'' });',
'        var url = `f?p=${v_app_id}:${v_page_id}:${v_session}:APPLICATION_PROCESS=Descargar_Documento:NO:RP:::`;        ',
'        let a = document.createElement("a");',
'        document.body.appendChild(a);',
'        let v_blob = await fecth_async(url);',
'        let v_url = window.URL.createObjectURL(v_blob);',
'        a.download = ''Documento_Cuota_Inicial_'' + rs.nmro_dcmnto + ''.pdf'';',
'        a.href = v_url;',
'        a.click();',
'        document.body.removeChild(a);',
'        window.URL.revokeObjectURL(v_url);',
'        apex.page.submit();',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        if(popup) popup.remove();',
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
 p_id=>wwv_flow_api.id(72960578493220200)
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
'							           p_id_pryccion			=> :P111_ID_PRYCCION,',
'                                       p_id_impsto              => :P111_ID_IMPSTO,',
'                                       p_id_impsto_sbmpsto      => :P111_ID_IMPSTO_SBMPSTO,',
'							           p_id_sjto_impsto		    => :P115_ID_SJTO_IMPSTO ,',
'							           p_id_cnvnio_tpo		    => :P115_ID_CNVNIO_TPO ,',
'							           p_nmro_cta				=> :P114_NMRO_CTAS ,',
'							           p_cdgo_prdcdad_cta		=> :P114_CDGO_PRDCDAD_CTA ,',
'							           p_fcha_prmra_cta 		=> :P114_FCHA_PRMRA_CTA ,',
'							           p_id_usrio       		=> :F_ID_USRIO ,',
'                                       p_vlor_cta_incial		=> :P115_VLOR_CTA_INCIAL,',
'                                       p_prcntje_cta_incial     => :P113_CTA_INCIAL_PRCNTJE_VGNCIA,',
'								       p_fcha_lmte_cta_incial	=> :P115_FCHA_PGO_CTA_INCIAL,',
'							           p_vgncia_prdo			=> :P112_VGNCIA_PRDO ,',
'							           p_nmro_pryccion			=> :P111_NMRO_PRYCCION,',
'							           p_mnsje					=> v_mnsje);',
'    :P115_RSPSTA := v_mnsje;',
'    update gf_g_proyecciones set id_dcmnto_cta_incial = :F_ID_DCMNTO where id_pryccion = :P111_ID_PRYCCION;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(72946889615220172)
,p_process_when=>'P111_ID_PRYCCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'&P115_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72960145992220199)
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
'                                       p_id_impsto              => :P111_ID_IMPSTO,',
'                                       p_id_impsto_sbmpsto      => :P111_ID_IMPSTO_SBMPSTO,',
'							           p_id_sjto_impsto		    => :P111_ID_SJTO_IMPSTO ,',
'							           p_id_cnvnio_tpo		    => :P111_ID_CNVNIO_TPO ,',
'							           p_nmro_cta				=> :P114_NMRO_CTAS ,',
'							           p_cdgo_prdcdad_cta		=> :P114_CDGO_PRDCDAD_CTA ,',
'							           p_fcha_prmra_cta 		=> :P114_FCHA_PRMRA_CTA ,',
'							           p_id_usrio       		=> :F_ID_USRIO ,',
'                                       p_vlor_cta_incial		=> :P115_VLOR_CTA_INCIAL,',
'								       p_fcha_lmte_cta_incial	=> :P115_FCHA_PGO_CTA_INCIAL,',
'							           p_vgncia_prdo			=> :P112_VGNCIA_PRDO,',
'                                       p_id_ssion               => :APP_SESSION,',
'							           p_id_pryccion			=> :P111_ID_PRYCCION,',
'							           p_nmro_pryccion			=> v_nmro_pryccion,',
'							           p_mnsje					=> v_mnsje);',
'    :P115_RSPSTA := v_mnsje;',
'    update gf_g_proyecciones set id_dcmnto_cta_incial = :F_ID_DCMNTO where id_pryccion = :P111_ID_PRYCCION;',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(72946889615220172)
,p_process_when=>'P111_ID_PRYCCION'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>'&P115_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72959715238220199)
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
 p_id=>wwv_flow_api.id(72960987151220200)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GenerarDocumento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_dcmnto            re_g_documentos.id_dcmnto%type;',
'    v_vlor_ttal_dcmnto     number;',
'    v_blob                 blob;',
'    v_gn_d_reportes        gn_d_reportes%rowtype;  ',
'    v_nmro_dcmnto          number;',
'',
'begin',
'    v_vlor_ttal_dcmnto := :P115_VLOR_CTA_INCIAL;',
'    ',
'    begin',
'    ',
'    select JSON_OBJECT (''VGNCIA_PRDO''   value JSON_ARRAYAGG(',
'           JSON_OBJECT (''vgncia''    value vgncia,',
'                        ''prdo''      value prdo,',
'                        ''id_orgen''  value id_orgen))) vgncias_prdo',
'      into :P115_JSON_ARRAY',
'      from ( select vgncia',
'                ,   prdo',
'                ,   cdgo_mvmnto_orgn',
'                ,   id_orgen',
'              ',
'                               from v_gf_g_cartera_x_vigencia       a',
'                               join table( pkg_gn_generalidades.fnc_ca_split_table ( p_cdna           => :P112_VGNCIA_PRDO ',
'                                                                                   , p_crcter_dlmtdor => '':'')) b on cdna is not null ',
'                                and (a.vgncia||a.prdo||a.cdgo_mvmnto_orgn||id_orgen) = b.cdna',
'                              where id_sjto_impsto  = :P111_ID_SJTO_IMPSTO',
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
'                                                       p_id_impsto 			    => :P111_ID_IMPSTO, ',
'                                                       p_id_impsto_sbmpsto 	    => :P111_ID_IMPSTO_SBMPSTO, ',
'                                                       p_cdna_vgncia_prdo		=> :P115_JSON_ARRAY,',
'							                           p_cdna_vgncia_prdo_ps	=> null,',
'							                           p_id_dcmnto_lte		    => null,',
'                                                       p_id_sjto_impsto         => :P111_ID_SJTO_IMPSTO,',
'                                                       p_fcha_vncmnto			=> nvl(:P115_FCHA_PGO_CTA_INCIAL,sysdate),',
'                                                       p_cdgo_dcmnto_tpo        => ''DAB'',',
'                                                       p_nmro_dcmnto            => null,',
'                                                       p_vlor_ttal_dcmnto       => v_vlor_ttal_dcmnto,',
'                                                       p_indcdor_entrno         => ''PRVDO'');',
'      ',
'    if v_id_dcmnto  > 0  then ',
'         ',
'         :F_ID_DCMNTO := to_number(v_id_dcmnto);',
'         ',
'         select nmro_dcmnto into v_nmro_dcmnto from re_g_documentos where id_dcmnto = v_id_dcmnto;',
'         update gf_g_proyecciones set id_dcmnto_cta_incial = :F_ID_DCMNTO where id_pryccion = :P111_ID_PRYCCION;         ',
'         ',
'         apex_util.set_session_state(''F_ID_DCMNTO'', to_number(v_id_dcmnto));',
'         apex_util.set_session_state(''P115_NMRO_DCMNTO'', to_number(v_nmro_dcmnto));        ',
'         ',
'    end if;    ',
'    apex_json.open_object;',
'    apex_json.write(''type'', ''OK'');',
'    apex_json.write(''nmro_dcmnto'', v_nmro_dcmnto);',
'    apex_json.close_object;',
'end;'))
,p_process_error_message=>'Error al generar el documento, por favor consulte con el adiministrador'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('<br> Documento Generado Exitosamente N\00B0 &P113_NMRO_DCMNTO.')
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(75045015159310002)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar_Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_gn_d_reportes     gn_d_reportes%rowtype;',
'    v_id_dcmnto         number    := :F_ID_DCMNTO;',
'    v_blob              blob;',
'    ',
'begin',
'    apex_util.set_session_state(''F_CDGO_CLNTE'', :F_CDGO_CLNTE);',
'    apex_util.set_session_state(''F_ID_DCMNTO'', to_number(v_id_dcmnto));',
'    apex_util.set_session_state(''F_FRMTO_MNDA'', ''FM$999G999G999G999G999G999G990'');',
'    ',
'    apex_session.attach( p_app_id     => 66000',
'                       , p_page_id    => 2',
'                       , p_session_id => v(''APP_SESSION'') );',
'',
'    --BUSCAMOS LOS DATOS DE PLANTILLA DE REPORTES',
'    select /*+ RESULT_CACHE */',
'           r.*',
'      into v_gn_d_reportes ',
'      from gn_d_reportes r',
'     where r.id_rprte = :P115_ID_RPRTE_CTA_INCIAL;',
'',
'    --SETEAMOS EN SESSION LOS ITEMS NECESARIOS PARA GENERAR EL ARCHIVO     ',
'    apex_util.set_session_state(''F_CDGO_CLNTE'', :F_CDGO_CLNTE);',
'    apex_util.set_session_state(''F_ID_DCMNTO'', to_number(v_id_dcmnto));',
'    apex_util.set_session_state(''F_FRMTO_MNDA'', ''FM$999G999G999G999G999G999G990'');',
'    apex_util.set_session_state(''P2_XML'', ''<P_ID_DCMNTO>'' || v_id_dcmnto  ||''</P_ID_DCMNTO>'');',
'',
'    v_blob := apex_util.get_print_document( p_application_id     => 66000, ',
'                                            p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,',
'                                            p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,',
'                                            p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,',
'                                            p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo );',
'    htp.init;',
'    owa_util.mime_header(''application/pdf'', FALSE );',
'    htp.p(''Content-length: '' ||dbms_lob.getlength(v_blob));',
'    htp.p(''Content-Disposition: attachment; filename="DOCUMENTO_"'' );',
'    htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'    owa_util.http_header_close;',
'    wpg_docload.download_file(v_blob);',
'    apex_application.stop_apex_engine;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73192973572844413)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set_session'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_json.open_object;',
'apex_json.write(''type'', ''OK'');',
'apex_json.close_object;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
