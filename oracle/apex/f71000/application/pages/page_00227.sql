prompt --application/pages/page_00227
begin
wwv_flow_api.create_page(
 p_id=>227
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Resumen Modificaci\00F3n Acuerdo')
,p_step_title=>unistr('Resumen Modificaci\00F3n Acuerdo')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20210826103838'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122638975137132701)
,p_plug_name=>'workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'false'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122639033933132702)
,p_plug_name=>unistr('Datos Modificaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(235946804816519015)
,p_plug_name=>'<b>Acuerdo de Pago</b>'
,p_parent_plug_id=>wwv_flow_api.id(122639033933132702)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(235950054601519047)
,p_plug_name=>'Cartera'
,p_parent_plug_id=>wwv_flow_api.id(235946804816519015)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody:margin-top-md'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select c.vgncia,',
'          p.prdo,  ',
'          to_char(c.vlor_cptal, :F_FRMTO_MNDA) vlor_cptal,',
'          to_char(c.vlor_intres, :F_FRMTO_MNDA) vlor_intres,',
'          to_char(c.vlor_cptal+vlor_intres , :F_FRMTO_MNDA)vlor_ttal',
'    from gf_g_convenios_cartera c',
'    join df_i_periodos p',
'      on p.id_prdo = c.id_prdo    ',
'    where id_cnvnio = :P227_ID_CNVNIO;'))
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
 p_id=>wwv_flow_api.id(242906021789231315)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LOBREDOR'
,p_internal_uid=>242906021789231315
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122667574201188172)
,p_db_column_name=>'VGNCIA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122667999916188173)
,p_db_column_name=>'PRDO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122668396190188174)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Capital'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122668700304188174)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Inter\00E9s')
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122669144279188174)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Total'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(242920469814259112)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1226695'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA:PRDO:VLOR_CPTAL:VLOR_INTRES:VLOR_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(235950909830519056)
,p_plug_name=>'Plan de Pago'
,p_parent_plug_id=>wwv_flow_api.id(235946804816519015)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody:margin-top-md'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmro_cta,',
'        to_char(vlor_ttal, :F_FRMTO_MNDA) vlor_ttal,',
'        fcha_vncmnto',
'   from gf_g_convenios_extracto c',
'  where id_cnvnio = :P227_ID_CNVNIO;',
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
 p_id=>wwv_flow_api.id(235951061234519057)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JIRIARTE'
,p_internal_uid=>235951061234519057
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122670250766188208)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Cuota')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122671020219188209)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Fecha Cuota'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122670670715188208)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>40
,p_column_identifier=>'B'
,p_column_label=>'Valor Total'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(236117379143143043)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1226714'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CTA:FCHA_VNCMNTO:VLOR_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(341323389473879851)
,p_plug_name=>unistr('<b>Modificaci\00F3n Acuerdo de Pago</b>')
,p_parent_plug_id=>wwv_flow_api.id(122639033933132702)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(345816250740451455)
,p_plug_name=>'Plan de pago'
,p_parent_plug_id=>wwv_flow_api.id(341323389473879851)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmro_cta,',
'        to_char(vlor_cptal, :F_FRMTO_MNDA) vlor_cptal,',
'        to_char(vlor_fncncion, :F_FRMTO_MNDA) vlor_fncncion,',
'        to_char(vlor_intres, :F_FRMTO_MNDA) vlor_intres,',
'        to_char(vlor_ttal, :F_FRMTO_MNDA) vlor_ttal,',
'        fcha_vncmnto',
'   from gf_g_cnvnios_mdfccn_extrct c',
'  where id_cnvnio_mdfccion = :P227_ID_CNVNIO_MDFCCION;'))
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
 p_id=>wwv_flow_api.id(242905625031231311)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LOBREDOR'
