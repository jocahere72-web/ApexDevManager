prompt --application/pages/page_00243
begin
wwv_flow_api.create_page(
 p_id=>243
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Fraccionamiento'
,p_step_title=>'Fraccionamiento'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/accounting.min.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/js/titulos.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buildJsonTitulos() {',
'    ',
'    var region = apex.region(''titulos'');',
'    ',
'    if(region) {',
'        ',
'        var view = apex.region("titulos").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = model._data;//view.view$.grid("getSelectedRecords");',
'        ',
'        var jsonTitulos = records.map((titulos) => {',
'            return {"ID_TTLO_JDCIAL" : model.getValue(titulos, "ID_TTLO_JDCIAL"),',
'                    "TTLO_JDCIAL_ESTDO" : model.getValue(titulos, "TTLO_JDCIAL_ESTDO"),',
'                    "ID_INSTNCIA_FLJO" : model.getValue(titulos, "ID_INSTNCIA_FLJO")',
'                   }; ',
'        });',
'        $s(''P243_JSON_TTLOS'', JSON.stringify(jsonTitulos));',
'        console.log(''json_titulos: ''+JSON.stringify(jsonTitulos))',
'        //window.localStorage.setItem(''jsonTitulos'', JSON.stringify(jsonTitulos));',
'    }',
'};'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.centrado-texto input {',
'  text-align: center;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20260304225401'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17168719049110536)
,p_plug_name=>'Contenedor'
,p_region_name=>'Contenedor'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17168093070110529)
,p_plug_name=>'<b>Detalle</b>'
,p_parent_plug_id=>wwv_flow_api.id(17168719049110536)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>80
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select d.id_ttlo_jdcial_frccn_dtlle,',
'       d.id_ttlo_jdcial_frccn,',
'       d.vgncia,',
'       d.id_prdo,       ',
'       d.vlor',
'  from gf_g_titulos_jdcl_frccnmnto_dtlle d;'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(22260438044653801)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17168280067110531)
,p_name=>'ID_TTLO_JDCIAL_FRCCN_DTLLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_FRCCN_DTLLE'
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
 p_id=>wwv_flow_api.id(17168353315110532)
,p_name=>'ID_TTLO_JDCIAL_FRCCN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_FRCCN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(17168852788110537)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17168494652110533)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencias'
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
 p_id=>wwv_flow_api.id(17168517857110534)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17168665996110535)
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
 p_id=>wwv_flow_api.id(17168154265110530)
,p_internal_uid=>17168154265110530
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
 p_id=>wwv_flow_api.id(17201122844920019)
,p_interactive_grid_id=>wwv_flow_api.id(17168154265110530)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(17201230579920019)
,p_report_id=>wwv_flow_api.id(17201122844920019)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17201795120920018)
,p_view_id=>wwv_flow_api.id(17201230579920019)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(17168280067110531)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17202261541920017)
,p_view_id=>wwv_flow_api.id(17201230579920019)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(17168353315110532)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17202728734920016)
,p_view_id=>wwv_flow_api.id(17201230579920019)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(17168494652110533)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17203266358920014)
,p_view_id=>wwv_flow_api.id(17201230579920019)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(17168517857110534)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17203731195920013)
,p_view_id=>wwv_flow_api.id(17201230579920019)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(17168665996110535)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22260438044653801)
,p_plug_name=>unistr('<b>T\00EDtulo Fraccionado</b>')
,p_parent_plug_id=>wwv_flow_api.id(17168719049110536)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--accent1:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_ttlo_jdcial    ',
'       ,a.id_impsto         ',
'       ,a.id_impsto_sbmpsto ',
'       ,a.orden             ',
'       ,a.vlor              ',
'       ,a.obsrvcn',
'       ,id_ttlo_jdcial_frccn',
'from gf_g_titulos_jdcl_frccnmnto a',
'where a.id_ttlo_jdcial = :P243_ID_TTLO_JDCIAL',
';',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gf_g_titulos_jdcl_frccnmnto a',
'where a.id_ttlo_jdcial = :P243_ID_TTLO_JDCIAL',
';'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17168852788110537)
,p_name=>'ID_TTLO_JDCIAL_FRCCN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_FRCCN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>290
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
 p_id=>wwv_flow_api.id(22261998416653816)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22263614905653833)
,p_name=>'ID_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22264176878653838)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(177369392791050685)
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
 p_id=>wwv_flow_api.id(22264272095653839)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Sub Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(177369818921050685)
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
 p_id=>wwv_flow_api.id(22264389649653840)
,p_name=>'ORDEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORDEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Orden'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
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
 p_id=>wwv_flow_api.id(22264468031653841)
,p_name=>'OBSRVCN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_api.id(22261671480653813)
,p_internal_uid=>22261671480653813
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'ACTIONS_MENU'
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
 p_id=>wwv_flow_api.id(22269641703667502)
