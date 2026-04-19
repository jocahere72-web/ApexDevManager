prompt --application/pages/page_00205
begin
wwv_flow_api.create_page(
 p_id=>205
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Escanear Evidencia Declaraci\00F3n Digitada')
,p_step_title=>unistr('Escanear Evidencia Declaraci\00F3n Digitada')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20210506093840'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112095906497532019)
,p_plug_name=>'Contenedor'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108824522180195501)
,p_plug_name=>'<b>Agregar Adjunto</b>'
,p_parent_plug_id=>wwv_flow_api.id(112095906497532019)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108841921559323106)
,p_plug_name=>'documentos'
,p_parent_plug_id=>wwv_flow_api.id(112095906497532019)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select c.id_dclrcion_archvo_adjnto',
'        , dscrpcion_adjnto_tpo',
'        , case when c.id_dclrcn_archvo_tpo is null then',
'                        ''Pendiente''',
'             else',
'                     ''Cargado''',
'          end as estado       ',
'        , case when c.id_dclrcn_archvo_tpo is null then',
'                        ''''',
'             else',
'                     ''<span class="fa fa-trash-o" aria-hidden="true" style="color: red"></span>''',
'          end as Btn_elmnar',
'        , c.fcha_dgta as fcha_carga',
'        , c.fcha_mdfca as fcha_edcion        ',
'        , case when c.id_dclrcn_archvo_tpo is null then',
'                        ''''',
'             else',
'                     ''<span aria-hidden="true" class="fa fa-eye"></span>''',
'          end as Btn_vsor',
'     from gi_d_dclrcnes_archvos_tpo   a',
'     join gi_d_subimpuestos_adjnto_tp b on a.id_sbmpto_adjnto_tpo = b.id_sbmpto_adjnto_tpo',
'left join gi_g_dclrcnes_arhvos_adjnto c on a.id_dclrcn_archvo_tpo = c.id_dclrcn_archvo_tpo',
'                                       and c.id_dclrcion          = :P205_ID_DCLRCION  ',
'    where id_dclrcn_tpo = :P205_ID_DCLRCION_TPO      ',
'      and a.actvo       =''S'''))
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
 p_id=>wwv_flow_api.id(108842083066323107)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AMOLINA'
