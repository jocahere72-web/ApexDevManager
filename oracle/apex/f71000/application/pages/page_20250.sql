prompt --application/pages/page_20250
begin
wwv_flow_api.create_page(
 p_id=>2025028
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Registro de Fracciones'
,p_page_mode=>'MODAL'
,p_step_title=>'Registro de Fracciones'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/js/titulos.js'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'mostrarItems();',
'saldoTitulos();'))
,p_step_template=>wwv_flow_api.id(177318053164050589)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20260304222217'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17167916280110528)
,p_plug_name=>'container'
,p_region_name=>'container'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17166278442110511)
,p_plug_name=>'Fracciones'
,p_parent_plug_id=>wwv_flow_api.id(17167916280110528)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_ttlo_jdcial_frccn,',
'       a.id_impsto,',
'       a.id_impsto_sbmpsto,',
'       b.nmbre_impsto_sbmpsto,',
'       a.vlor,',
'       a.id_sjto_impsto,',
'       case',
'         when c.cdgo_impsto = ''IPU'' then',
'          pkg_gf_titulos_judicial.fnc_frmto_idntfccion_sjto(a.idntfccion)',
'         else',
'          a.idntfccion',
'       end as idntfccion,',
'       decode(a.tpo_accion,',
'              ''C'',',
unistr('              ''Consignaci\00F3n/Aplicaci\00F3n'','),
'              ''D'',',
unistr('              ''Devoluci\00F3n'') as tpo_accion'),
'  from gf_g_titulos_jdcl_frccnmnto a',
'  left join df_c_impuestos c on c.id_impsto = a.id_impsto',
'  left join df_i_impuestos_subimpuesto b on b.id_impsto = a.id_impsto and ',
'                                            b.id_impsto_sbmpsto = a.id_impsto_sbmpsto',
' where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17166409272110513)
,p_name=>'ID_TTLO_JDCIAL_FRCCN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_FRCCN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17166585027110514)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17166665219110515)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17166792047110516)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub Tributo'
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
 p_id=>wwv_flow_api.id(17166871599110517)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Fracci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990D00'
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
 p_id=>wwv_flow_api.id(17166922414110518)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17167040699110519)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(17167195999110520)
,p_name=>'TPO_ACCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_ACCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Acci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>23
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
 p_id=>wwv_flow_api.id(17166373987110512)
,p_internal_uid=>17166373987110512
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
 p_id=>wwv_flow_api.id(17180518211027340)
,p_interactive_grid_id=>wwv_flow_api.id(17166373987110512)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(17180623832027340)
,p_report_id=>wwv_flow_api.id(17180518211027340)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17181176430027338)
,p_view_id=>wwv_flow_api.id(17180623832027340)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(17166409272110513)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17181645451027336)
,p_view_id=>wwv_flow_api.id(17180623832027340)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(17166585027110514)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17182138305027335)
,p_view_id=>wwv_flow_api.id(17180623832027340)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(17166665219110515)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17182605126027333)
,p_view_id=>wwv_flow_api.id(17180623832027340)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(17166792047110516)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17183163789027331)
,p_view_id=>wwv_flow_api.id(17180623832027340)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(17166871599110517)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17183687350027330)
,p_view_id=>wwv_flow_api.id(17180623832027340)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(17166922414110518)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17184196738027328)
,p_view_id=>wwv_flow_api.id(17180623832027340)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(17167040699110519)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17184672711027327)
,p_view_id=>wwv_flow_api.id(17180623832027340)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(17167195999110520)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17167256168110521)
,p_plug_name=>'Detalle Fracciones'
,p_parent_plug_id=>wwv_flow_api.id(17167916280110528)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select d.id_ttlo_jdcial_frccn_dtlle,',
'       d.id_ttlo_jdcial_frccn,',
'       d.vgncia,',
'       d.id_prdo,       ',
'       d.vlor',
'  from gf_g_titulos_jdcl_frccnmnto_dtlle d;'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(17166278442110511)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17167496467110523)
,p_name=>'ID_TTLO_JDCIAL_FRCCN_DTLLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_FRCCN_DTLLE'
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
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17167562032110524)
,p_name=>'ID_TTLO_JDCIAL_FRCCN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_FRCCN'
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
,p_parent_column_id=>wwv_flow_api.id(17166409272110513)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17167600353110525)
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
 p_id=>wwv_flow_api.id(17167735613110526)
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17167838661110527)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Fracci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990D00'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(17167327393110522)
,p_internal_uid=>17167327393110522
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
 p_id=>wwv_flow_api.id(17186074049009963)