,p_interactive_grid_id=>wwv_flow_api.id(22261671480653813)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(22269701735667509)
,p_report_id=>wwv_flow_api.id(22269641703667502)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17205853147908254)
,p_view_id=>wwv_flow_api.id(22269701735667509)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(17168852788110537)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22270289776667518)
,p_view_id=>wwv_flow_api.id(22269701735667509)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(22261998416653816)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22270779326667526)
,p_view_id=>wwv_flow_api.id(22269701735667509)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(22263614905653833)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22272073348667537)
,p_view_id=>wwv_flow_api.id(22269701735667509)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(22264176878653838)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22272504933667540)
,p_view_id=>wwv_flow_api.id(22269701735667509)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(22264272095653839)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22273004137667545)
,p_view_id=>wwv_flow_api.id(22269701735667509)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(22264389649653840)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22273583818667547)
,p_view_id=>wwv_flow_api.id(22269701735667509)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(22264468031653841)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>350
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(1723411012359)
,p_view_id=>wwv_flow_api.id(22269701735667509)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(22261998416653816)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18024880458459912)
,p_plug_name=>unistr('Par\00E1metros')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37406342722054829)
,p_plug_name=>'<b>Cartera Proyectada</b>'
,p_region_name=>'cartera2'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with carteras as',
' (select rownum, t.*',
'    from (select k.nmro_prcso_jrdco,',
'                 k.cnsctvo_embrgo,',
'                 k.idntfccion_sjto,',
'                 k.id_impsto,',
'                 k.id_impsto_sbmpsto,',
'                 k.nmbre_impsto_sbmpsto,',
'                 k.vgncia,',
'                 k.prdo,',
'                 k.id_prdo,',
'                 k.id_sjto_impsto,',
'                 k.id_sjto_rspnsble,',
'                 sum(k.vlor_sldo_cptal) as vlor_sldo_cptal,',
'                 sum(k.vlor_intres) as vlor_sldo_intres,',
'                 sum(k.vlor_dscnto) vlor_dscnto,',
'                 sum(k.vlor_sldo_cptal) + sum(k.vlor_intres) -',
'                 sum(k.vlor_dscnto) vlor_ttal,',
'                 k.cdgo_mvmnto_orgn,',
'                 k.id_orgen',
'            from (select h.nmro_prcso_jrdco,',
'                         h.cnsctvo_embrgo,',
'                         b.idntfccion_sjto,',
'                         c.id_impsto,',
'                         c.id_impsto_sbmpsto,',
'                         si.nmbre_impsto_sbmpsto,',
'                         d.vgncia,',
'                         d.prdo,',
'                         d.id_prdo,',
'                         c.id_sjto_impsto,',
'                         a.id_sjto_rspnsble,',
'                         d.vlor_sldo_cptal,',
'                         d.vlor_intres,',
'                         (d.vlor_sldo_cptal + d.vlor_intres) as total,',
'                         nvl((select case',
'                                      when sum(vlor_dscnto) < d.vlor_sldo_cptal and',
'                                           sum(vlor_dscnto) > 0 then',
'                                       sum(vlor_dscnto)',
'                                      when sum(vlor_dscnto) > d.vlor_sldo_cptal and',
'                                           sum(vlor_dscnto) > 0 then',
'                                       d.vlor_sldo_cptal',
'                                    end as vlor_dscnto',
'                               from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo(p_cdgo_clnte           => c.cdgo_clnte,',
'                                                                                           p_id_impsto            => c.id_impsto,',
'                                                                                           p_id_impsto_sbmpsto    => c.id_impsto_sbmpsto,',
'                                                                                           p_vgncia               => d.vgncia,',
'                                                                                           p_id_prdo              => d.id_prdo,',
'                                                                                           p_id_cncpto            => d.id_cncpto,',
'                                                                                           p_id_sjto_impsto       => c.id_sjto_impsto,',
'                                                                                           p_fcha_pryccion        => :P243_FCHA_PRYCCION,',
'                                                                                           p_vlor                 => d.vlor_sldo_cptal,',
'                                                                                           p_cdna_vgncia_prdo_pgo => :P243_JSON_VGNCIAS_PRDO,',
'                                                                                           p_cdna_vgncia_prdo_ps  => null))),',
'                             0) + nvl((select vlor_dscnto',
'                                        from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo(p_cdgo_clnte           => c.cdgo_clnte,',
'                                                                                                    p_id_impsto            => c.id_impsto,',
'                                                                                                    p_id_impsto_sbmpsto    => c.id_impsto_sbmpsto,',
'                                                                                                    p_vgncia               => d.vgncia,',
'                                                                                                    p_id_prdo              => d.id_prdo,',
'                                                                                                    p_id_cncpto            => d.id_cncpto_intres_mra,',
'                                                                                                    p_id_sjto_impsto       => c.id_sjto_impsto,',
'                                                                                                    p_fcha_pryccion        => :P243_FCHA_PRYCCION, --:P257_FCHA_PRYCCION,',
'                                                                                                    p_vlor                 => d.vlor_intres,',
'                                                                                                    p_cdna_vgncia_prdo_pgo => :P243_JSON_VGNCIAS_PRDO,',
'                                                                                                    p_cdna_vgncia_prdo_ps  => null',
'                                                                                                    -- Ley 2155',
'                                                                                                   ,',
'                                                                                                    p_cdgo_mvmnto_orgn => d.cdgo_mvmnto_orgn,',
'                                                                                                    p_id_orgen         => d.id_orgen,',
'                                                                                                    p_vlor_cptal       => d.vlor_sldo_cptal,',
'                                                                                                    P_ID_CNCPTO_BASE   => d.id_cncpto))),',
'                                      0) as vlor_dscnto,',
'                         d.cdgo_mvmnto_orgn,',
'                         d.id_orgen',
'                    from si_i_sujetos_responsable a',
'                    join v_si_i_sujetos_impuesto b',
'                      on a.id_sjto_impsto = b.id_sjto_impsto',
'                     and b.id_sjto_estdo = 1',
'                    join gf_g_movimientos_financiero c',
'                      on b.id_sjto_impsto = c.id_sjto_impsto',
'                    join table(pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto(p_cdgo_clnte => c.cdgo_clnte, p_id_impsto => c.id_impsto, p_id_impsto_sbmpsto => c.id_impsto_sbmpsto, p_id_sjto_impsto => b.id_sjto_impsto, p_fcha_vncmnto => :P243_FC'
||'HA_PRYCCION)) d',
'                      on c.id_mvmnto_fncro = d.id_mvmnto_fncro                    ',
'                    left join (select id_mvmnto_fncro,',
'                             cdgo_clnte,',
'                             id_impsto,',
'                             id_impsto_sbmpsto,',
'                             id_sjto_impsto,',
'                             nmro_prcso_jrdco,',
'                             cnsctvo_embrgo',
'                        from v_mc_g_embargos_cartera_detalle',
'                       group by id_mvmnto_fncro,',
'                                cdgo_clnte,',
'                                id_impsto,',
'                                id_impsto_sbmpsto,',
'                                id_sjto_impsto,',
'                                nmro_prcso_jrdco,',
'                                cnsctvo_embrgo) h',
'                      on c.id_mvmnto_fncro = h.id_mvmnto_fncro',
'                        and c.cdgo_clnte = h.cdgo_clnte',
'                        and c.id_impsto = h.id_impsto',
'                        and c.id_impsto_sbmpsto = h.id_impsto_sbmpsto',
'                        and c.id_sjto_impsto = h.id_sjto_impsto  ',
'                     join df_i_impuestos_subimpuesto si on si.id_impsto_sbmpsto = c.id_impsto_sbmpsto  ',
'                    where a.idntfccion like (case',
'                           when pkg_gf_titulos_judicial.fnc_ca_nit_cc(:P243_IDNTFCCION_DMNDDO) = ''N'' then',
'                            (''%'' ||',
'                            substr(nvl(substr(ltrim(:P243_IDNTFCCION_DMNDDO, 0),',
'                                               1,',
'                                               instr(:P243_IDNTFCCION_DMNDDO,',
'                                                     ''-'')),',
'                                        ltrim(:P243_IDNTFCCION_DMNDDO, 0)),',
'                                    1,',
'                                    9) || ''%'')',
'                           else',
'                            (''%'' ||',
'                            nvl(substr(ltrim(:P243_IDNTFCCION_DMNDDO, 0),',
'                                        1,',
'                                        instr(:P243_IDNTFCCION_DMNDDO, ''-'')),',
'                                 ltrim(:P243_IDNTFCCION_DMNDDO, 0)) || ''%'')',
'                         end)',
'                     and d.vlor_sldo_cptal > 0',
'                     and c.cdgo_mvnt_fncro_estdo in (''NO'', ''CN'')',
'                     and a.prncpal_s_n = ''S''',
'                   order by d.vgncia desc, d.cdgo_cncpto) k',
'           group by k.nmro_prcso_jrdco,',
'                    k.cnsctvo_embrgo,',
'                    k.idntfccion_sjto,',
'                    k.id_impsto,',
'                    k.id_impsto_sbmpsto,',
'                    k.nmbre_impsto_sbmpsto,',
'                    k.vgncia,',
'                    k.prdo,',
'                    k.id_prdo,',
'                    k.id_sjto_impsto,',
'                    k.id_sjto_rspnsble,',
'                    k.cdgo_mvmnto_orgn,',
'                    k.id_orgen) t',
'   where not exists',
'   (select n.vgncia, n.id_prdo, n.id_orgen',
'            from gf_g_titulos_judicial l',
'            join gf_g_titulos_jdcial_impsto m',
'              on m.id_ttlo_jdcial = l.id_ttlo_jdcial',
'            join gf_g_titulos_jdcial_vgncia n',
'              on n.id_ttlo_jdcial_impsto = m.id_ttlo_jdcial_impsto',
'           where l.idntfccion_dmnddo like (case',
'                   when pkg_gf_titulos_judicial.fnc_ca_nit_cc(:P243_IDNTFCCION_DMNDDO) = ''N'' then',
'                    (''%'' ||',
'                    substr(nvl(substr(ltrim(:P243_IDNTFCCION_DMNDDO, 0),',
'                                       1,',
'                                       instr(:P243_IDNTFCCION_DMNDDO, ''-'')),',
'                                ltrim(:P243_IDNTFCCION_DMNDDO, 0)),',
'                            1,',
'                            9) || ''%'')',
'                   else',
'                    (''%'' || nvl(substr(ltrim(:P243_IDNTFCCION_DMNDDO, 0),',
'                                       1,',
'                                       instr(:P243_IDNTFCCION_DMNDDO, ''-'')),',
'                                ltrim(:P243_IDNTFCCION_DMNDDO, 0)) || ''%'')',
'                 end)',
'             and l.cdgo_ttlo_jdcial_estdo != ''ATJ'' --Consignado',
'             and l.id_instncia_fljo != :F_ID_INSTNCIA_FLJO',
'             and m.id_sjto_impsto = t.id_sjto_impsto',
'             and n.vgncia = t.vgncia',
'             and n.id_prdo = t.id_prdo',
'             and n.id_orgen = t.id_orgen)',
'     and not exists (select 1',
'            from gf_g_titulos_jdcial_vgncia_temp o',
'           where o.id_sjto_impsto = t.id_sjto_impsto',
'             and o.vgncia = t.vgncia',
'             and o.id_prdo = t.id_prdo',
'             and o.id_orgen = t.id_orgen)',
'   order by t.id_sjto_impsto, t.vgncia , t.prdo)',
'select * from carteras',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18023780869459901)
,p_name=>'ROWNUM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWNUM'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
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
 p_id=>wwv_flow_api.id(18023849237459902)
