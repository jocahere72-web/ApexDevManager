prompt --application/pages/page_00036
begin
wwv_flow_api.create_page(
 p_id=>36
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Proceso de seleccion embargos'
,p_step_title=>'Proceso de seleccion embargos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function recorrer_grid() { ',
'    ',
'   var region = apex.region("cartera");',
'    if (region) {',
'        ',
'       var view = apex.region("cartera").widget().interactiveGrid("getViews", "grid");',
'       var model = view.model;  ',
'       var records = view.view$.grid("getSelectedRecords");',
'               ',
'       var json = records.map(function(record){',
'           return { "cdgo_clnte"        : model.getValue(record , "CDGO_CLNTE").trim(),',
'                    "id_impsto"         : model.getValue(record , "ID_IMPSTO").trim(),',
'                    "id_impsto_sbmpsto" : model.getValue(record , "ID_IMPSTO_SBMPSTO").trim(),',
'                    "cdgo_mvmnto_orgn"  : model.getValue(record , "CDGO_MVMNTO_ORGN").trim(),',
'                    "id_orgen"          : model.getValue(record , "ID_ORGEN").trim(),',
'                    "id_mvmnto_fncro"   : model.getValue(record , "ID_MVMNTO_FNCRO").trim(),',
'                    "id_sjto_impsto"    : model.getValue(record , "ID_SJTO_IMPSTO").trim(),',
'                    "vgncia"            : model.getValue(record , "VGNCIA").trim(),',
'                    "prdo"              : model.getValue(record , "ID_PRDO"),',
'                    "id_cncpto"         : model.getValue(record , "ID_CNCPTO"),',
'                   "vlor_sldo_cptal"    : model.getValue(record , "VLOR_SLDO_CPTAL").trim().split(''.'').join(''''),',
'                   "vlor_intres"        : model.getValue(record , "VLOR_INTRES").trim().split(''.'').join('''')',
'                  };',
'       });',
'       $(''#P36_JSON'').val(json.length > 0 ? JSON.stringify(json) : '''');',
'       if (json.length > 0 ) {',
'          ',
'          apex.item( "BTN_INSRTAR" ).show();',
'          apex.item( "BTN_AGRGAR_SJTO" ).show();',
'       }else{',
'           ',
'         apex.item( "BTN_AGRGAR_SJTO" ).hide();  ',
'         apex.item( "BTN_INSRTAR" ).hide();  ',
'       } ',
'       return;',
'   }   ',
'   ',
'    apex.item( "BTN_INSRTAR" ).hide();',
'    apex.item( "BTN_AGRGAR_SJTO" ).hide();',
'   ',
'}'))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(17445683081942948)
,p_last_updated_by=>'ACARABALLO'
,p_last_upd_yyyymmddhh24miss=>'20240801073939'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(91488341362759434)
,p_plug_name=>unistr('Observaci\00F3n de Lote')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104361563365306739)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104364443787306768)
,p_plug_name=>'Propietarios'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_rzon_scial,',
'       a.dscrpcion_idntfccion_tpo ,',
'       a.idntfccion_rspnsble',
'  from v_si_i_sujetos_responsable a',
'  join si_c_sujetos b ',
'    on a.id_sjto    = b.id_sjto',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_sjto    = :P36_ID_SJTO',
'group by a.nmbre_rzon_scial,',
'       a.dscrpcion_idntfccion_tpo ,',
'       a.idntfccion_rspnsble;',
'   '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P36_ID_SJTO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104365776321306781)
,p_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_IDNTFCCION_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Tipo Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(104365931768306782)
,p_name=>'IDNTFCCION_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_RSPNSBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
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
 p_id=>wwv_flow_api.id(106213540185878743)
,p_name=>'NMBRE_RZON_SCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RZON_SCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Nombre \00F3 Raz\00F3n Social')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
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
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(104365613782306779)
,p_internal_uid=>104365613782306779
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
 p_id=>wwv_flow_api.id(104748809521786561)
,p_interactive_grid_id=>wwv_flow_api.id(104365613782306779)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(104748892711786561)
,p_report_id=>wwv_flow_api.id(104748809521786561)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104749751735786568)
,p_view_id=>wwv_flow_api.id(104748892711786561)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(104365776321306781)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>163
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104750326611786569)
,p_view_id=>wwv_flow_api.id(104748892711786561)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(104365931768306782)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106230875514290029)
,p_view_id=>wwv_flow_api.id(104748892711786561)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(106213540185878743)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>197
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104365984555306783)
,p_plug_name=>'tabulador'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(17363723095919377)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P36_ID_SJTO'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104755998009813060)
,p_plug_name=>'Cartera'
,p_region_name=>'cartera'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_clnte,',
'       a.id_impsto,',
'       a.id_impsto_sbmpsto,',
'       a.cdgo_mvmnto_orgn,',
'       a.id_orgen,',
'       a.id_mvmnto_fncro,',
'       a.id_sjto_impsto,',
'       a.vgncia ,',
'       a.id_prdo,',
'	   a.prdo,',
'	   a.id_cncpto,',
'	   a.cdgo_cncpto,',
'	   a.dscrpcion_cncpto ,',
'	   a.vlor_sldo_cptal,',
'	   nvl(a.vlor_intres,0) vlor_intres,',
'	   rownum as num',
'  from v_gf_g_cartera_x_concepto a',
'  join si_i_sujetos_impuesto b',
'    on b.id_sjto_impsto    = a.id_sjto_impsto     ',
' where a.cdgo_clnte        = :F_CDGO_CLNTE',
'   and b.id_sjto           = :P36_ID_SJTO   ',
'   and a.id_impsto         = nvl(:P36_ID_IMPSTO, a.id_impsto)',
'   and a.id_impsto_sbmpsto = nvl(:P36_ID_IMPSTO_SBMPSTO, a.id_impsto_sbmpsto)',
'   and a.vlor_sldo_cptal   > 0',
'   and trunc(a.fcha_vncmnto) <= trunc(sysdate)',
'   and a.cdgo_mvnt_fncro_estdo = ''NO''',
'   and a.indcdor_mvmnto_blqdo = ''N''',
'   and a.dscrpcion_mvnt_fncro_estdo = ''Normal''',
'   and exists (select 1',
'                 from gf_g_movimientos_financiero b',
'                where a.cdgo_clnte = b.cdgo_clnte',
'                  and a.id_impsto = b.id_impsto',
'                  and a.id_impsto_sbmpsto = b.id_impsto_sbmpsto',
'                  and a.id_sjto_impsto = b.id_sjto_impsto',
'                  and a.vgncia = b.vgncia',
'                  and a.id_prdo = b.id_prdo',
'                 -- and trunc(b.fcha_vncmnto) <= trunc(sysdate)',
'                  and b.cdgo_mvnt_fncro_estdo = ''NO''',
'                  and a.vlor_sldo_cptal > 0)',
'   and not exists(select 1 ',
'                    from mc_g_embargos_smu_mvmnto c ',
'                   where c.cdgo_clnte = a.cdgo_clnte',
'                     and c.id_impsto = a.id_impsto',
'                     and c.id_impsto_sbmpsto = a.id_impsto_sbmpsto',
'                     and c.id_sjto_impsto = a.id_sjto_impsto ',
'                     and c.vgncia = a.vgncia',
'                     and c.id_prdo = a.id_prdo',
'                     and c.id_cncpto = a.id_cncpto',
'                     and c.cdgo_mvmnto_orgn = a.cdgo_mvmnto_orgn',
'                     and c.id_orgen = a.id_orgen',
'                     and c.id_mvmnto_fncro = a.id_mvmnto_fncro',
'                     and exists (select 2',
'                                   from mc_g_embargos_simu_lote d, mc_g_embargos_simu_sujeto e',
'                                  where d.id_embrgos_smu_lte = e.id_embrgos_smu_lte',
'                                    and e.id_embrgos_smu_sjto = c.id_embrgos_smu_sjto',
'                                    and d.id_tpos_mdda_ctlar = :P36_ID_TPOS_EMBRGO))/* control que hace de cartera y valida que tenga saldo y no se encuentre en ningun proceso (iniciado) de embargo para x vigencia*/',
'    and (exists(select 1',
'                from cb_g_procesos_jrdco_mvmnto d',
'               join cb_g_procesos_juridico e on d.id_prcsos_jrdco = e.id_prcsos_jrdco',
'              where e.nmro_prcso_jrdco = :P36_NMRO_PRCSO_JRDCO',
'                and a.id_mvmnto_fncro = d.id_mvmnto_fncro',
'                and a.vgncia = d.vgncia',
'                and a.id_prdo = d.id_prdo',
'                and a.id_cncpto = d.id_cncpto)   or  :P36_NMRO_PRCSO_JRDCO is null)                     ',
'                                    ',
'                                    '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P36_ID_SJTO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(38951787830269712)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(38951860052269713)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(38951908284269714)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(38952038328269715)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(38952106127269716)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(38952264158269717)
,p_name=>'ID_MVMNTO_FNCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_MVMNTO_FNCRO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104756209401813062)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(104756268795813063)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104756402049813064)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(104756482430813065)
,p_name=>'ID_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104756630424813066)
,p_name=>'CDGO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104756727973813067)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(104756748799813068)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(104756847247813069)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo Interes'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(104756963768813070)
,p_name=>'NUM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NUM'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104757081070813071)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104757184946813072)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(107679086323177940)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(104756097455813061)
,p_internal_uid=>104756097455813061
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
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
 p_id=>wwv_flow_api.id(104856751947088655)
