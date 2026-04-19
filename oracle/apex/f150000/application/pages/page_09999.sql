prompt --application/pages/page_09999
begin
wwv_flow_api.create_page(
 p_id=>9999
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Consulta Factura Titulo'
,p_step_title=>'Consulta Factura Titulo'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250825133611'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99434403583836101)
,p_plug_name=>unistr('Informaci\00F3n Importante')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
unistr('  <h2>Notificaci\00F3n de la Factura t\00EDtulo por la cual se liquida oficialmente el Impuesto Predial Unificado de las vigencias 2024 y 2025</h2>'),
'</center>',
unistr('<p>Monter\00EDa, Agosto 25 de 2025</p>'),
unistr('<p  align="justify">Con fundamento en lo dispuesto el art\00EDculo 40 del Acuerdo 034 de 2024 y el Decreto Municipal 0294 del 20 de agosto de 2025, la Secretaria de Hacienda notifica las siguientes facturas t\00EDtulo por las cuales se determina oficialmente')
||unistr(' el Impuesto Predial Unificado de las vigencias 2024 y 2025 mediante la inserci\00F3n en la p\00E1gina web del Municipio y, simult\00E1neamente, con la publicaci\00F3n en la cartelera informativa ubicada en la Secretar\00EDa de Hacienda. La factura t\00EDtulo es un acto adm')
||unistr('inistrativo definitivo y contra el mismo procede el recurso de reconsideraci\00F3n ante la Secretaria de Hacienda, dentro de los dos (2) meses siguientes a la presente notificaci\00F3n, de conformidad con lo establecido en el art\00EDculo 448 del Acuerdo 034 de ')
||'2024.</p>',
unistr('<p  align="justify">La factura t\00EDtulo deber\00E1 cancelarse a trav\00E9s del recibo oficial de pago, que puede descargar directamente desde el portal web de impuestos, o solicitarlo en las ventanillas de la secretar\00EDa localizadas en la Calle 27 con carrera 3')
||unistr('a. El pago podr\00E1 realizarlo en bancos, corresponsales autorizados o mediante el Bot\00F3n de Pagos PSE.</p>'),
'<center>',
'    <h3>LUPITA BELLO TOUS<br>Secretaria de Hacienda</h3>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(236086188382391062)
,p_plug_name=>unistr('Par\00E1metros de Consulta ')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(236086635881391066)
,p_plug_name=>'Notificaciones '
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.nmro_acto,',
'        trunc(a.fcha) as Fecha_Acto,',
'        initcap(a.dscrpcion_acto_tpo) as dscrpcion_acto_tpo,',
'        a.idntfccion_sjto,',
'        d.prmer_nmbre || '''' || d.sgndo_nmbre || '''' || d.prmer_aplldo || '''' || d.sgndo_aplldo as Responsable,',
'        ltrim(d.idntfccion,''0'') as Identificacion_Responsable,  ',
'        case when g.indcdor_ntfccion = ''S'' then',
'            ''Si''',
'        else',
'            ''No'' end as dscrpcion_indcdor_ntfcdo,',
'        to_char(a.fcha_ntfccion, ''DD/MM/YYYY'') as fcha_ntfccion,    ',
'        b.id_ntfccion,',
'        a.id_acto,',
'        a.id_dcmnto,',
'        g.fcha_pblccion,',
'        case when e.frma_tpo = ''MCN'' then ',
'         f.file_blob ',
'        else f.file_blob_nvo end as Descargar,',
'        i.DRCCION drccion_prdio',
'from v_gn_g_actos_sujeto_impuesto a',
'left join nt_g_notificaciones b on a.id_acto = b.id_acto',
'join gn_d_actos_tipo c on a.id_acto_tpo = c.id_acto_tpo',
'and c.indcdor_ntfccion=''S''',
'left join gn_g_actos_responsable d on a.id_acto = d.id_acto',
'join gn_d_actos_funcionario_frma e on a.id_acto_tpo = e.id_acto_tpo',
'left join gd_g_documentos f on a.id_dcmnto = f.id_dcmnto',
'join gn_g_actos g on a.id_acto = g.id_acto ',
'join gi_g_determinaciones h on h.id_acto = g.id_acto',
'join v_si_i_sujetos_impuesto i on i.id_sjto_impsto = h.id_sjto_impsto',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and g.ntfcdo_pag_web =''S''',
'    and (a.idntfccion_sjto = :P9999_IDNTFCCION_SJTO or :P9999_IDNTFCCION_SJTO is null)',
'    and (ltrim(d.idntfccion, ''0'') = ltrim(:P9999_IDNTFCCION_RSPNSBLE,''0'')or :P9999_IDNTFCCION_RSPNSBLE is null)',
'    and c.indcdor_ntfccion = ''S''',
'    and h.fctra_ttlo = ''S'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P9999_IDNTFCCION_RSPNSBLE is not null or :P9999_IDNTFCCION_SJTO is not null'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(89959925895975909)
,p_name=>'DRCCION_PRDIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCCION_PRDIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Direcci\00F3n Predio')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(102072195943016288)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Referencia <br> Catastral'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(129315301973070888)
,p_name=>'FCHA_PBLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_PBLCCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Fecha De <br>Publicaci\00F3n Web')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
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
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(129315652713070891)
,p_name=>'RESPONSABLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RESPONSABLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombres Del<br>Notificado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>400
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
 p_id=>wwv_flow_api.id(129315756669070892)
