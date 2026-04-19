prompt --application/pages/page_00135
begin
wwv_flow_api.create_page(
 p_id=>135
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Gesti\00F3n de Solicitudes de Liquidaciones de Rentas')
,p_step_title=>unistr('Gesti\00F3n de Solicitudes de Liquidaciones de Rentas')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(164121496469722963)
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20201209134141'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10931054942796385)
,p_plug_name=>'Solicitudes de Liquidaciones'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_rnta',
'        , ''<span class="fa fa-eye"></span>''  ver',
'        , a.idntfccion_sjto',
'		, a.nmro_rnta',
'		, a.fcha_rgstro',
'        , a.fcha_expdcion',
'		, case when txto_ascda is not null then ',
'            a.dscrpcion_ascda || '': '' || a.txto_ascda ',
'          else',
'              ''--''',
'          end as txto_ascda',
'		, a.nmbre_impsto_sbmpsto',
'		, (select case ',
'                    when upper(m.txto_bse_grvble ) = ''BASE GRAVABLE'' then ',
'                        to_char(vlor_bse_grvble, :F_FRMTO_MNDA) ',
'                    else  ',
'                        upper(m.txto_bse_grvble )  || '' '' || to_char(vlor_bse_grvble, :F_FRMTO_MNDA)',
'                    end as txto_bse',
'                   from df_i_impuestos_acto m ',
'                   join gi_g_rentas_acto    n on m.id_impsto_acto = n.id_impsto_acto',
'                  where n.id_rnta           = a.id_rnta',
'                    and rownum = 1',
'			) txto_bse',
'        , a.dscrpcion_indcdor_exncion',
'        , a.cdgo_exncion_estdo',
'        , a.nmbre_rzon_scial',
'        , a.dscrpcion_rnta_estdo',
'	 from v_gi_g_rentas		            a',
'	where a.cdgo_clnte		            = :F_CDGO_CLNTE',
'      and a.id_impsto_sbmpsto           = :P135_ID_IMPSTO_SBMPSTO',
'      and (a.cdgo_rnta_estdo            = :P135_CDGO_RNTA_ESTDO',
'           or  ( :P135_CDGO_RNTA_ESTDO  is NULL and cdgo_rnta_estdo  in (''RGS'',''PYT'', ''RVS'',''DNG'') ) ',
'          )      ',
'       and (a.idntfccion_sjto           = :P135_IDNTFCCION or :P135_IDNTFCCION is null)',
'      and (a.nmro_rnta                  = :P135_NMRO_RNTA  or :P135_NMRO_RNTA  is null)',
'      and ((trunc(a.fcha_rgstro) 		between :P89_FCHA_INCIAL 	and :P89_FCHA_FNAL)',
'       or (trunc(a.fcha_rgstro) 		>= :P89_FCHA_INCIAL 		and :P89_FCHA_FNAL 			is null) ',
'       or (trunc(a.fcha_rgstro) 		<= :P89_FCHA_FNAL 			and :P89_FCHA_INCIAL  		is null)',
'       or (:P89_FCHA_INCIAL 			is null 					and :P89_FCHA_FNAL 			is null))',
'      and (a.txto_ascda                 like ''%'' || :P135_TXTO_ASCDA || ''%'' or :P135_TXTO_ASCDA is null)',
'      and (a.id_sbmpsto_ascda           = :P135_ID_SBMPSTO_ASCDA         or :P135_ID_SBMPSTO_ASCDA   is null)',
'      and (a.indcdor_exncion            = :P135_INDCDOR_EXNCION          or :P135_INDCDOR_EXNCION    is null)',
'      and (a.indcdor_rnta_pgda          = :P135_INDCDOR_RNTA_PGADA       or :P135_INDCDOR_RNTA_PGADA is null) ',
'      and ( (id_fljo_trea               is not null and pkg_pl_workflow_1_0.fnc_vl_tarea_particpnte_s_n (p_id_fljo_trea => id_fljo_trea, p_user_apex => :F_ID_USRIO) = ''S'')',
'        or id_fljo_trea is null',
'          )'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5614642346742809)
,p_name=>'FCHA_EXPDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_EXPDCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha de <br> Suscripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
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
 p_id=>wwv_flow_api.id(10931832311796392)
,p_name=>'ID_RNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RNTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10931890010796393)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n  <br> Sujeto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(11280735525641544)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY HH:MI:SS PM'
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
 p_id=>wwv_flow_api.id(11280823034641545)
