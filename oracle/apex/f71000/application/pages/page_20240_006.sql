prompt --application/pages/page_20240_006
begin
wwv_flow_api.create_page(
 p_id=>2024010
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Detalle Lote Ajustes Masivos'
,p_page_mode=>'MODAL'
,p_step_title=>'Detalle Lote Ajustes Masivos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20241029162844'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(54126479979830143)
,p_plug_name=>unistr('Detalle de Estad\00EDstica &P2024010_DSCRPCION_ESTDO.')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  idntfccion_sjto',
'        , vgncia',
'        , prdo',
'        , cdgo_cncpto',
'        , dscrpcion_cncpto',
'        , vlor_ajste',
'        , cdgo_ajste_mtvo',
'        , dscrpcion_mtvo',
'        , tpo_ajste',
'        , obsrvcion_ajste',
'        , id_sjto_impsto',
'        , id_ajste',
'        , numro_ajste',
'        , obsrvcion_prcso',
'        , nmro_intntos',
'from    v_gf_g_ajustes_cargue ',
'where   id_prcso_crga = :P2024010_ID_AJS_CRG_LTE',
'and     cdgo_estdo    = :P2024010_CDGO_ESTDO',
'order by idntfccion_sjto, vgncia, prdo, cdgo_cncpto'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P2024010_ID_AJS_CRG_LTE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P2024010_CDGO_ESTDO'
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
 p_id=>wwv_flow_api.id(54126603737830144)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>54126603737830144
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6362570736415233)
,p_db_column_name=>'VGNCIA'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6362958863415234)
,p_db_column_name=>'PRDO'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6424653244420104)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>40
,p_column_identifier=>'I'
,p_column_label=>unistr('Identificaci\00F3n<br>Sujeto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6424732870420105)
,p_db_column_name=>'CDGO_CNCPTO'
,p_display_order=>50
,p_column_identifier=>'J'
,p_column_label=>unistr('C\00F3digo <br> Concepto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6424810058420106)
,p_db_column_name=>'DSCRPCION_CNCPTO'
,p_display_order=>60
,p_column_identifier=>'K'
,p_column_label=>unistr('Descripci\00F3n Concepto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6424912145420107)
,p_db_column_name=>'VLOR_AJSTE'
,p_display_order=>70
,p_column_identifier=>'L'
,p_column_label=>'Valor Ajuste'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6425094182420108)
,p_db_column_name=>'CDGO_AJSTE_MTVO'
,p_display_order=>80
,p_column_identifier=>'M'
,p_column_label=>unistr('C\00F3digo <br> Motivo Ajuste')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6425197477420109)
,p_db_column_name=>'DSCRPCION_MTVO'
,p_display_order=>90
,p_column_identifier=>'N'
,p_column_label=>'Motivo Ajuste'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6425262780420110)
,p_db_column_name=>'TPO_AJSTE'
,p_display_order=>100
,p_column_identifier=>'O'
,p_column_label=>'Tipo <br> Ajuste'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6425371061420111)
,p_db_column_name=>'OBSRVCION_AJSTE'
,p_display_order=>110
,p_column_identifier=>'P'
,p_column_label=>unistr('Observaci\00F3n <br> Ajuste')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6425468650420112)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>120
,p_column_identifier=>'Q'
,p_column_label=>'Sujeto Impuesto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6425530014420113)
,p_db_column_name=>'ID_AJSTE'
,p_display_order=>130
,p_column_identifier=>'R'
,p_column_label=>'Id Ajuste'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6425605136420114)
,p_db_column_name=>'OBSRVCION_PRCSO'
,p_display_order=>140
,p_column_identifier=>'S'
,p_column_label=>unistr('Observaci\00F3n <br> Proceso')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6425725218420115)
,p_db_column_name=>'NMRO_INTNTOS'
,p_display_order=>150
,p_column_identifier=>'T'
,p_column_label=>'No. Intentos'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6426084946420118)
,p_db_column_name=>'NUMRO_AJSTE'
,p_display_order=>160
,p_column_identifier=>'U'
,p_column_label=>unistr('N\00FAmero <br> Ajuste')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(55043720651740045)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'63645'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'IDNTFCCION_SJTO:VGNCIA:PRDO:CDGO_CNCPTO:DSCRPCION_CNCPTO:VLOR_AJSTE:CDGO_AJSTE_MTVO:DSCRPCION_MTVO:TPO_AJSTE:NUMRO_AJSTE:OBSRVCION_PRCSO:'
,p_sort_column_1=>'IDNTFCCION_SJTO'
,p_sort_direction_1=>'ASC NULLS LAST'
,p_sort_column_2=>'VGNCIA'
,p_sort_direction_2=>'ASC NULLS LAST'
,p_sort_column_3=>'PRDO'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'CDGO_CNCPTO'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(58877053196568759)
,p_plug_name=>unistr('Estad\00EDsticas del Proceso')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  estdo',
'        , cdgo_estdo',
'        , (case when cdgo_estdo = ''DPC'' then',
'                    ''Sujeto Duplicado''',
'                when cdgo_estdo = ''SNV'' then',
'                    ''Sujeto no existe en el sistema''',
'                when cdgo_estdo = ''SVC'' then',
'                    ''Sujeto con Saldo capital menor al valor ajuste(CR)''',
'                when cdgo_estdo = ''PRC'' then',
'                    ''Sujeto con ajustes''',
'                when cdgo_estdo = ''SAJ'' then',
'                    ''Sin Ajuste''',
'                else',
'                    ''Otro''',
'           end ) obsrvcion_prcso',
'        , count(distinct idntfccion_sjto) ttal',
'from    gf_g_ajustes_cargue ',
'where   id_prcso_crga = :P2024010_ID_AJS_CRG_LTE',
'group by estdo , cdgo_estdo , obsrvcion_prcso ;',
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
,p_plug_header=>unistr('Los datos est\00E1n consolidados por Sujeto')
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(58877138024568760)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>58877138024568760
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6176868422821731)
,p_db_column_name=>'ESTDO'
,p_display_order=>10
,p_column_identifier=>'C'
,p_column_label=>'Estdo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6176936733821732)
,p_db_column_name=>'CDGO_ESTDO'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>'Cdgo Estdo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6177037581821733)
,p_db_column_name=>'OBSRVCION_PRCSO'
,p_display_order=>30
,p_column_identifier=>'E'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6177233078821735)
,p_db_column_name=>'TTAL'
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>'Total'
,p_column_link=>'f?p=&APP_ID.:2024010:&SESSION.::&DEBUG.:RP,2024010:P2024010_CDGO_ESTDO,P2024010_ID_AJS_CRG_LTE:#CDGO_ESTDO#,&P2024010_ID_AJS_CRG_LTE.'
,p_column_linktext=>'#TTAL#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(88742556624554051)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'63829'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DTRMNCION_SJTO_TTL_SJTOS:ESTDO:CDGO_ESTDO:OBSRVCION_PRCSO:TTAL'
,p_sum_columns_on_break=>'TTL_SJTOS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(379483359904669996)
,p_plug_name=>'Lote de Ajustes'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:margin-top-sm:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6367182688415240)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(379483359904669996)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6177348683821736)
,p_name=>'P2024010_NMRO_AJSTES_GNRDOS'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(379483359904669996)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00B0 Ajustes Generados')
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'NMRO_AJSTES_GNRDOS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica el n\00FAmero de ajustes generados por Sujeto-Vigencia-Per\00EDodo-Motivo')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6367523754415241)
,p_name=>'P2024010_ID_AJS_CRG_LTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(379483359904669996)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_AJS_CRG_LTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6367936973415242)
,p_name=>'P2024010_ID_USRIO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(379483359904669996)
,p_use_cache_before_default=>'NO'
,p_prompt=>'<i><b>Lote No. &P2024010_ID_AJS_CRG_LTE.</b></i> creado por:'
,p_source=>'ID_USRIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_trcro, ',
'        id_usrio ',
'   from v_sg_g_usuarios ',
'  where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Nombre del Usuario que gener\00F3 el Lote de ajustes')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6368859488415244)
,p_name=>'P2024010_FCHA_INCIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(379483359904669996)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Inicio'
,p_format_mask=>'DD-MON-YYYY HH:MI:SS PM'
,p_source=>'FCHA_INCIO_PRCSO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Fecha Inicio del procesamiento'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6369793810415244)
,p_name=>'P2024010_FCHA_FIN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(379483359904669996)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Fin'
,p_format_mask=>'DD-MON-YYYY HH:MI:SS PM'
,p_source=>'FCHA_FIN_PRCSO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Fecha Fin del procesamiento'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6370611962415245)
,p_name=>'P2024010_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(379483359904669996)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tributo'
,p_source=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cMaxlength=>200
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_help_text=>'Tributo al que pertenece el lote de ajuste'
,p_attribute_01=>'SINGLE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6371565883415245)
,p_name=>'P2024010_ID_IMSPTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(379483359904669996)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sub-Tributo'
,p_source=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_help_text=>'Sub-Tributo al que pertenece el lote de ajustes'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6378778990415250)
,p_name=>'P2024010_NMRO_RGSTROS'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(379483359904669996)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00B0 Registros')
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'NMRO_RGSTROS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica el n\00FAmero total de registros del lote(archivo)')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6379631143415250)
,p_name=>'P2024010_NMRO_SJTOS_VLDOS'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(379483359904669996)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00B0 Sujetos V\00E1lidos')
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'NMRO_SJTOS_VLDOS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica el n\00FAmero de sujetos(distintos) v\00E1lidos en el sistema')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6380511943415251)
,p_name=>'P2024010_NMRO_AJSTES_GNRAR'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(379483359904669996)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00B0 Ajustes a Generar')
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'NMRO_AJSTES_GNRAR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica el n\00FAmero de ajustes a generar por Sujeto-Vigencia-Per\00EDodo-Motivo')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6381491513415251)
,p_name=>'P2024010_CDGO_ESTDO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(379483359904669996)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6425958977420117)
,p_name=>'P2024010_DSCRPCION_ESTDO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(379483359904669996)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6383779478415260)
,p_name=>unistr('Al hacer clic en el bot\00F3n regresarClose Dialog')
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(6367182688415240)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6384222351415261)
,p_event_id=>wwv_flow_api.id(6383779478415260)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6425825905420116)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Estado'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case when :P2024010_CDGO_ESTDO = ''DPC'' then',
'                ''Sujeto Duplicado''',
'            when :P2024010_CDGO_ESTDO = ''SNV'' then',
'                ''Sujeto no existe en el sistema''',
'            when :P2024010_CDGO_ESTDO = ''SVC'' then',
'                ''Sujeto con Saldo capital menor al valor ajuste(CR)''',
'            when :P2024010_CDGO_ESTDO = ''PRC'' then',
'                ''Sujeto con ajustes''',
'            when :P2024010_CDGO_ESTDO = ''SAJ'' then',
'                ''Sin Ajuste''',
'            else',
'                ''Otro''',
'       end',
'into   :P2024010_DSCRPCION_ESTDO',
'from   dual;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6383380833415260)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from GF_G_AJUSTES_CARGUE_LOTE'
,p_attribute_02=>'V_GF_G_AJUSTES_CARGUE_LOTE'
,p_attribute_03=>'P2024010_ID_AJS_CRG_LTE'
,p_attribute_04=>'ID_AJS_CRG_LTE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
