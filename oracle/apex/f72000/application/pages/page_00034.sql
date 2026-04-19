prompt --application/pages/page_00034
begin
wwv_flow_api.create_page(
 p_id=>34
,p_user_interface_id=>wwv_flow_api.id(72999165452094574)
,p_name=>unistr('Acci\00F3n Aclaratoria')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Acci\00F3n Aclaratoria')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20200531142405'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(181353234661468094)
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
 p_id=>wwv_flow_api.id(181436219758748776)
,p_plug_name=>'Vigencias'
,p_parent_plug_id=>wwv_flow_api.id(181353234661468094)
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
'where id_rcrso_accion = :P34_ID_RCRSO_ACCION'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gj_g_recursos_accion a',
'inner join gj_d_recursos_tipo_accion b on a.id_rcrso_tpo_accion = b.id_rcrso_tpo_accion',
'where a.id_rcrso_accion = :P34_ID_RCRSO_ACCION and',
'      b.indcdor_ajste = ''N'''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(181436466879748779)
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
,p_default_expression=>'P34_ID_RCRSO_ACCION'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(181436548547748780)
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
'where a.id_instncia_fljo_hjo = :P34_ID_INSTNCIA_FLJO',
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
 p_id=>wwv_flow_api.id(181436722257748781)
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
'where a.id_instncia_fljo_hjo = :P34_ID_INSTNCIA_FLJO and',
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
 p_id=>wwv_flow_api.id(181437435612748789)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_display_condition=>'P34_INDC_LECTURA'
,p_display_condition2=>'S'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(181437548154748790)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_display_condition=>'P34_INDC_LECTURA'
,p_display_condition2=>'S'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192205470883207376)
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
 p_id=>wwv_flow_api.id(181436247558748777)
,p_internal_uid=>181436247558748777
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
 p_id=>wwv_flow_api.id(181442593489771899)
