prompt --application/pages/page_00267
begin
wwv_flow_api.create_page(
 p_id=>267
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Reversi\00F3n Acuerdo de Pago')
,p_step_title=>unistr('Reversi\00F3n Acuerdo de Pago')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20201222102136'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(62679074462108109)
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
 p_id=>wwv_flow_api.id(116369701019158509)
,p_plug_name=>'Tabs'
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
 p_id=>wwv_flow_api.id(116354648752121610)
,p_plug_name=>'<b>Datos PQR</b>'
,p_parent_plug_id=>wwv_flow_api.id(116369701019158509)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(116371651880158528)
,p_plug_name=>'<b>Sujeto Tributo</b>'
,p_parent_plug_id=>wwv_flow_api.id(116354648752121610)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody:t-Form--slimPadding:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(116371748946158529)
,p_plug_name=>unistr('<b>Informaci\00F3n Solicitante</b>')
,p_parent_plug_id=>wwv_flow_api.id(116354648752121610)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody:t-Form--slimPadding:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(298632108077634903)
,p_plug_name=>'<b>Datos Acuerdo</b>'
,p_parent_plug_id=>wwv_flow_api.id(116369701019158509)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P267_ID_CNVNIO'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(298635357862634935)
,p_plug_name=>'Cartera'
,p_parent_plug_id=>wwv_flow_api.id(298632108077634903)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody:margin-top-md'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select vgncia,',
'          prdo,',
'          id_orgen,',
'          to_char(sum(vlor_cptal), :F_FRMTO_MNDA) vlor_cptal,',
'          to_char(sum(vlor_intres), :F_FRMTO_MNDA) vlor_intres,',
'          to_char(sum(vlor_cptal) + sum(vlor_intres) , :F_FRMTO_MNDA)vlor_ttal',
'    from v_gf_g_convenios_cartera ',
'   where id_cnvnio = :P267_ID_CNVNIO',
'   group by vgncia, prdo, id_orgen;',
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
 p_id=>wwv_flow_api.id(305591325050347203)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LOBREDOR'
,p_internal_uid=>305591325050347203
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58798081069612533)
,p_db_column_name=>'VGNCIA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58798428018612583)
,p_db_column_name=>'PRDO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58798782405612584)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Capital'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58799192986612584)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Inter\00E9s')
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58799583202612584)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Total'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58799981275612584)
,p_db_column_name=>'ID_ORGEN'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Or\00EDgen')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(305605773075375000)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'588003'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_ORGEN:VGNCIA:PRDO:VLOR_CPTAL:VLOR_INTRES:VLOR_TTAL:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(298636213091634944)
,p_plug_name=>'Plan de Pago'
,p_parent_plug_id=>wwv_flow_api.id(298632108077634903)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody:margin-top-md'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmro_cta,',
'        to_char(vlor_ttal, :F_FRMTO_MNDA) vlor_ttal,',
'        fcha_vncmnto,',
'        estdo_cta',
'   from v_gf_g_convenios_extracto c',
'  where c.id_cnvnio = :P267_ID_CNVNIO',
'   and c.actvo =''S'';'))
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
 p_id=>wwv_flow_api.id(298636364495634945)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JIRIARTE'
