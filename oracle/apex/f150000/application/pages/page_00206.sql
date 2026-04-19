prompt --application/pages/page_00206
begin
wwv_flow_api.create_page(
 p_id=>206
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Detalle de Liquidaci\00F3n de Rentas Varias - Consulta')
,p_step_title=>unistr('Detalle de Liquidaci\00F3n de Rentas Varias - Consulta')
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer {',
'    display: none;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250709170644'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15954138761867365)
,p_plug_name=>'Tab Selector'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4255463629589332)
,p_plug_name=>'Liquidaciones Anteriores'
,p_parent_plug_id=>wwv_flow_api.id(15954138761867365)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1 ver',
'        , a.nmro_rnta',
'        , trunc(a.fcha_rgstro) fcha_rgstro',
'        , a.dscrpcion_ascda || '': '' || a.txto_ascda ascda',
'        , a.vlor_bse_grvble',
'        , a.fcha_expdcion',
'        , case ',
'            when a.id_rnta_antrior is not null then',
unistr('                ''S\00ED'''),
'            else',
'                ''No''',
'            end as indcdor_lqdcion_antrior',
'        , b.vlor_ttal',
'     from v_gi_g_rentas                 a',
'     join ( select a.id_rnta',
'                 , sum(d.vlor_dbe - d.vlor_hber) vlor_ttal',
'              from v_gi_g_rentas                 a',
'              join gi_g_liquidaciones            b on a.id_lqdcion       = b.id_lqdcion',
'              join gf_g_movimientos_financiero   c on b.id_lqdcion       = c.id_orgen',
'               and c.cdgo_mvnt_fncro_estdo       = ''NO''',
'              join gf_g_movimientos_detalle      d on c.id_mvmnto_fncro  = d.id_mvmnto_fncro',
'               and d.cdgo_mvmnto_tpo             not in (''PC'', ''PI'')',
'          group by a.id_rnta  )                  b on a.id_rnta     = b.id_rnta',
'    where (a.id_rnta                             = :P206_ID_RNTA_ANTRIOR    ',
'       or a.id_rnta_antrior                      = :P206_ID_RNTA_ANTRIOR)',
'      and a.cdgo_rnta_estdo                      in (''APB'', ''LQD'')',
'       and a.id_rnta                             != :P206_ID_RNTA',
' order by a.id_lqdcion'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P206_ID_RNTA_ANTRIOR'
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
 p_id=>wwv_flow_api.id(4255564810589333)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>4255564810589333
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4256625773589344)
,p_db_column_name=>'NMRO_RNTA'
,p_display_order=>10
,p_column_identifier=>'I'
,p_column_label=>unistr('N\00B0 Liquidaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4255887704589336)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Fecha de Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4255970891589337)
,p_db_column_name=>'ASCDA'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Asociada'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4256078816589338)
,p_db_column_name=>'VLOR_BSE_GRVBLE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Base Gravable'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4256129822589339)
,p_db_column_name=>'FCHA_EXPDCION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Fecha de Expedici\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4256242581589340)
,p_db_column_name=>'INDCDOR_LQDCION_ANTRIOR'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('\00BFLiquidaci\00F3n Adicional?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4256364448589341)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Valor Pagado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4255652963589334)
,p_db_column_name=>'VER'
,p_display_order=>90
,p_column_identifier=>'A'
,p_column_label=>'Ver'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(4599379872662612)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'45994'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VER:FCHA_RGSTRO:ASCDA:VLOR_BSE_GRVBLE:FCHA_EXPDCION:INDCDOR_LQDCION_ANTRIOR:VLOR_TTAL:NMRO_RNTA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15953575756867359)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(15954138761867365)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select id_rnta_adjnto',
'        , id_sbmpto_adjnto_tpo',
'        , file_name',
'        , obsrvcion',
'        , 1 descargar',
'        , 2 ver',
'     from gi_g_rentas_adjnto     a',
'    where id_rnta                = :P206_ID_RNTA'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from gi_g_rentas_adjnto     a',
'    where id_rnta                = :P206_ID_RNTA'))
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
 p_id=>wwv_flow_api.id(15953673425867360)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>15953673425867360
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5497056668613717)
,p_db_column_name=>'ID_RNTA_ADJNTO'
,p_display_order=>10
,p_column_identifier=>'D'
,p_column_label=>'Id Rnta Adjnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84590867555122409)
,p_db_column_name=>'ID_SBMPTO_ADJNTO_TPO'
,p_display_order=>20
,p_column_identifier=>'E'
,p_column_label=>'Tipo de Adjunto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(84647677146850578)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5497474672613722)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5497884857613722)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84590903092122410)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'DOWNLOAD:GI_G_RENTAS_ADJNTO:FILE_BLOB:ID_RNTA_ADJNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86380355495043113)
,p_db_column_name=>'VER'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Ver'
,p_column_link=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:RP:P18_NOMBRE_TABLA,P18_COLUMNA_CLAVE_PRIMARIA,P18_COLUMNA_FILENAME,P18_COLUMNA_BLOB,P18_COLUMNA_MIME,P18_VALOR:GI_G_RENTAS_ADJNTO,ID_RNTA_ADJNTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,#ID_RNTA_ADJNTO#'
,p_column_linktext=>'<center><span class=" fa fa-eye fa-1x fa-spin"></span></center>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(15980320437397414)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'54982'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'ID_SBMPTO_ADJNTO_TPO:FILE_NAME:OBSRVCION::DESCARGAR:VER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15954310666867366)
,p_plug_name=>'Conceptos'
,p_parent_plug_id=>wwv_flow_api.id(15954138761867365)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''['' || d.cdgo_cncpto || ''] '' || d.dscrpcion_cncpto dscrpcion_cncpto',
'        , a.vlor_lqddo',
'        , a.vlor_intres',
'        , a.vlor_lqddo + a.vlor_intres vlor_ttal',
'        , a.fcha_vncmnto',
'        , a.txto_trfa',
'     from gi_g_rentas_acto_concepto         a',
'     join gi_g_rentas_acto                  b on a.id_rnta_acto     = b.id_rnta_acto',
'     join gi_g_rentas                       c on b.id_rnta          = c.id_rnta',
'     join v_df_i_impuestos_acto_concepto    d on a.id_impsto_acto_cncpto    = d.id_impsto_acto_cncpto',
'    where c.id_rnta                         = :P206_ID_RNTA;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10757721349511330)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Interes'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(15954701565867370)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>106
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(15954833468867372)
,p_name=>'VLOR_LQDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_LQDDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br>Liquidado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(15955069539867374)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br>Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(15955179638867375)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de<br> Vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_display_condition_type=>'SQL_EXPRESSION'
,p_display_condition=>':DIAS_MORA > 0'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(15955401401867377)
,p_name=>'TXTO_TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_TRFA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tarifa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>20
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(15954528536867368)
,p_internal_uid=>15954528536867368
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(15994654216482735)
,p_interactive_grid_id=>wwv_flow_api.id(15954528536867368)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(15994802568482735)
,p_report_id=>wwv_flow_api.id(15994654216482735)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10867265383538653)
,p_view_id=>wwv_flow_api.id(15994802568482735)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(10757721349511330)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15995743696482749)
,p_view_id=>wwv_flow_api.id(15994802568482735)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(15954701565867370)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>432
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15996799505482753)
,p_view_id=>wwv_flow_api.id(15994802568482735)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(15954833468867372)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15997815893482756)
,p_view_id=>wwv_flow_api.id(15994802568482735)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(15955069539867374)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15998287621482758)
,p_view_id=>wwv_flow_api.id(15994802568482735)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(15955179638867375)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15999315856482761)
,p_view_id=>wwv_flow_api.id(15994802568482735)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(15955401401867377)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(126067000003)
,p_view_id=>wwv_flow_api.id(15994802568482735)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(15955069539867374)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(157048000005)
,p_view_id=>wwv_flow_api.id(15994802568482735)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(15954833468867372)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(289004000005)
,p_view_id=>wwv_flow_api.id(15994802568482735)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(10757721349511330)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(82279895412687203)
,p_plug_name=>'Exenciones'
,p_parent_plug_id=>wwv_flow_api.id(15954138761867365)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P206_INDCDOR_EXNCION'
,p_plug_display_when_cond2=>'S'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(82280992524687214)
,p_plug_name=>'<b>Motivos</b>'
,p_parent_plug_id=>wwv_flow_api.id(82279895412687203)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'V_GF_G_EXENCIONES_SLCTUD_MTVO'
,p_query_where=>'ID_EXNCION_SLCTUD = :P206_ID_EXNCION_SLCTUD'
,p_query_order_by=>'MTVO'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P206_CDGO_EXNCION_ESTDO'
,p_plug_display_when_cond2=>'APB'
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
 p_id=>wwv_flow_api.id(82282333531687228)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'JPRADA'
