prompt --application/pages/page_00143
begin
wwv_flow_api.create_page(
 p_id=>143
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Resumen - Liquidaci\00F3n de Rentas')
,p_step_title=>unistr('Resumen - Liquidaci\00F3n de Rentas')
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>'$("#region-flotante").draggable();'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer {',
'    display: none;',
'}',
'',
' #region-flotante {',
'    position: fixed;',
unistr('    top: 100px; /* Ajusta la posici\00F3n vertical */'),
unistr('    right: 20px; /* Ajusta la posici\00F3n horizontal */'),
unistr('    width: 700px; /* Ancho de la regi\00F3n */'),
'    background-color: #ffffff; /* Color de fondo */',
'    border: 1px solid #ccc; /* Borde */',
'    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Sombra para efecto flotante */',
unistr('    z-index: 1000; /* Asegura que est\00E9 por encima de otros elementos */'),
'    padding: 15px; /* Espaciado interno */',
'    display: none; /* Inicialmente oculta */',
'}',
'#region-flotante.visible {',
unistr('    display: block; /* Mostrar cuando se a\00F1ade la clase ''visible'' */'),
'}',
'',
'',
'#region-flotante {',
'    transition: all 0.3s ease;',
'    opacity: 0;',
'}',
'',
'#region-flotante.visible {',
'    opacity: 1;',
'} ',
'',
'.mi-estilo-personalizado {',
'  background-color: #e0f7fa;',
'  color: #006064;',
'  border: 1px solid #004d40;',
'  font-size: 16px;',
'}',
'',
'.estilo-cool {',
'    border: none;',
'    color: white;',
'    font-size: 12px; ',
'    padding: 5px; ',
'    background-color: transparent;',
'    box-shadow: none;',
'     font-weight: bold;',
'  }'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20250623173738'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20468152901068243)
,p_plug_name=>'Contrato Externo'
,p_region_name=>'region-flotante'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10251387713341523)
,p_plug_name=>'Tab Container'
,p_parent_plug_id=>wwv_flow_api.id(20468152901068243)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(164084128065707698)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20468336324068244)
,p_plug_name=>'Contrato'
,p_parent_plug_id=>wwv_flow_api.id(10251387713341523)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20469828520068259)
,p_plug_name=>'Sujeto Impuesto'
,p_parent_plug_id=>wwv_flow_api.id(10251387713341523)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(78953000069533310)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
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
unistr('    <p align="center"><b>Liquidaci\00F3n de Rentas Varias.</b> <br> <br> '),
'      Resumen<br><br>  </p>',
unistr('      <p align="justify">En este paso se muestra el resumen de toda la informaci\00F3n ingresada para realizar el proceso de liquidaci\00F3n.</p>'),
'    ',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96973440466598189)
,p_plug_name=>'Resumen'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(164085715180707699)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(76379350032438234)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(164098974360707738)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(87427324972252189)
,p_plug_name=>'Tab Selector'
,p_parent_plug_id=>wwv_flow_api.id(96973440466598189)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(87426761967252183)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(87427324972252189)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select seq_id',
'        ,  dscrpcion dscrpcion_adjnto_tpo',
'        , c002                           file_name',
'        , c001                           obsrvcion',
'     from apex_collections               a',
'	 join table (pkg_gi_rentas.fnc_tipos_adjunto (p_cdgo_clnte              => :F_CDGO_CLNTE,',
'												  p_id_impsto               => :P138_ID_IMPSTO,',
'												  p_id_impsto_sbmpsto       => :P138_ID_IMPSTO_SBMPSTO,',
'												  p_id_impsto_acto          => :P139_ID_IMPSTO_ACTO,',
'                                                  p_id_impsto_acto_slccndo  => :P139_ACTOS_SLCCNDOS )) b',
'                                                  ',
'                                                  on a.n001    = b.id_adjnto_tpo',
'    -- join gi_d_subimpuestos_adjnto_tp    b on a.n001    = b.id_sbmpto_adjnto_tpo',
'    where collection_name                = ''ADJUNTOS_RENTA'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P138_INDCDOR_RQRE_ADJNTO'
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
 p_id=>wwv_flow_api.id(87426859636252184)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>87426859636252184
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76852438505079096)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84499440137001907)
,p_db_column_name=>'DSCRPCION_ADJNTO_TPO'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>'Tipo de Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76852899958079098)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76853201090079098)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(87453506647782238)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'768536'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ADJNTO_TPO:FILE_NAME:OBSRVCION:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(87427496877252190)
,p_plug_name=>'Conceptos'
,p_parent_plug_id=>wwv_flow_api.id(87427324972252189)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct',
'        a.cdgo_cncpto',
'        , a.cdgo_cncpto || '' - '' || a.dscrpcion_cncpto  dscrpcion_cncpto',
'        , '' - ''||a.nmbre_impsto_acto   nmbre_impsto_acto',
'        , a.vlor_lqddo',
'        , nvl(a.vlor_intres_mra,0) vlor_intres_mra',
'        , a.vlor_ttal vlor_ttal',
'        , a.fcha_vncmnto',
'        , a.dias_mra',
'        , a.txto_trfa',
'        , a.bse_grvble',
'        , nvl(a.vlor_pgdo,0) vlor_pgdo',
'        , a.prcntje_bse_lqdcion',
'        , a.fctor',
'        , a.id_impsto_acto',
'     from table (pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte 			        => :F_CDGO_CLNTE',
'                                                            , p_id_impsto					=> :P138_ID_IMPSTO',
'                                                            , p_id_impsto_sbmpsto			=> :P138_ID_IMPSTO_SBMPSTO',
'                                                            , p_id_impsto_acto				=> :P139_ID_IMPSTO_ACTO',
'                                                            , p_id_sjto_impsto            	=> :P138_ID_SJTO_IMPSTO',
'                                                            , p_json_cncptos				=> :P141_CNCPTOS_SLCCNDOS',
'                                                            , p_vlor_bse					=> to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                                            , p_indcdor_usa_extrnjro		=> nvl(:P139_INDCDOR_USA_EXTRNJRO, ''N'')',
'                                                            , p_indcdor_usa_mxto			=> nvl(:P139_INDCDOR_USA_MXTO, ''N'')',
'                                                            , p_fcha_expdcion				=> to_date(:P139_FCHA_EXPDCION)',
'                                                            , p_fcha_vncmnto				=> to_date(:P141_FCHA_VNCMNTO)',
'                                                            , p_indcdor_lqdccion_adcnal   	=> :P141_INDCDOR_LDCCION_ADCNAL  ',
'                                                            , p_id_rnta_antrior		    	=> :P141_ID_RNTA_ANTRIOR',
'                                                        --   , p_indcdor_cntrto_gslna      	=> :P139_INDCDOR_CNTRTO_GSLNA)',
'                                                            , p_indcdor_cntrto_gslna      	=> decode(:P139_CNTRO_TPO, ''GSLNA'', ''S'',''N'')',
'                                                            , p_vlor_aux_lqdcion      	    => to_number(:P141_VLOR_AUX_LQDCION, ''999G999G999G999G999G999G990D99'')',
'                                                            , p_id_impsto_acto_slccndo 	    => :P139_ACTOS_SLCCNDOS',
'                                                             )',
'                ) a',
' where abs(a.vlor_lqddo)   > 0'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(7037292666890402)
,p_name=>'PRCNTJE_BSE_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCNTJE_BSE_LQDCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11021815882370611)
,p_name=>'FCTOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCTOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Factor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(11023783771370630)
,p_name=>'ID_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Impsto Acto'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(11024333113370636)
,p_name=>'NMBRE_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Impuesto Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>253
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(87427887776252194)
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
,p_max_length=>108
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
 p_id=>wwv_flow_api.id(87428019679252196)
,p_name=>'VLOR_LQDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_LQDDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br>Liquidado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(87428212382252197)
,p_name=>'VLOR_INTRES_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES_MRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Interes de<br> Mora'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(87428255750252198)
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
,p_format_mask=>'999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(87428365849252199)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'DATE'
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
 p_id=>wwv_flow_api.id(87428474989252200)
,p_name=>'DIAS_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIAS_MRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('D\00EDas de Mora')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
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
,p_display_condition_type=>'SQL_EXPRESSION'
,p_display_condition=>':DIAS_MORA > 0'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(87428587612252201)
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
,p_is_required=>false
,p_max_length=>200
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
 p_id=>wwv_flow_api.id(92436367103950407)
,p_name=>'VLOR_PGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_PGDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br> Pagado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990'
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
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P143_INDCDOR_LDCCION_ADCNAL'
,p_display_condition2=>'S'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(100914599033162102)
,p_name=>'BSE_GRVBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BSE_GRVBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Base Gravable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(100917359703162130)
,p_name=>'CDGO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Cdgo Cncpto'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>5
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(87427714747252192)
,p_internal_uid=>87427714747252192
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>false
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
 p_id=>wwv_flow_api.id(87467840426867559)