,p_name=>'NMRO_PRCSO_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_PRCSO_JRDCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
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
 p_id=>wwv_flow_api.id(18024505064459909)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>330
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
 p_id=>wwv_flow_api.id(18024615153459910)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>340
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
 p_id=>wwv_flow_api.id(18025234049459916)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>350
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(20984592382993901)
,p_name=>'ID_SJTO_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_RSPNSBLE'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(21196447047993101)
,p_name=>'VLOR_SLDO_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Saldo<br> Inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(21410272997005804)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor<br> Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(21801498781565607)
,p_name=>'VLOR_DSCNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor<br> Descuento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
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
 p_id=>wwv_flow_api.id(37407367398054839)
,p_name=>'CNSCTVO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNSCTVO_EMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'No. Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(37407444731054840)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(37407594554054842)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(37408088882054847)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(37408202784054848)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(37408383347054850)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(37408552444054851)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(37408869834054854)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(37408903015054855)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo<br> Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(37407169623054837)
,p_internal_uid=>37407169623054837
,p_is_editable=>false
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
 p_id=>wwv_flow_api.id(37412139983057524)
,p_interactive_grid_id=>wwv_flow_api.id(37407169623054837)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(37412257455057525)
,p_report_id=>wwv_flow_api.id(37412139983057524)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18029700356460107)
,p_view_id=>wwv_flow_api.id(37412257455057525)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(18023780869459901)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18030213692460111)
,p_view_id=>wwv_flow_api.id(37412257455057525)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(18023849237459902)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18033678832460122)
,p_view_id=>wwv_flow_api.id(37412257455057525)
,p_display_seq=>28
,p_column_id=>wwv_flow_api.id(18024505064459909)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18034149862460123)
,p_view_id=>wwv_flow_api.id(37412257455057525)
,p_display_seq=>29
,p_column_id=>wwv_flow_api.id(18024615153459910)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18040223489828071)
,p_view_id=>wwv_flow_api.id(37412257455057525)
,p_display_seq=>30
,p_column_id=>wwv_flow_api.id(18025234049459916)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20990625811994089)
,p_view_id=>wwv_flow_api.id(37412257455057525)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(20984592382993901)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21202492681993307)
,p_view_id=>wwv_flow_api.id(37412257455057525)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(21196447047993101)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>87.99000000000001
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21424966019172141)
,p_view_id=>wwv_flow_api.id(37412257455057525)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(21410272997005804)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21816663572619051)
,p_view_id=>wwv_flow_api.id(37412257455057525)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(21801498781565607)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>126.69399999999999
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37413213250057536)
,p_view_id=>wwv_flow_api.id(37412257455057525)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(37407367398054839)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105.994
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37413724997057539)
,p_view_id=>wwv_flow_api.id(37412257455057525)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(37407444731054840)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37414692189057544)
,p_view_id=>wwv_flow_api.id(37412257455057525)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(37407594554054842)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37417081112057558)
,p_view_id=>wwv_flow_api.id(37412257455057525)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(37408088882054847)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37417631731057561)
,p_view_id=>wwv_flow_api.id(37412257455057525)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(37408202784054848)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37418640605057566)
,p_view_id=>wwv_flow_api.id(37412257455057525)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(37408383347054850)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115.9826
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37419167110057568)
,p_view_id=>wwv_flow_api.id(37412257455057525)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(37408552444054851)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>71.994
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37420613881057586)
,p_view_id=>wwv_flow_api.id(37412257455057525)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(37408869834054854)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37421120304057589)
,p_view_id=>wwv_flow_api.id(37412257455057525)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(37408903015054855)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115.99700000000001
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(18792659222671131)
,p_view_id=>wwv_flow_api.id(37412257455057525)
,p_execution_seq=>5
,p_name=>'Embargo'
,p_background_color=>'#99CCFF'
,p_text_color=>'#000000'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(37407367398054839)
,p_condition_operator=>'NN'
,p_condition_is_case_sensitive=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(174125000003)
,p_view_id=>wwv_flow_api.id(37412257455057525)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(21410272997005804)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(18792658625675633)
,p_view_id=>wwv_flow_api.id(37412257455057525)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(21196447047993101)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(18792731984675634)
,p_view_id=>wwv_flow_api.id(37412257455057525)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(37408903015054855)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(70288436662113337)
,p_plug_name=>unistr('<b>T\00EDtulos Registrados</b>')
,p_region_name=>'titulos'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   a.id_ttlo_jdcial',
'        ,a.cdgo_clnte',
'        ,a.id_ttlo_jdcial_crgdo',
'        ,a.nmro_ttlo_jdcial',
'        ,a.fcha_cnsttcion',
'        ,a.vlor',
'        --,a.idntfccion_dmndnte',
'        --,a.nmbre_dmndnte',
'        ,decode(a.id_ttlo_jdcial_area,a.id_ttlo_jdcial_area, c.nmbre_area , ''-'') as id_ttlo_jdcial_area',
'        ,decode(a.cdgo_idntfccion_tpo_dmnddo, a.cdgo_idntfccion_tpo_dmnddo, b.dscrpcion_idntfccion_tpo, ''-'') as cdgo_idntfccion_tpo_dmnddo',
'        ,a.idntfccion_dmnddo',
'        ,a.nmbre_dmnddo',
'        ,a.nmro_ttlo_pdre',
'        ,a.id_ttlo_pdre',
'        ,a.cdgo_entdad_cnsgnnte||'' - ''||d.nmbre_bnco as cdgo_entdad_cnsgnnte',
'        ,a.id_bnco_cnsgnnte',
'        ,decode(a.cdgo_ttlo_jdcial_estdo, a.cdgo_ttlo_jdcial_estdo, f.dscrpcion, ''-'') as cdgo_ttlo_jdcial_estdo',
'        ,a.id_embrgo_rslcion',
'        ,a.id_instncia_fljo_pdre',
'        ,a.id_instncia_fljo',
'        ,a.id_slctud',
'        ,a.cdgo_entdad_rcddr||'' - ''||e.nmbre_bnco as cdgo_entdad_rcddr',
'        ,a.id_bnco_rcddr',
'        ,a.cnsctvo_embrgo',
'from gf_g_titulos_judicial a',
'join df_s_identificaciones_tipo b on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo_dmnddo',
'join df_c_areas c on c.id_area = a.id_ttlo_jdcial_area',
'left join df_c_bancos d on d.id_bnco = a.id_bnco_cnsgnnte',
'left join df_c_bancos e on e.id_bnco = a.id_bnco_rcddr',
'left join gf_d_titulos_judicial_estdo f on f.cdgo_ttlo_jdcial_estdo = a.cdgo_ttlo_jdcial_estdo',
'--left join mc_g_embargos_resolucion g on g.id_embrgos_rslcion = a.id_embrgo_rslcion',
'--where a.id_instncia_fljo is null',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'--and a.idntfccion_dmnddo = :P243_IDNTFCCION'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21960363970361701)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21960485492361702)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(70288574492113339)
,p_name=>'ID_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL'
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
 p_id=>wwv_flow_api.id(70288720039113340)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
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
 p_id=>wwv_flow_api.id(70288803245113341)