,p_internal_uid=>242905625031231311
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122676474648188238)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00FAmero Cuota')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122676876822188238)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Total'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122677271785188239)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Fecha Vencimiento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122677673327188244)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Capital'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122678001325188244)
,p_db_column_name=>'VLOR_FNCNCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Financiaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122678443344188245)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Inter\00E9s')
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(242914073347234359)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1226788'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CTA:FCHA_VNCMNTO:VLOR_CPTAL:VLOR_FNCNCION:VLOR_INTRES:VLOR_TTAL:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(639415036983512259)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(639621229139271023)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i></b>',
'</h5>',
'<i>Funcionalidad que Permite:</i><br><br>',
unistr('<i><b>1.</b> Visualizar Detalle de Modificaci\00F3n de Acuerdo de Pago.</i><br><br>'),
unistr('<i><b>2.</b> Finalizar el Flujo de Modificaci\00F3n de Acuerdo de Pago.</i>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(122644948591137014)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(639415036983512259)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:187:&SESSION.::&DEBUG.:RP,187::'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(122647325056137017)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(639415036983512259)
,p_button_name=>'BTN_TERMINAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Terminar Flujo'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (select 1',
'          from gf_g_convenios_modificacion a',
'          join wf_g_instancias_transicion b on a.id_instncia_fljo_hjo = b.id_instncia_fljo',
'                                              and b.id_estdo_trnscion in (1,2) ',
'         where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO) and :P227_ID_ACTO is not null;'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122639141439132703)
,p_name=>'P227_ID_INSTNCIA_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(122639033933132702)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122639524707132707)
,p_name=>'P227_ID_CNVNIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(341323389473879851)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122639665262132708)
,p_name=>'P227_DSC_CNVNIO_MDFCCION_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(341323389473879851)
,p_prompt=>unistr('Tipo de Modificaci\00F3n Acuerdo')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122639733026132709)
,p_name=>'P227_NVO_NMRO_CTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(341323389473879851)
,p_prompt=>unistr('Nuevo N\00FAmero Cuotas')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_display_when=>'P227_CDGO_CNVNIO_MDFCCION_TPO'
,p_display_when2=>'MNC'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122639875554132710)
,p_name=>'P227_DSC_CNVNIO_MDFCCION_ESTDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(341323389473879851)
,p_prompt=>'Estado'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122639981766132711)
,p_name=>'P227_DSC_MDFCCION_NMRO_CTA_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(341323389473879851)
,p_prompt=>unistr('Tipo Modificaci\00F3n Cuota')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P227_CDGO_CNVNIO_MDFCCION_TPO'
,p_display_when2=>'MNC'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122640060098132712)
,p_name=>'P227_DSC_PRDCDAD_CTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(341323389473879851)
,p_prompt=>'Periodicidad'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P227_CDGO_CNVNIO_MDFCCION_TPO'
,p_display_when2=>'MFC'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122640123364132713)
,p_name=>'P227_FCHA_SGTE_CTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(341323389473879851)
,p_prompt=>'Fecha Cuota Siguiente'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_display_when=>'P227_CDGO_CNVNIO_MDFCCION_TPO'
,p_display_when2=>'MFC'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122640293619132714)
,p_name=>'P227_NMRO_ACTO_MDFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(341323389473879851)
,p_prompt=>unistr('N\00FAmero Acto')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122640358767132715)
,p_name=>'P227_VGNCIA_MDFCCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(341323389473879851)
,p_prompt=>'Vigencias Adicionadas'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P227_CDGO_CNVNIO_MDFCCION_TPO'
,p_display_when2=>'AVA'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122640457419132716)
,p_name=>'P227_IDNTFCCION_SJTO_FRMTDA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(235946804816519015)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122640582511132717)
,p_name=>'P227_ID_CNVNIO_MDFCCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(341323389473879851)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122640620094132718)
,p_name=>'P227_CDGO_CNVNIO_MDFCCION_TPO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(341323389473879851)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122662941536188114)
,p_name=>'P227_NMRO_CNVNIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(235946804816519015)
,p_prompt=>unistr('N\00FAmero Acuerdo')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122663361759188123)
,p_name=>'P227_DSCRPCION_CNVNIO_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(235946804816519015)
,p_prompt=>'Tipo Acuerdo de Pago'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122663751887188123)
,p_name=>'P227_DSCRPCION_CNVNIO_ESTDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(235946804816519015)
,p_prompt=>'Estado'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122664177623188123)
,p_name=>'P227_FCHA_APLCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(235946804816519015)
,p_prompt=>unistr('Fecha Aplicaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122664565739188153)
,p_name=>'P227_NMRO_CTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(235946804816519015)
,p_prompt=>unistr('N\00FAmero Cuotas')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122664830832188153)
,p_name=>'P227_NMRO_ACTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(235946804816519015)
,p_prompt=>unistr('N\00FAmero Acto')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122665203985188161)
,p_name=>'P227_DSCRPCION_PRDCDAD_CTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(235946804816519015)
,p_prompt=>'Periodicidad'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122666040884188161)
,p_name=>'P227_VGNCIA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(235946804816519015)
,p_prompt=>'Vigencia(s)'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123022318102465201)
,p_name=>'P227_ID_ACTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(341323389473879851)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123022450168465202)
,p_name=>'P227_RSPSTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(122639033933132702)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(122639285011132704)
,p_computation_sequence=>10
,p_computation_item=>'P227_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'F_ID_INSTNCIA_FLJO'
,p_compute_when=>'P227_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(122640741535132719)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Finalizaci\00F3n Flujos')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'begin',
'',
'   prc_t_mdfccion_acuerdo_pntal( p_cdgo_clnte         =>  :F_CDGO_CLNTE,',
'                                  p_id_cnvnio_mdfccion => :P227_ID_CNVNIO_MDFCCION,',
'                                  p_id_usrio           => :F_ID_USRIO,',
'                                  p_id_acto            => :P227_ID_ACTO,',
'                                  o_cdgo_rspsta        => v_cdgo_rspsta,',
'                                  o_mnsje_rspsta       => :P227_RSPSTA);',
'                                  ',
'   if v_cdgo_rspsta = 0 then',
'       :P227_RSPSTA := ''Flujo Terminado Satisfactoriamente!'';',
'   end if;',
'   ',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(122647325056137017)
,p_process_success_message=>'&P227_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(122639430935132706)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar Datos Modificaci\00F3n Acuerdo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  a.id_cnvnio,',
'            a.id_cnvnio_mdfccion,',
'            a.dscrpcion_cnvnio_mdfccion_tpo,',
'            a.nvo_nmro_cta,',
'            a.dscrpcn_cnvnio_mdfccion_estdo,',
'            a.dscrpcn_mdfccion_nmro_cta_tpo,',
'            a.dscrpcion_prdcdad_cta,',
'            a.fcha_sgte_cta,',
'            a.nmro_acto,',
'            a.cdgo_cnvnio_mdfccion_tpo,',
'            b.vgncia,',
'            a.id_acto',
'       into :P227_ID_CNVNIO,',
'            :P227_ID_CNVNIO_MDFCCION,   ',
'            :P227_DSC_CNVNIO_MDFCCION_TPO,',
'            :P227_NVO_NMRO_CTA,',
'            :P227_DSC_CNVNIO_MDFCCION_ESTDO,',
'            :P227_DSC_MDFCCION_NMRO_CTA_TPO,',
'            :P227_DSC_PRDCDAD_CTA,',
'            :P227_FCHA_SGTE_CTA,',
'            :P227_NMRO_ACTO_MDFCCION,',
'            :P227_CDGO_CNVNIO_MDFCCION_TPO,',
'            :P227_VGNCIA_MDFCCION,',
'            :P227_ID_ACTO',
'       from v_gf_g_convenios_modificacion a',
'  left join gf_g_convenios_mdfccn_vgnc b on a.id_cnvnio_mdfccion = b.id_cnvnio_mdfccion',
'      where a.id_instncia_fljo_hjo = :P227_ID_INSTNCIA_FLJO;      ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(122639315476132705)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Acuerdo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  a.nmro_cnvnio,',
'            a.dscrpcion_cnvnio_tpo,           ',
'            a.dscrpcion_cnvnio_estdo,',
'            a.fcha_aplccion,',
'            a.nmro_cta,',
'            a.idntfccion_sjto_frmtda,',
'            a.nmro_acto,',
'            a.dscrpcion_prdcdad_cta,',
'            (select listagg(vgncia, '', '') within group (order by vgncia) vgncia',
'              from v_gf_g_convenios_cartera a',
'             where a.id_cnvnio = :P227_ID_CNVNIO) vgncia',
'       into :P227_NMRO_CNVNIO,',
'            :P227_DSCRPCION_CNVNIO_TPO,',
'            :P227_DSCRPCION_CNVNIO_ESTDO,',
'            :P227_FCHA_APLCCION,',
'            :P227_NMRO_CTA,',
'            :P227_IDNTFCCION_SJTO_FRMTDA,',
'            :P227_NMRO_ACTO,',
'            :P227_DSCRPCION_PRDCDAD_CTA,',
'            :P227_VGNCIA',
'       from v_gf_g_convenios a',
'      where a.id_cnvnio = :P227_ID_CNVNIO;   ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