,p_internal_uid=>298636364495634945
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58801448666612602)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Cuota')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58802291985612603)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Fecha Cuota'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58801896266612603)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>40
,p_column_identifier=>'B'
,p_column_label=>'Valor Total'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58801016858612602)
,p_db_column_name=>'ESTDO_CTA'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(298802682404258931)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'588026'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CTA:FCHA_VNCMNTO:VLOR_TTAL:ESTDO_CTA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(404017212957996863)
,p_plug_name=>unistr('<b>Datos de Reversi\00F3n</b>')
,p_parent_plug_id=>wwv_flow_api.id(116369701019158509)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P267_ID_CNVNIO_RVRSION'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(702161914224966838)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_api.id(702369255817727898)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i></b>',
'</h5>',
'<i>Funcionalidad que permite<br><br>',
unistr('    <b>1.</b> Visualizar el detalle de la reversi\00F3n de acuerdo de pago y/o rechazo de la misma.<br><br>'),
unistr('    <b>2.</b> Finalizar el flujo de reversi\00F3n de acuerdo de pago.<br><br>'),
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(58792804858612425)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(702161914224966838)
,p_button_name=>'BTN_TERMINAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Terminar Flujo'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from wf_g_instancias_transicion b                                    ',
' where b.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'   and b.id_estdo_trnscion in (1,2) ;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(58792439226612392)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(702161914224966838)
,p_button_name=>'BTN_VER_ACTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Ver Acto'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P267_ID_ACTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(58814575977612785)
,p_branch_name=>unistr('Ir a P\00E1gina 127 App 50000')
,p_branch_action=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR,P127_COLUMNA_FILENAME:v_gn_g_actos,file_blob,file_mimetype,id_acto,&P267_ID_ACTO.,file_name&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(58792439226612392)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58794174978612436)
,p_name=>'P267_NMBRE_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(298632108077634903)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58794489203612490)
,p_name=>'P267_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(298632108077634903)
,p_prompt=>'Sub - Tributo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58794884775612491)
,p_name=>'P267_IDNTFCCION_SJTO_FRMTDA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(298632108077634903)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58795266776612491)
,p_name=>'P267_DSCRPCION_CNVNIO_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(298632108077634903)
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
 p_id=>wwv_flow_api.id(58795658950612491)
,p_name=>'P267_NMRO_CNVNIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(298632108077634903)
,p_prompt=>unistr('N\00FAmero Acuerdo')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58796164841612493)
,p_name=>'P267_DSCRPCION_CNVNIO_ESTDO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(298632108077634903)
,p_prompt=>'Estado'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58796540841612494)
,p_name=>'P267_NMRO_ACTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(298632108077634903)
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
 p_id=>wwv_flow_api.id(58796934778612494)
,p_name=>'P267_FCHA_APLCCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(298632108077634903)
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
 p_id=>wwv_flow_api.id(58797367443612494)
,p_name=>'P267_CDGO_CNVNIO_ESTDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(298632108077634903)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58803327392612659)
,p_name=>'P267_FCHA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(404017212957996863)
,p_prompt=>'Fecha'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58803689038612660)
,p_name=>'P267_NMRO_ACTO_RVRSION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(404017212957996863)
,p_prompt=>unistr('N\00FAmero Acto')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_display_when=>'P267_CDGO_CNVNIO_ESTDO'
,p_display_when2=>'RVS'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58804016240612660)
,p_name=>'P267_ID_CNVNIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(404017212957996863)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58804472960612660)
,p_name=>'P267_DSC_CNVNIO_RVRSION_ESTDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(404017212957996863)
,p_prompt=>'Estado'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58804808596612660)
,p_name=>'P267_CDGO_CNVNIO_RVRSION_ESTDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(404017212957996863)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58805269363612661)
,p_name=>'P267_MTVO_RCHZO_RVRSION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(404017212957996863)
,p_prompt=>'Motivo Rechazo'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cHeight=>3
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_display_when=>'P267_CDGO_CNVNIO_RVRSION_ESTDO'
,p_display_when2=>'RCH'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_read_only_when=>'P267_MTVO_RCHZO_RVRSION'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#:margin-top-md'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58805662193612661)
,p_name=>'P267_ID_CNVNIO_RVRSION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(404017212957996863)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58806048788612661)
,p_name=>'P267_RSPSTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(404017212957996863)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58806418633612661)
,p_name=>'P267_ID_ACTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(404017212957996863)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58807406570612664)
,p_name=>'P267_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(116371651880158528)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
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
 p_id=>wwv_flow_api.id(58807850801612667)
,p_name=>'P267_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(116371651880158528)
,p_prompt=>'Sub Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTO_SUBIMPUESTO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select upper(nmbre_impsto_sbmpsto)  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
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
 p_id=>wwv_flow_api.id(58808260758612668)
,p_name=>'P267_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(116371651880158528)
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
 p_id=>wwv_flow_api.id(58808681156612668)
,p_name=>'P267_UBCCION_SJTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(116371651880158528)
,p_prompt=>unistr('Ubicaci\00F3n')
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
 p_id=>wwv_flow_api.id(58809054553612668)
