prompt --application/pages/page_00044
begin
wwv_flow_api.create_page(
 p_id=>44
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Registro T\00EDtulo Ejecutivo')
,p_step_title=>unistr('Registro T\00EDtulo Ejecutivo')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#adicional [id^="INP"]'').each(function () {',
'    $(this).attr(''onkeypress'', ''return validarExpresion(event, "letraNumeroEspacio");'');',
'});',
'',
'$(''#adicional .datepicker '').each(function () {',
'    $(this).attr(''onkeypress'', ''return false'');',
'});'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P44_OBSRVCION {',
'    resize:none !important;',
'}'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LTORRES'
,p_last_upd_yyyymmddhh24miss=>'20191227150409'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14071105239440216)
,p_plug_name=>'Parametros'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(164079332454707690)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14072714119440232)
,p_plug_name=>'TAB-CONTAINER'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(164084128065707698)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14190407612304024)
,p_plug_name=>unistr('T\00EDtulo Ejecutivo')
,p_parent_plug_id=>wwv_flow_api.id(14072714119440232)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P44_SUB_IMPUESTO is not null and :P44_ID_SJTO_IMPSTO is not null'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14188553577304005)
,p_plug_name=>'Conceptos'
,p_region_name=>'titulosEjecutivos'
,p_parent_plug_id=>wwv_flow_api.id(14190407612304024)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_impsto_acto_cncpto, ',
'       a.id_impsto_acto, ',
'       a.id_cncpto, ',
'       b.dscrpcion,',
'       a.vgncia,',
'       c.prdo,',
'       nvl( d.vlor_cptal , 0 ) as vlor_cpital,',
'       case when a.gnra_intres_mra = ''S'' then nvl(d.vlor_intres, 0) ',
'       else 0 ',
'       end as vlor_intres,',
'       nvl2( d.id_ttlo_ejctvo_cncpto , ''U'' , ''I'' ) as action,',
'       a.gnra_intres_mra,',
'       d.id_ttlo_ejctvo_cncpto',
'from df_i_impuestos_acto_concepto    a',
'join df_i_conceptos                  b    on a.id_cncpto             = b.id_cncpto',
'join df_i_periodos                   c    on a.id_prdo               = c.id_prdo',
'left join gi_g_titulos_ejctvo_cncpto d    on a.id_impsto_acto_cncpto = d.id_impsto_acto_cncpto',
'                                          and d.id_ttlo_ejctvo       = :P44_ID_TTLO_EJCTVO',
'where a.id_impsto_acto = :P44_ACTOS',
'and not a.id_impsto_acto_cncpto in (',
'                                       select id_impsto_acto_cncpto_rlcnal ',
'                                         from df_i_impuestos_acto_concepto',
'                                        where id_impsto_acto = :P44_ACTOS ',
'                                          and id_impsto_acto_cncpto_rlcnal is not null',
'                                    )',
'and a.vgncia = pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte => :F_CDGO_CLNTE, p_cdgo_dfncion_clnte_ctgria => ''GFN'', p_cdgo_dfncion_clnte => ''VAC'') ;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14188797342304007)
,p_name=>'ID_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO'
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
 p_id=>wwv_flow_api.id(14188827761304008)
,p_name=>'ID_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO'
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
 p_id=>wwv_flow_api.id(14188999917304009)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(14189451170304014)
,p_name=>'ID_IMPSTO_ACTO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14189942762304019)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14190096056304020)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14190149058304021)
,p_name=>'VLOR_CPITAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CPITAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Capital'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM999G999G999G999G999G999G990'
,p_item_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:0});"'
,p_is_required=>false
,p_max_length=>12
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
 p_id=>wwv_flow_api.id(17492302791857108)
,p_name=>'ACTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(17492477194857109)
,p_name=>'ID_TTLO_EJCTVO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_EJCTVO_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'N'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18774122083172302)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Inter\00E9s')
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM999G999G999G999G999G999G990'
,p_item_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:0});"'
,p_is_required=>false
,p_max_length=>12
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
 p_id=>wwv_flow_api.id(18774362512172304)
