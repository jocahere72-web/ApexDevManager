prompt --application/pages/page_20250_002
begin
wwv_flow_api.create_page(
 p_id=>2025005
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Resumen de Reliquidaci\00F3n - Resoluciones Predial')
,p_step_title=>unistr('Resumen de Reliquidaci\00F3n - Resoluciones Predial')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
''))
,p_javascript_code_onload=>'//ocultarAyudaD();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*.a-IRR-controlsContainer{',
'    display: none !important;',
'}*/'))
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20250930100411'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9984950846819431)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center;">',
'        <b>',
'            <i>Opciones <i class="fa fa-gears" aria-hidden="true"></i>',
'			</i>',
'        </b>',
'    </div>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(139028413442558663)
,p_plug_name=>'Form Reliquidacion Resolucion Predial'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:margin-bottom-sm'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9986147271819443)
,p_plug_name=>'Predios'
,p_parent_plug_id=>wwv_flow_api.id(139028413442558663)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_sjto_impsto ,idntfccion_sjto ',
'from    v_si_i_sujetos_impuesto',
'where   cdgo_clnte = :F_CDGO_CLNTE and id_impsto = :P2025005_ID_IMPSTO',
'and     idntfccion_sjto in (',
'    select  RFRNCIA_IGAC',
'    from    si_g_resolucion_igac_t1',
'    where   rslcion = :P2025005_RSLCION',
'    and		rdccion = :P2025005_RDCCION )'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9986361674819445)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9986422069819446)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identifcaci\00F3n Sujeto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(9986635278819448)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(9986243777819444)
,p_internal_uid=>9986243777819444
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
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
 p_id=>wwv_flow_api.id(10043328152983354)
