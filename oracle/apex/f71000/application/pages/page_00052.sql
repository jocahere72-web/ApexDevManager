prompt --application/pages/page_00052
begin
wwv_flow_api.create_page(
 p_id=>52
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Generaci\00F3n Acuerdo - Resumen Solicitud')
,p_step_title=>unistr('Generaci\00F3n Acuerdo - Resumen Solicitud')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id) {',
'  if ($("#" + id).attr("aria-expanded") == "true") {',
'    $("#" + id).click();',
'  }',
'}'))
,p_javascript_code_onload=>'buttonCollapse(''t_Button_rightControlButton'');'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20220601102546'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(167203652604861099)
,p_plug_name=>unistr('Informaci\00F3n B\00E1sica del Convenio')
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(177337797773050609)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(73655524996021574)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(177351601973050625)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75059987856031401)
,p_plug_name=>'<b>DOCUMENTOS PQR</b>'
,p_parent_plug_id=>wwv_flow_api.id(167203652604861099)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_dcmnto,',
'        c.dscrpcion_dcmnto,',
'        a.file_name,',
'        a.obsrvcion,',
'        1 dscrgar',
'   from pq_g_documentos             a',
'   join v_pq_g_solicitudes          b on a.id_slctud = b.id_slctud',
'   join v_pq_d_motivos_documento    c on a.id_mtvo_dcmnto = c.id_mtvo_dcmnto',
'  where b.id_instncia_fljo_gnrdo = :F_ID_INSTNCIA_FLJO'))
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
 p_id=>wwv_flow_api.id(75060035949031402)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se encontraron documentos'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>75060035949031402
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75060134074031403)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75060219654031404)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75060336069031405)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75060466546031406)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75060556682031407)
,p_db_column_name=>'DSCRGAR'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(75089135124107556)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'750892'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_DCMNTO:DSCRPCION_DCMNTO:FILE_NAME:OBSRVCION:DSCRGAR'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(123733360544627723)
,p_plug_name=>'<b>SUJETO TRIBUTO</b>'
,p_parent_plug_id=>wwv_flow_api.id(167203652604861099)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(124101642292815556)
,p_plug_name=>unistr('<b>INFORMACI\00D3N DEL SOLICITANTE </b>')
,p_parent_plug_id=>wwv_flow_api.id(167203652604861099)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(167741181452215749)
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
 p_id=>wwv_flow_api.id(213815057763924997)
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
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>    ',
'    <p align="justify">Funcionalidad de Solicitud de Acuerdos de Pago.<br> ',
unistr('        <b> <center> Paso 1 Informaci\00F3n B\00E1sica </center> </b><br>'),
unistr('        Se muestra la informaci\00F3n del sujeto tributo, la informaci\00F3n del solicitante y los documentos que est\00E1n relacionados con la radicaci\00F3n de PQR.<br><br>'),
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>     '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72752851753801523)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(167203652604861099)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:47:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72753683746801524)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(167203652604861099)
,p_button_name=>'BTN_NEXT'
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
 p_id=>wwv_flow_api.id(72769450743801535)
,p_branch_name=>unistr('Ir a la p\00E1gina 69')
,p_branch_action=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.:RP,69::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72753683746801524)
,p_branch_sequence=>10
,p_branch_condition_type=>'SQL_EXPRESSION'
,p_branch_condition=>' (:P52_INDCDOR_CNV_RVCD_OTRS_VGNC = ''S''  or (:P52_INDCDOR_CNV_RVCD_OTRS_VGNC = ''N'' and :P52_INDCDOR_CRTRA_RVCDA_SLDO =''N'')) and :P52_TTAL_CRTRAS_NO_RVCDAS > 0'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(18474107736321205)
,p_branch_name=>unistr('Ir a la p\00E1gina 360')
,p_branch_action=>'f?p=&APP_ID.:360:&SESSION.::&DEBUG.:RP,360::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72753683746801524)
,p_branch_sequence=>20
,p_branch_condition_type=>'SQL_EXPRESSION'
,p_branch_condition=>'(:P52_INDCDOR_CNV_RVCD_OTRS_VGNC = ''N'' and :P52_INDCDOR_CRTRA_RVCDA_SLDO = ''S'') or :P52_TTAL_CRTRAS_NO_RVCDAS = 0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18473780998321201)
,p_name=>'P52_INDCDOR_CNV_RVCD_OTRS_VGNC'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(123733360544627723)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18473842349321202)
,p_name=>'P52_INDCDOR_CRTRA_RVCDA_SLDO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(123733360544627723)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18480616389405804)
,p_name=>'P52_TTAL_CRTRAS_NO_RVCDAS'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(123733360544627723)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72754330319801524)
,p_name=>'P52_ID_SJTO_IMPSTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(123733360544627723)
,p_source=>'P41_ID_SJTO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72754774967801525)
,p_name=>'P52_IDNTFCCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(123733360544627723)
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
 p_id=>wwv_flow_api.id(72755177348801525)
