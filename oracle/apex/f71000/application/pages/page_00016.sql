prompt --application/pages/page_00016
begin
wwv_flow_api.create_page(
 p_id=>16
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Gesti\00F3n de Modificaci\00F3n de Acuerdo de Pago')
,p_step_title=>unistr('Aprobaci\00F3n Modificaci\00F3n de Acuerdo de Pago')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20210826103323'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113123870836948203)
,p_plug_name=>'Workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'false'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113284023151330901)
,p_plug_name=>'Datos del Convenio'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113284118834330902)
,p_plug_name=>'<b>SUJETO TRIBUTO</b>'
,p_parent_plug_id=>wwv_flow_api.id(113284023151330901)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113284220746330903)
,p_plug_name=>unistr('<b>INFORMACI\00D3N DEL SOLICITANTE</b>')
,p_parent_plug_id=>wwv_flow_api.id(113284023151330901)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113288492055330945)
,p_plug_name=>'tab'
,p_parent_plug_id=>wwv_flow_api.id(113284023151330901)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-md'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113284418690330905)
,p_plug_name=>'Datos del Acuerdo'
,p_parent_plug_id=>wwv_flow_api.id(113288492055330945)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-none:margin-bottom-none'
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
 p_id=>wwv_flow_api.id(113287668475330937)
,p_plug_name=>'Cartera'
,p_parent_plug_id=>wwv_flow_api.id(113284418690330905)
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
'    where id_cnvnio = :P16_ID_CNVNIO;'))
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
 p_id=>wwv_flow_api.id(120243635663043205)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LOBREDOR'
,p_internal_uid=>120243635663043205
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(120243781399043206)
,p_db_column_name=>'VGNCIA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(120243889912043207)
,p_db_column_name=>'PRDO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(120243936410043208)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Capital'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(120244059305043209)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Inter\00E9s')
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(120244100480043210)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Total'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(120258083688071002)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1202581'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA:PRDO:VLOR_CPTAL:VLOR_INTRES:VLOR_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113288523704330946)
,p_plug_name=>'Plan de Pago'
,p_parent_plug_id=>wwv_flow_api.id(113284418690330905)
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
'  where id_cnvnio = :P16_ID_CNVNIO;',
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
 p_id=>wwv_flow_api.id(113288675108330947)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JIRIARTE'
,p_internal_uid=>113288675108330947
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113288708152330948)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Cuota')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113288926064330950)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Fecha Cuota'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113288809545330949)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>40
,p_column_identifier=>'B'
,p_column_label=>'Valor Total'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(113454993016954933)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1134550'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CTA:FCHA_VNCMNTO:VLOR_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(218661003347691741)
,p_plug_name=>unistr('Tipo de Modificaci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(113288492055330945)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(223153864614263345)
,p_plug_name=>'Plan de pago'
,p_parent_plug_id=>wwv_flow_api.id(218661003347691741)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--hiddenOverflow:t-Form--slimPadding'
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
'  where id_cnvnio_mdfccion = :P16_ID_CNVNIO_MDFCCION',
'  and   c.actvo =''S'';'))
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
 p_id=>wwv_flow_api.id(120243238905043201)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LOBREDOR'
,p_internal_uid=>120243238905043201
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(120243325737043202)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00FAmero Cuota')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(120243471194043203)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Total'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(120243588202043204)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Fecha Vencimiento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122623633170848701)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Capital'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122623757273848702)
,p_db_column_name=>'VLOR_FNCNCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Financiaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122623861186848703)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Inter\00E9s')
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(120251687221046249)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1202517'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CTA:FCHA_VNCMNTO:VLOR_CPTAL:VLOR_INTRES:VLOR_FNCNCION:VLOR_TTAL:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(260790803478966321)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(177374655004050691)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(438727495283635525)
,p_plug_name=>'Ayuda'
,p_parent_plug_id=>wwv_flow_api.id(260790803478966321)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
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
'    <p align="justify">En esta Funcionalidad.<br><br> ',
unistr('        <b>1.</b> Se muestra la informaci\00F3n de la modificaci\00F3n del acuerdo de pago.<br><br>'),
unistr('        <b>2.</b> Se permite aprobar la modificaci\00F3n del acuerdo de pago.<br><br>'),
unistr('        <b>3.</b> Se permite seleccionar la opci\00F3n de aplicar o rechazar la modificaci\00F3n del acuerdo.'),
'    </p>',
'</i>     '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(121236152210704474)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(260790803478966321)
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
 p_id=>wwv_flow_api.id(115537962639211351)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(260790803478966321)
