prompt --application/pages/page_00155
begin
wwv_flow_api.create_page(
 p_id=>155
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Detalle de Plusval\00EDa')
,p_step_title=>unistr('Detalle de Plusval\00EDa')
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer {',
'    display: none;',
'}',
'',
'.btn_rechazar_exencion{',
'    background-color: #f17d7d;',
'}'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20220113160905'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4443567133236639)
,p_plug_name=>'Oficios'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_ofcio, cnsctvo, a.fcha_ofcio, dscrpcion, a.id_dcmnto',
'from gi_g_plsvlia_dtlle_ofcio a ',
'	join  gn_g_oficios b	on a.id_ofcio = b.id_ofcio',
'    join  gn_d_actos_tipo c on b.id_acto_tpo = c.id_acto_tpo ',
'where a.id_sjto_impsto = :P155_ID_SJTO_IMPSTO;',
' '))
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
 p_id=>wwv_flow_api.id(4891459609876206)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JPRADA'
,p_internal_uid=>4891459609876206
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4891510788876207)
,p_db_column_name=>'ID_OFCIO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Ofcio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4891666513876208)
,p_db_column_name=>'CNSCTVO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Consecutivo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4891949426876211)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Oficio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:GD_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4892051652876212)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Tipo de Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5163581559438503)
,p_db_column_name=>'FCHA_OFCIO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Fecha Oficio'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(4922815098392353)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'49229'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CNSCTVO:DSCRPCION:ID_DCMNTO::FCHA_OFCIO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95995382197183881)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(190211509983054546)
,p_plug_name=>'Ayuda'
,p_parent_plug_id=>wwv_flow_api.id(95995382197183881)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	<br>',
'	<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'	<i>',
'	Esta funcionalidad permite<br><br>',
unistr('		<b>1.</b> Liquidar o Actualizar la Plusval\00EDa.<br>'),
'		<b>2.</b> Ver la plantilla de Paz y Salvo.<br>			',
'		<b>3.</b> Imprimir Recibo de Pago.<br>',
'		<b>4.</b> Generar e imprimir el recibo de Paz y Salvo.<br><br>',
unistr('		<p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'	</i> ',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(117619982309064090)
,p_plug_name=>'Tab Selector'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P155_ID_LQDCION IS NULL'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(191513289910440160)
,p_plug_name=>unistr('<b>Matr\00EDcula N\00B0 &P155_MTRCLA_INMBLRIA.</b>')
,p_region_name=>'informacion_basica'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(90381225727441152)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(95995382197183881)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(90382093891441175)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(95995382197183881)
,p_button_name=>'BTN_ACTUALIZAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Actualizar Plusval\00EDa')
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>'((:P155_INDCDOR_PGO_APLCDO = ''N'' AND :P155_VLOR_VGNCIA_ACTUAL < TO_CHAR(SYSDATE,''YYYY'')) OR :P155_VLOR_VGNCIA_ACTUAL IS NULL) AND :P155_ID_LQDCION is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(90384033267441179)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(95995382197183881)
,p_button_name=>'BTN_IMPRIMIR_RECIBO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Imprimir Recibo'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>'( :P155_ID_DCMNTO is not null   AND :P155_INDCDOR_PGO_APLCDO = ''N'' AND :P155_VLOR_VGNCIA_ACTUAL = TO_CHAR(SYSDATE,''YYYY''))'
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(90456747827814312)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(95995382197183881)
,p_button_name=>'BTN_GNRAR_ACTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Generar Paz y Salvo'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4444171436236645)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(95995382197183881)
,p_button_name=>'BTN_GNRAR_OFCIO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Generar Oficio'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:214:&SESSION.::&DEBUG.:RP:P214_ID_IMPSTO,P214_ID_IMPSTO_SBMPSTO,P214_ID_SJTO_IMPSTO,P214_IDNTFCCION,P214_BRANCH,P214_ID_PLSVLIA_DTLLE,P214_CDGO_RPRTE_GRPO:&P155_ID_IMPSTO.,&P155_ID_IMPSTO_SBMPSTO.,&P155_ID_SJTO_IMPSTO.,&P155_CDGO_PRDIAL.,&APP_PAGE_ID.,&P155_ID_PLSVLIA_DTLLE.,OPP'
,p_button_condition=>' :P155_INDCDOR_PGO_APLCDO = ''S'''
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(164121262517722954)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(90384807023441179)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(95995382197183881)
,p_button_name=>'BTN_VER_ACTO'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Paz y Salvo'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR:V_GN_G_ACTOS,ID_ACTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,&P155_ID_ACTO.'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4892763510876219)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(95995382197183881)
,p_button_name=>'BTN_RVRSAR_LQDCIION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Reversar Liquidaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>'(:P155_ID_LQDCION is not null and :P155_INDCDOR_PGO_APLCDO = ''N'')'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4893603944876228)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(95995382197183881)
,p_button_name=>'BTN_MODIFICAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Modificar Plusvalia'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:194:&SESSION.::&DEBUG.:RP:P194_BRANCH,P194_ID_PLSVLIA_DTLLE:&APP_PAGE_ID.,&P155_ID_PLSVLIA_DTLLE.'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(90456904288814314)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(117619982309064090)
,p_button_name=>'BTN_VISOR_PLANTILLA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103612327707757)
,p_button_image_alt=>unistr('Visor de Plusval\00EDa')
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:156:&SESSION.::&DEBUG.:RP::'
,p_button_condition=>':P155_ID_LQDCION IS NULL'
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(90426583800441584)
,p_branch_name=>'Imprimir Documento'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_NMBRE_RPRTE,P2_PRMTRO_1,P2_PRMTRO_2:&P155_ID_RPRTE.,Liquidacion_&P155_MTRCLA_INMBLRIA.,&P155_ID_PLSVLIA_DTLLE.,&P155_ID_DCMNTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(90384033267441179)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4443757757236641)
,p_branch_name=>'Ir a la Pagina Anterior'
,p_branch_action=>'P155_BRANCH'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_when_button_id=>wwv_flow_api.id(90381225727441152)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4443409851236638)
,p_name=>'P155_VLOR_PLSVLIA_IPC'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4443636491236640)
,p_name=>'P155_BRANCH'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4893312525876225)
,p_name=>'P155_ID_USO_LQDDO'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4893497512876226)
,p_name=>'P155_DSCPCION'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_prompt=>'Uso Liquidado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5007847276353801)
,p_name=>'P155_UDP'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_prompt=>'UDP'
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
 p_id=>wwv_flow_api.id(86821870990932407)
