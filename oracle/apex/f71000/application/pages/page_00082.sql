prompt --application/pages/page_00082
begin
wwv_flow_api.create_page(
 p_id=>82
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Generaci\00F3n Solicitud ')
,p_step_title=>unistr('Generaci\00F3n Solicitud ')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20210826103759'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(221492844680877450)
,p_plug_name=>'Datos del Convenio'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_plug_template=>wwv_flow_api.id(177337797773050609)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(178022552620644074)
,p_plug_name=>'<b>SUJETO TRIBUTO</b>'
,p_parent_plug_id=>wwv_flow_api.id(221492844680877450)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(178369291164819575)
,p_plug_name=>unistr('<b>INFORMACI\00D3N DEL SOLICITANTE </b>')
,p_parent_plug_id=>wwv_flow_api.id(221492844680877450)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(178369378346819576)
,p_plug_name=>'<b>DATOS DEL CONVENIO</b>'
,p_parent_plug_id=>wwv_flow_api.id(221492844680877450)
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
 p_id=>wwv_flow_api.id(266884980788621140)
,p_plug_name=>'Garantias'
,p_parent_plug_id=>wwv_flow_api.id(178369378346819576)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.id_cnvnio_grntia_adjnto,',
'        a.ID_GRNTIA_TPO tipo_garantia, ',
'       b.DSCRPCION Tipo,',
'       a.DSCRPCION descrip, ',
'       1 descargar',
'  from gf_g_convenios_garantia a',
'  join GF_D_GARANTIAS_TIPO b on a.ID_GRNTIA_TPO = b.ID_GRNTIA_TPO',
'  join gf_g_cnvnios_grntia_adjnto c on a.id_cnvnio_grntia = c.id_cnvnio_grntia',
'  where id_cnvnio = :P82_ID_CNVNIO',
' order by 1',
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
 p_id=>wwv_flow_api.id(223454340674346680)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>223454340674346680
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74556488899665833)
,p_db_column_name=>'DESCRIP'
,p_display_order=>70
,p_column_identifier=>'P'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74556882083665834)
,p_db_column_name=>'TIPO_GARANTIA'
,p_display_order=>80
,p_column_identifier=>'R'
,p_column_label=>'Tipo Garantia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74557205971665851)
,p_db_column_name=>'TIPO'
,p_display_order=>90
,p_column_identifier=>'S'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74555641491665833)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>100
,p_column_identifier=>'T'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:GF_G_CNVNIOS_GRNTIA_ADJNTO:FILE_BLOB:ID_CNVNIO_GRNTIA_ADJNTO::FILE_MIMETYPE:FILE_NAME:::attachment::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74556099485665833)
,p_db_column_name=>'ID_CNVNIO_GRNTIA_ADJNTO'
,p_display_order=>110
,p_column_identifier=>'U'
,p_column_label=>'Id Cnvnio Grntia Adjnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(223489516529096540)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'745576'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TIPO:DESCRIP::DESCARGAR:ID_CNVNIO_GRNTIA_ADJNTO'
,p_break_on=>'TIPO:0:0:0:0'
,p_break_enabled_on=>'0:0:0:0:TIPO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(267746221540805071)
,p_plug_name=>unistr('Proyecci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(178369378346819576)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmro_cta, ',
'        vlor_ttal vlor_cta, ',
'        fcha_vncmnto fcha_cta',
'  from gf_g_convenios_extracto ',
'  where id_cnvnio = :P82_ID_CNVNIO',
' order by nmro_cta'))
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
 p_id=>wwv_flow_api.id(227117075971761971)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'<b>&P44_RSPSTA.</b>'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>227117075971761971
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74553713326665815)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>20
,p_column_identifier=>'F'
,p_column_label=>unistr('N\00B0. Cuota')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74554101280665823)
,p_db_column_name=>'VLOR_CTA'
,p_display_order=>30
,p_column_identifier=>'G'
,p_column_label=>'Valor Cuota'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74554580371665828)
,p_db_column_name=>'FCHA_CTA'
,p_display_order=>40
,p_column_identifier=>'J'
,p_column_label=>'Fecha Cuota'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(269021991971317949)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'745549'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CTA:VLOR_CTA:FCHA_CTA'
,p_sum_columns_on_break=>'VLOR_CTA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(222030373528232100)
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
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(268104249839941348)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
unistr('Esta funcionalidad muestra el tipo de garant\00EDa para respaldar el convenio.</i> ')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74561459307665855)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(222030373528232100)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:47:&SESSION.::&DEBUG.:RP,47::'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74561800293665856)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(222030373528232100)
,p_button_name=>'BTN_APBAR_CONVNIO'
,p_button_static_id=>'BTN_APLCR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aprobar Convenio'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:79:&SESSION.::&DEBUG.:RP:P79_ID_CNVNIO,P79_NMRO_CNVNIO:&P82_ID_CNVNIO.,&P82_NMRO_CNVNIO.'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74562232581665856)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(222030373528232100)
,p_button_name=>'BTN_RC_CNVNIO'
,p_button_static_id=>'BTN_NO_APLCR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Rechazar Convenio'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP:P49_NMRO_CNVNIO,P49_ID_CNVNIO:&P82_NMRO_CNVNIO.,&P82_ID_CNVNIO.'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(74563834930665870)
,p_branch_name=>unistr('Ir a la p\00E1gina 47')
,p_branch_action=>'f?p=&APP_ID.:47:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(74563424910665870)
,p_branch_name=>unistr('Ir a P\00E1gina 70')
,p_branch_action=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'Select * from GF_D_CONVENIOS_TIPO A where a.ID_CNVNIO_TPO = :P41_ID_CNVNIO_TPO and a.indcdor_rqre_grntia = ''S'''
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(74564280873665870)
,p_branch_name=>unistr('Ir a P\00E1gina 44')
,p_branch_action=>'f?p=&APP_ID.:44:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'NOT_EXISTS'
,p_branch_condition=>'Select * from GF_D_CONVENIOS_TIPO A where a.ID_CNVNIO_TPO = :P41_ID_CNVNIO_TPO and a.indcdor_rqre_grntia = ''S'''
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74548372535665802)
,p_name=>'P82_ID_CNVNIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(178022552620644074)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74548711634665804)
,p_name=>'P82_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(178022552620644074)
,p_use_cache_before_default=>'NO'
,p_source=>'P41_ID_SJTO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74549187229665804)
,p_name=>'P82_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(178022552620644074)
,p_prompt=>unistr('Identificaci\00F3n')
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
 p_id=>wwv_flow_api.id(74549528890665804)