,p_interactive_grid_id=>wwv_flow_api.id(17167327393110522)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(17186186336009963)
,p_report_id=>wwv_flow_api.id(17186074049009963)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17186694703009962)
,p_view_id=>wwv_flow_api.id(17186186336009963)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(17167496467110523)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17187121380009961)
,p_view_id=>wwv_flow_api.id(17186186336009963)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(17167562032110524)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17187619286009960)
,p_view_id=>wwv_flow_api.id(17186186336009963)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(17167600353110525)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17188128242009958)
,p_view_id=>wwv_flow_api.id(17186186336009963)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(17167735613110526)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17188644472009957)
,p_view_id=>wwv_flow_api.id(17186186336009963)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(17167838661110527)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20566277279521015)
,p_plug_name=>unistr('Par\00E1metros')
,p_region_template_options=>'#DEFAULT#:t-Region--accent1:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20567412936521027)
,p_plug_name=>'Cartera Del Sujeto'
,p_region_name=>'cartera'
,p_parent_plug_id=>wwv_flow_api.id(20566277279521015)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rownum,t.* from (select k.idntfccion_sjto,',
'         k.id_impsto,',
'         k.id_impsto_sbmpsto,',
'         k.vgncia,',
'         k.prdo,',
'         k.id_prdo,',
'         k.id_sjto_impsto,',
'         sum(k.vlor_sldo_cptal) as vlor_sldo_cptal,',
'         sum(k.vlor_intres) as vlor_sldo_intres,',
'         sum(k.vlor_dscnto) vlor_dscnto,',
'         sum(k.vlor_sldo_cptal) + sum(k.vlor_intres) - sum(k.vlor_dscnto) vlor_ttal,',
'         sum(k.vlor_sldo_cptal) + sum(k.vlor_intres) - sum(k.vlor_dscnto) vlor_ttal_oculto,',
'         0 vlor_ttal_aplcar,',
'         0 vlor_dscnto_aplccion,',
'         0 vlor_ttal_aplccion,',
'         sum(k.vlor_dscnto) vlor_dscnto_oclto,',
'         ''Normal'' tpo_dcmnto,',
'         k.cdgo_mvmnto_orgn,',
'         k.id_orgen',
'    from (select i.idntfccion_sjto,',
'                 f.id_impsto,',
'                 f.id_impsto_sbmpsto,',
'                 b.vgncia,',
'                 b.prdo,',
'                 b.id_prdo,',
'                 f.id_sjto_impsto,                 ',
'                 b.vlor_sldo_cptal,',
'                 b.vlor_intres,',
'                 (b.vlor_sldo_cptal + b.vlor_intres) as total,',
'                 nvl((select case',
'                              when sum(vlor_dscnto) < b.vlor_sldo_cptal and',
'                                   sum(vlor_dscnto) > 0 then',
'                               sum(vlor_dscnto)',
'                              when sum(vlor_dscnto) > b.vlor_sldo_cptal and',
'                                   sum(vlor_dscnto) > 0 then',
'                               b.vlor_sldo_cptal',
'                            end as vlor_dscnto',
'                       from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo(p_cdgo_clnte           => f.cdgo_clnte,',
'                                                                                   p_id_impsto            => f.id_impsto,',
'                                                                                   p_id_impsto_sbmpsto    => f.id_impsto_sbmpsto,',
'                                                                                   p_vgncia               => b.vgncia,',
'                                                                                   p_id_prdo              => b.id_prdo,',
'                                                                                   p_id_cncpto            => b.id_cncpto,',
'                                                                                   p_id_sjto_impsto       => f.id_sjto_impsto,',
'                                                                                   p_fcha_pryccion        => :P2025028_FCHA_PRYCCION,',
'                                                                                   p_vlor                 => b.vlor_sldo_cptal,',
'                                                                                   p_cdna_vgncia_prdo_pgo => (select json_object(''VGNCIA_PRDO''',
'                                                                                                                                 value',
'                                                                                                                                 json_arrayagg(json_object(''vgncia''',
'                                                                                                                                                           value',
'                                                                                                                                                           vgncia,',
'                                                                                                                                                           ''prdo''',
'                                                                                                                                                           value prdo,',
'                                                                                                                                                           ''id_orgen''',
'                                                                                                                                                           value',
'                                                                                                                                                           id_orgen)',
'                                                                                                                                               order by',
'                                                                                                                                               vgncia,',
'                                                                                                                                               prdo,',
'                                                                                                                                               id_orgen',
'                                                                                                                                               returning clob)',
'                                                                                                                                 returning clob) vgncias_prdo',
'                                                                                                                from (select x.vgncia,',
'                                                                                                                             y.prdo,',
'                                                                                                                             x.id_orgen',
'                                                                                                                        from gf_g_mvmntos_cncpto_cnslddo x',
'                                                                                                                        join v_df_i_periodos y',
'                                                                                                                          on x.id_prdo =',
'                                                                                                                             y.id_prdo',
'                                                                                                                        join si_i_sujetos_impuesto z',
'                                                                                                                          on z.id_sjto_impsto =',
'                                                                                                                             x.id_sjto_impsto',
'                                                                                                                         and z.id_sjto_estdo = 1',
'                                                                                                                       where x.vlor_sldo_cptal > 0',
'                                                                                                                         and x.cdgo_mvnt_fncro_estdo in',
'                                                                                                                             (''NO'',',
'                                                                                                                              ''CN'')',
'                                                                                                                         and x.id_sjto_impsto =',
'                                                                                                                             f.id_sjto_impsto',
'                                                                                                                       group by x.vgncia,',
'                                                                                                                                y.prdo,',
'                                                                                                                                x.id_orgen)), --:P257_JSON_VGNCIAS_PRDO,',
'                                                                                   p_cdna_vgncia_prdo_ps  => null))),',
'                     0) + nvl((select vlor_dscnto',
'                                from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo(p_cdgo_clnte           => f.cdgo_clnte,',
'                                                                                            p_id_impsto            => f.id_impsto,',
'                                                                                            p_id_impsto_sbmpsto    => f.id_impsto_sbmpsto,',
'                                                                                            p_vgncia               => b.vgncia,',
'                                                                                            p_id_prdo              => b.id_prdo,',
'                                                                                            p_id_cncpto            => b.id_cncpto_intres_mra,',
'                                                                                            p_id_sjto_impsto       => f.id_sjto_impsto,',
'                                                                                            p_fcha_pryccion        => :P2025028_FCHA_PRYCCION,',
'                                                                                            p_vlor                 => b.vlor_intres,',
'                                                                                            p_cdna_vgncia_prdo_pgo => (select json_object(''VGNCIA_PRDO''',
'                                                                                                                                          value',
'                                                                                                                                          json_arrayagg(json_object(''vgncia''',
'                                                                                                                                                                    value',
'                                                                                                                                                                    vgncia,',
'                                                                                                                                                                    ''prdo''',
'                                                                                                                                                                    value prdo,',
'                                                                                                                                                                    ''id_orgen''',
'                                                                                                                                                                    value',
'                                                                                                                                                                    id_orgen)',
'                                                                                                                                                        order by',
'                                                                                                                                                        vgncia,',
'                                                                                                                                                        prdo,',
'                                                                                                                                                        id_orgen',
'                                                                                                                                                        returning clob)',
'                                                                                                                                          returning clob) vgncias_prdo',
'                                                                                                                         from (select x.vgncia,',
'                                                                                                                                      y.prdo,',
'                                                                                                                                      x.id_orgen',
'                                                                                                                                 from gf_g_mvmntos_cncpto_cnslddo x',
'                                                                                                                                 join v_df_i_periodos y',
'                                                                                                                                   on x.id_prdo =',
'                                                                                                                                      y.id_prdo',
'                                                                                                                                 join si_i_sujetos_impuesto z',
'                                                                                                                                   on z.id_sjto_impsto =',
'                                                                                                                                      x.id_sjto_impsto',
'                                                                                                                                  and z.id_sjto_estdo = 1',
'                                                                                                                                where x.vlor_sldo_cptal > 0',
'                                                                                                                                  and x.cdgo_mvnt_fncro_estdo in',
'                                                                                                                                      (''NO'',',
'                                                                                                                                       ''CN'')',
'                                                                                                                                  and x.id_sjto_impsto =',
'                                                                                                                                      f.id_sjto_impsto',
'                                                                                                                                group by x.vgncia,',
'                                                                                                                                         y.prdo,',
'                                                                                                                                         x.id_orgen)), --:P257_JSON_VGNCIAS_PRDO,',
'                                                                                            p_cdna_vgncia_prdo_ps  => null',
'                                                                                            -- Ley 2155',
'                                                                                           ,',
'                                                                                            p_cdgo_mvmnto_orgn => b.cdgo_mvmnto_orgn,',
'                                                                                            p_id_orgen         => b.id_orgen,',
'                                                                                            p_vlor_cptal       => b.vlor_sldo_cptal,',
'                                                                                            P_ID_CNCPTO_BASE   => b.id_cncpto))),',
'                              0) as vlor_dscnto,',
'                 b.cdgo_mvmnto_orgn,',
'                 b.id_orgen',
'            from gf_g_movimientos_financiero f          ',
'            join v_si_i_sujetos_impuesto i',
'              on i.id_sjto_impsto = f.id_sjto_impsto',
'             and i.id_sjto_estdo = 1',
'            join table(pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto(p_cdgo_clnte => f.cdgo_clnte, ',
'                                                                            p_id_impsto => f.id_impsto, ',
'                                                                            p_id_impsto_sbmpsto => f.id_impsto_sbmpsto, ',
'                                                                            p_id_sjto_impsto => f.id_sjto_impsto, ',
'                                                                            p_fcha_vncmnto => :P2025028_FCHA_PRYCCION)) b',
'              on f.id_mvmnto_fncro = b.id_mvmnto_fncro',
'             and f.vgncia = b.vgncia',
'             and f.id_prdo = b.id_prdo            ',
'           where f.cdgo_clnte = :F_CDGO_CLNTE',
'             and (b.vlor_sldo_cptal + b.vlor_intres) > 0',
'             and f.cdgo_mvnt_fncro_estdo in (''NO'', ''CN'')',
'             and f.id_impsto = :P2025028_ID_IMPSTO',
'             and f.id_impsto_sbmpsto = :P2025028_ID_IMPSTO_SBMPSTO',
'             and (i.idntfccion_sjto = :P2025028_INDTFCCION_SJTO)',
'             ) k',
'   where not exists (select n.vgncia, n.id_prdo, n.id_orgen',
'            from gf_g_titulos_judicial l',
'            join gf_g_titulos_jdcial_impsto m',
'              on m.id_ttlo_jdcial = l.id_ttlo_jdcial',
'            join gf_g_titulos_jdcial_vgncia n',
'              on n.id_ttlo_jdcial_impsto = m.id_ttlo_jdcial_impsto',
'           where l.cdgo_ttlo_jdcial_estdo != ''ATJ'' --Consignado',
'             and l.id_instncia_fljo != :F_ID_INSTNCIA_FLJO',
'             and m.id_sjto_impsto = k.id_sjto_impsto',
'             and n.vgncia = k.vgncia',
'             and n.id_prdo = k.id_prdo',
'             and n.id_orgen = k.id_orgen)',
'     and not exists (select 1',
'            from gf_g_titulos_jdcial_vgncia_temp o',
'           where o.id_sjto_impsto = k.id_sjto_impsto',
'             and o.vgncia = k.vgncia',
'             and o.id_prdo = k.id_prdo',
'             and o.id_orgen = k.id_orgen)',
'   group by k.idntfccion_sjto,',
'            k.id_impsto,',
'            k.id_impsto_sbmpsto,',
'            k.vgncia,',
'            k.prdo,',
'            k.id_prdo,',
'            k.id_sjto_impsto,',
'            k.cdgo_mvmnto_orgn,',
'            k.id_orgen',
'   order by k.idntfccion_sjto, k.vgncia desc, k.prdo) t'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P2025028_TPO_ACCION'
,p_plug_display_when_cond2=>'C'
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(20567648205521029)
,p_name=>'ROWNUM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWNUM'
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
 p_id=>wwv_flow_api.id(20567792725521030)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n <br>Del Sujeto')
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
 p_id=>wwv_flow_api.id(20567814650521031)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(20567954549521032)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(20568074832521033)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(20568148684521034)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(20568205796521035)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(20568351398521036)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(20568461452521037)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(20568568150521038)
,p_name=>'VLOR_SLDO_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Saldo Inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(20568647324521039)
,p_name=>'VLOR_DSCNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Descuento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(20568717172521040)
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
,p_format_mask=>'FM999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(20568852418521041)
,p_name=>'VLOR_TTAL_OCULTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_OCULTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(20568980436521042)
,p_name=>'VLOR_TTAL_APLCAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_APLCAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Aplicar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(20569058275521043)
,p_name=>'VLOR_DSCNTO_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO_APLCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(20569101866521044)
,p_name=>'VLOR_TTAL_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_APLCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(20569236428521045)
,p_name=>'VLOR_DSCNTO_OCLTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO_OCLTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(20569344560521046)
,p_name=>'TPO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_DCMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Tipo Aplicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>6
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
 p_id=>wwv_flow_api.id(20569437879521047)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
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
 p_id=>wwv_flow_api.id(20569565346521048)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
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
 p_id=>wwv_flow_api.id(20644699017279303)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(20644759819279304)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(20567544756521028)
,p_internal_uid=>20567544756521028
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>true
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
 p_id=>wwv_flow_api.id(20632807008249066)
,p_interactive_grid_id=>wwv_flow_api.id(20567544756521028)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(20632983558249066)
,p_report_id=>wwv_flow_api.id(20632807008249066)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20633429228249068)
,p_view_id=>wwv_flow_api.id(20632983558249066)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(20567648205521029)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20633906840249069)
,p_view_id=>wwv_flow_api.id(20632983558249066)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(20567792725521030)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20634469597249071)
,p_view_id=>wwv_flow_api.id(20632983558249066)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(20567814650521031)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20634997796249072)
,p_view_id=>wwv_flow_api.id(20632983558249066)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(20567954549521032)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20635455289249074)
,p_view_id=>wwv_flow_api.id(20632983558249066)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(20568074832521033)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20635991314249076)
,p_view_id=>wwv_flow_api.id(20632983558249066)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(20568148684521034)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20636467048249077)
,p_view_id=>wwv_flow_api.id(20632983558249066)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(20568205796521035)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20636920937249079)
,p_view_id=>wwv_flow_api.id(20632983558249066)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(20568351398521036)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20637429969249080)
,p_view_id=>wwv_flow_api.id(20632983558249066)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(20568461452521037)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20637912071249082)
,p_view_id=>wwv_flow_api.id(20632983558249066)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(20568568150521038)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20638421658249083)
,p_view_id=>wwv_flow_api.id(20632983558249066)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(20568647324521039)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20638920102249086)
,p_view_id=>wwv_flow_api.id(20632983558249066)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(20568717172521040)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20639447886249087)
,p_view_id=>wwv_flow_api.id(20632983558249066)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(20568852418521041)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20639931014249089)
,p_view_id=>wwv_flow_api.id(20632983558249066)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(20568980436521042)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20640419785249091)
,p_view_id=>wwv_flow_api.id(20632983558249066)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(20569058275521043)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20640942433249093)
,p_view_id=>wwv_flow_api.id(20632983558249066)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(20569101866521044)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20641438557249094)
,p_view_id=>wwv_flow_api.id(20632983558249066)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(20569236428521045)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20641976224249096)
,p_view_id=>wwv_flow_api.id(20632983558249066)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(20569344560521046)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20642481276249097)
,p_view_id=>wwv_flow_api.id(20632983558249066)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(20569437879521047)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20642949016249099)
,p_view_id=>wwv_flow_api.id(20632983558249066)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(20569565346521048)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20651661718294817)
,p_view_id=>wwv_flow_api.id(20632983558249066)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(20644699017279303)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(20566731918521020)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(20566277279521015)
,p_button_name=>'BTN_CNSLTAR'
,p_button_static_id=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(20699144203654701)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(20566277279521015)
,p_button_name=>'BTN_RGSTRSR_FRCCION'
,p_button_static_id=>'BTN_RGSTRSR_FRCCION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Registrar Fracci\00F3n')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(20699750632654707)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(20566277279521015)
,p_button_name=>'BTN_RGSTRAR_DVLCION'
,p_button_static_id=>'BTN_RGSTRAR_DVLCION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Registrar Fracci\00F3n (Devoluci\00F3n)')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5507355157808801)
,p_name=>'P2025028_MNTO_DSPNBLE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(20566277279521015)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5518402294615901)
,p_name=>'P2025028_VLOR_SLCCNDO_TMP'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(20566277279521015)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5527446406503301)
,p_name=>'P2025028_VLOR_TTLO_FRCC_CLCLDO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(20566277279521015)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20566388032521016)
,p_name=>'P2025028_ID_TTLO_JDCIAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(20566277279521015)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20566440778521017)
,p_name=>'P2025028_FCHA_PRYCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(20566277279521015)
,p_prompt=>unistr('<b>Fecha De Proyecci\00F3n</b>')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20566511773521018)
,p_name=>'P2025028_ID_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(20566277279521015)
,p_prompt=>'<b>Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20566800997521021)
,p_name=>'P2025028_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(20566277279521015)
,p_prompt=>'<b>Sub Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_impsto_sbmpsto d,',
'        id_impsto_sbmpsto  r',
'   from df_i_impuestos_subimpuesto',
'   where id_impsto = :P2025028_ID_IMPSTO',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P2025028_ID_IMPSTO'
,p_ajax_items_to_submit=>'P2025028_ID_IMPSTO,P2025028_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20567196268521024)
,p_name=>'P2025028_INDTFCCION_SJTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(20566277279521015)
,p_prompt=>unistr('<b>Identificaci\00F3n Sujeto</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20567215205521025)
,p_name=>'P2025028_IDNTFCCION_DMNDDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(20566277279521015)
,p_prompt=>unistr('<b>Identificaci\00F3n Demandado</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20567340309521026)
,p_name=>'P2025028_NMBRES_DMNDDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(20566277279521015)
,p_prompt=>'<b>Nombres Demandado</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20623605237117303)
,p_name=>'P2025028_TPO_ACCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(20566277279521015)
,p_prompt=>unistr('<b>Acci\00F3n</b>')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Consignaci\00F3n;C,Devoluci\00F3n;D')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20644967423279306)
,p_name=>'P2025028_VLOR_TTLO_JDCIAL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(20566277279521015)
,p_prompt=>unistr('<b>Valor T\00EDtulo Judicial</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20645053985279307)
,p_name=>'P2025028_VLOR_RMNNTE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(20566277279521015)
,p_prompt=>'<b>Saldo Remanente</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20645114675279308)
,p_name=>'P2025028_VLOR_RMNNTE_TMP'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(20566277279521015)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20645209732279309)
,p_name=>'P2025028_VLOR_SLCCNDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(20566277279521015)
,p_prompt=>'<b>Cartera Seleccionada</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20645392396279310)
,p_name=>'P2025028_JSON_CRTRAS'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(20566277279521015)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20700132419654711)
,p_name=>'P2025028_MOSTRAR'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(20566277279521015)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20763263469077601)
,p_name=>'P2025028_VLOR_DVLCION'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(20566277279521015)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(20645445348279311)
,p_computation_sequence=>10
,p_computation_item=>'P2025028_VLOR_TTLO_JDCIAL'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''$ ''||trim(to_char(nvl(sum(a.vlor),0), ''999,999,999,999'')) valor',
'from gf_g_titulos_judicial a',
'where a.id_ttlo_jdcial = :P2025028_ID_TTLO_JDCIAL;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(20699669890654706)
,p_computation_sequence=>20
,p_computation_item=>'P2025028_NMBRES_DMNDDO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select trim(replace(nmbre_dmnddo,''.'',''''))  from gf_g_titulos_judicial a ',
'where a.id_ttlo_jdcial = :P2025028_ID_TTLO_JDCIAL',
' and a.idntfccion_dmnddo = :P2025028_IDNTFCCION_DMNDDO;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(5507450271808802)
,p_computation_sequence=>30
,p_computation_item=>'P2025028_MNTO_DSPNBLE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.vlor - sum(a.vlor) ',
'    from gf_g_titulos_jdcl_frccnmnto a',
'    join gf_g_titulos_judicial b on b.id_ttlo_jdcial = a.id_ttlo_jdcial',
'    where a.id_ttlo_jdcial = :P2025028_ID_TTLO_JDCIAL',
'    group by b.vlor;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(5518500744615902)
,p_computation_sequence=>40
,p_computation_item=>'P2025028_VLOR_SLCCNDO_TMP'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sum(a.vlor) ',
'    from gf_g_titulos_jdcl_frccnmnto a    ',
'    where a.id_ttlo_jdcial = :P2025028_ID_TTLO_JDCIAL;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(20645544768279312)
,p_computation_sequence=>10
,p_computation_item=>'P2025028_JSON_CRTRAS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null from dual;',
''))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(20566952877521022)
,p_name=>'Al cambiar el valor de P2025028_TPO_ACCION'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2025028_TPO_ACCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(20567098875521023)
,p_event_id=>wwv_flow_api.id(20566952877521022)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'mostrarItems();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(20644431609279301)
,p_name=>'Al seleccionar una fila del IG Cartera Del Sujeto'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(20567412936521027)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(20644595544279302)
,p_event_id=>wwv_flow_api.id(20644431609279301)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'cl_crtra_slccnda();',
'//validaValorTitulos();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(20569619592521049)
,p_name=>'Al inicializar el IG Cartera Del Sujeto'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(20567412936521027)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(20569722991521050)
,p_event_id=>wwv_flow_api.id(20569619592521049)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TPO_DCMNTO,VLOR_DSCNTO_APLCCION,VLOR_TTAL_APLCCION,VLOR_TTAL_APLCAR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(20699260363654702)
,p_name=>'Al dar cliec en BTN_RGSTRSR_FRCCION'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(20699144203654701)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(20699305337654703)
,p_event_id=>wwv_flow_api.id(20699260363654702)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'registrarCartera();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(20699866500654708)
,p_name=>'Al dar clic en BTN_RGSTRSR_DVLCION'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(20699750632654707)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(20699940301654709)
,p_event_id=>wwv_flow_api.id(20699866500654708)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'registrarDevolucion();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(20645662343279313)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_ITEM_SESION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_item_name  varchar2(100) := apex_application.g_x01;',
'    v_item_value varchar2(4000) := apex_application.g_x02;',
'    o_cdgo_rspsta number;',
'    o_mnsje_rspsta varchar2(4000);',
'begin',
'   ',
'   begin',
'       apex_util.set_session_state(p_name  => v_item_name,',
'                                   p_value => v_item_value);',
'   exception when others then',
'       o_cdgo_rspsta := 10;',
'       o_mnsje_rspsta := ''Error: '' || sqlerrm;',
'   end;',
'   ',
'   apex_json.open_object;',
'   apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'   apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'   apex_json.close_object;   ',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(20699443380654704)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'registrarCartera'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta  number:= 0;',
'    o_mnsje_rspsta varchar2(4000);',
'    v_json         clob;',
'    v_orden        number;',
'    v_obsrvcn      varchar2(4000);',
'    v_accion       varchar2(1);',
'    v_exception    exception;',
'begin',
'    ',
'    for i in 1..apex_application.g_f01.count loop',
'        v_json := v_json || apex_application.g_f01(i);',
'    end loop; ',
'    ',
'    v_orden := apex_application.g_x01;',
'    v_obsrvcn := apex_application.g_x02;',
'    v_accion := apex_application.g_x03;',
'    ',
'    pkg_gf_titulos_judicial.prc_rg_titulos_judicial_fraccion(p_cdgo_clnte             => :F_CDGO_CLNTE,',
'                                                             p_json_crtra             => v_json,',
'                                                             p_id_ttlo_jdcial 		  => :P2025028_ID_TTLO_JDCIAL,',
'                                                             p_orden				  => v_orden,',
'                                                             p_obsrvcn           	  => v_obsrvcn,',
'                                                             p_indcdor_frccn_rgstrda  => ''N'',',
'                                                             p_id_ttlo_jdcial_rgstrdo => null,',
'                                                             p_tpo_accion 			  => v_accion,',
'                                                             o_cdgo_rspsta            => o_cdgo_rspsta,',
'                                                             o_mnsje_rspsta           => o_mnsje_rspsta);',
'    ',
'    if o_cdgo_rspsta > 0 then',
'       raise v_exception;     ',
'    end if;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.close_object;',
'    ',
'exception',
'    when v_exception then   ',
'    ',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'        apex_json.close_object;',
'    ',
'    when others then   ',
'    ',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', 20);',
'        apex_json.write(''o_mnsje_rspsta'', ''Error inesperado al procesar el registro'');',
'        apex_json.close_object;    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(20700080777654710)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'registrarDevolucion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_orden number;',
'    v_obsrvcn varchar2(4000);',
'    v_accion varchar2(1);',
'    v_vlor_frccion number;',
'    o_cdgo_rspsta number;',
'    o_mnsje_rspsta varchar2(4000);',
'    v_exception exception;',
'    v_vlor_rmnte number;',
'    v_vlor_consgndo number;',
'    v_vlor_ttlo number;',
'begin',
'',
'    v_orden         := apex_application.g_x01;',
'    v_obsrvcn       := apex_application.g_x02;',
'    v_accion        := apex_application.g_x03;',
'    v_vlor_frccion  := apex_application.g_x04;',
'    v_vlor_consgndo := apex_application.g_x05;',
'    v_vlor_ttlo     := apex_application.g_x06;',
'    ',
'    pkg_gf_titulos_judicial.prc_rg_titulos_judicial_frccn_dvlcion(p_cdgo_clnte             => :F_CDGO_CLNTE,',
'                                                                  p_id_ttlo_jdcial 		   => :P2025028_ID_TTLO_JDCIAL, ',
'                                                                  p_orden				   => v_orden,',
'                                                                  p_obsrvcn           	   => v_obsrvcn,',
'                                                                  p_indcdor_frccn_rgstrda  => ''N'',',
'                                                                  p_id_ttlo_jdcial_rgstrdo => null,',
'                                                                  p_tpo_accion 			   => v_accion,',
'                                                                  p_vlor_frccion           => v_vlor_frccion,',
'                                                                  p_idntfccion_sjto        => :P2025028_IDNTFCCION_DMNDDO,',
'                                                                  p_id_instncia_fljo       => :F_ID_INSTNCIA_FLJO,',
'                                                                  o_cdgo_rspsta            => o_cdgo_rspsta,',
'                                                                  o_mnsje_rspsta           => o_mnsje_rspsta);',
'                                                                  ',
'    if o_cdgo_rspsta = 0 then        ',
'        :P2025028_VLOR_DVLCION := v_vlor_frccion;',
'    else',
'           raise v_exception;     ',
'    end if;',
'',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.close_object;',
'    ',
'exception',
'    when v_exception then   ',
'    ',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'        apex_json.close_object;',
'    ',
'    when others then   ',
'    ',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', 20);',
'        apex_json.write(''o_mnsje_rspsta'', ''Error inesperado al procesar el registro'');',
'        apex_json.close_object;',
'end;                                                                  '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