,p_internal_uid=>82282333531687228
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82282464915687229)
,p_db_column_name=>'ID_EXNCION_SLCTUD_MTVO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Exncion Slctud Mtvo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82282640304687231)
,p_db_column_name=>'ID_EXNCION_MTVO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Exncion Mtvo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82282734452687232)
,p_db_column_name=>'NMTCNCO_MTVO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('C\00F3digo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82282834553687233)
,p_db_column_name=>'MTVO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Motivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82282932076687234)
,p_db_column_name=>'ID_DCRTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Id Dcrto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82283039103687235)
,p_db_column_name=>'NMRO_DCRTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Nmro Dcrto'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82283155225687236)
,p_db_column_name=>'DSCRPCION_DCRTO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Decreto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82283205696687237)
,p_db_column_name=>'NMTCNCO_DCRTO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Exenci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(82331254478208920)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'823313'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_EXNCION_SLCTUD_MTVO:ID_EXNCION_MTVO:NMTCNCO_MTVO:MTVO:ID_DCRTO:NMRO_DCRTO:DSCRPCION_DCRTO:NMTCNCO_DCRTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(82281049980687215)
,p_plug_name=>'<b>Conceptos</b>'
,p_parent_plug_id=>wwv_flow_api.id(82279895412687203)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.dscrpcion_cncpto ',
'        , a.vlor_cncpto',
'        , a.prcntje_exncion',
'        , a.vlor_exnto',
'        , a.vlor_cncpto - a.vlor_exnto vlor_ttal',
'     from v_gf_g_exncnes_slctud_dtlle   a',
'    where id_exncion_slctud             = :P206_ID_EXNCION_SLCTUD;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P206_CDGO_EXNCION_ESTDO'
,p_plug_display_when_cond2=>'APB'
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
 p_id=>wwv_flow_api.id(82283407134687239)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'JPRADA'
