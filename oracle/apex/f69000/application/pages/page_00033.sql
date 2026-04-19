prompt --application/pages/page_00033
begin
wwv_flow_api.create_page(
 p_id=>33
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>'Resumen Novedad Persona / Consulta'
,p_step_title=>'Resumen Novedad Persona / Consulta'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(74223953760684848)
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20241204142041'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(139495602612448055)
,p_plug_name=>'Resumen Novedad Persona'
,p_region_template_options=>'#DEFAULT#:t-Region--accent1:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(70717402343458101)
,p_plug_name=>unistr('Display Selector - Actualizaci\00F3n / Cancelaci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(139495602612448055)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P33_CDGO_NVDAD_TPO != ''INS'''
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(70717593243458102)
,p_plug_name=>'Cambios al sujeto tributo'
,p_parent_plug_id=>wwv_flow_api.id(70717402343458101)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_nvdad_prsna_dtlle    id_tmpral',
'        , a.lbel_atrbto            lbel',
'        , nvl(txto_vlor_antrior, nvl(a.vlor_antrior, '' ''))    txto_vlor_antrior',
'        , nvl(txto_vlor_nvo,     nvl(a.vlor_nvo, '' ''))        txto_vlor_nvo',
'     from si_g_novedades_prsna_dtlle    a',
'    where a.id_nvdad_prsna              = :P33_ID_NVDAD_PRSNA',
'      and a.atrbto                      like ''P34%'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
'     from si_g_novedades_prsna_dtlle    a',
'    where a.id_nvdad_prsna              = :P33_ID_NVDAD_PRSNA',
'      and a.atrbto                      like ''P34%''',
'      and :P33_CDGO_NVDAD_TPO != ''INS'';'))
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
 p_id=>wwv_flow_api.id(70717609042458103)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>70717609042458103
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70717778572458104)
,p_db_column_name=>'ID_TMPRAL'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Tmpral'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70717825250458105)
,p_db_column_name=>'LBEL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Atributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70818399603843704)
,p_db_column_name=>'TXTO_VLOR_ANTRIOR'
,p_display_order=>30
,p_column_identifier=>'E'
,p_column_label=>'Valor Anterior'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70818472998843705)
,p_db_column_name=>'TXTO_VLOR_NVO'
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>'Valor Nuevo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(70732458414502611)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'707325'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_TMPRAL:LBEL:TXTO_VLOR_ANTRIOR:TXTO_VLOR_NVO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(70718177478458108)
,p_plug_name=>'Cambios a Responsables'
,p_parent_plug_id=>wwv_flow_api.id(70717402343458101)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select id_nvdad_prsna_rspnsble seq_id',
'        , id_sjto_rspnsble',
'        , null id_sjto_impsto',
'        , cdgo_idntfccion_tpo',
'        , idntfccion',
'        , prmer_nmbre',
'        , sgndo_nmbre',
'        , prmer_aplldo',
'        , sgndo_aplldo',
'        , prncpal_s_n',
'        , cdgo_tpo_rspnsble',
'        , prcntje_prtcpcion',
'        , orgen_dcmnto',
'        , id_pais_ntfccion',
'        , id_dprtmnto_ntfccion',
'        , id_mncpio_ntfccion',
'        , drccion_ntfccion',
'        , email',
'        , tlfno',
'        , cllar',
'        , actvo',
'        , id_trcro',
'        , estdo',
'     from si_g_novddes_prsna_rspnsble    a',
'    where id_nvdad_prsna                 = :P33_ID_NVDAD_PRSNA;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from si_g_novddes_prsna_rspnsble    a',
'    where id_nvdad_prsna                 = :P33_ID_NVDAD_PRSNA ',
'    and :P33_CDGO_NVDAD_TPO != ''INS'';'))
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
 p_id=>wwv_flow_api.id(70718236570458109)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP,36:P36_ID_NVDAD_PRSNA,P36_ID_NVDAD_PRSNA_RSPNSBLE:&P33_ID_NVDAD_PRSNA.,#SEQ_ID#'