,p_interactive_grid_id=>wwv_flow_api.id(87427714747252192)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(87467988778867559)
,p_report_id=>wwv_flow_api.id(87467840426867559)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7044311135915390)
,p_view_id=>wwv_flow_api.id(87467988778867559)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(7037292666890402)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11037708845607450)
,p_view_id=>wwv_flow_api.id(87467988778867559)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(11021815882370611)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11154345533197538)
,p_view_id=>wwv_flow_api.id(87467988778867559)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(11023783771370630)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11201241097744245)
,p_view_id=>wwv_flow_api.id(87467988778867559)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(11024333113370636)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>576
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87468929906867573)
,p_view_id=>wwv_flow_api.id(87467988778867559)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(87427887776252194)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>447
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87469985715867577)
,p_view_id=>wwv_flow_api.id(87467988778867559)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(87428019679252196)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>87
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87470435482867579)
,p_view_id=>wwv_flow_api.id(87467988778867559)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(87428212382252197)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>88
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87471002103867580)
,p_view_id=>wwv_flow_api.id(87467988778867559)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(87428255750252198)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>117
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87471473831867582)
,p_view_id=>wwv_flow_api.id(87467988778867559)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(87428365849252199)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87472007355867583)
,p_view_id=>wwv_flow_api.id(87467988778867559)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(87428474989252200)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87472502066867585)
,p_view_id=>wwv_flow_api.id(87467988778867559)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(87428587612252201)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>86
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92666090660372543)
,p_view_id=>wwv_flow_api.id(87467988778867559)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(92436367103950407)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(100990357609195760)
,p_view_id=>wwv_flow_api.id(87467988778867559)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(100914599033162102)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>135
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101044259195927733)
,p_view_id=>wwv_flow_api.id(87467988778867559)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(100917359703162130)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(56681000587)
,p_view_id=>wwv_flow_api.id(87467988778867559)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(92436367103950407)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(108545000010)
,p_view_id=>wwv_flow_api.id(87467988778867559)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(87428255750252198)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(140934000020)
,p_view_id=>wwv_flow_api.id(87467988778867559)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(87428212382252197)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(304739000020)
,p_view_id=>wwv_flow_api.id(87467988778867559)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(87428019679252196)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(161320632573628259)
,p_plug_name=>unistr('Informaci\00F3n B\00E1sica')
,p_region_name=>'informacion_basica'
,p_parent_plug_id=>wwv_flow_api.id(96973440466598189)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10328835127755583)
,p_button_sequence=>360
,p_button_plug_id=>wwv_flow_api.id(161320632573628259)
,p_button_name=>'BTN_CNTRTO_EXTRNO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--success:t-Button--link'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Contrato Externo'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P138_ID_RNTA_CNTRTO_EXTRNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column=>11
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10316828170744929)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(20468152901068243)
,p_button_name=>'BTN_CERRAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Cerrar'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76838894143079024)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(96973440466598189)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de cancelar? Al cancelar se perdera todos los cambios que no se han guardado'',''CANCEL'');'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76839248695079027)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(96973440466598189)
,p_button_name=>'BTN_LIQUIDAR'
,p_button_static_id=>'BTN_LIQUIDAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Liquidar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'    v_usuario_rqre_atrzcion varchar2(1)  ;',
'Begin',
'',
'    v_usuario_rqre_atrzcion :=   pkg_gi_rentas.fnc_vl_usuario_rqre_atrzcion (  p_cdgo_clnte				=>  :F_CDGO_CLNTE',
'                                                                              , p_id_impsto_sbmpsto		=>  :P138_ID_IMPSTO_SBMPSTO',
'                                                                              , p_id_usrio    			=>  :F_ID_USRIO)  ;                                                                          ',
'    -- if v_usuario_rqre_atrzcion = ''N''  and :P143_INDCDOR_EXNCION != ''S'' then',
'    if v_usuario_rqre_atrzcion = ''N''    then',
'          return true;',
'      else',
'         return false;',
'      end if;     ',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76839645531079028)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(96973440466598189)
,p_button_name=>'BTN_REGISTRAR_LIQUIDACION'
,p_button_static_id=>'BTN_REGISTRAR_LIQUIDACION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Registrar Liquidaci\00F3n')
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'    v_usuario_rqre_atrzcion varchar2(1)  ;',
'Begin',
'',
'    v_usuario_rqre_atrzcion :=   pkg_gi_rentas.fnc_vl_usuario_rqre_atrzcion (  p_cdgo_clnte				=>  :F_CDGO_CLNTE',
'                                                                              , p_id_impsto_sbmpsto		=>  :P138_ID_IMPSTO_SBMPSTO',
'                                                                              , p_id_usrio    			=>  :F_ID_USRIO)  ;                                                                  ',
'     if v_usuario_rqre_atrzcion = ''N''  then',
'         return false;',
'      else',
'         return true;',
'      end if;     ',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76840051194079028)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(96973440466598189)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103612327707757)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(76857496450079125)
,p_branch_name=>'Ir a Inicio'
,p_branch_action=>'f?p=&APP_ID.:89:&SESSION.::&DEBUG.:RP,138,139,141,142,143::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(76839645531079028)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(77075830533293023)
,p_branch_name=>unistr('Ir a P\00E1gina 89/136 - Informe de Liquidaciones')
,p_branch_action=>'P138_BRANCH'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_when_button_id=>wwv_flow_api.id(76838894143079024)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(76857095572079124)
,p_branch_name=>unistr('Ir a Proyecci\00F3n')
,p_branch_action=>'f?p=&APP_ID.:141:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(76840051194079028)
,p_branch_sequence=>20
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P138_INDCDOR_RQRE_ADJNTO'
,p_branch_condition_text=>'N'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(76857817529079125)
,p_branch_name=>'Ir a Adjuntos'
,p_branch_action=>'f?p=&APP_ID.:142:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(76840051194079028)
,p_branch_sequence=>30
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P138_INDCDOR_RQRE_ADJNTO'
,p_branch_condition_text=>'S'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(105720249549279221)
,p_branch_name=>unistr('Ir a P\00E1gina 89')
,p_branch_action=>'f?p=&APP_ID.:138:&SESSION.::&DEBUG.:RP,138::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(76839248695079027)
,p_branch_sequence=>40
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P143_NRO_RNTA'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10317570864744929)
,p_name=>'P143_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(20469828520068259)
,p_prompt=>unistr('Tipo Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10317969534744930)
,p_name=>'P143_NMRO_IDNTFCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(20469828520068259)
,p_prompt=>unistr('No. Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10318332848744930)
,p_name=>'P143_NMBRE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(20469828520068259)
,p_prompt=>'Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>70
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10318746069744930)
,p_name=>'P143_DRCCION_1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(20469828520068259)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10319168046744930)
,p_name=>'P143_TLFNO_EXT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(20469828520068259)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10319586761744931)
,p_name=>'P143_CORREO_EXT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(20469828520068259)
,p_prompt=>'Correo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10319941474744931)
,p_name=>'P143_NMBRE_DPRTMNTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(20469828520068259)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10320381469744931)
,p_name=>'P143_NMBRE_MNCPIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(20469828520068259)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10320780095744932)
,p_name=>'P143_TPO_RGMEN'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(20469828520068259)
,p_prompt=>'Tipo Regimen'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10321197003744932)
,p_name=>'P143_TPO_PRSNA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(20469828520068259)
,p_prompt=>'Tipo Persona'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10321599961744932)
,p_name=>'P143_RSPNSBLE_DE_IVA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(20469828520068259)
,p_prompt=>unistr('\00BFResponsable de IVA?')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10322202105744933)
,p_name=>'P143_NMRO_CNTRTO_EXT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(20468336324068244)
,p_prompt=>'No. Contrato'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10322650154744933)
,p_name=>'P143_OBJTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(20468336324068244)
,p_prompt=>'Objeto'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>70
,p_cHeight=>5
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10323086386744933)
,p_name=>'P143_FCHA_INCIO_CNTRTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(20468336324068244)
,p_prompt=>'Fecha Inicio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10323473603744933)
,p_name=>'P143_FCHA_FIN'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(20468336324068244)
,p_prompt=>'Fecha Fin'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10323858256744934)
,p_name=>'P143_FCHA_FRMA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(20468336324068244)
,p_prompt=>'Fecha Firma'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10324218570744934)
,p_name=>'P143_VLOR_CNTRTO_INCLYE_IVA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(20468336324068244)
,p_prompt=>'Valor con IVA'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10324604397744934)
,p_name=>'P143_VLOR_CNTRTO_SIN_IVA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(20468336324068244)
,p_prompt=>'Valor sin IVA'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10325029037744934)
,p_name=>'P143_VLOR_IVA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(20468336324068244)
,p_prompt=>'Iva'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10325451324744934)
,p_name=>'P143_TPO_CNTRTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(20468336324068244)
,p_prompt=>'Tipo Contrato'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>70
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10325892560744935)
,p_name=>'P143_DRCION_DIAS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(20468336324068244)
,p_prompt=>unistr('Duraci\00F3n Dias')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10326210729744935)
,p_name=>'P143_DRCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(20468336324068244)
,p_prompt=>unistr('Duraci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10326621004744936)
,p_name=>'P143_DSCRPCION_FRMA_PGO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(20468336324068244)
,p_prompt=>'Forma de Pago'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10327001045744936)
,p_name=>'P143_NMBRE_DPNDNCIA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(20468336324068244)
,p_prompt=>'Dependencia'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10327415310744936)
,p_name=>'P143_CNSCTVO_RP'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(20468336324068244)
,p_prompt=>'Consecutivo RP'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10327816087744936)
,p_name=>'P143_FCHA_RP'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(20468336324068244)
,p_prompt=>'Fecha RP'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10328264681744936)
,p_name=>'P143_ESTDO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(20468336324068244)
,p_prompt=>'Estado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11889324379635207)
,p_name=>'P143_ID_SJTO_SCRSAL'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>'Sucursal'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.nmbre ',
'        , a.id_sjto_scrsal',
'     from si_i_sujetos_sucursal           a '))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>'P143_ID_SJTO_SCRSAL'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76825449872950311)
,p_name=>'P143_ID_IMPSTO_ASCDA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>'Asociada'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select dscrpcion || '': '' || :P143_TXTO_ASCDA d',
'        , id_sbmpsto_ascda ',
'     from gi_d_subimpuestos_asociada'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>10
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76825507646950312)
,p_name=>'P143_TXTO_ASCDA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76825731172950314)
,p_name=>'P143_INDCDOR_LDCCION_ADCNAL'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>unistr('\00BFLiquidaci\00F3n Adicional?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76825954094950316)
,p_name=>'P143_NMRO_LQDCION_ANTRIOR'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>unistr('N\00B0 Liquidaciones Anteriores')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_column=>1
,p_display_when=>'P143_INDCDOR_LDCCION_ADCNAL'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76826031966950317)
,p_name=>'P143_TTAL_LQDCION_ANTRIOR'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>'Total Liquidaciones Anteriores'
,p_format_mask=>'999G999G999G999G990'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>4
,p_display_when=>'P143_INDCDOR_LDCCION_ADCNAL'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76826127428950318)
,p_name=>'P143_NVA_BSE'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>'Nueva Base Gravable'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P143_INDCDOR_LDCCION_ADCNAL'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76840739719079034)
,p_name=>'P143_IDNTFCCION_SJTO_FRMTDA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76841197515079039)
,p_name=>'P143_NMBRE_RZON_SCIAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>unistr('Nombre / Raz\00F3n Social')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76841563494079039)
,p_name=>'P143_UBCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76841971448079039)
,p_name=>'P143_DRCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76842301163079040)
,p_name=>'P143_CDGO_SJTO_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76842760587079040)
,p_name=>'P143_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select nmbre_impsto_sbmpsto          d ',
'        , id_impsto_sbmpsto             r       ',
'     from df_i_impuestos_subimpuesto    a',
'    where cdgo_clnte                    = :F_CDGO_CLNTE',
'      and id_impsto                     = :P138_ID_IMPSTO',
'      and id_impsto_sbmpsto             = :P138_ID_IMPSTO_SBMPSTO',
'      and actvo                         = ''S''',
' order by nmbre_impsto_sbmpsto'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76843105939079041)
,p_name=>'P143_ID_IMPSTO_ACTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>'Acto'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.nmbre_impsto_acto',
'        , a.id_impsto_acto',
'     from v_df_i_impuestos_acto           a',
' order by a.nmbre_impsto_acto'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76843513754079041)
,p_name=>'P143_FCHA_EXPDCION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>'&P138_LBEL_FCHA.'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76843955592079041)
,p_name=>'P143_BSE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>'&P143_TXTO_BSE.'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76844378797079041)
,p_name=>'P143_INDCDOR_EXTRNJRO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>unistr('\00BFExtranjero?')
,p_display_as=>'NATIVE_YES_NO'
,p_display_when=>'P138_USA_INDCDOR_EXTRNJRO'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76844797973079041)
,p_name=>'P143_INDCDOR_MXTO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>unistr('\00BFMixto?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_display_when=>'P138_USA_INDCDOR_MXTO'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76845105573079042)
,p_name=>'P143_ID_RPRTE'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76845580210079042)
,p_name=>'P143_RSPSTA'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76845916826079042)
,p_name=>'P143_ID_RNTA'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76846357218079043)
,p_name=>'P143_CNCPTOS'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76846762488079043)
,p_name=>'P143_ID_LQDCION'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76847125536079043)
,p_name=>'P143_ID_DCMNTO'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76847506334079043)
,p_name=>'P143_NMRO_DCMNTO'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77076275959293027)
,p_name=>'P143_INDCDOR_CNTRTO_GSLNA'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>unistr('\00BFContrato de Combustible?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_display_when=>'P143_INDCDOR_CNTRTO_GSLNA'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77076866249293033)
,p_name=>'P143_FCHA_VNCMNTO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>'Fecha de Pago'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P143_FCHA_VNCMNTO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79563490575385543)
,p_name=>'P143_INDCDOR_EXNCION'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>unistr('\00BFSolicit\00F3 exenci\00F3n?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_display_when=>'P143_INDCDOR_EXNCION'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79654803458676118)
,p_name=>'P143_NRO_RNTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>unistr('N\00B0 Liquidaci\00F3n')
,p_source=>'P138_NMRO_RNTA'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>12
,p_display_when=>'P138_ID_RNTA'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86359287659697101)
,p_name=>'P143_TXTO_BSE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select txto_bse_grvble',
'     from df_i_impuestos_acto',
'    where id_impsto                = :P138_ID_IMPSTO',
'      and id_impsto_sbmpsto        = :P138_ID_IMPSTO_SBMPSTO',
'      and id_impsto_acto           = :P139_ID_IMPSTO_ACTO;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86359390325697102)
,p_name=>'P143_CDGO_RNTA_ESTDO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>'Estado'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.dscrpcion',
'        , a.cdgo_rnta_estdo',
'     from gi_d_rentas_estado a'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102855676225131202)
,p_name=>'P143_VLOR_CNTRTO_ESE'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>'Valor Contrato ESE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>4
,p_display_when=>'P139_CNTRO_TPO'
,p_display_when2=>'ESE'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102855849045131204)
,p_name=>'P143_CNTRO_TPO'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(161320632573628259)
,p_prompt=>'Tipo de Contrato'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P139_CNTRO_TPO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(76854109175079110)
,p_computation_sequence=>10
,p_computation_item=>'P143_CNCPTOS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select json_arrayagg(  json_object( key ''ID_IMPSTO_ACTO_CNCPTO'' is l.id_impsto_acto_cncpto',
'                                   , key ''ID_IMPSTO_ACTO''        is l.id_impsto_acto',
'                                   , key ''GNRA_INTRES_MRA''       is l.gnra_intres_mra',
'                                   , key ''FCHA_VNCMNTO''          is l.fcha_vncmnto  ',
'                                   , key ''DIAS_MRA''              is l.dias_mra  ',
'                                   , key ''BSE_CNCPTO''            is l.bse_grvble',
'                                   , key ''VLOR_INDCDOR''          is l.vlor_cdgo_indcdor_tpo  ',
'                                   , key ''VLOR_TRFA''             is l.vlor_trfa  ',
'                                   , key ''VLOR''                  is l.vlor_trfa_clcldo  ',
'                                   , key ''TXTO_TRFA''             is l.txto_trfa',
'                                   , key ''VLOR_LQDDO''            is l.vlor_lqddo      ,    key ''VLOR_PGDO'' is l.vlor_pgdo',
'                                   , key ''VLOR_INTRES_MRA''       is l.vlor_intres_mra ,    key ''VLOR_TTAL'' is l.vlor_ttal  ',
'                                   , key ''PRCNTJE_BSE_LQDCION''   is l.prcntje_bse_lqdcion, key ''FCTOR''   is l.fctor , key ''ID_CNCPTO''   is l.id_cncpto          ',
'                                     )    )cncptos',
' from  (select  a.id_impsto_acto_cncpto ',
'    , a.id_impsto_acto',
'    , a.gnra_intres_mra',
'    , to_char(a.fcha_vncmnto, ''dd/mm/yyyy'')   fcha_vncmnto',
'    , nvl(a.dias_mra,''0'') dias_mra',
'    , a.bse_grvble ',
'    , nvl(a.vlor_cdgo_indcdor_tpo,''0'') vlor_cdgo_indcdor_tpo',
'    , nvl(a.vlor_trfa,''0'')  vlor_trfa',
'    , nvl(a.vlor_trfa_clcldo,''0'') vlor_trfa_clcldo',
'    , a.txto_trfa',
'    , a.vlor_lqddo',
'    , a.vlor_pgdo',
'    , a.vlor_intres_mra',
'    , a.vlor_ttal , a.prcntje_bse_lqdcion, a.fctor, a.id_cncpto',
'     from table (pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte 			        => :F_CDGO_CLNTE',
'                                    , p_id_impsto					=> :P138_ID_IMPSTO',
'                                    , p_id_impsto_sbmpsto			=> :P138_ID_IMPSTO_SBMPSTO',
'                                    , p_id_impsto_acto				=> :P139_ID_IMPSTO_ACTO',
'                                    , p_id_sjto_impsto            	=> :P138_ID_SJTO_IMPSTO',
'                                    , p_json_cncptos				=> :P141_CNCPTOS_SLCCNDOS',
'                                    , p_vlor_bse					=> to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                    , p_indcdor_usa_extrnjro		=> nvl(:P139_INDCDOR_USA_EXTRNJRO, ''N'')',
'                                    , p_indcdor_usa_mxto			=> nvl(:P139_INDCDOR_USA_MXTO, ''N'')',
'                                    , p_fcha_expdcion				=> to_date(:P139_FCHA_EXPDCION)',
'                                    , p_fcha_vncmnto				=> to_date(:P141_FCHA_VNCMNTO)',
'                                    , p_indcdor_lqdccion_adcnal   	=> :P141_INDCDOR_LDCCION_ADCNAL  ',
'                                    , p_id_rnta_antrior		    	=> :P141_ID_RNTA_ANTRIOR',
'                                  --  , p_indcdor_cntrto_gslna     	=> :P139_INDCDOR_CNTRTO_GSLNA)',
'                                    , p_indcdor_cntrto_gslna      	=> decode(:P139_CNTRO_TPO, ''GSLNA'', ''S'',''N'')',
'                                    , p_vlor_aux_lqdcion      	    => to_number(:P141_VLOR_AUX_LQDCION, ''999G999G999G999G999G999G990D99'')',
'                                    , p_id_impsto_acto_slccndo 	    => :P139_ACTOS_SLCCNDOS ) ) a',
'where abs(vlor_lqddo) > 0',
'     group by    a.id_impsto_acto_cncpto   , a.id_impsto_acto  , a.gnra_intres_mra  , to_char(a.fcha_vncmnto, ''dd/mm/yyyy'')   , nvl(a.dias_mra,''0'')  , a.bse_grvble   , nvl(a.vlor_cdgo_indcdor_tpo,''0'')  ',
'            , nvl(a.vlor_trfa,''0'')    , nvl(a.vlor_trfa_clcldo,''0'')   , a.txto_trfa   , a.vlor_lqddo , a.vlor_pgdo  , a.vlor_intres_mra   , a.vlor_ttal , a.prcntje_bse_lqdcion, a.fctor, a.id_cncpto ) l'))
,p_computation_error_message=>'Error al calcular los conceptos #SQLERRM#'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(102341983676460949)
,p_computation_sequence=>20
,p_computation_item=>'P143_TXTO_BSE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P141_LBEL_BSE'
,p_compute_when=>'P139_CNTRO_TPO'
,p_compute_when_text=>'ESE'
,p_compute_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(76854529473079112)
,p_validation_name=>'Validar que la proyeccion no sea nula'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select distinct',
'          a.cdgo_cncpto || '' - '' || a.dscrpcion_cncpto  dscrpcion_cncpto',
'        , a.vlor_lqddo',
'        , a.vlor_intres_mra',
'        , a.vlor_ttal vlor_ttal',
'        , a.fcha_vncmnto',
'        , a.dias_mra',
'        , a.txto_trfa',
'        , a.bse_grvble',
'        , a.vlor_pgdo',
'     from table (pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte 			        => :F_CDGO_CLNTE',
'                                                            , p_id_impsto					=> :P138_ID_IMPSTO',
'                                                            , p_id_impsto_sbmpsto			=> :P138_ID_IMPSTO_SBMPSTO',
'                                                            , p_id_impsto_acto				=> :P139_ID_IMPSTO_ACTO',
'                                                            , p_id_sjto_impsto            	=> :P138_ID_SJTO_IMPSTO',
'                                                            , p_json_cncptos				=> null',
'                                                            , p_vlor_bse					=> to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                                            , p_indcdor_usa_extrnjro		=> nvl(:P139_INDCDOR_USA_EXTRNJRO, ''N'')',
'                                                            , p_indcdor_usa_mxto			=> nvl(:P139_INDCDOR_USA_MXTO, ''N'')',
'                                                            , p_fcha_expdcion				=> to_date(:P139_FCHA_EXPDCION)',
'                                                            , p_fcha_vncmnto				=> to_date(:P141_FCHA_VNCMNTO)',
'                                                            , p_indcdor_lqdccion_adcnal   	=> :P141_INDCDOR_LDCCION_ADCNAL  ',
'                                                            , p_id_rnta_antrior		    	=> :P141_ID_RNTA_ANTRIOR',
'                                                        --  , p_indcdor_cntrto_gslna      	=> :P139_INDCDOR_CNTRTO_GSLNA)',
'                                                            , p_indcdor_cntrto_gslna      	=> decode(:P139_CNTRO_TPO, ''GSLNA'', ''S'',''N'')',
'                                                            , p_vlor_aux_lqdcion      	    => to_number(:P141_VLOR_AUX_LQDCION, ''999G999G999G999G999G999G990D99'')',
'                                                            , p_id_impsto_acto_slccndo 	    => :P139_ACTOS_SLCCNDOS',
'                                                             )',
'                ) a',
' where abs(a.vlor_lqddo)   > 0'))
,p_validation_type=>'EXISTS'
,p_error_message=>unistr('Proyecci\00F3n no valida')
,p_always_execute=>'Y'
,p_validation_condition=>'BTN_LIQUIDAR,BTN_REGISTRAR_LIQUIDACION'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(76856048160079118)
,p_name=>'Liquidacion de Rentas'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(76839248695079027)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76856584689079123)
,p_event_id=>wwv_flow_api.id(76856048160079118)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function Liquidacion_Rentas() {',
' ',
'    var v_app_id = $v(''pFlowId''),',
'        v_page_id = $v(''pFlowStepId''),',
'        v_session = $v(''pInstance'');',
' ',
'        var rs = await apex.server.process(''Liquidacion de Rentas'');',
'    //var url = `f?p=${v_app_id}:${v_page_id}:${v_session}:PRINT_REPORT=re_c_recibo_pago_rentas:NO:RP:::`;',
'    var url = `f?p=${v_app_id}:${v_page_id}:${v_session}:APPLICATION_PROCESS=Descargar_Documento:NO:RP:::`;       ',
'    if (rs.type == ''OK'') {',
'          let $waitPopup = apex.widget.waitPopup();      ',
'    ',
unistr('        //apex.message.showPageSuccess("\00A1Liquidaci\00F3n generada exitosamente!");'),
'        apex.message.showPageSuccess(rs.msg);',
'        ',
'        let a = document.createElement("a");',
'        document.body.appendChild(a);',
'        let v_blob = await fecth_async(url);',
'',
'        let v_url = window.URL.createObjectURL(v_blob);',
'        a.download = rs.nmbre_rprte + ".pdf";',
'        a.href = v_url;',
'        a.click();',
'        document.body.removeChild(a);',
'        window.URL.revokeObjectURL(v_url);',
'        //window.location.href = `f?p=${v_app_id}:${89}:${v_session}::NO:RP,138,139,141,142,143:::`;    ',
'        window.location.href = `f?p=${v_app_id}:${138}:${v_session}::NO:RP,138,139,141,142,143:::`;    ',
'        $waitPopup.remove();',
'',
'    }',
'    else {',
'        // First clear the errors',
'        apex.message.clearErrors();',
'',
'        // Now show new errors',
'        apex.message.showErrors([',
'            {',
'                type:       "error",',
'                location:   [ "page"],',
'                message:    rs.msg,',
'                unsafe:     false',
'            }',
'        ]);',
'    }',
'    ',
'    ',
'}',
' ',
unistr('apex.message.confirm( "\00BFEsta Seguro que desea realizar la liquidaci\00F3n?", function( okPressed ) {'),
'    if( okPressed ) {',
'       apex.item(''BTN_LIQUIDAR'').disable();',
'    // $("#BTN_LIQUIDAR").hide();',
'       Liquidacion_Rentas(); ',
'    }',
'});',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(106796542791926012)
,p_name=>'Registrar Rentas Autorizadas'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(76839645531079028)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(106796626301926013)
,p_event_id=>wwv_flow_api.id(106796542791926012)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function Registrar_liquidacion_Rentas() {',
' ',
'    var v_app_id = $v(''pFlowId''),',
'        v_page_id = $v(''pFlowStepId''),',
'        v_session = $v(''pInstance'');',
' ',
'      var rs = await apex.server.process(''Registrar_Rentas_Autorizadas'');',
'    // var url = `f?p=${v_app_id}:${v_page_id}:${v_session}:APPLICATION_PROCESS=Descargar_Documento:NO:RP:::`;       ',
'    if (rs.type == ''OK'') {',
'    ',
'        let $waitPopup = apex.widget.waitPopup();      ',
'    ',
'        apex.message.showPageSuccess(rs.msg);',
'',
'        //window.location.href = `f?p=${v_app_id}:${89}:${v_session}::NO:RP,138,139,141,142,143:::`;    ',
'        window.location.href = `f?p=${v_app_id}:${138}:${v_session}::NO:RP,138,139,141,142,143:::`;',
'        $waitPopup.remove();',
'',
'    }',
'    else {',
'        // First clear the errors',
'        apex.message.clearErrors();',
'',
'        // Now show new errors',
'        apex.message.showErrors([',
'            {',
'                type:       "error",',
'                location:   [ "page"],',
'                message:    rs.msg,',
'                unsafe:     false',
'            }',
'        ]);',
'    }',
'    ',
'    ',
'}',
' ',
unistr('apex.message.confirm( "\00BF Esta Seguro que desea registrar la liquidaci\00F3n ?", function( okPressed ) {'),
'    if( okPressed ) {',
'       apex.item(''BTN_REGISTRAR_LIQUIDACION'').disable();',
'       Registrar_liquidacion_Rentas(); ',
'    }',
'});',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10250998834341519)
,p_name=>'Al dar click Boton BTN_CNTRTO_EXTRNO'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(10328835127755583)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10251056392341520)
,p_event_id=>wwv_flow_api.id(10250998834341519)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var region = $("#region-flotante");',
'region.toggleClass("visible");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10251183415341521)
,p_name=>'Al dar click BTN_CERRAR'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(10316828170744929)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10251258081341522)
,p_event_id=>wwv_flow_api.id(10251183415341521)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#region-flotante").removeClass("visible");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76855661487079116)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Rentas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	v_cdgo_rspsta		         number;',
'	v_mnsje_rspsta		         varchar2(2000)	:= ''Inicio'';',
'    v_id_sjto_impsto             number;',
'    v_indcdor_cntrto_gslna       varchar2(1) := ''N'';',
'    v_indcdor_cntrto_ese         varchar2(1) := ''N'';',
'    v_nmro_rnta                  varchar2(30) ;',
'',
'begin',
'',
'       ',
'	-- Se registra el sujeto impuesto si no existe para rentas',
'    if :P138_ID_SJTO is not null then ',
'        begin ',
'            pkg_si_novedades_persona.prc_rg_sjto_impsto_sjto_exstnt (p_cdgo_clnte        => :F_CDGO_CLNTE,',
'                                                                     p_id_sjto           => :P138_ID_SJTO,',
'                                                                     p_id_impsto         => :P138_ID_IMPSTO,',
'                                                                     p_id_usrio          => :F_ID_USRIO,',
'                                                                     o_id_sjto_impsto    => v_id_sjto_impsto,',
'                                                                     o_cdgo_rspsta		 => v_cdgo_rspsta,',
'                                                                     o_mnsje_rspsta		 => v_mnsje_rspsta);',
'             if(v_cdgo_rspsta <> 0) then',
'                 raise_application_error(-20001, ''1. Error: '' || v_mnsje_rspsta);',
'             end if;',
'            ',
'        exception',
'            when others then ',
'                rollback;',
'		        raise_application_error(-20001, ''2. '' ||v_mnsje_rspsta);',
'        end;',
'    else',
'        v_id_sjto_impsto    := :P138_ID_SJTO_IMPSTO;',
'    end if;',
'    	',
'    if v_id_sjto_impsto is not null then',
'        ',
'        if :P139_CNTRO_TPO is not null then ',
'            if :P139_CNTRO_TPO = ''GSLNA'' then ',
'                v_indcdor_cntrto_gslna  := ''S'';',
'            end if;',
'',
'            if :P139_CNTRO_TPO = ''ESE'' then ',
'                v_indcdor_cntrto_ese  := ''S'';',
'            end if;        ',
'        else',
'            v_indcdor_cntrto_gslna  := ''N'';',
'            v_indcdor_cntrto_ese    := ''N'';',
'            --:P141_VLOR_CNCTRTO_ESE  := null;',
'            :P141_VLOR_CNTRTO_ESE  := null;',
'       end if;',
'       ',
'        begin',
'       ',
'            pkg_gi_rentas.prc_rg_proyeccion_renta(p_cdgo_clnte				=> :F_CDGO_CLNTE',
'                                                , p_id_impsto				=> :P138_ID_IMPSTO',
'                                                , p_id_impsto_sbmpsto		=> :P138_ID_IMPSTO_SBMPSTO',
'                                                , p_id_sjto_impsto			=> v_id_sjto_impsto',
'                                                , p_id_rnta					=> :P138_ID_RNTA',
'                                                , p_actos_cncpto			=> :P143_CNCPTOS',
'                                                , p_id_sbmpsto_ascda		=> :P139_ID_IMPSTO_ASCDA',
'                                                , p_txto_ascda				=> :P139_TXTO_ASCDA',
'                                                , p_fcha_expdcion			=> nvl(:P141_FCHA_EXPDCION, sysdate)',
'                                                , p_vlor_bse_grvble			=> to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                                , p_indcdor_usa_mxto		=> nvl(:P139_INDCDOR_USA_MXTO,nvl(:P138_USA_INDCDOR_MXTO,''N''))',
'                                                , p_indcdor_usa_extrnjro	=> nvl(:P139_INDCDOR_USA_EXTRNJRO,nvl(:P138_USA_INDCDOR_EXTRNJRO,''N''))',
'                                                , p_fcha_vncmnto_dcmnto		=> :P141_FCHA_VNCMNTO',
'                                                , p_indcdor_lqdccion_adcnal => nvl(:P141_INDCDOR_LDCCION_ADCNAL,''N'')',
'                                                , p_id_rnta_antrior         => :P141_ID_RNTA_ANTRIOR',
'                                                , p_indcdor_exncion         => nvl(:P141_INDCDOR_EXNCION, ''N'')',
'                                                , p_indcdor_cntrto_gslna    => nvl(v_indcdor_cntrto_gslna,''N'')',
'                                                , p_indcdor_cntrto_ese      => nvl(v_indcdor_cntrto_ese,''N'')',
'                                                , p_vlor_cntrto_ese         => to_number(:P141_VLOR_CNTRTO_ESE, ''999G999G999G999G999G999G990D99'')',
'                                                , p_json_mtdtos             => :P139_JSON_MTDTOS',
'                                                , p_entrno					=> ''PRVDO''',
'                                                , p_id_entdad               => nvl(:P138_ID_ENTDAD, :P138_ID_ENTDAD_USRIO)',
'                                                , p_id_usrio				=> :F_ID_USRIO ',
'                                                , p_id_rnta_ascda           => :P139_ID_RNTA_ASCDA',
'                                                , p_id_sjto_scrsal          => :P138_ID_SJTO_SCRSAL',
'                                                , p_vlor_aux_lqdcion		=> to_number(:P141_VLOR_AUX_LQDCION, ''999G999G999G999G999G999G990D99'')  --Req0026210',
'                                                , o_id_rnta					=> :P143_ID_RNTA',
'                                                , o_cdgo_rspsta				=> v_cdgo_rspsta',
'                                                , o_mnsje_rspsta			=> v_mnsje_rspsta',
'                                                );',
'',
'            if(v_cdgo_rspsta = 0) then',
'                select nmro_rnta',
'                  into v_nmro_rnta',
'                  from gi_g_rentas',
'                 where id_rnta  = :P143_ID_RNTA;',
'                 ',
'                 ',
unistr('                :P143_RSPSTA := ''\00A1Su solicitud de liquidaci\00F3n ha sido registrada con \00E9xito! A continuaci\00F3n, un funcionario debe revisar y '),
unistr('                aprobar su liquidaci\00F3n. Al ser aprobada usted podr\00E1 descargar el recibo de pago. No. Liquidaci\00F3n '' || v_nmro_rnta || ''.'';'),
'                ',
'            else',
'                rollback;',
'                :P143_ID_RNTA    := null;',
'                raise_application_error(-20001, ''3. Error: '' || v_mnsje_rspsta);',
'                    ',
'            end if;',
'        exception',
'            when others then ',
'                rollback;',
'                :P143_ID_RNTA    := null;',
'                raise_application_error(-20001, ''4. Error: '' || v_mnsje_rspsta || '' - '' || sqlerrm);',
'        end;',
'        ',
'    else',
'        rollback;',
'        v_mnsje_rspsta    := ''No se registro el sujeto impuesto'' ;',
'        raise_application_error(-20001, ''5. Error: '' || v_mnsje_rspsta || '' - '' || sqlerrm);',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'&P143_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76855205385079116)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Informaci\00F3n de la Renta')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P138_ID_SJTO_IMPSTO is not null and :P138_ID_SJTO is null then ',
'        select a.idntfccion_sjto_frmtda',
'             , upper(a.nmbre_pais || '' '' || a.nmbre_dprtmnto || '' '' || a.nmbre_mncpio)',
'             , a.drccion',
'             , a.cdgo_sjto_tpo',
'             , b.nmbre_rzon_scial',
'            , :P138_ID_IMPSTO_SBMPSTO',
'             , :P139_ID_IMPSTO_ACTO',
'             , :P139_ID_IMPSTO_ASCDA',
'             , :P139_TXTO_ASCDA',
'             , :P141_FCHA_EXPDCION',
'             , :P141_FCHA_VNCMNTO        ',
'             , (select txto_bse_grvble',
'                  from df_i_impuestos_acto m ',
'                  join gi_g_rentas_acto    n on m.id_impsto_acto = n.id_impsto_acto',
'                 where n.id_rnta           = :P138_ID_RNTA',
'                   and rownum = 1) txto_bse_grvble',
'             , :P141_VLOR_BSE_GRVBLE',
'             , :P139_INDCDOR_USA_EXTRNJRO',
'             , :P139_INDCDOR_USA_MXTO',
'             , nvl(:P141_INDCDOR_LDCCION_ADCNAL,''N'')',
'             , nvl(:P139_INDCDOR_CNTRTO_GSLNA,''N'')',
'             , :P141_INDCDOR_EXNCION',
'             , :P138_CDGO_RNTA_ESTDO',
'             , :P141_VLOR_CNTRTO_ESE',
'             ,  decode(:P139_CNTRO_TPO, ''ESE'' , ''ESE'',decode(:P139_CNTRO_TPO,''GSLNA'',''Gasolina'',''''))',
'             , :P138_ID_SJTO_SCRSAL',
'          into :P143_IDNTFCCION_SJTO_FRMTDA',
'             , :P143_UBCCION',
'             , :P143_DRCCION',
'             , :P143_CDGO_SJTO_TPO',
'             , :P143_NMBRE_RZON_SCIAL',
'             , :P143_ID_IMPSTO_SBMPSTO',
'             , :P143_ID_IMPSTO_ACTO',
'             , :P143_ID_IMPSTO_ASCDA',
'             , :P143_TXTO_ASCDA',
'             , :P143_FCHA_EXPDCION',
'             , :P143_FCHA_VNCMNTO',
'             , :P143_TXTO_BSE',
'             , :P143_BSE',
'             , :P143_INDCDOR_EXTRNJRO',
'             , :P143_INDCDOR_MXTO',
'             , :P143_INDCDOR_LDCCION_ADCNAL',
'             , :P143_INDCDOR_CNTRTO_GSLNA',
'             , :P143_INDCDOR_EXNCION',
'             , :P143_CDGO_RNTA_ESTDO',
'             , :P143_VLOR_CNTRTO_ESE',
'             , :P143_CNTRO_TPO',
'             , :P143_ID_SJTO_SCRSAL',
'           from V_SI_I_SUJETOS_IMPUESTO    a',
'            join si_i_personas              b on a.id_sjto_impsto = b.id_sjto_impsto',
'          where a.id_sjto_impsto           = :P138_ID_SJTO_IMPSTO;',
'                            ',
'    elsif :P138_ID_SJTO is not null then ',
'        select a.idntfccion_sjto_frmtda',
'             , upper(a.nmbre_pais || '' '' || a.nmbre_dprtmnto || '' '' || a.nmbre_mncpio)',
'             , a.drccion',
'             , a.cdgo_sjto_tpo',
'             , b.nmbre_rzon_scial',
'             , :P138_ID_IMPSTO_SBMPSTO',
'             , :P139_ID_IMPSTO_ACTO',
'             , :P139_ID_IMPSTO_ASCDA',
'             , :P139_TXTO_ASCDA',
'             , :P141_FCHA_EXPDCION',
'             , :P141_FCHA_VNCMNTO        ',
'             , (select txto_bse_grvble',
'                  from df_i_impuestos_acto m ',
'                  join gi_g_rentas_acto    n on m.id_impsto_acto = n.id_impsto_acto',
'                 where n.id_rnta           = :P138_ID_RNTA',
'                   and rownum = 1) txto_bse_grvble',
'             , :P141_VLOR_BSE_GRVBLE',
'             , :P139_INDCDOR_USA_EXTRNJRO',
'             , :P139_INDCDOR_USA_MXTO',
'             , nvl(:P141_INDCDOR_LDCCION_ADCNAL,''N'')',
'             , nvl(:P139_INDCDOR_CNTRTO_GSLNA,''N'')',
'             , :P141_INDCDOR_EXNCION',
'             , :P141_CDGO_RNTA_ESTDO',
'             , :P141_VLOR_CNTRTO_ESE',
'             ,  decode(:P139_CNTRO_TPO, ''ESE'' , ''ESE'',decode(:P139_CNTRO_TPO,''GSLNA'',''Gasolina'',''''))',
'             , :P138_ID_SJTO_SCRSAL',
'          into :P143_IDNTFCCION_SJTO_FRMTDA',
'             , :P143_UBCCION',
'             , :P143_DRCCION',
'             , :P143_CDGO_SJTO_TPO',
'             , :P143_NMBRE_RZON_SCIAL',
'             , :P143_ID_IMPSTO_SBMPSTO',
'             , :P143_ID_IMPSTO_ACTO',
'             , :P143_ID_IMPSTO_ASCDA',
'             , :P143_TXTO_ASCDA',
'             , :P143_FCHA_EXPDCION',
'             , :P143_FCHA_VNCMNTO',
'             , :P143_TXTO_BSE',
'             , :P143_BSE',
'             , :P143_INDCDOR_EXTRNJRO',
'             , :P143_INDCDOR_MXTO',
'             , :P143_INDCDOR_LDCCION_ADCNAL',
'             , :P143_INDCDOR_CNTRTO_GSLNA',
'             , :P143_INDCDOR_EXNCION',
'             , :P143_CDGO_RNTA_ESTDO',
'             , :P143_VLOR_CNTRTO_ESE',
'             , :P143_CNTRO_TPO',
'             , :P143_ID_SJTO_SCRSAL',
'           from V_SI_I_SUJETOS_IMPUESTO    a',
'           join si_i_personas              b on a.id_sjto_impsto = b.id_sjto_impsto',
'          where a.id_sjto_impsto           = (select max(id_sjto_impsto) from si_i_sujetos_impuesto where id_sjto = :P138_ID_SJTO) ;',
'    else',
'        :P143_IDNTFCCION_SJTO_FRMTDA    := null;',
'        :P143_UBCCION                   := null;',
'        :P143_DRCCION                   := null;',
'        :P143_CDGO_SJTO_TPO             := null;',
'        :P143_NMBRE_RZON_SCIAL          := null;',
'        :P143_ID_IMPSTO_SBMPSTO         := null;',
'        :P143_ID_IMPSTO_ACTO            := null;',
'        :P143_FCHA_EXPDCION             := null;',
'        :P143_BSE                       := null;',
'        :P143_INDCDOR_EXTRNJRO          := null;',
'        :P143_INDCDOR_MXTO              := null;',
'        :P143_CDGO_RNTA_ESTDO           := null;',
'        :P143_VLOR_CNTRTO_ESE           := null;',
'        :P143_CNTRO_TPO                 := null;',
'        :P143_ID_SJTO_SCRSAL            := null;',
'    end if;',
'exception',
'    when others then',
'        :P143_IDNTFCCION_SJTO_FRMTDA    := null;',
'        :P143_UBCCION                   := null;',
'        :P143_DRCCION                   := null;',
'        :P143_CDGO_SJTO_TPO             := null;',
'        :P143_NMBRE_RZON_SCIAL          := null;',
'        :P143_ID_IMPSTO_SBMPSTO         := null;',
'        :P143_ID_IMPSTO_ACTO            := null;',
'        :P143_FCHA_EXPDCION             := null;',
'        :P143_BSE                       := null;',
'        :P143_INDCDOR_EXTRNJRO          := null;',
'        :P143_INDCDOR_MXTO              := null;',
'        :P143_CDGO_RNTA_ESTDO           := null;',
'        :P143_VLOR_CNTRTO_ESE           := null;',
'        :P143_CNTRO_TPO                 := null;',
'        :P143_ID_SJTO_SCRSAL            := null;',
' ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76826201420950319)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta de Informaci\00F3n de liquidaciones anteriores')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select nvl(count(id_rnta),0) ',
'         , to_char(nvl(sum(vlor_bse_grvble),0) , ''999G999G999G999G990'')',
'         , to_char(nvl(sum(vlor_bse_grvble),0)  + to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'') , ''999G999G999G999G990'')',
'     into :P143_NMRO_LQDCION_ANTRIOR',
'        , :P143_TTAL_LQDCION_ANTRIOR',
'        , :P143_NVA_BSE',
'     from v_gi_g_rentas',
'    where id_rnta                 = (select id_rnta from json_table(:P141_ID_RNTA_ANTRIOR,''$[*]''columns id_rnta path ''$.ID_RNTA''))',
'      or id_rnta_antrior          = (select id_rnta from json_table(:P141_ID_RNTA_ANTRIOR,''$[*]''columns id_rnta path ''$.ID_RNTA''))',
'      and cdgo_rnta_estdo         in (''LQD'', ''APB'')',
'      and cdgo_mvnt_fncro_estdo    = ''NO'';',
'exception ',
'    when others then ',
'        :P143_NMRO_LQDCION_ANTRIOR  := 0;',
'        :P143_TTAL_LQDCION_ANTRIOR  := 0;',
'        :P143_NVA_BSE  := 0;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P143_INDCDOR_LDCCION_ADCNAL'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'S'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79882048148484504)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consular de Reporte de Recibo de Rentas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_rprte',
'      into :P143_ID_RPRTE',
'      from gn_d_reportes   a',
'       join gn_d_reporte_cliente    b on a.id_rprte = b.id_rprte',
'       and cdgo_clnte              = :F_CDGO_CLNTE',
'     where cdgo_rprte_grpo = ''RRV'' ',
'       and a.indcdor_gnrco = ''N'';',
'exception',
'    when no_data_found then ',
'        begin ',
'            select a.id_rprte',
'              into :P143_ID_RPRTE',
'              from gn_d_reportes   a',
'             where cdgo_rprte_grpo = ''RRV'' ',
'               and a.indcdor_gnrco = ''S''',
'               and rownum = 1;',
'         exception',
'             when others then ',
'                :P143_ID_RPRTE := NULL;',
'         end;',
'    when others then ',
'        :P143_ID_RPRTE := NULL;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10316292271743022)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Informacion Contrato Externo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'        select   a.nmro_cntrto',
'                ,a.objto',
'                ,a.fcha_frma',
'                ,a.fcha_incio_cntrto',
'                ,a.fcha_fin',
'                ,a.vlor_cntrto_inclye_iva',
'                ,a.vlor_cntrto_sin_iva',
'                ,a.vlor_iva',
'                ,a.tpo_cntrto',
'                ,a.drcion_dias',
'                ,a.dscrpcion_frma_pgo',
'                ,a.drcion',
'                ,a.cdgo_dpndncia ||'' ''|| a.nmbre_dpndncia',
'                ,a.prmer_nmbre || '' '' || a.sgndo_nmbre || '' '' || a.prmer_aplldo || '' '' || a.sgndo_aplldo',
'                ,a.drccion',
'                ,a.tlfno',
'                ,a.correo ',
'                ,decode(a.tpo_prsna,''N'', ''Natural'', ''J'', ''Juridica'', ''Otro'') tpo_prsna',
'                ,(select dscrpcion_idntfccion_tpo from df_s_identificaciones_tipo where cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo)',
'                ,a.nmro_idntfccion ',
'                , (select nmbre_dprtmnto from df_s_departamentos where cdgo_dprtmnto  = a.cdgo_dprtmnto ) nmbre_dprtmnto',
'                , (select nmbre_mncpio   from df_s_municipios where cdgo_mncpio =  a.cdgo_mncpio)  nmbre_mncpio ',
'                ,a.tpo_rgmen',
'                ,a.estdo',
'                ,a.rspnsble_de_iva',
'                ,a.cnsctvo_rp',
'                ,a.fcha_rp',
'            into',
'                 :P143_NMRO_CNTRTO_EXT',
'                ,:P143_OBJTO',
'                ,:P143_FCHA_FRMA',
'                ,:P143_FCHA_INCIO_CNTRTO',
'                ,:P143_FCHA_FIN',
'                ,:P143_VLOR_CNTRTO_INCLYE_IVA',
'                ,:P143_VLOR_CNTRTO_SIN_IVA',
'                ,:P143_VLOR_IVA',
'                ,:P143_TPO_CNTRTO',
'                ,:P143_DRCION_DIAS',
'                ,:P143_DSCRPCION_FRMA_PGO',
'                ,:P143_DRCION ',
'                ,:P143_NMBRE_DPNDNCIA',
'                ,:P143_NMBRE ',
'                ,:P143_DRCCION',
'                ,:P143_TLFNO_EXT',
'                ,:P143_CORREO_EXT',
'                ,:P143_TPO_PRSNA',
'                ,:P143_CDGO_IDNTFCCION_TPO',
'                ,:P143_NMRO_IDNTFCCION',
'                ,:P143_NMBRE_DPRTMNTO',
'                ,:P143_NMBRE_MNCPIO',
'                ,:P143_TPO_RGMEN',
'                ,:P143_ESTDO',
'                ,:P143_RSPNSBLE_DE_IVA ',
'                ,:P143_CNSCTVO_RP        ',
'                ,:P143_FCHA_RP   ',
'        from gi_g_rentas_contrato_externo a',
'            where a.id_rnta_cntrto_extrno =  :P138_ID_RNTA_CNTRTO_EXTRNO;',
'exception',
'    when others then',
'        :P143_NMRO_CNTRTO_EXT				:= null;',
'        :P143_OBJTO                         := null;',
'        :P143_FCHA_FRMA                     := null;',
'        :P143_FCHA_FIN                      := null;',
'        :P143_FCHA_INCIO_CNTRTO             := null;',
'        :P143_VLOR_CNTRTO_INCLYE_IVA        := null;',
'        :P143_VLOR_CNTRTO_SIN_IVA           := null;',
'        :P143_VLOR_IVA                      := null;',
'        :P143_TPO_CNTRTO                    := null;',
'        :P143_DRCION_DIAS                   := null;',
'        :P143_DSCRPCION_FRMA_PGO            := null;',
'        :P143_DRCION                        := null;',
'        :P143_NMBRE_DPNDNCIA                := null;',
'        :P143_NMBRE                         := null;',
'        :P143_DRCCION                       := null;',
'        :P143_TLFNO_EXT                     := null;',
'        :P143_CORREO_EXT                    := null;',
'        :P143_TPO_PRSNA                     := null;',
'        :P143_CDGO_IDNTFCCION_TPO           := null;',
'        :P143_NMRO_IDNTFCCION               := null;',
'        :P143_NMBRE_DPRTMNTO                := null;',
'        :P143_NMBRE_MNCPIO                  := null;',
'        :P143_TPO_RGMEN                     := null;',
'        :P143_ESTDO                         := null; ',
'        :P143_RSPNSBLE_DE_IVA               := null; ',
'        :P143_CNSCTVO_RP                    := null; ',
'        :P143_FCHA_RP                       := null; ',
'end;',
'',
' '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P138_ID_RNTA_CNTRTO_EXTRNO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76854800814079112)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Liquidacion de Rentas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	v_cdgo_rspsta		         number;',
'	v_mnsje_rspsta		         varchar2(2000);',
'    v_id_sjto_impsto             number;',
'    v_indcdor_cntrto_gslna       varchar2(1) := ''N'';',
'    v_indcdor_cntrto_ese         varchar2(1) := ''N'';',
'    v_nmro_rnta                  varchar2(30) ;',
'    v_mensaje                    varchar2(400);',
'    v_nmbre_trbto                df_i_impuestos_subimpuesto.nmbre_impsto_sbmpsto%type;',
'    v_ttal_adjnto                number;',
'    v_ttal_adjnto_oblgtrio       number;',
'    v_error_prsnlzdo             varchar2(2000);',
'    v_exception_prsnlzdo         exception;',
'    ',
'begin',
'',
'  if :P138_INDCDOR_RQRE_ADJNTO = ''S'' then',
'',
'        -- Se buscan si hay parametrizados adjuntos obligatorios 29/06/2023 ',
'         select count(1)',
'         into v_ttal_adjnto_oblgtrio',
'         from  table (pkg_gi_rentas.fnc_tipos_adjunto ( p_cdgo_clnte             => :F_CDGO_CLNTE,',
'                                                       p_id_impsto               => :P138_ID_IMPSTO,',
'                                                       p_id_impsto_sbmpsto       => :P138_ID_IMPSTO_SBMPSTO,',
'                                                       p_id_impsto_acto          => :P139_ID_IMPSTO_ACTO,',
'                                                      p_id_impsto_acto_slccndo  => :P139_ACTOS_SLCCNDOS )) a',
'         where a.indcdor_oblgtrio            = ''S'';',
'',
'        if v_ttal_adjnto_oblgtrio > 0 then',
'            --Se buscan si los adjuntos obligatorios estan cargados',
'            select count(1)',
'            into v_ttal_adjnto ',
'            from table (pkg_gi_rentas.fnc_tipos_adjunto ( p_cdgo_clnte          => :F_CDGO_CLNTE,',
'                                                           p_id_impsto           => :P138_ID_IMPSTO,',
'                                                           p_id_impsto_sbmpsto   => :P138_ID_IMPSTO_SBMPSTO,',
'                                                           p_id_impsto_acto      => :P139_ID_IMPSTO_ACTO ,',
'                                                          p_id_impsto_acto_slccndo  => :P139_ACTOS_SLCCNDOS )) a	     ',
'             join apex_collections			    b on b.collection_name = ''ADJUNTOS_RENTA''',
'              and a.id_adjnto_tpo               = b.n001',
'              and a.indcdor_oblgtrio            = ''S''',
'              and dbms_lob.getlength(blob001)   > 10;',
'',
'              --insert into muerto (v_001,n_001,t_001) values (''1111'',v_ttal_adjnto ,systimestamp);commit;',
'',
'            if v_ttal_adjnto_oblgtrio > v_ttal_adjnto then ',
unistr('                :P143_RSPSTA := ''\00A1 Excepci\00F3n al consultar los adjuntos obligatorios !'';'),
unistr('                v_error_prsnlzdo := ''Excepci\00F3n al consultar los adjuntos obligatorios, \00A1Por favor revise que esten cargados todos los adjuntos obligatorios!'';'),
'                raise v_exception_prsnlzdo;',
'               -- insert into muerto (v_001,v_002,n_001,t_001) values (''111'','' v_ttal_adjnto > 0 '',v_ttal_adjnto ,systimestamp);commit;',
unistr('                --raise_application_error(-20001, ''Excepci\00F3n al consultar los adjuntos obligatorios, \00A1Por favor revise que esten cargados todos los adjuntos obligatorios! '' );'),
'            end if;',
'        end if;',
'    end if;',
'',
'    if :P143_CNCPTOS is null then',
unistr('        :P143_RSPSTA := ''\00A1 Excepci\00F3n al consultar los conceptos seleccionados !'';'),
unistr('        v_error_prsnlzdo := ''Excepci\00F3n al consultar los conceptos seleccionados'';'),
'        raise v_exception_prsnlzdo; ',
'    end if;',
'',
'	if :P138_ID_SJTO is not null and :P138_EXSTE_OTRO_IMPSTO = ''S'' then ',
'        begin ',
'           pkg_si_novedades_persona.prc_rg_sjto_impsto_sjto_exstnt (p_cdgo_clnte        => :F_CDGO_CLNTE,',
'                                                                     p_id_sjto           => :P138_ID_SJTO,',
'                                                                     p_id_impsto         => :P138_ID_IMPSTO,',
'                                                                     p_id_usrio          => :F_ID_USRIO,',
'                                                                     o_id_sjto_impsto    => v_id_sjto_impsto,',
'                                                                     o_cdgo_rspsta		 => v_cdgo_rspsta,',
'                                                                     o_mnsje_rspsta		 => v_mnsje_rspsta);',
'            ',
'            if v_cdgo_rspsta <> 0 then',
unistr('                :P143_RSPSTA := ''\00A1Error al Registrar el Sujeto!'';'),
'                apex_json.open_object;',
'                apex_json.write(''type'', ''ERROR'');',
'                apex_json.write(''msg'', ''Error al Registrar el Sujeto'' || v_mnsje_rspsta);        ',
'                apex_json.close_object;',
'            end if;',
'        exception',
'            when others then ',
'                apex_json.open_object;',
'                apex_json.write(''type'', ''ERROR'');',
'                apex_json.write(''msg'', sqlerrm);        ',
'                apex_json.close_object;		        ',
'        end;',
'    else',
'        v_id_sjto_impsto    := :P138_ID_SJTO_IMPSTO;',
'    end if;',
'   ',
'   if v_id_sjto_impsto is not null then',
'    ',
'        if :P139_CNTRO_TPO is not null then ',
'            if :P139_CNTRO_TPO = ''GSLNA'' then ',
'                v_indcdor_cntrto_gslna  := ''S'';',
'            end if;',
'',
'            if :P139_CNTRO_TPO = ''ESE'' then ',
'                v_indcdor_cntrto_ese  := ''S'';',
'            end if;        ',
'        else',
'            v_indcdor_cntrto_gslna  := ''N'';',
'            v_indcdor_cntrto_ese    := ''N'';',
'            --:P141_VLOR_CNCTRTO_ESE  := null;',
'            :P141_VLOR_CNTRTO_ESE  := null;',
'       end if;',
'       ',
unistr('        -- Registro de la proyecci\00F3n de rentas'),
'        pkg_gi_rentas.prc_re_liquidacion_renta (p_cdgo_clnte                => :F_CDGO_CLNTE',
'                                              , p_id_impsto                 => :P138_ID_IMPSTO',
'                                              , p_id_impsto_sbmpsto         => :P138_ID_IMPSTO_SBMPSTO',
'                                              , p_id_sjto_impsto            =>  v_id_sjto_impsto',
'                                              , p_json_impsto_acto_cncpto   => :P143_CNCPTOS',
'                                              , p_id_sbmpsto_ascda          => :P139_ID_IMPSTO_ASCDA',
'                                              , p_txto_ascda                => :P139_TXTO_ASCDA',
'                                              , p_fcha_expdcion             => nvl(:P141_FCHA_EXPDCION, sysdate)',
'                                              , p_vlor_bse_grvble           => to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                              , p_indcdor_usa_extrnjro      => nvl(:P139_INDCDOR_USA_EXTRNJRO,nvl(:P138_USA_INDCDOR_EXTRNJRO,''N''))',
'                                              , p_indcdor_usa_mxto          => nvl(:P139_INDCDOR_USA_MXTO,nvl(:P138_USA_INDCDOR_MXTO,''N''))',
'                                              , p_fcha_vncmnto_dcmnto       => :P141_FCHA_VNCMNTO',
'                                              , p_id_usrio                  => :F_ID_USRIO',
'                                               , p_entrno                    => ''PRVDO''',
'                                              , p_id_entdad                 =>  nvl(:P138_ID_ENTDAD, :P138_ID_ENTDAD_USRIO)',
'                                              ',
'                                                --##',
'												, p_indcdor_lqdccion_adcnal => nvl(:P141_INDCDOR_LDCCION_ADCNAL,''N'')',
'												, p_id_rnta_antrior         => :P141_ID_RNTA_ANTRIOR',
'												, p_indcdor_cntrto_gslna    => nvl(v_indcdor_cntrto_gslna,''N'')',
'												, p_indcdor_cntrto_ese      => nvl(v_indcdor_cntrto_ese,''N'')',
'												, p_vlor_cntrto_ese         => to_number(:P141_VLOR_CNTRTO_ESE, ''999G999G999G999G999G999G990D99'')',
'												, p_json_mtdtos             => :P139_JSON_MTDTOS',
'                                                , p_id_rnta_ascda           => :P139_ID_RNTA_ASCDA',
'                                                , p_id_sjto_scrsal          => :P138_ID_SJTO_SCRSAL',
'                                                , p_id_rnta_cntrto_extrno   => :P138_ID_RNTA_CNTRTO_EXTRNO --Req0026403',
'                                        ',
'                                             --##  ',
'                                            ',
'                                              , p_id_rnta                   => :P143_ID_RNTA',
'                                              , p_vlor_aux_lqdcion		    => to_number(:P141_VLOR_AUX_LQDCION, ''999G999G999G999G999G999G990D99'')  --Req0026210',
'                                              , o_id_dcmnto                 => :P143_ID_DCMNTO',
'                                              , o_nmro_dcmnto               => :P143_NMRO_DCMNTO',
'                                              , o_cdgo_rspsta               => v_cdgo_rspsta',
'                                              , o_mnsje_rspsta              => v_mnsje_rspsta',
'                                             );',
'',
'',
'        if v_cdgo_rspsta = 0 then',
'        ',
'            select nmro_rnta',
'            into v_nmro_rnta',
'            from gi_g_rentas',
'            where id_rnta  = :P143_ID_RNTA;',
'            ',
'            ',
'            select nmbre_impsto_sbmpsto          d ',
'             into  v_nmbre_trbto',
'             from df_i_impuestos_subimpuesto    a',
'            where cdgo_clnte                    = :F_CDGO_CLNTE',
'              and id_impsto                     = :P138_ID_IMPSTO',
'              and id_impsto_sbmpsto             = :P138_ID_IMPSTO_SBMPSTO;',
'                 ',
unistr('            v_mensaje := ''\00A1Liquidaci\00F3n Generada Satisfactoriamente! No. Liquidaci\00F3n '' || v_nmro_rnta || ''.'';'),
'            ',
'            apex_json.open_object;',
'            apex_json.write(''type'', ''OK'');    ',
'            apex_json.write(''msg'', v_mensaje);    ',
'            apex_json.write(''nmbre_rprte'', v_nmbre_trbto||''_'' || :P143_NMRO_DCMNTO);  ',
'            apex_json.close_object;',
'        else',
'            :P143_RSPSTA := ''Error al Liquidar'' || v_mnsje_rspsta;',
'            apex_json.open_object;',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'', ''Error al Liquidar. '' || v_mnsje_rspsta);        ',
'            apex_json.close_object;',
'        end if;',
'    end if; ',
'    ',
'    exception ',
'        when others then ',
'            apex_json.open_object;',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'', sqlerrm);        ',
'            apex_json.close_object;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'&P143_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6212220943084403)
,p_process_sequence=>20
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
'                       ',
'',
'    --BUSCAMOS LOS DATOS DE PLANTILLA DE REPORTES',
'    select /*+ RESULT_CACHE */',
'           r.*',
'      into v_gn_d_reportes ',
'      from gn_d_reportes r',
'     where r.id_rprte = :P143_ID_RPRTE;',
'',
'    --SETEAMOS EN SESSION LOS ITEMS NECESARIOS PARA GENERAR EL ARCHIVO     ',
'    apex_util.set_session_state(''F_CDGO_CLNTE'', :F_CDGO_CLNTE);',
'    apex_util.set_session_state(''F_FRMTO_MNDA'', ''FM$999G999G999G999G999G999G990'');',
'    apex_util.set_session_state(''P2_PRMTRO_1'', to_number(:P143_ID_RNTA));',
'    apex_util.set_session_state(''P2_PRMTRO_2'', to_number(:P143_ID_DCMNTO));    ',
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
,p_process_error_message=>'Error al generar el documento '
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('\00A1Documento Generado Exitosamente!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(106796434784926011)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar_Rentas_Autorizadas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	v_cdgo_rspsta		         number;',
'	v_mnsje_rspsta		         varchar2(2000)	:= ''Inicio'';',
'    v_id_sjto_impsto             number;',
'    v_indcdor_cntrto_gslna       varchar2(1) := ''N'';',
'    v_indcdor_cntrto_ese         varchar2(1) := ''N'';',
'    v_nmro_rnta                  varchar2(30) ;',
'    v_mensaje                    varchar2(600);',
'    v_ttal_adjnto                number;',
'    v_ttal_adjnto_oblgtrio       number;',
'    v_error_prsnlzdo             varchar2(2000);',
'    v_exception_prsnlzdo         exception;',
'begin',
'',
'   if :P138_INDCDOR_RQRE_ADJNTO = ''S'' then',
'',
'        -- Se buscan si hay parametrizados adjuntos obligatorios 29/06/2023 ',
'         select count(1)',
'         into v_ttal_adjnto_oblgtrio',
'         from  table (pkg_gi_rentas.fnc_tipos_adjunto ( p_cdgo_clnte          => :F_CDGO_CLNTE,',
'                                                       p_id_impsto           => :P138_ID_IMPSTO,',
'                                                       p_id_impsto_sbmpsto   => :P138_ID_IMPSTO_SBMPSTO,',
'                                                       p_id_impsto_acto      => :P139_ID_IMPSTO_ACTO )) a	     ',
'         where a.indcdor_oblgtrio            = ''S'';',
'',
'        if v_ttal_adjnto_oblgtrio > 0 then',
'            --Se buscan si los adjuntos obligatorios estan cargados',
'            select count(1)',
'            into v_ttal_adjnto ',
'            from table (pkg_gi_rentas.fnc_tipos_adjunto ( p_cdgo_clnte          => :F_CDGO_CLNTE,',
'                                                           p_id_impsto           => :P138_ID_IMPSTO,',
'                                                           p_id_impsto_sbmpsto   => :P138_ID_IMPSTO_SBMPSTO,',
'                                                           p_id_impsto_acto      => :P139_ID_IMPSTO_ACTO )) a	     ',
'             join apex_collections			    b on b.collection_name = ''ADJUNTOS_RENTA''',
'              and a.id_adjnto_tpo               = b.n001',
'              and a.indcdor_oblgtrio            = ''S''',
'              and dbms_lob.getlength(blob001)   > 10;',
'',
'              --insert into muerto (v_001,n_001,t_001) values (''1111'',v_ttal_adjnto ,systimestamp);commit;',
'',
'            if v_ttal_adjnto_oblgtrio > v_ttal_adjnto then ',
unistr('                :P143_RSPSTA := ''\00A1 Excepci\00F3n al consultar los adjuntos obligatorios !'';'),
unistr('                v_error_prsnlzdo := ''Excepci\00F3n al consultar los adjuntos obligatorios, \00A1Por favor revise que esten cargados todos los adjuntos obligatorios!'';'),
'                raise v_exception_prsnlzdo;',
'               -- insert into muerto (v_001,v_002,n_001,t_001) values (''111'','' v_ttal_adjnto > 0 '',v_ttal_adjnto ,systimestamp);commit;',
unistr('                --raise_application_error(-20001, ''Excepci\00F3n al consultar los adjuntos obligatorios, \00A1Por favor revise que esten cargados todos los adjuntos obligatorios! '' );'),
'            end if;',
'        end if;',
'    end if;',
'',
'    if :P143_CNCPTOS is null then',
unistr('        :P143_RSPSTA := ''\00A1 Excepci\00F3n al consultar los conceptos seleccionados !'';'),
unistr('        v_error_prsnlzdo := ''Excepci\00F3n al consultar los conceptos seleccionados'';'),
'        raise v_exception_prsnlzdo; ',
'    end if;',
'  ',
'       ',
'	-- Se registra el sujeto impuesto si no existe para rentas',
'     if :P138_ID_SJTO is not null and :P138_EXSTE_OTRO_IMPSTO = ''S'' then ',
'        begin ',
'            pkg_si_novedades_persona.prc_rg_sjto_impsto_sjto_exstnt (p_cdgo_clnte        => :F_CDGO_CLNTE,',
'                                                                     p_id_sjto           => :P138_ID_SJTO,',
'                                                                     p_id_impsto         => :P138_ID_IMPSTO,',
'                                                                     p_id_usrio          => :F_ID_USRIO,',
'                                                                     o_id_sjto_impsto    => v_id_sjto_impsto,',
'                                                                     o_cdgo_rspsta		 => v_cdgo_rspsta,',
'                                                                     o_mnsje_rspsta		 => v_mnsje_rspsta);',
'             if(v_cdgo_rspsta <> 0) then',
'             --    raise_application_error(-20001, ''1. Error: '' || v_mnsje_rspsta);',
unistr('                :P143_RSPSTA := ''\00A1Error al Registrar el Sujeto!'';'),
'                apex_json.open_object;',
'                apex_json.write(''type'', ''ERROR'');',
'                apex_json.write(''msg'', ''Error al Registrar el Sujeto'' || v_mnsje_rspsta);        ',
'                apex_json.close_object;',
'                ',
'             end if;',
'            ',
'        exception',
'            when others then ',
'                rollback;',
'	--	        raise_application_error(-20001, ''2. '' ||v_mnsje_rspsta);',
'                apex_json.open_object;',
'                apex_json.write(''type'', ''ERROR'');',
'                apex_json.write(''msg'', sqlerrm);        ',
'                apex_json.close_object;		      ',
'        end;',
'    else',
'        v_id_sjto_impsto    := :P138_ID_SJTO_IMPSTO;',
'    end if;',
'    	',
'    if v_id_sjto_impsto is not null then',
'        ',
'        if :P139_CNTRO_TPO is not null then ',
'            if :P139_CNTRO_TPO = ''GSLNA'' then ',
'                v_indcdor_cntrto_gslna  := ''S'';',
'            end if;',
'',
'            if :P139_CNTRO_TPO = ''ESE'' then ',
'                v_indcdor_cntrto_ese  := ''S'';',
'            end if;        ',
'        else',
'            v_indcdor_cntrto_gslna  := ''N'';',
'            v_indcdor_cntrto_ese    := ''N'';',
'            --:P141_VLOR_CNCTRTO_ESE  := null;',
'            :P141_VLOR_CNTRTO_ESE  := null;',
'       end if;',
'       ',
'        begin',
'       ',
'            pkg_gi_rentas.prc_rg_proyeccion_renta(p_cdgo_clnte				=> :F_CDGO_CLNTE',
'                                                , p_id_impsto				=> :P138_ID_IMPSTO',
'                                                , p_id_impsto_sbmpsto		=> :P138_ID_IMPSTO_SBMPSTO',
'                                                , p_id_sjto_impsto			=> v_id_sjto_impsto',
'                                                , p_id_rnta					=> :P138_ID_RNTA',
'                                                , p_actos_cncpto			=> :P143_CNCPTOS',
'                                                , p_id_sbmpsto_ascda		=> :P139_ID_IMPSTO_ASCDA',
'                                                , p_txto_ascda				=> :P139_TXTO_ASCDA',
'                                                , p_fcha_expdcion			=> nvl(:P141_FCHA_EXPDCION, sysdate)',
'                                                , p_vlor_bse_grvble			=> to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                                , p_indcdor_usa_mxto		=> nvl(:P139_INDCDOR_USA_MXTO,nvl(:P138_USA_INDCDOR_MXTO,''N''))',
'                                                , p_indcdor_usa_extrnjro	=> nvl(:P139_INDCDOR_USA_EXTRNJRO,nvl(:P138_USA_INDCDOR_EXTRNJRO,''N''))',
'                                                , p_fcha_vncmnto_dcmnto		=> :P141_FCHA_VNCMNTO',
'                                                , p_indcdor_lqdccion_adcnal => nvl(:P141_INDCDOR_LDCCION_ADCNAL,''N'')',
'                                                , p_id_rnta_antrior         => :P141_ID_RNTA_ANTRIOR',
'                                                , p_indcdor_exncion         => nvl(:P141_INDCDOR_EXNCION, ''N'')',
'                                                , p_indcdor_cntrto_gslna    => nvl(v_indcdor_cntrto_gslna,''N'')',
'                                                , p_indcdor_cntrto_ese      => nvl(v_indcdor_cntrto_ese,''N'')',
'                                                , p_vlor_cntrto_ese         => to_number(:P141_VLOR_CNTRTO_ESE, ''999G999G999G999G999G999G990D99'')',
'                                                , p_json_mtdtos             => :P139_JSON_MTDTOS',
'                                                , p_entrno					=> ''PRVDO''',
'                                                , p_id_entdad               => nvl(:P138_ID_ENTDAD, :P138_ID_ENTDAD_USRIO)',
'                                                , p_id_usrio				=> :F_ID_USRIO ',
'                                                , p_id_rnta_ascda           => :P139_ID_RNTA_ASCDA',
'                                                , p_id_rnta_cntrto_extrno   => :P138_ID_RNTA_CNTRTO_EXTRNO --Req0026403',
'                                                , o_id_rnta					=> :P143_ID_RNTA',
'                                                , o_cdgo_rspsta				=> v_cdgo_rspsta',
'                                                , o_mnsje_rspsta			=> v_mnsje_rspsta',
'                                                );',
'',
'            if(v_cdgo_rspsta = 0) then',
'                select nmro_rnta',
'                  into v_nmro_rnta',
'                  from gi_g_rentas',
'                 where id_rnta  = :P143_ID_RNTA;',
'                 ',
'                 ',
unistr('               v_mensaje := ''\00A1Su solicitud de liquidaci\00F3n ha sido registrada con \00E9xito! A continuaci\00F3n, un funcionario debe revisar y '),
unistr('                aprobar su liquidaci\00F3n. Al ser aprobada usted podr\00E1 descargar el recibo de pago. No. Liquidaci\00F3n '' || v_nmro_rnta || ''.'';'),
'                ',
'                apex_json.open_object;',
'                apex_json.write(''type'', ''OK'');    ',
'                apex_json.write(''msg'', v_mensaje);    ',
unistr('                apex_json.write(''nmbre_rprte'', ''Liquidaci\00F3n de Renta N '' || v_nmro_rnta);  '),
'                apex_json.close_object;',
'                ',
'            else',
'                rollback;',
'                :P143_ID_RNTA    := null;',
'               -- raise_application_error(-20001, ''3. Error: '' || v_mnsje_rspsta);',
'                apex_json.open_object;',
'                apex_json.write(''type'', ''ERROR'');',
'                apex_json.write(''msg'', ''Error al Liquidar. '' || v_mnsje_rspsta);        ',
'                apex_json.close_object;',
'                    ',
'            end if;',
'        exception',
'            when others then ',
'                rollback;',
'                :P143_ID_RNTA    := null;',
'              --  raise_application_error(-20001, ''4. Error: '' || v_mnsje_rspsta || '' - '' || sqlerrm);',
'                apex_json.open_object;',
'                apex_json.write(''type'', ''ERROR'');',
'                apex_json.write(''msg'', sqlerrm);        ',
'                apex_json.close_object;',
'        end;',
'        ',
'    else',
'        rollback;',
'        v_mnsje_rspsta    := ''No se registro el sujeto impuesto'' ;',
'     --   raise_application_error(-20001, ''5. Error: '' || v_mnsje_rspsta || '' - '' || sqlerrm);',
'        apex_json.open_object;',
'        apex_json.write(''type'', ''ERROR'');',
'        apex_json.write(''msg'', sqlerrm);        ',
'        apex_json.close_object;',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
