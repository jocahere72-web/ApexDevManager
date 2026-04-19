prompt --application/pages/page_00037
begin
wwv_flow_api.create_page(
 p_id=>37
,p_user_interface_id=>wwv_flow_api.id(237318207209524256)
,p_name=>'portal_vehiculos'
,p_step_title=>'portal_vehiculos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'RROBLEDO'
,p_last_upd_yyyymmddhh24miss=>'20201019213042'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94538304588858445)
,p_plug_name=>'contenedor'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94538415082858446)
,p_plug_name=>'Portal_vehiculo'
,p_parent_plug_id=>wwv_flow_api.id(94538304588858445)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(237243066872524200)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select s.vgncia,''DECLARACION'' as descripcion,0 as impuesto,0 as intereses,0 as sancion,0 as descuento,l.vlor_ttal as total,''D'' as indicador',
'  from gi_g_liquidaciones s',
'  left join gi_g_declaraciones l on l.id_sjto_impsto = s.id_sjto_impsto',
' where not exists (select ''x''',
'          from gf_g_movimientos_financiero b',
'         where s.id_sjto_impsto = b.id_sjto_impsto',
'           and b.vgncia = s.vgncia',
'           and b.id_prdo = s.id_prdo)',
'   and not  exists (select ''x''',
'          from gi_g_declaraciones p',
'         where p.cdgo_clnte = s.cdgo_clnte',
'           and p.id_impsto = s.id_impsto',
'           and p.id_impsto_sbmpsto = s.id_impsto_sbmpsto',
'           and p.id_sjto_impsto = s.id_sjto_impsto',
'           and p.id_sjto_impsto = s.id_sjto_impsto',
'           and p.vgncia = s.vgncia) and ',
'   s.cdgo_clnte = 6',
'   and s.id_impsto = 10',
'   and s.id_impsto_sbmpsto = 9',
'   and s.id_sjto_impsto = 721855',
'   union all',
'select l.vgncia,',
'       ''RECIBO OFICIAL DE PAGO'' as descripcion,',
'      ',
'        (SELECT  impuesto ',
'          FROM TABLE(pkg_gi_vehiculos.fnc_co_dcmnto_vhclo(l.cdgo_clnte,',
'                                                          l.id_impsto,',
'                                                          l.id_impsto_sbmpsto,',
'                                                          l.id_sjto_impsto,',
'                                                          l.vgncia))) as impuesto,',
'        (SELECT intereses ',
'          FROM TABLE(pkg_gi_vehiculos.fnc_co_dcmnto_vhclo(l.cdgo_clnte,',
'                                                          l.id_impsto,',
'                                                          l.id_impsto_sbmpsto,',
'                                                          l.id_sjto_impsto,',
'                                                          l.vgncia))) as intereses,',
'            (SELECT sancion ',
'          FROM TABLE(pkg_gi_vehiculos.fnc_co_dcmnto_vhclo(l.cdgo_clnte,',
'                                                          l.id_impsto,',
'                                                          l.id_impsto_sbmpsto,',
'                                                          l.id_sjto_impsto,',
'                                                          l.vgncia))) as sancion,',
'          (SELECT descuento ',
'          FROM TABLE(pkg_gi_vehiculos.fnc_co_dcmnto_vhclo(l.cdgo_clnte,',
'                                                          l.id_impsto,',
'                                                          l.id_impsto_sbmpsto,',
'                                                          l.id_sjto_impsto,',
'                                                          l.vgncia))) as descuento,   ',
'      (SELECT total',
'          FROM TABLE(pkg_gi_vehiculos.fnc_co_dcmnto_vhclo(l.cdgo_clnte,',
'                                                          l.id_impsto,',
'                                                          l.id_impsto_sbmpsto,',
'                                                          l.id_sjto_impsto,',
'                                                          l.vgncia))) as total, ',
'                                                          ',
'                   ''R'' as indicador',
'  from  gi_g_liquidaciones l',
'   join gf_g_movimientos_financiero b',
'    on l.id_sjto_impsto = b.id_sjto_impsto',
'  join gi_g_determinaciones n',
'    on n.id_sjto_impsto = l.id_sjto_impsto',
'   and n.id_orgen = l.id_lqdcion',
'   and l.cdgo_clnte = b.cdgo_clnte',
'   and l.id_impsto = b.id_impsto',
'   and l.id_impsto_sbmpsto = b.id_impsto_sbmpsto',
'   and l.vgncia = b.vgncia',
' where l.cdgo_clnte = 6',
'   and l.id_impsto = 10',
'   and l.id_impsto_sbmpsto = 9',
'   and l.id_sjto_impsto = 721855',
'   and l.cdgo_lqdcion_estdo = ''L''',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95089295774200017)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencias'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(95089313747200018)
,p_name=>'DESCRIPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(95089425883200019)
,p_name=>'IMPUESTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMPUESTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(95089540222200020)
,p_name=>'INTERESES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INTERESES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Intereses'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(95089641423200021)
,p_name=>'SANCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SANCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Sanci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(95089796189200022)
,p_name=>'DESCUENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCUENTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Descuento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(95089872805200023)
,p_name=>'TOTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(95089920222200024)
,p_name=>'INDICADOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDICADOR'
,p_data_type=>'VARCHAR2'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95090052286200025)
,p_name=>'SELECCION'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(95089122627200016)
,p_internal_uid=>95089122627200016
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
 p_id=>wwv_flow_api.id(95108313731263878)
,p_interactive_grid_id=>wwv_flow_api.id(95089122627200016)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(95108433586263878)
,p_report_id=>wwv_flow_api.id(95108313731263878)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95108948424263880)
,p_view_id=>wwv_flow_api.id(95108433586263878)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(95089295774200017)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95109468622263882)
,p_view_id=>wwv_flow_api.id(95108433586263878)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(95089313747200018)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95109989550263883)
,p_view_id=>wwv_flow_api.id(95108433586263878)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(95089425883200019)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95110420430263885)
,p_view_id=>wwv_flow_api.id(95108433586263878)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(95089540222200020)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95110906015263886)
,p_view_id=>wwv_flow_api.id(95108433586263878)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(95089641423200021)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95111491200263888)
,p_view_id=>wwv_flow_api.id(95108433586263878)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(95089796189200022)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95111914431263889)
,p_view_id=>wwv_flow_api.id(95108433586263878)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(95089872805200023)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95112442230263896)
,p_view_id=>wwv_flow_api.id(95108433586263878)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(95089920222200024)
,p_is_visible=>true
,p_is_frozen=>false
);
end;
/
