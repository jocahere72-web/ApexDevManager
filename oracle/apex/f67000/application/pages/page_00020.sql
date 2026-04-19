prompt --application/pages/page_00020
begin
wwv_flow_api.create_page(
 p_id=>20
,p_user_interface_id=>wwv_flow_api.id(71698179048188014)
,p_name=>'Consulta y consolidado Envios Email MailJet'
,p_step_title=>'Consulta Envios Email'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_step_template=>wwv_flow_api.id(71592158849187941)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20230725155311'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(224221382329201709)
,p_plug_name=>'Contenedor'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(71630979842187961)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(224220900164201705)
,p_plug_name=>'Consolidado'
,p_parent_plug_id=>wwv_flow_api.id(224221382329201709)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71624143472187958)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--select  count(distinct c.id_Acto) total,',
'select  count(distinct c.id_envio) total,',
'    case',
'        when x.status = ''ERROR'' then  ''Rebotado''',
'        when nvl(b.status, ''SEND'') = ''SEND'' then ''Enviado''',
'        when b.status = ''OPEN'' then ''Abierto''',
'        when b.status = ''BOUNCE'' then ''Rebotado''',
'        when b.status = ''CLICK'' then ''Abierto''',
'    end satus ',
'from  v_ma_g_envios_medio a  ',
'    left join ma_g_envios_medio_respuesta x on x.id_envio_mdio = a.id_envio_mdio and x.cdgo_tpo_mvmnto = ''INICIO''  ',
'    join  ma_g_envios       c on c.id_envio = a.id_envio and c.id_envio_prgrmdo = :P20_ENVIO_PROGRAMADO',
'    left join  v_gn_g_actos      d on d.id_acto = c.id_acto',
'    left join v_si_i_sujetos_impuesto e on e.id_sjto_impsto = c.id_sjto_impsto',
'    left join v_si_i_personas         f on f.id_sjto_impsto = c.id_sjto_impsto',
'    left join ma_g_envios_medio_rspst_tmp b on b.messageid = a.messageid and b.cdgo_tpo_mvmnto = ''WEBHOOK''  ',
' where a.cdgo_clnte		        = :F_CDGO_CLNTE',
'      and (trunc(x.fcha_rspsta)           between :P20_FCHA_INCIO_ENVIO  and :P20_FCHA_FIN_ENVIO) ',
' group by case',
'            when x.status = ''ERROR'' then  ''Rebotado''',
'            when nvl(b.status, ''SEND'') = ''SEND'' then ''Enviado''',
'            when b.status = ''OPEN'' then ''Abierto''',
'            when b.status = ''BOUNCE'' then ''Rebotado''',
'            when b.status = ''CLICK'' then ''Abierto''',
'        end  '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(224221231777201708)
,p_name=>'SATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SATUS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>8
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
 p_id=>wwv_flow_api.id(224221635016201712)
,p_name=>'TOTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>30
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(224221098548201706)
,p_internal_uid=>224221098548201706
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
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
 p_id=>wwv_flow_api.id(228337489335692596)