,p_button_name=>'BTN_APROBAR_MDFCCION'
,p_button_static_id=>'BTN_APROBAR_ACUERDO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Aprobar Modificaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P16_CDGO_CNVNIO_MDFCCION_ESTDO'
,p_button_condition2=>'RGS'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(119255002123443701)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(260790803478966321)
,p_button_name=>'APLICAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Aplicar Modificaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P16_CDGO_CNVNIO_MDFCCION_ESTDO'
,p_button_condition2=>'APB'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113308953615400012)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(260790803478966321)
,p_button_name=>'BTN_RECHAZAR_MODIFICACION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Rechazar Modifcaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'R'
,p_button_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_icon_css_classes=>'fa-clipboard-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(119255148468443702)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(260790803478966321)
,p_button_name=>'RECHAZAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>unistr('Rechazar Modificaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition=>':P16_CDGO_CNVNIO_MDFCCION_ESTDO = ''APB'' OR :P16_CDGO_CNVNIO_MDFCCION_ESTDO = ''RGS'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113284595000330906)
,p_name=>'P16_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(113284023151330901)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113284674637330907)
,p_name=>'P16_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(113284023151330901)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113284797362330908)
,p_name=>'P16_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(113284023151330901)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113284860399330909)
,p_name=>'P16_ID_ACTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(113284023151330901)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113284943661330910)
,p_name=>'P16_NMBRE_ACTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(113284023151330901)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113285017559330911)
,p_name=>'P16_ID_CNVNIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(113284118834330902)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113285139630330912)
,p_name=>'P16_IDNTFCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(113284118834330902)
,p_prompt=>unistr('Identificaci\00F3n')
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
 p_id=>wwv_flow_api.id(113285294863330913)
,p_name=>'P16_DRCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(113284118834330902)
,p_prompt=>unistr('Direcci\00F3n')
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
 p_id=>wwv_flow_api.id(113285364990330914)
,p_name=>'P16_RSPSTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(113284118834330902)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113285469461330915)
,p_name=>'P16_ID_INSTNCIA_FLJO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(113284118834330902)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113285582957330916)
,p_name=>'P16_NMBRE_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(113284118834330902)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113285600419330917)
,p_name=>'P16_NMBRE_IMPSTO_SBIMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(113284118834330902)
,p_prompt=>'Sub Tributo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113285706811330918)
,p_name=>'P16_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(113284220746330903)
,p_prompt=>unistr('Tipo Identificaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113285837651330919)
,p_name=>'P16_NMRO_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(113284220746330903)
,p_prompt=>unistr('Identificaci\00F3n')
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
 p_id=>wwv_flow_api.id(113285960161330920)
,p_name=>'P16_NMBRE_CMPLTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(113284220746330903)
,p_prompt=>'Nombre'
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
 p_id=>wwv_flow_api.id(113286053896330921)
,p_name=>'P16_UBCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(113284220746330903)
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
 p_id=>wwv_flow_api.id(113286155790330922)
,p_name=>'P16_DRCCION_NTFCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(113284220746330903)
,p_prompt=>unistr('Direcci\00F3n Notificaci\00F3n')
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
 p_id=>wwv_flow_api.id(113286225780330923)
,p_name=>'P16_TLFNO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(113284220746330903)
,p_prompt=>unistr('Tel\00E9fono/Celular')
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
 p_id=>wwv_flow_api.id(113286314909330924)
,p_name=>'EMAIL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(113284220746330903)
,p_prompt=>'Email'
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
 p_id=>wwv_flow_api.id(113286409725330925)
,p_name=>'P16_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(113284418690330905)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113286581974330926)
,p_name=>'P16_NMRO_CNVNIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(113284418690330905)
,p_prompt=>unistr('Acuerdo N\00B0 :')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113286631061330927)
,p_name=>'P16_CDGO_CNVNIO_ESTDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(113284418690330905)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113286706440330928)
,p_name=>'P16_ID_CNVNIO_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(113284418690330905)
,p_prompt=>'Tipo de Acuerdo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_CONVENIO_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       ID_CNVNIO_TPO as r',
'  from gf_d_convenios_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
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
 p_id=>wwv_flow_api.id(113286894261330929)