,p_name=>'P267_DRCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(116371651880158528)
,p_prompt=>unistr('Direcci\00F3n')
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
 p_id=>wwv_flow_api.id(58809759804612669)
,p_name=>'P267_CDGO_IDNTFCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(116371748946158529)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
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
 p_id=>wwv_flow_api.id(58810189208612669)
,p_name=>'P267_NMRO_IDNTFCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(116371748946158529)
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
 p_id=>wwv_flow_api.id(58810516210612669)
,p_name=>'P267_NMBRE_CMPLTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(116371748946158529)
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
 p_id=>wwv_flow_api.id(58810954731612670)
,p_name=>'P267_DRCCION_NTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(116371748946158529)
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
 p_id=>wwv_flow_api.id(58811359651612670)
,p_name=>'P267_UBCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(116371748946158529)
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
 p_id=>wwv_flow_api.id(58811748806612670)
,p_name=>'P267_TLFNO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(116371748946158529)
,p_prompt=>unistr('Tel\00E9fono')
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
 p_id=>wwv_flow_api.id(58812199106612670)
,p_name=>'P267_CLLAR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(116371748946158529)
,p_prompt=>'Celular'
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
 p_id=>wwv_flow_api.id(58812584551612671)
,p_name=>'P267_EMAIL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(116371748946158529)
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
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(58814084730612759)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Datos PQR'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  ',
'            a.id_impsto,',
'            a.id_impsto_sbmpsto,',
'            b.cdgo_idntfccion_tpo,',
'            b.idntfccion,',
'            b.nmbre_slctnte,',
'            b.ubccion,',
'            b.drccion_ntfccion,',
'            b.tlfno,',
'            b.cllar,',
'            b.email,',
'            pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => c.idntfccion_sjto , p_frmto => ''xx-xx-xxxx-xxxx-xxx'' , p_crcter_dlmtdor => ''-'' ) idntfccion_sjto,',
'            c.drccion,',
'            upper(c.nmbre_pais || ''-'' || c.nmbre_dprtmnto || ''-'' || c.nmbre_mncpio) ubccion_sjto',
'        into ',
'           :P267_ID_IMPSTO,',
'           :P267_ID_IMPSTO_SBMPSTO,',
'           :P267_CDGO_IDNTFCION_TPO,',
'           :P267_NMRO_IDNTFCION,',
'           :P267_NMBRE_CMPLTO,',
'           :P267_UBCCION,',
'           :P267_DRCCION_NTFCCION,',
'           :P267_TLFNO,',
'           :P267_CLLAR,',
'           :P267_EMAIL,',
'           :P267_IDNTFCCION,',
'           :P267_DRCCION,',
'           :P267_UBCCION_SJTO        ',
'        from v_pq_g_solicitudes            a',
'        join v_pq_g_solicitantes           b on a.id_slctud = b.id_slctud',
'        join v_si_i_sujetos_impuesto       c on a.id_sjto_impsto = c.id_sjto_impsto',
'       where a.id_instncia_fljo_gnrdo = :F_ID_INSTNCIA_FLJO;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(58813383765612756)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Carga de Datos Reversi\00F3n Acuerdo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_cnvnio,       ',
'       decode(cdgo_cnvnio_rvrsion_estdo, ''APL'', to_char(fcha_aplccion_rvrsion, ''DD/MM/YYYY''), to_char(fcha_rgstro, ''DD/MM/YYYY'')) fcha,',
'       nmro_acto,',
'       initcap(dscrpcion_cnvnio_rvrsion_estdo) dscrpcion_cnvnio_rvrsion_estdo,',
'       cdgo_cnvnio_rvrsion_estdo,',
'       id_cnvnio_rvrsion,',
'       id_acto,',
'       initcap(mtvo_rchzo_rvrsion)',
'  into :P267_ID_CNVNIO,',
'       :P267_FCHA, ',
'       :P267_NMRO_ACTO_RVRSION, ',
'       :P267_DSC_CNVNIO_RVRSION_ESTDO,',
'       :P267_CDGO_CNVNIO_RVRSION_ESTDO,',
'       :P267_ID_CNVNIO_RVRSION,',
'       :P267_ID_ACTO,',
'       :P267_MTVO_RCHZO_RVRSION',
'  from v_gf_g_convenios_reversion',
' where id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(58812957580612734)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga de Datos Acuerdo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  a.nmro_cnvnio,',
'            a.dscrpcion_cnvnio_tpo,           ',
'            a.dscrpcion_cnvnio_estdo,',
'            to_char(a.fcha_aplccion, ''DD/MM/YYYY'') fcha_aplccion,',
'            a.idntfccion_sjto_frmtda,',
'            a.nmro_acto,',
'            a.cdgo_cnvnio_estdo,',
'            a.nmbre_impsto,',
'            a.nmbre_impsto_sbmpsto',
'       into :P267_NMRO_CNVNIO,',
'            :P267_DSCRPCION_CNVNIO_TPO,',
'            :P267_DSCRPCION_CNVNIO_ESTDO,',
'            :P267_FCHA_APLCCION,',
'            :P267_IDNTFCCION_SJTO_FRMTDA,',
'            :P267_NMRO_ACTO,',
'            :P267_CDGO_CNVNIO_ESTDO,',
'            :P267_NMBRE_IMPSTO,',
'            :P267_NMBRE_IMPSTO_SBMPSTO',
'       from v_gf_g_convenios a',
'      where id_cnvnio = :P267_ID_CNVNIO;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(58813786328612756)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Terminar Flujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta          number;',
'    v_id_slctud            number;',
'    v_exste                varchar2(1);',
'    v_mnsje_rspsta         varchar2(2000);',
'    v_json_parametros      clob;  ',
'begin',
'    ',
'    begin',
'        select ''S''',
'          into v_exste',
'          from gf_g_convenios_reversion ',
'         where id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO;         ',
'    exception',
'        when no_data_found then',
'            v_exste    := ''N'';',
'    end;',
'    ',
'    /*if (v_exste = ''N'') then',
'    ',
'        --Radica la PQR',
'        begin ',
'            pkg_pq_pqr.prc_rg_radicar_solicitud( p_id_slctud => :P151_ID_SLCTUD, p_cdgo_clnte =>:F_CDGO_CLNTE );',
'        commit;',
'        exception ',
'          when others then',
'           rollback;',
'           raise_application_error(-20001, ''La solicitud no ha sido radicada '' || SQLCODE || '' - '' || SQLERRM);      ',
'        end;',
'        ',
'        begin',
'            select json_object( key ''p_id_slctud'' is :P151_ID_SLCTUD) ',
'              into v_json_parametros',
'              from dual;',
'',
'            --CONSULTAMOS SI HAY ENVIOS PROGRAMADOS',
'            pkg_ma_envios.prc_co_envio_programado( p_cdgo_clnte     => :F_CDGO_CLNTE',
'                                                 , p_idntfcdor      => ''PKG_GF_CONVENIOS.PRC_RG_REVERSION_ACUERDO_PAGO''',
'                                                 , p_json_prmtros   => v_json_parametros',
'                                                 );',
'        exception',
'            when others then',
'                null;',
'        end;',
'        ',
'    end if;*/',
'    ',
'    begin',
'        pkg_gf_convenios.prc_tr_reversion_acrdo_pgo(p_cdgo_clnte          =>    :F_CDGO_CLNTE,',
'                                                    p_id_instncia_fljo    =>    :F_ID_INSTNCIA_FLJO,',
'                                                    p_id_usrio            =>    :F_ID_USRIO,',
'                                                    p_id_acto             =>    :P212_ID_ACTO,',
'                                                    p_id_slctud           =>    :P151_ID_SLCTUD,',
'                                                    o_cdgo_rspsta         =>    v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta        =>    v_mnsje_rspsta);',
'        if (v_cdgo_rspsta <> 0) then',
'            raise_application_error(-20001, v_mnsje_rspsta);',
'        else',
'            :P267_RSPSTA := v_mnsje_rspsta;',
'        end if;',
'        ',
'    end;',
'',
'end;    '))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(58792804858612425)
,p_process_success_message=>'&P267_RSPSTA.'
);
null;
end;
/