,p_interactive_grid_id=>wwv_flow_api.id(181436247558748777)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(181442705616771900)
,p_report_id=>wwv_flow_api.id(181442593489771899)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(181443710363771906)
,p_view_id=>wwv_flow_api.id(181442705616771900)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(181436466879748779)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(181444179814771908)
,p_view_id=>wwv_flow_api.id(181442705616771900)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(181436548547748780)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(181444698097771909)
,p_view_id=>wwv_flow_api.id(181442705616771900)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(181436722257748781)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(181454486599836028)
,p_view_id=>wwv_flow_api.id(181442705616771900)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(181437435612748789)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192224735808340973)
,p_view_id=>wwv_flow_api.id(181442705616771900)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(192205470883207376)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(192205550749207377)
,p_plug_name=>'Vigencia Concepto'
,p_parent_plug_id=>wwv_flow_api.id(181353234661468094)
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
'  --     vlor_ajste',
'       nvl(f.vlor_ajste,0) vlor_ajste',
'from gj_g_recursos a',
'inner join gj_g_recursos_vigencia       b on a.id_rcrso         = b.id_rcrso',
'inner join gn_g_actos_vigencia          c on b.id_acto_vgncia   = c.id_acto_vgncia',
'inner join v_pq_g_solicitudes           d on a.id_slctud        = d.id_slctud',
'inner join v_gf_g_cartera_x_concepto e on d.id_sjto_impsto   = e.id_sjto_impsto and',
'                                             c.vgncia           = e.vgncia and',
'                                             c.id_prdo          = e.id_prdo',
'                                             ',
'--join gj_g_recursos_accion                g on   a.id_rcrso    = g.id_rcrso    and    g.id_rcrso_accion_antrior =   :P34_ID_RCRSO_ACCION                                    ',
'left  join GJ_G_RCRSOS_ACCN_VGNC_CNCPT    f on f.id_rcrso_accion  =  :P34_ID_RCRSO_ACCION ',
'                                           and  e.vgncia           = f.vgncia ',
'                                           and  e.id_prdo          = f.id_prdo ',
'                                           and  e.id_cncpto        = f.id_cncpto',
'                                            ',
'where a.id_instncia_fljo_hjo =:P34_ID_INSTNCIA_FLJO -- nvl(:P34_ID_INSTNCIA_FLJO, :F_ID_INSTNCIA_FLJO) ',
'--and      e.vlor_sldo_cptal      > 0',
'and  f.id_rcrso_accion_vgnc_cncpto is not null;',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists(select ''S''',
'       from gj_g_recursos_accion a',
'       inner join gj_d_recursos_tipo_accion b on a.id_rcrso_tpo_accion = b.id_rcrso_tpo_accion',
'       where a.id_rcrso_accion = :P34_ID_RCRSO_ACCION and',
'             b.indcdor_ajste = ''S'') and :P34_ID_AJSTE_MTVO is not null'))
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P34_INDC_LECTURA'
,p_plug_read_only_when2=>'S'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(72422314487680602)
,p_name=>'VLOR_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_AJSTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Ajuste'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(192205768257207379)
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
 p_id=>wwv_flow_api.id(192205828093207380)
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
 p_id=>wwv_flow_api.id(192205949787207381)
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
 p_id=>wwv_flow_api.id(192206062618207382)
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
 p_id=>wwv_flow_api.id(192206173557207383)
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
 p_id=>wwv_flow_api.id(192206303432207384)
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
 p_id=>wwv_flow_api.id(192206355316207385)
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
 p_id=>wwv_flow_api.id(192206433444207386)
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
 p_id=>wwv_flow_api.id(192206564408207387)
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
 p_id=>wwv_flow_api.id(192206707362207388)
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
 p_id=>wwv_flow_api.id(192280719024548878)
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
 p_id=>wwv_flow_api.id(192335250038972175)
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
 p_id=>wwv_flow_api.id(192205663903207378)
,p_internal_uid=>192205663903207378
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
 p_id=>wwv_flow_api.id(192227801330359732)
,p_interactive_grid_id=>wwv_flow_api.id(192205663903207378)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(192227842134359732)
,p_report_id=>wwv_flow_api.id(192227801330359732)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(72220932451579695)
,p_view_id=>wwv_flow_api.id(192227842134359732)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(192280719024548878)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(72231494712650248)
,p_view_id=>wwv_flow_api.id(192227842134359732)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(192335250038972175)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(72430177613900123)
,p_view_id=>wwv_flow_api.id(192227842134359732)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(72422314487680602)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192228361499359737)
,p_view_id=>wwv_flow_api.id(192227842134359732)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(192205768257207379)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192228845345359744)
,p_view_id=>wwv_flow_api.id(192227842134359732)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(192205828093207380)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192229417641359745)
,p_view_id=>wwv_flow_api.id(192227842134359732)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(192205949787207381)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192229876110359747)
,p_view_id=>wwv_flow_api.id(192227842134359732)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(192206062618207382)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192230394264359748)
,p_view_id=>wwv_flow_api.id(192227842134359732)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(192206173557207383)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192230854656359749)
,p_view_id=>wwv_flow_api.id(192227842134359732)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(192206303432207384)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>373
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192231403270359750)
,p_view_id=>wwv_flow_api.id(192227842134359732)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(192206355316207385)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192231884208359752)
,p_view_id=>wwv_flow_api.id(192227842134359732)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(192206433444207386)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>277
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192232376066359753)
,p_view_id=>wwv_flow_api.id(192227842134359732)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(192206564408207387)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192232852707359756)
,p_view_id=>wwv_flow_api.id(192227842134359732)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(192206707362207388)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>277
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72151292554117075)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(181353234661468094)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
,p_button_condition=>'P34_INDC_LECTURA'
,p_button_condition2=>'S'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72151619245117077)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(181353234661468094)
,p_button_name=>'BTN_GUARDAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P34_INDC_LECTURA'
,p_button_condition2=>'S'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72152025398117078)
,p_name=>'P34_ID_RCRSO_ACCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(181353234661468094)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72152467610117078)
,p_name=>'P34_DSCRIPCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(181353234661468094)
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
 p_id=>wwv_flow_api.id(72152811128117078)
,p_name=>'P34_ID_AJSTE_MTVO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(181353234661468094)
,p_prompt=>'Motivo Ajuste'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.dscrpcion ||'' - ''||d.tpo_ajste d, d.id_ajste_mtvo r ',
'from gj_g_recursos a',
'inner join v_pq_g_solicitudes b on a.id_slctud = b.id_slctud',
'inner join gj_d_recursos_ajuste_motivo c on a.id_rcrso_tipo_clnte = c.id_rcrso_tipo_clnte and c.actvo = ''S''',
'inner join gf_d_ajuste_motivo d on  c.id_ajste_mtvo = d.id_ajste_mtvo and  b.id_impsto     = d.id_impsto',
'where a.id_instncia_fljo_hjo = :P34_ID_INSTNCIA_FLJO',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gj_g_recursos_accion a',
'inner join gj_d_recursos_tipo_accion b on a.id_rcrso_tpo_accion = b.id_rcrso_tpo_accion',
'where a.id_rcrso_accion = :P34_ID_RCRSO_ACCION and',
'      b.indcdor_ajste = ''S'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(72977081091094543)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72153272680117079)
,p_name=>'P34_INDC_LECTURA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(181353234661468094)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72153647513117079)
,p_name=>'P34_ID_INSTNCIA_FLJO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(181353234661468094)
,p_item_default=>'&F_ID_INSTNCIA_FLJO.'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73005098227060501)
,p_validation_name=>'Nuevo'
,p_validation_sequence=>10
,p_validation=>':VLOR_AJSTE <> 0'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'el valor del ajuste no es cero'
,p_when_button_pressed=>wwv_flow_api.id(72151619245117077)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72164204988117111)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Acci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select c.dscrpcion',
'    into :P34_DSCRIPCION',
'    from gj_g_recursos_accion a',
'    inner join gj_d_recursos_tipo_accion b on a.id_rcrso_tpo_accion = b.id_rcrso_tpo_accion',
'    inner join gj_d_acciones c on b.id_accion = c.id_accion',
'    where a.id_rcrso_accion = :P34_ID_RCRSO_ACCION;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P34_ID_RCRSO_ACCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72165017870117114)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Recurso Accion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select id_ajste_mtvo',
'    into :P34_ID_AJSTE_MTVO',
'    from gj_g_recursos_accion',
'    where id_rcrso_accion = :P34_ID_RCRSO_ACCION;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P34_ID_AJSTE_MTVO'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72157367477117083)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(181436219758748776)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Vigencias - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(72151619245117077)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72163862477117110)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(192205550749207377)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Conceptos x Vigencia'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Validamos el tipo de ajuste',
'declare',
'    v_tpo_ajste                 gf_d_ajuste_motivo.tpo_ajste%type;',
'    count_vlor_ajste_0          number;  ',
'begin',
'    begin',
'        select tpo_ajste',
'        into v_tpo_ajste',
'        from gf_d_ajuste_motivo',
'        where id_ajste_mtvo = :P34_ID_AJSTE_MTVO;',
'        if(v_tpo_ajste = ''CR'')then',
'            --Validamos si el valor del ajuste es mayor que el saldo capital',
'            if(to_number(:VLOR_AJSTE, ''999G999G999G999G999G999G990'') > to_number(:VLOR_SLDO_CPTAL))then',
'                apex_error.add_error (',
'                    p_message          => ''El valor del Ajuste no debe ser mayor al valor del saldo capital.'',',
'                    p_display_location => apex_error.c_inline_in_notification );',
'            end if;',
'        end if;',
'    exception',
'        when others then',
'            apex_error.add_error (p_message          => ''Problemas al consultar Motivo de Ajuste'',',
'                                  p_display_location => apex_error.c_inline_in_notification );  ',
'    end;',
'',
'    --Validamos que el valor del ajuste no sea menor que cero',
'    if(to_number(:VLOR_AJSTE, ''999G999G999G999G999G999G990'') = 0)then',
'        apex_error.add_error (',
'            p_message          => ''El valor del Ajuste no puede  ser cero.'',',
'            p_display_location => apex_error.c_inline_in_notification );',
'    end if;',
'',
'',
'',
'    if(:APEX$ROW_STATUS = ''U'')then',
'        --',
'        pkg_gj_recurso.prc_cd_vigencias_concepto(',
'            p_id_rcrso_accion               => :P34_ID_RCRSO_ACCION,',
'            p_id_rcrso_accion_vgnc_cncpto   => :ID_RCRSO_ACCION_VGNC_CNCPTO,',
'            p_vgncia                        => :VGNCIA,',
'            p_id_prdo                       => :ID_PRDO,',
'            p_id_cncpto                     => :ID_CNCPTO,',
'            p_vlor_sldo_cptal               => :VLOR_SLDO_CPTAL,',
'            p_vlor_ajste                    => to_number(:VLOR_AJSTE, ''999G999G999G999G999G999G990'')',
'        );',
' ',
'    end if;',
'',
'',
'',
'    begin',
'        select count(id_rcrso_accion_vgnc_cncpto)',
'        into count_vlor_ajste_0',
'        from gj_g_rcrsos_accn_vgnc_cncpt',
'        where id_rcrso_accion = :P34_ID_RCRSO_ACCION',
'        and vlor_ajste = 0;',
'    end;',
'',
'    if(count_vlor_ajste_0 > 0)then',
'        apex_error.add_error (',
'            p_message          => ''El valor del Ajuste no puede  ser cero.'',',
'            p_display_location => apex_error.c_inline_in_notification );',
'    end if;',
'end;    '))
,p_attribute_05=>'N'
,p_attribute_06=>'N'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(72151619245117077)
,p_process_success_message=>'#MRU_COUNT# Registro(s) actualizados exitosamente.'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72164639468117111)
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
'        p_id_rcrso_accion       => :P34_ID_RCRSO_ACCION,',
'        p_id_ajste_mtvo         => :P34_ID_AJSTE_MTVO,',
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
,p_process_when_button_id=>wwv_flow_api.id(72151619245117077)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72165403558117114)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar Ventana'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(72151292554117075)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72385875008038301)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar Ventana al Guardar'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(72151619245117077)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_rcrso_accion_vgnc_cncpto    ',
'from gj_g_rcrsos_accn_vgnc_cncpt',
'where id_rcrso_accion = :P34_ID_RCRSO_ACCION',
'and vlor_ajste <> 0;',
'    ',
''))
,p_process_when_type=>'EXISTS'
);
end;
/
