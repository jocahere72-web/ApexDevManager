prompt --application/pages/page_00032
begin
wwv_flow_api.create_page(
 p_id=>32
,p_user_interface_id=>wwv_flow_api.id(72999165452094574)
,p_name=>unistr('Acci\00F3n Aclaratoria')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Acci\00F3n Aclaratoria')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20200519205232'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(181337137885460573)
,p_plug_name=>unistr('Acci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(181420122982741255)
,p_plug_name=>'Vigencias'
,p_parent_plug_id=>wwv_flow_api.id(181337137885460573)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_rcrso_accion_vgnc_cncpto,',
'        id_rcrso_accion,',
'        vgncia,',
'        id_prdo',
'from GJ_G_RCRSOS_ACCN_VGNC_CNCPT',
'where id_rcrso_accion = :P32_ID_RCRSO_ACCION'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gj_g_recursos_accion a',
'inner join gj_d_recursos_tipo_accion b on a.id_rcrso_tpo_accion = b.id_rcrso_tpo_accion',
'where a.id_rcrso_accion = :P32_ID_RCRSO_ACCION and',
'      b.indcdor_ajste = ''N'''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(181420370103741258)
,p_name=>'ID_RCRSO_ACCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RCRSO_ACCION'
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
,p_default_type=>'ITEM'
,p_default_expression=>'P32_ID_RCRSO_ACCION'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(181420451771741259)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.vgncia d, c.vgncia r',
'from gj_g_recursos a',
'inner join v_pq_g_solicitudes b on a.id_slctud = b.id_slctud',
'inner join gn_g_actos_vigencia c on a.id_acto        = c.id_acto and',
'                                    b.id_sjto_impsto = c.id_sjto_impsto',
'inner join gj_g_recursos_vigencia d on c.id_acto_vgncia = d.id_acto_vgncia and',
'                                       a.id_rcrso       = d.id_rcrso',
'where a.id_instncia_fljo_hjo = :P32_ID_INSTNCIA_FLJO',
'group by c.vgncia',
'order by 1 asc'))
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
 p_id=>wwv_flow_api.id(181420625481741260)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.prdo, c.id_prdo r',
'from gj_g_recursos a',
'inner join v_pq_g_solicitudes b on a.id_slctud = b.id_slctud',
'inner join gn_g_actos_vigencia c on a.id_acto        = c.id_acto and',
'                                    b.id_sjto_impsto = c.id_sjto_impsto',
'inner join df_i_periodos d on c.id_prdo = d.id_prdo',
'inner join gj_g_recursos_vigencia e on c.id_acto_vgncia = e.id_acto_vgncia and',
'                                       a.id_rcrso       = e.id_rcrso',
'where a.id_instncia_fljo_hjo = :P32_ID_INSTNCIA_FLJO and',
'      c.vgncia = :VGNCIA'))
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'VGNCIA'
,p_ajax_items_to_submit=>'ID_PRDO'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(181421338836741268)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_display_condition=>'P32_INDC_LECTURA'
,p_display_condition2=>'S'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(181421451378741269)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_display_condition=>'P32_INDC_LECTURA'
,p_display_condition2=>'S'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192189374107199855)
,p_name=>'ID_RCRSO_ACCION_VGNC_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RCRSO_ACCION_VGNC_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(181420150782741256)
,p_internal_uid=>181420150782741256
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
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
 p_id=>wwv_flow_api.id(181426496713764378)
