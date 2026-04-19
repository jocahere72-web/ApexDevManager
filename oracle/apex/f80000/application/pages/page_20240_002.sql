prompt --application/pages/page_20240_002
begin
wwv_flow_api.create_page(
 p_id=>2024002
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Informe Recaudo Por Proceso Persuasivo'
,p_step_title=>'Informe Recaudo Por Proceso Persuasivo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function validarItem() {',
'    ',
'    var idntfccion = $v("P2024002_NMRO_LTE");',
'',
'    if (idntfccion === "") {',
unistr('        var v_msje = "\00A1Debes seleccionar un lote!";'),
'        apex.message.clearErrors();',
'        apex.message.alert(v_msje);',
'        return false;',
'    } else{',
'        return true;',
'    }',
'}'))
,p_javascript_code_onload=>'$(''#btn_excel'').css(''background-color'', ''#008000''); '
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20241011111622'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2932714026971506)
,p_plug_name=>'Opciones Right'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Opciones <i class="fa fa-gear" aria-hidden="true"></i></center></b></h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4335730745424805)
,p_plug_name=>unistr('Par\00E1metros De Busqueda')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17345839561919369)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4335851983424806)
,p_plug_name=>'Resultados Persuasivo'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17345839561919369)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (',
'select b.idntfccion_sjto,',
'       b.mtrcla_inmblria,',
'       b.nmbre_dprtmnto,',
'       b.nmbre_mncpio,',
'       b.drccion,',
'       t.dscrpcion_idntfccion_tpo,',
'       d.idntfccion,',
'       d.prmer_nmbre || '' '' || d.sgndo_nmbre || '' '' || d.prmer_aplldo || '' '' ||',
'       d.sgndo_aplldo as responsable,',
'       c.id_sjto_impsto,',
'       c.vgncia,',
'       c.prdo,',
'       sum(nvl(c.vlor_sldo_cptal,0))as vlor_sldo_cptal,',
'       sum(nvl(c.vlor_intres,0))as vlor_intres,',
'       sum(nvl(c.vlor_sldo_cptal,0) + nvl(c.vlor_intres,0)) as vlor_ttal,',
'       sum(nvl(g.vlor_hber,0)) as recaudo',
'  from v_gf_g_cartera_x_concepto c',
'  join v_si_i_sujetos_impuesto b',
'    on b.id_sjto_impsto = c.id_sjto_impsto',
'   and b.id_sjto_estdo = 1',
'  join si_i_sujetos_responsable d',
'    on d.id_sjto_impsto = b.id_sjto_impsto',
'   and d.prncpal_s_n = ''S''',
'  join df_s_identificaciones_tipo t ',
'   on t.cdgo_idntfccion_tpo = d.cdgo_idntfccion_tpo  ',
'  join cb_g_procesos_prssvo_mvmnto e',
'    on e.id_sjto_impsto = c.id_sjto_impsto',
'   and e.id_mvmnto_fncro = c.id_mvmnto_fncro',
'   and e.vgncia = c.vgncia',
'   and e.id_prdo = c.id_prdo',
'   join cb_g_procesos_persuasivo f ',
'   on f.id_prcsos_prssvo = e.id_prcsos_prssvo',
'   left join gf_g_movimientos_detalle g ',
'   on g.id_mvmnto_fncro=c.id_mvmnto_fncro',
'   and g.fcha_mvmnto >= f.fcha_prcso',
'   and g.cdgo_mvmnto_orgn = ''RE''',
'   and g.cdgo_mvmnto_tpo in (''PC'',''PI'')',
'   where f.id_prcso_prssvo_lte = nvl(:P2024002_NMRO_LTE, f.id_prcso_prssvo_lte)',
'    AND (trunc(f.fcha_prcso) = :P2024002_FCHA_LTE OR :P2024002_FCHA_LTE IS NULL)',
'   group by b.idntfccion_sjto,',
'       b.mtrcla_inmblria,',
'       b.nmbre_dprtmnto,',
'       b.nmbre_mncpio,',
'       b.drccion,',
'       t.dscrpcion_idntfccion_tpo,',
'       d.idntfccion,',
'       d.prmer_nmbre || '' '' || d.sgndo_nmbre || '' '' || d.prmer_aplldo || '' '' ||',
'       d.sgndo_aplldo ,',
'       c.id_sjto_impsto,',
'       c.vgncia,',
'       c.prdo',
'       order by b.idntfccion_sjto,',
'       b.mtrcla_inmblria,',
'       b.nmbre_dprtmnto,',
'       b.nmbre_mncpio,',
'       b.drccion,',
'       t.dscrpcion_idntfccion_tpo,',
'       d.idntfccion,',
'       d.prmer_nmbre || '' '' || d.sgndo_nmbre || '' '' || d.prmer_aplldo || '' '' ||',
'       d.sgndo_aplldo ,',
'       c.id_sjto_impsto,',
'       c.vgncia,',
'       c.prdo)'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(2933154537971510)
,p_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_IDNTFCCION_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Tipo <br> Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(4336114081424809)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n <br>Sujeto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(4336215539424810)
,p_name=>'MTRCLA_INMBLRIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MTRCLA_INMBLRIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Matr\00EDcula<br> Inmobiliaria')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(4336347802424811)
,p_name=>'NMBRE_DPRTMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DPRTMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Departamento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(4336428138424812)
,p_name=>'NMBRE_MNCPIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_MNCPIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Municipio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(4336587087424813)
,p_name=>'DRCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Direccion'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(4336798943424815)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n <br>Responsable')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(4336816996424816)
,p_name=>'RESPONSABLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RESPONSABLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Responsable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>403
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
 p_id=>wwv_flow_api.id(4336961483424817)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4337024955424818)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(4337152874424819)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(4337212596424820)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990D00'
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
 p_id=>wwv_flow_api.id(4337373824424821)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Saldo inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990D00'
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
 p_id=>wwv_flow_api.id(4337479991424822)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990D00'
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
 p_id=>wwv_flow_api.id(4337514340424823)