,p_interactive_grid_id=>wwv_flow_api.id(9986243777819444)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(10043450148983355)
,p_report_id=>wwv_flow_api.id(10043328152983354)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10043911354983359)
,p_view_id=>wwv_flow_api.id(10043450148983355)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(9986361674819445)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10044458646983363)
,p_view_id=>wwv_flow_api.id(10043450148983355)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(9986422069819446)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9986870898819450)
,p_plug_name=>'Informacion predio'
,p_parent_plug_id=>wwv_flow_api.id(139028413442558663)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(88543343085834669)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10057063498118601)
,p_plug_name=>'Liquidaciones'
,p_parent_plug_id=>wwv_flow_api.id(9986870898819450)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_display_when_condition=>'P2025005_CDGO_MTCION_CLSE'
,p_plug_display_when_cond2=>'1'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9982666340819408)
,p_plug_name=>'Liquidaciones Anterior'
,p_parent_plug_id=>wwv_flow_api.id(10057063498118601)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (',
'select  x.id_sjto_impsto',
'        , max(x.id_lqdcion) id_lqdcion',
'        , x.vgncia',
'        , x.prdo ',
'        , e.cdgo_cncpto',
'        , e.dscrpcion',
'        , c.vlor_lqddo',
'        , c.txto_trfa',
'        , c.bse_cncpto',
'        , decode( c.indcdor_lmta_impsto , ''N'' , ''No'' , ''Si'' ) as indcdor_lmta_impsto',
'from    v_gi_g_liquidaciones            x',
'join 	gi_g_liquidaciones_concepto 	c on x.id_lqdcion = c.id_lqdcion',
'join 	df_i_impuestos_acto_concepto	d on c.id_impsto_acto_cncpto = d.id_impsto_acto_cncpto',
'join 	df_i_conceptos 					e on d.id_cncpto  = e.id_cncpto',
'join    si_g_resolucion_igac_t1         y on x.id_sjto_impsto = y.id_sjto_impsto',
'where   y.rslcion = :P2025005_RSLCION',
'and		y.rdccion = :P2025005_RDCCION',
'and     y.cncla_inscrbe = ''C''',
'and     x.vgncia = extract(year from sysdate)',
'and     not exists (select  * ',
'                    from    si_g_resolucion_igac_t1 z',
'                    where   z.rslcion = y.rslcion',
'                    and		z.rdccion = y.rdccion ',
'                    and     z.id_sjto_impsto = y.id_sjto_impsto',
'                    and     z.cncla_inscrbe = ''I'')',
'group by x.id_sjto_impsto  , x.vgncia',
'        , x.prdo ',
'        , e.cdgo_cncpto',
'        , e.dscrpcion',
'        , c.vlor_lqddo',
'        , c.bse_cncpto',
'        , c.txto_trfa',
'        , c.indcdor_lmta_impsto',
'union all    ',
'   select b.id_sjto_impsto',
'          , b.id_lqdcion_antrior as id_lqdcion',
'          , b.vgncia',
'          , b.prdo ',
'          , e.cdgo_cncpto',
'          , e.dscrpcion',
'          , c.vlor_lqddo',
'          , c.txto_trfa',
'          , c.bse_cncpto',
'          , decode( c.indcdor_lmta_impsto , ''N'' , ''No'' , ''Si'' ) as indcdor_lmta_impsto',
'       from v_gi_g_liquidaciones         b',
'       join gi_g_liquidaciones_concepto  c on b.id_lqdcion_antrior = c.id_lqdcion',
'       join df_i_impuestos_acto_concepto d on c.id_impsto_acto_cncpto = d.id_impsto_acto_cncpto',
'       join df_i_conceptos               e on d.id_cncpto  = e.id_cncpto',
'       join si_g_resolucion_igac_t3      t on b.id_lqdcion = t.id_lqdcion ',
'where rslcion = :P2025005_RSLCION',
' and		rdccion = :P2025005_RDCCION',
'--and		indcdor_ajste = ''S''',
'--   order by b.vgncia desc, b.prdo desc',
')'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(9986147271819443)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10111107044708508)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(9986361674819445)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10111287087708509)
,p_name=>'ID_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_LQDCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 Liquidaci\00F3n')
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(10111354916708510)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10111482945708511)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>40
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10111553509708512)
,p_name=>'CDGO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('C\00F3digo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10111683948708513)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(10111756666708514)
,p_name=>'VLOR_LQDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_LQDDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Liquidado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(10111866018708515)
,p_name=>'TXTO_TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_TRFA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tarifa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(10111914840708516)
,p_name=>'BSE_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BSE_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Base'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(10112026321708517)
,p_name=>'INDCDOR_LMTA_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_LMTA_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFLimita?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(10111068347708507)
,p_internal_uid=>10111068347708507
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(10130806358007899)
,p_interactive_grid_id=>wwv_flow_api.id(10111068347708507)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(10130924285007899)
,p_report_id=>wwv_flow_api.id(10130806358007899)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10131445492007900)
,p_view_id=>wwv_flow_api.id(10130924285007899)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(10111107044708508)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10131900469007902)
,p_view_id=>wwv_flow_api.id(10130924285007899)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(10111287087708509)
,p_is_visible=>false
,p_is_frozen=>false
,p_break_order=>15
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10132486677007903)
,p_view_id=>wwv_flow_api.id(10130924285007899)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(10111354916708510)
,p_is_visible=>false
,p_is_frozen=>false
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10132966313007905)
,p_view_id=>wwv_flow_api.id(10130924285007899)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(10111482945708511)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10133450111007906)
,p_view_id=>wwv_flow_api.id(10130924285007899)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(10111553509708512)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10133965998007908)
,p_view_id=>wwv_flow_api.id(10130924285007899)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(10111683948708513)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10134435546007910)
,p_view_id=>wwv_flow_api.id(10130924285007899)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(10111756666708514)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10134913708007911)
,p_view_id=>wwv_flow_api.id(10130924285007899)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(10111866018708515)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10135453290007913)
,p_view_id=>wwv_flow_api.id(10130924285007899)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(10111914840708516)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10135926896007914)
,p_view_id=>wwv_flow_api.id(10130924285007899)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(10112026321708517)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9983745441819419)
,p_plug_name=>'Liquidaciones Actual'
,p_parent_plug_id=>wwv_flow_api.id(10057063498118601)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	select  b.id_sjto_impsto, b.id_lqdcion',
'			, b.vgncia',
'			, b.prdo ',
'			, nvl2( b.id_lqdcion_antrior , ''No'' , ''Si'' ) as indcdor_nvo',
'			, e.cdgo_cncpto',
'			, e.dscrpcion',
'			, c.vlor_lqddo',
'			, c.bse_cncpto',
'			, c.txto_trfa',
'			, decode( c.indcdor_lmta_impsto , ''N'' , ''No'' , ''Si'' ) as indcdor_lmta_impsto',
'	from 	v_gi_g_liquidaciones 			b',
'	join 	gi_g_liquidaciones_concepto 	c on b.id_lqdcion = c.id_lqdcion',
'	join 	df_i_impuestos_acto_concepto	d on c.id_impsto_acto_cncpto = d.id_impsto_acto_cncpto',
'	join 	df_i_conceptos 					e on d.id_cncpto  = e.id_cncpto',
'    join    si_g_resolucion_igac_t3         t on b.id_lqdcion = t.id_lqdcion ',
'                                        and rslcion = :P2025005_RSLCION',
'                                        and		rdccion = :P2025005_RDCCION',
'                                        --and		indcdor_ajste = ''S''',
'	--order by b.vgncia desc 			, b.prdo desc'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(9986147271819443)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10113281417708529)
,p_name=>'ID_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_LQDCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 Liquidaci\00F3n')
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>10
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(10113346548708530)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>20
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(10113442381708531)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10113528624708532)
,p_name=>'INDCDOR_NVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_NVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFNueva Vigencia?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(10113623350708533)
,p_name=>'CDGO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('C\00F3digo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10113734819708534)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(10113826412708535)
,p_name=>'VLOR_LQDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_LQDDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Liquidado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(10113923561708536)
,p_name=>'BSE_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BSE_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Base'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(10114015904708537)
,p_name=>'TXTO_TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_TRFA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tarifa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(10114168491708538)
,p_name=>'INDCDOR_LMTA_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_LMTA_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFLimita?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(10114288825708539)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(9986361674819445)
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(10113150343708528)
,p_internal_uid=>10113150343708528
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(10370885393190797)
,p_interactive_grid_id=>wwv_flow_api.id(10113150343708528)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(10370918266190797)
,p_report_id=>wwv_flow_api.id(10370885393190797)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1830070016559)
,p_view_id=>wwv_flow_api.id(10370918266190797)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(10114288825708539)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10371413498190799)
,p_view_id=>wwv_flow_api.id(10370918266190797)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(10113281417708529)
,p_is_visible=>false
,p_is_frozen=>false
,p_break_order=>15
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10371911241190801)
,p_view_id=>wwv_flow_api.id(10370918266190797)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(10113346548708530)
,p_is_visible=>false
,p_is_frozen=>false
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10372470662190804)
,p_view_id=>wwv_flow_api.id(10370918266190797)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(10113442381708531)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10372926073190806)
,p_view_id=>wwv_flow_api.id(10370918266190797)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(10113528624708532)
,p_is_visible=>false
,p_is_frozen=>false
,p_break_order=>20
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10373413936190807)
,p_view_id=>wwv_flow_api.id(10370918266190797)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(10113623350708533)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10373988849190809)
,p_view_id=>wwv_flow_api.id(10370918266190797)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(10113734819708534)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10374444785190810)
,p_view_id=>wwv_flow_api.id(10370918266190797)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(10113826412708535)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10374967231190812)
,p_view_id=>wwv_flow_api.id(10370918266190797)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(10113923561708536)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10375479304190815)
,p_view_id=>wwv_flow_api.id(10370918266190797)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(10114015904708537)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10375887095190817)
,p_view_id=>wwv_flow_api.id(10370918266190797)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(10114168491708538)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10057235892118603)
,p_plug_name=>unistr('Caracter\00EDsticas del Predio')
,p_parent_plug_id=>wwv_flow_api.id(9986870898819450)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10057318149118604)
,p_plug_name=>unistr('Caracter\00EDsticas Anterior')
,p_parent_plug_id=>wwv_flow_api.id(10057235892118603)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (',
'select  b.id_sjto_impsto, d.dscrpcion_prdio_clsfccion, e.dscrpcion, a.cdgo_estrto, ',
'        f.nmbre_dstno_igac, b.bse_grvble, a.area_trrno, a.area_cnsctrda,',
'        decode(t2.mtrcla_inmblria, null, p.mtrcla_inmblria, t2.mtrcla_inmblria)  mtrcla_inmblria',
'        /*case when t2.mtrcla_inmblria is null then',
'            ( select mtrcla_inmblria from si_i_predios where id_sjto_impsto = b.id_sjto_impsto)',
'        else',
'            t2.mtrcla_inmblria',
'        end mtrcla_inmblria*/',
'from    gi_g_liquidaciones_ad_predio a',
'join    v_gi_g_liquidaciones         b on  a.id_lqdcion = b.id_lqdcion',
'join    ( select  clse_mtcion, rfrncia_igac, dstno_ecnmco',
'          from    si_g_resolucion_igac_t1',
'          where   rslcion = :P2025005_RSLCION',
'          and	  rdccion = :P2025005_RDCCION ',
'          and     cncla_inscrbe = ''I'' ) t1 on b.idntfccion_sjto = t1.rfrncia_igac           ',
'left join    ( select  rfrncia_igac , mtrcla_inmblria',
'          from    si_g_resolucion_igac_t2',
'          where   rslcion = :P2025005_RSLCION',
'          and	  rdccion = :P2025005_RDCCION',
'          and     cncla_inscrbe = ''I'' ) t2 on b.idntfccion_sjto = t2.rfrncia_igac ',
'join    df_s_predios_clasificacion      d on a.cdgo_prdio_clsfccion = d.cdgo_prdio_clsfccion   ',
'join    df_i_predios_destino            e on a.id_prdio_dstno = e.id_prdio_dstno          ',
'join    df_s_destinos_igac              f on t1.dstno_ecnmco = f.cdgo_dstno_igac  ',
'join    si_i_predios                    p on b.id_sjto_impsto = p.id_sjto_impsto                ',
'where  -- b.id_sjto_impsto = 2870587',
'--and    ',
'    b.id_prdo = :P2025005_ID_PRDO',
'  and ( case when t1.clse_mtcion = 1 then',
'            ''L''',
'        else ''I''',
'        end ) = b.cdgo_lqdcion_estdo',
'order by b.id_lqdcion desc',
'fetch first 1 row only)'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(9986147271819443)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10057544069118606)
,p_name=>'DSCRPCION_PRDIO_CLSFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_PRDIO_CLSFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Clasificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(10057664913118607)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Destino <br> Predial'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(10057701804118608)
,p_name=>'CDGO_ESTRTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ESTRTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estrato'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>3
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
 p_id=>wwv_flow_api.id(10057829730118609)