,p_name=>'P155_VLOR_VGNCIA_ACTUAL'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90411244762441474)
,p_name=>'P155_ID_PLSVLIA_DTLLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_source=>'P155_NRMO_RNTA'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90411675113441477)
,p_name=>'P155_CDGO_PRDIAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_prompt=>'Referencia Catastral'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90412008891441477)
,p_name=>'P155_ID_PRCSO_PLSVLIA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90412480204441477)
,p_name=>'P155_AREA_OBJTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_prompt=>unistr('\00C1rea Objeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90412896510441478)
,p_name=>'P155_MTRCLA_INMBLRIA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90413291485441478)
,p_name=>'P155_AREA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90413624128441478)
,p_name=>'P155_PRPTRIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_prompt=>'Propietario'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90414062986441479)
,p_name=>'P155_ID_IMPSTO_ACTO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_prompt=>'Acto'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select nmbre_impsto_acto      d',
'        , id_impsto_acto         r',
'     from df_i_impuestos_acto    a',
' order by nmbre_impsto_acto',
'   '))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>3
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90414470438441479)
,p_name=>'P155_VLOR_P1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_prompt=>'Valor P1'
,p_format_mask=>'99G999G999G999G990D0000'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90414837613441480)
,p_name=>'P155_VLOR_P2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_prompt=>'Valor P2'
,p_format_mask=>'99G999G999G999G990D0000'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90415285413441480)
,p_name=>'P155_CLSFCCION_ZNA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90415632211441487)
,p_name=>'P155_DRCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90416047167441490)
,p_name=>'P155_HCHO_GNRDOR'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_prompt=>'Hecho Generador'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P155_HCHO_GNRDOR'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90416487486441490)
,p_name=>'P155_PRDIO_FRA_ESTDIO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90416895896441490)
,p_name=>'P155_VLOR_PLSVLIA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90417207507441491)
,p_name=>'P155_VLOR_TTAL_PLSVLIA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90417636395441491)
,p_name=>'P155_VLOR_PLSVLIA_ACTLZDA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_prompt=>unistr('Valor Plusval\00EDa Actualizada&P155_VGNCIA_BSE.')
,p_format_mask=>'99G999G999G999G990D0000'
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
 p_id=>wwv_flow_api.id(90418088479441491)