,p_internal_uid=>108842083066323107
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(108842974013323116)
,p_db_column_name=>'DSCRPCION_ADJNTO_TPO'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Tipo Adjunto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(108843085963323117)
,p_db_column_name=>'ESTADO'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(108843316236323120)
,p_db_column_name=>'ID_DCLRCION_ARCHVO_ADJNTO'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>'Id Dclrcion Archvo Adjnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(108843474787323121)
,p_db_column_name=>'BTN_ELMNAR'
,p_display_order=>130
,p_column_identifier=>'N'
,p_column_label=>'Eliminar Archivo'
,p_column_link=>'f?p=&APP_ID.:205:&SESSION.:ELMNAR_ADJNTO:&DEBUG.:RP:P205_ID_DCLRCION_ARCHVO_ADJNTO:#ID_DCLRCION_ARCHVO_ADJNTO#'
,p_column_linktext=>'#BTN_ELMNAR#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(108896528130315402)
,p_db_column_name=>'FCHA_CARGA'
,p_display_order=>160
,p_column_identifier=>'O'
,p_column_label=>'Fecha de Carga'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(108896674627315403)
,p_db_column_name=>'FCHA_EDCION'
,p_display_order=>170
,p_column_identifier=>'P'
,p_column_label=>unistr('Fecha Edici\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(108897029756315407)
,p_db_column_name=>'BTN_VSOR'
,p_display_order=>180
,p_column_identifier=>'Q'
,p_column_label=>'Ver Archivo '
,p_column_link=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:gi_g_dclrcnes_arhvos_adjnto,file_name,file_blob,file_mimetype,id_dclrcion_archvo_adjnto,#ID_DCL'
||'RCION_ARCHVO_ADJNTO#'
,p_column_linktext=>'#BTN_VSOR#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(108851791172463172)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1088518'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ADJNTO_TPO:ESTADO:ID_DCLRCION_ARCHVO_ADJNTO:BTN_ELMNAR:FCHA_CARGA:FCHA_EDCION:BTN_VSOR'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108921793612174005)
,p_plug_name=>'documento Collection'
,p_parent_plug_id=>wwv_flow_api.id(112095906497532019)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' ',
'   select c.seq_id',
'        , dscrpcion_adjnto_tpo',
'        , c.c002',
'        , c.c003',
'        , c.blob001',
'        , case when c.n001 is null then',
'                        ''Pendiente''',
'             else',
'                     ''Cargado''',
'          end as estado       ',
'        , case when c.n001 is null then',
'                        ''''',
'             else',
'                     ''<span class="fa fa-trash-o" aria-hidden="true" style="color: red"></span>''',
'          end as Btn_elmnar              ',
'     from gi_d_dclrcnes_archvos_tpo   a',
'     join gi_d_subimpuestos_adjnto_tp b on a.id_sbmpto_adjnto_tpo = b.id_sbmpto_adjnto_tpo',
'left join apex_collections            c on a.id_dclrcn_archvo_tpo = c.n001',
'                                       and c.n002                 = :P205_ID_DCLRCION  ',
'    where id_dclrcn_tpo     = :P205_ID_DCLRCION_TPO      ',
'      and a.actvo           =''S''',
'      and c.collection_name = ''ARCHIVOS'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from apex_collections a',
' where a.collection_name = ''ARCHIVOS''',
'   and a.n002            = :P205_ID_DCLRCION'))
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
 p_id=>wwv_flow_api.id(108922997678174017)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>108922997678174017
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(108923092081174018)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(108923157111174019)
,p_db_column_name=>'DSCRPCION_ADJNTO_TPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tipo de Adjunto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(108923284717174020)
,p_db_column_name=>'ESTADO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(108923397472174021)
,p_db_column_name=>'BTN_ELMNAR'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Eliminar'
,p_column_link=>'f?p=&APP_ID.:205:&SESSION.:ELIMINAR_ARCVO_CLECCION:&DEBUG.:RP:P205_SEQ_ID:#SEQ_ID#'
,p_column_linktext=>'#BTN_ELMNAR#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(108923657023174024)
,p_db_column_name=>'C002'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'C002'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(108923751275174025)
,p_db_column_name=>'BLOB001'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Blob001'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(108923876658174026)
,p_db_column_name=>'C003'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'C003'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(108943375569400949)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1089434'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ADJNTO_TPO:ESTADO:BTN_ELMNAR:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112095041179532010)
,p_plug_name=>unistr('<b>Datos de la Declaraci\00F3n </b>')
,p_parent_plug_id=>wwv_flow_api.id(112095906497532019)
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112095837365532018)
,p_plug_name=>'<b>Datos del Recaudo</b>'
,p_parent_plug_id=>wwv_flow_api.id(112095906497532019)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P205_PRSNTA_PGO'
,p_plug_display_when_cond2=>unistr('S\00ED')
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(108843715742323124)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(112095906497532019)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:204:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(108841414788323101)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(108824522180195501)
,p_button_name=>'Btn_Escanear'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Escanear'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(108921417905174002)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(108824522180195501)
,p_button_name=>'Btn_procesar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(108841559286323102)
,p_branch_name=>'Ir a escanear'
,p_branch_action=>'f?p=50000:909:&SESSION.::&DEBUG.:RP:P909_APP_ID,P909_APP_PAGE_ID:&APP_ID.,&APP_PAGE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(108841414788323101)
,p_branch_sequence=>10
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P205_ID_DCLRCN_ARCHVO_TPO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108824603466195502)
,p_name=>'P205_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(108824522180195501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108824752939195503)
,p_name=>'P205_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(108824522180195501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108824839781195504)
,p_name=>'P205_ID_DCLRCION_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(108824522180195501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108825010435195506)
,p_name=>'P205_ID_DCLRCN_ARCHVO_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(108824522180195501)
,p_prompt=>'Tipo Adjunto'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion_adjnto_tpo as d',
'     , a.id_dclrcn_archvo_tpo as v',
'  from gi_d_dclrcnes_archvos_tpo   a',
'  join gi_d_subimpuestos_adjnto_tp b on a.id_sbmpto_adjnto_tpo = b.id_sbmpto_adjnto_tpo',
' where a.id_dclrcn_tpo = :P205_ID_DCLRCION_TPO',
'   and b.actvo         = ''S''',
'   and a.actvo         = ''S'''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108825145324195507)
,p_name=>'P205_ID_DCLRCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(108824522180195501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108843585626323122)
,p_name=>'P205_ID_DCLRCION_ARCHVO_ADJNTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(108824522180195501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108922817894174016)
,p_name=>'P205_SEQ_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(108824522180195501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112095158344532011)
,p_name=>'P205_NMRO_CNSCTVO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(112095041179532010)
,p_prompt=>unistr('N\00B0 declaraci\00F3n:')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112095282768532012)
,p_name=>'P205_IDNTFCCION_SJTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(112095041179532010)
,p_prompt=>'Identificacion del Sujeto:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112095305099532013)
,p_name=>'P205_TPO_DCLRCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(112095041179532010)
,p_prompt=>unistr('Tipo de Declaraci\00F3n: ')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112095461553532014)
,p_name=>'P205_VGNCIA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(112095041179532010)
,p_prompt=>'Vigencia:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112095507851532015)
,p_name=>'P205_DSCRPCION_PRDO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(112095041179532010)
,p_prompt=>'Periodo:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112095651139532016)
,p_name=>'P205_FCHA_RGSTRO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(112095041179532010)
,p_prompt=>'Fecha de Registro:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112095782886532017)
,p_name=>'P205_PRSNTA_PGO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(112095041179532010)
,p_prompt=>unistr('\00BFPresenta Pago?')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112096061054532020)
,p_name=>'P205_FCHA_RCDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(112095837365532018)
,p_prompt=>'Fecha del Recaudo:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112096179715532021)
,p_name=>'P205_VLOR_RCDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(112095837365532018)
,p_prompt=>'Valor del Recaudo:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112096215090532022)
,p_name=>'P205_ID_BNCO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(112095837365532018)
,p_prompt=>'Banco:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_bnco as d',
'     , id_bnco    as v',
'  from df_c_bancos',
' where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112096302841532023)
,p_name=>'P205_ID_BNCO_CNTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(112095837365532018)
,p_prompt=>'Cuenta:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmro_cnta      as d',
'     , id_bnco_cnta   as v',
'  from df_c_bancos_cuenta',
' where id_bnco = :P205_ID_BNCO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P205_ID_BNCO'
,p_ajax_items_to_submit=>'P205_ID_BNCO_CNTA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112096524909532025)
,p_name=>'P205_CDGO_FRMA_PGO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(112095837365532018)
,p_prompt=>'Forma de Pago:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Efectivo;EF,Cheque;CH,Transferencia;TR'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(108841624905323103)
,p_name=>'Al cerrar modal de scanner'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108841761442323104)
,p_event_id=>wwv_flow_api.id(108841624905323103)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_blob         blob;',
'     v_seq          varchar2(4000);',
'     v_filename     varchar2(4000);',
'     v_mime_type    varchar2(4000);     ',
'begin',
'    -- consultamos el archivo escaneado en la coleccion',
'    begin',
'        select blob001,',
'               c001,',
'               c002',
'          into v_blob,',
'               v_filename,',
'               v_mime_type',
'          from apex_collections',
'         where collection_name = ''SCANNER'';',
'    exception ',
'        when no_data_found then',
'            v_blob := null; ',
'            return;',
'    end;',
'    -- validamos que exista el blob',
'    if v_blob is not null then',
'    ',
'        -- creamos la coleccion de archivos si no existe  ',
'        if (not apex_collection.collection_exists(p_collection_name => ''ARCHIVOS'') ) then',
'            apex_collection.create_collection( p_collection_name => ''ARCHIVOS'');',
'        end if;',
'        ',
'        begin',
'            -- validamos si ya el archivo existe en la coleccion    ',
'            select seq_id',
'              into v_seq',
'              from apex_collections',
'             where collection_name = ''ARCHIVOS''',
'               and n001 = :P205_ID_DCLRCN_ARCHVO_TPO ',
'               and n002 = :P205_ID_DCLRCION;         ',
'             ',
'             -- Si existe lo actualizamos    ',
'             apex_collection.update_member( p_collection_name => ''ARCHIVOS''',
'                                          , p_seq             => v_seq  ',
'                                          , p_c002            => v_filename',
'                                          , p_c003            => v_mime_type',
'                                          , p_n001            => :P205_ID_DCLRCN_ARCHVO_TPO',
'                                          , p_blob001         => v_blob );        ',
'',
'        exception ',
'            when others then              ',
'                -- si no existe lo agregamos a la coleccion  ',
'                apex_collection.add_member( p_collection_name => ''ARCHIVOS''',
'                                          , p_c002            => v_filename',
'                                          , p_c003            => v_mime_type',
'                                          , p_n001            => :P205_ID_DCLRCN_ARCHVO_TPO',
'                                          , p_n002            => :P205_ID_DCLRCION ',
'                                          , p_blob001         => v_blob );        ',
'                                        ',
'        end; ',
'        ',
'        -- Si existe la coleccion de escaner la eliminamos ya que es creada en la modal nuevamente al ecanear un nuevo documento',
'        if apex_collection.collection_exists(p_collection_name => ''SCANNER'') then ',
'            apex_collection.delete_collection( p_collection_name => ''SCANNER'');            ',
'        end if;    ',
'    ',
'    end if;',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108841840392323105)
,p_event_id=>wwv_flow_api.id(108841624905323103)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.submit();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(108896750803315404)
,p_name=>'Al seleccionar tipo adjunto'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P205_ID_DCLRCN_ARCHVO_TPO'
,p_condition_element=>'P205_ID_DCLRCN_ARCHVO_TPO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108896806587315405)
,p_event_id=>wwv_flow_api.id(108896750803315404)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(108841414788323101)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108896925275315406)
,p_event_id=>wwv_flow_api.id(108896750803315404)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(108841414788323101)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(108923901956174027)
,p_name=>'al dar clic a procesar Guardar en Tabla'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(108921417905174002)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108924014402174028)
,p_event_id=>wwv_flow_api.id(108923901956174027)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_blob         blob;',
'     v_seq          varchar2(4000);',
'     v_filename     varchar2(4000);',
'     v_mime_type    varchar2(4000);     ',
'begin',
'    -- recorremos los archivos de la coleccion ',
'    for c_cllcion in (',
'                            select a.c002    -- nombre',
'                                 , a.c003    -- mimetype',
'                                 , a.n001    -- id_dclrcion_rpo',
'                                 , a.n002    -- id_dclrcion',
'                                 , a.blob001 -- blob',
'                              from apex_collections a',
'                             where a.collection_name = ''ARCHIVOS''',
'                               and a.n002            = :P205_ID_DCLRCION',
'    )loop',
'    ',
'        -- validamos el blob',
'        if c_cllcion.blob001 is not null then',
'                ',
'            -- Validamos si ya el archivo existe en la tabla y lo actualizamos    ',
'            begin',
'                select id_dclrcion_archvo_adjnto',
'                  into v_seq',
'                  from gi_g_dclrcnes_arhvos_adjnto',
'                 where id_dclrcn_archvo_tpo = c_cllcion.n001',
'                   and id_dclrcion          = :P205_ID_DCLRCION;',
'',
'                update gi_g_dclrcnes_arhvos_adjnto',
'                   set id_dclrcion                = :P205_ID_DCLRCION',
'                     , id_dclrcn_archvo_tpo       = c_cllcion.n001 ',
'                     , file_blob                  = c_cllcion.blob001',
'                     , file_mimetype              = c_cllcion.c003',
'                     , file_name                  = c_cllcion.c002',
'                 where id_dclrcion_archvo_adjnto  = v_seq; ',
'                 ',
'            exception ',
'                when others then',
'                    -- Si no existe lo insertamos    ',
'                    begin',
'                        insert into gi_g_dclrcnes_arhvos_adjnto( id_dclrcion,       id_dclrcn_archvo_tpo,       file_blob,         file_mimetype,  file_name)  ',
'                                                         values( :P205_ID_DCLRCION, c_cllcion.n001,             c_cllcion.blob001, c_cllcion.c003, c_cllcion.c002);',
'                    exception',
'                            when others then',
'                                null;',
'                    end;                                       ',
'            end;',
'        end if;',
'    end loop;',
'    ',
'    -- Eliminamos la collecion y sus datos',
'    if apex_collection.collection_exists(p_collection_name => ''ARCHIVOS'') then ',
'            apex_collection.delete_collection( p_collection_name => ''ARCHIVOS'');            ',
'    end if; ',
'',
'    -- si la declaracion presenta pago actualizamos los datos del recaudo de la declaracion',
unistr('    if :P205_PRSNTA_PGO = ''S\00ED'' then'),
'        ',
'        begin',
'            update gi_g_dclrcnes_dgtdas',
'               set fcha_rcdo     = :P205_FCHA_RCDO',
'                 , vlor_rcdo     = :P205_VLOR_RCDO',
'                 , id_bnco       = :P205_ID_BNCO',
'                 , id_bnco_cnta  = :P205_ID_BNCO_CNTA',
'                 , cdgo_frma_pgo = :P205_CDGO_FRMA_PGO',
'             where id_dclrcion   = :P205_ID_DCLRCION; ',
'        ',
'        commit;',
'        exception',
'                when others then',
'                        null;',
'        end;',
'        ',
'    end if;',
'    ',
'    apex_application.g_print_success_message := ''<span style="color:green">Proceso ejecutado con Exito!</span>'';',
'    commit;',
'end;'))
,p_attribute_02=>'P205_FCHA_RCDO,P205_VLOR_RCDO,P205_ID_BNCO,P205_ID_BNCO_CNTA,P205_CDGO_FRMA_PGO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108924146899174029)
,p_event_id=>wwv_flow_api.id(108923901956174027)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(108841921559323106)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(108843657053323123)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Adjunto '
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     delete from gi_g_dclrcnes_arhvos_adjnto',
'       where id_dclrcion_archvo_adjnto = :P205_ID_DCLRCION_ARCHVO_ADJNTO;',
'exception',
'        when others then',
'                raise_application_error(-20000, ''Error al Eliminar el archivo'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ELMNAR_ADJNTO'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(108846387202323150)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Adjunto de la coleccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    apex_collection.delete_member (',
'            p_collection_name => ''ARCHIVOS'',',
'            p_seq             => :P205_SEQ_ID',
'    ); ',
'exception',
'        when others then',
'                raise_application_error(-20000, ''Error al Eliminar el archivo de la coleccion'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ELIMINAR_ARCVO_CLECCION'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(112094985647532009)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar datos de la declaracion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.nmro_cnsctvo,',
'            g.idntfccion_sjto,',
'            f.dscrpcion as tpo_dclrcion,',
'            e.vgncia,',
'            e.dscrpcion dscrpcion_prdo,',
'            a.fcha_rgstro,',
unistr('            decode(h.prsnta_pgo, ''S'', ''S\00ED'', ''No''),'),
'            fcha_rcdo,',
'            vlor_rcdo,',
'            id_bnco,',
'            id_bnco_cnta',
'into        :P205_NMRO_CNSCTVO,',
'            :P205_IDNTFCCION_SJTO,',
'            :P205_TPO_DCLRCION,',
'            :P205_VGNCIA,',
'            :P205_DSCRPCION_PRDO,',
'            :P205_FCHA_RGSTRO,',
'            :P205_PRSNTA_PGO,',
'            :P205_FCHA_RCDO,',
'            :P205_VLOR_RCDO,',
'            :P205_ID_BNCO,',
'            :P205_ID_BNCO_CNTA',
'from        gi_g_declaraciones          a',
'inner join  gi_d_dclrcnes_vgncias_frmlr b   on  b.id_dclrcion_vgncia_frmlrio    =   a.id_dclrcion_vgncia_frmlrio',
'inner join  gi_d_formularios            c   on  c.id_frmlrio                    =   b.id_frmlrio',
'inner join  gi_d_dclrcnes_tpos_vgncias  d   on  d.id_dclrcion_tpo_vgncia        =   b.id_dclrcion_tpo_vgncia',
'inner join  df_i_periodos               e   on  e.id_prdo                       =   d.id_prdo',
'inner join  gi_d_declaraciones_tipo     f   on  f.id_dclrcn_tpo                 =   d.id_dclrcn_tpo',
'inner join  v_si_i_sujetos_impuesto     g   on  g.id_sjto_impsto                =   a.id_sjto_impsto',
'inner join  gi_g_dclrcnes_dgtdas        h   on  a.id_dclrcion                   =   h.id_dclrcion',
'where       a.cdgo_clnte    = :F_CDGO_CLNTE',
'and         a.id_dclrcion   = :P205_ID_DCLRCION ;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