,p_name=>'NMBRE_DSTNO_IGAC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DSTNO_IGAC'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Destino <br> Igac'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(10057949648118610)
,p_name=>'BSE_GRVBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BSE_GRVBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Aval\00FAo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(10058088318118611)
,p_name=>'AREA_TRRNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AREA_TRRNO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('\00C1rea <br> Terreno')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(10058187253118612)
,p_name=>'AREA_CNSCTRDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AREA_CNSCTRDA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('\00C1rea <br> Construida')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(10058230869118613)
,p_name=>'MTRCLA_INMBLRIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MTRCLA_INMBLRIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Matr\00EDcula <br> Inmobiliaria')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(10058363219118614)
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
,p_parent_column_id=>wwv_flow_api.id(9986361674819445)
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(10057454837118605)
,p_internal_uid=>10057454837118605
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(10067352044786872)
,p_interactive_grid_id=>wwv_flow_api.id(10057454837118605)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(10067411616786872)
,p_report_id=>wwv_flow_api.id(10067352044786872)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10067965797786874)
,p_view_id=>wwv_flow_api.id(10067411616786872)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(10057544069118606)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10068462939786876)
,p_view_id=>wwv_flow_api.id(10067411616786872)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(10057664913118607)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10068982650786877)
,p_view_id=>wwv_flow_api.id(10067411616786872)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(10057701804118608)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10069447328786880)
,p_view_id=>wwv_flow_api.id(10067411616786872)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(10057829730118609)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10069943015786881)
,p_view_id=>wwv_flow_api.id(10067411616786872)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(10057949648118610)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10070467729786883)
,p_view_id=>wwv_flow_api.id(10067411616786872)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(10058088318118611)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10070909706786884)
,p_view_id=>wwv_flow_api.id(10067411616786872)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(10058187253118612)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10071432283786886)
,p_view_id=>wwv_flow_api.id(10067411616786872)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(10058230869118613)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10073115707802716)
,p_view_id=>wwv_flow_api.id(10067411616786872)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(10058363219118614)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10058613492118617)
,p_plug_name=>unistr('Caracter\00EDsticas Actual')
,p_parent_plug_id=>wwv_flow_api.id(10057235892118603)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_sjto_impsto, dscrpcion_prdio_clsfccion, dscrpcion_prdo_dstno, cdgo_estrto, nmbre_dstno_igac, avluo_ctstral, area_trrno, area_cnstrda, mtrcla_inmblria',
'from    v_si_i_predios'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(9986147271819443)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10058818659118619)
,p_name=>'DSCRPCION_PRDIO_CLSFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_PRDIO_CLSFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Clasificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(10059050131118621)
,p_name=>'CDGO_ESTRTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ESTRTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estrato'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>3
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
 p_id=>wwv_flow_api.id(10059130290118622)
