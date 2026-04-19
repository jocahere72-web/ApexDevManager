prompt --application/pages/page_00104
begin
wwv_flow_api.create_page(
 p_id=>104
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Resumen Solicitud - Solicitud de Acuerdo de Pago'
,p_step_title=>'Resumen Solicitud - Solicitud de Acuerdo de Pago'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id) {',
'  if ($("#" + id).attr("aria-expanded") == "true") {',
'    $("#" + id).click();',
'  }',
'}'))
,p_javascript_code_onload=>'buttonCollapse(''t_Button_rightControlButton'');'
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200521163647'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(239644340195625265)
,p_plug_name=>unistr('Informaci\00F3n B\00E1sica del Convenio')
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall:t-Form--large'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(252183924525651399)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(72235324874226079)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(252197199379651439)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(147500675446795567)
,p_plug_name=>'<b>DOCUMENTOS PQR</b>'
,p_parent_plug_id=>wwv_flow_api.id(239644340195625265)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
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
 p_id=>wwv_flow_api.id(147500723539795568)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se encontraron documentos'
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>147500723539795568
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72442755435764207)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72443153630764212)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72443532958764212)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72443987424764213)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72444373022764213)
,p_db_column_name=>'DSCRGAR'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(147529822714871722)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'724447'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_DCMNTO:DSCRPCION_DCMNTO:FILE_NAME:OBSRVCION:DSCRGAR'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(196174048135391889)
,p_plug_name=>'<b>SUJETO TRIBUTO</b>'
,p_parent_plug_id=>wwv_flow_api.id(239644340195625265)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(196542329883579722)
,p_plug_name=>unistr('<b>INFORMACI\00D3N DEL SOLICITANTE </b>')
,p_parent_plug_id=>wwv_flow_api.id(239644340195625265)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(240181869042979915)
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
 p_id=>wwv_flow_api.id(286255745354689163)
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
 p_id=>wwv_flow_api.id(72441289065764184)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(239644340195625265)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Salir de la Funcionalidad?, Tenga en Cuenta Pueden Perderse los Datos.'',''CANCEL'')'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72441652408764188)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(239644340195625265)
,p_button_name=>'BTN_NEXT'
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
 p_id=>wwv_flow_api.id(72456824131764262)
,p_branch_name=>unistr('Ir a la p\00E1gina 105 - Cartera ')
,p_branch_action=>'f?p=&APP_ID.:105:&SESSION.::&DEBUG.:RP,105::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72441652408764188)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(70820926025843730)
,p_branch_action=>'f?p=&APP_ID.:301:&SESSION.::&DEBUG.:RP,104,105,106,107,108,109::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72441289065764184)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72442022076764192)
,p_name=>'P104_ID_CNVNIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(239644340195625265)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72445467639764219)
,p_name=>'P104_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(196174048135391889)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72445886627764220)
,p_name=>'P104_ID_INSTNCIA_FLJO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(196174048135391889)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72446204025764220)
,p_name=>'P104_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(196174048135391889)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72446635735764220)
,p_name=>'P104_CDGO_SJTO_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(196174048135391889)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72447044667764220)
,p_name=>'P104_NMBRE_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(196174048135391889)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72447442584764221)
,p_name=>'P104_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(196174048135391889)
,p_prompt=>'Sub-Tributo '
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72447853001764223)
,p_name=>'P104_IDNTFCCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(196174048135391889)
,p_prompt=>unistr('Identificaci\00F3n')
,p_source=>'P41_IDNTFCCION'
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
 p_id=>wwv_flow_api.id(72448238144764223)
,p_name=>'P104_UBCCION_SJTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(196174048135391889)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72448651648764223)
,p_name=>'P104_DRCCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(196174048135391889)
,p_prompt=>unistr('Direcci\00F3n')
,p_source=>'P41_DRCCION'
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
 p_id=>wwv_flow_api.id(72449068808764224)
,p_name=>'P104_ID_SJTO_IMPSTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(196174048135391889)
,p_source=>'P41_ID_SJTO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72449467784764224)
,p_name=>'P104_RSPSTA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(196174048135391889)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72449815482764224)
,p_name=>'P104_ID_PRYCCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(196174048135391889)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72450539455764229)
,p_name=>'P104_CDGO_IDNTFCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(196542329883579722)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_source=>'P42_TIPO_IDENTIFICACION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72450971505764230)
,p_name=>'P104_NMRO_IDNTFCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(196542329883579722)
,p_prompt=>unistr('Identificaci\00F3n')
,p_source=>'P42_NMRO_IDNTFCCION'
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
 p_id=>wwv_flow_api.id(72451319813764230)