,p_detail_link_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span aria-hidden="true" class="fa fa-eye" style="color: blue;" ></span>',
''))
,p_owner=>'SROMERO'
,p_internal_uid=>70718236570458109
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70718363495458110)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70718469097458111)
,p_db_column_name=>'ID_SJTO_RSPNSBLE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Sjto Rspnsble'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70718583277458112)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70718689190458113)
,p_db_column_name=>'CDGO_IDNTFCCION_TPO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Tipo<br>de Identificaci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(70586543772699932)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70718701373458114)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70718871058458115)
,p_db_column_name=>'PRMER_NMBRE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Primer Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70718929202458116)
,p_db_column_name=>'SGNDO_NMBRE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Segundo Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70719067765458117)
,p_db_column_name=>'PRMER_APLLDO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Primer Apellido'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70719176534458118)
,p_db_column_name=>'SGNDO_APLLDO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Segundo Apellido'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70719224533458119)
,p_db_column_name=>'PRNCPAL_S_N'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('\00BFPrincipal?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(105710618312748017)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70719325323458120)
,p_db_column_name=>'CDGO_TPO_RSPNSBLE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Tipo de <br>Responsable'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(70591738739699933)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70719412180458121)
,p_db_column_name=>'PRCNTJE_PRTCPCION'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Prcntje Prtcpcion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70719550182458122)
,p_db_column_name=>'ORGEN_DCMNTO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Orgen Dcmnto'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70719628260458123)
,p_db_column_name=>'ID_PAIS_NTFCCION'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Id Pais Ntfccion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70719758260458124)
,p_db_column_name=>'ID_DPRTMNTO_NTFCCION'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Id Dprtmnto Ntfccion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70719866482458125)
,p_db_column_name=>'ID_MNCPIO_NTFCCION'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Id Mncpio Ntfccion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70719937181458126)
,p_db_column_name=>'DRCCION_NTFCCION'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Drccion Ntfccion'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70720053376458127)
,p_db_column_name=>'EMAIL'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Email'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70720161397458128)
,p_db_column_name=>'TLFNO'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Tlfno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70720219553458129)
,p_db_column_name=>'CLLAR'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Cllar'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70720323510458130)
,p_db_column_name=>'ACTVO'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(105710618312748017)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70720420285458131)
,p_db_column_name=>'ID_TRCRO'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Id Trcro'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70720519498458132)
,p_db_column_name=>'ESTDO'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(70733056115502624)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'707331'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SEQ_ID:ID_SJTO_RSPNSBLE:ID_SJTO_IMPSTO:CDGO_IDNTFCCION_TPO:IDNTFCCION:PRMER_NMBRE:SGNDO_NMBRE:PRMER_APLLDO:SGNDO_APLLDO:PRNCPAL_S_N:CDGO_TPO_RSPNSBLE:PRCNTJE_PRTCPCION:ORGEN_DCMNTO:ID_PAIS_NTFCCION:ID_DPRTMNTO_NTFCCION:ID_MNCPIO_NTFCCION:DRCCION_NTFC'
||'CION:EMAIL:TLFNO:CLLAR:ACTVO:ID_TRCRO:ESTDO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(115042060774854101)
,p_plug_name=>'Cambio a Sucursales'
,p_parent_plug_id=>wwv_flow_api.id(70717402343458101)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select id_nvdad_prsna_scrsal ',
'        , id_nvdad_prsna    ',
'        , cdgo_scrsal',
'        , nmbre                 ',
'        , drccion               ',
'        , (select b.nmbre_dprtmnto from df_s_departamentos b where b.id_dprtmnto = id_dprtmnto_ntfccion ) dprtmnto',
'        , (select c.nmbre_mncpio from df_s_municipios c where c.id_mncpio = id_mncpio_ntfccion) mncpio',
'        , tlfno                 ',
'        , cllar                 ',
'        , email          ',
'        , estdo',
'     from si_g_nvddes_prsna_scrsal    ',
'    where id_nvdad_prsna   = :P33_ID_NVDAD_PRSNA',
'    and estdo is not null'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select 1',
'     from si_g_nvddes_prsna_scrsal    ',
'    where id_nvdad_prsna   = :P33_ID_NVDAD_PRSNA',
'    and estdo is not null',
'    and :P33_CDGO_NVDAD_TPO != ''INS'';'))
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
 p_id=>wwv_flow_api.id(115043241709854113)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JLUJAN'