,p_name=>'P52_DRCCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(123733360544627723)
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
 p_id=>wwv_flow_api.id(72756306660801525)
,p_name=>'P52_RSPSTA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(123733360544627723)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72774004380813854)
,p_name=>'P52_CDGO_IDNTFCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(124101642292815556)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_source=>'P42_TIPO_IDENTIFICACION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72774454431813854)
,p_name=>'P52_NMRO_IDNTFCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(124101642292815556)
,p_prompt=>unistr('Identificaci\00F3n')
,p_source=>'P42_NMRO_IDNTFCCION'
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
 p_id=>wwv_flow_api.id(72774828109813855)
,p_name=>'P52_NMBRE_CMPLTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(124101642292815556)
,p_prompt=>'Nombre'
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
 p_id=>wwv_flow_api.id(72775249913813855)
,p_name=>'P52_UBCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(124101642292815556)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_source=>'select upper (nmbre_pais || '' '' || nmbre_dprtmnto || '' ''|| nmbre_mncpio)ubccion from v_df_s_municipios where id_mncpio = :P42_ID_MNCPIO;'
,p_source_type=>'QUERY'
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
 p_id=>wwv_flow_api.id(72775657690813855)
,p_name=>'P52_DRCCION_NTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(124101642292815556)
,p_prompt=>unistr('Direcci\00F3n Notificaci\00F3n')
,p_source=>'P42_DIRECCION'
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
 p_id=>wwv_flow_api.id(72776063822813855)
,p_name=>'P52_TLFNO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(124101642292815556)
,p_prompt=>unistr('Tel\00E9fono')
,p_source=>'P42_TLFNO'
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
 p_id=>wwv_flow_api.id(72776459537813855)
,p_name=>'P52_EMAIL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(124101642292815556)
,p_prompt=>'Email'
,p_source=>'P42_EMAIL'
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
 p_id=>wwv_flow_api.id(72785881260872804)
