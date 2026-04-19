prompt --application/pages/page_20240
begin
wwv_flow_api.create_page(
 p_id=>2024001
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>'Detalle Novedades'
,p_page_mode=>'MODAL'
,p_step_title=>'Detalle Novedades'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'ui-dialog--stretch'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20251114151455'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9345943764052479)
,p_plug_name=>'Detalle Novedades'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(52129532999074802)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9425245730443674)
,p_plug_name=>unistr('Informaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(52136352261074804)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5185529561576815)
,p_plug_name=>unistr('Cambio a Actividades Econ\00F3micas ')
,p_parent_plug_id=>wwv_flow_api.id(9425245730443674)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select id_nvdad_prsna_actvd_eco',
'        , ''['' ||  c.nmbre_dclrcns_esqma_trfa_tpo || '' - '' ||  b.cdgo_dclrcns_esqma_trfa || ''] '' || b.dscrpcion actvdad_ecnmca',
'        , fcha_incio_actvdad',
'        , estdo',
'from si_g_nvddes_prsna_actvd_eco    a',
'	join gi_d_dclrcns_esqma_trfa     b   on a.id_actvdad_ecnmca    = b.id_dclrcns_esqma_trfa ',
'	join gi_d_dclrcns_esqma_trfa_tpo c   on  b.id_dclrcns_esqma_trfa_tpo =   c.id_dclrcns_esqma_trfa_tpo',
' where id_nvdad_prsna                 = :P2024001_ID_NVDAD_PRSNA',
' and a.estdo is not null;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'     from si_g_nvddes_prsna_actvd_eco    ',
'    where id_nvdad_prsna   = :P2024001_ID_NVDAD_PRSNA'))
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
 p_id=>wwv_flow_api.id(5185638981576816)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'DBALDOVINO'
,p_internal_uid=>5185638981576816
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5208145691708401)
,p_db_column_name=>'ID_NVDAD_PRSNA_ACTVD_ECO'
,p_display_order=>10
,p_column_identifier=>'L'
,p_column_label=>'Id Nvdad Prsna Actvd Eco'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5208273731708402)
,p_db_column_name=>'ACTVDAD_ECNMCA'
,p_display_order=>20
,p_column_identifier=>'M'
,p_column_label=>unistr('Actividad Econ\00F3mica ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5208342775708403)
,p_db_column_name=>'FCHA_INCIO_ACTVDAD'
,p_display_order=>30
,p_column_identifier=>'N'
,p_column_label=>'Fecha de Actividad'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5238811107160603)
,p_db_column_name=>'ESTDO'
,p_display_order=>40
,p_column_identifier=>'O'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5218506331721293)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'52186'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_NVDAD_PRSNA_ACTVD_ECO:ACTVDAD_ECNMCA:FCHA_INCIO_ACTVDAD:ESTDO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9425344191443675)
,p_plug_name=>'Cambios al sujeto tributo'
,p_parent_plug_id=>wwv_flow_api.id(9425245730443674)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_nvdad_prsna_dtlle    id_tmpral',
'        , a.lbel_atrbto            lbel',
'        , nvl(txto_vlor_antrior, nvl(a.vlor_antrior, '' ''))    txto_vlor_antrior',
'        , nvl(txto_vlor_nvo,     nvl(a.vlor_nvo, '' ''))        txto_vlor_nvo',
'     from si_g_novedades_prsna_dtlle    a',
'    where a.id_nvdad_prsna              = :P2024001_ID_NVDAD_PRSNA',
'     -- and a.atrbto                      like ''P34%''; ',
'     and not(nvl(txto_vlor_antrior, nvl(a.vlor_antrior, '' ''))  = ''ACTUALIZACION'' and a.lbel_atrbto like ''P%_'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'     from si_g_novedades_prsna_dtlle    a',
'    where a.id_nvdad_prsna              = :P2024001_ID_NVDAD_PRSNA'))
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
 p_id=>wwv_flow_api.id(9425392635443676)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'HGOMEZ'
,p_internal_uid=>9425392635443676
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4768247953284989)
,p_db_column_name=>'ID_TMPRAL'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Tmpral'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4768609224284991)
,p_db_column_name=>'LBEL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Atributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4769003644284991)
,p_db_column_name=>'TXTO_VLOR_ANTRIOR'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Valor Anterior'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4769433751284992)
,p_db_column_name=>'TXTO_VLOR_NVO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Valor Nuevo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(9458150316521274)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'47698'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_TMPRAL:LBEL:TXTO_VLOR_ANTRIOR:TXTO_VLOR_NVO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9425909865443681)
,p_plug_name=>'Cambios a Responsables'
,p_parent_plug_id=>wwv_flow_api.id(9425245730443674)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>20
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
'    where id_nvdad_prsna                 = :P2024001_ID_NVDAD_PRSNA',
'    and estdo is not null;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'     select 1',
'     from si_g_novddes_prsna_rspnsble    a',
'    where id_nvdad_prsna                 = :P2024001_ID_NVDAD_PRSNA',
'    and estdo is not null;'))
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
 p_id=>wwv_flow_api.id(9426067972443682)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'HGOMEZ'