,p_name=>'P16_VLOR_CTA_INCIAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(113284418690330905)
,p_prompt=>'Valor Cuota Inicial'
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
 p_id=>wwv_flow_api.id(113286948226330930)
,p_name=>'P16_FCHA_PGO_CTA_INCIAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(113284418690330905)
,p_prompt=>'Fecha Limite Pago'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113287096184330931)
,p_name=>'P16_FCHA_PRMRA_CTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(113284418690330905)
,p_prompt=>'Fecha Primera Cuota'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113287115352330932)
,p_name=>'P16_NMRO_CTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(113284418690330905)
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
 p_id=>wwv_flow_api.id(113287278027330933)
,p_name=>'P16_CDGO_PRDCDAD'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(113284418690330905)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113287336132330934)
,p_name=>'P16_NMRO_CTAS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(113284418690330905)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113287743202330938)
,p_name=>'P16_CNVNIO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(113284418690330905)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113466893868059153)
,p_name=>'P16_CDGO_CNVNIO_MDFCCION_TPO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(218661003347691741)
,p_prompt=>unistr('Tipo de Modificaci\00F3n ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_MODIFICACION_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.dscrpcion as d',
'       ,t.cdgo_cnvnio_mdfccion_tpo as r',
'  from gf_d_convenios_mdfccn_tpo t',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113467661015059161)
,p_name=>'P16_MDFCCION_NMRO_CTA_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(218661003347691741)
,p_prompt=>unistr('Tipo Modificaci\00F3n N\00FAmero de Cuotas')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>unistr('STATIC:Adici\00F3n;ADC,Reducci\00F3n;RDC')
,p_lov_display_null=>'YES'
,p_display_when=>'P16_CDGO_CNVNIO_MDFCCION_TPO'
,p_display_when2=>'MNC'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113468006335059161)
,p_name=>'P16_NVO_NMRO_CTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(218661003347691741)
,p_prompt=>unistr('Nuevo N\00FAmero de Cuotas')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P16_CDGO_CNVNIO_MDFCCION_TPO'
,p_display_when2=>'MNC'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113468488543059162)
,p_name=>'P16_FCHA_MINA_ADDDA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(218661003347691741)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select min(m.fcha_vncmnto)  + 1',
'  from v_gf_g_convenios_extracto m',
' where m.id_cnvnio = :P16_ID_CNVNIO',
'   and m.actvo = ''S''',
'   and m.estdo_cta = ''ADEUDADA'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113468831001059162)
,p_name=>'P16_FCHA_SGTE_CTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(218661003347691741)
,p_prompt=>'Fecha Siguiente de Cuota'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P16_CDGO_CNVNIO_MDFCCION_TPO'
,p_display_when2=>'MFC'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_02=>'&P16_FCHA_MINA_ADDDA.'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113469282816059162)
,p_name=>'P16_CDGO_PRDCDAD_CTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(218661003347691741)
,p_prompt=>'Periodicidad De Cuota'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_PERIODICIDAD'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_prdcdad as r',
'  from df_s_periodicidad',
' order by cntdad_vce_anio desc'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_display_when=>'P16_CDGO_CNVNIO_MDFCCION_TPO'
,p_display_when2=>'AVA'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113470053732059163)
,p_name=>'P16_NVO_ID_PRDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(218661003347691741)
,p_prompt=>'Vigencia'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Vigencia-Periodo: '' || vgncia||'' - ''|| prdo  || '', con Saldo: ['' || to_char(sum(vlor_sldo_cptal) + sum(vlor_intres), ''FM$999G999G999G999G999G999G990'') ||'']''  d,',
'       id_prdo',
'  from v_gf_g_cartera_x_vigencia ',
' where cdgo_mvnt_fncro_estdo = ''NO''',
'   and cdgo_clnte = :F_CDGO_CLNTE',
'   and id_sjto_impsto = :P16_ID_SJTO_IMPSTO',
'   and (vgncia, id_prdo ) not in (select vgncia, id_prdo ',
'                                     from gf_g_convenios_cartera',
'                                    where id_cnvnio = :P16_ID_CNVNIO)',
'group by id_prdo, prdo, vgncia                        ',
'',
'',
''))
,p_lov_display_null=>'YES'
,p_display_when=>'P16_CDGO_IDNTFCCION_TPO'
,p_display_when2=>'AVA'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'30%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113470408091059163)
,p_name=>'P16_ID_CNVNIO_MDFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(218661003347691741)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113482515378126802)
,p_name=>'P16_CDGO_CNVNIO_MDFCCION_ESTDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(218661003347691741)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(115582702982419086)
,p_name=>'P16_RSPTA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(113284023151330901)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(119255367012443704)
,p_name=>'P16_A_O_R'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(113284023151330901)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122601673742709701)
,p_name=>'P16_DSC_CNVNIO_MDFCCION_ESTDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(218661003347691741)
,p_prompt=>unistr('Estado Modificaci\00F3n')
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
 p_id=>wwv_flow_api.id(123100105144154401)