,p_name=>'P52_CLLAR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(124101642292815556)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72785907706872805)
,p_name=>'P52_ID_SLCTNTE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(124101642292815556)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72786041281872806)
,p_name=>'P52_ID_SLCTUD'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(124101642292815556)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72786292143872808)
,p_name=>'P52_NMBRE_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(123733360544627723)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72786483857872810)
,p_name=>'P52_ID_PRYCCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(123733360544627723)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73550161396728620)
,p_name=>'P52_UBCCION_SJTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(123733360544627723)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73550836832728627)
,p_name=>'P52_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(123733360544627723)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73550960224728628)
,p_name=>'P52_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(123733360544627723)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73551150075728630)
,p_name=>'P52_CDGO_SJTO_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(123733360544627723)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74402909006784101)
,p_name=>'P52_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(123733360544627723)
,p_prompt=>'Sub-Tributo '
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83129770557712101)
,p_name=>'P52_ID_INSTNCIA_FLJO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(123733360544627723)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86047855643040302)
,p_name=>'P52_ID_CNVNIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(167203652604861099)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(90615338513688002)
,p_computation_sequence=>20
,p_computation_item=>'P52_ID_CNVNIO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ID_CNVNIO',
'  FROM V_GF_G_CONVENIOS  ',
' WHERE ID_INSTNCIA_FLJO_HJO = :F_ID_INSTNCIA_FLJO'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(5800499611648002)
,p_computation_sequence=>30
,p_computation_item=>'P52_ID_SLCTUD'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_slctud',
'  from gf_g_convenios  ',
' where id_cnvnio = :P52_ID_CNVNIO'))
,p_compute_when=>'P52_ID_CNVNIO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(18474075185321204)
,p_computation_sequence=>10
,p_computation_item=>'P52_INDCDOR_CRTRA_RVCDA_SLDO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>' select pkg_gf_convenios.fnc_cl_crtra_rvcda_con_saldo (:F_CDGO_CLNTE, :P52_ID_IMPSTO,  :P52_ID_IMPSTO_SBMPSTO, :P52_ID_SJTO_IMPSTO) from dual  '
,p_compute_when=>'P52_INDCDOR_CNV_RVCD_OTRS_VGNC'
,p_compute_when_text=>'N'
,p_compute_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(18480793940405805)
,p_computation_sequence=>20
,p_computation_item=>'P52_TTAL_CRTRAS_NO_RVCDAS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(1)',
'from v_gf_g_cartera_x_vigencia  a',
'where a.id_sjto_impsto               = :P52_ID_SJTO_IMPSTO',
'    and a.id_impsto                  = :P52_ID_IMPSTO           ',
'    and a.id_impsto_sbmpsto          = :P52_ID_IMPSTO_SBMPSTO',
'    and a.cdgo_mvnt_fncro_estdo      = ''NO''',
'    and a.vlor_sldo_cptal            > 0',
'    and a.id_orgen not in ( select id_orgen',
'                            from gf_g_convenios_cartera b join gf_g_convenios c on  c.id_cnvnio = b.id_cnvnio -- AND CDGO_CLNTE = :CDGO_CLNTE',
'                                                                            and c.cdgo_cnvnio_estdo  = ''RVC'')  '))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(83139826991740602)
,p_computation_sequence=>20
,p_computation_item=>'F_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P52_ID_INSTNCIA_FLJO'
,p_computation_error_message=>'TTERT'
,p_compute_when=>'P52_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(18473989679321203)
,p_computation_sequence=>30
,p_computation_item=>'P52_INDCDOR_CNV_RVCD_OTRS_VGNC'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_cnv_rvcd_otrs_vgnc',
'from gf_d_convenios_cnfgrcion',
'where cdgo_clnte = :F_CDGO_CLNTE'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72785787914872803)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Recuperaci\00F3n Datos Solicitante y sujeto impuesto')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'	select c.id_slctnte',
'         , b.id_slctud',
'		 , e.id_impsto',
'		 , e.id_impsto_sbmpsto',
'		 , c.cdgo_idntfccion_tpo',
'		 , c.idntfccion',
'		 , c.nmbre_slctnte',
'		 , upper(c.nmbre_pais_ntfccion || ''-'' || c.nmbre_dprtmnto_ntfccion || ''-'' || c.nmbre_mncpio_ntfccion) ubccion',
'		 , c.drccion_ntfccion',
'		 , c.tlfno',
'		 , c.cllar',
'		 , c.email',
'		 , e.id_sjto_impsto',
'		 , f.cdgo_sjto_tpo',
'		 , f.idntfccion_sjto_frmtda',
'		 , upper(f.nmbre_impsto) nmbre_impsto',
'		 , (select nmbre_impsto_sbmpsto from df_i_impuestos_subimpuesto where id_impsto_sbmpsto = e.id_impsto_sbmpsto ) nmbre_impsto_sbmpsto',
'		 , f.drccion',
'		 , upper(f.nmbre_pais || ''-'' || f.nmbre_dprtmnto || ''-'' || f.nmbre_mncpio) ubccion_sjto',
'	 into :P52_ID_SLCTNTE',
'        , :P52_ID_SLCTUD',
'		, :P52_ID_IMPSTO',
'		, :P52_ID_IMPSTO_SBMPSTO',
'		, :P52_CDGO_IDNTFCION_TPO',
'		, :P52_NMRO_IDNTFCION',
'		, :P52_NMBRE_CMPLTO',
'		, :P52_UBCCION',
'		, :P52_DRCCION_NTFCCION',
'		, :P52_TLFNO',
'		, :P52_CLLAR',
'		, :P52_EMAIL',
'		, :P52_ID_SJTO_IMPSTO',
'		, :P52_CDGO_SJTO_TPO',
'		, :P52_IDNTFCCION',
'		, :P52_NMBRE_IMPSTO',
'		, :P52_NMBRE_IMPSTO_SBMPSTO',
'		, :P52_DRCCION',
'		, :P52_UBCCION_SJTO',
'	 from wf_g_instancias_flujo_gnrdo		a',
'	 join pq_g_solicitudes					b on a.id_instncia_fljo	= b.id_instncia_fljo',
'	 join v_pq_g_solicitantes				c on b.id_slctud		= c.id_slctud',
'	 join pq_g_solicitudes_motivo			d on c.id_slctud		= d.id_slctud',
'	 join pq_g_slctdes_mtvo_sjt_impst		e on d.id_slctud_mtvo	= e.id_slctud_mtvo',
'	 join v_si_i_sujetos_impuesto			f on e.id_sjto_impsto	= f.id_sjto_impsto',
'	where a.id_instncia_fljo_gnrdo_hjo		= :F_ID_INSTNCIA_FLJO;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(75060698234031408)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Borrar Colecciones'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'if APEX_COLLECTION.COLLECTION_EXISTS(p_collection_name => ''ADJUNTAR_GARANTIA'') then',
'    APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => ''ADJUNTAR_GARANTIA'');',
'end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