,p_interactive_grid_id=>wwv_flow_api.id(224221098548201706)
,p_type=>'PRIMARY'
,p_default_view=>'CHART'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(158684000004)
,p_report_id=>wwv_flow_api.id(228337489335692596)
,p_view_type=>'CHART'
,p_chart_type=>'pie'
,p_chart_orientation=>'vertical'
,p_chart_stack=>'on'
,p_axis_label=>'Estado'
,p_axis_value=>'Envios'
);
wwv_flow_api.create_ig_report_chart_col(
 p_id=>wwv_flow_api.id(1637756021128)
,p_view_id=>wwv_flow_api.id(158684000004)
,p_column_type=>'SERIES_NAME'
,p_column_id=>wwv_flow_api.id(224221231777201708)
);
wwv_flow_api.create_ig_report_chart_col(
 p_id=>wwv_flow_api.id(1711783021128)
,p_view_id=>wwv_flow_api.id(158684000004)
,p_column_type=>'LABEL'
,p_column_id=>wwv_flow_api.id(224221231777201708)
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_chart_col(
 p_id=>wwv_flow_api.id(1791898021128)
,p_view_id=>wwv_flow_api.id(158684000004)
,p_column_type=>'VALUE'
,p_column_id=>wwv_flow_api.id(224221635016201712)
,p_function=>'SUM'
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(228337512474692597)
,p_report_id=>wwv_flow_api.id(228337489335692596)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(228338535971692604)
,p_view_id=>wwv_flow_api.id(228337512474692597)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(224221231777201708)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(229407735332099916)
,p_view_id=>wwv_flow_api.id(228337512474692597)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(224221635016201712)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(283161959821444265)
,p_plug_name=>'Envios realizados desde MailJet'
,p_parent_plug_id=>wwv_flow_api.id(224221382329201709)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71624143472187958)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    DISTINCT',
'    dscrpcion_acto_tpo,',
'    nmro_acto,',
'    e.idntfccion_sjto,',
'    nmbre_rzon_scial,',
'    a.dstno,',
'    x.fcha_rspsta fecha_Envio, ',
'    case',
'        when x.status = ''ERROR'' then  ''Rebotado''',
'        when nvl(b.status, ''SEND'') = ''SEND'' then ''Enviado''',
'        when b.status = ''OPEN'' then ''Abierto''',
'        when b.status = ''BOUNCE'' then ''Rebotado''',
'        when b.status = ''CLICK'' then ''Abierto''',
'    end satus,',
'    b.fcha_rspsta fecha_respuesta ,',
'    d.id_acto',
'from  v_ma_g_envios_medio a  ',
'    left join ma_g_envios_medio_respuesta x on x.id_envio_mdio = a.id_envio_mdio and x.cdgo_tpo_mvmnto = ''INICIO''  ',
'    join  ma_g_envios       c on c.id_envio = a.id_envio and c.id_envio_prgrmdo = :P20_ENVIO_PROGRAMADO',
'    left join  v_gn_g_actos      d on d.id_acto = c.id_acto',
'    left join v_si_i_sujetos_impuesto e on e.id_sjto_impsto = c.id_sjto_impsto',
'    left join v_si_i_personas         f on f.id_sjto_impsto = c.id_sjto_impsto',
'    left join ma_g_envios_medio_rspst_tmp b on b.messageid = a.messageid and b.cdgo_tpo_mvmnto = ''WEBHOOK''  ',
' where a.cdgo_clnte		        = :F_CDGO_CLNTE',
'      and (trunc(x.fcha_rspsta)           between :P20_FCHA_INCIO_ENVIO  and :P20_FCHA_FIN_ENVIO)',
'          -- or :P20_FCHA_INCIO_ENVIO   is null ',
'          -- or :P20_FCHA_FIN_ENVIO     is null)  '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(193153118098788014)
,p_name=>'DSCRPCION_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>50
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
 p_id=>wwv_flow_api.id(193153296525788015)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'No. Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(193153440893788017)
,p_name=>'FECHA_ENVIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA_ENVIO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Envio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(193153558252788018)
,p_name=>'SATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SATUS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado<br>Envio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>8
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
 p_id=>wwv_flow_api.id(193153685309788019)
,p_name=>'FECHA_RESPUESTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA_RESPUESTA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Respuesta'
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
 p_id=>wwv_flow_api.id(224221477028201710)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Acto'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>220
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
 p_id=>wwv_flow_api.id(231608550810425802)
,p_name=>'DSTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSTNO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Destino'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>500
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
 p_id=>wwv_flow_api.id(277188922434795218)
,p_name=>'NMBRE_RZON_SCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RZON_SCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Nombre Raz\00F3n Social')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(283162794889444273)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n <br> Sujeto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(283162588087444271)
,p_internal_uid=>283162588087444271
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
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
 p_id=>wwv_flow_api.id(283518664887320703)