,p_name=>'P82_DRCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(178022552620644074)
,p_prompt=>unistr('Direcci\00F3n')
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
 p_id=>wwv_flow_api.id(74549921786665804)
,p_name=>'P82_ID_CNVNIO_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(178022552620644074)
,p_prompt=>'Tipo de Convenio'
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
 p_id=>wwv_flow_api.id(74550391632665805)
,p_name=>'P82_RSPSTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(178022552620644074)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74551059060665806)
,p_name=>'P82_VLOR_CTA_INCIAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(178369378346819576)
,p_prompt=>'Valor de la Cuota Inicial'
,p_format_mask=>'999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(74551442581665809)
,p_name=>'P82_FCHA_PGO_CTA_INCIAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(178369378346819576)
,p_prompt=>unistr(' Fecha L\00EDmite Pago ')
,p_format_mask=>'DD-MON-YYYY'
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
 p_id=>wwv_flow_api.id(74551839269665809)
,p_name=>'P82_FCHA_PRMRA_CTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(178369378346819576)
,p_prompt=>'Fecha Primera Cuota'
,p_format_mask=>'DD-MON-YYYY'
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
 p_id=>wwv_flow_api.id(74552246976665809)
,p_name=>'P82_NMRO_CTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(178369378346819576)
,p_prompt=>unistr('N\00B0 Cuotas')
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
 p_id=>wwv_flow_api.id(74552627370665809)
