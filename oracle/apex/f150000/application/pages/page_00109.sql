prompt --application/pages/page_00109
begin
wwv_flow_api.create_page(
 p_id=>109
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Resumen - Solicitud de Acuerdo de Pago'
,p_step_title=>'Resumen - Solicitud de Acuerdo de Pago'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200521165320'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(294213230997160976)
,p_plug_name=>'Datos del Convenio'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(252183924525651399)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(72235324874226079)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(252197199379651439)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(271029526814622387)
,p_plug_name=>'<b>SUJETO TRIBUTO</b>'
,p_parent_plug_id=>wwv_flow_api.id(294213230997160976)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(271410965034819643)
,p_plug_name=>unistr('<b>INFORMACI\00D3N DEL SOLICITANTE </b>')
,p_parent_plug_id=>wwv_flow_api.id(294213230997160976)
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
 p_id=>wwv_flow_api.id(273371686642898273)
,p_plug_name=>'<b>DATOS DEL ACUERDO DE PAGO </b>'
,p_parent_plug_id=>wwv_flow_api.id(294213230997160976)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--slimPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77556677501154184)
,p_plug_name=>'Cuotas(s) Inicial(es)'
,p_parent_plug_id=>wwv_flow_api.id(273371686642898273)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select seq_id',
'        , n001 id_dcmnto',
'        , b.nmro_dcmnto',
'        , b.fcha_dcmnto',
'        , b.fcha_vncmnto',
'        , b.vlor_ttal_dcmnto',
'        , b.dscrpcion_indcdor_pgo_aplcdo',
'        , c.vlor        vlor_rcdo',
'        , to_char(c.fcha_rcdo, ''DD/MM/YYYY'')fcha_rcdo',
'        , case when d.nmro_pryccion is not null then',
unistr('                   ''S\00ED'''),
'                else',
'                    ''No''',
'          end as indcdor_tne_pryccion',
'        , d.nmro_pryccion',
'        , to_char(d.fcha_pryccion, ''DD/MM/YYYY HH:MI:SS PM'')fcha_pryccion',
'   from apex_collections       a',
'   join v_re_g_documentos      b on a.n001 = b.id_dcmnto',
'   join v_re_g_recaudos        c on a.n001 = c.id_orgen',
'   left join gf_g_proyecciones d on c.id_orgen = d.id_dcmnto_cta_incial',
'  where collection_name        = ''DOCUMENTO_CTA_INICIAL''',
'    and a.n002                 = :F_ID_INSTNCIA_FLJO',
' ',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P109_INDCDOR_EXGE_CTA_INCIAL'
,p_plug_display_when_cond2=>'S'
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
 p_id=>wwv_flow_api.id(77556801545154185)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>77556801545154185
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72724855567195433)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'E'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72725206240195433)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'F'
,p_column_label=>'Id Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72723207102195428)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>30
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Docuemento')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72725633905195434)
,p_db_column_name=>'FCHA_DCMNTO'
,p_display_order=>40
,p_column_identifier=>'G'
,p_column_label=>'Fecha  <br>Documento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72723656254195428)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>50
,p_column_identifier=>'B'
,p_column_label=>'Fecha de  <br>Vencimiento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72724090778195430)
,p_db_column_name=>'VLOR_TTAL_DCMNTO'
,p_display_order=>60
,p_column_identifier=>'C'
,p_column_label=>'Valor del Documento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72724439326195431)
,p_db_column_name=>'DSCRPCION_INDCDOR_PGO_APLCDO'
,p_display_order=>70
,p_column_identifier=>'D'
,p_column_label=>unistr('\00BFDocuemento <br> Pagado?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70819961824843720)
,p_db_column_name=>'VLOR_RCDO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Valor  <br>Recaudado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70820010068843721)
,p_db_column_name=>'FCHA_RCDO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Fecha  <br>de Recaudo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70820159711843722)
,p_db_column_name=>'INDCDOR_TNE_PRYCCION'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('\00BFTiene  <br>Proyecci\00F3n?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70820249198843723)
,p_db_column_name=>'NMRO_PRYCCION'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('N\00B0 Proyecci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70820356070843724)
,p_db_column_name=>'FCHA_PRYCCION'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('Fecha de  <br>Proyecci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(77583317871921301)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'727260'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_DCMNTO:FCHA_VNCMNTO:DSCRPCION_INDCDOR_PGO_APLCDO:VLOR_RCDO:FCHA_RCDO:INDCDOR_TNE_PRYCCION:NMRO_PRYCCION:FCHA_PRYCCION:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(339605367104904666)
,p_plug_name=>unistr('Garant\00EDas')
,p_parent_plug_id=>wwv_flow_api.id(273371686642898273)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select seq_id, n001 tpo_grntia, ',
'													c001 dscrpcion, ',
'													c002 file_mimetype,  ',
'													c003 file_name,  ',
'													blob001 file_blob',
'											  from apex_collections ',
'											 where collection_name = ''ADJUNTAR_GARANTIA''',
'											',
'										  order by seq_id*/',
'',
'select a.seq_id, ',
'       a.n001 tipo_garantia, ',
'       b.DSCRPCION Tipo,',
'       a.c001 descrip, ',
'       a.c002 filename, ',
'       SUBSTR(a.c003, INSTR(a.c003, ''/'')+1) mimetype,',
'   --    SUBSTR(a.c003, 18) mimetype,',
'  --     a.c003 mimetype,',
'       a.blob001 blob',
'  from apex_collections a',
'  join GF_D_GARANTIAS_TIPO b on a.n001 = b.ID_GRNTIA_TPO',
'  where collection_name = ''ADJUNTAR_GARANTIA''',
' order by seq_id'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>'select * from gf_d_convenios_tipo a where a.id_cnvnio_tpo = :P105_ID_CNVNIO_TPO and a.indcdor_rqre_grntia = ''S'''
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
 p_id=>wwv_flow_api.id(296174726990630206)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>296174726990630206
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72716688577195406)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'V'
,p_column_label=>unistr('N\00B0')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72717085138195415)
,p_db_column_name=>'TIPO_GARANTIA'
,p_display_order=>20
,p_column_identifier=>'AB'
,p_column_label=>'Tipo Garantia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72717421068195415)
,p_db_column_name=>'TIPO'
,p_display_order=>30
,p_column_identifier=>'AC'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72717839997195417)
,p_db_column_name=>'DESCRIP'
,p_display_order=>40
,p_column_identifier=>'AD'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72718271423195417)
,p_db_column_name=>'FILENAME'
,p_display_order=>50
,p_column_identifier=>'AE'
,p_column_label=>'Filename'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72718625937195417)
,p_db_column_name=>'MIMETYPE'
,p_display_order=>60
,p_column_identifier=>'AF'
,p_column_label=>'Documento Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72719097529195419)
,p_db_column_name=>'BLOB'
,p_display_order=>70
,p_column_identifier=>'AG'
,p_column_label=>'Blob'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(296209902845380066)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'727194'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>':SEQ_ID:FILE_FILE_NAME:FILE_BLOB_GARANTIA:TIPO:DESCRIP:FILENAME:MIMETYPE:BLOB'
,p_break_on=>'TIPO:0:0:0:0'
,p_break_enabled_on=>'0:0:0:0:TIPO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(340466607857088597)
,p_plug_name=>'Plan de Pago'
,p_parent_plug_id=>wwv_flow_api.id(273371686642898273)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select n001 nmro_cta,',
'         n004 vlor_cptal,',
'         n005 vlor_intres,',
'         n003 vlor_fnccion,',
'         n002 vlor_cta, ',
'         d001 fcha_cta',
'  from gn_g_temporal ',
'  where id_ssion = :app_session',
' order by n001'))
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
 p_id=>wwv_flow_api.id(299837462288045497)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'<b>&P44_RSPSTA.</b>'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>299837462288045497
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72720133792195423)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>20
,p_column_identifier=>'F'
,p_column_label=>unistr('N\00B0 Cuota')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72720536510195423)
,p_db_column_name=>'FCHA_CTA'
,p_display_order=>30
,p_column_identifier=>'M'
,p_column_label=>'Fecha Vencimiento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72721389554195423)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>50
,p_column_identifier=>'O'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72721744926195424)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>60
,p_column_identifier=>'P'
,p_column_label=>unistr('Valor Inter\00E9s')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72722170494195424)
,p_db_column_name=>'VLOR_FNCCION'
,p_display_order=>70
,p_column_identifier=>'Q'
,p_column_label=>unistr('Valor Financiaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72720928785195423)
,p_db_column_name=>'VLOR_CTA'
,p_display_order=>80
,p_column_identifier=>'N'
,p_column_label=>'Valor Cuota'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(341742378287601475)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'727225'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CTA:FCHA_CTA:VLOR_CPTAL:VLOR_INTRES:VLOR_FNCCION:VLOR_CTA:'
,p_sum_columns_on_break=>'VLOR_CTA:VLOR_CPTAL:VLOR_INTRES:VLOR_FNCCION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(294750759844515626)
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
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(340824636156224874)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'<i>',
'    <p align="justify">Funcionalidad de Solicitud de Acuerdo de Pago.<br><br> ',
'        Muestra resumen de solicitud de acuerdo de pago y el plan de pago seleccionado.</p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72726713770195437)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(294750759844515626)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Salir de la Funcionalidad?, Tenga en Cuenta Pueden Perderse los Datos.'',''BTN_REGRESAR'')'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(158216624079733932)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72701578063195288)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(294213230997160976)
,p_button_name=>'TERMINAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Terminar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de continuar?.'',''TERMINAR'')'
,p_button_condition=>'P109_ID_CNVNIO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72701940243195296)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(294213230997160976)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(252201877336651464)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(72731142029195461)
,p_branch_name=>unistr('Ir a P\00E1gina 108 - Garantia')
,p_branch_action=>'f?p=&APP_ID.:107:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72701940243195296)
,p_branch_sequence=>10
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'Select * from GF_D_CONVENIOS_TIPO A where a.ID_CNVNIO_TPO = :P105_ID_CNVNIO_TPO and a.indcdor_rqre_grntia = ''S'''
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(72731531506195461)
,p_branch_name=>unistr('Ir a P\00E1gina 106 - Plan de Pago')
,p_branch_action=>'f?p=&APP_ID.:106:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72701940243195296)
,p_branch_sequence=>20
,p_branch_condition_type=>'NOT_EXISTS'
,p_branch_condition=>'Select * from GF_D_CONVENIOS_TIPO A where a.ID_CNVNIO_TPO = :P105_ID_CNVNIO_TPO and a.indcdor_rqre_grntia = ''S'''
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(70820561383843726)
,p_branch_name=>'Ir al Inicio - 301'
,p_branch_action=>'f?p=&APP_ID.:301:&SESSION.::&DEBUG.:RP,104,105,106,107,108,109::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72701578063195288)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(70820478656843725)
,p_branch_name=>'Ir a Inicio - 301'
,p_branch_action=>'f?p=&APP_ID.:301:&SESSION.::&DEBUG.:RP,104,105,106,107,108,109::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72726713770195437)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72702664932195307)
,p_name=>'P109_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(271029526814622387)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72703087262195314)
,p_name=>'P109_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(271029526814622387)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72703448584195314)
,p_name=>'P109_CDGO_SJTO_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(271029526814622387)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72703806780195314)
,p_name=>'P109_NMBRE_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(271029526814622387)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72704212058195314)
,p_name=>'P109_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(271029526814622387)
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
 p_id=>wwv_flow_api.id(72704606137195315)