,p_interactive_grid_id=>wwv_flow_api.id(283162588087444271)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>20
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(283518850160320712)
,p_report_id=>wwv_flow_api.id(283518664887320703)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(193497927087565791)
,p_view_id=>wwv_flow_api.id(283518850160320712)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(193153118098788014)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>219
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(193498407773565795)
,p_view_id=>wwv_flow_api.id(283518850160320712)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(193153296525788015)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(193499454559565800)
,p_view_id=>wwv_flow_api.id(283518850160320712)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(193153440893788017)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>168
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(193499937037565811)
,p_view_id=>wwv_flow_api.id(283518850160320712)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(193153558252788018)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>64
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(193500486380565813)
,p_view_id=>wwv_flow_api.id(283518850160320712)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(193153685309788019)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>154
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(229390383285887444)
,p_view_id=>wwv_flow_api.id(283518850160320712)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(224221477028201710)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(231841551870795902)
,p_view_id=>wwv_flow_api.id(283518850160320712)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(231608550810425802)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(277197027111819452)
,p_view_id=>wwv_flow_api.id(283518850160320712)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(277188922434795218)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>257
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(283519702375320733)
,p_view_id=>wwv_flow_api.id(283518850160320712)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(283162794889444273)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>121
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(165534000001)
,p_view_id=>wwv_flow_api.id(283518850160320712)
,p_execution_seq=>5
,p_name=>'Estado'
,p_background_color=>'#99FF99'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(193153558252788018)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'Rebotado'
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(275660165731650919)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71624143472187958)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
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
unistr('    <p align="justify">En esta opci\00F3n se puede consultar los envios realizados desde MailJet.<br> '),
'        ',
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(283161897660444264)
,p_plug_name=>'Parametros de Busqueda '
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(71613067978187954)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(193440475622539054)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(283161897660444264)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19613576112875715)
,p_name=>'P20_ENVIO_PROGRAMADO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(283161897660444264)
,p_prompt=>'<b>Envio Programado</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  distinct dscrpcion_envio_prgmdo|| '' -  ['' ||idntfcdor|| '']'', ',
'        id_envio_prgrmdo',
'from  v_ma_g_envios',
'order by 1 ',
'',
'/*',
'select  dscrpcion|| '' -  ['' ||idntfcdor|| '']'', ',
'        id_envio_prgrmdo',
'from ma_g_envios_programado ',
'order by 1',
'*/'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el envi\00F3 programado que desea consultar')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(193444792582539114)
,p_name=>'P20_FCHA_INCIO_ENVIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(283161897660444264)
,p_prompt=>'<b>Fecha Inicio Envio</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>15
,p_tag_attributes=>'onkeypress="return false "'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Seleccione la fecha de inicio en la que se registro el envi\00F3 programado.'),
''))
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(193445690721539115)
,p_name=>'P20_FCHA_FIN_ENVIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(283161897660444264)
,p_prompt=>'<b>Fecha Fin Envio</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>15
,p_tag_attributes=>'onkeypress="return false "'
,p_begin_on_new_line=>'N'
,p_grid_column=>8
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha final en la que se registro el envi\00F3 programado.')
,p_attribute_02=>'&P20_FCHA_INCIO_ENVIO.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(193451480908539132)
,p_name=>'P20_ULTMO_DIA_MES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(283161897660444264)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select last_day(sysdate)',
'	from dual'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(229517921303813132)
,p_validation_name=>'Envio programado no sea nulo'
,p_validation_sequence=>10
,p_validation=>'P20_ENVIO_PROGRAMADO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por favor seleccione el envi\00F3 programado que desea consultar')
,p_when_button_pressed=>wwv_flow_api.id(193440475622539054)
,p_associated_item=>wwv_flow_api.id(19613576112875715)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(229518013936813133)
,p_validation_name=>'Fecha Inicial no sea nula'
,p_validation_sequence=>20
,p_validation=>'P20_FCHA_INCIO_ENVIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por favor escoja la fecha inicial del envi\00F3 de correo que desea consultar')
,p_when_button_pressed=>wwv_flow_api.id(193440475622539054)
,p_associated_item=>wwv_flow_api.id(19613576112875715)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(229518198691813134)
,p_validation_name=>'Fecha final no sea nula'
,p_validation_sequence=>30
,p_validation=>'P20_FCHA_FIN_ENVIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por favor escoja la fecha final del envi\00F3 de correo que desea consultar')
,p_when_button_pressed=>wwv_flow_api.id(193440475622539054)
,p_associated_item=>wwv_flow_api.id(19613576112875715)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(229517554606813128)
,p_name=>'Al cambiar'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_FCHA_INCIO_ENVIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(229517667239813129)
,p_event_id=>wwv_flow_api.id(229517554606813128)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(229517798583813130)
,p_event_id=>wwv_flow_api.id(229517554606813128)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_FCHA_FIN_ENVIO'
,p_stop_execution_on_error=>'Y'
);
end;
/