,p_name=>'ID_TTLO_JDCIAL_CRGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_CRGDO'
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
 p_id=>wwv_flow_api.id(70288897565113342)
,p_name=>'NMRO_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_JDCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('N\00FAmero T\00EDtulo<br>Judicial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(70289004099113343)
,p_name=>'FCHA_CNSTTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CNSTTCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Fecha<br>Constituci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(70289142070113344)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(70289387723113347)
,p_name=>'ID_TTLO_JDCIAL_AREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_AREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('\00C1rea')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(70289555404113349)
,p_name=>'IDNTFCCION_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Identificaci\00F3n<br>Demandado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(70289674313113350)
,p_name=>'NMBRE_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Nombre<br>Demandado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(70289842382113351)
,p_name=>'NMRO_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_PDRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('N\00FAmero T\00EDtulo<br>Judicial Padre')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(70289892397113352)
,p_name=>'ID_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_PDRE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(70290012084113353)
,p_name=>'CDGO_ENTDAD_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_CNSGNNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Entidad<br>Consignante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(70290111602113354)
,p_name=>'ID_BNCO_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_CNSGNNTE'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(70290238290113355)
,p_name=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Estado T\00EDtulo<br>Judicial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Consignar;CNS,Devolver;DVL,Fraccionar;FRC,Rechazar;RCH'
,p_lov_display_extra=>true
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
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(70290267186113356)
,p_name=>'ID_EMBRGO_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGO_RSLCION'
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
 p_id=>wwv_flow_api.id(70290368799113357)