,p_name=>'P82_CDGO_PRDCDAD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(178369378346819576)
,p_prompt=>'Periodicidad'
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
 p_id=>wwv_flow_api.id(74553054765665810)
,p_name=>'P82_NMRO_CNVNIO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(178369378346819576)
,p_prompt=>unistr('Convenio N\00B0:')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74558354183665853)
,p_name=>'P82_CDGO_IDNTFFCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(178369291164819575)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
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
 p_id=>wwv_flow_api.id(74558799265665853)
,p_name=>'P82_NMRO_IDNTFCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(178369291164819575)
,p_prompt=>unistr('Identificaci\00F3n')
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
 p_id=>wwv_flow_api.id(74559155198665853)
,p_name=>'P82_NMBRE_CMPLTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(178369291164819575)
,p_prompt=>'Nombre'
,p_source_post_computation=>':P42_PRMER_NMBRE || '' '' || :P42_SGNDO_NMBRE || '' '' || :P42_PRMER_APLLDO || '' '' || :P42_SGNDO_APLLDO'
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
 p_id=>wwv_flow_api.id(74559559842665854)
,p_name=>'P82_UBCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(178369291164819575)
,p_prompt=>unistr('Ubicaci\00F3n')
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
 p_id=>wwv_flow_api.id(74559911371665854)
,p_name=>'P82_DRCCION_NTFCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(178369291164819575)
,p_prompt=>unistr('Direcci\00F3n Notificaci\00F3n')
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
 p_id=>wwv_flow_api.id(74560342507665854)
,p_name=>'P82_TLFNO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(178369291164819575)
,p_prompt=>unistr('Tel\00E9fono')
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
 p_id=>wwv_flow_api.id(74560783086665854)
,p_name=>'P82_EMAIL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(178369291164819575)
,p_prompt=>'Email'
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
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74562909583665867)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta del Convenio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'select a.IDNTFCCION_SJTO, ',
'        a.DRCCION,',
'        a.ID_CNVNIO_TPO,',
'        a.NMRO_CNVNIO,',
'        a.CDGO_IDNTFCCION_TPO_SLCTNTE,',
'        a.NMRO_IDNTFCCION_SLCTNTE,',
'        a.NMBRE_SLCTNTE,',
'        a.DRCCION_NTFCCION,',
'        a.NMBRE_PAIS_NTFCCION || '' - '' || NMBRE_DPRTMNTO_NTFCCION || '' - '' || NMBRE_MNCPIO_NTFCCION,',
'        a.EMAIL,',
'        a.TLFNO,',
'        a.vlor_cta_incial,',
'        a.fcha_lmte_cta_incial,',
'        a.nmro_cta,',
'        a.cdgo_prdcdad_cta,',
'        a.fcha_prmra_cta',
'   into :P82_IDNTFCCION,',
'        :P82_DRCCION,',
'        :P82_ID_CNVNIO_TPO,',
'        :P82_NMRO_CNVNIO,',
'        :P82_CDGO_IDNTFFCION_TPO,',
'        :P82_NMRO_IDNTFCION,',
'        :P82_NMBRE_CMPLTO,',
'        :P82_DRCCION_NTFCCION,',
'        :P82_UBCCION,',
'        :P82_TLFNO,',
'        :P82_EMAIL,',
'        :P82_VLOR_CTA_INCIAL,',
'        :P82_FCHA_PGO_CTA_INCIAL,',
'        :P82_NMRO_CTA, ',
'        :P82_CDGO_PRDCDAD,',
'        :P82_FCHA_PRMRA_CTA        ',
'   from v_gf_g_convenios a',
'  where a.id_cnvnio = :P82_ID_CNVNIO;',
'        ',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