,p_name=>'IDENTIFICACION_RESPONSABLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDENTIFICACION_RESPONSABLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n Del <br> Notificado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(129315994405070895)
,p_name=>'DSCRPCION_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(129316081228070896)
,p_name=>'DSCRPCION_INDCDOR_NTFCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_INDCDOR_NTFCDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(129316263359070897)
,p_name=>'FCHA_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_NTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Fecha De <br>Notificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_api.id(129316306500070898)
,p_name=>'ID_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_NTFCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(129316437952070899)
,p_name=>'ID_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(129316508768070900)
,p_name=>'DESCARGAR'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Descargar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <span aria-hidden="true" class="fa fa-file-arrow-down"></span>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:9999:&SESSION.:imprimir_acto:&DEBUG.:RP:P9999_ID_ACTO:&ID_ACTO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(129316608118070901)
,p_name=>'FECHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA_ACTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Factura'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
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
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(236087327726391073)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(236088019490391080)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(236086701873391067)
,p_internal_uid=>236086701873391067
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:ACTIONS_MENU:RESET'
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
 p_id=>wwv_flow_api.id(236094313933425718)
,p_interactive_grid_id=>wwv_flow_api.id(236086701873391067)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(236094388851425732)
,p_report_id=>wwv_flow_api.id(236094313933425718)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99484106551582610)
,p_view_id=>wwv_flow_api.id(236094388851425732)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(89959925895975909)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(102586403462624678)
,p_view_id=>wwv_flow_api.id(236094388851425732)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(102072195943016288)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(129458667123066210)
,p_view_id=>wwv_flow_api.id(236094388851425732)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(129315301973070888)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(129470432369268687)
,p_view_id=>wwv_flow_api.id(236094388851425732)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(129315652713070891)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(129470989296268690)
,p_view_id=>wwv_flow_api.id(236094388851425732)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(129315756669070892)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(129472815093268703)
,p_view_id=>wwv_flow_api.id(236094388851425732)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(129315994405070895)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(129473282926268705)
,p_view_id=>wwv_flow_api.id(236094388851425732)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(129316081228070896)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(129473956335268707)
,p_view_id=>wwv_flow_api.id(236094388851425732)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(129316263359070897)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(129474478636268709)
,p_view_id=>wwv_flow_api.id(236094388851425732)
,p_display_seq=>26
,p_column_id=>wwv_flow_api.id(129316306500070898)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(129475105960268711)
,p_view_id=>wwv_flow_api.id(236094388851425732)
,p_display_seq=>27
,p_column_id=>wwv_flow_api.id(129316437952070899)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(129475685647268713)
,p_view_id=>wwv_flow_api.id(236094388851425732)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(129316508768070900)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(129482115907329696)
,p_view_id=>wwv_flow_api.id(236094388851425732)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(129316608118070901)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(236104040906762748)
,p_view_id=>wwv_flow_api.id(236094388851425732)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(236087327726391073)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(236107502234762761)
,p_view_id=>wwv_flow_api.id(236094388851425732)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(236088019490391080)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>79
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99194399019955787)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(236086188382391062)
,p_button_name=>'Btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99194797447955788)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(236086188382391062)
,p_button_name=>'RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,42::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99195165284955791)
,p_name=>'P9999_IDNTFCCION_SJTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(236086188382391062)
,p_prompt=>'Referencia Catastral'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99195591683955794)
,p_name=>'P9999_IDNTFCCION_RSPNSBLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(236086188382391062)
,p_prompt=>unistr('Nit / C\00E9dula: ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99195992299955794)
,p_name=>'P9999_ID_ACTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(236086188382391062)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99202403284955824)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Imprimir Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    -- Variables para almacenar los datos del acto',
'    v_blob_nvo         BLOB;',
'    v_blob_original    BLOB;',
'    v_bfile            BFILE;',
'    v_nmro_acto_dsplay v_gn_g_actos.nmro_acto_dsplay%TYPE;',
'    ',
unistr('    -- Variable final que contendr\00E1 el archivo a descargar'),
'    l_blob_a_descargar BLOB;',
'    ',
'    o_cdgo_rspsta      VARCHAR2(100);',
'    o_mnsje_rspsta     VARCHAR2(4000);',
'    ',
'BEGIN',
'    -- 1. Recuperar TODOS los campos de archivo y el nombre del acto en una sola consulta.',
'    BEGIN',
'        SELECT ',
'            file_blob_nvo,',
'            file_blob,',
'            file_bfile,',
'            nmro_acto_dsplay',
'        INTO ',
'            v_blob_nvo,',
'            v_blob_original,',
'            v_bfile,',
'            v_nmro_acto_dsplay',
'        FROM ',
'            v_gn_g_actos',
'        WHERE ',
'            id_acto = :P9999_ID_ACTO;',
'    EXCEPTION',
'        WHEN NO_DATA_FOUND THEN',
'            apex_error.add_error(',
'                p_message          => ''El acto especificado no fue encontrado.'', ',
'                p_display_location => apex_error.c_inline_in_notification',
'            );',
'            RETURN;',
'    END;',
'',
unistr('    -- 2. L\00F3gica de prioridad para seleccionar el archivo a descargar.'),
'    IF v_blob_nvo IS NOT NULL AND dbms_lob.getlength(v_blob_nvo) > 0 THEN',
'        l_blob_a_descargar := v_blob_nvo;',
'        ',
'    ELSIF v_blob_original IS NOT NULL AND dbms_lob.getlength(v_blob_original) > 0 THEN',
'        l_blob_a_descargar := v_blob_original;',
'        ',
'    ELSIF v_bfile IS NOT NULL THEN',
'        IF DBMS_LOB.FILEEXISTS(v_bfile) = 1 THEN',
'            DBMS_LOB.CREATETEMPORARY(l_blob_a_descargar, TRUE);',
'            ',
unistr('            -- --> CORREGIDO: Llamada a LOADFROMFILE con los 5 par\00E1metros requeridos'),
'            pkg_gd_utilidades.prc_co_archco_dsco(',
'                p_bfile => v_bfile,',
'                o_archvo_blob => l_blob_a_descargar,',
'                o_cdgo_rspsta => o_cdgo_rspsta,',
'                o_mnsje_rspsta => o_mnsje_rspsta);',
'        END IF;',
'    END IF;',
'',
unistr('    -- 3. Iniciar la descarga si se encontr\00F3 un archivo v\00E1lido.'),
'    IF l_blob_a_descargar IS NOT NULL AND dbms_lob.getlength(l_blob_a_descargar) > 0 THEN',
'        htp.init;',
'        owa_util.mime_header(''application/pdf'', FALSE);',
'        htp.p(''Content-length: '' || dbms_lob.getlength(l_blob_a_descargar));',
'        htp.p(''Content-Disposition: attachment; filename="'' || v_nmro_acto_dsplay || ''.pdf"'');',
'        htp.p(''Cache-Control: no-cache'');',
'        owa_util.http_header_close;',
'        ',
'        wpg_docload.download_file(l_blob_a_descargar);',
'        ',
'        IF v_bfile IS NOT NULL AND DBMS_LOB.ISTEMPORARY(l_blob_a_descargar) = 1 THEN',
'            DBMS_LOB.FREETEMPORARY(l_blob_a_descargar);',
'        END IF;',
'        ',
'        apex_application.stop_apex_engine;',
'        ',
'    ELSE',
'        apex_error.add_error(',
unistr('            p_message          => ''No se encontr\00F3 ning\00FAn archivo adjunto para descargar en este acto.'', '),
'            p_display_location => apex_error.c_inline_in_notification',
'        );',
'    END IF;',
'',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        apex_debug.error(''Error en descarga de archivo. ID_ACTO: %s, Error: %s'', :P9999_ID_ACTO, SQLERRM);',
'        ',
'        IF l_blob_a_descargar IS NOT NULL AND DBMS_LOB.ISTEMPORARY(l_blob_a_descargar) = 1 THEN',
'            DBMS_LOB.FREETEMPORARY(l_blob_a_descargar);',
'        END IF;',
'',
'        apex_error.add_error(',
unistr('            p_message          => ''Ocurri\00F3 un error inesperado al intentar descargar el archivo. Por favor, contacte al administrador.'','),
'            p_display_location => apex_error.c_inline_in_notification',
'        );',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'imprimir_acto'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