,p_name=>'P16_DSCRPCION_PRDCDAD_CTA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(218661003347691741)
,p_prompt=>'Periodicidad Cuotas'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_display_when=>'P16_CDGO_CNVNIO_MDFCCION_TPO'
,p_display_when2=>'MFC'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123426241225827803)
,p_name=>'P16_CDGO_ESTDO_TRNSCION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(218661003347691741)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(117119702277858102)
,p_computation_sequence=>10
,p_computation_item=>'P16_ID_CNVNIO_MDFCCION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_cnvnio_mdfccion',
'  from gf_g_convenios_modificacion b',
' where b.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO;'))
,p_compute_when=>'P16_ID_CNVNIO_MDFCCION'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(119065435201244601)
,p_name=>'Borrar Ruta Actual'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(113308953615400012)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(119065544417244602)
,p_event_id=>wwv_flow_api.id(119065435201244601)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.localStorage.removeItem(''wf_link'');',
'apex.submit(''BTN_APROBAR_CVN_MDFCCION'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(113287452988330935)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de Convenios'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  idntfccion_sjto_frmtda,',
'            a.drccion,',
'            a.id_cnvnio_tpo,',
'            a.nmro_cnvnio,',
'            a.cdgo_idntfccion_tpo_slctnte,',
'            a.nmro_idntfccion_slctnte,',
'            a.nmbre_slctnte,',
'            a.drccion_ntfccion,',
'            a.nmbre_pais_ntfccion || '' - '' || nmbre_dprtmnto_ntfccion || '' - '' || nmbre_mncpio_ntfccion,',
'           -- a.email,',
'            a.tlfno || '' - '' || a.cllar,',
'            to_char(a.vlor_cta_incial, :F_FRMTO_MNDA),',
'            to_char(a.fcha_lmte_cta_incial, ''DD/MM/YYYY''),',
'            a.nmro_cta,',
'            a.cdgo_prdcdad_cta,',
'            to_char(a.fcha_prmra_cta, ''DD/MM/YYYY''),',
'            a.cdgo_cnvnio_estdo,',
'            a.id_instncia_fljo_hjo,',
'            a.nmro_mxmo_ctas,',
'            a.id_impsto,',
'            a.id_impsto_sbmpsto,',
'            a.id_sjto_impsto,',
'            a.nmbre_impsto,',
'            a.nmbre_impsto_sbmpsto,',
'            a.cdgo_idntfccion_tpo_slctnte,',
'            a.nmro_rdcdo_dsplay,',
'            a.id_cnvnio,',
'            a.cdgo_cnvnio_mdfccion_tpo,',
'            a.cdgo_cnvnio_mdfccion_estdo,',
'            a.dscrpcn_cnvnio_mdfccion_estdo,',
'            a.dscrpcn_mdfccion_nmro_cta_tpo,',
'            a.fcha_sgte_cta,',
'            a.nvo_nmro_cta,',
'            a.cdgo_prdcdad_cta,',
'            b.id_prdo,',
'            a.dscrpcion_prdcdad_cta',
'            ',
'       into :P16_IDNTFCCION,',
'            :P16_DRCCION,',
'            :P16_ID_CNVNIO_TPO,',
'            :P16_NMRO_CNVNIO,',
'            :P16_CDGO_IDNTFCCION_TPO,',
'            :P16_NMRO_IDNTFCCION,',
'            :P16_NMBRE_CMPLTO,',
'            :P16_DRCCION_NTFCCION,',
'            :P16_UBCCION,',
'           -- :P16_EMAIL,',
'            :P16_TLFNO,',
'            :P16_VLOR_CTA_INCIAL,',
'            :P16_FCHA_PGO_CTA_INCIAL,',
'            :P16_NMRO_CTA, ',
'            :P16_CDGO_PRDCDAD,',
'            :P16_FCHA_PRMRA_CTA,',
'            :P16_CDGO_CNVNIO_ESTDO,',
'            :P16_ID_INSTNCIA_FLJO,',
'            :P16_NMRO_CTAS,',
'            :P16_ID_IMPSTO,',
'            :P16_ID_IMPSTO_SBMPSTO,',
'            :P16_ID_SJTO_IMPSTO,',
'            :P16_NMBRE_IMPSTO,',
'            :P16_NMBRE_IMPSTO_SBIMPSTO,',
'            :P16_CDGO_IDNTFCCION_TPO,',
'            :P16_NMRO_RDCDO_DSPLAY,',
'            :P16_ID_CNVNIO,',
'            :P16_CDGO_CNVNIO_MDFCCION_TPO,',
'            :P16_CDGO_CNVNIO_MDFCCION_ESTDO,',
'            :P16_DSC_CNVNIO_MDFCCION_ESTDO,',
'            :P16_MDFCCION_NMRO_CTA_TPO,',
'            :P16_FCHA_SGTE_CTA,',
'            :P16_NVO_NMRO_CTA,',
'            :P16_CDGO_PRDCDAD_CTA,',
'            :P16_NVO_ID_PRDO,',
'            :P16_DSCRPCION_PRDCDAD_CTA',
'       from v_gf_g_convenios_modificacion a',
'       left join gf_g_convenios_mdfccn_vgnc b on a.id_cnvnio_mdfccion = b.id_cnvnio_mdfccion',
'       where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO;       ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P16_ID_CNVNIO_MDFCCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(115538863338244647)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Aprobado Modificaci\00F3n de Acuerdo de pagos')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_cdgo_rspsta  number;',
'',
'begin',
' ',
'    prc_ap_mdfccion_acuerdo_pago(p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                 p_id_cnvnio_mdfccion => :P16_ID_CNVNIO_MDFCCION,',
'                                 o_cdgo_rspsta        => v_cdgo_rspsta, ',
'                                 o_mnsje_rspsta       => :P16_RSPTA); ',
'                                 ',
'     apex_util.set_session_state(''F_ID_FLJO_TREA'','''');',
' end ; '))
,p_process_error_message=>'&P16_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(115537962639211351)
,p_process_success_message=>'&P16_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(119255259707443703)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'VALIDA APROBACION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if(:REQUEST = ''APLICAR'')then',
'        begin',
'            update gf_g_convenios_modificacion',
'               set cdgo_estdo_trnscion = ''APL''',
'             where id_cnvnio_mdfccion = :P16_ID_CNVNIO_MDFCCION;',
'        exception',
'            when others then',
unistr('                raise_application_error(-20001, ''No se Actualiz\00F3 la transicion'');'),
'        end;        ',
'    elsif(:REQUEST = ''RECHAZAR'')then',
'         begin',
'            update gf_g_convenios_modificacion',
'               set cdgo_estdo_trnscion = ''RCH''',
'             where id_cnvnio_mdfccion = :P16_ID_CNVNIO_MDFCCION;',
'        exception',
'            when others then',
unistr('                raise_application_error(-20001, ''No se Actualiz\00F3 la transicion'');'),
'        end;',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'APLICAR,RECHAZAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(123426146324827802)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar etapa a transitar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_estdo_trnscion',
'  into :P16_CDGO_ESTDO_TRNSCION',
'  from gf_g_convenios_modificacion',
' where id_cnvnio_mdfccion = :P16_ID_CNVNIO_MDFCCION; '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'APLICAR, RECHAZAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(119282341262008601)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'Workflow'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'APLICAR,RECHAZAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