,p_name=>'P104_NMBRE_CMPLTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(196542329883579722)
,p_prompt=>'Nombre'
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
 p_id=>wwv_flow_api.id(72451765691764230)
,p_name=>'P104_DRCCION_NTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(196542329883579722)
,p_prompt=>unistr('Direcci\00F3n Notificaci\00F3n')
,p_source=>'P42_DIRECCION'
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
 p_id=>wwv_flow_api.id(72452109688764234)
,p_name=>'P104_UBCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(196542329883579722)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_source=>'select upper (nmbre_pais || '' '' || nmbre_dprtmnto || '' ''|| nmbre_mncpio)ubccion from v_df_s_municipios where id_mncpio = :P42_ID_MNCPIO;'
,p_source_type=>'QUERY'
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
 p_id=>wwv_flow_api.id(72452549917764234)
,p_name=>'P104_TLFNO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(196542329883579722)
,p_prompt=>unistr('Tel\00E9fono')
,p_source=>'P42_TLFNO'
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
 p_id=>wwv_flow_api.id(72452998914764242)
,p_name=>'P104_CLLAR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(196542329883579722)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72453363062764243)
,p_name=>'P104_EMAIL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(196542329883579722)
,p_prompt=>'Email'
,p_source=>'P42_EMAIL'
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
 p_id=>wwv_flow_api.id(72453773771764243)
,p_name=>'P104_ID_SLCTNTE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(196542329883579722)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72454154801764243)
,p_name=>'P104_ID_SLCTUD'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(196542329883579722)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(72455671522764256)
,p_computation_sequence=>20
,p_computation_item=>'P104_ID_CNVNIO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ID_CNVNIO',
'  FROM V_GF_G_CONVENIOS  ',
' WHERE ID_INSTNCIA_FLJO_HJO = :F_ID_INSTNCIA_FLJO'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(72455289497764251)
,p_computation_sequence=>20
,p_computation_item=>'F_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P104_ID_INSTNCIA_FLJO'
,p_computation_error_message=>'TTERT'
,p_compute_when=>'P104_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72455986619764256)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Recuperaci\00F3n Datos Solicitante y sujeto impuesto')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  a.id_slctnte,',
'            b.id_impsto,',
'            b.id_impsto_sbmpsto,',
'            a.id_slctud,',
'            a.cdgo_idntfccion_tpo,',
'            a.idntfccion,',
'            a.nmbre_slctnte,',
'            a.ubccion,',
'            a.drccion_ntfccion,',
'            a.tlfno,',
'            a.cllar,',
'            a.email,',
'            c.id_sjto_impsto,',
'            c.cdgo_sjto_tpo,',
'            c.idntfccion_sjto_frmtda,',
'            upper(c.nmbre_impsto),',
'            d.nmbre_impsto_sbmpsto,',
'            c.drccion,',
'            upper(c.nmbre_pais || ''-'' || c.nmbre_dprtmnto || ''-'' || c.nmbre_mncpio) ubccion_sjto',
'      into ',
'           :P104_ID_SLCTNTE,',
'           :P104_ID_IMPSTO,',
'           :P104_ID_IMPSTO_SBMPSTO,',
'           :P104_ID_SLCTUD,',
'           :P104_CDGO_IDNTFCION_TPO,',
'           :P104_NMRO_IDNTFCION,',
'           :P104_NMBRE_CMPLTO,',
'           :P104_UBCCION,',
'           :P104_DRCCION_NTFCCION,',
'           :P104_TLFNO,',
'           :P104_CLLAR,',
'           :P104_EMAIL,',
'           :P104_ID_SJTO_IMPSTO,',
'           :P104_CDGO_SJTO_TPO,',
'           :P104_IDNTFCCION,',
'           :P104_NMBRE_IMPSTO,',
'           :P104_NMBRE_IMPSTO_SBMPSTO,',
'           :P104_DRCCION,',
'           :P104_UBCCION_SJTO',
'     from v_pq_g_solicitantes           a',
'     join v_pq_g_solicitudes            b on a.id_slctud = b.id_slctud',
'     join v_si_i_sujetos_impuesto       c on b.id_impsto = c.id_impsto and b.idntfccion = c.idntfccion_sjto',
'     join df_i_impuestos_subimpuesto    d on b.id_impsto = c.id_impsto and b.id_impsto_sbmpsto = d.id_impsto_sbmpsto ',
'    where b.id_instncia_fljo_gnrdo      = :F_ID_INSTNCIA_FLJO;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P104_ID_INSTNCIA_FLJO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72456323119764261)
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