,p_name=>'NMBRE_DSTNO_IGAC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DSTNO_IGAC'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Destino <br> Igac'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(10059375286118624)
,p_name=>'AREA_TRRNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AREA_TRRNO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('\00C1rea <br> Terreno')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(10059534405118626)
,p_name=>'MTRCLA_INMBLRIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MTRCLA_INMBLRIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Matr\00EDcula <br> Inmobiliaria')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(10059716833118628)
,p_name=>'DSCRPCION_PRDO_DSTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_PRDO_DSTNO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Destino <br> Predial'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(10059859625118629)
,p_name=>'AVLUO_CTSTRAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AVLUO_CTSTRAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Aval\00FAo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(10059930831118630)
,p_name=>'AREA_CNSTRDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AREA_CNSTRDA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('\00C1rea <br> Construida')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(10060016115118631)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(9986361674819445)
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(10058720114118618)
,p_internal_uid=>10058720114118618
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(10078936374925504)
,p_interactive_grid_id=>wwv_flow_api.id(10058720114118618)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(10079065568925505)
,p_report_id=>wwv_flow_api.id(10078936374925504)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10079567460925506)
,p_view_id=>wwv_flow_api.id(10079065568925505)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(10058818659118619)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10080082603925507)
,p_view_id=>wwv_flow_api.id(10079065568925505)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(10059050131118621)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10080586813925509)
,p_view_id=>wwv_flow_api.id(10079065568925505)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(10059130290118622)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10081049694925510)
,p_view_id=>wwv_flow_api.id(10079065568925505)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(10059375286118624)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10081556912925512)
,p_view_id=>wwv_flow_api.id(10079065568925505)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(10059534405118626)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10082061215925513)
,p_view_id=>wwv_flow_api.id(10079065568925505)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(10059716833118628)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10082557544925514)
,p_view_id=>wwv_flow_api.id(10079065568925505)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(10059859625118629)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10082913782925516)
,p_view_id=>wwv_flow_api.id(10079065568925505)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(10059930831118630)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10083480101925517)
,p_view_id=>wwv_flow_api.id(10079065568925505)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(10060016115118631)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10112135063708518)
,p_plug_name=>'DATOS'
,p_parent_plug_id=>wwv_flow_api.id(10057235892118603)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH datos AS (',
'    SELECT t1.id_sjto_impsto col11,',
'           t1.dscrpcion_prdio_clsfccion col12,',
'           t1.dscrpcion col13,',
'           to_char(t1.cdgo_estrto) col14,',
'           t1.nmbre_dstno_igac col15,',
'           to_char(t1.bse_grvble) col16,',
'           to_char(t1.area_trrno) col17,',
'           to_char(t1.area_cnsctrda) col18,',
'           t1.mtrcla_inmblria col19,',
'           t1.drccion col20,',
'           t1.lttud col40,      -- Latitud anterior',
'           t1.lngtud col41,     -- Longitud anterior',
'           t2.id_sjto_impsto col21,',
'           t2.dscrpcion_prdio_clsfccion col22,',
'           t2.dscrpcion_prdo_dstno col23,',
'           to_char(t2.cdgo_estrto) col24,',
'           t2.nmbre_dstno_igac col25,',
'           to_char(t2.avluo_ctstral) col26,',
'           to_char(t2.area_trrno) col27,',
'           to_char(t2.area_cnstrda) col28,',
'           t2.mtrcla_inmblria col29,',
'           s.drccion col30,',
'           t2.lttud col42,      -- Latitud actual',
'           t2.lngtud col43,     -- Longitud actual',
unistr('           ''Clasificaci\00F3n'' col31,'),
'           ''Destino Predial'' col32,',
'           ''Estrato'' col33,',
'           ''Destino Igac'' col34,',
unistr('           ''Aval\00FAo'' col35,'),
unistr('           ''\00C1rea Terreno'' col36,'),
unistr('           ''\00C1rea Construida'' col37,'),
unistr('           ''Matr\00EDcula Inmobiliaria'' col38,'),
unistr('           ''Direcci\00F3n'' col39,'),
'           ''Latitud'' col44,',
'           ''Longitud'' col45',
'    FROM v_si_i_predios t2',
'    JOIN v_si_i_sujetos_impuesto s',
'      ON t2.id_sjto_impsto = s.id_sjto_impsto',
'    LEFT JOIN (',
'        SELECT  MAX(b.id_lqdcion),',
'                b.id_sjto_impsto,',
'                d.dscrpcion_prdio_clsfccion,',
'                e.dscrpcion,',
'                a.cdgo_estrto,',
'                f.nmbre_dstno_igac,',
'                b.bse_grvble,',
'                a.area_trrno,',
'                a.area_cnsctrda,',
'                DECODE(TRIM(m.mtrcla_inmblria), NULL, TRIM(p.mtrcla_inmblria), TRIM(m.mtrcla_inmblria)) mtrcla_inmblria,',
'                TRIM(n.drccion) drccion,',
'                MAX(n.lttud) lttud,   -- Latitud anterior',
'                MAX(n.lngtud) lngtud  -- Longitud anterior',
'        FROM    gi_g_liquidaciones_ad_predio a',
'        JOIN    v_gi_g_liquidaciones b',
'          ON    a.id_lqdcion = b.id_lqdcion',
'         AND    cdgo_lqdcion_estdo IN (''L'',''I'')',
'        JOIN    (',
'                  SELECT DISTINCT clse_mtcion, rfrncia_igac, dstno_ecnmco,',
'                                  cncla_inscrbe, drccion, lttud, lngtud',
'                  FROM   si_g_resolucion_igac_t1',
'                  WHERE  rslcion = :P2025005_RSLCION',
'                  AND    rdccion = :P2025005_RDCCION',
'                  AND    cncla_inscrbe = ''I''',
'                  UNION',
'                  SELECT DISTINCT clse_mtcion, rfrncia_igac, dstno_ecnmco,',
'                                  cncla_inscrbe, drccion, lttud, lngtud',
'                  FROM   si_g_resolucion_igac_t1 s',
'                  WHERE  rslcion = :P2025005_RSLCION',
'                  AND    rdccion = :P2025005_RDCCION',
'                  AND    cncla_inscrbe = ''C''',
'                  AND    NOT EXISTS (',
'                           SELECT 1',
'                           FROM   si_g_resolucion_igac_t1 r',
'                           WHERE  r.rslcion = s.rslcion',
'                           AND    r.rdccion = s.rdccion',
'                           AND    r.id_sjto_impsto = s.id_sjto_impsto',
'                           AND    r.cncla_inscrbe = ''I'')',
'                ) n',
'          ON b.idntfccion_sjto = n.rfrncia_igac',
'        LEFT JOIN (',
'            SELECT rfrncia_igac, mtrcla_inmblria',
'            FROM   si_g_resolucion_igac_t2',
'            WHERE  rslcion = :P2025005_RSLCION',
'            AND    rdccion = :P2025005_RDCCION',
'            AND    cncla_inscrbe = ''I''',
'        ) m',
'          ON b.idntfccion_sjto = m.rfrncia_igac',
'        JOIN df_s_predios_clasificacion d',
'          ON a.cdgo_prdio_clsfccion = d.cdgo_prdio_clsfccion',
'        JOIN df_i_predios_destino e',
'          ON a.id_prdio_dstno = e.id_prdio_dstno',
'        JOIN df_s_destinos_igac f',
'          ON n.dstno_ecnmco = f.cdgo_dstno_igac',
'        JOIN si_i_predios p',
'          ON b.id_sjto_impsto = p.id_sjto_impsto',
'        WHERE b.id_prdo = :P2025005_ID_PRDO',
'          AND (CASE WHEN (n.clse_mtcion = 1 OR n.cncla_inscrbe = ''C'')',
'                    THEN ''L''',
'                    ELSE ''I''',
'               END) = b.cdgo_lqdcion_estdo',
'        GROUP BY b.id_sjto_impsto, d.dscrpcion_prdio_clsfccion, e.dscrpcion,',
'                 a.cdgo_estrto, f.nmbre_dstno_igac, b.bse_grvble,',
'                 a.area_trrno, a.area_cnsctrda, m.mtrcla_inmblria,',
'                 p.mtrcla_inmblria, n.drccion',
'    ) t1',
'      ON t2.id_sjto_impsto = t1.id_sjto_impsto',
')',
'SELECT caracteristica, anterior, actual, sujeto,',
'       DECODE(anterior, actual, ''N'',''S'') diferencia',
'FROM datos',
'UNPIVOT (',
'    (caracteristica, anterior, actual, sujeto)',
'    FOR fila IN (',
'        (col31, col12, col22, col21) AS 2,',
'        (col32, col13, col23, col21) AS 3,',
'        (col33, col14, col24, col21) AS 4,',
'        (col34, col15, col25, col21) AS 5,',
'        (col35, col16, col26, col21) AS 6,',
'        (col36, col17, col27, col21) AS 7,',
'        (col37, col18, col28, col21) AS 8,',
'        (col38, col19, col29, col21) AS 9,',
'        (col39, col20, col30, col21) AS 10,',
'        (col44, col40, col42, col21) AS 11,  -- Latitud',
'        (col45, col41, col43, col21) AS 12   -- Longitud',
'    )',
');',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(9986147271819443)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10112543505708522)
,p_name=>'ANTERIOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ANTERIOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Anterior'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(10112680486708523)
,p_name=>'ACTUAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTUAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Actual'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(10112739232708524)
,p_name=>'SUJETO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SUJETO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(9986361674819445)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10112911906708526)
,p_name=>'CARACTERISTICA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CARACTERISTICA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Caracteristica'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>22
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
 p_id=>wwv_flow_api.id(10410733647494309)
