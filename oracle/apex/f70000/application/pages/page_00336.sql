prompt --application/pages/page_00336
begin
wwv_flow_api.create_page(
 p_id=>336
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Detalle Impuesto Telefon\00EDa Informaci\00F3n procesada')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Informaci\00F3n Procesada Impuesto Telefon\00EDa')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_last_updated_by=>'VROMERO'
,p_last_upd_yyyymmddhh24miss=>'20240805172631'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(161152865063815003)
,p_plug_name=>'TAB'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(161152938666815004)
,p_plug_name=>unistr('Informaci\00F3n Procesada Liquidaci\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.dscrpcion as Periodo',
'      ,a.vgncia as Vigencia',
'      ,(a.prmer_nmbre || '' ''|| a.sgndo_nmbre ||'' ''|| a.prmer_aplldo ||'' ''|| a.sgndo_aplldo) as Nombre_Suscriptor',
unistr('      ,  b.dscrpcion_idntfccion_tpo as Tipo_Identificaci\00F3n'),
unistr('      ,  a.idntfccion as Identificaci\00F3n'),
unistr('      ,  a.email as Correo_Electr\00F3nico'),
unistr('      ,  a.drccion_lnea as Direcci\00F3n_Instalaci\00F3n_L\00EDnea'),
unistr('      ,  a.nmro_lnea_tlfno as N\00FAmero_L\00EDnea_Telef\00F3nica'),
unistr('      ,  d.nmbre_impsto_acto as Destinaci\00F3n'),
'      ,  a.estrato as Estrato_Socioeconomico ',
unistr('      ,  a.drccion_lnea as Direcci\00F3n_Correspondencia'),
unistr('      ,  a.nmro_cntrto as N\00FAmero_Contrato    '),
'      ,  to_char(a.trfa,''fm9990.00'') as Tarifa  ',
'      ,  a.vlor_bse_grvble as Base_Gravable',
'      ,  a.vlor_cptal as Valor_impuesto_Liquidado',
unistr('     -- ,  a.obsrvcion_lqdcion as Observaci\00F3n'),
'  from gi_g_telefono_pre_lqdcion a',
'  join df_s_identificaciones_tipo b on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo',
'  join df_i_periodos c on a.id_prdo = c.id_prdo ',
'  join df_i_impuestos_acto           d on d.id_impsto_acto = a.id_impsto_acto',
'  where estdo = ''PROCESADO'' and id_infrmcion_telefono= :P336_ID_INFRMCION_TLFNO'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.dscrpcion as Periodo',
'      ,a.vgncia as Vigencia',
'      ,(a.prmer_nmbre || '' ''|| a.sgndo_nmbre ||'' ''|| a.prmer_aplldo ||'' ''|| a.sgndo_aplldo) as Nombre_Suscriptor',
unistr('      ,  b.dscrpcion_idntfccion_tpo as Tipo_Identificaci\00F3n'),
unistr('      ,  a.idntfccion as Identificaci\00F3n'),
unistr('      ,  a.email as Correo_Electr\00F3nico'),
unistr('      ,  a.drccion_lnea as Direcci\00F3n_Instalaci\00F3n_L\00EDnea'),
unistr('      ,  a.nmro_lnea_tlfno as N\00FAmero_L\00EDnea_Telef\00F3nica'),
unistr('      ,  a.id_impsto_acto as Destinaci\00F3n'),
'      ,  a.estrato as Estrato_Socioeconomico ',
unistr('      ,  a.drccion_lnea as Direcci\00F3n_Correspondencia'),
unistr('      ,  a.nmro_cntrto as N\00FAmero_Contrato    '),
'      ,  a.trfa as Tarifa',
'      ,  a.vlor_bse_grvble as Base_Gravable',
'      ,  a.vlor_cptal as Valor_impuesto_Liquidado',
'  from gi_g_telefono_pre_lqdcion a',
'  join df_s_identificaciones_tipo b on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo',
'  join df_i_periodos c on a.id_prdo = c.id_prdo ',
'  where estdo = ''PROCESADO'' and id_infrmcion_telefono= :P336_ID_INFRMCION_TLFNO'))
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
,p_plug_header=>unistr('<CENTER><b>INFORMACI\00D3N PROCESADA</b></CENTER>')
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(161538056063206909)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'VROMERO'
,p_internal_uid=>161538056063206909
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161538141428206910)
,p_db_column_name=>'PERIODO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Periodo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161538228025206911)
,p_db_column_name=>'VIGENCIA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161538379879206912)
,p_db_column_name=>'NOMBRE_SUSCRIPTOR'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Nombre Suscriptor'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161538450818206913)
,p_db_column_name=>unistr('TIPO_IDENTIFICACI\00D3N')
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Tipo Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161538575452206914)
,p_db_column_name=>unistr('IDENTIFICACI\00D3N')
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161538618696206915)
,p_db_column_name=>unistr('CORREO_ELECTR\00D3NICO')
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Correo Electr\00F3nico')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161538712244206916)
,p_db_column_name=>unistr('DIRECCI\00D3N_INSTALACI\00D3N_L\00CDNEA')
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Direcci\00F3n Instalaci\00F3n L\00EDnea')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161538887517206917)
,p_db_column_name=>unistr('N\00DAMERO_L\00CDNEA_TELEF\00D3NICA')
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('N\00FAmero L\00EDnea Telef\00F3nica')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161538920179206918)
,p_db_column_name=>unistr('DESTINACI\00D3N')
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Destinaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161539001059206919)
,p_db_column_name=>'ESTRATO_SOCIOECONOMICO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Estrato Socioeconomico'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161539177103206920)
,p_db_column_name=>unistr('DIRECCI\00D3N_CORRESPONDENCIA')
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Direcci\00F3n Correspondencia')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161539266368206921)
,p_db_column_name=>unistr('N\00DAMERO_CONTRATO')
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('N\00FAmero Contrato')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161539385292206922)
,p_db_column_name=>'TARIFA'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Tarifa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161539463932206923)
,p_db_column_name=>'BASE_GRAVABLE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Base Gravable'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161539573775206924)
,p_db_column_name=>'VALOR_IMPUESTO_LIQUIDADO'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Valor Impuesto Liquidado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(162248878324735320)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1622489'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('PERIODO:VIGENCIA:NOMBRE_SUSCRIPTOR:TIPO_IDENTIFICACI\00D3N:IDENTIFICACI\00D3N:CORREO_ELECTR\00D3NICO:DIRECCI\00D3N_INSTALACI\00D3N_L\00CDNEA:N\00DAMERO_L\00CDNEA_TELEF\00D3NICA:DESTINACI\00D3N:ESTRATO_SOCIOECONOMICO:DIRECCI\00D3N_CORRESPONDENCIA:N\00DAMERO_CONTRATO:TARIFA:BASE_GRAVABLE:VALOR_IMPUE')
||'STO_LIQUIDADO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(161153069919815005)
,p_plug_name=>unistr('Informaci\00F3n No Procesada liquidaci\00F3n')
,p_region_template_options=>'#DEFAULT#:margin-top-sm'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.dscrpcion as Periodo',
'      ,a.vgncia as Vigencia',
'      ,(a.prmer_nmbre || '' ''|| a.sgndo_nmbre ||'' ''|| a.prmer_aplldo ||'' ''|| a.sgndo_aplldo) as Nombre_Suscriptor',
unistr('      ,  b.dscrpcion_idntfccion_tpo as Tipo_Identificaci\00F3n'),
unistr('      ,  a.idntfccion as Identificaci\00F3n'),
unistr('      ,  a.email as Correo_Electr\00F3nico'),
unistr('      ,  a.drccion_lnea as Direcci\00F3n_Instalaci\00F3n_L\00EDnea'),
unistr('      ,  a.nmro_lnea_tlfno as N\00FAmero_L\00EDnea_Telef\00F3nica'),
unistr('      ,  d.nmbre_impsto_acto as Destinaci\00F3n'),
'      ,  a.estrato as Estrato_Socioeconomico ',
unistr('      ,  a.drccion_lnea as Direcci\00F3n_Correspondencia'),
unistr('      ,  a.nmro_cntrto as N\00FAmero_Contrato    '),
'      ,  to_char(a.trfa,''fm9990.00'') as Tarifa',
'      ,  a.vlor_bse_grvble as Base_Gravable',
'      ,  a.vlor_cptal as Valor_impuesto_Liquidado',
'      , obsrvcion as Error',
'  from gi_g_telefono_pre_lqdcion a',
'  left join df_s_identificaciones_tipo b on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo',
'  left join df_i_periodos c on a.id_prdo = c.id_prdo ',
'  left join df_i_impuestos_acto           d on a.id_impsto_acto = d.id_impsto_acto',
'  where estdo = ''SIN PROCESAR'' and id_infrmcion_telefono= :P336_ID_INFRMCION_TLFNO'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.dscrpcion as Periodo',
'      ,a.vgncia as Vigencia',
'      ,(a.prmer_nmbre || '' ''|| a.sgndo_nmbre ||'' ''|| a.prmer_aplldo ||'' ''|| a.sgndo_aplldo) as Nombre_Suscriptor',
unistr('      ,  b.dscrpcion_idntfccion_tpo as Tipo_Identificaci\00F3n'),
unistr('      ,  a.idntfccion as Identificaci\00F3n'),
unistr('      ,  a.email as Correo_Electr\00F3nico'),
unistr('      ,  a.drccion_lnea as Direcci\00F3n_Instalaci\00F3n_L\00EDnea'),
unistr('      ,  a.nmro_lnea_tlfno as N\00FAmero_L\00EDnea_Telef\00F3nica'),
unistr('      ,  a.id_impsto_acto as Destinaci\00F3n'),
'      ,  a.estrato as Estrato_Socioeconomico ',
unistr('      ,  a.drccion_lnea as Direcci\00F3n_Correspondencia'),
unistr('      ,  a.nmro_cntrto as N\00FAmero_Contrato    '),
'      ,  a.trfa as Tarifa',
'      ,  a.vlor_bse_grvble as Base_Gravable',
'      ,  a.vlor_cptal as Valor_impuesto_Liquidado',
'      , obsrvcion as Error',
'  from gi_g_telefono_pre_lqdcion a',
'  left join df_s_identificaciones_tipo b on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo',
'  left join df_i_periodos c on a.id_prdo = c.id_prdo ',
'  where estdo = ''SIN PROCESAR'' and id_infrmcion_telefono= :P336_ID_INFRMCION_TLFNO'))
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
,p_plug_header=>unistr('<CENTER><b>ERROR AL PROCESAR INFORMACI\00D3N</b></CENTER>')
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(161215068207810201)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'VROMERO'
,p_internal_uid=>161215068207810201
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161215114505810202)
,p_db_column_name=>'PERIODO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Periodo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161215221815810203)
,p_db_column_name=>'VIGENCIA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161215359194810204)
,p_db_column_name=>'NOMBRE_SUSCRIPTOR'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Nombre Suscriptor'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161215495104810205)
,p_db_column_name=>unistr('TIPO_IDENTIFICACI\00D3N')
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Tipo Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161215544840810206)
,p_db_column_name=>unistr('IDENTIFICACI\00D3N')
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161215688935810207)
,p_db_column_name=>unistr('CORREO_ELECTR\00D3NICO')
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Correo Electr\00F3nico')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161215750561810208)
,p_db_column_name=>unistr('DIRECCI\00D3N_INSTALACI\00D3N_L\00CDNEA')
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Direcci\00F3n Instalaci\00F3n L\00EDnea')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161215890165810209)
,p_db_column_name=>unistr('N\00DAMERO_L\00CDNEA_TELEF\00D3NICA')
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('N\00FAmero L\00EDnea Telef\00F3nica')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161216059979810211)
,p_db_column_name=>'ESTRATO_SOCIOECONOMICO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Estrato Socioeconomico'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161216162310810212)
,p_db_column_name=>unistr('DIRECCI\00D3N_CORRESPONDENCIA')
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Direcci\00F3n Correspondencia')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161216283790810213)
,p_db_column_name=>unistr('N\00DAMERO_CONTRATO')
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('N\00FAmero Contrato')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161216494031810215)
,p_db_column_name=>'BASE_GRAVABLE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Base Gravable'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161216542378810216)
,p_db_column_name=>'VALOR_IMPUESTO_LIQUIDADO'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Valor Impuesto Liquidado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161216648147810217)
,p_db_column_name=>'ERROR'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Error'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161832844085834302)
,p_db_column_name=>unistr('DESTINACI\00D3N')
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>unistr('Destinaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161539681445206925)
,p_db_column_name=>'TARIFA'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Tarifa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(161232363317812315)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1612324'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('PERIODO:VIGENCIA:NOMBRE_SUSCRIPTOR:TIPO_IDENTIFICACI\00D3N:IDENTIFICACI\00D3N:CORREO_ELECTR\00D3NICO:DIRECCI\00D3N_INSTALACI\00D3N_L\00CDNEA:N\00DAMERO_L\00CDNEA_TELEF\00D3NICA:ESTRATO_SOCIOECONOMICO:DIRECCI\00D3N_CORRESPONDENCIA:N\00DAMERO_CONTRATO:BASE_GRAVABLE:VALOR_IMPUESTO_LIQUIDADO:ERROR')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(161319575342355730)
,p_plug_name=>unistr('Informaci\00F3n Procesada Recaudo')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  c.dscrpcion',
'        ,a.vgncia',
'        ,a.prmer_nmbre||'' ''||a.prmer_apllido as Nombre_suscriptor',
unistr('        ,b.dscrpcion_idntfccion_tpo as Tipo_de_Identifici\00F3n'),
unistr('        ,a.idntfccion as identificaci\00F3n '),
unistr('        ,a.email as Correo_Electr\00F3nico'),
unistr('        ,a.id_impsto_acto as Destinaci\00F3n'),
'        ,a.estrato as Estrato  ',
unistr('        ,a.nmro_lnea_tlfno as N\00FAmero_L\00EDnea_Telefonica'),
unistr('        ,a.drccion as Direcci\00F3n_de_Correspondencia'),
unistr('        ,a.nmro_cntrto as N\00FAmero_de_Contrato'),
'        ,to_char(a.trfa,''fm9990.00'') as Tarifa ',
'        ,a.vlor_rcdo as Valor_recaudado',
unistr('        ,a.drccion_instlcion as Direcci\00F3n_de_Instalaci\00F3n'),
'      from gi_g_telefono_recaudo a',
'      join df_s_identificaciones_tipo b on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo',
'      join df_i_periodos c on a.id_prdo = c.id_prdo ',
'  where estdo = ''PROCESADO'' and id_infrmcion_telefono= :P336_ID_INFRMCION_TLFNO'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  c.dscrpcion',
'        ,a.vgncia',
'        ,a.prmer_nmbre||'' ''||a.prmer_apllido as Nombre_suscriptor',
unistr('        ,b.dscrpcion_idntfccion_tpo as Tipo_de_Identifici\00F3n'),
unistr('        ,a.idntfccion as identificaci\00F3n '),
unistr('        ,a.email as Correo_Electr\00F3nico'),
unistr('        ,a.id_impsto_acto as Destinaci\00F3n'),
'        ,a.estrato as Estrato  ',
unistr('        ,a.nmro_lnea_tlfno as N\00FAmero_L\00EDnea_Telefonica'),
unistr('        ,a.drccion as Direcci\00F3n_de_Correspondencia'),
unistr('        ,a.nmro_cntrto as N\00FAmero_de_Contrato'),
'        ,a.trfa as Tarifa ',
'        ,a.vlor_rcdo as Valor_recaudado',
unistr('        ,a.drccion_instlcion as Direcci\00F3n_de_Instalaci\00F3n'),
'      from gi_g_telefono_recaudo a',
'      join df_s_identificaciones_tipo b on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo',
'      join df_i_periodos c on a.id_prdo = c.id_prdo ',
'  where estdo = ''PROCESADO'' and id_infrmcion_telefono= :P336_ID_INFRMCION_TLFNO'))
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
,p_plug_header=>unistr('<CENTER><b>INFORMACI\00D3N PROCESADA</b></CENTER>')
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(161319653295355731)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'VROMERO'
,p_internal_uid=>161319653295355731
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161319764233355732)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161319802721355733)
,p_db_column_name=>'VGNCIA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161319992220355734)
,p_db_column_name=>'NOMBRE_SUSCRIPTOR'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Nombre Suscriptor'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161320060955355735)
,p_db_column_name=>unistr('TIPO_DE_IDENTIFICI\00D3N')
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Tipo De Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161320106038355736)
,p_db_column_name=>unistr('IDENTIFICACI\00D3N')
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161320223096355737)
,p_db_column_name=>unistr('CORREO_ELECTR\00D3NICO')
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Correo Electr\00F3nico')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161320354019355738)
,p_db_column_name=>unistr('DESTINACI\00D3N')
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Destinaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161320419342355739)
,p_db_column_name=>'ESTRATO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Estrato'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161320579346355740)
,p_db_column_name=>unistr('N\00DAMERO_L\00CDNEA_TELEFONICA')
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('N\00FAmero L\00EDnea Telefonica')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161320651880355741)
,p_db_column_name=>unistr('DIRECCI\00D3N_DE_CORRESPONDENCIA')
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Direcci\00F3n De Correspondencia')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161320766192355742)
,p_db_column_name=>unistr('N\00DAMERO_DE_CONTRATO')
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('N\00FAmero De Contrato')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161320948541355744)
,p_db_column_name=>'VALOR_RECAUDADO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Valor Recaudado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161321010473355745)
,p_db_column_name=>unistr('DIRECCI\00D3N_DE_INSTALACI\00D3N')
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>unistr('Direcci\00F3n De Instalaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161539759281206926)
,p_db_column_name=>'TARIFA'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Tarifa'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(161457382033860015)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1614574'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('DSCRPCION:VGNCIA:NOMBRE_SUSCRIPTOR:TIPO_DE_IDENTIFICI\00D3N:IDENTIFICACI\00D3N:CORREO_ELECTR\00D3NICO:DESTINACI\00D3N:ESTRATO:N\00DAMERO_L\00CDNEA_TELEFONICA:DIRECCI\00D3N_DE_CORRESPONDENCIA:N\00DAMERO_DE_CONTRATO:TARIFA:VALOR_RECAUDADO:DIRECCI\00D3N_DE_INSTALACI\00D3N:')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(161541377370206942)
,p_plug_name=>unistr('Informaci\00F3n No Procesada Cartera')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.dscrpcion as Periodo',
'      ,a.vgncia as Vigencia',
'      ,(a.prmer_nmbre || '' ''|| a.sgndo_nmbre ||'' ''|| a.prmer_aplldo ||'' ''|| a.sgndo_aplldo) as Nombre_Suscriptor',
unistr('      ,  b.dscrpcion_idntfccion_tpo as Tipo_Identificaci\00F3n'),
unistr('      ,  a.idntfccion as Identificaci\00F3n'),
unistr('      ,  a.email as Correo_Electr\00F3nico'),
unistr('      ,  a.drccion_lnea as Direcci\00F3n_Instalaci\00F3n_L\00EDnea'),
unistr('      ,  a.nmro_lnea_tlfno as N\00FAmero_L\00EDnea_Telef\00F3nica'),
unistr('      ,  d.nmbre_impsto_acto as Destinaci\00F3n'),
'      ,  a.estrato as Estrato_Socioeconomico ',
unistr('      ,  a.drccion_lnea as Direcci\00F3n_Correspondencia'),
unistr('      ,  a.nmro_cntrto as N\00FAmero_Contrato    '),
'      ,  to_char(a.trfa, ''fm9990.00'') as Tarifa',
'      ,  a.vlor_bse_grvble as Base_Gravable',
unistr('      ,obsrvcion as Observaci\00F3n'),
'  from gi_g_telefono_cartera a',
' left join df_s_identificaciones_tipo b on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo',
' left join df_i_periodos c on a.id_prdo = c.id_prdo ',
' left join df_i_impuestos_acto           d on d.id_impsto_acto = a.id_impsto_acto',
'  where estdo = ''SIN PROCESAR'' and id_infrmcion_telefono= :P336_ID_INFRMCION_TLFNO'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.dscrpcion as Periodo',
'      ,a.vgncia as Vigencia',
'      ,(a.prmer_nmbre || '' ''|| a.sgndo_nmbre ||'' ''|| a.prmer_aplldo ||'' ''|| a.sgndo_aplldo) as Nombre_Suscriptor',
unistr('      ,  b.dscrpcion_idntfccion_tpo as Tipo_Identificaci\00F3n'),
unistr('      ,  a.idntfccion as Identificaci\00F3n'),
unistr('      ,  a.email as Correo_Electr\00F3nico'),
unistr('      ,  a.drccion_lnea as Direcci\00F3n_Instalaci\00F3n_L\00EDnea'),
unistr('      ,  a.nmro_lnea_tlfno as N\00FAmero_L\00EDnea_Telef\00F3nica'),
unistr('      ,  d.nmbre_impsto_acto as Destinaci\00F3n'),
'      ,  a.estrato as Estrato_Socioeconomico ',
unistr('      ,  a.drccion_lnea as Direcci\00F3n_Correspondencia'),
unistr('      ,  a.nmro_cntrto as N\00FAmero_Contrato    '),
'      ,  to_char(a.trfa, ''fm9990.00'') as Tarifa',
'      ,  a.vlor_bse_grvble as Base_Gravable',
'  from gi_g_telefono_cartera a',
'  left join df_s_identificaciones_tipo b on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo',
'  left join df_i_periodos c on a.id_prdo = c.id_prdo ',
'  left join df_i_impuestos_acto           d on d.id_impsto_acto = a.id_impsto_acto',
'  where estdo = ''SIN PROCESAR'' and id_infrmcion_telefono= :P336_ID_INFRMCION_TLFNO'))
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
,p_plug_header=>unistr('<CENTER><b>INFORMACI\00D3N NO PROCESADA</b></CENTER>')
);
end;
/
begin
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(161541442455206943)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'VROMERO'
,p_internal_uid=>161541442455206943
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161541545162206944)
,p_db_column_name=>'NOMBRE_SUSCRIPTOR'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Nombre Suscriptor'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161541688450206945)
,p_db_column_name=>unistr('IDENTIFICACI\00D3N')
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161541742017206946)
,p_db_column_name=>unistr('CORREO_ELECTR\00D3NICO')
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Correo Electr\00F3nico')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161541806219206947)
,p_db_column_name=>'PERIODO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Periodo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161541980943206948)
,p_db_column_name=>'VIGENCIA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161542022789206949)
,p_db_column_name=>unistr('TIPO_IDENTIFICACI\00D3N')
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Tipo Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161542165996206950)
,p_db_column_name=>unistr('DIRECCI\00D3N_INSTALACI\00D3N_L\00CDNEA')
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Direcci\00F3n Instalaci\00F3n L\00EDnea')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162374020136717001)
,p_db_column_name=>unistr('N\00DAMERO_L\00CDNEA_TELEF\00D3NICA')
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('N\00FAmero L\00EDnea Telef\00F3nica')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162374138391717002)
,p_db_column_name=>unistr('DESTINACI\00D3N')
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Destinaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162374206520717003)
,p_db_column_name=>'ESTRATO_SOCIOECONOMICO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Estrato Socioeconomico'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162374374965717004)
,p_db_column_name=>unistr('DIRECCI\00D3N_CORRESPONDENCIA')
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Direcci\00F3n Correspondencia')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162374487165717005)
,p_db_column_name=>unistr('N\00DAMERO_CONTRATO')
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('N\00FAmero Contrato')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162374507395717006)
,p_db_column_name=>'BASE_GRAVABLE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Base Gravable'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162374688952717007)
,p_db_column_name=>'TARIFA'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Tarifa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162676886135580402)
,p_db_column_name=>unistr('OBSERVACI\00D3N')
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(162683063681617500)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1626831'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('NOMBRE_SUSCRIPTOR:IDENTIFICACI\00D3N:CORREO_ELECTR\00D3NICO:PERIODO:VIGENCIA:TIPO_IDENTIFICACI\00D3N:DIRECCI\00D3N_INSTALACI\00D3N_L\00CDNEA:N\00DAMERO_L\00CDNEA_TELEF\00D3NICA:DESTINACI\00D3N:ESTRATO_SOCIOECONOMICO:DIRECCI\00D3N_CORRESPONDENCIA:N\00DAMERO_CONTRATO:TARIFA:OBSERVACI\00D3N:')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(161832935476834303)
,p_plug_name=>unistr('Informaci\00F3n No Procesada Recaudo')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  c.dscrpcion',
'        ,a.vgncia',
'        ,a.prmer_nmbre||'' ''||a.prmer_apllido as Nombre_suscriptor',
unistr('        ,b.dscrpcion_idntfccion_tpo as Tipo_de_Identifici\00F3n'),
unistr('        ,a.idntfccion as identificaci\00F3n '),
unistr('        ,a.email as Correo_Electr\00F3nico'),
unistr('        ,a.id_impsto_acto as Destinaci\00F3n'),
'        ,a.estrato as Estrato  ',
unistr('        ,a.nmro_lnea_tlfno as N\00FAmero_L\00EDnea_Telefonica'),
unistr('        ,a.drccion as Direcci\00F3n_de_Correspondencia'),
unistr('        ,a.nmro_cntrto as N\00FAmero_de_Contrato'),
'        ,to_char(a.trfa,''fm9990.00'') as Tarifa ',
'        ,a.vlor_rcdo as Valor_recaudado',
unistr('        ,a.drccion_instlcion as Direcci\00F3n_de_Instalaci\00F3n'),
unistr('        ,a.obsrvcion as Observaci\00F3n'),
'      from gi_g_telefono_recaudo a',
'     left  join df_s_identificaciones_tipo b on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo',
'     left  join df_i_periodos c on a.id_prdo = c.id_prdo ',
'  where estdo = ''SIN PROCESAR'' and id_infrmcion_telefono= :P336_ID_INFRMCION_TLFNO'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  c.dscrpcion',
'        ,a.vgncia',
'        ,a.prmer_nmbre||'' ''||a.prmer_apllido as Nombre_suscriptor',
unistr('        ,b.dscrpcion_idntfccion_tpo as Tipo_de_Identifici\00F3n'),
unistr('        ,a.idntfccion as identificaci\00F3n '),
unistr('        ,a.email as Correo_Electr\00F3nico'),
unistr('        ,a.id_impsto_acto as Destinaci\00F3n'),
'        ,a.estrato as Estrato  ',
unistr('        ,a.nmro_lnea_tlfno as N\00FAmero_L\00EDnea_Telefonica'),
unistr('        ,a.drccion as Direcci\00F3n_de_Correspondencia'),
unistr('        ,a.nmro_cntrto as N\00FAmero_de_Contrato'),
'        ,a.trfa as Tarifa ',
'        ,a.vlor_rcdo as Valor_recaudado',
unistr('        ,a.drccion_instlcion as Direcci\00F3n_de_Instalaci\00F3n'),
unistr('        ,obsrvcion as Observaci\00F3n'),
'      from gi_g_telefono_recaudo a',
'     left join df_s_identificaciones_tipo b on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo',
'     left join df_i_periodos c on a.id_prdo = c.id_prdo ',
'  where estdo = ''SIN PROCESAR'' and id_infrmcion_telefono= :P336_ID_INFRMCION_TLFNO'))
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
,p_plug_header=>unistr('<CENTER><b>INFORMACI\00D3N NO PROCESADA</b></CENTER>')
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(161833031407834304)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'VROMERO'
,p_internal_uid=>161833031407834304
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161833157563834305)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161833293519834306)
,p_db_column_name=>'VGNCIA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161833368346834307)
,p_db_column_name=>'NOMBRE_SUSCRIPTOR'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Nombre Suscriptor'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161833473348834308)
,p_db_column_name=>unistr('TIPO_DE_IDENTIFICI\00D3N')
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Tipo De Identifici\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161833557178834309)
,p_db_column_name=>unistr('IDENTIFICACI\00D3N')
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161833669406834310)
,p_db_column_name=>unistr('CORREO_ELECTR\00D3NICO')
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Correo Electr\00F3nico')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161833727915834311)
,p_db_column_name=>unistr('DESTINACI\00D3N')
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Destinaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161833825835834312)
,p_db_column_name=>'ESTRATO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Estrato'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161833901227834313)
,p_db_column_name=>unistr('N\00DAMERO_L\00CDNEA_TELEFONICA')
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('N\00FAmero L\00EDnea Telefonica')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161834077786834314)
,p_db_column_name=>unistr('DIRECCI\00D3N_DE_CORRESPONDENCIA')
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Direcci\00F3n De Correspondencia')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161834118292834315)
,p_db_column_name=>unistr('N\00DAMERO_DE_CONTRATO')
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('N\00FAmero De Contrato')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161834340708834317)
,p_db_column_name=>'VALOR_RECAUDADO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Valor Recaudado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161834404208834318)
,p_db_column_name=>unistr('DIRECCI\00D3N_DE_INSTALACI\00D3N')
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>unistr('Direcci\00F3n De Instalaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161539845159206927)
,p_db_column_name=>'TARIFA'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Tarifa'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162676795296580401)
,p_db_column_name=>unistr('OBSERVACI\00D3N')
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(162674804353542461)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1626749'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('DSCRPCION:VGNCIA:NOMBRE_SUSCRIPTOR:TIPO_DE_IDENTIFICI\00D3N:IDENTIFICACI\00D3N:CORREO_ELECTR\00D3NICO:DESTINACI\00D3N:ESTRATO:N\00DAMERO_L\00CDNEA_TELEFONICA:DIRECCI\00D3N_DE_CORRESPONDENCIA:N\00DAMERO_DE_CONTRATO:VALOR_RECAUDADO:DIRECCI\00D3N_DE_INSTALACI\00D3N:TARIFA:OBSERVACI\00D3N')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(161836186984834335)
,p_plug_name=>unistr('Informaci\00F3n Procesada Cartera')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.dscrpcion as Periodo',
'      ,a.vgncia as Vigencia',
'      ,(a.prmer_nmbre || '' ''|| a.sgndo_nmbre ||'' ''|| a.prmer_aplldo ||'' ''|| a.sgndo_aplldo) as Nombre_Suscriptor',
unistr('      ,  b.dscrpcion_idntfccion_tpo as Tipo_Identificaci\00F3n'),
unistr('      ,  a.idntfccion as Identificaci\00F3n'),
unistr('      ,  a.email as Correo_Electr\00F3nico'),
unistr('      ,  a.drccion_lnea as Direcci\00F3n_Instalaci\00F3n_L\00EDnea'),
unistr('      ,  a.nmro_lnea_tlfno as N\00FAmero_L\00EDnea_Telef\00F3nica'),
unistr('      ,  d.nmbre_impsto_acto as Destinaci\00F3n'),
'      ,  a.estrato as Estrato_Socioeconomico ',
unistr('      ,  a.drccion_lnea as Direcci\00F3n_Correspondencia'),
unistr('      ,  a.nmro_cntrto as N\00FAmero_Contrato    '),
'      ,  to_char(a.trfa, ''fm9990.00'') as Tarifa',
'     -- ,  a.vlor_bse_grvble as Base_Gravable',
'  from gi_g_telefono_cartera a',
'  join df_s_identificaciones_tipo b on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo',
'  join df_i_periodos c on a.id_prdo = c.id_prdo ',
'  join df_i_impuestos_acto           d on d.id_impsto_acto = a.id_impsto_acto',
'  where estdo = ''PROCESADO'' and id_infrmcion_telefono= :P336_ID_INFRMCION_TLFNO'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.dscrpcion as Periodo',
'      ,a.vgncia as Vigencia',
'      ,(a.prmer_nmbre || '' ''|| a.sgndo_nmbre ||'' ''|| a.prmer_aplldo ||'' ''|| a.sgndo_aplldo) as Nombre_Suscriptor',
unistr('      ,  b.dscrpcion_idntfccion_tpo as Tipo_Identificaci\00F3n'),
unistr('      ,  a.idntfccion as Identificaci\00F3n'),
unistr('      ,  a.email as Correo_Electr\00F3nico'),
unistr('      ,  a.drccion_lnea as Direcci\00F3n_Instalaci\00F3n_L\00EDnea'),
unistr('      ,  a.nmro_lnea_tlfno as N\00FAmero_L\00EDnea_Telef\00F3nica'),
unistr('      ,  d.nmbre_impsto_acto as Destinaci\00F3n'),
'      ,  a.estrato as Estrato_Socioeconomico ',
unistr('      ,  a.drccion_lnea as Direcci\00F3n_Correspondencia'),
unistr('      ,  a.nmro_cntrto as N\00FAmero_Contrato    '),
'      ,  a.trfa as Tarifa',
'      ,  a.vlor_bse_grvble as Base_Gravable',
'  from gi_g_telefono_cartera a',
'  join df_s_identificaciones_tipo b on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo',
'  join df_i_periodos c on a.id_prdo = c.id_prdo ',
'  join df_i_impuestos_acto           d on d.id_impsto_acto = a.id_impsto_acto',
'  where estdo = ''PROCESADO'' and id_infrmcion_telefono= :P336_ID_INFRMCION_TLFNO'))
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
,p_plug_header=>unistr('<CENTER><b>INFORMACI\00D3N PROCESADA</b></CENTER>')
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(161836220415834336)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'VROMERO'
,p_internal_uid=>161836220415834336
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161836504565834339)
,p_db_column_name=>'NOMBRE_SUSCRIPTOR'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Nombre Suscriptor'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161836793777834341)
,p_db_column_name=>unistr('IDENTIFICACI\00D3N')
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161836811349834342)
,p_db_column_name=>unistr('CORREO_ELECTR\00D3NICO')
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Correo Electr\00F3nico')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161862734687976401)
,p_db_column_name=>'PERIODO'
,p_display_order=>130
,p_column_identifier=>'O'
,p_column_label=>'Periodo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161862801055976402)
,p_db_column_name=>'VIGENCIA'
,p_display_order=>140
,p_column_identifier=>'P'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161862928988976403)
,p_db_column_name=>unistr('TIPO_IDENTIFICACI\00D3N')
,p_display_order=>150
,p_column_identifier=>'Q'
,p_column_label=>unistr('Tipo Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161863055311976404)
,p_db_column_name=>unistr('DIRECCI\00D3N_INSTALACI\00D3N_L\00CDNEA')
,p_display_order=>160
,p_column_identifier=>'R'
,p_column_label=>unistr('Direcci\00F3n Instalaci\00F3n L\00EDnea')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161863199968976405)
,p_db_column_name=>unistr('N\00DAMERO_L\00CDNEA_TELEF\00D3NICA')
,p_display_order=>170
,p_column_identifier=>'S'
,p_column_label=>unistr('N\00FAmero L\00EDnea Telef\00F3nica')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161863215716976406)
,p_db_column_name=>unistr('DESTINACI\00D3N')
,p_display_order=>180
,p_column_identifier=>'T'
,p_column_label=>unistr('Destinaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161863312828976407)
,p_db_column_name=>'ESTRATO_SOCIOECONOMICO'
,p_display_order=>190
,p_column_identifier=>'U'
,p_column_label=>'Estrato Socioeconomico'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161863498157976408)
,p_db_column_name=>unistr('DIRECCI\00D3N_CORRESPONDENCIA')
,p_display_order=>200
,p_column_identifier=>'V'
,p_column_label=>unistr('Direcci\00F3n Correspondencia')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161863547252976409)
,p_db_column_name=>unistr('N\00DAMERO_CONTRATO')
,p_display_order=>210
,p_column_identifier=>'W'
,p_column_label=>unistr('N\00FAmero Contrato')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161539916181206928)
,p_db_column_name=>'TARIFA'
,p_display_order=>230
,p_column_identifier=>'Y'
,p_column_label=>'Tarifa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(161874318186979150)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1618744'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('NOMBRE_SUSCRIPTOR:IDENTIFICACI\00D3N:CORREO_ELECTR\00D3NICO:PERIODO:VIGENCIA:TIPO_IDENTIFICACI\00D3N:DIRECCI\00D3N_INSTALACI\00D3N_L\00CDNEA:N\00DAMERO_L\00CDNEA_TELEF\00D3NICA:DESTINACI\00D3N:ESTRATO_SOCIOECONOMICO:DIRECCI\00D3N_CORRESPONDENCIA:N\00DAMERO_CONTRATO:TARIFA')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(161152727304815002)
,p_name=>'P336_ID_INFRMCION_TLFNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(161152865063815003)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(161156741908815042)
,p_name=>'P336_ID_IMPUESTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(161152865063815003)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(161318374073355718)
,p_name=>'P336_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(161152865063815003)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