,p_internal_uid=>9426067972443682
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4770536640284995)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4770993640284996)
,p_db_column_name=>'ID_SJTO_RSPNSBLE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Sjto Rspnsble'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4771349480284996)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4771770919284996)
,p_db_column_name=>'CDGO_IDNTFCCION_TPO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('C\00F3digo Identificaci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(5231542945269644)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4772165820284997)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4772534258284997)
,p_db_column_name=>'PRMER_NMBRE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Primer Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4772966663284997)
,p_db_column_name=>'SGNDO_NMBRE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Segundo Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4773379675284998)
,p_db_column_name=>'PRMER_APLLDO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Primer Apellido'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4773738151284998)
,p_db_column_name=>'SGNDO_APLLDO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Segundo Apellido'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4774128004284998)
,p_db_column_name=>'PRNCPAL_S_N'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('\00BFPrincipal?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(23563595757684546)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4774581774284999)
,p_db_column_name=>'CDGO_TPO_RSPNSBLE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Tipo de <br>Responsable'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(5231790915272088)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4774908555284999)
,p_db_column_name=>'PRCNTJE_PRTCPCION'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Prcntje Prtcpcion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4775399395284999)
,p_db_column_name=>'ORGEN_DCMNTO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Orgen Dcmnto'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4775740095285000)
,p_db_column_name=>'ID_PAIS_NTFCCION'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Id Pais Ntfccion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4776106785285000)
,p_db_column_name=>'ID_DPRTMNTO_NTFCCION'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Id Dprtmnto Ntfccion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4776533654285000)
,p_db_column_name=>'ID_MNCPIO_NTFCCION'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Id Mncpio Ntfccion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4776901256285000)
,p_db_column_name=>'DRCCION_NTFCCION'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Drccion Ntfccion'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4777317779285001)
,p_db_column_name=>'EMAIL'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Email'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4777734415285001)
,p_db_column_name=>'TLFNO'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Tlfno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4778132056285001)
,p_db_column_name=>'CLLAR'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Cllar'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4778590032285002)
,p_db_column_name=>'ACTVO'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(23563595757684546)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4778997201285002)
,p_db_column_name=>'ID_TRCRO'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Id Trcro'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5238644598160601)
,p_db_column_name=>'ESTDO'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(9458700501521280)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'47797'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SEQ_ID:ID_SJTO_RSPNSBLE:ID_SJTO_IMPSTO:CDGO_IDNTFCCION_TPO:IDNTFCCION:PRMER_NMBRE:SGNDO_NMBRE:PRMER_APLLDO:SGNDO_APLLDO:PRNCPAL_S_N:CDGO_TPO_RSPNSBLE:PRCNTJE_PRTCPCION:ORGEN_DCMNTO:ID_PAIS_NTFCCION:ID_DPRTMNTO_NTFCCION:ID_MNCPIO_NTFCCION:DRCCION_NTFC'
||'CION:EMAIL:TLFNO:CLLAR:ACTVO:ID_TRCRO:ESTDO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9428463684443706)
,p_plug_name=>'Cambio a Sucursales'
,p_parent_plug_id=>wwv_flow_api.id(9425245730443674)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>30
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
'        , email    ',
'        , estdo',
'     from si_g_nvddes_prsna_scrsal    ',
'    where id_nvdad_prsna   = :P2024001_ID_NVDAD_PRSNA',
'    and estdo is not null'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'     from si_g_nvddes_prsna_scrsal    ',
'    where id_nvdad_prsna   = :P2024001_ID_NVDAD_PRSNA',
'    and estdo is not null;'))
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
 p_id=>wwv_flow_api.id(9428520533443707)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'HGOMEZ'
,p_internal_uid=>9428520533443707
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4780479188285003)
,p_db_column_name=>'ID_NVDAD_PRSNA_SCRSAL'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Nvdad Prsna Scrsal'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4780825869285004)
,p_db_column_name=>'ID_NVDAD_PRSNA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Nvdad Prsna'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4781285405285004)
,p_db_column_name=>'CDGO_SCRSAL'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('C\00F3digo Sucursal')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4781685629285004)
,p_db_column_name=>'NMBRE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4782049769285005)
,p_db_column_name=>'DRCCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4782441354285005)
,p_db_column_name=>'DPRTMNTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Departamento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4782854389285005)
,p_db_column_name=>'MNCPIO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Municipio'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4783228976285005)
,p_db_column_name=>'TLFNO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Telefono'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4783615649285006)
,p_db_column_name=>'CLLAR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Celular'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4784078605285006)
,p_db_column_name=>'EMAIL'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Email'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5238730392160602)
,p_db_column_name=>'ESTDO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(9459489177521286)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'47848'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_NVDAD_PRSNA_SCRSAL:ID_NVDAD_PRSNA:CDGO_SCRSAL:NMBRE:DRCCION:DPRTMNTO:MNCPIO:TLFNO:CLLAR:EMAIL:ESTDO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4785505184285008)
,p_name=>'P2024001_ID_NVDAD_PRSNA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9345943764052479)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