,p_name=>'DIFERENCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIFERENCIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(10112286708708519)
,p_internal_uid=>10112286708708519
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(10186114125611068)
,p_interactive_grid_id=>wwv_flow_api.id(10112286708708519)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(10186262048611068)
,p_report_id=>wwv_flow_api.id(10186114125611068)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1077830014949)
,p_view_id=>wwv_flow_api.id(10186262048611068)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(10410733647494309)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2007585012776)
,p_view_id=>wwv_flow_api.id(10186262048611068)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(10112543505708522)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2647815012777)
,p_view_id=>wwv_flow_api.id(10186262048611068)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(10112680486708523)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16931100051844)
,p_view_id=>wwv_flow_api.id(10186262048611068)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(10112739232708524)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10218572721758235)
,p_view_id=>wwv_flow_api.id(10186262048611068)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(10112911906708526)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(3571000000)
,p_view_id=>wwv_flow_api.id(10186262048611068)
,p_execution_seq=>5
,p_name=>'Cambios'
,p_background_color=>'#F59FA5'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(10410733647494309)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>true
,p_condition_expression=>'S'
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10061356973118644)
,p_plug_name=>'Responsables'
,p_parent_plug_id=>wwv_flow_api.id(9986870898819450)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10061465806118645)
,p_plug_name=>'Responsables Anterior'
,p_parent_plug_id=>wwv_flow_api.id(10061356973118644)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  c.id_sjto_impsto, a.tpo_dcmnto dscrpcion_idntfccion_tpo, a.nmro_dcmnto, a.nmbre_prptrio',
'from    si_g_resolucion_igac_t1     a',
'--join    df_s_identificaciones_tipo  b on a.tpo_dcmnto = b.cdgo_idntfccion_tpo',
'join    v_si_i_sujetos_impuesto     c on a.rfrncia_igac = c.idntfccion_sjto',
'where   rslcion = :P2025005_RSLCION',
'and	    rdccion = :P2025005_RDCCION',
'and     cncla_inscrbe = ''C'' '))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(9986147271819443)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10061694891118647)
,p_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_IDNTFCCION_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'TI'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>1
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
 p_id=>wwv_flow_api.id(10061711659118648)
,p_name=>'NMRO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_DCMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>12
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
 p_id=>wwv_flow_api.id(10061857041118649)
,p_name=>'NMBRE_PRPTRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_PRPTRIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(10110403083708501)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(9986361674819445)
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(10061559446118646)
,p_internal_uid=>10061559446118646
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(10117828375709475)
,p_interactive_grid_id=>wwv_flow_api.id(10061559446118646)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(10117947706709475)
,p_report_id=>wwv_flow_api.id(10117828375709475)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10118448269709476)
,p_view_id=>wwv_flow_api.id(10117947706709475)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(10061694891118647)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10118991864709477)
,p_view_id=>wwv_flow_api.id(10117947706709475)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(10061711659118648)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10119403243709479)
,p_view_id=>wwv_flow_api.id(10117947706709475)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(10061857041118649)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10119903851709480)
,p_view_id=>wwv_flow_api.id(10117947706709475)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(10110403083708501)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10061904278118650)
,p_plug_name=>'Responsables Actual'
,p_parent_plug_id=>wwv_flow_api.id(10061356973118644)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_sjto_impsto , cdgo_tpo_rspnsble as dscrpcion_idntfccion_tpo , idntfccion_rspnsble , nmbre_rzon_scial',
'from    v_si_i_sujetos_responsable '))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(9986147271819443)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10110692463708503)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(9986361674819445)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10110789575708504)
,p_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_IDNTFCCION_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'TI'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>3
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
 p_id=>wwv_flow_api.id(10110860994708505)
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
 p_id=>wwv_flow_api.id(10110927574708506)
