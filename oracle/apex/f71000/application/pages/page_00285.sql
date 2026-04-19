prompt --application/pages/page_00285
begin
wwv_flow_api.create_page(
 p_id=>285
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Revertir Aplicaci\00F3n de Recaudo')
,p_page_mode=>'MODAL'
,p_step_title=>'Revertir Registro de Recaudo Manual'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-label{',
'    font-weight: 700;',
'}',
'',
'.a-IRR-noDataMsg {',
'    padding: 0;',
'}',
'',
'/* Estilo File Browse - icono carpeta */',
'#P285_ARCHRVO_SPRTE {',
'    border: 1px solid #d0d0d0;',
'    border-radius: 2px;',
'    padding: 4px 8px;',
'    background: #fff;',
'    width: 300px;',
'    font-size: 12px;',
'}',
'#P285_ARCHRVO_SPRTE::file-selector-button {',
'    display: none;',
'}',
'.P285_ARCHRVO_SPRTE_CONTAINER .t-Form-inputContainer {',
'    position: relative;',
'}',
'.P285_ARCHRVO_SPRTE_CONTAINER .t-Form-inputContainer::after {',
'    content: "\f07c";',
'    font-family: "Font Apex" !important;',
'    position: absolute;',
'    right: 8px;',
'    top: 50%;',
'    transform: translateY(-50%);',
'    cursor: pointer;',
'    font-size: 16px;',
'    color: #404040;',
'    padding: 4px 6px;',
'    border: 1px solid #d0d0d0;',
'    border-radius: 2px;',
'    background: #f8f8f8;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20260416141519'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(79655493922676124)
,p_plug_name=>'Documento'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_dcmnto,',
'		id_sjto_impsto,',
'		nmro_dcmnto,',
'		id_dcmnto_lte,',
'		cdgo_dcmnto_tpo,',
'		dscrpcion_dcmnto_tpo,',
'		fcha_dcmnto,',
'		fcha_vncmnto,',
'		vlor_ttal_dcmnto,        ',
'        dscrpcion_indcdor_pgo_aplcdo,',
'        dscrpcion_indcdor_entrno',
'from v_re_g_documentos',
'where nmro_dcmnto = :P285_NMRO_DCMNTO ;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P285_CDGO_RCDO_ORGN_TPO'
,p_plug_display_when_cond2=>'DC'
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
 p_id=>wwv_flow_api.id(79655548846676125)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NCARRASQUILLA'
,p_internal_uid=>79655548846676125
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79655672488676126)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Identificaci\00F3n Documento')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79655704619676127)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Identificaci\00F3n Sujeto Impuesto')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79655833252676128)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('N\00FAmero Documento')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79655926795676129)
,p_db_column_name=>'ID_DCMNTO_LTE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Identificaci\00F3n Documento Lote')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79656052748676130)
,p_db_column_name=>'CDGO_DCMNTO_TPO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('C\00F3digo Documento Tipo')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79656122183676131)
,p_db_column_name=>'DSCRPCION_DCMNTO_TPO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Tipo Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79656226148676132)
,p_db_column_name=>'FCHA_DCMNTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Fecha Documento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79656314398676133)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Fecha Vencimiento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79656487283676134)
,p_db_column_name=>'VLOR_TTAL_DCMNTO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Valor Total Documento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79656672034676136)
,p_db_column_name=>'DSCRPCION_INDCDOR_PGO_APLCDO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Indicador Pago Aplicado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79656877210676138)
,p_db_column_name=>'DSCRPCION_INDCDOR_ENTRNO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Indicador Entorno'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(80737390205263479)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'807374'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_DCMNTO:ID_SJTO_IMPSTO:NMRO_DCMNTO:ID_DCMNTO_LTE:CDGO_DCMNTO_TPO:DSCRPCION_DCMNTO_TPO:FCHA_DCMNTO:FCHA_VNCMNTO:VLOR_TTAL_DCMNTO:DSCRPCION_INDCDOR_PGO_APLCDO:DSCRPCION_INDCDOR_ENTRNO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80597403443498001)
,p_plug_name=>'Recaudo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'V_RE_G_RECAUDOS'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80601038422498037)
,p_plug_name=>'Movimientos Financieros -Detalle-'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    id_mvmnto_dtlle',
'    ,fcha_vncmnto',
'    ,vgncia',
'    ,prdo',
'    ,dscrpcion_prdo',
'    ,dscrpcion_cncpto',
'    ,dscrpcion_cncpto_csdo',
'    ,vlor_dbe',
'    ,vlor_hber',
'from v_gf_g_movimientos_detalle',
'where cdgo_mvmnto_orgn_dtlle = ''RE''',
'  and id_orgen_dtlle = :P285_ID_RCDO',
'  and cdgo_mvmnto_tpo in (''PC'', ''PI'')'))
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
 p_id=>wwv_flow_api.id(80601104726498038)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ADMIN'