,p_name=>'P155_INDCDOR_EXNCION'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90418446071441491)
,p_name=>'P155_ID_SJTO_IMPSTO'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90420496896441493)
,p_name=>'P155_ID_RPRTE'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90420880090441494)
,p_name=>'P155_RSPSTA'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90421652981441503)
,p_name=>'P155_ID_LQDCION'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90422009420441513)
,p_name=>'P155_ID_DCMNTO'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90422477351441514)
,p_name=>'P155_NMRO_DCMNTO'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90455690322814301)
,p_name=>'P155_ID_IMPSTO'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90455788459814302)
,p_name=>'P155_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90455870001814303)
,p_name=>'P155_ID_PRDO'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90456072323814305)
,p_name=>'P155_INDCDOR_PGO_APLCDO'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90456316799814308)
,p_name=>'P155_ID_PLNTLLA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(117619982309064090)
,p_prompt=>'Plantilla'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select dscrpcion',
'        , id_plntlla',
'     from gn_d_plantillas',
'    where cdgo_clnte        = :F_CDGO_CLNTE',
'      and id_prcso          = 91;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_display_when=>':P155_ID_LQDCION IS NULL'
,p_display_when_type=>'SQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90456619024814311)
,p_name=>'P155_ID_ACTO'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92200253406564601)
,p_name=>'P155_VGNCIA_BSE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_format_mask=>'99G999G999G999G990D0000'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92200392555564602)
,p_name=>'P155_VGNCIA_ACTUAL'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_format_mask=>'99G999G999G999G990D0000'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92200453031564603)
,p_name=>'P155_VLOR_TTAL_DCMNTO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(191513289910440160)
,p_prompt=>unistr('Valor Plusval\00EDa Actualizada&P155_VGNCIA_ACTUAL.')
,p_format_mask=>'99G999G999G999G990D0000'
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
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(90456485045814309)
,p_computation_sequence=>10
,p_computation_item=>'P155_ID_PLNTLLA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select min(id_plntlla)',
'     from gn_d_plantillas',
'    where cdgo_clnte        = :F_CDGO_CLNTE',
'      and id_prcso          = 91;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(90423391092441546)
,p_validation_name=>'Validar Reporte'
,p_validation_sequence=>10
,p_validation=>'P155_ID_RPRTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'No existe reporte parametrizado, por favor comuniquese con el administrador'
,p_when_button_pressed=>wwv_flow_api.id(90384033267441179)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(90424033152441569)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Actualizar plusval\00EDa')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(1000);',
'    v_id_dcmnto          number;',
'    v_nmro_dcmnto        number;',
'begin',
'',
'  pkg_gi_plusvalia.prc_ac_plusvalia(',
'                    p_cdgo_clnte        => :F_CDGO_CLNTE,',
'                    p_id_plsvlia_dtlle  => :P155_ID_PLSVLIA_DTLLE,',
'                    p_id_prdo           => :P155_ID_PRDO,',
'                    p_mtrcla_inmblria   => :P155_MTRCLA_INMBLRIA,',
'                    p_cdgo_prdial       => :P155_CDGO_PRDIAL,',
'                    p_id_impsto         => :P155_ID_IMPSTO,',
'                    p_id_impsto_sbmpsto => :P155_ID_IMPSTO_SBMPSTO,',
'                    p_id_sjto_impsto    => :P155_ID_SJTO_IMPSTO,',
'                    p_id_usrio          => :F_ID_USRIO,',
'                    p_id_plntlla        => :P155_ID_PLNTLLA,',
'                    o_id_dcmnto         => v_id_dcmnto,',
'                    o_nmro_dcmnto       => v_nmro_dcmnto,',
'                    o_cdgo_rspsta       => v_cdgo_rspsta,',
'                    o_mnsje_rspsta      => v_mnsje_rspsta',
'                  );',
'    if v_cdgo_rspsta = 0 then ',
'        :F_ID_DCMNTO         := v_id_dcmnto;',
'        :P155_NMRO_DCMNTO    := v_nmro_dcmnto;',
'    else',
'        pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_gi_plusvalia.prc_ac_plusvalia'', 6, v_mnsje_rspsta, 1);',
'        rollback;',
'        return;    ',
'    end if;',
'end;'))
,p_process_error_message=>unistr('No se pudo actualizar la plusval\00EDa')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(90382093891441175)
,p_process_when=>'(:P155_ID_LQDCION IS NULL)'
,p_process_when_type=>'SQL_EXPRESSION'
,p_process_success_message=>unistr('Actualizaci\00F3n de la Plusval\00EDa Exitosa')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(90456843097814313)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Genera documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nl            number    := 6;',
'    v_id_acto        number;',
'    o_cdgo_rspsta    number;',
'    o_mnsje_rspsta   varchar2(1000);',
'begin ',
'    pkg_gi_plusvalia.prc_gn_certificado_plusvalia(p_cdgo_clnte          => :F_CDGO_CLNTE',
'                                                , p_id_plsvlia_dtlle    => :P155_ID_PLSVLIA_DTLLE',
'                                                , p_id_plntlla          => :P155_ID_PLNTLLA -- 130',
'                                                , p_id_usrio            => :F_ID_USRIO',
'                                                , o_id_acto             => v_id_acto',
'                                                , o_cdgo_rspsta         => o_cdgo_rspsta',
'                                                , o_mnsje_rspsta        => o_mnsje_rspsta);',
'',
' ',
'',
'    if o_cdgo_rspsta!= 0 then ',
'        --o_cdgo_rspsta    := 13;',
'        --o_mnsje_rspsta  := ''No. '' || o_cdgo_rspsta || '': Error al generar el cerfificado de paz y salvo'';',
'        pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_gi_plusvalia.prc_gn_certificado_plusvalia'', v_nl, o_mnsje_rspsta, 1);',
'        rollback;',
'        return;    ',
'    else',
unistr('        o_mnsje_rspsta  := ''Generaci\00F3n del cerfificado exitoso. o_id_acto: '' || v_id_acto;'),
'        pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_gi_plusvalia.prc_gn_certificado_plusvalia'', v_nl, o_mnsje_rspsta, 1);',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(90456747827814312)
,p_process_when=>':P155_INDCDOR_PGO_APLCDO = ''S'''
,p_process_when_type=>'SQL_EXPRESSION'
,p_process_success_message=>'Paz y Salvo generado correctamente!'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4892852127876220)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Revertir Liquidacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	v_cdgo_rspsta		         number;',
'	v_mnsje_rspsta		         varchar2(2000)	:= ''Inicio'';',
'    ',
'begin',
'        -- Revertir liquidacion plusvalia puntual',
'        pkg_gi_plusvalia.prc_rv_lqudcion_plsvlia_puntual (  p_cdgo_clnte          =>  :F_CDGO_CLNTE        ',
'                                                          , p_id_plsvlia_dtlle    =>  :P155_ID_PLSVLIA_DTLLE',
'                                                          , p_id_dcmnto           =>  :P155_ID_DCMNTO',
'                                                          , p_id_lqdcion          =>  :P155_ID_LQDCION',
'                                                          , p_id_sjto_impsto	  =>  :P155_ID_SJTO_IMPSTO	',
'                                                          , o_cdgo_rspsta		  =>  v_cdgo_rspsta',
'                                                          , o_mnsje_rspsta	      =>   v_mnsje_rspsta);',
'',
'        if(v_cdgo_rspsta <> 0) then',
unistr('          :P155_RSPSTA := ''\00A1Error al revertir la liquidaci\00F3n de la plusvalia!'';'),
'          raise_application_error(-20001, ''1. Error: '' || v_mnsje_rspsta);',
'        else',
'            :P155_RSPSTA := ''Plusvalia revertida exitosamente'';',
'        end if;',
'',
'exception',
'    when others then ',
'        rollback;',
'        raise_application_error(-20001, ''2. '' ||v_mnsje_rspsta);',
'end;',
'    '))
,p_process_error_message=>'&P155_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4892763510876219)
,p_process_success_message=>'&P155_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(90424425743441570)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Informaci\00F3n de Plusval\00EDa')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
' select   a.id_prcso_plsvlia        					',
'        , a.cdgo_prdial			',
'        , round(a.area_objto,2) 			',
'        , a.mtrcla_inmblria		',
'        , a.prptrio				',
'        , to_char(a.vlor_p1, :F_FRMTO_MNDA)			',
'        , to_char(a.vlor_p2, :F_FRMTO_MNDA)		',
'        , a.area				',
'        , a.clsfccion_zna		',
'        --, a.cmna				',
'        , a.drccion				',
'        , a.hcho_gnrdor      	',
'        , a.prdio_fra_estdio	',
'        , a.vlor_plsvlia		',
'        , a.vlor_ttal_plsvlia	',
'        , to_char(a.vlor_plsvlia_actlzda, :F_FRMTO_MNDA)',
'        , decode(a.vlor_plsvlia_actlzda, null, null, '' - Vigencia ''||b.vgncia )  ',
'        --, a.rgstro_error		',
'        --, a.dscrpcion_error		',
'        --, a.estdo_rgstro		',
'        , a.id_impsto_acto		',
'        , a.id_sjto_impsto		',
'        , a.id_lqdcion 			',
'        , a.id_dcmnto',
'        , b.id_impsto',
'        , b.id_impsto_sbmpsto',
'        , b.id_prdo	 ',
'        , r.INDCDOR_PGO_APLCDO',
'        , a.id_Acto',
'        , to_char(r.vlor_ttal_dcmnto, :F_FRMTO_MNDA)',
'        , to_char(a.VLOR_PLSVLIA_IPC, :F_FRMTO_MNDA)',
'        , '' - Vigencia ''||to_char(fcha_dcmnto,''YYYY'')',
'        , c.id_uso_lqddo',
'        , c.dscrpcion',
'        , a.udp',
'        , to_char(fcha_dcmnto,''YYYY'')',
'   INTO   :P155_ID_PRCSO_PLSVLIA        					',
'        , :P155_CDGO_PRDIAL			',
'        , :P155_AREA_OBJTO			',
'        , :P155_MTRCLA_INMBLRIA		',
'        , :P155_PRPTRIO				',
'        , :P155_VLOR_P1				',
'        , :P155_VLOR_P2				',
'        , :P155_AREA				',
'        , :P155_CLSFCCION_ZNA		',
'       -- , :P155_CMNA				',
'        , :P155_DRCCION				',
'        , :P155_HCHO_GNRDOR      	',
'        , :P155_PRDIO_FRA_ESTDIO	',
'        , :P155_VLOR_PLSVLIA		',
'        , :P155_VLOR_TTAL_PLSVLIA	',
'        , :P155_VLOR_PLSVLIA_ACTLZDA',
'        , :P155_VGNCIA_BSE',
'        --, :P155_RGSTRO_ERROR		',
'        --, :P155_DSCRPCION_ERROR		',
'        --, :P155_ESTDO_RGSTRO		',
'        , :P155_ID_IMPSTO_ACTO		',
'        , :P155_ID_SJTO_IMPSTO		',
'        , :P155_ID_LQDCION 			',
'        , :P155_ID_DCMNTO ',
'        , :P155_ID_IMPSTO',
'        , :P155_ID_IMPSTO_SBMPSTO',
'        , :P155_ID_PRDO	',
'        , :P155_INDCDOR_PGO_APLCDO',
'        , :P155_ID_ACTO	',
'        , :P155_VLOR_TTAL_DCMNTO',
'        , :P155_VLOR_PLSVLIA_IPC',
'        , :P155_VGNCIA_ACTUAL',
'        , :P155_ID_USO_LQDDO',
'        , :P155_DSCPCION ',
'        , :P155_UDP',
'        , :P155_VLOR_VGNCIA_ACTUAL',
'  from gi_g_plusvalia_procso_dtlle       a',
'  join gi_g_plusvalia_proceso            b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'  left join re_g_documentos              r on a.id_dcmnto        = r.id_dcmnto',
'  left join gi_d_plusvalia_uso_lqddo     c on a.id_uso_lqddo     = c.id_uso_lqddo',
' -- left join gi_g_liquidaciones_concepto  g on a.id_lqdcion       = g.id_lqdcion',
'    where a.id_plsvlia_dtlle   = :P155_id_plsvlia_dtlle ;',
'',
'exception',
'    when others then',
'       :P155_ID_PRCSO_PLSVLIA		:= NULL;        					',
'       :P155_CDGO_PRDIAL			:= NULL;',
'       :P155_AREA_OBJTO			    := NULL;',
'       :P155_MTRCLA_INMBLRIA		:= NULL;',
'       :P155_PRPTRIO				:= NULL;',
'       :P155_VLOR_P1				:= NULL;',
'       :P155_VLOR_P2				:= NULL;',
'       :P155_AREA				    := NULL;',
'       :P155_CLSFCCION_ZNA		    := NULL;',
'       --:P155_CMNA				    := NULL;',
'       :P155_DRCCION				:= NULL;',
'       :P155_HCHO_GNRDOR      	    := NULL;',
'       :P155_PRDIO_FRA_ESTDIO	    := NULL;',
'       :P155_VLOR_PLSVLIA		    := NULL;',
'       :P155_VLOR_TTAL_PLSVLIA	    := NULL;',
'       :P155_VLOR_PLSVLIA_ACTLZDA   := NULL;',
'       --:P155_RGSTRO_ERROR		    := NULL;',
'       --:P155_DSCRPCION_ERROR		:= NULL;',
'       --:P155_ESTDO_RGSTRO		    := NULL;',
'       :P155_ID_IMPSTO_ACTO		    := NULL;',
'       :P155_ID_SJTO_IMPSTO		    := NULL;',
'       :P155_ID_LQDCION 			:= NULL;',
'       :P155_ID_DCMNTO 			    := NULL; ',
'       :P155_ID_IMPSTO              := NULL;',
'       :P155_ID_IMPSTO_SBMPSTO      := NULL;',
'       :P155_ID_PRDO	            := NULL;     ',
'       :P155_INDCDOR_PGO_APLCDO     := NULL;',
'       :P155_ID_ACTO	            := NULL;',
'       :P155_VLOR_TTAL_DCMNTO       := NULL;',
'       :P155_VLOR_PLSVLIA_IPC       := NULL;',
'       :P155_VGNCIA_ACTUAL          := NULL;',
'       :P155_ID_USO_LQDDO           := NULL;',
'       :P155_DSCPCION               := NULL;',
'       :P155_UDP                    := NULL;  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P155_ID_PLSVLIA_DTLLE'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(90424816993441570)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta de Reporte de Recibo de Plusval\00EDa')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_rprte',
'      into :P155_ID_RPRTE',
'      from gn_d_reportes   a',
'       join gn_d_reporte_cliente    b on a.id_rprte = b.id_rprte',
'       and cdgo_clnte              = :F_CDGO_CLNTE',
'     where cdgo_rprte_grpo = ''RPP'' ',
'       and a.indcdor_gnrco = ''N'';',
'exception',
'    when no_data_found then ',
'       begin ',
'           select a.id_rprte',
'          into :P155_ID_RPRTE',
'          from gn_d_reportes   a',
'         where cdgo_rprte_grpo = ''RPP'' ',
'           and a.indcdor_gnrco = ''S''',
'           and rownum = 1;',
'       exception ',
'           when others then ',
'               null;',
'       end;',
'    when others then ',
'        :P155_ID_RPRTE := NULL;',
'end;'))
,p_process_error_message=>unistr('No se encontro parametrizaci\00F3n del reporte')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