,p_internal_uid=>82283407134687239
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82283562809687240)
,p_db_column_name=>'DSCRPCION_CNCPTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82283651961687241)
,p_db_column_name=>'VLOR_CNCPTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Valor concepto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82283746472687242)
,p_db_column_name=>'PRCNTJE_EXNCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('% Exenci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82283842451687243)
,p_db_column_name=>'VLOR_EXNTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Valor Exento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82283931389687244)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Valor a Pagar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(82334171435227347)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'823342'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'DSCRPCION_CNCPTO:VLOR_CNCPTO:PRCNTJE_EXNCION:VLOR_EXNTO:VLOR_TTAL:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89847446363243435)
,p_plug_name=>unistr('<b> Liquidaci\00F3n N\00B0 &P206_NMRO_RNTA. [&P206_DSCRPCION_RNTA_ESTDO.]</b>')
,p_region_name=>'informacion_basica'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--noPadding:t-Form--large'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4254994151589327)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(82279895412687203)
,p_button_name=>'BTN_IMPRIMIR_BONO_EXENCION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(252201877336651464)
,p_button_image_alt=>'Btn Imprimir Bono Exencion'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P206_INDCDOR_EXNCION = ''S''',
'and :P206_CDGO_EXNCION_ESTDO = ''APB''',
'and :P206_INDCDOR_PAGO_APLCDO = ''S'''))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5502230017613749)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(89847446363243435)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:205:&SESSION.::&DEBUG.:RP,206::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(78953452751533314)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(89847446363243435)
,p_button_name=>'BTN_IMPRIMIR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Imprimir Liquidaci\00F3n')
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P206_CDGO_RNTA_ESTDO in (''APB'',''LQD'') ',
'and :P206_FCHA_APBCION is not null ',
'and :P206_ID_DCMNTO is not null',
'and :P206_INDCDOR_RNTA_PGADA = ''N'''))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-download'
,p_grid_new_grid=>false
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4254327732589321)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(89847446363243435)
,p_button_name=>'BTN_IMPRIMIR_BONO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Imprimir Bono'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P206_CDGO_RNTA_ESTDO in (''APB'',''LQD'') ',
'and :P206_FCHA_APBCION is not null ',
'and :P206_ID_DCMNTO is not null',
'and :P206_INDCDOR_RNTA_PGADA = ''S'''))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-download'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4253727302589315)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(89847446363243435)
,p_button_name=>'BTN_IMPRIMIR_DCMNTO_EXNCION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>unistr('Imprimir Recibo Exenci\00F3n')
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P206_INDCDOR_EXNCION = ''S''',
'and :P206_CDGO_EXNCION_ESTDO = ''APB''',
'and :P206_INDCDOR_PAGO_APLCDO = ''N'''))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-download'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4253530655589313)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(89847446363243435)
,p_button_name=>'BTN_ACTO_CERTIFICADO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>unistr('Ver Certificado de Exenci\00F3n')
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:RP:P18_NOMBRE_TABLA,P18_COLUMNA_CLAVE_PRIMARIA,P18_COLUMNA_FILENAME,P18_COLUMNA_BLOB,P18_COLUMNA_MIME,P18_VALOR:V_GN_G_ACTOS,ID_ACTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,&P206_ID_ACTO_EXNCION.'
,p_button_condition=>'P206_INDCDOR_PAGO_APLCDO'
,p_button_condition2=>'S'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4253687974589314)
,p_name=>'P206_ID_ACTO_EXNCION'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4254658174589324)
,p_name=>'P206_INDCDOR_RNTA_PGADA'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4255294054589330)
,p_name=>'P206_INDCDOR_CNTRTO_GSLNA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_prompt=>unistr('\00BFContrato de Gasolina? ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(252387114161917710)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4255398052589331)
,p_name=>'P206_INDCDOR_LQDCION_ADCNAL'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_prompt=>unistr('\00BFLiquidaci\00F3n Adicional?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(252387114161917710)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4256452182589342)
,p_name=>'P206_ID_RNTA_ANTRIOR'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5502623811613751)
,p_name=>'P206_IDNTFCCION_SJTO_FRMTDA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5503012715613756)
,p_name=>'P206_UBCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5503449217613756)
,p_name=>'P206_DRCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5503865442613757)
,p_name=>'P206_NMBRE_RZON_SCIAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_prompt=>unistr('Nombre / Raz\00F3n Social')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5504243011613757)
,p_name=>'P206_CDGO_SJTO_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5504626127613757)
,p_name=>'P206_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''['' || id_impsto_sbmpsto || '']'' || nmbre_impsto_sbmpsto          d ',
'        , id_impsto_sbmpsto             r       ',
'     from df_i_impuestos_subimpuesto    a',
'    where cdgo_clnte                    = :F_CDGO_CLNTE',
' order by nmbre_impsto_sbmpsto'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5505051529613759)
,p_name=>'P206_ID_IMPSTO_ACTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_prompt=>'Acto'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''['' || id_impsto_acto || '']'' || nmbre_impsto_acto      d',
'        , id_impsto_acto         r',
'     from df_i_impuestos_acto    a',
' order by nmbre_impsto_acto',
'   '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P206_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5505457431613759)
,p_name=>'P206_FCHA_EXPDCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_prompt=>unistr('Fecha de Expedici\00F3n')
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5505806475613760)
,p_name=>'P206_BSE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_prompt=>'Base Gravable'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5506216984613760)
,p_name=>'P206_INDCDOR_EXTRNJRO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_prompt=>unistr('\00BFExtranjero?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(252387114161917710)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5506674757613760)
,p_name=>'P206_INDCDOR_MXTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_prompt=>unistr('\00BFMixto?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(252387114161917710)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5507057031613761)
,p_name=>'P206_ID_RPRTE'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5507404038613761)
,p_name=>'P206_RSPSTA'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5507892857613761)
,p_name=>'P206_ID_RNTA'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5508639670613761)
,p_name=>'P206_ID_LQDCION'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5509073269613762)
,p_name=>'P206_ID_DCMNTO'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5509415423613762)
,p_name=>'P206_NMRO_DCMNTO'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5617415095742837)
,p_name=>'P206_DSCRPCION_RNTA_ESTDO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5617505215742838)
,p_name=>'P206_FCHA_APBCION'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_prompt=>unistr('Fecha de Aprobaci\00F3n')
,p_format_mask=>'DD/MM/YYYY HH:MI:SS AM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>':P206_CDGO_RNTA_ESTDO in (''APB'',''LQD'') and :P206_FCHA_APBCION is not null'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5617675674742839)
,p_name=>'P206_FCHA_RCHZO'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_prompt=>'Fecha de Rechazo'
,p_format_mask=>'DD/MM/YYYY HH:MI:SS AM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_display_when=>'P206_CDGO_RNTA_ESTDO'
,p_display_when2=>'RCH'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5617787765742840)
,p_name=>'P206_OBSRVCION_RCHZO'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_prompt=>unistr('Observac\00F3n de Rechazo')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P206_CDGO_RNTA_ESTDO'
,p_display_when2=>'RCH'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5617863511742841)
,p_name=>'P206_FCHA_RGSTRO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_prompt=>unistr('Fecha de Liquidaci\00F3n')
,p_format_mask=>'DD/MM/YYYY HH:MI:SS AM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5617951939742842)
,p_name=>'P206_CDGO_RNTA_ESTDO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79655285848676122)
,p_name=>'P206_NMRO_RNTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_source=>'P206_NMRO_RNTA'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82279725021687202)
,p_name=>'P206_INDCDOR_EXNCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_prompt=>unistr('\00BFSolicito Exenci\00F3n?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(252387114161917710)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82279985007687204)
,p_name=>'P206_ID_DCMNTO_EXNCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(82279895412687203)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82280221850687207)
,p_name=>'P206_FCHA_RGSTRO_EXNCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(82279895412687203)
,p_prompt=>'Fecha de registro'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82280381586687208)
,p_name=>'P206_USRIO_RGSTRA_EXNCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(82279895412687203)
,p_prompt=>'Usuario que registra'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_USUARIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro || ''['' || user_name || '']''  as d,',
'       id_usrio as r',
'  from v_sg_g_usuarios',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82280461023687209)
,p_name=>'P206_CDGO_EXNCION_ESTDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(82279895412687203)
,p_prompt=>unistr('Estado Exenci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_EXENCIONES_ESTADO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_exncion_estdo as r',
'  from gf_d_exenciones_estado',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82280544269687210)
,p_name=>'P206_FCHA_RSPSTA_EXNCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(82279895412687203)
,p_prompt=>'Fecha de respuesta'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_display_when=>'P206_CDGO_EXNCION_ESTDO'
,p_display_when2=>'APB'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82280633238687211)
,p_name=>'P206_NMRO_DCMNTO_EXNCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(82279895412687203)
,p_prompt=>unistr('N\00B0 Documento de Pago de Exenci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when=>'P206_CDGO_EXNCION_ESTDO'
,p_display_when2=>'APB'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82280781977687212)
,p_name=>'P206_INDCDOR_PAGO_APLCDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(82279895412687203)
,p_prompt=>unistr('\00BFDocumento Exenci\00F3n pagado?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(252387114161917710)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P206_CDGO_EXNCION_ESTDO'
,p_display_when2=>'APB'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82280830974687213)
,p_name=>'P206_OBSRVCION_RCHZO_EXNCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(82279895412687203)
,p_prompt=>unistr('Observaci\00F3n del rechazo')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P206_CDGO_EXNCION_ESTDO'
,p_display_when2=>'RCH'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82284065111687245)
,p_name=>'P206_ID_EXNCION_SLCTUD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(82279895412687203)
,p_prompt=>unistr('N\00B0 de solicitud de exenci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89952749738968602)
,p_name=>'P206_DSCRPCION_INDCDOR_RNTA_PGDA'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_prompt=>'Pagada'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89952834079968603)
,p_name=>'P206_FCHA_RCDO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_prompt=>'Fecha Recaudo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89952971516968604)
,p_name=>'P206_NMBRE_BNCO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(89847446363243435)
,p_prompt=>'Entidad Bancaria'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(78953557212533315)
,p_name=>'Imprimir documento'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(78953452751533314)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(78953617162533316)
,p_event_id=>wwv_flow_api.id(78953557212533315)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function imprimir(){',
'        var popup = apex.widget.waitPopup();',
'        var v_app_id = $v(''pFlowId''),',
'        v_page_id = $v(''pFlowStepId''),',
'        v_session = $v(''pInstance''), ',
'        v_id_lqdcion = $v(''P206_NMRO_RNTA'');',
'    try{',
'        //var rs = await apex.server.process(''GenerarDocumento'', { pageItems: ''#P115_VLOR_CTA_INCIAL,#P115_JSON_ARRAY,#P115_FCHA_PGO_CTA_INCIAL,#P115_ID_RPRTE_CTA_INCIAL'' });',
'        var url = `f?p=${v_app_id}:${v_page_id}:${v_session}:APPLICATION_PROCESS=Descargar_Documento:NO:RP:::`;        ',
'        let a = document.createElement("a");',
'        document.body.appendChild(a);',
'        let v_blob = await fecth_async(url);',
'        let v_url = window.URL.createObjectURL(v_blob);',
'        a.download = ''Liquidacion_'' + v_id_lqdcion + ''.pdf'';',
'        a.href = v_url;',
'        a.click();',
'        document.body.removeChild(a);',
'        window.URL.revokeObjectURL(v_url);',
'       // apex.page.submit();',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        if(popup) popup.remove();',
'    }     ',
'}',
'',
' function fecth_async(url) {',
'        var miInit = {',
'            method: "GET",',
'            cache: "default"',
'        };',
'        return fetch(url, miInit).then(resp => {',
'            return resp.blob();',
'        });',
'    }',
' ',
'',
'imprimir();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4254422658589322)
,p_name=>'Imprimir Bono'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4254327732589321)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4254530663589323)
,p_event_id=>wwv_flow_api.id(4254422658589322)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function imprimir(){',
'        var popup = apex.widget.waitPopup();',
'        var v_app_id = $v(''pFlowId''),',
'        v_page_id = $v(''pFlowStepId''),',
'        v_session = $v(''pInstance''), ',
'        v_id_lqdcion = $v(''P206_NMRO_RNTA'');',
'    try{',
'        //var rs = await apex.server.process(''GenerarDocumento'', { pageItems: ''#P115_VLOR_CTA_INCIAL,#P115_JSON_ARRAY,#P115_FCHA_PGO_CTA_INCIAL,#P115_ID_RPRTE_CTA_INCIAL'' });',
'        var url = `f?p=${v_app_id}:${v_page_id}:${v_session}:APPLICATION_PROCESS=Descargar_Documento:NO:RP:::`;        ',
'        let a = document.createElement("a");',
'        document.body.appendChild(a);',
'        let v_blob = await fecth_async(url);',
'        let v_url = window.URL.createObjectURL(v_blob);',
'        a.download = ''Liquidacion_'' + v_id_lqdcion + ''.pdf'';',
'        a.href = v_url;',
'        a.click();',
'        document.body.removeChild(a);',
'        window.URL.revokeObjectURL(v_url);',
'       // apex.page.submit();',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        if(popup) popup.remove();',
'    }     ',
'}',
'',
' function fecth_async(url) {',
'        var miInit = {',
'            method: "GET",',
'            cache: "default"',
'        };',
'        return fetch(url, miInit).then(resp => {',
'            return resp.blob();',
'        });',
'    }',
' ',
'',
'imprimir();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4254198516589319)
,p_name=>unistr('Imprimir documento_Exenci\00F3n')
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4253727302589315)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4254287342589320)
,p_event_id=>wwv_flow_api.id(4254198516589319)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function imprimir(){',
'        var popup = apex.widget.waitPopup();',
'        var v_app_id = $v(''pFlowId''),',
'        v_page_id = $v(''pFlowStepId''),',
'        v_session = $v(''pInstance''), ',
'        v_nmro_dcmnto = $v(''P206_NMRO_DCMNTO_EXNCION'');',
'    try{',
'        //var rs = await apex.server.process(''GenerarDocumento'', { pageItems: ''#P115_VLOR_CTA_INCIAL,#P115_JSON_ARRAY,#P115_FCHA_PGO_CTA_INCIAL,#P115_ID_RPRTE_CTA_INCIAL'' });',
'        var url = `f?p=${v_app_id}:${v_page_id}:${v_session}:APPLICATION_PROCESS=Descargar_Documento_Execencion:NO:RP:::`;        ',
'        let a = document.createElement("a");',
'        document.body.appendChild(a);',
'        let v_blob = await fecth_async(url);',
'        let v_url = window.URL.createObjectURL(v_blob);',
'        a.download = ''Documento_'' + v_nmro_dcmnto + ''.pdf'';',
'        a.href = v_url;',
'        a.click();',
'        document.body.removeChild(a);',
'        window.URL.revokeObjectURL(v_url);',
'       // apex.page.submit();',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        if(popup) popup.remove();',
'    }     ',
'}',
'',
' function fecth_async(url) {',
'        var miInit = {',
'            method: "GET",',
'            cache: "default"',
'        };',
'        return fetch(url, miInit).then(resp => {',
'            return resp.blob();',
'        });',
'    }',
' ',
'',
'imprimir();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4255086735589328)
,p_name=>unistr('Imprimir_Bono_Exenci\00F3n')
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4254994151589327)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4255163592589329)
,p_event_id=>wwv_flow_api.id(4255086735589328)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function imprimir(){',
'        var popup = apex.widget.waitPopup();',
'        var v_app_id = $v(''pFlowId''),',
'        v_page_id = $v(''pFlowStepId''),',
'        v_session = $v(''pInstance''), ',
'        v_nmro_dcmnto = $v(''P206_NMRO_DCMNTO_EXNCION'');',
'    try{',
'        //var rs = await apex.server.process(''GenerarDocumento'', { pageItems: ''#P115_VLOR_CTA_INCIAL,#P115_JSON_ARRAY,#P115_FCHA_PGO_CTA_INCIAL,#P115_ID_RPRTE_CTA_INCIAL'' });',
'        var url = `f?p=${v_app_id}:${v_page_id}:${v_session}:APPLICATION_PROCESS=Descargar_Documento_Execencion:NO:RP:::`;        ',
'        let a = document.createElement("a");',
'        document.body.appendChild(a);',
'        let v_blob = await fecth_async(url);',
'        let v_url = window.URL.createObjectURL(v_blob);',
'        a.download = ''Documento_'' + v_nmro_dcmnto + ''.pdf'';',
'        a.href = v_url;',
'        a.click();',
'        document.body.removeChild(a);',
'        window.URL.revokeObjectURL(v_url);',
'       // apex.page.submit();',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        if(popup) popup.remove();',
'    }     ',
'}',
'',
' function fecth_async(url) {',
'        var miInit = {',
'            method: "GET",',
'            cache: "default"',
'        };',
'        return fetch(url, miInit).then(resp => {',
'            return resp.blob();',
'        });',
'    }',
' ',
'',
'imprimir();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5510233861613769)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Informaci\00F3n de Sujeto Impuiestos')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'  select a.idntfccion_sjto_frmtda,',
'         upper(b.nmbre_pais || '' '' || b.nmbre_dprtmnto || '' '' ||',
'               b.nmbre_mncpio) ubccion,',
'         b.drccion,',
'         c.nmbre_rzon_scial,',
'         a.id_impsto_sbmpsto,',
'         d.id_impsto_acto,',
'         a.fcha_expdcion,',
'         a.vlor_bse_grvble,',
'         a.indcdor_usa_extrnjro,',
'         a.indcdor_usa_mxto,',
'         a.cdgo_rnta_estdo,',
'         a.dscrpcion_rnta_estdo,',
'         a.fcha_rgstro,',
'         a.fcha_aprbcion,',
'         a.fcha_rchzo,',
'         a.obsrvcion_rchzo,',
'         a.nmro_rnta,',
'         a.id_dcmnto',
'         ',
'        ,',
'         a.indcdor_exncion,',
'         a.cdgo_exncion_estdo,',
'         a.id_exncion_slctud,',
'         a.usrio_rgstra_exncion,',
'         a.fcha_rgstro_exncion',
'         --, a.id_usrio_rspsta       ',
'        ,',
'         a.fcha_rspsta_exncion,',
'         a.obsrvcion_rchzo_exncion,',
'         a.indcdor_rnta_pgda,',
'         a.DSCRPCION_INDCDOR_RNTA_PGDA,',
'         a.indcdor_cntrto_gslna,',
'         case',
'           when a.id_rnta_antrior is not null then',
unistr('            ''S\00ED'''),
'           else',
'            ''No''',
'         end as indcdor_lqdcion_adcnal,',
'         a.id_rnta_antrior,',
'         to_char(f.fcha_rcdo,''DD/MM/YYYY'') fcha_rcdo,',
'         g.nmbre_bnco',
'    into :P206_IDNTFCCION_SJTO_FRMTDA,',
'         :P206_UBCCION,',
'         :P206_DRCCION,',
'         :P206_NMBRE_RZON_SCIAL,',
'         :P206_ID_IMPSTO_SBMPSTO,',
'         :P206_ID_IMPSTO_ACTO,',
'         :P206_FCHA_EXPDCION,',
'         :P206_BSE,',
'         :P206_INDCDOR_EXTRNJRO,',
'         :P206_INDCDOR_MXTO,',
'         :P206_CDGO_RNTA_ESTDO,',
'         :P206_DSCRPCION_RNTA_ESTDO,',
'         :P206_FCHA_RGSTRO,',
'         :P206_FCHA_APBCION,',
'         :P206_FCHA_RCHZO,',
'         :P206_OBSRVCION_RCHZO,',
'         :P206_NMRO_RNTA,',
'         :P206_ID_DCMNTO,',
'         :P206_INDCDOR_EXNCION,',
'         :P206_CDGO_EXNCION_ESTDO,',
'         :P206_ID_EXNCION_SLCTUD,',
'         :P206_USRIO_RGSTRA_EXNCION,',
'         :P206_FCHA_RGSTRO_EXNCION,',
'         :P206_FCHA_RSPSTA_EXNCION,',
'         :P206_OBSRVCION_RCHZO_EXNCION,',
'         :P206_INDCDOR_RNTA_PGADA,',
'         :P206_DSCRPCION_INDCDOR_RNTA_PGDA,',
'         :P206_INDCDOR_CNTRTO_GSLNA,',
'         :P206_INDCDOR_LQDCION_ADCNAL,',
'         :P206_ID_RNTA_ANTRIOR,',
'         :P206_FCHA_RCDO,',
'         :P206_NMBRE_BNCO',
'    from v_gi_g_rentas a',
'    join v_si_i_sujetos_impuesto b',
'      on a.id_sjto_impsto = b.id_sjto_impsto',
'    join si_i_personas c',
'      on b.id_sjto_impsto = c.id_sjto_impsto',
'    join gi_g_rentas_acto d',
'      on a.id_rnta = d.id_rnta',
'    left join v_re_g_recaudos f',
'      on f.id_orgen = a.id_dcmnto',
'     and f.cdgo_rcdo_estdo = ''AP''',
'     and f.CDGO_RCDO_ORGN_TPO = ''DC''',
'    left join v_re_g_recaudos_control g',
'      on g.id_rcdo_cntrol = f.id_rcdo_cntrol',
'   where a.id_rnta = :P206_ID_RNTA;',
'',
'exception',
'  when others then',
'    :P206_IDNTFCCION_SJTO_FRMTDA := null;',
'    :P206_UBCCION                := null;',
'    :P206_DRCCION                := null;',
'    :P206_CDGO_SJTO_TPO          := null;',
'    :P206_ID_IMPSTO_SBMPSTO      := null;',
'    :P206_ID_IMPSTO_ACTO         := null;',
'    :P206_FCHA_EXPDCION          := null;',
'    :P206_BSE                    := null;',
'    :P206_INDCDOR_EXTRNJRO       := null;',
'    :P206_INDCDOR_MXTO           := null;',
'    :P206_NMRO_RNTA              := null;',
'  ',
'    :P206_INDCDOR_EXNCION      := null;',
'    :P206_CDGO_EXNCION_ESTDO   := null;',
'    :P206_ID_EXNCION_SLCTUD    := null;',
'    :P206_USRIO_RGSTRA_EXNCION := null;',
'    :P206_FCHA_RGSTRO_EXNCION  := null;',
'    --:P206_ID_USRIO_RSPSTA           := null;',
'    :P206_FCHA_RSPSTA_EXNCION     := null;',
'    :P206_OBSRVCION_RCHZO_EXNCION := null;',
'  ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(78953877014533318)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta del reporte  recibo de renta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_rprte',
'      into :P206_ID_RPRTE',
'      from gn_d_reportes   a',
'       join gn_d_reporte_cliente    b on a.id_rprte = b.id_rprte',
'       and cdgo_clnte              = :F_CDGO_CLNTE',
'     where cdgo_rprte_grpo = ''RRV'' ',
'       and a.indcdor_gnrco = ''N'';',
'exception',
'    when no_data_found then ',
'        select a.id_rprte',
'      into :P206_ID_RPRTE',
'      from gn_d_reportes   a',
'     where cdgo_rprte_grpo = ''RRV'' ',
'       and a.indcdor_gnrco = ''S''',
'       and rownum = 1;',
'    when others then ',
'        :P206_ID_RPRTE := NULL;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(80930834351670840)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Informaci\00F3n de Exenci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    select a.id_dcmnto',
'        , a.nmro_dcmnto',
'        , a.indcdor_pgo_aplcdo',
'        , a.id_acto',
'     into :P206_ID_DCMNTO_EXNCION',
'        , :P206_NMRO_DCMNTO_EXNCION',
'        , :P206_INDCDOR_PAGO_APLCDO',
'        , :P206_ID_ACTO_EXNCION',
'     from v_gf_g_exenciones_solicitud    a',
'    where a.id_exncion_slctud            = :P206_ID_EXNCION_SLCTUD;',
' ',
' ',
' exception',
'    when others then',
'        :P206_ID_DCMNTO_EXNCION    := null;',
'        :P206_NMRO_DCMNTO_EXNCION  := null;',
'        :P206_INDCDOR_PAGO_APLCDO  := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(78953722227533317)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar_Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_gn_d_reportes     gn_d_reportes%rowtype;',
'    v_blob              blob;',
'    ',
'begin',
'    apex_util.set_session_state(''F_CDGO_CLNTE'', :F_CDGO_CLNTE);',
'    apex_util.set_session_state(''F_FRMTO_MNDA'', ''FM$999G999G999G999G999G999G990'');',
'    ',
'    apex_session.attach( p_app_id     => 66000',
'                       , p_page_id    => 2',
'                       , p_session_id => v(''APP_SESSION'') );',
'',
'    --BUSCAMOS LOS DATOS DE PLANTILLA DE REPORTES',
'    select /*+ RESULT_CACHE */',
'           r.*',
'      into v_gn_d_reportes ',
'      from gn_d_reportes r',
'     where r.id_rprte = :P206_ID_RPRTE;',
'',
'    --SETEAMOS EN SESSION LOS ITEMS NECESARIOS PARA GENERAR EL ARCHIVO     ',
'    apex_util.set_session_state(''F_CDGO_CLNTE'', :F_CDGO_CLNTE);',
'    apex_util.set_session_state(''F_FRMTO_MNDA'', ''FM$999G999G999G999G999G999G990'');',
'    apex_util.set_session_state(''P2_PRMTRO_1'', to_number(:P206_ID_RNTA));',
'    apex_util.set_session_state(''P2_PRMTRO_2'', to_number(:P206_ID_DCMNTO));',
'',
'',
'    v_blob := apex_util.get_print_document( p_application_id     => 66000, ',
'                                            p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,',
'                                            p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,',
'                                            p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,',
'                                            p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo );',
'    htp.init;',
'    owa_util.mime_header(''application/pdf'', FALSE );',
'    htp.p(''Content-length: '' ||dbms_lob.getlength(v_blob));',
'    htp.p(''Content-Disposition: attachment; filename="DOCUMENTO_"'' );',
'    htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'    owa_util.http_header_close;',
'    wpg_docload.download_file(v_blob);',
'    apex_application.stop_apex_engine;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4253897931589316)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar_Documento_Execencion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_gn_d_reportes     gn_d_reportes%rowtype;',
'    v_blob              blob;',
'    ',
'begin',
'    apex_util.set_session_state(''F_CDGO_CLNTE'', :F_CDGO_CLNTE);',
'    apex_util.set_session_state(''F_FRMTO_MNDA'', ''FM$999G999G999G999G999G999G990'');',
'    ',
'    apex_session.attach( p_app_id     => 66000',
'                       , p_page_id    => 2',
'                       , p_session_id => v(''APP_SESSION'') );',
'',
'    --BUSCAMOS LOS DATOS DE PLANTILLA DE REPORTES',
'    select /*+ RESULT_CACHE */',
'           r.*',
'      into v_gn_d_reportes ',
'      from gn_d_reportes r',
'     where r.id_rprte = :P206_ID_RPRTE;',
'',
'    --SETEAMOS EN SESSION LOS ITEMS NECESARIOS PARA GENERAR EL ARCHIVO     ',
'    apex_util.set_session_state(''F_CDGO_CLNTE'', :F_CDGO_CLNTE);',
'    apex_util.set_session_state(''F_FRMTO_MNDA'', ''FM$999G999G999G999G999G999G990'');',
'    apex_util.set_session_state(''P2_PRMTRO_1'', to_number(:P206_ID_RNTA));',
'    apex_util.set_session_state(''P2_PRMTRO_2'', to_number(:P206_ID_DCMNTO_EXNCION));',
'',
'',
'    v_blob := apex_util.get_print_document( p_application_id     => 66000, ',
'                                            p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,',
'                                            p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,',
'                                            p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,',
'                                            p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo );',
'    htp.init;',
'    owa_util.mime_header(''application/pdf'', FALSE );',
'    htp.p(''Content-length: '' ||dbms_lob.getlength(v_blob));',
'    htp.p(''Content-Disposition: attachment; filename="DOCUMENTO_"'' );',
'    htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'    owa_util.http_header_close;',
'    wpg_docload.download_file(v_blob);',
'    apex_application.stop_apex_engine;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