,p_name=>'P109_IDNTFCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(271029526814622387)
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
 p_id=>wwv_flow_api.id(72705041399195315)
,p_name=>'P109_UBCCION_SJTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(271029526814622387)
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
 p_id=>wwv_flow_api.id(72705432163195315)
,p_name=>'P109_DRCCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(271029526814622387)
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
 p_id=>wwv_flow_api.id(72705826212195315)
,p_name=>'P109_ID_SJTO_IMPSTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(271029526814622387)
,p_source=>'P41_ID_SJTO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72706236443195315)
,p_name=>'P109_RSPSTA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(271029526814622387)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72706678224195316)
,p_name=>'P109_ID_PRYCCION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(271029526814622387)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72707087036195316)
,p_name=>'P109_MNSJE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(271029526814622387)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72707426208195347)
,p_name=>'P109_INDCDOR_EXGE_CTA_INCIAL'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(271029526814622387)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72708154490195351)
,p_name=>'P109_CDGO_IDNTFCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(271410965034819643)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_source=>'P42_TIPO_IDENTIFICACION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72708598686195351)
,p_name=>'P109_NMRO_IDNTFCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(271410965034819643)
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
 p_id=>wwv_flow_api.id(72708977448195352)
,p_name=>'P109_NMBRE_CMPLTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(271410965034819643)
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
 p_id=>wwv_flow_api.id(72709300622195352)