,p_name=>'RECAUDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RECAUDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br>Recaudado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990D00'
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
 p_id=>wwv_flow_api.id(4336065288424808)
,p_internal_uid=>4336065288424808
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
 p_id=>wwv_flow_api.id(4347178840572051)
,p_interactive_grid_id=>wwv_flow_api.id(4336065288424808)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(4347220686572052)
,p_report_id=>wwv_flow_api.id(4347178840572051)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2949192022816523)
,p_view_id=>wwv_flow_api.id(4347220686572052)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(2933154537971510)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4347776450572056)
,p_view_id=>wwv_flow_api.id(4347220686572052)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(4336114081424809)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>197
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4348240148572060)
,p_view_id=>wwv_flow_api.id(4347220686572052)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(4336215539424810)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>136
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4348705664572062)
,p_view_id=>wwv_flow_api.id(4347220686572052)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(4336347802424811)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4349286294572063)
,p_view_id=>wwv_flow_api.id(4347220686572052)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(4336428138424812)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>93
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4349720833572065)
,p_view_id=>wwv_flow_api.id(4347220686572052)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(4336587087424813)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4350758600572068)
,p_view_id=>wwv_flow_api.id(4347220686572052)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(4336798943424815)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>111
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4351277266572069)
,p_view_id=>wwv_flow_api.id(4347220686572052)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(4336816996424816)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>274
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4351741108572071)
,p_view_id=>wwv_flow_api.id(4347220686572052)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(4336961483424817)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4352225798572072)
,p_view_id=>wwv_flow_api.id(4347220686572052)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(4337024955424818)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4352706055572074)
,p_view_id=>wwv_flow_api.id(4347220686572052)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(4337152874424819)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4353295367572075)
,p_view_id=>wwv_flow_api.id(4347220686572052)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(4337212596424820)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>106
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4353730417572076)
,p_view_id=>wwv_flow_api.id(4347220686572052)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(4337373824424821)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>103
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4354216244572078)
,p_view_id=>wwv_flow_api.id(4347220686572052)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(4337479991424822)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>103
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4354781423572079)
,p_view_id=>wwv_flow_api.id(4347220686572052)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(4337514340424823)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(366805952502347787)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <center>',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'        </b>',
'    </center>',
'</h5>',
'<p  style="text-align: justify;">',
unistr('    <b><i></b><p  style="text-align: justify;">Esta funcionalidad permite visualizar de forma global todo la informaci\00F3n relacionada con un proceso'),
'    Persuasivo, contando con las siguientes opciones :</p><br>',
'',
unistr('    <b><i>1.</i></b>Filtros de b\00FAsqueda en la parte superior, como los son: <br><br>'),
unistr('    <b><li></b>N\00FAmero de lote del proceso Persuasivo.</br></li>'),
'    <b><li></b>Fecha de lote del proceso Persuasivo.</br></li>',
unistr('    <!--<b><li></b>N\00FAmero de acto.</br></li>'),
unistr('    <b><li></b>Indentificaci\00F3n del sujeto.<br></li>'),
unistr('    <b><li></b>Identificaci\00F3n del Responsable.<br></li>'),
'    <b><li></b>Nombre del responsable.<br></li>-->',
'    <br>',
'',
'    <!--<b><i>2.</i></b>En la parte inferior izquierda nos muestra los procesos Persuasivos agrupados por sujeto<br><br>-->',
'',
'    <b><i>2.</i></b>En la grilla nos muestra:</br></br>',
'    <b><li></b>Los actos que se han generado en el proceso Persuasivo</br></li>',
'    <b><li></b>Responsables del proceso Persuasivo</br></li>',
unistr('    <b><li></b>Cartera asociada al proceso y la visualizaci\00F3n de los movimientos de esta.</br></br></li>'),
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</p>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2932637688971505)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2932714026971506)
,p_button_name=>'BTN_EXCEL'
,p_button_static_id=>'btn_excel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Descargar Excel'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-excel-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2932288719971501)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(4335730745424805)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2932836606971507)
,p_branch_name=>'exccel'
,p_branch_action=>'f?p=&APP_ID.:2024002:&SESSION.:descargar:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'descargar_Excel'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2932375469971502)
,p_name=>'P2024002_FCHA_LTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4335730745424805)
,p_prompt=>'Fecha Del Lote'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4337620122424824)
,p_name=>'P2024002_NMRO_LTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4335730745424805)
,p_prompt=>unistr('N\00FAmero De Lote')
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_prcso_prssvo_lte||''-''||cnsctvo_lte||''-''||obsrvcion_lte,id_prcso_prssvo_lte',
'from cb_g_procesos_persuasvo_lte'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2932939332971508)
,p_name=>'Al dar clic BTN_EXCEL'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2932637688971505)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2933078462971509)
,p_event_id=>wwv_flow_api.id(2932939332971508)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function descarga(){',
'    if (validarItem()){',
'       ',
'        apex.submit(''descargar_Excel'');',
'    }    ',
'}',
'',
'descarga();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2932545479971504)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_blob         blob;',
'  v_cdgo_rspsta  number;',
'  v_mnsje_rspsta varchar2(4000);',
'  v_nmbre_dcmnto varchar2(200);',
'begin',
'                            ',
' ',
'  pkg_cb_proceso_persuasivo.prc_gn_archvo_excel(p_cdgo_clnte   => :F_CDGO_CLNTE,',
'                                                p_nmro_lte     => :P2024002_NMRO_LTE,',
'                                                p_fcha_lte     => :P2024002_FCHA_LTE,                                                ',
'                                                o_file_blob    => v_blob,',
'                                                o_cdgo_rspsta  => v_cdgo_rspsta,',
'                                                o_mnsje_rspsta => v_mnsje_rspsta);',
'                            ',
'  htp.init;',
'  owa_util.mime_header(''application/ms-excel'', false);',
'  ',
'  v_nmbre_dcmnto := ''Estadisticas_Persuasivo_''|| :P2024002_NMRO_LTE||''_''|| to_char(sysdate,''yyyymmddhhmiss'');',
'  ',
'  htp.p(''Content-length: '' ||sys.dbms_lob.getlength(v_blob) );  ',
'  htp.p(''Content-Disposition: attachment; filename="''|| v_nmbre_dcmnto ||''.xlsx"'');  ',
'  htp.p(''Cache-Control: max-age=0'');',
'  owa_util.http_header_close;  ',
'  wpg_docload.download_file(v_blob);  ',
'  apex_application.stop_apex_engine;',
'  ',
'  exception',
'    when others then',
'        apex_error.add_error(p_message          => v_mnsje_rspsta,',
'                         p_display_location => apex_error.c_inline_in_notification);                         ',
'  ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'descargar'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