,p_name=>'TXTO_ASCDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_ASCDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Asociada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>302
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
 p_id=>wwv_flow_api.id(11280946400641546)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub-Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(11281119292641548)
,p_name=>'VER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VER'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&VER.'
,p_link_target=>'f?p=&APP_ID.:136:&SESSION.::&DEBUG.:RP,136:P136_ID_RNTA:&ID_RNTA.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11281177104641549)
,p_name=>'TXTO_BSE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_BSE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Base Gravable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(79562133653385530)
,p_name=>'DSCRPCION_INDCDOR_EXNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_INDCDOR_EXNCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFSolicito <br>Exenci\00F3n?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>2
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
 p_id=>wwv_flow_api.id(79654969590676119)
,p_name=>'NMRO_RNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RNTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0  <br> Liquidaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_item_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
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
 p_id=>wwv_flow_api.id(80928191859670813)
,p_name=>'CDGO_EXNCION_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_EXNCION_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Estado <br> Exenci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(80773162668013622)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(83749280281256201)
,p_name=>'NMBRE_RZON_SCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RZON_SCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Nombre Raz\00F3n Social')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(84242266046159402)
,p_name=>'DSCRPCION_RNTA_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_RNTA_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado <br> Solicitud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(10931683208796391)
,p_internal_uid=>10931683208796391
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
 p_id=>wwv_flow_api.id(11287760008672823)