,p_internal_uid=>80601104726498038
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80601222555498039)
,p_db_column_name=>'ID_MVMNTO_DTLLE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Movimiento Detalle'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80636332087691205)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>170
,p_column_identifier=>'B'
,p_column_label=>'Fecha Vencimiento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80637282100691214)
,p_db_column_name=>'VGNCIA'
,p_display_order=>260
,p_column_identifier=>'C'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80637405379691216)
,p_db_column_name=>'PRDO'
,p_display_order=>280
,p_column_identifier=>'D'
,p_column_label=>unistr('Per\00EDodo')
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80637553635691217)
,p_db_column_name=>'DSCRPCION_PRDO'
,p_display_order=>290
,p_column_identifier=>'E'
,p_column_label=>unistr('Per\00EDodo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80638492619691226)
,p_db_column_name=>'DSCRPCION_CNCPTO'
,p_display_order=>380
,p_column_identifier=>'G'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80639151656691233)
,p_db_column_name=>'DSCRPCION_CNCPTO_CSDO'
,p_display_order=>450
,p_column_identifier=>'I'
,p_column_label=>'Concepto Causado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80639319985691235)
,p_db_column_name=>'VLOR_DBE'
,p_display_order=>470
,p_column_identifier=>'K'
,p_column_label=>'Valor Debe'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80639418280691236)
,p_db_column_name=>'VLOR_HBER'
,p_display_order=>480
,p_column_identifier=>'L'
,p_column_label=>'Valor Haber'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(80645187114731791)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'806452'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_MVMNTO_DTLLE:FCHA_VNCMNTO:VGNCIA:PRDO:DSCRPCION_PRDO:DSCRPCION_CNCPTO:DSCRPCION_CNCPTO_CSDO:VLOR_DBE:VLOR_HBER:APXWS_CC_001'
,p_sum_columns_on_break=>'VLOR_HBER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80639814683691240)
,p_plug_name=>'CONTENEDOR'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100209680902142814)
,p_plug_name=>unistr('Declaraci\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_dclrcion,',
'       upper( g.dscrpcion ) as dscrpcion,',
'       e.vgncia,',
'       f.prdo,',
'       f.dscrpcion_prdcdad,',
'       a.vlor_ttal,',
'       to_char(a.fcha_prsntcion, ''dd/mm/yyyy'') as fcha_prsntcion',
'from gi_g_declaraciones a',
'join df_c_impuestos b on a.id_impsto = b.id_impsto ',
'join df_i_impuestos_subimpuesto c on a.id_impsto_sbmpsto = c.id_impsto_sbmpsto',
'join gi_d_dclrcnes_vgncias_frmlr d on a.id_dclrcion_vgncia_frmlrio = d.id_dclrcion_vgncia_frmlrio',
'join gi_d_dclrcnes_tpos_vgncias e on d.id_dclrcion_tpo_vgncia = e.id_dclrcion_tpo_vgncia',
'join v_df_i_periodos f on e.id_prdo = f.id_prdo',
'join gi_d_declaraciones_tipo g on e.id_dclrcn_tpo = g.id_dclrcn_tpo ',
'where a.id_rcdo = :P285_ID_RCDO;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P285_CDGO_RCDO_ORGN_TPO'
,p_plug_display_when_cond2=>'DL'
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
 p_id=>wwv_flow_api.id(100209787840142815)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LTORRES'
,p_internal_uid=>100209787840142815
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100210909160142827)
,p_db_column_name=>'ID_DCLRCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Dclrcion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100211104955142829)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Tipo Declaraci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100211277803142830)
,p_db_column_name=>'VGNCIA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100211379760142831)
,p_db_column_name=>'PRDO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Per\00EDodo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100211447997142832)
,p_db_column_name=>'DSCRPCION_PRDCDAD'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Periodicidad'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100211595928142833)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100211682215142834)
,p_db_column_name=>'FCHA_PRSNTCION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Fecha Presentaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(100217222308185608)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1002173'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_DCLRCION:DSCRPCION:VGNCIA:PRDO:DSCRPCION_PRDCDAD:VLOR_TTAL:FCHA_PRSNTCION'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79656976316676139)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(80639814683691240)
,p_button_name=>'BTN_REVERTIR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Revertir'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de revertir este recaudo?'',''BTN_REVERTIR'');'
,p_icon_css_classes=>'fa-gears'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(79657394983676143)
,p_branch_name=>'Ir  a la pagina 284'
,p_branch_action=>'f?p=&APP_ID.:284:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(79656976316676139)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79657647908676146)
,p_name=>'P285_DSCRPCION'
,p_is_required=>true
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_prompt=>unistr('Descripci\00F3n Reversi\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>2000
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80597789098498004)
,p_name=>'P285_ID_RCDO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_item_source_plug_id=>wwv_flow_api.id(80597403443498001)
,p_source=>'ID_RCDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80598201533498009)
,p_name=>'P285_ID_SJTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_item_source_plug_id=>wwv_flow_api.id(80597403443498001)
,p_source=>'ID_SJTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80598342102498010)
,p_name=>'P285_ID_SJTO_IMPSTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_item_source_plug_id=>wwv_flow_api.id(80597403443498001)
,p_source=>'ID_SJTO_IMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80598552961498012)
,p_name=>'P285_DSCRPCION_SJTO_TPO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_item_source_plug_id=>wwv_flow_api.id(80597403443498001)
,p_source=>'DSCRPCION_SJTO_TPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80598692911498013)
,p_name=>'P285_IDNTFCCION_SJTO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_item_source_plug_id=>wwv_flow_api.id(80597403443498001)
,p_source=>'IDNTFCCION_SJTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80598753098498014)
,p_name=>'P285_IDNTFCCION_SJTO_FRMTDA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_item_source_plug_id=>wwv_flow_api.id(80597403443498001)
,p_source=>'IDNTFCCION_SJTO_FRMTDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80599258093498019)
,p_name=>'P285_DSCRPCION_RCDO_ORGN_TPO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_item_source_plug_id=>wwv_flow_api.id(80597403443498001)
,p_prompt=>'Origen del Recaudo'
,p_source=>'DSCRPCION_RCDO_ORGN_TPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80599320757498020)
,p_name=>'P285_ID_ORGEN'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_item_source_plug_id=>wwv_flow_api.id(80597403443498001)
,p_source=>'ID_ORGEN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80599484169498021)
,p_name=>'P285_NMRO_DCMNTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_item_source_plug_id=>wwv_flow_api.id(80597403443498001)
,p_prompt=>unistr('N\00FAmero Documento')
,p_source=>'NMRO_DCMNTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80599590964498022)
,p_name=>'P285_FCHA_RCDO'
,p_source_data_type=>'TIMESTAMP'
,p_is_required=>true
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_item_source_plug_id=>wwv_flow_api.id(80597403443498001)
,p_prompt=>'Fecha Recaudo'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'FCHA_RCDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80599657217498023)
,p_name=>'P285_FCHA_INGRSO_BNCO'
,p_source_data_type=>'TIMESTAMP'
,p_is_required=>true
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_item_source_plug_id=>wwv_flow_api.id(80597403443498001)
,p_prompt=>'Fecha Ingreso Banco'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'FCHA_INGRSO_BNCO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80599745587498024)
,p_name=>'P285_VLOR'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_item_source_plug_id=>wwv_flow_api.id(80597403443498001)
,p_prompt=>'Valor Recaudo'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'VLOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80600034412498027)
,p_name=>'P285_FCHA_APLICCION'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_item_source_plug_id=>wwv_flow_api.id(80597403443498001)
,p_prompt=>'Fecha Aplicacion'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'FCHA_APLICCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80600150032498028)
,p_name=>'P285_OBSRVCION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_item_source_plug_id=>wwv_flow_api.id(80597403443498001)
,p_prompt=>unistr('Observaci\00F3n ')
,p_source=>'OBSRVCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>200
,p_cMaxlength=>1000
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80600332835498030)
,p_name=>'P285_DSCRPCION_RCDO_ESTDO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_item_source_plug_id=>wwv_flow_api.id(80597403443498001)
,p_prompt=>'Estado del Recaudo'
,p_source=>'DSCRPCION_RCDO_ESTDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80600498041498031)
,p_name=>'P285_MNSJE_RSPSTA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_item_source_plug_id=>wwv_flow_api.id(80597403443498001)
,p_prompt=>'Mensaje Respuesta'
,p_source=>'MNSJE_RSPSTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>200
,p_cMaxlength=>4000
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80600537697498032)
,p_name=>'P285_ID_USRIO_APLCO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_item_source_plug_id=>wwv_flow_api.id(80597403443498001)
,p_source=>'ID_USRIO_APLCO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80600605234498033)
,p_name=>'P285_ID_CNVNIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_item_source_plug_id=>wwv_flow_api.id(80597403443498001)
,p_source=>'ID_CNVNIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80600712281498034)
,p_name=>'P285_ID_SLDO_FVOR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_item_source_plug_id=>wwv_flow_api.id(80597403443498001)
,p_prompt=>unistr('Identificaci\00F3n Saldo Favor')
,p_source=>'ID_SLDO_FVOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80600982007498036)
,p_name=>'P285_DSCRPCION_RCDO_ORGEN_CNTROL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_item_source_plug_id=>wwv_flow_api.id(80597403443498001)
,p_prompt=>'Control del Recaudo'
,p_source=>'DSCRPCION_RCDO_ORGEN_CNTROL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100211813155142836)
,p_name=>'P285_CDGO_RCDO_ORGN_TPO'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2420278650268443802)
,p_name=>'P285_ARCHRVO_SPRTE'
,p_is_required=>true
,p_item_sequence=>295
,p_item_plug_id=>wwv_flow_api.id(80597403443498001)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
,p_attribute_12=>'application/pdf'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(213240929164659014)
,p_validation_name=>'Validar formato PDF'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_filename varchar2(500);',
'begin',
'    select filename into v_filename',
'      from apex_application_temp_files',
'     where name = :P285_ARCHRVO_SPRTE;',
'    return lower(v_filename) like ''%.pdf'';',
'exception',
'    when no_data_found then return false;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El archivo de soporte debe ser un documento en formato PDF.'
,p_associated_item=>wwv_flow_api.id(2420278650268443802)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(75878965504136270)
,p_name=>'Al Cambiar Fecha Recaudo inicial '
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P285_FCHA_RCDO_INCIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(75879461056136293)
,p_event_id=>wwv_flow_api.id(75878965504136270)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P285_FCHA_RCDO_FNAL").datepicker( ''option'' , ''minDate'' , $("#P285_FCHA_RCDO_INCIAL").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79657214569676142)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Revertir_recaudo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(1000);',
'    v_blob            blob;',
'    v_filename        varchar2(500);',
'    v_archivo_salida  utl_file.file_type;',
'    v_nmbre_archivo   varchar2(500);',
'    v_buffer          raw(32767);',
'    v_amount          integer;',
'    v_offset          integer := 1;',
'    v_blob_length     integer;',
'begin',
'    -- 1. Obtener archivo temporal',
'    begin',
'        select blob_content, filename',
'          into v_blob, v_filename',
'          from apex_application_temp_files',
'         where name = :P285_ARCHRVO_SPRTE;',
'    exception',
'        when no_data_found then',
'            raise_application_error(-20002,',
'                ''Debe adjuntar un documento PDF de soporte para la reversion.'');',
'    end;',
'    -- 2. Nombre unico',
'    v_nmbre_archivo := ''REVERSA_'' || :P285_NMRO_DCMNTO || ''_''',
'                     || to_char(sysdate, ''YYYYMMDD_HH24MISS'') || ''.pdf'';',
'    -- 3. Guardar en directorio TS_SOPORTE_REVERSO',
'    v_blob_length := dbms_lob.getlength(v_blob);',
'    v_archivo_salida := utl_file.fopen(''TS_SOPORTE_REVERSO'',',
'                                        v_nmbre_archivo, ''wb'', 32767);',
'    while v_offset <= v_blob_length loop',
'        v_amount := least(32767, v_blob_length - v_offset + 1);',
'        dbms_lob.read(v_blob, v_amount, v_offset, v_buffer);',
'        utl_file.put_raw(v_archivo_salida, v_buffer, true);',
'        v_offset := v_offset + v_amount;',
'    end loop;',
'    utl_file.fclose(v_archivo_salida);',
'    -- 4. Ejecutar reversion',
'    pkg_re_recaudos.prc_rg_reversar_recaudo(',
'        p_cdgo_clnte   => :F_CDGO_CLNTE,',
'        p_id_usrio     => :F_ID_USRIO,',
'        p_nmro_dcmnto  => :P285_NMRO_DCMNTO,',
'        p_id_rcdo      => :P285_ID_RCDO,',
'        p_dscrpcion    => :P285_DSCRPCION,',
'        o_cdgo_rspsta  => v_cdgo_rspsta,',
'        o_mnsje_rspsta => v_mnsje_rspsta',
'    );',
'    if v_cdgo_rspsta > 0 then',
'        begin',
'            utl_file.fremove(''TS_SOPORTE_REVERSO'', v_nmbre_archivo);',
'        exception when others then null;',
'        end;',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'    -- 5. Registrar referencia del archivo',
'    update gf_g_recaudo_reversa',
'       set nmbre_archrvo_sprte = v_filename,',
'           ruta_archrvo_sprte  = v_nmbre_archivo',
'     where nmro_dcmnto = :P285_NMRO_DCMNTO',
'       and fcha_rvrsa = (select max(fcha_rvrsa)',
'                           from gf_g_recaudo_reversa',
'                          where nmro_dcmnto = :P285_NMRO_DCMNTO);',
'    -- 6. Limpiar temporal',
'    delete from apex_application_temp_files',
'     where name = :P285_ARCHRVO_SPRTE;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(79656976316676139)
,p_process_success_message=>'Recaudo de documento &P285_NMRO_DCMNTO. reversado satisfactoriamente.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(80639945926691241)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar Cuadro de Dialogo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(80597679227498003)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(80597403443498001)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>unistr('Inicializar pantalla Revertir Aplicaci\00F3n de Recaudo')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