,p_interactive_grid_id=>wwv_flow_api.id(181420150782741256)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(181426608840764379)
,p_report_id=>wwv_flow_api.id(181426496713764378)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(181427613587764385)
,p_view_id=>wwv_flow_api.id(181426608840764379)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(181420370103741258)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(181428083038764387)
,p_view_id=>wwv_flow_api.id(181426608840764379)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(181420451771741259)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(181428601321764388)
,p_view_id=>wwv_flow_api.id(181426608840764379)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(181420625481741260)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(181438389823828507)
,p_view_id=>wwv_flow_api.id(181426608840764379)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(181421338836741268)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192208639032333452)
,p_view_id=>wwv_flow_api.id(181426608840764379)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(192189374107199855)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(192189453973199856)
,p_plug_name=>'Vigencia Concepto'
,p_parent_plug_id=>wwv_flow_api.id(181337137885460573)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rownum as num,',
'       f.id_rcrso_accion_vgnc_cncpto,',
'       e.vgncia ,',
'       e.id_prdo,',
'       e.prdo,',
'       e.id_cncpto,',
'       e.cdgo_cncpto,',
'       e.dscrpcion_cncpto ,',
'       e.vlor_sldo_cptal,',
'       to_char(e.vlor_sldo_cptal, :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor_sldo_cptal_mascarca,',
'       nvl(e.vlor_intres,0) vlor_intres,',
'       to_char( nvl(e.vlor_intres,0),:F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor_intres_mascara,',
'     --  0 vlor_ajste',
'        nvl(f.vlor_ajste,0) vlor_ajste',
'from gj_g_recursos a',
'inner join gj_g_recursos_vigencia       b on a.id_rcrso         = b.id_rcrso',
'inner join gn_g_actos_vigencia          c on b.id_acto_vgncia   = c.id_acto_vgncia',
'inner join v_pq_g_solicitudes           d on a.id_slctud        = d.id_slctud',
'inner join v_gf_g_cartera_x_concepto e on d.id_sjto_impsto   = e.id_sjto_impsto and',
'                                             c.vgncia           = e.vgncia and',
'                                             c.id_prdo          = e.id_prdo',
'left  join GJ_G_RCRSOS_ACCN_VGNC_CNCPT    f on f.id_rcrso_accion  = :P32_ID_RCRSO_ACCION and',
'                                             e.vgncia           = f.vgncia and',
'                                             e.id_prdo          = f.id_prdo and',
'                                             e.id_cncpto        = f.id_cncpto',
'where a.id_instncia_fljo_hjo =:P32_ID_INSTNCIA_FLJO -- nvl(:P32_ID_INSTNCIA_FLJO, :F_ID_INSTNCIA_FLJO) ',
'--and      e.vlor_sldo_cptal      > 0'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists(select ''S''',
'       from gj_g_recursos_accion a',
'       inner join gj_d_recursos_tipo_accion b on a.id_rcrso_tpo_accion = b.id_rcrso_tpo_accion',
'       where a.id_rcrso_accion = :P32_ID_RCRSO_ACCION and',
'             b.indcdor_ajste = ''S'') and :P32_ID_AJSTE_MTVO is not null'))
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P32_INDC_LECTURA'
,p_plug_read_only_when2=>'S'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192189671481199858)
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192189731317199859)
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
 p_id=>wwv_flow_api.id(192189853011199860)
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192189965842199861)
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
 p_id=>wwv_flow_api.id(192190076781199862)
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
 p_id=>wwv_flow_api.id(192190206656199863)
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192190258540199864)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(192190336668199865)
,p_name=>'VLOR_SLDO_CPTAL_MASCARCA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL_MASCARCA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Valor Saldo Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192190467632199866)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192190610586199867)
,p_name=>'VLOR_INTRES_MASCARA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES_MASCARA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Valor Interes'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192264622248541357)
,p_name=>'ID_RCRSO_ACCION_VGNC_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RCRSO_ACCION_VGNC_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(192264644973541358)
,p_name=>'VLOR_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_AJSTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Ajuste'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'formatcurrency'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_item_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:0});"'
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
 p_id=>wwv_flow_api.id(192319153262964654)
,p_name=>'NUM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NUM'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(192189567127199857)
,p_internal_uid=>192189567127199857
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
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
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(192211704554352211)
,p_interactive_grid_id=>wwv_flow_api.id(192189567127199857)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(192211745358352211)
,p_report_id=>wwv_flow_api.id(192211704554352211)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(72204835675572174)
,p_view_id=>wwv_flow_api.id(192211745358352211)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(192264622248541357)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(72205429701572177)
,p_view_id=>wwv_flow_api.id(192211745358352211)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(192264644973541358)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(72215397936642727)
,p_view_id=>wwv_flow_api.id(192211745358352211)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(192319153262964654)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192212264723352216)
,p_view_id=>wwv_flow_api.id(192211745358352211)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(192189671481199858)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192212748569352223)
,p_view_id=>wwv_flow_api.id(192211745358352211)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(192189731317199859)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192213320865352224)
,p_view_id=>wwv_flow_api.id(192211745358352211)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(192189853011199860)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192213779334352226)
,p_view_id=>wwv_flow_api.id(192211745358352211)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(192189965842199861)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192214297488352227)
,p_view_id=>wwv_flow_api.id(192211745358352211)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(192190076781199862)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192214757880352228)
,p_view_id=>wwv_flow_api.id(192211745358352211)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(192190206656199863)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192215306494352229)
,p_view_id=>wwv_flow_api.id(192211745358352211)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(192190258540199864)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192215787432352231)
,p_view_id=>wwv_flow_api.id(192211745358352211)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(192190336668199865)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192216279290352232)
,p_view_id=>wwv_flow_api.id(192211745358352211)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(192190467632199866)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192216755931352235)
,p_view_id=>wwv_flow_api.id(192211745358352211)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(192190610586199867)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72135151990109568)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(181337137885460573)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
,p_button_condition=>'P32_INDC_LECTURA'
,p_button_condition2=>'S'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72135557626109574)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(181337137885460573)
,p_button_name=>'BTN_GUARDAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P32_INDC_LECTURA'
,p_button_condition2=>'S'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72135892541109579)
,p_name=>'P32_ID_RCRSO_ACCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(181337137885460573)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72136200975109580)
,p_name=>'P32_DSCRIPCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(181337137885460573)
,p_prompt=>unistr('Acci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72136641039109581)
,p_name=>'P32_ID_AJSTE_MTVO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(181337137885460573)
,p_prompt=>'Motivo Ajuste'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.dscrpcion ||'' - ''||d.tpo_ajste d, d.id_ajste_mtvo r ',
'from gj_g_recursos a',
'inner join v_pq_g_solicitudes b on a.id_slctud = b.id_slctud',
'inner join gj_d_recursos_ajuste_motivo c on a.id_rcrso_tipo_clnte = c.id_rcrso_tipo_clnte and c.actvo = ''S''',
'inner join gf_d_ajuste_motivo d on  c.id_ajste_mtvo = d.id_ajste_mtvo and  b.id_impsto     = d.id_impsto',
'where a.id_instncia_fljo_hjo = :P32_ID_INSTNCIA_FLJO',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gj_g_recursos_accion a',
'inner join gj_d_recursos_tipo_accion b on a.id_rcrso_tpo_accion = b.id_rcrso_tpo_accion',
'where a.id_rcrso_accion = :P32_ID_RCRSO_ACCION and',
'      b.indcdor_ajste = ''S'''))
,p_display_when_type=>'EXISTS'
,p_read_only_when=>':P32_ID_AJSTE_MTVO is not null or :P32_INDC_LECTURA = ''S'''
,p_read_only_when_type=>'SQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(72977081091094543)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72137062512109581)
,p_name=>'P32_INDC_LECTURA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(181337137885460573)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72137463663109581)
,p_name=>'P32_ID_INSTNCIA_FLJO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(181337137885460573)
,p_item_default=>'&F_ID_INSTNCIA_FLJO.'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72148037018109610)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Acci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select c.dscrpcion',
'    into :P32_DSCRIPCION',
'    from gj_g_recursos_accion a',
'    inner join gj_d_recursos_tipo_accion b on a.id_rcrso_tpo_accion = b.id_rcrso_tpo_accion',
'    inner join gj_d_acciones c on b.id_accion = c.id_accion',
'    where a.id_rcrso_accion = :P32_ID_RCRSO_ACCION;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P32_ID_RCRSO_ACCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72148813510109611)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Recurso Accion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select id_ajste_mtvo',
'    into :P32_ID_AJSTE_MTVO',
'    from gj_g_recursos_accion',
'    where id_rcrso_accion = :P32_ID_RCRSO_ACCION;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P32_ID_AJSTE_MTVO'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72141130429109599)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(181420122982741255)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Vigencias - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(72135557626109574)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72149256225109611)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar Ventana'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(72135151990109568)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72147689897109606)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(192189453973199856)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Conceptos x Vigencia'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Validamos el tipo de ajuste',
'declare',
'    v_tpo_ajste gf_d_ajuste_motivo.tpo_ajste%type;',
'begin',
'    select tpo_ajste',
'    into v_tpo_ajste',
'    from gf_d_ajuste_motivo',
'    where id_ajste_mtvo = :P32_ID_AJSTE_MTVO;',
'    if(v_tpo_ajste = ''CR'')then',
'        --Validamos si el valor del ajuste es mayor que el saldo capital',
'        if(to_number(:VLOR_AJSTE, ''999G999G999G999G999G999G990'') > to_number(:VLOR_SLDO_CPTAL))then',
'            apex_error.add_error (',
'                p_message          => ''El valor del Ajuste no debe ser mayor al valor del saldo capital.'',',
'                p_display_location => apex_error.c_inline_in_notification );',
'        end if;',
'    end if;',
'exception',
'    when others then',
'        apex_error.add_error (p_message          => ''Problemas al consultar Motivo de Ajuste'',',
'                              p_display_location => apex_error.c_inline_in_notification );  ',
'end;',
'',
'--Validamos que el valor del ajuste no sea menor que cero',
'if(to_number(:VLOR_AJSTE, ''999G999G999G999G999G999G990'') < 0)then',
'    apex_error.add_error (',
'        p_message          => ''El valor del Ajuste no debe ser menor a cero.'',',
'        p_display_location => apex_error.c_inline_in_notification );',
'end if;',
'',
'if(:APEX$ROW_STATUS = ''U'')then',
'    --',
'    pkg_gj_recurso.prc_cd_vigencias_concepto(',
'        p_id_rcrso_accion               => :P32_ID_RCRSO_ACCION,',
'        p_id_rcrso_accion_vgnc_cncpto   => :ID_RCRSO_ACCION_VGNC_CNCPTO,',
'        p_vgncia                        => :VGNCIA,',
'        p_id_prdo                       => :ID_PRDO,',
'        p_id_cncpto                     => :ID_CNCPTO,',
'        p_vlor_sldo_cptal               => :VLOR_SLDO_CPTAL,',
'        p_vlor_ajste                    => to_number(:VLOR_AJSTE, ''999G999G999G999G999G999G990'')',
'    );',
'end if;'))
,p_attribute_05=>'Y'
,p_attribute_06=>'N'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(72135557626109574)
,p_process_success_message=>'#MRU_COUNT# Registro(s) actualizados exitosamente.'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72148407721109610)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Actualizar Recurso Acci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(3000);',
'begin',
'    pkg_gj_recurso.prc_ac_recursos_accion(',
'        p_cdgo_clnte			=> :F_CDGO_CLNTE,',
'        p_id_usrio              => :F_ID_USRIO,',
'        p_id_rcrso_accion       => :P32_ID_RCRSO_ACCION,',
'        p_id_ajste_mtvo         => :P32_ID_AJSTE_MTVO,',
'        p_obsrvcion             => null,',
'        o_cdgo_rspsta			=> v_cdgo_rspsta,',
'        o_mnsje_rspsta          => v_mnsje_rspsta',
'    );',
'    ',
'    if(v_cdgo_rspsta != 0)then',
'        raise_application_error(-20000, v_mnsje_rspsta);',
'    end if;',
'    ',
'    :P11_OBSRVCION := null;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(72135557626109574)
);
null;
end;
/