,p_interactive_grid_id=>wwv_flow_api.id(10931683208796391)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(11287945281672832)
,p_report_id=>wwv_flow_api.id(11287760008672823)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1037550005256)
,p_view_id=>wwv_flow_api.id(11287945281672832)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(5614642346742809)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>96
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11288263308672846)
,p_view_id=>wwv_flow_api.id(11287945281672832)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(10931832311796392)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11288797496672853)
,p_view_id=>wwv_flow_api.id(11287945281672832)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(10931890010796393)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>113
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11289313616672855)
,p_view_id=>wwv_flow_api.id(11287945281672832)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(11280735525641544)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>162
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11289764941672857)
,p_view_id=>wwv_flow_api.id(11287945281672832)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(11280823034641545)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>240
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11290323293672858)
,p_view_id=>wwv_flow_api.id(11287945281672832)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(11280946400641546)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>161
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11291268760672862)
,p_view_id=>wwv_flow_api.id(11287945281672832)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(11281119292641548)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>59
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11291790906672863)
,p_view_id=>wwv_flow_api.id(11287945281672832)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(11281177104641549)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>303
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80124153189410621)
,p_view_id=>wwv_flow_api.id(11287945281672832)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(79654969590676119)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>110
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80680088070797213)
,p_view_id=>wwv_flow_api.id(11287945281672832)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(79562133653385530)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>81
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(81043285268725105)
,p_view_id=>wwv_flow_api.id(11287945281672832)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(80928191859670813)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83755203288256661)
,p_view_id=>wwv_flow_api.id(11287945281672832)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(83749280281256201)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>175
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(84279370338575250)
,p_view_id=>wwv_flow_api.id(11287945281672832)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(84242266046159402)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>101
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(175780738602689726)
,p_plug_name=>unistr('Par\00E1metros de Busqueda')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(86058708475784504)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_api.id(175780738602689726)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86059098914784514)
,p_name=>'P135_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(175780738602689726)
,p_item_default=>':F_CDGO_CLNTE || ''3'''
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86059462030784523)
,p_name=>'P135_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(175780738602689726)
,p_prompt=>'<b>Sub-Tributo</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.nmbre_impsto_sbmpsto',
'        , a.id_impsto_sbmpsto',
'     from df_i_impuestos_subimpuesto    a',
'    where a.id_impsto_sbmpsto           in (select id_impsto_sbmpsto',
'                                              from gi_g_rentas        m',
'                                             where m.cdgo_clnte       = :F_CDGO_CLNTE)',
' order by a.nmbre_impsto_sbmpsto'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>3
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el sub tributo correspondiente a la renta que desea consultar.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86060371863784525)
,p_name=>'P135_NMRO_RNTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(175780738602689726)
,p_prompt=>unistr('<b>N\00B0 Liquidaci\00F3n</b>')
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select nmro_rnta',
'     from gi_g_rentas',
'    where cdgo_clnte           = :F_CDGO_CLNTE',
'      and id_impsto_sbmpsto    = :P135_ID_IMPSTO_SBMPSTO',
' order by nmro_rnta'))
,p_cSize=>20
,p_cMaxlength=>12
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Ingrese valor correspondiente al n\00FAmero de la liquidaci\00F3n de la renta que desea consultar.')
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'Y'
,p_attribute_10=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86061262145784526)
,p_name=>'P135_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(175780738602689726)
,p_prompt=>unistr('<b>Identificaci\00F3n del Sujeto</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n correspondiente al sujeto con el que se registr\00F3 la renta que desea consultar.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86062138925784527)
,p_name=>'P135_CDGO_RNTA_ESTDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(175780738602689726)
,p_prompt=>'<b>Estado</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion ',
'     , cdgo_rnta_estdo',
'  from gi_d_rentas_estado',
'  where  cdgo_rnta_estdo in (''RGS'', ''PYT'', ''RVS'',''DNG'')'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>10
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione es estado en que se encuentra la renta que desea consultar.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86063067295784527)
,p_name=>'P135_FCHA_SLCTUD_INCIO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(175780738602689726)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_date (''01/'' || extract(MONTH from sysdate) || ''/'' || extract(year from sysdate)) fcha_incio',
'	 from dual'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'<b>Fecha Inicio Solicitud</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>15
,p_tag_attributes=>'onkeypress="return false "'
,p_colspan=>3
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Ingrese valor m\00EDnimo del rango de fechas, correspondiente al registro de la renta que desea consultar.'),
''))
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86063951026784529)
,p_name=>'P135_FCHA_SLCTUD_FIN'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(175780738602689726)
,p_prompt=>'<b>Fecha Fin <br> Solicitud</b>'
,p_source=>'select last_day(sysdate) from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>15
,p_tag_attributes=>'onkeypress="return false "'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Ingrese valor m\00E1ximo del rango de fechas, correspondiente al registro de la renta que desea consultar.'),
''))
,p_attribute_02=>'&P135_FCHA_SLCTUD_INCIO.'
,p_attribute_03=>' &P135_ULTMO_DIA_MES.'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86064841003784530)
,p_name=>'P135_INDCDOR_RNTA_PGADA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(175780738602689726)
,p_prompt=>unistr('<b>\00BFLiquidaci\00F3n Pagada?</b>')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(5646119019866897)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>10
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione si la renta que desea consultar fue o no pagada.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86065746038784530)
,p_name=>'P135_INDCDOR_EXNCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(175780738602689726)
,p_prompt=>unistr('<b>\00BFSolicit\00F3 Exenci\00F3n?</b>')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(5646119019866897)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione si la renta que desea consultar, solicito o no exenci\00F3n.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86066692360784539)
,p_name=>'P135_ID_SBMPSTO_ASCDA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(175780738602689726)
,p_prompt=>'<b>Tipo Soporte</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select dscrpcion                    d',
'        , id_sbmpsto_ascda             r',
'     from gi_d_subimpuestos_asociada',
'    where cdgo_clnte                   = :F_CDGO_CLNTE',
'      and id_impsto_sbmpsto            = :P135_ID_IMPSTO_SBMPSTO',
'      and activo                       = ''S'''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P135_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_colspan=>3
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione la asociada correspondiente a la renta que desea consultar.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86067560680784541)
,p_name=>'P135_TXTO_ASCDA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(175780738602689726)
,p_prompt=>'<b>Soporte</b>'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select txto_ascda',
'     from gi_g_rentas',
'    where cdgo_clnte                 = :F_CDGO_CLNTE',
'      and id_impsto_sbmpsto          = :P135_ID_IMPSTO_SBMPSTO',
'      and (id_sbmpsto_ascda          = :P135_ID_SBMPSTO_ASCDA        or :P135_ID_SBMPSTO_ASCDA is null)',
'      and ((fcha_rgstro              between :P135_FCHA_SLCTUD_INCIO  and :P135_FCHA_SLCTUD_FIN)',
'       or :P135_FCHA_SLCTUD_INCIO    is null ',
'       or :P135_FCHA_SLCTUD_FIN      is null)'))
,p_lov_cascade_parent_items=>'P135_ID_SBMPSTO_ASCDA'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Ingrese el valor correspondiente al soporte de la renta que desea consultar.'
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'Y'
,p_attribute_10=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86068401489784543)
,p_name=>'P135_ULTMO_DIA_MES'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(175780738602689726)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select last_day(sysdate)',
'	from dual'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