,p_name=>'GNRA_INTRES_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GNRA_INTRES_MRA'
,p_data_type=>'VARCHAR2'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(14188644870304006)
,p_internal_uid=>14188644870304006
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
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
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(14198963198393885)
,p_interactive_grid_id=>wwv_flow_api.id(14188644870304006)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(14199083382393885)
,p_report_id=>wwv_flow_api.id(14198963198393885)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14199986342393887)
,p_view_id=>wwv_flow_api.id(14199083382393885)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(14188797342304007)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14200405052393889)
,p_view_id=>wwv_flow_api.id(14199083382393885)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(14188827761304008)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14200932726393890)
,p_view_id=>wwv_flow_api.id(14199083382393885)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(14188999917304009)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14208169124458934)
,p_view_id=>wwv_flow_api.id(14199083382393885)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(14189451170304014)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14214761712645267)
,p_view_id=>wwv_flow_api.id(14199083382393885)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(14189942762304019)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14215351559645269)
,p_view_id=>wwv_flow_api.id(14199083382393885)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(14190096056304020)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14215961417645270)
,p_view_id=>wwv_flow_api.id(14199083382393885)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(14190149058304021)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17810865227467205)
,p_view_id=>wwv_flow_api.id(14199083382393885)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(17492302791857108)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17837983655587690)
,p_view_id=>wwv_flow_api.id(14199083382393885)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(17492477194857109)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18780284768193831)
,p_view_id=>wwv_flow_api.id(14199083382393885)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(18774122083172302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18799192083556087)
,p_view_id=>wwv_flow_api.id(14199083382393885)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(18774362512172304)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18228031858830628)
,p_plug_name=>unistr('Informaci\00F3n Adicional')
,p_region_name=>'adicional'
,p_parent_plug_id=>wwv_flow_api.id(14190407612304024)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'htp.p(pkg_gi_titulos_ejecutivo.fnc_gn_region_metadatos(p_cdgo_clnte => :F_CDGO_CLNTE,',
'                                                        p_id_impsto => :P44_IMPUESTO,',
'                                                        p_id_impsto_sbmpsto => :P44_SUB_IMPUESTO,',
'                                                        p_id_orgen => :P44_ID_TTLO_EJCTVO));'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from df_i_impstos_sbmpsto_mtdta',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto_sbmpsto = :P44_SUB_IMPUESTO;'))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20143639796070101)
,p_plug_name=>'Sujeto Impuesto'
,p_parent_plug_id=>wwv_flow_api.id(14072714119440232)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13805809016006841)
,p_plug_name=>'Sujeto'
,p_parent_plug_id=>wwv_flow_api.id(20143639796070101)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_plug_read_only_when=>'P44_ID_TTLO_EJCTVO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19228394662043701)
,p_plug_name=>'Plugin Sujeto Tributo'
,p_parent_plug_id=>wwv_flow_api.id(20143639796070101)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'P44_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18918167156469801)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            ',
'        </b>',
'    </div>',
'</h5>',
'',
'<i>',
'Funcionalidad que permite: <br><br>',
'',
unistr('Registrar T\00EDtulos Ejecutivos y modificarlos mientras el T\00EDtulo no haya sido aplicado.<br><br>'),
'',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(53628820856128103)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18861910195494264)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(53628820856128103)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:RP,44::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14620102467262103)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(53628820856128103)
,p_button_name=>'BTN_GRDAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P44_ID_SJTO_IMPSTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14069813046440203)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(13805809016006841)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19449557585867301)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(13805809016006841)
,p_button_name=>'BTN_CNSLTA_PRMTRO'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Consulta Parametro'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=71000:3:&SESSION.::&DEBUG.:RP:P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO,P3_VLDAR_CRTRA,P3_NMBRE_ITEM_IMPSTO,P3_NMBRE_ITEM_SBIMPSTO,P3_IMPSTO_SBMPSTO:&APP_ID.,&APP_PAGE_ID.,P44_ID_SJTO_IMPSTO,&P44_IMPUESTO.,N,P44_IMPUESTO,P44_SUB_IMPUESTO,&P44_SUB_IMPUESTO.'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(18776351461172324)
,p_branch_name=>'Regresa a la pagina 66'
,p_branch_action=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:RP,44::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(14620102467262103)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13806727991006850)
,p_name=>'P44_IMPUESTO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(13805809016006841)
,p_prompt=>'Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS_X_MENU_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto || '' ['' || a.cdgo_impsto || '']''display,',
'       a.id_impsto value',
'  from v_sg_g_menu_impuesto     a',
'  join sg_g_usuarios_impuesto   b on a.id_impsto = b.id_impsto',
' where a.cdgo_clnte       = :F_CDGO_CLNTE',
'   and a.id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'   and a.id_mnu           = :F_ID_MNU',
'   and b.id_usrio         = :F_ID_USRIO',
'   and a.actvo            = ''S''',
'   and b.actvo            = ''S''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select * ',
'   from ( select count(*) a',
'            from v_sg_g_menu_impuesto     a',
'            join sg_g_usuarios_impuesto   b on a.id_impsto = b.id_impsto',
'           where a.cdgo_clnte       = :F_CDGO_CLNTE',
'             and a.id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'             and a.id_mnu           = :F_ID_MNU',
'             and b.id_usrio         = :F_ID_USRIO',
'   )',
'where a > 1;'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14069603509440201)
,p_name=>'P44_SUB_IMPUESTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(13805809016006841)
,p_prompt=>'Sub-Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P44_IMPUESTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14069788129440202)
,p_name=>'P44_IDENTIFICACION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(13805809016006841)
,p_prompt=>unistr('Identificaci\00F3n:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14071297179440217)
,p_name=>'P44_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(14071105239440216)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14190536641304025)
,p_name=>'P44_ACTOS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(14190407612304024)
,p_prompt=>'Actos'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_impsto_acto as d,',
'        a.id_impsto_acto as r',
'from df_i_impuestos_acto a',
'where a.id_impsto_sbmpsto = :P44_SUB_IMPUESTO',
'and a.actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_cSize=>100
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14190881371304028)
,p_name=>'P44_SECRETARIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(14190407612304024)
,p_prompt=>'Origen'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_area as d,',
'       a.id_area    as r',
'from df_c_areas a',
'where a.cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14656212303748101)
,p_name=>'P44_NMRO_TTLO_EJCTVO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(14190407612304024)
,p_prompt=>unistr('# T\00EDtulo Ejecutivo')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15759720251564103)
,p_name=>'P44_ID_TTLO_EJCTVO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(14071105239440216)
,p_prompt=>'Nuevo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17119915168243101)
,p_name=>'P44_FCHA_TTLO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(14190407612304024)
,p_item_default=>'nvl(:P44_FCHA_TTLO,sysdate)'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>unistr('Fecha T\00EDtulo Ejecutivo')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-04:+00'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17120083302243102)
,p_name=>'P44_N_GUIA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(14190407612304024)
,p_prompt=>unistr('No. Gu\00EDa')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17120100942243103)
,p_name=>'P44_FCHA_NTFCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(14190407612304024)
,p_item_default=>'nvl(:P44_FCHA_NTFCCION,SYSDATE)'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>unistr('Fecha Notificaci\00F3n')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P44_FCHA_TTLO.'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-04:+00'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17120288467243104)
,p_name=>'P44_MDIO_NTFCCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(14190407612304024)
,p_prompt=>unistr('Medio Notificaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select m.dscrpcion as d,',
'       m.id_mdio as r',
'from nt_d_medio m;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'250'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17491762548857102)
,p_name=>'P44_FILE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(14190407612304024)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Archivo'
,p_source=>'FILE_BLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
,p_attribute_02=>'FILE_MIMETYPE'
,p_attribute_03=>'FILE_NAME'
,p_attribute_06=>'Y'
,p_attribute_07=>'&P44_FILE_NAME.'
,p_attribute_08=>'attachment'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17492718567857112)
,p_name=>'P44_ID_DCMNTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(14071105239440216)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18600138534000901)
,p_name=>'P44_JSON'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(14071105239440216)
,p_prompt=>'json'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19449677032867302)
,p_name=>'P44_FCHA_VNCMNTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(14190407612304024)
,p_item_default=>'nvl(:P44_FCHA_VNCMNTO,SYSDATE)'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Vencimiento'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P44_FCHA_TTLO.'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-04:+00'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33020148971798403)
,p_name=>'P44_OBSRVCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(14190407612304024)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>1000
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39741447703654402)
,p_name=>'P44_FILE_NAME'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(14190407612304024)
,p_use_cache_before_default=>'NO'
,p_source=>'FILE_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(45684547642248802)
,p_computation_sequence=>10
,p_computation_item=>'P44_IMPUESTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_impsto',
' from v_sg_g_menu_impuesto     a',
'  join sg_g_usuarios_impuesto   b on a.id_impsto = b.id_impsto',
' where a.cdgo_clnte       = :F_CDGO_CLNTE',
'   and a.id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'   and a.id_mnu           = :F_ID_MNU',
'   and b.id_usrio         = :F_ID_USRIO'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(14073717027440242)
,p_validation_name=>'Valida identificacion al consultar'
,p_validation_sequence=>10
,p_validation=>'P44_IDENTIFICACION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo #LABEL# esta vac\00EDo, por favor verifique.')
,p_when_button_pressed=>wwv_flow_api.id(14069813046440203)
,p_associated_item=>wwv_flow_api.id(14069788129440202)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(18775129340172312)
,p_validation_name=>'Valida campo fecha titulo ejecutivo'
,p_validation_sequence=>20
,p_validation=>'P44_FCHA_TTLO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'SAVE'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_associated_item=>wwv_flow_api.id(17119915168243101)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(18775496013172315)
,p_validation_name=>'Validar campo vacio'
,p_validation_sequence=>30
,p_validation=>'P44_N_GUIA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'SAVE'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_associated_item=>wwv_flow_api.id(17120083302243102)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(18775572954172316)
,p_validation_name=>'Valida campo numero titulo ejecutivo'
,p_validation_sequence=>40
,p_validation=>'P44_NMRO_TTLO_EJCTVO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'SAVE'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_associated_item=>wwv_flow_api.id(14656212303748101)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(18775616846172317)
,p_validation_name=>'Valida campo secretaria'
,p_validation_sequence=>50
,p_validation=>'P44_SECRETARIA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'SAVE'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_associated_item=>wwv_flow_api.id(14190881371304028)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(18775750485172318)
,p_validation_name=>'Valida campo actos'
,p_validation_sequence=>60
,p_validation=>'P44_ACTOS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'SAVE'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_associated_item=>wwv_flow_api.id(14190536641304025)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(18775859679172319)
,p_validation_name=>unistr('Valida campo fecha notificaci\00F3n')
,p_validation_sequence=>70
,p_validation=>'P44_FCHA_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'SAVE'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_associated_item=>wwv_flow_api.id(17120100942243103)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(18775957016172320)
,p_validation_name=>unistr('Valida campo medio notificaci\00F3n')
,p_validation_sequence=>80
,p_validation=>'P44_MDIO_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'SAVE'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_associated_item=>wwv_flow_api.id(17120288467243104)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(18776085163172321)
,p_validation_name=>'Valida campo file'
,p_validation_sequence=>90
,p_validation=>'P44_FILE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(17491762548857102)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(18776185493172322)
,p_validation_name=>'Valida campo impuesto'
,p_validation_sequence=>100
,p_validation=>'P44_IMPUESTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(14069813046440203)
,p_associated_item=>wwv_flow_api.id(13806727991006850)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(18776211170172323)
,p_validation_name=>'Valida campo subimpuesto'
,p_validation_sequence=>110
,p_validation=>'P44_SUB_IMPUESTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(14069813046440203)
,p_associated_item=>wwv_flow_api.id(14069603509440201)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(21280990664360101)
,p_validation_name=>'Valida campo fecha vencimiento'
,p_validation_sequence=>120
,p_validation=>'P44_FCHA_VNCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'SAVE'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_associated_item=>wwv_flow_api.id(19449677032867302)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14073021166440235)
,p_name=>'Al cambiar sub-impuesto'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P44_SUB_IMPUESTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14073628006440241)
,p_event_id=>wwv_flow_api.id(14073021166440235)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($v(''P44_SUB_IMPUESTO'')){',
'    apex.submit();  ',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14074026583440245)
,p_name=>'Al cambiar impuesto'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P44_IMPUESTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14074181950440246)
,p_event_id=>wwv_flow_api.id(14074026583440245)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($v(''P44_ID_SJTO_IMPSTO'')){',
'    $s(''P44_ID_SJTO_IMPSTO'', '''')',
'    apex.submit();  ',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14190693331304026)
,p_name=>'Al seleccionar Acto'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P44_ACTOS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14190710687304027)
,p_event_id=>wwv_flow_api.id(14190693331304026)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14619944200262101)
,p_name=>'Al seleccionar el concepto'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(14188553577304005)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14620040701262102)
,p_event_id=>wwv_flow_api.id(14619944200262101)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buildJsonTitulosEjecutivos(){',
'    var region = apex.region(''titulosEjecutivos'');',
'    ',
'    if(region){',
'        var view = apex.region(''titulosEjecutivos'').widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        var json = records.map(function(record){',
'            return {"ID_IMPSTO_ACTO_CNCPTO": model.getValue(record, "ID_IMPSTO_ACTO_CNCPTO"),',
'                    "VLOR_CPITAL" : model.getValue(record, "VLOR_CPITAL")};',
'        });',
'        ',
'        window.localStorage.setItem(''jsonTitulosEjecutivos'', JSON.stringify(json));',
'    }',
'}',
'',
'buildJsonTitulosEjecutivos();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18228169233830629)
,p_name=>'Metadatos'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(14620102467262103)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18228297843830630)
,p_event_id=>wwv_flow_api.id(18228169233830629)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function metadatos(){',
'',
'    var errors = [];',
'    apex.message.clearErrors();',
'    $(''.t-Form-error'').remove();',
'    ',
'    if (errors.length === 0) {',
'        $(''#adicional [required]'').each(function () {',
'            var id = $(this).attr(''id'');',
'            ',
'            if (!$v(id)) {',
'                errors.push({',
'                    type: "error",',
'                    location: ["page", "inline"],',
'                    pageItem: id,',
unistr('                    message:$(''[for="''+id+''"]'').text() + " debe tener alg\00FAn valor."'),
'                });',
'            };',
'        });',
'    }',
'    ',
'    if (errors.length > 0) {',
'        apex.message.showErrors(errors);',
'    }else{',
'        ',
'        var json = [];',
'        ',
'        $(''[id*="INP"]'').each(function(){',
'            var id = $(this).attr(''id'');',
'            var valor = $v(id);',
'            ',
'            if(valor){',
'                json.push({''key'': id, ''value'':valor});',
'            }',
'        });',
'        ',
'        apex.submit({',
'            request:"SAVE",',
'            set:{"P44_JSON":JSON.stringify(json)}',
'        });',
'    }',
'}',
'metadatos();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18774620670172307)
,p_name=>'Desactiva la columna vlor_intres'
,p_event_sequence=>70
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(14188553577304005)
,p_triggering_element=>'GNRA_INTRES_MRA'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'GNRA_INTRES_MRA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18774750171172308)
,p_event_id=>wwv_flow_api.id(18774620670172307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'VLOR_INTRES'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18776875520172329)
,p_name=>unistr('Desactiva la identificaci\00F3n ')
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P44_IDENTIFICACION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P44_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18776994617172330)
,p_event_id=>wwv_flow_api.id(18776875520172329)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P44_IDNTFCCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18777088338172331)
,p_name=>unistr('Desactiva el bot\00F3n consultar')
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(14069813046440203)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P44_ID_TTLO_EJCTVO'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18777189452172332)
,p_event_id=>wwv_flow_api.id(18777088338172331)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(14069813046440203)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21240233014046701)
,p_name=>unistr('Desactiva el bot\00F3n consultar parametro')
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(19449557585867301)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P44_ID_TTLO_EJCTVO'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21240384086046702)
,p_event_id=>wwv_flow_api.id(21240233014046701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(19449557585867301)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(33019973723798401)
,p_name=>'Al cambiar la fecha'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P44_FCHA_TTLO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33020039822798402)
,p_event_id=>wwv_flow_api.id(33019973723798401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P44_FCHA_NTFCCION").datepicker( ''option'' , ''minDate'' , $("#P44_FCHA_TTLO").val());',
'$("#P44_FCHA_VNCMNTO").datepicker( ''option'' , ''minDate'' , $("#P44_FCHA_TTLO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(15759852069564104)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar Informaci\00F3n T\00EDtulo Ejecutivo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_ttlo_ejctvo,',
'       a.id_area,',
'       b.id_impsto,',
'       b.id_impsto_sbmpsto,',
'       a.id_impsto_acto,',
'       c.idntfccion_sjto,',
'       a.fcha_cnsttcion,',
'       a.fcha_ntfccion,',
'       a.fcha_vncmnto,',
'       a.nmro_guia,',
'       a.mdio_ntfccion,',
'       a.id_dcmnto,',
'       a.obsrvcion',
'into   :P44_NMRO_TTLO_EJCTVO,',
'       :P44_SECRETARIA,',
'       :P44_IMPUESTO,',
'       :P44_SUB_IMPUESTO,',
'       :P44_ACTOS,',
'       :P44_IDENTIFICACION,',
'       :P44_FCHA_TTLO,',
'       :P44_FCHA_NTFCCION,',
'       :P44_FCHA_VNCMNTO,',
'       :P44_N_GUIA,',
'       :P44_MDIO_NTFCCION,',
'       :P44_ID_DCMNTO,',
'       :P44_OBSRVCION',
'from gi_g_titulos_ejecutivo a ',
'join df_i_impuestos_acto    b on a.id_impsto_acto = b.id_impsto_acto',
'join v_si_i_sujetos_impuesto c on a.id_sjto_impsto = c.id_sjto_impsto',
'where a.id_ttlo_ejctvo = :P44_ID_TTLO_EJCTVO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P44_ID_TTLO_EJCTVO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21364484934655101)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta Sujeto_Impuesto por  BTN_CNSLTA_PRMTRO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select a.idntfccion_sjto,',
'    id_impsto',
'    --( select min( b.id_impsto_sbmpsto) from df_i_impuestos_subimpuesto b where b.id_impsto = a.id_impsto ) as id_impsto_sbmpsto',
'    into  :P44_IDENTIFICACION,',
'          :P44_IMPUESTO',
'          --:P44_SUB_IMPUESTO',
'    from v_si_i_sujetos_impuesto a',
'     where a.cdgo_clnte      = :F_CDGO_CLNTE',
'       and a.id_sjto_impsto  = :P44_ID_SJTO_IMPSTO;',
'',
'exception ',
'    when no_data_found then ',
'        apex_util.set_session_state(''P44_IDENTIFICACION'',  '''');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(19449557585867301)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39741384117654401)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Cargar Archivo'
,p_attribute_02=>'GD_G_DOCUMENTOS'
,p_attribute_03=>'P44_ID_DCMNTO'
,p_attribute_04=>'ID_DCMNTO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P44_ID_TTLO_EJCTVO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14070945810440214)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Obtener Sujeto Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'begin',
'',
'    begin',
'        select a.id_sjto_impsto',
'        into :P44_ID_SJTO_IMPSTO',
'        from v_si_i_sujetos_impuesto a',
'        where a.idntfccion_sjto = :P44_IDENTIFICACION',
'        and   a.id_impsto = :P44_IMPUESTO',
'        and   a.cdgo_clnte = :F_CDGO_CLNTE;',
'        ',
'    exception ',
'        when no_data_found then',
'            :P44_ID_SJTO_IMPSTO := null;',
'    end;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(14069813046440203)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16102773393710603)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Guardar T\00EDtulo Ejecutivo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cncpto           clob;',
'    v_cdgo_rspsta      number;',
'    v_id_ttlo_ejctvo   number;',
'    v_mnsje_rspsta     varchar(300);',
'    v_blob             blob;',
'    r_temp_files apex_application_files%rowtype;',
'begin',
'    ',
'    begin',
'        select *',
'          into r_temp_files',
'          from apex_application_files',
'         where name = :P44_FILE;',
'    exception ',
'        when no_data_found then',
'            v_blob := null;  ',
'    end;',
'    ',
'        pkg_gi_titulos_ejecutivo.prc_rg_titulos_ejecutivo(p_cdgo_clnte			    =>	:F_CDGO_CLNTE,',
'                                                          p_id_usrio        	    =>  :F_ID_USRIO,',
'                                                          p_nmro_ttlo_ejctvo	    =>  :P44_NMRO_TTLO_EJCTVO,',
'                                                          p_id_area         	    =>  :P44_SECRETARIA,',
'                                                          p_id_impsto_acto  	    =>  :P44_ACTOS,',
'                                                          p_id_impsto               =>  :P44_IMPUESTO,',
'                                                          p_id_impsto_sbmpsto       =>  :P44_SUB_IMPUESTO,',
'                                                          p_id_sjto_impsto  	    =>  :P44_ID_SJTO_IMPSTO,',
'                                                          p_nmro_ntfccion           =>  :P44_N_GUIA,',
'                                                          p_mdio_ntfccion           =>  :P44_MDIO_NTFCCION,',
'                                                          p_obsrvcion               =>  :P44_OBSRVCION,',
'                                                          p_fcha_cnsttcion          =>  :P44_FCHA_TTLO,',
'                                                          p_fcha_ntfccion           =>  :P44_FCHA_NTFCCION,',
'                                                          p_fcha_vncmnto            =>  :P44_FCHA_VNCMNTO,',
'                                                          p_file_blob     			=>  r_temp_files.blob_content,',
'                                                          p_file_name               =>  r_temp_files.filename,',
'                                                          p_file_mimetype           =>  r_temp_files.mime_type,',
'                                                          p_id_dcmnto               =>  :P44_ID_DCMNTO,',
'                                                          p_json_mtdta              =>  :P44_JSON,',
'                                                          o_id_ttlo_ejctvo     	    =>  :P44_ID_TTLO_EJCTVO,',
'                                                          o_cdgo_rspsta     	    =>   v_cdgo_rspsta,',
'                                                          o_mnsje_rspsta    	    =>   v_mnsje_rspsta);',
'   ',
'    ',
'    if(v_cdgo_rspsta != 0)then',
'           raise_application_error(-20000, v_mnsje_rspsta);',
'    end if;',
'    ',
'    ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>unistr('Operaci\00F3n realizada con \00E9xito')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(17492297643857107)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(14188553577304005)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Guarda los conceptos'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'   case :APEX$ROW_STATUS',
'    when ''U'' then',
'        if :ACTION = ''I'' then',
'            begin',
'                insert into gi_g_titulos_ejctvo_cncpto(id_ttlo_ejctvo, id_impsto_acto_cncpto, vlor_cptal, vlor_intres)',
'                                               values (:P44_ID_TTLO_EJCTVO, :ID_IMPSTO_ACTO_CNCPTO, trim(replace(:VLOR_CPITAL, ''.'', '''')), trim(replace(nvl( :VLOR_INTRES , 0 ), ''.'', '''')) );',
'            exception',
'                when others then',
'                    raise_application_error(-20007, ''No se pudo guardar los conceptos'');',
'            end;',
'        else',
'            begin',
'                update gi_g_titulos_ejctvo_cncpto ',
'                set vlor_cptal = trim(replace(:VLOR_CPITAL, ''.'', '''')),',
'                    vlor_intres = trim(replace(nvl( :VLOR_INTRES , 0 ), ''.'', ''''))',
'                where id_ttlo_ejctvo_cncpto = :ID_TTLO_EJCTVO_CNCPTO;',
'            exception',
'                when others then',
'                    raise_application_error(-20003, ''No se pudo actualizar los conceptos'');',
'            end;',
'        end if;',
'',
'    end case;',
'    ',
'end;'))
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_exec_cond_for_each_row=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(49587895610764801)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Valida Concepto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_cncptos    number;',
'',
'begin',
'',
'    select count(a.id_impsto_acto_cncpto) ',
'    into v_cncptos',
'    from gi_g_titulos_ejctvo_cncpto a',
'    where a.id_ttlo_ejctvo = (select b.id_ttlo_ejctvo from gi_g_titulos_ejecutivo b where b.nmro_ttlo_ejctvo = :P44_NMRO_TTLO_EJCTVO);',
'    ',
'    if v_cncptos = 0 then',
'        rollback;',
unistr('        raise_application_error(-20000, ''Sr(a). '' || :F_NMBRE_USRIO || '' por favor ingrese el valor saldo capital y el valor inter\00E9s a los conceptos'');'),
'    end if;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