,p_name=>'ID_INSTNCIA_FLJO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO_PDRE'
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
 p_id=>wwv_flow_api.id(70290533223113358)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
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
 p_id=>wwv_flow_api.id(70290601378113359)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Id Solicitud<br>PQR'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(70290723022113360)
,p_name=>'CDGO_ENTDAD_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_RCDDR'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(70290766942113361)
,p_name=>'ID_BNCO_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_RCDDR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
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
 p_id=>wwv_flow_api.id(70436416795769144)
,p_name=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Tipo<br>Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(70465445506383466)
,p_name=>'CNSCTVO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNSCTVO_EMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Consecutivo<br>Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(70288528942113338)
,p_internal_uid=>70288528942113338
,p_is_editable=>true
,p_lost_update_check_type=>'COLUMN'
,p_row_version_column=>'NMRO_TTLO_PDRE'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
end;
/
begin
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(70297598852137667)
,p_interactive_grid_id=>wwv_flow_api.id(70288528942113338)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(70297696689137669)
,p_report_id=>wwv_flow_api.id(70297598852137667)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21966351851362346)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(21960363970361701)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53591214156583920)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(70436416795769144)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70298224213137671)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(70288574492113339)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70298751742137673)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(70288720039113340)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70299169614137674)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(70288803245113341)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70299703803137676)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(70288897565113342)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70300241435137678)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(70289004099113343)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>88
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70300737775137679)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(70289142070113344)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70302192226137684)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(70289387723113347)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70303247943137687)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(70289555404113349)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70303677882137688)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(70289674313113350)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>163
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70304217578137690)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(70289842382113351)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70304716631137691)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(70289892397113352)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70305193661137693)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(70290012084113353)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70305663446137694)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(70290111602113354)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70306240401137696)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(70290238290113355)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>154
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70306681283137697)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(70290267186113356)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70307171127137699)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(70290368799113357)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70307752720137702)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(70290533223113358)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70308186110137704)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(70290601378113359)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>76
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70308753608137706)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(70290723022113360)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>131
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70309168978137708)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(70290766942113361)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70563117977286876)
,p_view_id=>wwv_flow_api.id(70297696689137669)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(70465445506383466)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(219645326027528114)
,p_plug_name=>unistr('<b>Proceso Puntual T\00EDtulo Judicial</b>')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(252247836715423303)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'Esta funcionalidad permite:<br><br>',
unistr('Proyectar la aplicaci\00F3n del T\00EDtulo Judicial.<br><br>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(626293384454600535)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(207838218689538927)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(626293384454600535)
,p_button_name=>'REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:249:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18826266271825201)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(626293384454600535)
,p_button_name=>'BTN_RGSTRA_FRCCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Registrar Fracci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:2025028:&SESSION.::&DEBUG.:RP,2025028:P2025028_ID_TTLO_JDCIAL,P2025028_FCHA_PRYCCION,P2025028_IDNTFCCION_DMNDDO,P2025028_VLOR_TTLO_FRCC_CLCLDO:&P243_ID_TTLO_JDCIAL.,&P243_FCHA_PRYCCION.,&P243_IDNTFCCION_DMNDDO.,&P243_VLOR_TTLO_FRCC_CLCLDO.'
,p_button_condition=>'P243_SLDO_DSPNBLE'
,p_button_condition2=>'0'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(208313226835700096)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(626293384454600535)
,p_button_name=>'BTN_GNRAR_ACTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Generar Acto'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>':P243_VLOR_TTLO_FRCC_CLCLDO = :P243_VLOR_TTLO_JDCIAL and :P243_ID_ACTO is null'
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18508777063213506)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(626293384454600535)
,p_button_name=>'BTN_VER_ACTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Ver Acto'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P243_ID_ACTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(208314022459706525)
,p_branch_name=>'Ir a Pagina 253 Generar Acto'
,p_branch_action=>'f?p=&APP_ID.:253:&SESSION.::&DEBUG.:RP,253:P253_PAGINA,P253_CDGO_TTLO_JDCIAL_ESTDO,P253_JSON_PAGINA,P253_ID_INSTNCIA_FLJO,P253_ID_TTLO_JDCIAL:&APP_PAGE_ID.,FRC,&P243_JSON.,&F_ID_INSTNCIA_FLJO.,&P243_ID_TTLO_JDCIAL.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(208313226835700096)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(18508923081215195)
,p_branch_name=>unistr('Ir a P\00E1gina 127 Ver Acto')
,p_branch_action=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR,P127_COLUMNA_FILENAME:v_gn_g_actos,file_blob,file_mimetype,id_acto,&P243_ID_ACTO.,file_name&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(18508777063213506)
,p_branch_sequence=>50
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P243_ID_ACTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5507593998808803)
,p_name=>'P243_SLDO_DSPNBLE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(70288436662113337)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5609689264415301)
,p_name=>'P243_SBMIT'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(70288436662113337)
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'recargar'
,p_display_when_type=>'REQUEST_EQUALS_CONDITION'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18024710113459911)
,p_name=>'P243_FCHA_PRYCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(18024880458459912)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pk_util_calendario.fnc_cl_antrior_dia_habil(p_cdgo_clnte => :F_CDGO_CLNTE,',
'                                                   p_fecha      => last_day(sysdate))',
'  from dual'))
,p_item_default_type=>'SQL_QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18390798433550166)
,p_name=>'P243_IDNTFCCION_DMNDDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(70288436662113337)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18391148751550168)
,p_name=>'P243_ID_TTLO_JDCIAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(70288436662113337)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18391535158550168)
,p_name=>'P243_JSON_TTLOS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(70288436662113337)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18391955457550168)
,p_name=>'P243_JSON_CNSGNR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(70288436662113337)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18392324540550169)
,p_name=>'P243_JSON_DVLVR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(70288436662113337)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18392768303550169)
,p_name=>'P243_JSON_FRCCNR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(70288436662113337)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18508402772211972)
,p_name=>'P243_ID_ACTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(70288436662113337)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18524223832780201)
,p_name=>'P243_JSON'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(70288436662113337)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18800654485671223)
,p_name=>'P243_VALOR_DVLCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(37406342722054829)
,p_prompt=>unistr('Valor T\00EDtulo a Devolver')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gf_g_titulos_judicial a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.cdgo_ttlo_jdcial_estdo = ''ASL''',
';'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21122353710545106)
,p_name=>'P243_VLOR_TTLO_FRCC_CLCLDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(70288436662113337)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21122582399545108)
,p_name=>'P243_VLOR_TTLO_JDCIAL'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(70288436662113337)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21801137324565604)
,p_name=>'P243_JSON_VGNCIAS_PRDO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(70288436662113337)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28679755620912501)
,p_name=>'P243_SLDO_FRCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(70288436662113337)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(21801244931565605)
,p_computation_sequence=>10
,p_computation_item=>'P243_JSON_VGNCIAS_PRDO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select    json_object(''VGNCIA_PRDO'' value',
'					 JSON_ARRAYAGG',
'						 (  json_object(''vgncia''    value vgncia,',
'									   ''prdo''       value prdo,',
'									   ''id_orgen''   value id_orgen)returning clob)returning clob',
'			 )  vgncias_prdo ',
'from (',
'	select b.vgncia, b.prdo, b.id_orgen',
'	from si_i_sujetos_responsable a',
'	join v_gf_g_cartera_x_concepto b on b.id_sjto_impsto = a.id_sjto_impsto',
'	where a.idntfccion = :P243_IDNTFCCION_DMNDDO',
'		and a.PRNCPAL_S_N = ''S''   ',
'		and b.vlor_sldo_cptal  > 0',
'		and b.cdgo_mvnt_fncro_estdo in (''NO'',''CN'')',
'   group by b.vgncia, b.prdo, b.id_orgen',
'	);       '))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(21150064462163553)
,p_computation_sequence=>40
,p_computation_item=>'P243_VLOR_TTLO_JDCIAL'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(sum(a.vlor),0) valor',
'from gf_g_titulos_judicial a',
'where a.id_ttlo_jdcial = :P243_ID_TTLO_JDCIAL',
';'))
,p_compute_when=>'P243_ID_TTLO_JDCIAL'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(21150309536164615)
,p_computation_sequence=>40
,p_computation_item=>'P243_VLOR_TTLO_FRCC_CLCLDO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(sum(b.vlor),0) valor',
'from gf_g_titulos_jdcl_frccnmnto a',
'join gf_g_titulos_jdcl_frccnmnto_dtlle b on a.id_ttlo_jdcial_frccn = b.id_ttlo_jdcial_frccn',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;'))
,p_compute_when=>'P243_ID_TTLO_JDCIAL'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(5507661884808804)
,p_computation_sequence=>50
,p_computation_item=>'P243_SLDO_DSPNBLE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.vlor - sum(a.vlor) ',
'    from gf_g_titulos_jdcl_frccnmnto a',
'    join gf_g_titulos_judicial b on b.id_ttlo_jdcial = a.id_ttlo_jdcial',
'    where a.id_ttlo_jdcial = :P243_ID_TTLO_JDCIAL',
'    group by b.vlor;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(5622597137996501)
,p_computation_sequence=>60
,p_computation_item=>'P243_ID_ACTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_acto ',
'from v_gf_g_titulos_jdcial_dcmnto a',
'join gn_d_actos_tipo b on b.id_acto_tpo = a.id_acto_tpo',
'where id_ttlo_jdcial = :P243_ID_TTLO_JDCIAL',
'and b.cdgo_acto_tpo = ''FRC'' '))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18393172432551523)
,p_name=>'Seleccionar Titulos'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(70288436662113337)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18393589330551523)
,p_event_id=>wwv_flow_api.id(18393172432551523)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buildJsonTitulos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18903113595370443)
,p_name=>'Al cerrar la modal'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18903569514370443)
,p_event_id=>wwv_flow_api.id(18903113595370443)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21122276748545105)
,p_event_id=>wwv_flow_api.id(18903113595370443)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'select nvl(sum(a.vlor),0) valor',
'into :P243_VLOR_TTLO_FRCC_CLCLDO',
'from gf_g_titulos_jdcl_frccnmnto a',
'where a.id_ttlo_jdcial = :P243_ID_TTLO_JDCIAL',
';',
''))
,p_attribute_02=>'P243_VLOR_TTLO_FRCC_CLCLDO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21122445960545107)
,p_event_id=>wwv_flow_api.id(18903113595370443)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(sum(a.vlor),0) valor',
'into :P243_VLOR_TTLO_JDCIAL',
'from gf_g_titulos_judicial a',
'where a.id_ttlo_jdcial = :P243_ID_TTLO_JDCIAL',
';'))
,p_attribute_02=>'P243_VLOR_TTLO_JDCIAL'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22064499165245405)
,p_event_id=>wwv_flow_api.id(18903113595370443)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18024902544459913)
,p_name=>'al cambiar P243_FCHA_PRYCCION'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P243_FCHA_PRYCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18025142008459915)
,p_event_id=>wwv_flow_api.id(18024902544459913)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5609886006415303)
,p_name=>'Al cargar la pagina'
,p_event_sequence=>40
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v("pRequest") === "RECARGAR"'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5609932455415304)
,p_event_id=>wwv_flow_api.id(5609886006415303)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.submit();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(208315488808721458)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Armando JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select json_object( --key ''ID_TTLO_JDCIAL_SLCTUD'' is :P243_ID_TTLO_JDCIAL_SLCTUD,',
'                        key ''ID_TTLO_JDCIAL'' is :P243_ID_TTLO_JDCIAL',
'                        )',
'      into :P243_JSON',
'      from dual;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(208313226835700096)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21960549779361703)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(70288436662113337)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('<b>T\00EDtulos Registrados</b> - Save Interactive Grid Data')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18393933571552590)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargue de Datos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     select idntfccion_dmnddo',
'            , id_ttlo_jdcial',
'        into :P243_IDNTFCCION_DMNDDO',
'            ,:P243_ID_TTLO_JDCIAL',
'       from gf_g_titulos_judicial',
'      where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'      and rownum = 1;  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18394245365553469)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Construir Json T\00EDtulos')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    for c_ttlos in (select id_ttlo_jdcial, ',
'                           ttlo_jdcial_estdo,',
'                           id_instncia_fljo ',
'                    from json_table(:P243_JSON_TTLOS, ''$[*]'' ',
'                                     columns (id_ttlo_jdcial            varchar2 path ''$.ID_TTLO_JDCIAL'',',
'                                              ttlo_jdcial_estdo    varchar2 path ''$.CDGO_TTLO_JDCIAL_ESTDO'',',
'                                              id_instncia_fljo    varchar2 path ''$.ID_INSTNCIA_FLJO''))',
'    )loop',
'            if c_ttlos.ttlo_jdcial_estdo in (''ACN'',''CNS'',''ATJ'') then',
'                select json_arrayagg(',
'                           json_object (',
'                               ''id_ttlo_jdcial'' value id_ttlo_jdcial',
'                           )',
'                       ) as json_titulos',
'                into :P243_JSON_CNSGNR',
'                from (',
'                    /*select a.id_ttlo_jdcial from gf_g_titulos_judicial a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.cdgo_ttlo_jdcial_estdo in (''ACN'', ''CNS'', ''ATJ'')*/',
'                    select id_ttlo_jdcial, ',
'                           ttlo_jdcial_estdo,',
'                           id_instncia_fljo',
'                    from json_table(:P243_JSON_TTLOS, ''$[*]'' ',
'                                     columns (id_ttlo_jdcial            varchar2 path ''$.ID_TTLO_JDCIAL'',',
'                                              ttlo_jdcial_estdo    varchar2 path ''$.CDGO_TTLO_JDCIAL_ESTDO'',',
'                                              id_instncia_fljo    varchar2 path ''$.ID_INSTNCIA_FLJO'')) a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.ttlo_jdcial_estdo in (''ACN'', ''CNS'', ''ATJ'')',
'                );',
'            elsif c_ttlos.ttlo_jdcial_estdo in (''ASL'',''SDT'',''CDT'') then',
'                select json_arrayagg(',
'                           json_object (',
'                               ''id_ttlo_jdcial'' value id_ttlo_jdcial',
'                           )',
'                       ) as json_titulos',
'                into :P243_JSON_DVLVR',
'                from (',
'                    /*select a.id_ttlo_jdcial from gf_g_titulos_judicial a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.cdgo_ttlo_jdcial_estdo in (''ASL'', ''SDT'', ''CDT'')*/',
'                    select id_ttlo_jdcial, ',
'                           ttlo_jdcial_estdo,',
'                           id_instncia_fljo',
'                    from json_table(:P243_JSON_TTLOS, ''$[*]'' ',
'                                     columns (id_ttlo_jdcial            varchar2 path ''$.ID_TTLO_JDCIAL'',',
'                                              ttlo_jdcial_estdo    varchar2 path ''$.CDGO_TTLO_JDCIAL_ESTDO'',',
'                                              id_instncia_fljo    varchar2 path ''$.ID_INSTNCIA_FLJO'')) a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.ttlo_jdcial_estdo in (''ASL'', ''SDT'', ''CDT'')',
'                );',
'            elsif c_ttlos.ttlo_jdcial_estdo = ''FRC'' then',
'                select json_arrayagg(',
'                           json_object (',
'                               ''id_ttlo_jdcial'' value id_ttlo_jdcial',
'                           )',
'                       ) as json_titulos',
'                into :P243_JSON_FRCCNR',
'                from (',
'                    /*select a.id_ttlo_jdcial from gf_g_titulos_judicial a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.cdgo_ttlo_jdcial_estdo = ''FRC''*/',
'                    ',
'                    select id_ttlo_jdcial, ',
'                           ttlo_jdcial_estdo,',
'                           id_instncia_fljo',
'                    from json_table(:P243_JSON_TTLOS, ''$[*]'' ',
'                                     columns (id_ttlo_jdcial            varchar2 path ''$.ID_TTLO_JDCIAL'',',
'                                              ttlo_jdcial_estdo    varchar2 path ''$.CDGO_TTLO_JDCIAL_ESTDO'',',
'                                              id_instncia_fljo    varchar2 path ''$.ID_INSTNCIA_FLJO'')) a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.ttlo_jdcial_estdo = ''FRC''',
'                );',
'            end if;',
'    end loop;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18508068900209503)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargue Datos Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    select b.id_acto',
'      into :P243_ID_ACTO',
'      from gf_g_titulos_jdcial_dcmnto b',
'      join gf_g_ttls_jdcl_dcmnt_asccn c on b.id_ttlo_jdcial_dcmnto = c.id_ttlo_jdcial_dcmnto',
'      join gf_g_titulos_judicial f on f.id_ttlo_jdcial = c.id_ttlo_jdcial',
'      join gn_d_actos_tipo d on d.id_acto_tpo = b.id_acto_tpo',
'      join gn_d_actos_tipo_tarea e on e.id_acto_tpo = b.id_acto_tpo',
'                                   and e.id_fljo_trea = :F_ID_FLJO_TREA ',
'     where c.id_ttlo_jdcial = :P243_ID_TTLO_JDCIAL--nvl(nvl(json_value(:P243_JSON_CNSGNR, ''$.id_ttlo_jdcial''), json_value(:P243_JSON_DVLVR, ''$.id_ttlo_jdcial'')), json_value(:P243_JSON_FRCCNR, ''$.id_ttlo_jdcial''))',
'       and f.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'       and rownum = 1;',
'exception ',
'    when others then',
'        :P243_ID_ACTO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