,p_internal_uid=>115043241709854113
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115043357902854114)
,p_db_column_name=>'ID_NVDAD_PRSNA_SCRSAL'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Nvdad Prsna Scrsal'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115043442498854115)
,p_db_column_name=>'ID_NVDAD_PRSNA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Nvdad Prsna'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115043559377854116)
,p_db_column_name=>'CDGO_SCRSAL'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('C\00F3digo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115043646486854117)
,p_db_column_name=>'NMBRE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115043737242854118)
,p_db_column_name=>'DRCCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115044373732854124)
,p_db_column_name=>'DPRTMNTO'
,p_display_order=>60
,p_column_identifier=>'K'
,p_column_label=>'Departamento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115044428567854125)
,p_db_column_name=>'MNCPIO'
,p_display_order=>70
,p_column_identifier=>'L'
,p_column_label=>'Municipio'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115044099259854121)
,p_db_column_name=>'TLFNO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Telefono'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115044131901854122)
,p_db_column_name=>'CLLAR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Celular'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115044204625854123)
,p_db_column_name=>'EMAIL'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Email'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115044798159854128)
,p_db_column_name=>'ESTDO'
,p_display_order=>110
,p_column_identifier=>'M'
,p_column_label=>unistr('Tipo Actualizaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(115061520002860418)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1150616'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_NVDAD_PRSNA_SCRSAL:ID_NVDAD_PRSNA:CDGO_SCRSAL:NMBRE:DRCCION:TLFNO:CLLAR:EMAIL:DPRTMNTO:MNCPIO:ESTDO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(139530945049395555)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(70717402343458101)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select id_nvdad_prsna_adjnto',
'        , file_name',
'     from si_g_novedades_prsna_adjnto   a',
'    where id_nvdad_prsna                = :P33_ID_NVDAD_PRSNA'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from si_g_novedades_prsna_adjnto   a',
'    where id_nvdad_prsna                = :P33_ID_NVDAD_PRSNA',
'    and :P33_CDGO_NVDAD_TPO != ''INS'';'))
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
 p_id=>wwv_flow_api.id(139531081786395556)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>139531081786395556
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69850315426108407)
,p_db_column_name=>'ID_NVDAD_PRSNA_ADJNTO'
,p_display_order=>10
,p_column_identifier=>'C'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:SI_G_NOVEDADES_PRSNA_ADJNTO:FILE_BLOB:ID_NVDAD_PRSNA_ADJNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<span aria-hidden="true" class="fa fa-cloud-download"></span>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69876801900309672)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(139542154568509223)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'698772'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FILE_NAME:ID_NVDAD_PRSNA_ADJNTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(139530647698395552)
,p_plug_name=>'Sujeto'
,p_parent_plug_id=>wwv_flow_api.id(139495602612448055)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_display_when_condition=>'P33_CDGO_NVDAD_TPO'
,p_plug_display_when_cond2=>'INS'
,p_attribute_01=>'P33_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(139553084387727151)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(74320835786173710)
,p_plug_name=>'Reporte'
,p_parent_plug_id=>wwv_flow_api.id(139553084387727151)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(139553094760727152)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
'    <p align="justify">Funcionalidad que permite ver el resumen de la novedad consultada.<br> ',
'        ',
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(148068495988951299)
,p_plug_name=>unistr('Informaci\00F3n de Contribuyente')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--accent1:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P33_ID_NVDAD_PRSNA_SJTO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(148068509682951300)
,p_plug_name=>unistr('<b>Informaci\00F3n B\00E1sica</b>')
,p_parent_plug_id=>wwv_flow_api.id(148068495988951299)
,p_region_template_options=>'#DEFAULT#:t-Region--accent1:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P33_CDGO_NVDAD_TPO'
,p_plug_display_when_cond2=>'INS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(148069800526951312)
,p_plug_name=>unistr('<b>Informaci\00F3n de Notificaci\00F3n</b>')
,p_parent_plug_id=>wwv_flow_api.id(148068495988951299)
,p_region_template_options=>'#DEFAULT#:t-Region--accent1:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P33_CDGO_NVDAD_TPO'
,p_plug_display_when_cond2=>'INS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(148070426645951319)
,p_plug_name=>unistr('<b>Informaci\00F3n de Camara de Comercio</b>')
,p_parent_plug_id=>wwv_flow_api.id(148068495988951299)
,p_region_template_options=>'#DEFAULT#:t-Region--accent1:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P33_TPO_PRSNA'
,p_plug_display_when_cond2=>'J'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(148071580483951330)
,p_plug_name=>unistr('Display Selector Inscripci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(148068495988951299)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--accent1:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P33_CDGO_NVDAD_TPO'
,p_plug_display_when_cond2=>'INS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9061018705576201)
,p_plug_name=>'Sucursales'
,p_parent_plug_id=>wwv_flow_api.id(148071580483951330)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select id_nvdad_prsna_scrsal ',
'        , id_nvdad_prsna    ',
'        , cdgo_scrsal',
'        , nmbre                 ',
'        , drccion               ',
'        , (select b.nmbre_dprtmnto from df_s_departamentos b where b.id_dprtmnto = id_dprtmnto_ntfccion ) dprtmnto',
'        , (select c.nmbre_mncpio from df_s_municipios c where c.id_mncpio = id_mncpio_ntfccion) mncpio  ',
'        , tlfno                 ',
'        , cllar                 ',
'        , email          ',
'     from si_g_nvddes_prsna_scrsal    ',
'    where id_nvdad_prsna   = :P33_ID_NVDAD_PRSNA'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select 1 ',
'     from si_g_nvddes_prsna_scrsal    ',
'    where id_nvdad_prsna   = :P33_ID_NVDAD_PRSNA',
'    and :P33_CDGO_NVDAD_TPO = ''INS'''))
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
end;
/
begin
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(9061127798576202)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JPRADA'
,p_internal_uid=>9061127798576202
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9061579386576206)
,p_db_column_name=>'ID_NVDAD_PRSNA_SCRSAL'
,p_display_order=>10
,p_column_identifier=>'D'
,p_column_label=>'Id Nvdad Prsna Scrsal'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9061695440576207)
,p_db_column_name=>'ID_NVDAD_PRSNA'
,p_display_order=>20
,p_column_identifier=>'E'
,p_column_label=>'Id Nvdad Prsna'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9061796883576208)
,p_db_column_name=>'CDGO_SCRSAL'
,p_display_order=>30
,p_column_identifier=>'F'
,p_column_label=>unistr('C\00F3digo')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9061832643576209)
,p_db_column_name=>'NMBRE'
,p_display_order=>40
,p_column_identifier=>'G'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9061986008576210)
,p_db_column_name=>'DRCCION'
,p_display_order=>50
,p_column_identifier=>'H'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115044539257854126)
,p_db_column_name=>'DPRTMNTO'
,p_display_order=>60
,p_column_identifier=>'N'
,p_column_label=>'Departamento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115044631646854127)
,p_db_column_name=>'MNCPIO'
,p_display_order=>70
,p_column_identifier=>'O'
,p_column_label=>'Municipio'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9062251398576213)
,p_db_column_name=>'TLFNO'
,p_display_order=>80
,p_column_identifier=>'K'
,p_column_label=>unistr('Tel\00E9fono')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9062309960576214)
,p_db_column_name=>'CLLAR'
,p_display_order=>90
,p_column_identifier=>'L'
,p_column_label=>'Celular'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9062487767576215)
,p_db_column_name=>'EMAIL'
,p_display_order=>100
,p_column_identifier=>'M'
,p_column_label=>'Email'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(9071805169583673)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'90719'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_NVDAD_PRSNA_SCRSAL:ID_NVDAD_PRSNA:CDGO_SCRSAL:NMBRE:DRCCION:TLFNO:CLLAR:EMAIL:DPRTMNTO:MNCPIO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13841301701892101)
,p_plug_name=>'Adjuntos Novedad'
,p_parent_plug_id=>wwv_flow_api.id(148071580483951330)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'  select a.id_nvdad_prsna_adjnto,',
'         b.dscrpcion_adjnto,',
'         a.file_name,',
'        null,',
'        1 dscrgar',
'  from si_g_novedades_prsna_adjnto a join si_d_nvddes_prsna_adjnto_tp b ',
'                                  on a.id_nvdad_prsna_adjnto_tpo = b.id_nvdad_prsna_adjnto_tpo    ',
'  where a.id_nvdad_prsna = :P33_ID_NVDAD_PRSNA;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select 1',
'  from si_g_novedades_prsna_adjnto a join si_d_nvddes_prsna_adjnto_tp b ',
'                                  on a.id_nvdad_prsna_adjnto_tpo = b.id_nvdad_prsna_adjnto_tpo    ',
'  where a.id_nvdad_prsna = :P33_ID_NVDAD_PRSNA',
'  and :P33_CDGO_NVDAD_TPO = ''INS'';'))
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
 p_id=>wwv_flow_api.id(13841461476892102)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'HMARTINEZ'
