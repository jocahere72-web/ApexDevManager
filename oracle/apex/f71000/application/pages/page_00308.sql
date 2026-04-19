prompt --application/pages/page_00308
begin
wwv_flow_api.create_page(
 p_id=>308
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Detalle Documento'
,p_step_title=>'Detalle Documento'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function conceptos() {',
'    ',
'    var region = apex.region(''detalle'');',
'    ',
'    if(region) {',
'        ',
'        var view = apex.region("detalle").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = model._data;',
'        ',
'        var jsonconceptos = records.map((elemento) => {',
'            return {',
'                        "id_dcmnto_dtlle" : model.getValue(elemento, "ID_DCMNTO_DTLLE"),',
'                        "id_cncpto" : model.getValue(elemento,  "ID_CNCPTO").v,',
'                        "vlor_dbe" : model.getValue(elemento, "VLOR_DBE").trim().replace(/\./g, ""),',
'                        "vlor_hber" : model.getValue(elemento,  "VLOR_HBER").trim().replace(/\./g, ""),',
'                        "id_cncpto_rlcnal" : model.getValue(elemento,  "ID_CNCPTO_RLCNAL").v,',
'                        "prcntje_dscnto" : model.getValue(elemento,  "PRCNTJE_DSCNTO"),',
'                        "ctgria_cncpto" : model.getValue(elemento,  "CTGRIA_CNCPTO").v',
'                   }; ',
'        });',
'        ',
'        window.localStorage.setItem(''jsonconceptos'', JSON.stringify(jsonconceptos));',
'        ',
'        var conceptos = JSON.parse(window.localStorage.jsonconceptos)',
'        ',
'        console.log(conceptos);',
'        ',
'    }',
'    ',
'}',
'',
'function guardar() {',
'    ',
'    apex.submit({',
'        request:"SAVE"',
'    });',
'    ',
'}',
'',
''))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LTORRES'
,p_last_upd_yyyymmddhh24miss=>'20201203145406'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98723013042446223)
,p_plug_name=>'Container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98724058196446233)
,p_plug_name=>'Documento <b>&P308_NMRO_DCMNTO_VSUAL.</b>'
,p_parent_plug_id=>wwv_flow_api.id(98723013042446223)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98724166563446234)
,p_plug_name=>'Detalle Documento'
,p_region_name=>'detalle'
,p_parent_plug_id=>wwv_flow_api.id(98724058196446233)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_dcmnto_dtlle,',
'       b.ctgria_cncpto,',
'       b.id_cncpto,',
'       a.vgncia,',
'       a.id_prdo,',
'       a.vlor_dbe,',
'       a.vlor_hber,',
'       a.id_cncpto_rlcnal,',
'       (a.prcntje_dscnto * 100 ) as prcntje_dscnto',
'from v_re_g_documentos_detalle a',
'join df_i_conceptos b on a.id_cncpto = b.id_cncpto',
'where a.id_dcmnto = :P308_ID_DCMNTO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P308_ID_DCMNTO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98724311497446236)
,p_name=>'ID_DCMNTO_DTLLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCMNTO_DTLLE'
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
 p_id=>wwv_flow_api.id(98724558062446238)
,p_name=>'ID_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion as d,',
'       a.id_cncpto as r',
'from df_i_conceptos a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_impsto = :P308_ID_IMPSTO',
'and a.ctgria_cncpto = :CTGRIA_CNCPTO;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'CTGRIA_CNCPTO'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98724749110446240)
,p_name=>'VLOR_DBE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DBE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Debe'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'formatcurrency'
,p_attribute_03=>'right'
,p_format_mask=>'FM999G999G999G999G999G999G990'
,p_item_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:0});"'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'0'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98724861284446241)
,p_name=>'VLOR_HBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_HBER'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Haber'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'formatcurrency'
,p_attribute_03=>'right'
,p_format_mask=>'FM999G999G999G999G999G999G990'
,p_item_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:0});"'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'0'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98725001045446243)
,p_name=>'ID_CNCPTO_RLCNAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO_RLCNAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Concepto Relacional'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion as d,',
'       a.id_cncpto as r',
'from df_i_conceptos a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_impsto = :P308_ID_IMPSTO;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'CTGRIA_CNCPTO'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98777789478767713)
,p_name=>'CTGRIA_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CTGRIA_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tipo de Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  decode(ctgria_cncpto, ''C'', ''Capital'', ''I'', ''Interes'', ''Descuento'') d,',
'        ctgria_cncpto as r',
'from df_i_conceptos',
'group by ctgria_cncpto;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
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
 p_id=>wwv_flow_api.id(98779277197767728)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99074254659812203)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.vgncia as d,',