,p_name=>'P109_DRCCION_NTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(271410965034819643)
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
 p_id=>wwv_flow_api.id(72709759436195352)
,p_name=>'P109_UBCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(271410965034819643)
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
 p_id=>wwv_flow_api.id(72710130326195353)
,p_name=>'P109_TLFNO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(271410965034819643)
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
 p_id=>wwv_flow_api.id(72710553697195353)
,p_name=>'P109_CLLAR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(271410965034819643)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72710971417195353)
,p_name=>'P109_EMAIL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(271410965034819643)
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
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72711351022195353)
,p_name=>'P109_ID_SLCTNTE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(271410965034819643)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72711779451195353)
,p_name=>'P109_ID_SLCTUD'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(271410965034819643)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72712494513195374)
,p_name=>'P109_VLOR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(273371686642898273)
,p_use_cache_before_default=>'NO'
,p_source=>'P105_VLOR'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72712803354195374)
,p_name=>'P109_FCHA_RCDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(273371686642898273)
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P109_INDCDOR_EXGE_CTA_INCIAL'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72713214801195374)
,p_name=>'P109_ID_DCMNTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(273371686642898273)
,p_source=>'P105_ID_DCMNTO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72713662696195374)
,p_name=>'P109_INDCDOR_TNE_PRYCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(273371686642898273)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72713939252195389)
,p_name=>'P109_NMRO_PRYCCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(273371686642898273)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72714375702195389)
,p_name=>'P109_FCHA_PRYCCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(273371686642898273)
,p_source=>'P105_FCHA_PRYCCION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72714759253195390)
,p_name=>'P109_ID_CNVNIO_TPO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(273371686642898273)
,p_prompt=>'Tipo de Acuerdo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CONVENIO_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       ID_CNVNIO_TPO as r',
'  from gf_d_convenios_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72715164180195403)
,p_name=>'P109_NMRO_CTAS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(273371686642898273)
,p_prompt=>'No. Cuotas'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72715561965195404)
,p_name=>'P109_CDGO_PRDCDAD_CTA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(273371686642898273)
,p_prompt=>'Periodicidad Cuota '
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
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72715988811195404)
,p_name=>'P109_FCHA_PRMRA_CTA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(273371686642898273)
,p_prompt=>'Fecha Primera Cuota'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72727195134195437)
,p_name=>'P109_ID_CNVNIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(294750759844515626)
,p_source=>'P105_ID_CNVNIO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72727506000195437)
,p_name=>'P109_NMRO_CNVNIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(294750759844515626)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(72728315062195450)
,p_computation_sequence=>10
,p_computation_item=>'P109_INDCDOR_EXGE_CTA_INCIAL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_exge_cta_incial',
'  from gf_d_convenios_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_cnvnio_tpo = :P105_ID_CNVNIO_TPO;'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72729875094195459)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  pkg_gf_convenios.prc_ac_convenio(p_id_cnvnio			=>    :P105_ID_CNVNIO,  ',
'                                   p_cdgo_clnte 		=>    :F_CDGO_CLNTE,  ',
'                                   p_id_sjto_impsto		=>    :P104_ID_SJTO_IMPSTO, ',
'                                   p_id_impsto_sbmpsto  =>    :P104_ID_IMPSTO_SBMPSTO,',
'                                   p_id_cnvnio_tpo		=>    :P105_ID_CNVNIO_TPO, ',
'                                   p_nmro_cta			=>    :P106_NMRO_CTAS, ',
'                                   p_cdgo_prdcdad_cta	=>    :P106_CDGO_PRDCDAD_CTA, ',
'                                   p_fcha_prmra_cta 	=>    :P106_FCHA_PRMRA_CTA,                                    ',
'                                   p_vgncia_prdo		=>    :P105_VGNCIA_PRDO, ',
'                                   p_id_ssion           =>    :APP_SESSION,',
'                                   p_id_usrio           =>    :F_ID_USRIO, ',
'                                   p_mnsje              =>    :P109_MNSJE);	                               ',
'end;',
'',
''))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(72701578063195288)
,p_process_when=>'P109_ID_CNVNIO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'&P109_MNSJE.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72729042709195458)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_cnvnio            number;',
'    v_nmro_cnvnio          number;',
'    v_mnsje                varchar2(2000);',
'    v_id_slctud            number;',
'    v_json_parametros      clob;',
'begin   ',
'    pkg_gf_convenios.prc_rg_convenio (p_cdgo_clnte 					=> :F_CDGO_CLNTE,',
'                                      p_id_impsto                   => :P109_ID_IMPSTO,  ',
'                                      p_id_impsto_sbmpsto           => :P104_ID_IMPSTO_SBMPSTO,',
'							          p_id_sjto_impsto				=> :P104_ID_SJTO_IMPSTO,',
'							          p_id_cnvnio_tpo				=> :P109_ID_CNVNIO_TPO,',
'							          p_nmro_cta					=> :P109_NMRO_CTAS ,',
'							          p_cdgo_prdcdad_cta			=> :P109_CDGO_PRDCDAD_CTA ,',
'							          p_fcha_prmra_cta 				=> :P109_FCHA_PRMRA_CTA,',
'							          p_id_usrio					=> :F_ID_USRIO ,',
'							          p_vgncia_prdo					=> :P105_VGNCIA_PRDO ,',
'                                      p_id_dcmnto_cta_incial        => :P105_ID_DCMNTO,',
'							          p_vlor_cta_incial             => :P105_VLOR_CTA_INCIAL ,',
'							          p_fcha_lmte_cta_incial        => :P105_FCHA_RCDO,',
'                                      p_id_instncia_fljo            => :F_ID_INSTNCIA_FLJO,',
'                                      p_id_ssion                    => :APP_SESSION,',
'							          p_id_cnvnio					=> :P109_ID_CNVNIO,',
'							          p_nmro_cnvnio					=> :P109_NMRO_CNVNIO ,',
'							          p_mnsje						=> :P109_RSPSTA);',
'  begin ',
'      select id_slctud',
'          into v_id_slctud',
'        from v_pq_g_solicitudes ',
'       where id_instncia_fljo_gnrdo = :F_ID_INSTNCIA_FLJO;',
'       ',
'  exception',
'      when others then ',
'          :P109_RSPSTA := :P109_RSPSTA || '' Error: No se encontro el flujo de PQR '' || SQLCODE || '' - '' || SQLERRM;',
'  end;',
'   ',
'    begin ',
'        pkg_pq_pqr.prc_rg_radicar_solicitud( p_id_slctud => v_id_slctud, p_cdgo_clnte =>:F_CDGO_CLNTE );',
'        commit;',
'        ',
'         begin',
'            select json_object( key ''p_id_cnvnio'' is :P109_ID_CNVNIO) ',
'              into v_json_parametros',
'              from dual;',
'',
'            --CONSULTAMOS SI HAY ENVIOS PROGRAMADOS',
'            pkg_ma_envios.prc_co_envio_programado( p_cdgo_clnte     => :F_CDGO_CLNTE',
'                                                 , p_idntfcdor      => ''PKG_GF_CONVENIOS.PRC_RG_CONVENIOS''',
'                                                 , p_json_prmtros   => v_json_parametros',
'                                                 );',
'        exception',
'            when others then',
'                rollback;',
'                null;',
'        end;',
'        ',
'    exception ',
'      when others then ',
'          rollback;',
'          :P109_RSPSTA := :P109_RSPSTA || '' Error: al Radicar la solitud '' || SQLCODE || '' - '' || SQLERRM;      ',
'    end;',
'                                     ',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(72701578063195288)
,p_process_when=>'P109_ID_CNVNIO'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>'&P109_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72729415926195458)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Recuperaci\00F3n Datos Solicitante y sujeto impuesto')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_slctnte,',
'        d.id_impsto,',
'        d.id_impsto_sbmpsto,',
'        a.id_slctud,',
'        a.cdgo_idntfccion_tpo,',
'        a.idntfccion,',
'        a.nmbre_slctnte,',
'        a.ubccion,',
'        a.drccion_ntfccion,',
'        a.tlfno,',
'        a.cllar,',
'        a.email,',
'        e.id_sjto_impsto,',
'        e.cdgo_sjto_tpo,',
'        pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => e.idntfccion_sjto , p_frmto => ''xx-xx-xxxx-xxxx-xxx'' , p_crcter_dlmtdor => ''-'' ) idntfccion_sjto,',
'        upper(e.nmbre_impsto),',
'        f.nmbre_impsto_sbmpsto,',
'        e.drccion,',
'        upper(e.nmbre_pais || ''-'' || e.nmbre_dprtmnto || ''-'' || e.nmbre_mncpio) ubccion_sjto',
'        ',
'  into :P109_ID_SLCTNTE,',
'       :P109_ID_IMPSTO,',
'       :P109_ID_IMPSTO_SBMPSTO,',
'       :P109_ID_SLCTUD,',
'       :P109_CDGO_IDNTFCION_TPO,',
'       :P109_NMRO_IDNTFCION,',
'       :P109_NMBRE_CMPLTO,',
'       :P109_UBCCION,',
'       :P109_DRCCION_NTFCCION,',
'       :P109_TLFNO,',
'       :P109_CLLAR,',
'       :P109_EMAIL,',
'       :P109_ID_SJTO_IMPSTO,',
'       :P109_CDGO_SJTO_TPO,',
'       :P109_IDNTFCCION,',
'       :P109_NMBRE_IMPSTO,',
'       :P109_NMBRE_IMPSTO_SBMPSTO,',
'       :P109_DRCCION,',
'       :P109_UBCCION_SJTO',
' from v_pq_g_solicitantes          a',
' join pq_g_solicitudes             b on a.id_slctud = b.id_slctud',
' join v_pq_g_solicitudes_motivo    c on a.id_slctud = c.id_slctud',
' join pq_g_slctdes_mtvo_sjt_impst  d on c.id_slctud_mtvo = d.id_slctud_mtvo',
' join v_si_i_sujetos_impuesto      e on d.id_sjto_impsto = e.id_sjto_impsto',
' join v_df_i_impuestos_subimpuesto f on d.id_impsto_sbmpsto = f.id_impsto_sbmpsto ',
'where a.ID_SLCTUD = :P104_ID_SLCTUD;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72728623707195456)
,p_process_sequence=>20
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Datos Acuerdo Pago'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  :P105_ID_CNVNIO_TPO',
'        ,   :P106_NMRO_CTAS ',
'        ,   :P106_CDGO_PRDCDAD_CTA',
'        ,   :P106_FCHA_PRMRA_CTA',
'    into  :P109_ID_CNVNIO_TPO',
'        ,   :P109_NMRO_CTAS',
'        ,   :P109_CDGO_PRDCDAD_CTA',
'        ,   :P109_FCHA_PRMRA_CTA',
'        ',
'    from dual;',
'exception',
'    when no_data_found then',
'        null;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