,p_internal_uid=>13841461476892102
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13841749409892105)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'A'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13841992559892107)
,p_db_column_name=>'DSCRGAR'
,p_display_order=>50
,p_column_identifier=>'B'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'DOWNLOAD:SI_G_NOVEDADES_PRSNA_ADJNTO:FILE_BLOB:ID_NVDAD_PRSNA_ADJNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13842062091892108)
,p_db_column_name=>'ID_NVDAD_PRSNA_ADJNTO'
,p_display_order=>60
,p_column_identifier=>'C'
,p_column_label=>'Id Nvdad Prsna Adjnto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13842140870892109)
,p_db_column_name=>'DSCRPCION_ADJNTO'
,p_display_order=>70
,p_column_identifier=>'D'
,p_column_label=>'Dscrpcion Adjnto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13842224343892110)
,p_db_column_name=>'NULL'
,p_display_order=>80
,p_column_identifier=>'E'
,p_column_label=>'Null'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(13848974571901744)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'138490'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ADJNTO:FILE_NAME:DSCRGAR:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(148071669611951331)
,p_plug_name=>'Responsables'
,p_parent_plug_id=>wwv_flow_api.id(148071580483951330)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_nvdad_prsna',
'        , a.id_nvdad_prsna_rspnsble',
'        , a.cdgo_idntfccion_tpo',
'        , a.idntfccion',
'        , a.prmer_nmbre',
'        , a.sgndo_nmbre',
'        , a.prmer_aplldo',
'        , a.sgndo_aplldo',
'        , a.prncpal_s_n',
'        , a.cdgo_tpo_rspnsble',
'        , a.actvo',
'     from si_g_novddes_prsna_rspnsble    a',
'    where id_nvdad_prsna     			= :P33_ID_NVDAD_PRSNA'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from si_g_novddes_prsna_rspnsble    a',
'    where id_nvdad_prsna     			= :P33_ID_NVDAD_PRSNA',
'    and :P33_CDGO_NVDAD_TPO = ''INS'''))
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
 p_id=>wwv_flow_api.id(148071704587951332)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP,36:P36_ID_NVDAD_PRSNA,P36_ID_NVDAD_PRSNA_RSPNSBLE:#ID_NVDAD_PRSNA#,#ID_NVDAD_PRSNA_RSPNSBLE#'