'       a.vgncia as r',
'from df_i_periodos a',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and id_impsto = :P308_ID_IMPSTO',
'and id_impsto_sbmpsto = :P308_ID_IMPSTO_SBMPSTO',
'group by a.vgncia',
'order by a.vgncia desc;'))
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
 p_id=>wwv_flow_api.id(99074362428812204)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select prdo || '' '' || dscrpcion as d,',
'       id_prdo as r',
'from df_i_periodos',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and id_impsto = :P308_ID_IMPSTO',
'and id_impsto_sbmpsto = :P308_ID_IMPSTO_SBMPSTO',
'and vgncia = :VGNCIA'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'VGNCIA'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99074599770812206)
,p_name=>'PRCNTJE_DSCNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCNTJE_DSCNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'% Descuento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(98724210329446235)
,p_internal_uid=>98724210329446235
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
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
 p_id=>wwv_flow_api.id(98762879697628559)
,p_interactive_grid_id=>wwv_flow_api.id(98724210329446235)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(98762982634628561)
,p_report_id=>wwv_flow_api.id(98762879697628559)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98763471864628565)
,p_view_id=>wwv_flow_api.id(98762982634628561)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(98724311497446236)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98764418204628573)
,p_view_id=>wwv_flow_api.id(98762982634628561)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(98724558062446238)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98765499268628576)
,p_view_id=>wwv_flow_api.id(98762982634628561)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(98724749110446240)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98765981037628578)
,p_view_id=>wwv_flow_api.id(98762982634628561)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(98724861284446241)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98766988878628581)
,p_view_id=>wwv_flow_api.id(98762982634628561)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(98725001045446243)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98809635540329499)
,p_view_id=>wwv_flow_api.id(98762982634628561)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(98777789478767713)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98866401316866348)
,p_view_id=>wwv_flow_api.id(98762982634628561)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(98779277197767728)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99094635521681880)
,p_view_id=>wwv_flow_api.id(98762982634628561)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(99074254659812203)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99095034881681905)
,p_view_id=>wwv_flow_api.id(98762982634628561)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(99074362428812204)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>182
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99102025314226159)
,p_view_id=>wwv_flow_api.id(98762982634628561)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(99074599770812206)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(377440152384342096)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(377443669448345222)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'',
'<p align="justify">',
'<i>Funcionalidad que permite editar un documento de pago</i>',
'</p>',
'',
'<p>',
'<i> 1. Ingresar todos los conceptos capitales</i> </br></br>',
'<i> 2. Ingresar los conceptos interes</i> </br></br>',
'<i> 3. Ingresar los conceptos de descuento</i>',
'</p>',
'',
'<p align="justify">',
unistr('<i>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>'),
'</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(98779935465767735)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(377440152384342096)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:304:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(98771185580651472)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(377440152384342096)
,p_button_name=>'BTN_GUARDAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98723165184446224)
,p_name=>'P308_ID_DCMNTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(98724058196446233)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98723395942446226)
,p_name=>'P308_NMRO_DCMNTO_VSUAL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(98724058196446233)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98723400595446227)
,p_name=>'P308_FCHA_DCMNTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(98724058196446233)
,p_prompt=>'Fecha Documento'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-10:+00'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98723546851446228)
,p_name=>'P308_FCHA_VNCMNTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(98724058196446233)
,p_prompt=>'Fecha Vencimiento'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P308_FCHA_DCMNTO.'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-10:+00'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98725410984446247)
,p_name=>'P308_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(98724058196446233)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto,',
'       a.id_impsto',
'from df_c_impuestos a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_impsto = nvl(:P308_ID_IMPSTO, a.id_impsto);'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98725539790446248)
,p_name=>'P308_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(98724058196446233)
,p_prompt=>'SubTributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto_sbmpsto,',
'       a.id_impsto_sbmpsto',
'from df_i_impuestos_subimpuesto a',
'where id_impsto = :P308_ID_IMPSTO;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P308_ID_IMPSTO'
,p_ajax_items_to_submit=>'P308_ID_IMPSTO,P308_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98725602629446249)
,p_name=>'P308_CDGO_DCMNTO_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(98724058196446233)
,p_item_default=>'DNO'
,p_prompt=>'Tipo Documento'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_dcmnto_tpo as r',
'from re_d_documento_tipo;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98776655903767702)
,p_name=>'P308_TPO_CRTRA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(98724058196446233)
,p_prompt=>'Tipo de Cartera'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>unistr('STATIC:Liquidaci\00F3n;LQ,Declaraci\00F3n;DL')
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'340'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98777086010767706)
,p_name=>'P308_ID_SJTO_IMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(98724058196446233)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99075188092812212)
,p_name=>'P308_NMRO_DCMNTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(98724058196446233)
,p_prompt=>unistr('N\00FAmero Documento:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_tag_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(99076307352812224)
,p_validation_name=>'Valida Impuesto'
,p_validation_sequence=>10
,p_validation=>'P308_ID_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione el tributo'
,p_validation_condition=>'SAVE'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_associated_item=>wwv_flow_api.id(98725410984446247)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(99076487665812225)
,p_validation_name=>'Valida Subtributo'
,p_validation_sequence=>20
,p_validation=>'P308_ID_IMPSTO_SBMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione el subtributo'
,p_validation_condition=>'SAVE'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_associated_item=>wwv_flow_api.id(98725539790446248)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(99076500931812226)
,p_validation_name=>'Valida Numero Documento'
,p_validation_sequence=>30
,p_validation=>'P308_NMRO_DCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Ingrese el n\00FAmero del documento')
,p_validation_condition=>'SAVE'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_associated_item=>wwv_flow_api.id(99075188092812212)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(99076625119812227)
,p_validation_name=>'Valida Tipo Documento'
,p_validation_sequence=>40
,p_validation=>'P308_CDGO_DCMNTO_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione el tipo de documento'
,p_validation_condition=>'SAVE'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_associated_item=>wwv_flow_api.id(98725602629446249)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(99076735405812228)
,p_validation_name=>'Valida Indicador Pago'
,p_validation_sequence=>50
,p_validation=>'P308_TPO_CRTRA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione el tipo de cartera'
,p_validation_condition=>'SAVE'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_associated_item=>wwv_flow_api.id(98776655903767702)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(99076885136812229)
,p_validation_name=>'Valida fecha documento'
,p_validation_sequence=>60
,p_validation=>'P308_FCHA_DCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione la fecha del documento'
,p_validation_condition=>'SAVE'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_associated_item=>wwv_flow_api.id(98723400595446227)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(99076931787812230)
,p_validation_name=>'Valida Fecha Vencimiento'
,p_validation_sequence=>70
,p_validation=>'P308_FCHA_VNCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione la fecha de vencimiento'
,p_validation_condition=>'SAVE'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_associated_item=>wwv_flow_api.id(98723546851446228)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(98777175195767707)
,p_name=>'Al Cambiar Fecha Documento'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P308_FCHA_DCMNTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(98777298530767708)
,p_event_id=>wwv_flow_api.id(98777175195767707)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P308_FCHA_VNCMNTO").datepicker( ''option'' , ''minDate'' , $("#P308_FCHA_DCMNTO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(98777301722767709)
,p_name=>'Limpia Fecha Documento'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P308_FCHA_DCMNTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(98777436749767710)
,p_event_id=>wwv_flow_api.id(98777301722767709)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P308_FCHA_DCMNTO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(98777570569767711)
,p_name=>'Limpia Fecha Documento vencimiento'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P308_FCHA_VNCMNTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(98777686708767712)
,p_event_id=>wwv_flow_api.id(98777570569767711)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P308_FCHA_VNCMNTO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(98777810236767714)
,p_name=>'Desactiva la columna dbe o hber'
,p_event_sequence=>40
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(98724166563446234)
,p_triggering_element=>'CTGRIA_CNCPTO'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'CTGRIA_CNCPTO'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'D'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(98780664087767742)
,p_event_id=>wwv_flow_api.id(98777810236767714)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'VLOR_DBE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(98777916025767715)
,p_event_id=>wwv_flow_api.id(98777810236767714)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'VLOR_HBER,PRCNTJE_DSCNTO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(98780793529767743)
,p_event_id=>wwv_flow_api.id(98777810236767714)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'VLOR_HBER,PRCNTJE_DSCNTO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(98781012677767746)
,p_name=>unistr('Guardar en sesi\00F3n')
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(98771185580651472)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(98781136774767747)
,p_event_id=>wwv_flow_api.id(98781012677767746)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(98779522126767731)
,p_name=>'Guardar'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(98771185580651472)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(98779644512767732)
,p_event_id=>wwv_flow_api.id(98779522126767731)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'guardar();',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(99074814171812209)
,p_name=>'Setear en sesion'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P308_ID_IMPSTO_SBMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(99074951868812210)
,p_event_id=>wwv_flow_api.id(99074814171812209)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98723784312446230)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cabecera Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'   select a.id_impsto,',
'          a.id_impsto_sbmpsto,',
'          a.cdgo_dcmnto_tpo,',
'          to_char(a.fcha_dcmnto, ''DD/MM/YYYY'') as fcha_dcmnto,',
'          to_char(a.fcha_vncmnto, ''DD/MM/YYYY'') as fcha_vncmnto',
'  into :P308_ID_IMPSTO,',
'       :P308_ID_IMPSTO_SBMPSTO,',
'       :P308_CDGO_DCMNTO_TPO,',
'       :P308_FCHA_DCMNTO,',
'       :P308_FCHA_VNCMNTO',
'    from v_re_g_documentos a',
'    where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_dcmnto = :P308_ID_DCMNTO;',
'',
'exception',
'    when others then',
'        :P308_NMBRE_IMPSTO_SBMPSTO := null;',
'        :P308_NMRO_DCMNTO := null;',
'        :P308_FCHA_DCMNTO := null;',
'        :P308_FCHA_VNCMNTO := null;',
'        :P308_VLOR_TTAL_DCMNTO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99075226238812213)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_dcmnto    number;',
'begin',
'',
'    --Se consulta si el documento existe',
'    begin',
'        ',
'        select id_dcmnto',
'        into v_id_dcmnto',
'        from re_g_documentos',
'        where cdgo_clnte = :F_CDGO_CLNTE',
'        and id_dcmnto = :P308_ID_DCMNTO;',
'    ',
'    exception',
'        when no_data_found then',
'            ',
'            --Se guarda el documento',
'            begin',
'                insert into re_g_documentos (cdgo_clnte,        id_impsto,              id_impsto_sbmpsto,      id_sjto_impsto, ',
'                                             nmro_dcmnto,       cdgo_dcmnto_tpo,        fcha_dcmnto,            fcha_vncmnto, ',
'                                             vlor_ttal_dbe,     vlor_ttal_hber,         vlor_ttal,              indcdor_pgo_aplcdo, ',
'                                             vlor_ttal_dcmnto,  indcdor_entrno)',
'                                      values(:F_CDGO_CLNTE,     :P308_ID_IMPSTO,        :P308_ID_IMPSTO_SBMPSTO,:P308_ID_SJTO_IMPSTO,',
'                                             :P308_NMRO_DCMNTO, :P308_CDGO_DCMNTO_TPO,  :P308_FCHA_DCMNTO,      :P308_FCHA_VNCMNTO,',
'                                                  0,                    0,                  0,                  ''N'',',
'                                                  0,            ''PRVDO'')',
'                                      returning id_dcmnto into :P308_ID_DCMNTO;',
'            exception ',
'                when others then',
'                    raise_application_error(-20001,''No se pudo registrar el documento'');',
'            end;        ',
'            ',
'    end;',
'',
'    ',
'',
'',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99074093140812201)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar json_documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_dcmnto    number;',
'    v_json_dcmnto    clob;',
'begin',
'    ',
'    --Se consulta si el documento ya se encuentra registrado',
'    begin',
'        ',
'        select a.id_dcmnto',
'        into v_id_dcmnto',
'        from re_g_documentos_traza a',
'        where a.id_dcmnto = :P308_ID_DCMNTO;',
'    ',
'    exception',
'        when no_data_found then',
'    ',
'            begin',
'',
'                select json_object (',
'                                       ''ID_DCMNTO''          VALUE  a.ID_DCMNTO,',
'                                       ''CDGO_CLNTE''         VALUE  a.CDGO_CLNTE,',
'                                       ''ID_IMPSTO''          VALUE  a.id_impsto,',
'                                       ''ID_IMPSTO_SBMPSTO''  VALUE  a.id_impsto_sbmpsto,',
'                                       ''ID_SJTO_IMPSTO''     VALUE  a.id_sjto_impsto,',
'                                       ''NMRO_DCMNTO''        VALUE  a.nmro_dcmnto,',
'                                       ''CDGO_DCMNTO_TPO''    VALUE  a.cdgo_dcmnto_tpo,',
'                                       ''ID_CNVNIO''          VALUE  a.id_cnvnio,',
'                                       ''NMRO_CTA''           VALUE  a.nmro_cta,',
'                                       ''FCHA_DCMNTO''        VALUE  a.fcha_dcmnto,',
'                                       ''FCHA_VNCMNTO''       VALUE  a.fcha_vncmnto,',
'                                       ''VLOR_TTAL_DBE''      VALUE  a.vlor_ttal_dbe,',
'                                       ''VLOR_TTAL_HBER''     VALUE  a.vlor_ttal_hber,',
'                                       ''VLOR_TTAL''          VALUE  a.vlor_ttal,',
'                                       ''INDCDOR_PGO_APLCDO'' VALUE  a.indcdor_pgo_aplcdo,',
'                                       ''VLOR_TTAL_DCMNTO''   VALUE  a.vlor_ttal_dcmnto,',
'                                       ''ID_DCMNTO_LTE''      VALUE  a.id_dcmnto_lte,',
'                                       ''INDCDOR_ENTRNO''     VALUE  a.indcdor_entrno,',
'                                       ''DRCCION''            VALUE  a.drccion,',
'                                       ''CDGO_PSTAL''         VALUE  a.cdgo_pstal,',
'                                       ''ID_RCDO_ULTMO''      VALUE  a.id_rcdo_ultmo,',
'                                       ''DCMNTO_DTLLE''       VALUE  (select json_arrayagg(',
'                                                                                            json_object ( ',
'                                                                                                             ''ID_DCMNTO_DTLLE''  value   b.ID_DCMNTO_DTLLE,',
'                                                                                                             ''ID_DCMNTO''        value   b.ID_DCMNTO,',
'                                                                                                             ''ID_MVMNTO_DTLLE''  value   b.ID_MVMNTO_DTLLE,',
'                                                                                                             ''ID_CNCPTO''        value   b.ID_CNCPTO,',
'                                                                                                             ''VLOR_DBE''         value   b.VLOR_DBE,',
'                                                                                                             ''VLOR_HBER''        value   b.VLOR_HBER,',
'                                                                                                             ''BSE_GRVBLE''       value   b.BSE_GRVBLE,',
'                                                                                                             ''TRFA''             value   b.TRFA,',
'                                                                                                             ''TXTO_TRFA''        value   b.TXTO_TRFA,',
'                                                                                                             ''CDGO_CNCPTO_TPO''  value   b.CDGO_CNCPTO_TPO,',
'                                                                                                             ''ID_DSCNTO_RGLA''   value   b.ID_DSCNTO_RGLA,',
'                                                                                                             ''ID_CNCPTO_RLCNAL'' value   b.ID_CNCPTO_RLCNAL,',
'                                                                                                             ''PRCNTJE_DSCNTO''   value   b.PRCNTJE_DSCNTO,',
'                                                                                                             ''EXPRSION_RDNDEO''  value   b.EXPRSION_RDNDEO',
'                                                                                                             returning clob',
'                                                                                                         )  ',
'                                                                                        returning clob)',
'',
'                                                                               from RE_G_DOCUMENTOS_DETALLE b',
'                                                                               where b.id_dcmnto = :P308_ID_DCMNTO',
'                                                                    )',
'                                       returning clob',
'                                   )',
'                        into v_json_dcmnto',
'                        from RE_G_DOCUMENTOS a',
'                        where a.id_dcmnto = :P308_ID_DCMNTO;',
'            exception',
'                when others then',
'                    null;',
'                    --raise_application_error(-20111,''No se pudo construir el json del documento'');',
'            end;',
'            ',
'            ',
'            begin',
'                insert into re_g_documentos_traza (cdgo_clnte,        id_dcmnto,        ',
'                                                   json_dcmnto,       json_dcmnto_mdfcdo, ',
'                                                   id_usrio)',
'                                           values( :F_CDGO_CLNTE,     :P308_ID_DCMNTO,   ',
'                                                   v_json_dcmnto,            ''{}'',        ',
'                                                   :F_ID_USRIO);',
'            exception',
'                when others then',
'                    null;',
'                    --raise_application_error(-20111,''No se pudo guardar la traza del documento'');',
'            end;',
'            ',
'    ',
'    ',
'    when others then',
'        raise_application_error(-20111,''Problema al consultar el documento'');',
'    end;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98779407385767730)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(98724166563446234)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Detalle Documento - Save Interactive Grid Data'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    ',
'    v_id_mvmnto_dtlle	re_g_documentos_detalle.id_mvmnto_dtlle%type;',
'    v_bse_grvble		re_g_documentos_detalle.bse_grvble%type;',
'    v_trfa				re_g_documentos_detalle.trfa%type;',
'    v_txto_trfa			re_g_documentos_detalle.txto_trfa%type;',
'    v_id_dscnto_rgla	re_g_documentos_detalle.id_dscnto_rgla%type;',
'',
'begin',
'',
'    case :APEX$ROW_STATUS',
'    when ''C'' then',
'    ',
'        case :CTGRIA_CNCPTO',
'        when ''C'' then',
'            ',
'            begin',
'                select id_mvmnto_dtlle',
'                into v_id_mvmnto_dtlle',
'                from v_gf_g_movimientos_detalle',
'                where cdgo_clnte = :F_CDGO_CLNTE',
'                and cdgo_mvmnto_orgn_dtlle = :P308_TPO_CRTRA',
'                and id_impsto = :P308_ID_IMPSTO',
'                and id_impsto_sbmpsto = :P308_ID_IMPSTO_SBMPSTO',
'                and id_sjto_impsto = :P308_ID_SJTO_IMPSTO',
'                and vgncia = :VGNCIA',
'                and id_prdo = :ID_PRDO',
'                and id_cncpto = :ID_CNCPTO_RLCNAL;',
'            exception',
'                when no_data_found then',
'                     raise_application_error(-20003,''No se encontro el concepto relacional en cartera'');',
'                when others then',
'                     raise_application_error(-20004,''Problema al obtener el concepto relacional en cartera'');',
'            end;',
'        else',
'        ',
'            begin',
'                select id_mvmnto_dtlle',
'                into   v_id_mvmnto_dtlle',
'                from re_g_documentos_detalle',
'                where id_dcmnto = :P308_ID_DCMNTO',
'                and id_cncpto = :ID_CNCPTO_RLCNAL',
'                and vlor_dbe > 0;',
'            exception',
'                when no_data_found then',
'                     raise_application_error(-20001,''No se encontro el concepto relacional al cual se le va aplicar el interes o el descuento en el documento'');',
'                when others then',
'                     raise_application_error(-20002,''Problema al obtener el concepto relacional al cual se le va aplicar el interes o el descuento en el documento'');',
'            end;    ',
'        ',
'        end case;',
'    ',
'        ',
'        ',
'        ',
'        ',
'        if :PRCNTJE_DSCNTO is not null then',
'            :PRCNTJE_DSCNTO := :PRCNTJE_DSCNTO/100;',
'        end if;',
'        ',
'        --Se registra en documento detalle',
'        begin',
'        ',
'            insert into re_g_documentos_detalle (id_dcmnto,                            id_mvmnto_dtlle,        id_cncpto,          vlor_dbe,          ',
'                                                 vlor_hber,                            bse_grvble,             trfa,               txto_trfa,     ',
'                                                 cdgo_cncpto_tpo,                      id_dscnto_rgla,         id_cncpto_rlcnal,   prcntje_dscnto) ',
'                                         values (:P308_ID_DCMNTO,                      v_id_mvmnto_dtlle,      :ID_CNCPTO,         trim(replace(:VLOR_DBE, ''.'', '''')),',
'                                                 trim(replace(:VLOR_HBER, ''.'', '''')),   v_bse_grvble,           v_trfa,             v_txto_trfa,',
'                                                 :CTGRIA_CNCPTO,                       v_id_dscnto_rgla,       :ID_CNCPTO_RLCNAL,  :PRCNTJE_DSCNTO);',
'        ',
'        end;',
'        ',
'    when ''U'' then',
'    ',
'        if :PRCNTJE_DSCNTO is not null then',
'            :PRCNTJE_DSCNTO := :PRCNTJE_DSCNTO/100;',
'        end if;',
'        ',
'        update re_g_documentos_detalle',
'        set id_cncpto = :ID_CNCPTO,',
'            vlor_dbe = trim(replace(:VLOR_DBE, ''.'', '''')),',
'            vlor_hber = trim(replace(:VLOR_HBER, ''.'', '''')),',
'            id_cncpto_rlcnal = :ID_CNCPTO_RLCNAL,',
'            cdgo_cncpto_tpo = :CTGRIA_CNCPTO,',
'            prcntje_dscnto = :PRCNTJE_DSCNTO',
'        where id_dcmnto_dtlle = :ID_DCMNTO_DTLLE;',
'    ',
'        ',
'    when ''D'' then',
'        ',
'        delete from re_g_documentos_detalle',
'        where id_dcmnto_dtlle = :ID_DCMNTO_DTLLE;',
'         ',
'    end case;',
'end;'))
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_exec_cond_for_each_row=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98779842976767734)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_vlor_ttal_dbe    number;',
'    v_vlor_ttal_hber   number;',
'    v_vlor_ttal        number;',
'begin',
'',
'    select nvl( sum(a.vlor_dbe), 0 ) as  vlor_ttal_dbe,',
'           nvl( sum(a.vlor_hber), 0 ) as vlor_ttal_hber,',
'           nvl( sum(a.vlor_dbe), 0 ) -  nvl( sum(a.vlor_hber), 0)  as vlor_ttal',
'    into   v_vlor_ttal_dbe,',
'           v_vlor_ttal_hber,',
'           v_vlor_ttal',
'    from re_g_documentos_detalle a',
'    where id_dcmnto = :P308_ID_DCMNTO;',
'',
'    update re_g_documentos a',
'        set a.id_impsto = :P308_ID_IMPSTO,',
'            a.id_impsto_sbmpsto = :P308_ID_IMPSTO_SBMPSTO,',
'            a.nmro_dcmnto = :P308_NMRO_DCMNTO,',
'            a.cdgo_dcmnto_tpo = :P308_CDGO_DCMNTO_TPO,',
'            a.fcha_dcmnto = :P308_FCHA_DCMNTO,',
'            a.fcha_vncmnto = :P308_FCHA_VNCMNTO,',
'            a.vlor_ttal_dbe = v_vlor_ttal_dbe,',
'            a.vlor_ttal_hber = v_vlor_ttal_hber,',
'            a.vlor_ttal = v_vlor_ttal,',
'            a.vlor_ttal_dcmnto = v_vlor_ttal',
'    where id_dcmnto = :P308_ID_DCMNTO;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99074102187812202)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar json_dcmnto_mdfcdo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json_dcmnto_mdfcdo    clob;',
'begin',
'    ',
unistr('    --Se construye un json con la informaci\00F3n del documento modificado'),
'    begin',
'    ',
'        select json_object (',
'                               ''ID_DCMNTO''          VALUE  a.ID_DCMNTO,',
'                               ''CDGO_CLNTE''         VALUE  a.CDGO_CLNTE,',
'                               ''ID_IMPSTO''          VALUE  a.id_impsto,',
'                               ''ID_IMPSTO_SBMPSTO''  VALUE  a.id_impsto_sbmpsto,',
'                               ''ID_SJTO_IMPSTO''     VALUE  a.id_sjto_impsto,',
'                               ''NMRO_DCMNTO''        VALUE  a.nmro_dcmnto,',
'                               ''CDGO_DCMNTO_TPO''    VALUE  a.cdgo_dcmnto_tpo,',
'                               ''ID_CNVNIO''          VALUE  a.id_cnvnio,',
'                               ''NMRO_CTA''           VALUE  a.nmro_cta,',
'                               ''FCHA_DCMNTO''        VALUE  a.fcha_dcmnto,',
'                               ''FCHA_VNCMNTO''       VALUE  a.fcha_vncmnto,',
'                               ''VLOR_TTAL_DBE''      VALUE  a.vlor_ttal_dbe,',
'                               ''VLOR_TTAL_HBER''     VALUE  a.vlor_ttal_hber,',
'                               ''VLOR_TTAL''          VALUE  a.vlor_ttal,',
'                               ''INDCDOR_PGO_APLCDO'' VALUE  a.indcdor_pgo_aplcdo,',
'                               ''VLOR_TTAL_DCMNTO''   VALUE  a.vlor_ttal_dcmnto,',
'                               ''ID_DCMNTO_LTE''      VALUE  a.id_dcmnto_lte,',
'                               ''INDCDOR_ENTRNO''     VALUE  a.indcdor_entrno,',
'                               ''DRCCION''            VALUE  a.drccion,',
'                               ''CDGO_PSTAL''         VALUE  a.cdgo_pstal,',
'                               ''ID_RCDO_ULTMO''      VALUE  a.id_rcdo_ultmo,',
'                               ''DCMNTO_DTLLE''       VALUE  (select json_arrayagg(',
'                                                                                    json_object ( ',
'                                                                                                     ''ID_DCMNTO_DTLLE''  value   b.ID_DCMNTO_DTLLE,',
'                                                                                                     ''ID_DCMNTO''        value   b.ID_DCMNTO,',
'                                                                                                     ''ID_MVMNTO_DTLLE''  value   b.ID_MVMNTO_DTLLE,',
'                                                                                                     ''ID_CNCPTO''        value   b.ID_CNCPTO,',
'                                                                                                     ''VLOR_DBE''         value   b.VLOR_DBE,',
'                                                                                                     ''VLOR_HBER''        value   b.VLOR_HBER,',
'                                                                                                     ''BSE_GRVBLE''       value   b.BSE_GRVBLE,',
'                                                                                                     ''TRFA''             value   b.TRFA,',
'                                                                                                     ''TXTO_TRFA''        value   b.TXTO_TRFA,',
'                                                                                                     ''CDGO_CNCPTO_TPO''  value   b.CDGO_CNCPTO_TPO,',
'                                                                                                     ''ID_DSCNTO_RGLA''   value   b.ID_DSCNTO_RGLA,',
'                                                                                                     ''ID_CNCPTO_RLCNAL'' value   b.ID_CNCPTO_RLCNAL,',
'                                                                                                     ''PRCNTJE_DSCNTO''   value   b.PRCNTJE_DSCNTO,',
'                                                                                                     ''EXPRSION_RDNDEO''  value   b.EXPRSION_RDNDEO',
'                                                                                                     returning clob',
'                                                                                                 )  ',
'                                                                                returning clob)',
'',
'                                                                       from RE_G_DOCUMENTOS_DETALLE b',
'                                                                       where b.id_dcmnto = :P308_ID_DCMNTO',
'                                                            )',
'                               returning clob',
'                           )',
'                into v_json_dcmnto_mdfcdo',
'                from RE_G_DOCUMENTOS a',
'                where a.id_dcmnto = :P308_ID_DCMNTO;',
'    exception',
'        when others then',
'            null;',
'            --raise_application_error(-20111,''No se pudo construir el json del documento'');',
'    end;',
'            ',
'    --Se actualiza la columna json_dcmnto_mdfcdo         ',
'    begin',
'        update re_g_documentos_traza a',
'        set a.json_dcmnto_mdfcdo = v_json_dcmnto_mdfcdo',
'        where a.id_dcmnto = :P308_ID_DCMNTO;',
'    exception',
'        when others then',
'            raise_application_error(-20111,''No se pudo guardar la traza del documento'');',
'    end;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