,p_interactive_grid_id=>wwv_flow_api.id(104756097455813061)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(104856891739088655)
,p_report_id=>wwv_flow_api.id(104856751947088655)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49796716306722886)
,p_view_id=>wwv_flow_api.id(104856891739088655)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(38951787830269712)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49797218447722890)
,p_view_id=>wwv_flow_api.id(104856891739088655)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(38951860052269713)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49797782656722892)
,p_view_id=>wwv_flow_api.id(104856891739088655)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(38951908284269714)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49798251667722893)
,p_view_id=>wwv_flow_api.id(104856891739088655)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(38952038328269715)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49798721099722895)
,p_view_id=>wwv_flow_api.id(104856891739088655)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(38952106127269716)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49799236094722896)
,p_view_id=>wwv_flow_api.id(104856891739088655)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(38952264158269717)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104857361455088656)
,p_view_id=>wwv_flow_api.id(104856891739088655)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(104756209401813062)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>66
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104857887911088657)
,p_view_id=>wwv_flow_api.id(104856891739088655)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(104756268795813063)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104858358278088659)
,p_view_id=>wwv_flow_api.id(104856891739088655)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(104756402049813064)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>63
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104858908116088660)
,p_view_id=>wwv_flow_api.id(104856891739088655)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(104756482430813065)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104859404510088661)
,p_view_id=>wwv_flow_api.id(104856891739088655)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(104756630424813066)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>136
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104859872071088662)
,p_view_id=>wwv_flow_api.id(104856891739088655)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(104756727973813067)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>146
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104860393858088664)
,p_view_id=>wwv_flow_api.id(104856891739088655)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(104756748799813068)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104860895783088665)
,p_view_id=>wwv_flow_api.id(104856891739088655)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(104756847247813069)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104861390773088666)
,p_view_id=>wwv_flow_api.id(104856891739088655)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(104756963768813070)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104862623338090604)
,p_view_id=>wwv_flow_api.id(104856891739088655)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(104757081070813071)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(107707670350261245)
,p_view_id=>wwv_flow_api.id(104856891739088655)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(107679086323177940)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104757578952813076)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(104758324779813083)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'',
'<p>Esta funcionalidad permite gestionar los procesos de seleccion de poblacion del proceso juridico.</p>',
'<p> </p>',
'<p> </p>',
'<p><b>Nota:</b> Solo se enviaran los conceptos seleccionados </p>',
'<b><i>1.</i></b>permite consultar una identificacion especifica para seleccionar la cartera que se va a incluir en un lote por medio del boton "Consultar".<br><br>',
'<b><i>2.</i></b>permite consultar por medio de parametros una identificacion para seleccionar la cartera que se va a incluir en un lote por medio del boton "Consulta x Parametros".<br><br>',
'<b><i>3.</i></b>permite realizar una seleccion masiva escogiendo una regla ya preestablecida para incluirla en un lote por medio del boton "Seleccion Masiva x Regla".<br><br>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(110127887947985342)
,p_plug_name=>'Lote seleccionado'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<b>Lote seleccionado</b> &P36_OBSRVCION.'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74105305874470267)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(104757578952813076)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:&P36_BRANCH.:&SESSION.::&DEBUG.:RP:P8_ID_PRCSO_SMU_LOTE:&P36_ID_PRCSO_SMU_LOTE.'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74105746629470267)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(104757578952813076)
,p_button_name=>'BTN_INSRTAR'
,p_button_static_id=>'BTN_INSRTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'return :p36_id_embrgos_smu_lte is null and :P36_ID_SJTO is not null;',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74104966140470267)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(104757578952813076)
,p_button_name=>'BTN_AGRGAR_SJTO'
,p_button_static_id=>'BTN_AGRGAR_SJTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar Sujeto'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'return :P36_ID_EMBRGOS_SMU_LTE is not null and :P36_ID_SJTO is not null;',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74090511163470242)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(104361563365306739)
,p_button_name=>'BTN_CONSLTR_PRMTROS'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>unistr('Consultar x Par\00E1metros')
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=71000:146:&SESSION.::&DEBUG.:RP,146:P146_NMRO_APP,P146_NMRO_PGNA,P146_NMBRE_ITEM,P146_ID_TPOS_EMBRGO,P146_VLDAR_CRTRA:&APP_ID.,&APP_PAGE_ID.,P36_ID_SJTO,&P36_ID_TPOS_EMBRGO.,null'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74090195451470242)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(104361563365306739)
,p_button_name=>'BTN_CONSLTR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73468268587603248)
,p_name=>'P36_ID_TPOS_EMBRGO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(104361563365306739)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74090980033470244)
,p_name=>'P36_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(104361563365306739)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el impuesto por el cual desea consultar de forma puntual.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'500'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74091808343470248)
,p_name=>'P36_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(104361563365306739)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P36_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P36_ID_IMPSTO'
,p_ajax_items_to_submit=>'P36_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el sub-impuesto por el cual desea consultar de forma puntual. La informaci\00F3n mostrada depende del impuesto que se escoja.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74092712146470248)
,p_name=>'P36_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(104361563365306739)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la Identificaci\00F3n del Sujeto, ya sea de manera directa mediante digitaci\00F3n o mediante la opci\00F3n del bot\00F3n Consulta Par\00E1metro')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74093687531470248)
,p_name=>'P36_ID_SJTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(104361563365306739)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74094050244470249)
,p_name=>'P36_RSPSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(104361563365306739)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74094462345470249)
,p_name=>'P36_ID_EMBRGOS_SMU_LTE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(104361563365306739)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74094845728470250)
,p_name=>'P36_JSON'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(104361563365306739)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74098276825470259)
,p_name=>'P36_OBSRVCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(110127887947985342)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_obsrvcion varchar2(100);',
'begin',
'',
'    select obsrvcion',
'      into v_obsrvcion',
'      from cb_g_procesos_simu_lote',
'     where cdgo_clnte = :F_CDGO_CLNTE ',
'       and id_prcsos_smu_lte = :P36_ID_PRCSO_SMU_LOTE;',
'    ',
'    return v_obsrvcion;',
'exception when no_data_found then',
'    return '''';',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74106151593470267)
,p_name=>'P36_BRANCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(104757578952813076)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91488439888759435)
,p_name=>'P36_LTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(91488341362759434)
,p_prompt=>unistr('Lote de selecci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Es el lote de selecci\00F3n realizado por un funcionario.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91488566840759436)
,p_name=>'P36_OBSRVCION_LTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(91488341362759434)
,p_prompt=>unistr('Observaci\00F3n de Lote ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Muestra la observaci\00F3n del lote que fue ingresada cuando se genero un lote nuevo de selecci\00F3n de candidatos.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153747484843710201)
,p_name=>'P36_NMRO_PRCSO_JRDCO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(104361563365306739)
,p_prompt=>unistr('No. Proceso Jur\00EDdico')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(73468345684603249)
,p_computation_sequence=>10
,p_computation_item=>'P36_ID_TPOS_EMBRGO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_tpos_mdda_ctlar',
'from mc_g_embargos_simu_lote',
'where id_embrgos_smu_lte = :P34_ID_EMBRGOS_SMU_LTE'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(91488669867759437)
,p_computation_sequence=>20
,p_computation_item=>'P36_LTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''*Lote: ''||a.id_embrgos_smu_lte||'' *Fecha: ''||to_char(a.fcha_lte,''dd/mm/yyyy'')||'' *Funcionario: ''||b.nmbre_trcro||'' *Tipo: ''||c.dscrpcion as descripcion',
'  from mc_g_embargos_simu_lote a, v_sg_g_usuarios b, mc_d_tipos_mdda_ctlar c',
' where a.id_fncnrio = b.id_fncnrio',
'   and a.id_tpos_mdda_ctlar = c.id_tpos_mdda_ctlar',
'   and a.id_embrgos_smu_lte = :P36_ID_EMBRGOS_SMU_LTE',
'   and a.cdgo_clnte = :F_CDGO_CLNTE ;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(91488738184759438)
,p_computation_sequence=>30
,p_computation_item=>'P36_OBSRVCION_LTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select obsrvcion ',
'from mc_g_embargos_simu_lote',
'where id_embrgos_smu_lte = :P36_ID_EMBRGOS_SMU_LTE;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(74106622390470275)
,p_validation_name=>'validar cartera seleccionada'
,p_validation_sequence=>10
,p_validation=>'P36_JSON'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'No se ha seleccionado una cartera'
,p_when_button_pressed=>wwv_flow_api.id(74105746629470267)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(74108930002470279)
,p_name=>'antes de enviar la pagina'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforepagesubmit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74109458433470279)
,p_event_id=>wwv_flow_api.id(74108930002470279)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'recorrer_grid();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(74109832773470279)
,p_name=>'al hacer clic en la grid conceptos'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(104755998009813060)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74110801789470280)
,p_event_id=>wwv_flow_api.id(74109832773470279)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'recorrer_grid();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74110372338470279)
,p_event_id=>wwv_flow_api.id(74109832773470279)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    apex_util.set_session_state(''P36_JSON'', :P36_JSON);',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(74108018545470278)
,p_name=>'al cargar la pagina'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74108528370470278)
,p_event_id=>wwv_flow_api.id(74108018545470278)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).ready(function() {  ',
'    var region = apex.region("cartera");',
'    if (region) {',
'        apex.region("cartera").widget().interactiveGrid("setSelectedRecords", []);',
'    }',
'    recorrer_grid();      ',
'});',
'',
'',
'    '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74107218834470277)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar sujeto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto number;    ',
'begin',
'    if (:P36_IDNTFCCION is not null) then',
'        select id_sjto',
'          into :P36_ID_SJTO',
'          from si_c_sujetos',
'         where cdgo_clnte    = :F_CDGO_CLNTE ',
'           and idntfccion    = :P36_IDNTFCCION;',
'     else',
'           select id_sjto ',
'           into :P36_ID_SJTO',
'           from CB_G_PROCESOS_JURIDICO_SJTO a',
'            join cb_g_procesos_juridico b on b.id_prcsos_jrdco = a.id_prcsos_jrdco',
'            and b.nmro_prcso_jrdco = :P36_NMRO_PRCSO_JRDCO;',
'      end if;',
'       ',
'    :P36_RSPSTA := '''';  ',
'    ',
'exception when no_data_found then ',
'          :P36_ID_SJTO := null;',
'          :P36_RSPSTA := ''No Existe el Sujeto'';',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(74090195451470242)
,p_process_success_message=>'&P36_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74107636730470277)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Registrar Lote de selecci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
' v_lte_nvo number;',
'begin',
'    ',
'    insert into muerto (v_001,c_001) values (''json json'',:P36_JSON);commit;',
'    pkg_cb_medidas_cautelares.prc_rg_slcion_embrgos (p_cdgo_clnte       => :F_CDGO_CLNTE,',
'                                                            p_lte_simu         => :P36_ID_EMBRGOS_SMU_LTE,',
'                                                            p_sjto_id          => :P36_ID_SJTO,',
'                                                            p_id_usuario       => :F_ID_USRIO,',
'                                                            p_json_movimientos => :P36_JSON,',
'                                                            p_lte_nvo          => v_lte_nvo);',
'                                                             ',
'    :P36_ID_EMBRGOS_SMU_LTE := v_lte_nvo;',
'    :P36_ID_SJTO           := null;',
'    :P36_ID_IMPSTO         := null;',
'    :P36_ID_IMPSTO_SBMPSTO := null;',
'    :P36_IDNTFCCION        := null;',
'    :P36_NMRO_PRCSO_JRDCO  := null;',
'    ',
'end;'))
,p_process_error_message=>'No se pudo realizar el proceso.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_INSRTAR,BTN_AGRGAR_SJTO'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'Registro exitoso.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74106871836470276)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Despu\00E9s de cargar la pagina')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'',
'begin',
'    ',
'    select a.idntfccion_sjto,',
'           a.id_sjto',
'      into :P36_IDNTFCCION,',
'           :P36_ID_SJTO',
'      from v_si_c_sujetos a',
'     where a.cdgo_clnte      = :F_CDGO_CLNTE',
'       and a.id_sjto         = :P36_ID_SJTO;',
'       --and a.idntfccion_sjto = nvl(:P36_IDNTFCCION, a.idntfccion_sjto) ',
'       --and (:P36_ID_SJTO is not null or  :P36_IDNTFCCION is not null);',
'       ',
'exception when no_data_found then ',
'         -- null;        ',
'          apex_util.set_session_state(''P36_IDNTFCCION'',  '''');',
'          apex_util.set_session_state(''P36_ID_SJTO'',  '''');',
'end;',
'',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