,p_detail_link_text=>'<span aria-hidden="true" class="fa fa-eye" style="color: blue;" ></span>'
,p_owner=>'SROMERO'
,p_internal_uid=>148071704587951332
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74094808746885445)
,p_db_column_name=>'ID_NVDAD_PRSNA'
,p_display_order=>10
,p_column_identifier=>'K'
,p_column_label=>'Id Nvdad Prsna'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74090902629885385)
,p_db_column_name=>'ID_NVDAD_PRSNA_RSPNSBLE'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Id Nvdad Prsna Rspnsble'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74091267512885441)
,p_db_column_name=>'CDGO_IDNTFCCION_TPO'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>unistr('Tipo de<br> Indentificaci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(70586543772699932)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74091674814885442)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>unistr('Indentificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74092018329885443)
,p_db_column_name=>'PRMER_NMBRE'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Primer Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74092406837885443)
,p_db_column_name=>'SGNDO_NMBRE'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Segundo Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74092808321885444)
,p_db_column_name=>'PRMER_APLLDO'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Primer Apellido'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74093222502885444)
,p_db_column_name=>'SGNDO_APLLDO'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Segundo Apellido'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74093627816885444)
,p_db_column_name=>'PRNCPAL_S_N'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>unistr('\00BFPrincipal?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(105710618312748017)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74094093474885444)
,p_db_column_name=>'CDGO_TPO_RSPNSBLE'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Tipo de <br>Responsable'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(70591738739699933)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74094471933885445)
,p_db_column_name=>'ACTVO'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(105710618312748017)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(148098143561365702)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'740952'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_NVDAD_PRSNA_RSPNSBLE:CDGO_IDNTFCCION_TPO:IDNTFCCION:PRMER_NMBRE:SGNDO_NMBRE:PRMER_APLLDO:SGNDO_APLLDO:PRNCPAL_S_N:CDGO_TPO_RSPNSBLE:ACTVO:ID_NVDAD_PRSNA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(148072881489951343)
,p_plug_name=>unistr('Actividades Econ\00F3micas')
,p_parent_plug_id=>wwv_flow_api.id(148071580483951330)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_nvdad_prsna_actvd_eco',
'        , ''['' ||  c.nmbre_dclrcns_esqma_trfa_tpo || '' - '' ||  b.cdgo_dclrcns_esqma_trfa || ''] '' || b.dscrpcion actvdad_ecnmca',
'        , fcha_incio_actvdad',
'from si_g_nvddes_prsna_actvd_eco    a',
'	join gi_d_dclrcns_esqma_trfa     b   on a.id_actvdad_ecnmca    = b.id_dclrcns_esqma_trfa ',
'	join gi_d_dclrcns_esqma_trfa_tpo c   on  b.id_dclrcns_esqma_trfa_tpo =   c.id_dclrcns_esqma_trfa_tpo',
' where id_nvdad_prsna                 = :P33_ID_NVDAD_PRSNA',
' ',
'',
'/* select id_nvdad_prsna_actvd_eco',
'        , ''['' ||  c.nmbre_actvdad_ecnmca_tpo || '' - '' ||  b.cdgo_actvdad_ecnmca || ''] '' || b.dscrpcion actvdad_ecnmca',
'        , fcha_incio_actvdad',
'     from si_g_nvddes_prsna_actvd_eco    a',
'     join gi_d_actividades_economica     b on a.id_actvdad_ecnmca    = b.id_actvdad_ecnmca',
'     join gi_d_actividades_ecnmca_tpo    c on b.id_actvdad_ecnmca_tpo = c.id_actvdad_ecnmca_tpo',
'    where id_nvdad_prsna                 = :P33_ID_NVDAD_PRSNA */'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from si_g_nvddes_prsna_actvd_eco    a ',
' where id_nvdad_prsna                 = :P33_ID_NVDAD_PRSNA',
'    and :P33_CDGO_NVDAD_TPO = ''INS'''))
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
 p_id=>wwv_flow_api.id(148073012724951345)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>148073012724951345
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74095834427885488)
,p_db_column_name=>'ID_NVDAD_PRSNA_ACTVD_ECO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Nvdad Prsna Actvd Eco'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74096232479885488)
,p_db_column_name=>'ACTVDAD_ECNMCA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Actividad Econ\00F3mica')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74096667402885509)
,p_db_column_name=>'FCHA_INCIO_ACTVDAD'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Inicio de Actvidad'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(148109265121448450)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'740970'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_NVDAD_PRSNA_ACTVD_ECO:ACTVDAD_ECNMCA:FCHA_INCIO_ACTVDAD'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(148072990267951344)
,p_plug_name=>'Adjuntos PQR'
,p_parent_plug_id=>wwv_flow_api.id(148071580483951330)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_dcmnto,',
'        c.dscrpcion_dcmnto,',
'        a.file_name,',
'        a.obsrvcion,',
'        1 dscrgar',
'   from pq_g_documentos             a',
'   left join v_pq_g_solicitudes          b on a.id_slctud = b.id_slctud',
'   left join v_pq_d_motivos_documento    c on a.id_mtvo_dcmnto = c.id_mtvo_dcmnto',
'  where b.id_instncia_fljo_gnrdo     = :F_ID_INSTNCIA_FLJO'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
'   from pq_g_documentos             a',
'   left join v_pq_g_solicitudes          b on a.id_slctud = b.id_slctud ',
'  where b.id_instncia_fljo_gnrdo     = :F_ID_INSTNCIA_FLJO',
'  and :P33_CDGO_NVDAD_TPO = ''INS'''))
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
 p_id=>wwv_flow_api.id(148102814433440200)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>148102814433440200
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74097752278885510)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74098104266885510)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74098537970885510)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74098987854885510)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74099336938885510)
,p_db_column_name=>'DSCRGAR'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(148112342459466008)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'740997'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_DCMNTO:DSCRPCION_DCMNTO:FILE_NAME:OBSRVCION:DSCRGAR'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69878236831309678)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(139553084387727151)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP,33::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74862004946037005)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(74320835786173710)
,p_button_name=>'BTN_VER_ACTO'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Ver Acto'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR:V_GN_G_ACTOS,ID_ACTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,&P33_ID_ACTO.'
,p_button_condition=>'P33_ID_ACTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74320660964173708)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(74320835786173710)
,p_button_name=>'BTN_IMPRIMIR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(74321001295173712)
,p_branch_name=>unistr('Ir a P\00E1gina 37')
,p_branch_action=>'f?p=66000:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE:&P33_ID_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(74320660964173708)
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69850433719108408)
,p_name=>'P33_ID_NVDAD_PRSNA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(139495602612448055)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69850532382108409)
,p_name=>'P33_CDGO_NVDAD_PRSNA_ESTDO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(139495602612448055)
,p_prompt=>'Estado Novedad'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_NOVEDADES_PERSONA_ESTADO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(dscrpcion) as d,',
'       cdgo_nvdad_prsna_estdo as r',
'  from si_d_novedades_prsna_estdo',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69850640940108410)
,p_name=>'P33_ID_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(139495602612448055)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69850730318108411)
,p_name=>'P33_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(139495602612448055)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_SUBIMPUESTO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select upper(nmbre_impsto_sbmpsto)  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69850827200108412)
,p_name=>'P33_ID_USRIO_RGSTRO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(139495602612448055)
,p_prompt=>'Usuario Registro'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_USUARIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro || '' ['' ||idntfccion || '']'' as d,',
'       id_usrio as r',
'  from v_sg_g_usuarios',
' where cdgo_clnte        = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69850983905108413)
,p_name=>'P33_FCHA_RGSTRO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(139495602612448055)
,p_prompt=>'Fecha Registro'
,p_format_mask=>'DD/MM/YYYY HH:MI:SS AM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69851085523108414)
,p_name=>'P33_FCHA_APLCO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(139495602612448055)
,p_prompt=>unistr('Fecha Aplicaci\00F3n')
,p_format_mask=>'DD/MM/YYYY HH:MI:SS AM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P33_CDGO_NVDAD_PRSNA_ESTDO'
,p_display_when2=>'APL'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69851183638108415)
,p_name=>'P33_ID_USRIO_APLCO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(139495602612448055)
,p_prompt=>unistr('Usuario Aplicaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_USUARIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro || '' ['' ||idntfccion || '']'' as d,',
'       id_usrio as r',
'  from v_sg_g_usuarios',
' where cdgo_clnte        = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_display_when=>'P33_CDGO_NVDAD_PRSNA_ESTDO'
,p_display_when2=>'APL'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69851225672108416)
,p_name=>'P33_FCHA_RCHZO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(139495602612448055)
,p_prompt=>'Fecha Rechazo'
,p_format_mask=>'DD/MM/YYYY HH:MI:SS AM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P33_CDGO_NVDAD_PRSNA_ESTDO'
,p_display_when2=>'RCH'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69851382406108417)
,p_name=>'P33_ID_USRIO_RCHZO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(139495602612448055)
,p_prompt=>'Usuario Rechazo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_USUARIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro || '' ['' ||idntfccion || '']'' as d,',
'       id_usrio as r',
'  from v_sg_g_usuarios',
' where cdgo_clnte        = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_display_when=>'P33_CDGO_NVDAD_PRSNA_ESTDO'
,p_display_when2=>'RCH'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69851405281108418)
,p_name=>'P33_OBSRVCION_RCHZO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(139495602612448055)
,p_prompt=>unistr('Observaci\00F3n Rechazo')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_display_when=>'P33_CDGO_NVDAD_PRSNA_ESTDO'
,p_display_when2=>'RCH'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69874463607309651)
,p_name=>'P33_CDGO_NVDAD_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(139495602612448055)
,p_prompt=>'Tipo de Novedad'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_NOVEDADES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_nvdad_tpo as r',
'  from si_d_novedades_tipo',
' order by 1'))
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69874839280309653)
,p_name=>'P33_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(139495602612448055)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69875892906309661)
,p_name=>'P33_OBSRVCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(139495602612448055)
,p_prompt=>unistr('Observaci\00F3n Novedad')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74079606469885016)
,p_name=>'P33_ID_NVDAD_PRSNA_SJTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(148068495988951299)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74080264812885197)
,p_name=>'P33_TPO_PRSNA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(148068509682951300)
,p_prompt=>'Tipo de Persona'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Natural;N,Jur\00EDdica;J')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74080620839885198)
,p_name=>'P33_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(148068509682951300)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74081067684885206)
,p_name=>'P33_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(148068509682951300)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74081404955885206)
,p_name=>'P33_NMBRE_RZON_SCIAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(148068509682951300)
,p_prompt=>unistr('Raz\00F3n Social')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P33_TPO_PRSNA'
,p_display_when2=>'J'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74081818710885212)
,p_name=>'P33_ID_SJTO_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(148068509682951300)
,p_prompt=>'Tipo de Sujeto'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select nmbre_sjto_tpo',
'        , id_sjto_tpo',
'     from df_i_sujetos_tipo',
'    where cdgo_clnte            = :F_CDGO_CLNTE',
' order by nmbre_sjto_tpo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74082270187885212)
,p_name=>'P33_PRMER_NMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(148068509682951300)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P33_TPO_PRSNA'
,p_display_when2=>'N'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74082657176885213)
,p_name=>'P33_SGNDO_NMBRE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(148068509682951300)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P33_TPO_PRSNA'
,p_display_when2=>'N'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74083058099885213)
,p_name=>'P33_PRMER_APLLDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(148068509682951300)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P33_TPO_PRSNA'
,p_display_when2=>'N'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74083476840885213)
,p_name=>'P33_SGNDO_APLLDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(148068509682951300)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P33_TPO_PRSNA'
,p_display_when2=>'N'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74083840408885213)
,p_name=>'P33_ID_DPRTMNTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(148068509682951300)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_DEPARTAMENTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NMBRE_DPRTMNTO as d,',
'       ID_DPRTMNTO as r',
'  from DF_S_DEPARTAMENTOS',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74084222705885214)
,p_name=>'P33_ID_MNCPIO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(148068509682951300)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MUNICIPIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mncpio as d,',
'       id_mncpio as r',
'  from df_s_municipios',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74084680159885214)
,p_name=>'P33_DRCCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(148068509682951300)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74085367909885268)
,p_name=>'P33_ID_DPRTMNTO_NTFCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(148069800526951312)
,p_prompt=>unistr('Departamento Notificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_DEPARTAMENTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NMBRE_DPRTMNTO as d,',
'       ID_DPRTMNTO as r',
'  from DF_S_DEPARTAMENTOS',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74085668092885268)
,p_name=>'P33_ID_MNCPIO_NTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(148069800526951312)
,p_prompt=>unistr('Municipio Notificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MUNICIPIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mncpio as d,',
'       id_mncpio as r',
'  from df_s_municipios',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74086084817885268)
,p_name=>'P33_DRCCION_NTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(148069800526951312)
,p_prompt=>unistr('Direcci\00F3n Notificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74086460648885268)
,p_name=>'P33_TLFNO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(148069800526951312)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74086872256885268)
,p_name=>'P33_CLLAR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(148069800526951312)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74087218509885269)
,p_name=>'P33_EMAIL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(148069800526951312)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74087929430885271)
,p_name=>'P33_ID_ACTVDAD_ECNMCA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(148070426645951319)
,p_prompt=>unistr('Actividad Ec\00F3nomica Principal')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  ''['' || a.cdgo_dclrcns_esqma_trfa || ''] '' || a.dscrpcion ',
'         , a.cdgo_dclrcns_esqma_trfa     id_actvdad_ecnmca',
'         --a.cdgo_dclrcns_esqma_trfa',
'         --a.id_dclrcns_esqma_trfa',
'from    gi_d_dclrcns_esqma_trfa     a',
'join    gi_d_dclrcns_esqma_trfa_tpo b   on  b.id_dclrcns_esqma_trfa_tpo =   a.id_dclrcns_esqma_trfa_tpo',
'where   b.cdgo_clnte                =   :F_CDGO_CLNTE',
'        and cdgo_dclrcns_esqma_trfa_tpo in (''1'',''2'',''3'',''4'') ',
'order by    a.dscrpcion',
'',
' ',
' ',
' /*select  ''['' || b.cdgo_actvdad_ecnmca || ''] '' || b.dscrpcion',
'        , id_actvdad_ecnmca',
'     from gi_d_actividades_ecnmca_tpo    a',
'     join gi_d_actividades_economica     b on a.id_actvdad_ecnmca_tpo = b.id_actvdad_ecnmca_tpo',
'    where a.cdgo_clnte                   = :F_CDGO_CLNTE',
' order by b.cdgo_actvdad_ecnmca*/'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74088363623885272)
,p_name=>'P33_FCHA_RGSTRO_CMRA_CMRCIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(148070426645951319)
,p_prompt=>'Fecha Registro de Camara Comercio'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74088700445885272)
,p_name=>'P33_NMRO_RGSTRO_CMRA_CMRCIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(148070426645951319)
,p_prompt=>'Camara de Comercio'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74089101308885272)
,p_name=>'P33_FCHA_INCIO_ACTVDDES'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(148070426645951319)
,p_prompt=>'Fecha inicio Actividades'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74089531693885279)
,p_name=>'P33_NMRO_SCRSLES'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(148070426645951319)
,p_prompt=>'N.  Sucursales'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74089956687885298)
,p_name=>'P33_DRCCION_CMRA_CMRCIO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(148070426645951319)
,p_prompt=>unistr('Direcci\00F3n de Cam\00E1ra Comercio')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74320737833173709)
,p_name=>'P33_ID_RPRTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(74320835786173710)
,p_prompt=>'Reporte'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rprte as d',
'     , id_rprte    as r',
'  from gn_d_reportes',
' where cdgo_rprte_grpo = ''GSN'''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74861885310037003)
,p_name=>'P33_ID_PAIS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(148068509682951300)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74861915409037004)
,p_name=>'P33_ID_PAIS_NTFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(148069800526951312)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74862124739037006)
,p_name=>'P33_ID_ACTO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(139495602612448055)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(74321126940173713)
,p_name=>'habilitar imprimir'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P33_ID_RPRTE'
,p_condition_element=>'P33_ID_RPRTE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74321236458173714)
,p_event_id=>wwv_flow_api.id(74321126940173713)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(74320660964173708)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74321377598173715)
,p_event_id=>wwv_flow_api.id(74321126940173713)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(74320660964173708)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69880970428309682)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Datos de Novedad Persona'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'   select   id_impsto',
'        , id_impsto_sbmpsto',
'        , cdgo_nvdad_tpo',
'        , id_sjto_impsto',
'        , obsrvcion',
'        , cdgo_nvdad_prsna_estdo',
'        , id_usrio_rgstro',
'        , fcha_rgstro',
'        , id_usrio_aplco',
'        , fcha_aplco',
'        , id_usrio_rchzo',
'        , fcha_rchzo',
'        , obsrvcion_rchzo',
'        , id_acto',
'     into  :P33_ID_IMPSTO',
'        , :P33_ID_IMPSTO_SBMPSTO',
'        , :P33_CDGO_NVDAD_TPO',
'        , :P33_ID_SJTO_IMPSTO',
'        , :P33_OBSRVCION',
'        , :P33_CDGO_NVDAD_PRSNA_ESTDO',
'        , :P33_ID_USRIO_RGSTRO',
'        , :P33_FCHA_RGSTRO',
'        , :P33_ID_USRIO_APLCO',
'        , :P33_FCHA_APLCO',
'        , :P33_ID_USRIO_RCHZO',
'        , :P33_FCHA_RCHZO',
'        , :P33_OBSRVCION_RCHZO',
'        , :P33_ID_ACTO',
'     from si_g_novedades_persona',
'    where id_nvdad_prsna            = :P33_ID_NVDAD_PRSNA;',
'exception',
'    when others then ',
'         :P33_ID_IMPSTO                  := null;',
'        :P33_ID_IMPSTO_SBMPSTO          := null;',
'        :P33_CDGO_NVDAD_TPO             := null;',
'        :P33_ID_SJTO_IMPSTO             := null;',
'        :P33_OBSRVCION                  := null;',
'        :P33_CDGO_NVDAD_PRSNA_ESTDO     := null;',
'        :P33_ID_USRIO_RGSTRO            := null;',
'        :P33_FCHA_RGSTRO                := null;',
'        :P33_ID_USRIO_APLCO             := null;',
'        :P33_FCHA_APLCO                 := null;',
'        :P33_ID_USRIO_RCHZO             := null;',
'        :P33_FCHA_RCHZO                 := null;',
'        :P33_OBSRVCION_RCHZO            := null;',
'        :P33_ID_ACTO                    := null; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P33_ID_NVDAD_PRSNA'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74121125004899929)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Datos de Novedad Persona Sujeto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  select id_nvdad_prsna_sjto',
'        , tpo_prsna',
'		, cdgo_idntfccion_tpo',
'		, idntfccion',
'		, prmer_nmbre',
'		, sgndo_nmbre',
'		, prmer_aplldo		',
'		, sgndo_aplldo		',
'		, nmbre_rzon_scial',
'		, drccion',
'		, id_pais',
'		, id_dprtmnto',
'		, id_mncpio',
'		, drccion_ntfccion',
'		, id_pais_ntfccion',
'		, id_dprtmnto_ntfccion',
'		, id_mncpio_ntfccion',
'		, email',
'		, tlfno',
'		, cllar',
'		, nmro_rgstro_cmra_cmrcio',
'		, to_char(fcha_rgstro_cmra_cmrcio, ''DD/MM/YYYY'')',
'		, to_char(fcha_incio_actvddes, ''DD/MM/YYYY'')',
'		, nmro_scrsles',
'		, drccion_cmra_cmrcio',
'     --   , id_actvdad_ecnmca',
'		, cdgo_dclrcns_esqma_trfa',
'        , id_sjto_tpo',
'     into :P33_ID_NVDAD_PRSNA_SJTO',
'        , :P33_TPO_PRSNA',
'		, :P33_CDGO_IDNTFCCION_TPO',
'		, :P33_IDNTFCCION',
'		, :P33_PRMER_NMBRE',
'		, :P33_SGNDO_NMBRE',
'		, :P33_PRMER_APLLDO		',
'		, :P33_SGNDO_APLLDO		',
'		, :P33_NMBRE_RZON_SCIAL',
'		, :P33_DRCCION',
'		, :P33_ID_PAIS',
'		, :P33_ID_DPRTMNTO',
'		, :P33_ID_MNCPIO',
'		, :P33_DRCCION_NTFCCION',
'		, :P33_ID_PAIS_NTFCCION',
'		, :P33_ID_DPRTMNTO_NTFCCION',
'		, :P33_ID_MNCPIO_NTFCCION',
'		, :P33_EMAIL',
'		, :P33_TLFNO',
'		, :P33_CLLAR',
'		, :P33_NMRO_RGSTRO_CMRA_CMRCIO',
'		, :P33_FCHA_RGSTRO_CMRA_CMRCIO',
'		, :P33_FCHA_INCIO_ACTVDDES',
'		, :P33_NMRO_SCRSLES',
'		, :P33_DRCCION_CMRA_CMRCIO',
'		, :P33_ID_ACTVDAD_ECNMCA',
'        , :P33_ID_SJTO_TPO',
'     from si_g_novedades_persona_sjto a',
'    left join gi_d_dclrcns_esqma_trfa     b on a.id_actvdad_ecnmca = b.id_dclrcns_esqma_trfa',
'    where id_nvdad_prsna                = :P33_ID_NVDAD_PRSNA;',
'exception',
'    when no_data_found then',
'        :P33_ID_NVDAD_PRSNA_SJTO			:= null;',
'        :P33_TPO_PRSNA                      := null;',
'        :P33_CDGO_IDNTFCCION_TPO            := null;',
'        :P33_IDNTFCCION                     := null;',
'        :P33_PRMER_NMBRE                    := null;',
'        :P33_SGNDO_NMBRE                    := null;',
'        :P33_PRMER_APLLDO		            := null;',
'        :P33_SGNDO_APLLDO		            := null;',
'        :P33_NMBRE_RZON_SCIAL               := null;',
'        :P33_DRCCION                        := null;',
'        :P33_ID_PAIS                        := null;',
'        :P33_ID_DPRTMNTO                    := null;',
'        :P33_ID_MNCPIO                      := null;',
'        :P33_DRCCION_NTFCCION               := null;',
'        :P33_ID_PAIS_NTFCCION               := null;',
'        :P33_ID_DPRTMNTO_NTFCCION           := null;',
'        :P33_ID_MNCPIO_NTFCCION             := null;',
'        :P33_EMAIL                          := null;',
'        :P33_TLFNO                          := null;',
'        :P33_CLLAR                          := null;',
'        :P33_NMRO_RGSTRO_CMRA_CMRCIO        := null;',
'        :P33_FCHA_RGSTRO_CMRA_CMRCIO        := null;',
'        :P33_FCHA_INCIO_ACTVDDES            := null;',
'        :P33_NMRO_SCRSLES                   := null;',
'        :P33_DRCCION_CMRA_CMRCIO            := null;',
'        :P33_ID_ACTVDAD_ECNMCA              := null;',
'        :P33_ID_SJTO_TPO                    := null; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from si_g_novedades_persona_sjto',
'    where id_nvdad_prsna                = :P33_ID_NVDAD_PRSNA',
'     and :P33_CDGO_NVDAD_TPO = ''INS'''))
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74320980973173711)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_nmbre_rprte gn_d_reportes.nmbre_rprte%type;',
'     v_object json_object_t := json_object_t();  ',
'     v_json                 clob;   ',
'begin    ',
'     select nmbre_rprte',
'       into v_nmbre_rprte',
'       from gn_d_reportes ',
'      where id_rprte = :P33_ID_RPRTE;',
' ',
'    v_object.put(''id_nvdad_prsna'',:P33_ID_NVDAD_PRSNA); ',
'    v_object.put(''id_rprte'',:P33_ID_RPRTE);     ',
'    v_object.put(''nmbre_rprte'',v_nmbre_rprte);     ',
'    v_json := v_object.to_clob();',
'    apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );   ',
'    apex_util.set_session_state(''P37_JSON'', v_json);       ',
'    apex_util.set_session_state(''P37_ID_RPRTE'', :P33_ID_RPRTE);       ',
'   ',
'exception',
'     when no_data_found then',
'          null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(74320660964173708)
);
end;
/