,p_name=>'NMBRE_RZON_SCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RZON_SCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(10110589927708502)
,p_internal_uid=>10110589927708502
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(10121028156712490)
,p_interactive_grid_id=>wwv_flow_api.id(10110589927708502)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(10121143050712490)
,p_report_id=>wwv_flow_api.id(10121028156712490)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10121682890712491)
,p_view_id=>wwv_flow_api.id(10121143050712490)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(10110692463708503)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10122163274712493)
,p_view_id=>wwv_flow_api.id(10121143050712490)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(10110789575708504)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10122645659712494)
,p_view_id=>wwv_flow_api.id(10121143050712490)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(10110860994708505)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10123103429712495)
,p_view_id=>wwv_flow_api.id(10121143050712490)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(10110927574708506)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(139052777929706061)
,p_plug_name=>'Ajustes'
,p_parent_plug_id=>wwv_flow_api.id(9986870898819450)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (',
'select 	b.idntfccion_sjto, b.id_sjto_impsto',
'        , b.vgncia',
'		, b.prdo',
'		, d.cdgo_cncpto',
'		, d.dscrpcion',
unistr('		, decode( c.tpo_ajste , ''CR'' , ''Cr\00E9dito'' , ''D\00E9bito'' ) as tpo_ajste'),
'		, a.vlor_sldo_cptal',
'		, a.vlor_ajste                                        ',
'        , decode( c.tpo_ajste , ''DB'' , a.vlor_ajste, 0 ) as vlor_dbto',
'        , decode( c.tpo_ajste , ''CR'' , a.vlor_ajste, 0 ) as vlor_crdto',
'		--, '''' dscrpcion_estado',
'from 	gi_g_liquidaciones_ajuste 	a',
'join 	v_gi_g_liquidaciones 		b on a.id_lqdcion = b.id_lqdcion',
'join 	gi_d_liquidaciones_mtv_ajst	c on a.id_lqdcion_mtv_ajst = c.id_lqdcion_mtv_ajst',
'join 	df_i_conceptos 				d on a.id_cncpto = d.id_cncpto',
'--join 	v_gf_g_ajustes 				e on a.id_ajste = e.id_ajste',
'where 	b.id_lqdcion in (	select  id_lqdcion ',
'							from    si_g_resolucion_igac_t3',
'							where   rslcion = :P2025005_RSLCION',
'							and		rdccion = :P2025005_RDCCION',
'							and		indcdor_ajste = ''S''	)',
'',
'order by b.idntfccion_sjto, b.vgncia desc',
'	   , b.prdo desc',
');',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(9986147271819443)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_display_when_condition=>'P2025005_CDGO_MTCION_CLSE'
,p_plug_display_when_cond2=>'1'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10114960641708546)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(10115008156708547)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(9986361674819445)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10115142575708548)
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
 p_id=>wwv_flow_api.id(10115203418708549)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(10115323251708550)
,p_name=>'CDGO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('C\00F3digo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10409962869494301)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(10410069862494302)
,p_name=>'TPO_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_AJSTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo de Ajuste'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>7
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
 p_id=>wwv_flow_api.id(10410127715494303)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(10414593632494347)
,p_name=>'VLOR_DBTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DBTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('D\00E9bito')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(10414653978494348)
,p_name=>'VLOR_CRDTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CRDTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Cr\00E9dito')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(10414754998494349)
,p_name=>'VLOR_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_AJSTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(10060363021118634)
,p_internal_uid=>10060363021118634
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(10088685000085238)
,p_interactive_grid_id=>wwv_flow_api.id(10060363021118634)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(10088711544085238)
,p_report_id=>wwv_flow_api.id(10088685000085238)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10415936499494589)
,p_view_id=>wwv_flow_api.id(10088711544085238)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(10114960641708546)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>190
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10416402853494592)
,p_view_id=>wwv_flow_api.id(10088711544085238)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(10115008156708547)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10416952249494594)
,p_view_id=>wwv_flow_api.id(10088711544085238)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(10115142575708548)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10417495600494596)
,p_view_id=>wwv_flow_api.id(10088711544085238)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(10115203418708549)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10417927386494597)
,p_view_id=>wwv_flow_api.id(10088711544085238)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(10115323251708550)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10418484933494599)
,p_view_id=>wwv_flow_api.id(10088711544085238)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(10409962869494301)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10418943702494600)
,p_view_id=>wwv_flow_api.id(10088711544085238)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(10410069862494302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10419413190494602)
,p_view_id=>wwv_flow_api.id(10088711544085238)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(10410127715494303)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10682876396884440)
,p_view_id=>wwv_flow_api.id(10088711544085238)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(10414593632494347)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10683372357884442)
,p_view_id=>wwv_flow_api.id(10088711544085238)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(10414653978494348)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10683846455884444)
,p_view_id=>wwv_flow_api.id(10088711544085238)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(10414754998494349)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(101321000000)
,p_view_id=>wwv_flow_api.id(10088711544085238)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(10414593632494347)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(216198000001)
,p_view_id=>wwv_flow_api.id(10088711544085238)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(10414653978494348)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10114454917708541)
,p_plug_name=>unistr('Datos Resoluci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(139028413442558663)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(466744710145615897)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'<i>',
'  Funcionalidad que permite: <br/><br/>',
unistr('  <b>1.</b> Visualizar las caracter\00EDsticas del predio.<br/><br/>'),
'  <b>2.</b> Visualizar los responsables del predio.<br/><br/>',
'  <b>3.</b> Visualizar los datos de las reliquidaciones.<br/><br/>',
'  <b>4.</b> Visualizar los datos de las liquidaciones anteriores.<br/><br/>',
'  <b>5.</b> Visualizar las datos de los ajustes.<br/><br/>',
'  <b>6.</b> Imprimir Reporte<br/><br/>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9985042462819432)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9984950846819431)
,p_button_name=>'BTN_APRBAR_RSLCION'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Aprobar Resoluci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Ã‚Â¿EstÃƒÂ¡ seguro que desea Aprobar la resoluciÃƒÂ³n?'',''BTN_APRBAR_RSLCION'');'
,p_button_condition=>'P2025005_ESTDO'
,p_button_condition2=>'R'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9985104196819433)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(9984950846819431)
,p_button_name=>'BTN_RVRSA_RSLCION'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>unistr('Reversa Reliquidaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Ã‚Â¿EstÃƒÂ¡ seguro que desea reversar la resoluciÃƒÂ³n?'',''BTN_RVRSA_RSLCION'');'
,p_button_condition=>'P2025005_ESTDO'
,p_button_condition2=>'R'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-rotate-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9985524254819437)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9984950846819431)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10410453844494306)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(9984950846819431)
,p_button_name=>'BTN_RPRTE'
,p_button_static_id=>'imprimir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Imprimir Reporte'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P2025005_ESTDO'
,p_button_condition2=>'S'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10412741097494329)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(9984950846819431)
,p_button_name=>'BTN_PRUEBA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(88588617354834707)
,p_button_image_alt=>'PRUEBA'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9985653232819438)
,p_branch_name=>unistr('Regresar a gesti\00F3n')
,p_branch_action=>'f?p=&APP_ID.:2025004:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(9985524254819437)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9985794104819439)
,p_branch_name=>unistr('Ir a gesti\00F3n 2025004')
,p_branch_action=>'f?p=&APP_ID.:2025004:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(9985104196819433)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(10412696299494328)
,p_branch_name=>'imprimir reporte'
,p_branch_action=>'f?p=66000:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE:705&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(10410453844494306)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9981989680819401)
,p_name=>'P2025005_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(139028413442558663)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9982023959819402)
,p_name=>'P2025005_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(139028413442558663)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9982176424819403)
,p_name=>'P2025005_RSLCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(10114454917708541)
,p_prompt=>unistr('Resoluci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9982238973819404)
,p_name=>'P2025005_FCHA_RSLCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(10114454917708541)
,p_prompt=>unistr('Fecha Aprobaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9982357448819405)
,p_name=>'P2025005_CDGO_MTCION_CLSE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(10114454917708541)
,p_prompt=>unistr('Mutaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_MUTACIONES_CLASE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_mtcion_clse || '' - '' || dscrpcion as d,',
'       cdgo_mtcion_clse as r',
'  from df_s_MUTACIONES_CLASE',
' order by dscrpcion'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9982472556819406)
,p_name=>'P2025005_CDGO_TRMTE_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(10114454917708541)
,p_prompt=>unistr('Tr\00E1mite')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_TRAMITES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_trmte_tpo || '' - '' || dscrpcion as d,',
'       cdgo_trmte_tpo as r',
'  from df_s_tramites_tipo',
' order by cdgo_trmte_tpo'))
,p_lov_display_null=>'YES'
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9982583042819407)
,p_name=>'P2025005_RDCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(10114454917708541)
,p_prompt=>unistr('Radicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9985837172819440)
,p_name=>'P2025005_VGNCIA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(139028413442558663)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9986010806819442)
,p_name=>'P2025005_ESTDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(139028413442558663)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10058504591118616)
,p_name=>'P2025005_ID_PRDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(139028413442558663)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10693117990509501)
,p_name=>'P2025005_USRIO_APLCA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(10114454917708541)
,p_prompt=>'Usuario Aplica'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_USUARIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro || '' ['' ||idntfccion || '']'' as d,',
'       id_usrio as r',
'  from v_sg_g_usuarios',
' where cdgo_clnte        = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10693223116509502)
,p_name=>'P2025005_USRIO_APRBA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(10114454917708541)
,p_prompt=>'Usuario Aprueba'
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
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16086424168541062)
,p_name=>'P2025005_ID_RPRTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(139028413442558663)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9985992698819441)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta estado'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'                                              ',
'    select  aplcda',
'    into 	:P2025005_ESTDO',
'    from 	si_g_resolucion_igac_t1 a',
'    where 	a.id_prcso_crga in',
'                (select b.id_prcso_crga',
'                from 	et_g_procesos_carga b',
'                where 	b.id_prcso_crga = a.id_prcso_crga',
'                and 	b.cdgo_clnte = :F_CDGO_CLNTE',
'                and 	b.id_impsto = :P2025005_ID_IMPSTO',
'                and 	b.id_impsto_sbmpsto = :P2025005_ID_IMPSTO_SBMPSTO)',
'    and 	a.rslcion = :P2025005_RSLCION',
'    and 	a.rdccion = :P2025005_RDCCION',
'    order by a.cncla_inscrbe desc',
'    fetch first 1 row only;',
'exception',
'    when no_data_found then',
unistr('        raise_application_error(-20001, ''No existe resoluci\00F3n # ''||:P2025005_RSLCION);'),
'        return;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10058476344118615)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta per\00EDodo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select id_prdo ',
'    into :P2025005_ID_PRDO',
'    from  df_i_periodos',
'    where id_impsto = :P2025005_ID_IMPSTO',
'    and   id_impsto_sbmpsto = :P2025005_ID_IMPSTO_SBMPSTO',
'    and   vgncia = extract(year from sysdate);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10113070472708527)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ValidaRes'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta  number;',
'    o_mnsje_rspsta varchar2(4000);',
'    v_fcha_rslcion date;',
'    v_rfrncia      si_g_resolucion_igac_t1.rfrncia_igac%type;',
'begin',
'    ',
unistr('    --Valida Resoluci\00F3n'),
'    pkg_si_resolucion_predio.prc_vl_resolucion( p_cdgo_clnte        => :F_CDGO_CLNTE',
'                                              , p_id_impsto         => :P2025005_ID_IMPSTO',
'                                              , p_id_impsto_sbmpsto => :P2025005_ID_IMPSTO_SBMPSTO',
'                                              , p_rslcion           => :P2025005_RSLCION',
'                                              , p_rdccion           => :P2025005_RDCCION',
'                                              , p_vlda_aplcda       => ''N''',
'                                              , o_cdgo_trmte_tpo    => :P2025005_CDGO_TRMTE_TPO',
'                                              , o_cdgo_mtcion_clse  => :P2025005_CDGO_MTCION_CLSE',
'                                              , o_vgncia            => :P2025005_VGNCIA',
'                                              , o_fcha_rslcion      => v_fcha_rslcion',
'                                              , o_rfrncia           => v_rfrncia',
'                                              , o_cdgo_rspsta       => o_cdgo_rspsta',
'                                              , o_mnsje_rspsta      => o_mnsje_rspsta );',
'    ',
'    --:P2025005_FCHA_RSLCION := to_char( v_fcha_rslcion , ''DD/MM/YYYY'' );',
'    ',
'    if o_cdgo_rspsta <> 0 then',
'        raise_application_error(-20001, o_mnsje_rspsta);',
'    end if;',
'    ',
'    ',
unistr('    -- busca usuarios y fecha de aprobaci\00F3n'),
'    select distinct ',
'           id_usrio_rlqda',
'           , b.id_usrio',
'           , to_char(fcha_aplccion, ''dd/mm/yyyy'')',
'    into   :P2025005_USRIO_APLCA',
'           , :P2025005_USRIO_APRBA ',
'           , :P2025005_FCHA_RSLCION',
'    from   si_g_resolucion_igac_t1 a',
'    left join si_g_resolucion_aplicada b on a.rslcion = b.rslcion',
'                                        and a.rdccion = b.rdccion',
'    where a.rslcion = :P2025005_RSLCION',
'    and   a.rdccion = :P2025005_RDCCION ;    ',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9985278134819434)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Aprobar Resoluci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta  number;',
'    v_mnsje_rspsta varchar2(4000);',
'begin',
'    ',
unistr('    --Aplicaci\00F3n de Resoluci\00F3n'),
'    pkg_si_resolucion_predio.prc_ap_ajuste_resolucion_predial ( p_id_usrio            => :F_ID_USRIO',
'																, p_cdgo_clnte        => :F_CDGO_CLNTE',
'																, p_id_impsto         => :P2025005_ID_IMPSTO',
'																, p_id_impsto_sbmpsto => :P2025005_ID_IMPSTO_SBMPSTO',
'																, p_rslcion           => :P2025005_RSLCION',
'																, p_rdccion           => :P2025005_RDCCION',
'																, p_cdgo_trmte_tpo    => :P2025005_CDGO_TRMTE_TPO',
'																, p_cdgo_mtcion_clse  => :P2025005_CDGO_MTCION_CLSE',
'																, p_fcha_rslcion      => :P2025005_FCHA_RSLCION',
'																, o_cdgo_rspsta       => v_cdgo_rspsta',
'																, o_mnsje_rspsta      => v_mnsje_rspsta );',
'    ',
'    --Verifica si no hay Errores',
'    if( v_cdgo_rspsta <> 0 ) then',
'        raise_application_error( -20001 , v_mnsje_rspsta );',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(9985042462819432)
,p_process_success_message=>unistr('Resoluci\00F3n aprobada correctamente.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9985388245819435)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Reversa Resoluci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta  number;',
'    v_mnsje_rspsta varchar2(4000);',
'    v_id_prcso_crga  number;',
'begin',
'    ',
'    select  max(id_prcso_crga) into v_id_prcso_crga',
'    from    si_g_resolucion_igac_t1 a',
'    where   a.rslcion = :P2025005_RSLCION',
'    and     a.rdccion = :P2025005_RDCCION ;',
'',
unistr('    --Reversa reliquidaci\00F3n de Resoluci\00F3n'),
'	pkg_si_resolucion_predio.prc_rv_reliquidacion_resolucion ( p_cdgo_clnte        	=> :F_CDGO_CLNTE',
'																, p_id_usrio            => :F_ID_USRIO',
'																, p_id_impsto         	=> :P2025005_ID_IMPSTO',
'																, p_id_impsto_sbmpsto	=> :P2025005_ID_IMPSTO_SBMPSTO',
'																, p_id_prcso_crga    	=> v_id_prcso_crga',
'																, p_rslcion           	=> :P2025005_RSLCION',
'																, p_rdccion           	=> :P2025005_RDCCION',
'																, p_fcha_rslcion      	=> :P2025005_FCHA_RSLCION',
'																, p_ip_addres			=> :F_IP',
'																, o_cdgo_rspsta       	=> v_cdgo_rspsta',
'																, o_mnsje_rspsta      	=> v_mnsje_rspsta );',
'    ',
'    --Verifica si no hay Errores',
'    if( v_cdgo_rspsta <> 0 ) then',
'        raise_application_error( -20001 , v_mnsje_rspsta );',
'    else',
'    ',
'        apex_application.g_print_success_message := ''<span style="color:white">''||v_mnsje_rspsta||''</span>'';',
'    end if;',
'    ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(9985104196819433)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9986704075819449)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(9986147271819443)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'predio - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10412559709494327)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'JSON Reporte'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_app_id        number                     := v(''APP_ID'');',
'    v_app_page_id   number                     := v(''APP_PAGE_ID'');',
'    v_cdgo_clnte 	df_s_clientes.cdgo_clnte%type := :F_CDGO_CLNTE;',
'    v_gn_d_reportes gn_d_reportes%rowtype;',
'    v_app_id_dstno  number := 66000;',
'    v_zip_file      blob;',
'    --v_cdgo_rprte_irp 		varchar2 (5);',
'    --v_tip_srvdor_imprsion 	varchar2 (10);',
'    v_file_blob 	blob;',
'    o_cdgo_rspsta 	number;',
'    o_mnsje_rspsta 	varchar2(4000);',
'	v_blob 			blob;	',
'    v_json          clob;',
'    v_object 		json_object_t := json_object_t(); ',
'    v_trmte         df_s_tramites_tipo.dscrpcion%type;',
'    v_mtcion        df_s_mutaciones_clase.dscrpcion%type;',
'    v_resultado     clob;',
'    v_usrio_aplca   v_sg_g_usuarios.nmbre_trcro%type;     ',
'    v_usrio_aprba   v_sg_g_usuarios.nmbre_trcro%type; ',
'    v_fcha_aplccion    varchar2(10); ',
'begin',
'',
'    insert into muerto (n_001,v_001,t_001) values (222,''PUNTO_2'',systimestamp); commit;',
'    ',
'    -- limpia la temporal donde se guarda el html',
'    delete gn_g_temporal where  id_ssion = v(''APP_SESSION'') ; commit;',
'',
'    -- Consulta del reporte',
'    begin ',
'        select 	* ',
'        into   	v_gn_d_reportes',
'        from 	gn_d_reportes',
'        where 	cdgo_rprte_grpo = ''GRS'' and actvo = ''S'';',
'    exception',
'        when others then',
'                 raise_application_error(-20001, ''1. Error en consulta de reporte'');',
'    end;',
'    ',
'    select dscrpcion',
'    into   v_trmte',
'    from   df_s_tramites_tipo',
'    where  cdgo_trmte_tpo = :P2025005_CDGO_TRMTE_TPO;',
'',
'    select dscrpcion',
'    into   v_mtcion',
'    FROM   df_s_mutaciones_clase',
'    WHERE  cdgo_mtcion_clse = :P2025005_CDGO_MTCION_CLSE;',
'    ',
unistr('    -- busca usuarios y fecha de aprobaci\00F3n'),
'    select distinct ',
'           (select nmbre_trcro from v_sg_g_usuarios where id_usrio = id_usrio_rlqda ) usrio_aplca',
'           , (select nmbre_trcro from v_sg_g_usuarios u where u.id_usrio = b.id_usrio )   usrio_aprba',
'           , to_char(fcha_aplccion, ''dd/mm/yyyy'')',
'    into   v_usrio_aplca',
'           , v_usrio_aprba ',
'           , v_fcha_aplccion',
'    from   si_g_resolucion_igac_t1 a',
'    left join si_g_resolucion_aplicada b on a.rslcion = b.rslcion',
'                                        and a.rdccion = b.rdccion',
'    where a.rslcion = :P2025005_RSLCION',
'    and   a.rdccion = :P2025005_RDCCION ;',
'    ',
'    ',
'    v_object.put(''id_impsto'',:P2025005_ID_IMPSTO); ',
'    v_object.put(''id_usrio'',:F_ID_USRIO); ',
'    v_object.put(''id_prdo'',:P2025005_ID_PRDO); ',
'    v_object.put(''rslcion'',:P2025005_RSLCION); ',
'    v_object.put(''rdccion'',:P2025005_RDCCION);  ',
'    v_object.put(''fcha_rslcion'', v_fcha_aplccion);--:P2025005_FCHA_RSLCION); ',
'    v_object.put(''cdgo_trmte_tpo'',v_trmte);--:P2025005_CDGO_TRMTE_TPO); ',
'    v_object.put(''cdgo_mtcion_clse'',v_mtcion);--:P2025005_CDGO_MTCION_CLSE);   ',
'    v_object.put(''usrio_aplca'',v_usrio_aplca);',
'    v_object.put(''usrio_aprba'',v_usrio_aprba);  ',
'    v_object.put(''nmbre_rprte'',v_gn_d_reportes.nmbre_rprte); ',
'    v_object.put(''ssion'',v(''APP_SESSION'') ); ',
'	v_json := v_object.to_clob();',
'	',
'    --if v_tip_srvdor_imprsion = ''BP'' then',
'',
'    insert into muerto (n_001,v_001,t_001) values (222,''v_json: ''||v_json,systimestamp); commit;',
'',
'    ',
'   v_resultado :=  pkg_si_resolucion_predio.fnc_co_resolucion_aprobada(',
'                                    p_cdgo_clnte => :F_CDGO_CLNTE,',
'                                    p_id_usrio => :F_ID_USRIO,',
'                                    p_id_impsto => :P2025005_ID_IMPSTO,',
'                                    p_id_prdo => :P2025005_ID_PRDO, ',
'                                    p_rslcion => :P2025005_RSLCION, ',
'                                    p_rdccion => :P2025005_RDCCION, ',
'                                    p_id_ssion => v(''APP_SESSION'')',
'                                  );',
'                                  ',
'    insert into muerto (n_001,v_001,t_001) values (222,''termina resultado'',systimestamp); commit;',
'    ',
'    --insert into gn_g_temporal (id_ssion , clob001) values(v(''APP_SESSION'') ,  v_resultado); commit;',
'    ',
'	apex_session.attach( p_app_id     => v_app_id_dstno',
'					   , p_page_id    => 37',
'					   , p_session_id => v(''APP_SESSION''));',
'',
'	apex_util.set_session_state( ''F_CDGO_CLNTE'' , v_cdgo_clnte );',
'	apex_util.set_session_state( ''P37_ID_RPRTE'' , v_gn_d_reportes.id_rprte );',
'	apex_util.set_session_state( ''P37_JSON'' , v_json );',
'',
'	/***v_blob := apex_util.get_print_document( p_application_id     => v_app_id_dstno',
'										  , p_report_query_name  => v_gn_d_reportes.nmbre_cnslta',
'										  , p_report_layout_name => v_gn_d_reportes.nmbre_plntlla',
'										  , p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla',
'										  , p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo );',
'',
'	owa_util.mime_header(''application/pdf'', false); ',
'	htp.p(''Content-length: ''|| dbms_lob.getlength(v_blob));',
unistr('	htp.p(''Content-Disposition: attachment; filename="''||v_gn_d_reportes.nmbre_rprte||'' N\00B0'' || :P2025005_RSLCION || ''.pdf"'');'),
'	owa_util.http_header_close;',
'	wpg_docload.download_file(v_blob);',
'',
'	apex_session.attach( p_app_id     => v_app_id',
'					   , p_page_id    => v_app_page_id',
'					   , p_session_id => v(''APP_SESSION''));***/',
'                       ',
'    --end if;                   ',
'                           ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(10410453844494306)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10412834479494330)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROCESO PRUEBA'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_resultado    clob;',
'begin',
'    ',
'   v_resultado :=  pkg_si_resolucion_predio.fnc_co_resolucion_aprobada(',
'                                    p_cdgo_clnte => 23001,',
'                                    p_id_usrio => 249521,--json_value(:P37_JSON ,''$.id_usrio''),',
'                                    p_id_impsto => 230011,--json_value(:P37_JSON ,''$.id_impsto''),',
'                                    p_id_prdo => 1636,--json_value(:P37_JSON ,''$.id_prdo''),    ',
'                                    p_rslcion => 5782025, --json_value(:P37_JSON ,''$.rslcion''),',
'                                    p_rdccion => 4772025--json_value(:P37_JSON ,''$.rdccion'')',
'                                  );',
'',
'insert into muerto(n_001, c_001, t_001) values(44, v_resultado, systimestamp ); commit;',
'   ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(10412741097494329)
,p_process_when_type=>'NEVER'
);
end;
/
