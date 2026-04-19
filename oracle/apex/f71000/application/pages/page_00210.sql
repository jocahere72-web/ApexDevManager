prompt --application/pages/page_00210
begin
wwv_flow_api.create_page(
 p_id=>210
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Devoluci\00F3n Saldo a Favor')
,p_step_title=>unistr('Devoluci\00F3n Saldo a Favor')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function capturarSaldoFavor(){',
'    var region = apex.region("safd");',
'    if (region) {',
'',
'        var view = apex.region("safd").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        //Obtenemos un json con los datos seleccionados que no han sido procesados',
'        var json = records.map(function (record) {',
'                                                    return { "ID_SLDO_FVOR": model.getValue(record, "ID_SLDO_FVOR").trim(),',
'                                                             "SALDO_FAVOR": model.getValue(record, "SALDO_FAVOR").trim(),',
'                                                             "ID_SJTO_IMPSTO": model.getValue(record, "ID_SJTO_IMPSTO").trim(),',
'                                                             "ID_IMPSTO": model.getValue(record, "ID_IMPSTO").trim(),',
'                                                             "ID_IMPSTO_SBMPSTO": model.getValue(record, "ID_IMPSTO_SBMPSTO").trim(),',
'                                 ',
'                                                             };',
'                                                 }); ',
'',
'        //Habilitamos o deshabilitamos el botom dependiendo si hay mas de un registro seleccionado',
'        if (json.length > 0 ){',
'            $("#Btn_Guardar").show();',
'        }else {',
'            $("#Btn_Guardar").hide();',
'        }',
'',
'        //Seteamos el valor del json en forma de cadena al item ',
'        $s(''P210_JSON_DEVOLUCION'', json.length > 0 ? JSON.stringify(json) : '''');',
'        ',
'        apex.region("safd").widget().interactiveGrid("setSelectedRecords", records);  ',
'',
'    };',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer{',
'    display: none;   ',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LTORRES'
,p_last_upd_yyyymmddhh24miss=>'20200226141812'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108507571901451608)
,p_plug_name=>unistr('Devoluci\00F3n detalle')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_sldo_fvor,',
'       b.id_sldos_fvr_dvlcion_dtll,',
'       a.nmbre_impsto,',
'       b.vlor_dvlcion,',
'       d.nmbre_bnco,',
'       c.nmro_cnta,',
'       f.idntfccion_sjto_frmtda',
'from v_gf_g_saldos_favor a',
'join gf_g_sldos_fvr_dvlcion_dtll  b on a.id_sldo_fvor         = b.id_sldo_fvor',
'join gf_g_saldos_favor_devlucion  c on b.id_sldo_fvor_dvlcion = c.id_sldo_fvor_dvlcion',
'join df_c_bancos                  d on c.id_bnco              = d.id_bnco',
'join v_si_i_sujetos_impuesto      f on a.id_sjto_impsto       = f.id_sjto_impsto',
'where c.id_sldo_fvor_slctud =    :P210_ID_SLDO_FVOR_SLCTUD;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62073473612169001)
,p_name=>'ID_SLDO_FVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLDO_FVOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'# Saldo a Favor'
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
 p_id=>wwv_flow_api.id(108508465653451617)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>200
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108508627461451619)
,p_name=>'NMBRE_BNCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_BNCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Banco'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(108508873759451621)
,p_name=>'BTN_Eliminar'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>unistr('Acci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">  ',
'        <span class="fa fa-trash-o" aria-hidden="true"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:210:&SESSION.:Eliminar:&DEBUG.:RP:P210_ID_SLDOS_FVR_DVLCION_DTLL:&ID_SLDOS_FVR_DVLCION_DTLL.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108634752803354101)
,p_name=>'ID_SLDOS_FVR_DVLCION_DTLL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLDOS_FVR_DVLCION_DTLL'
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
 p_id=>wwv_flow_api.id(112848252452274401)
,p_name=>'VLOR_DVLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DVLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor de la Devoluci\00F3n')
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(119915393303492901)
,p_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO_FRMTDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(119915558037492903)
,p_name=>'NMRO_CNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'# Cuenta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(108507647633451609)
,p_internal_uid=>108507647633451609
,p_is_editable=>false
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
 p_id=>wwv_flow_api.id(108567050684971332)
,p_interactive_grid_id=>wwv_flow_api.id(108507647633451609)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(108567178604971332)
,p_report_id=>wwv_flow_api.id(108567050684971332)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62079412325170236)
,p_view_id=>wwv_flow_api.id(108567178604971332)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(62073473612169001)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>106
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108573378722042409)
,p_view_id=>wwv_flow_api.id(108567178604971332)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(108508465653451617)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>199
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108574306488042412)
,p_view_id=>wwv_flow_api.id(108567178604971332)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(108508627461451619)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>140
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108581395655057058)
,p_view_id=>wwv_flow_api.id(108567178604971332)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(108508873759451621)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>64
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108640750756354535)
,p_view_id=>wwv_flow_api.id(108567178604971332)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(108634752803354101)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(112854204584274555)
,p_view_id=>wwv_flow_api.id(108567178604971332)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(112848252452274401)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119921349755493207)
,p_view_id=>wwv_flow_api.id(108567178604971332)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(119915393303492901)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>265
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119929478115538883)
,p_view_id=>wwv_flow_api.id(108567178604971332)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(119915558037492903)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(210268867587373682)
,p_plug_name=>'Parametros'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(210680628753635043)
,p_plug_name=>unistr('Datos de la Devoluci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(216726500993523273)
,p_plug_name=>'Saldos a Favor'
,p_region_name=>'safd'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_sldo_fvor,',
'       a.sldo_fvor_dspnble as saldo_favor,',
'       a.sldo_fvor_dspnble as saldo_favor_visible,',
'	   a.obsrvcion,',
'       a.nmbre_impsto,',
'       a.nmbre_sldo_fvor_tpo,',
'       a.id_impsto,',
'       a.id_impsto_sbmpsto,',
'       a.id_sjto_impsto',
'from v_gf_g_saldos_favor    a',
'where a.id_sjto_impsto =  :P210_SJTO_IMPSTO   ',
'and a.indcdor_rcncdo = ''S''',
'and a.sldo_fvor_dspnble > 0',
'union',
'select a.id_sldo_fvor,',
'       a.sldo_fvor_dspnble as saldo_favor,',
'       a.sldo_fvor_dspnble as saldo_favor_visible,',
'	   a.obsrvcion,',
'       a.nmbre_impsto,',
'       a.nmbre_sldo_fvor_tpo,',
'       a.id_impsto,',
'       a.id_impsto_sbmpsto,',
'       a.id_sjto_impsto ',
'from v_gf_g_saldos_favor            a  ',
'join gf_g_sldos_fvor_slctud_dtll    b   on  a.id_sldo_fvor          =   b.id_sldo_fvor',
'join gf_g_saldos_favor_solicitud    c   on  b.id_sldo_fvor_slctud   =   c.id_sldo_fvor_slctud',
'where c.id_sldo_fvor_slctud = :P210_ID_SLDO_FVOR_SLCTUD',
'and   b.indcdor_rcncdo = ''S''',
'and   a.sldo_fvor_dspnble > 0;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108507059770451603)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(108507140494451604)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(108507201971451605)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
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
 p_id=>wwv_flow_api.id(108507485929451607)
,p_name=>'SALDO_FAVOR_VISIBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SALDO_FAVOR_VISIBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Saldo a Favor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(216727157180523279)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(216727212756523280)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(216728349014523291)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>2000
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(216728483299523292)
,p_name=>'ID_SLDO_FVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLDO_FVOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'# Saldo a Favor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(216728588634523293)
,p_name=>'SALDO_FAVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SALDO_FAVOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(216728672764523294)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>200
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
 p_id=>wwv_flow_api.id(216728766628523295)
,p_name=>'NMBRE_SLDO_FVOR_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SLDO_FVOR_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo de Saldo a Favor'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(216726613214523274)
,p_internal_uid=>216726613214523274
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
 p_id=>wwv_flow_api.id(216732907841527656)
,p_interactive_grid_id=>wwv_flow_api.id(216726613214523274)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(216733060777527657)
,p_report_id=>wwv_flow_api.id(216732907841527656)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108537139953742490)
,p_view_id=>wwv_flow_api.id(216733060777527657)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(108507059770451603)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108537661056742493)
,p_view_id=>wwv_flow_api.id(216733060777527657)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(108507140494451604)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108538154772742495)
,p_view_id=>wwv_flow_api.id(216733060777527657)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(108507201971451605)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108545142916848393)
,p_view_id=>wwv_flow_api.id(216733060777527657)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(108507485929451607)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>163
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(216738384064550845)
,p_view_id=>wwv_flow_api.id(216733060777527657)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(216727157180523279)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(216749989610766940)
,p_view_id=>wwv_flow_api.id(216733060777527657)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(216728349014523291)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>341
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(216752602130769207)
,p_view_id=>wwv_flow_api.id(216733060777527657)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(216728483299523292)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(216753180787769209)
,p_view_id=>wwv_flow_api.id(216733060777527657)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(216728588634523293)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>297
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(216753649522769210)
,p_view_id=>wwv_flow_api.id(216733060777527657)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(216728672764523294)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>233
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(216754099035769212)
,p_view_id=>wwv_flow_api.id(216733060777527657)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(216728766628523295)
,p_is_visible=>false
,p_is_frozen=>false
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(305937262051684988)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from WF_G_INSTANCIAS_TRANSICION',
'where ID_INSTNCIA_FLJO = :F_ID_INSTNCIA_FLJO and',
'      ID_FLJO_TREA_ORGEN = :F_ID_FLJO_TREA and',
'      ID_ESTDO_TRNSCION in (1,2);'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(486660122010025949)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
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
'Funcionalidad que permite: <br><br>',
'',
'Visualizar los saldos a favor reconocidos en la solicitud.<br><br>',
unistr('Registrar la devoluci\00F3n del Saldo a Favor.<br><br>'),
unistr('Eliminar la devoluci\00F3n del Saldo a Favor.<br><br>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(107233312186172025)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(305937262051684988)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:201:&SESSION.::&DEBUG.:RP,201::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(107233789886172026)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(305937262051684988)
,p_button_name=>'Btn_Guardar'
,p_button_static_id=>'Btn_Guardar'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de realizar la devoluciÃ³n?'',''Btn_Guardar'');'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * ',
'from (',
'select a.id_sldo_fvor,',
'	   a.vlor_sldo_fvor - (sum(nvl(d.vlor_cmpnscion,0))+sum(nvl(e.vlor_dvlcion,0))) saldo_favor,',
'       a.vlor_sldo_fvor - (sum(nvl(d.vlor_cmpnscion,0))+sum(nvl(e.vlor_dvlcion,0))) saldo_favor_visible,',
'	   a.obsrvcion,',
'       a.nmbre_impsto,',
'       a.nmbre_sldo_fvor_tpo,',
'       a.id_impsto,',
'       a.id_impsto_sbmpsto,',
'       a.id_sjto_impsto',
'from v_gf_g_saldos_favor                   a ',
'join v_pq_g_solicitudes                  b   on   a.id_sjto_impsto = b.id_sjto_impsto ',
'join gf_g_saldos_favor_solicitud         g   on   b.id_slctud      = g.id_slctud',
'left join gf_g_sldos_fvor_slctud_dtll    c   on   a.id_sldo_fvor   = c.id_sldo_fvor',
'left join gf_g_sldos_fvr_cmpnscn_dtll    d   on   a.id_sldo_fvor   = d.id_sldo_fvor',
'left join gf_g_sldos_fvr_dvlcion_dtll    e   on   a.id_sldo_fvor   = e.id_sldo_fvor',
'where c.indcdor_rcncdo = ''S''',
'and g.id_sldo_fvor_slctud = :P210_ID_SLDO_FVOR_SLCTUD',
'group by a.id_sldo_fvor,',
'         a.vlor_sldo_fvor,',
'         a.obsrvcion,',
'         a.id_sjto_impsto,',
'         a.id_impsto,',
'         a.id_impsto_sbmpsto,',
'         a.nmbre_impsto,',
'         a.nmbre_sldo_fvor_tpo) l where l.saldo_favor > 0;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106282964672718186)
,p_name=>'P210_ID_SLDO_FVOR_SLCTUD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(210268867587373682)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106284102072718188)
,p_name=>'P210_ID_SOLICITUD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(210268867587373682)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106284589768718189)
,p_name=>'P210_SJTO_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(210268867587373682)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106293898753722846)
,p_name=>'P210_BANCOS'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(210680628753635043)
,p_prompt=>'Bancos'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_bnco d,',
'        a.id_bnco r',
'from df_c_bancos a;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106525397070107101)
,p_name=>'P210_CUENTAS'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(210680628753635043)
,p_prompt=>'# Cuenta'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>12
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107309425228512304)
,p_name=>'P210_JSON_DEVOLUCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(210268867587373682)
,p_prompt=>'JSON_DEVOLUCION'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107311883937512328)
,p_name=>'P210_ID_SLDO_FVOR_DVLCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(210268867587373682)
,p_prompt=>'Nuevo'
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
 p_id=>wwv_flow_api.id(107608348070491802)
,p_name=>'P210_ID_SLDOS_FVR_DVLCION_DTLL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(210268867587373682)
,p_prompt=>'id_sldos_fvr_dvlcion_dtll'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(104226924523635231)
,p_name=>'Muestra las SubRegiones'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P210_OPCIONES'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(104227162625635233)
,p_event_id=>wwv_flow_api.id(104226924523635231)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(108506851429451601)
,p_name=>'Al seleccionar saldo a favor'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(216726500993523273)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108506982693451602)
,p_event_id=>wwv_flow_api.id(108506851429451601)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'capturarSaldoFavor()'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(107311626577512326)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Elimina la devoluci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_devolucion  number;',
'begin ',
'    ',
'       ',
'    delete from gf_g_sldos_fvr_dvlcion_dtll a',
'    where a.id_sldos_fvr_dvlcion_dtll = :P210_ID_SLDOS_FVR_DVLCION_DTLL;',
'    ',
'    select count(a.id_sldo_fvor_dvlcion) ',
'    into v_devolucion',
'    from gf_g_saldos_favor_devlucion a',
'    join gf_g_sldos_fvr_dvlcion_dtll b on a.id_sldo_fvor_dvlcion = b.id_sldo_fvor_dvlcion',
'    where a.id_sldo_fvor_slctud = :P210_ID_SLDO_FVOR_SLCTUD; ',
'    ',
'    if(v_devolucion = 0) then',
'        delete from gf_g_saldos_favor_devlucion a',
'        where a.id_sldo_fvor_slctud = :P210_ID_SLDO_FVOR_SLCTUD;',
'    end if;',
' ',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Eliminar'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(106525410594107102)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Guardar Devoluci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(3000);',
'begin',
'',
'    pkg_gf_saldos_favor.prc_rg_saldos_favor_devolucion(p_cdgo_clnte          => :F_CDGO_CLNTE,',
'                                                       p_id_sldo_fvor_slctud => :P210_ID_SLDO_FVOR_SLCTUD,',
'                                                       p_id_sjto_impsto      => :P210_SJTO_IMPSTO,',
'                                                       p_id_bnco             => :P210_BANCOS,',
'                                                       p_id_bnco_cnta        => :P210_CUENTAS,',
'                                                       p_json                => :P210_JSON_DEVOLUCION,',
'                                                       o_cdgo_rspsta         => v_cdgo_rspsta,',
'                                                       o_mnsje_rspsta        => v_mnsje_rspsta);',
'                                                       ',
'    if(v_cdgo_rspsta != 0)then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(107233789886172026)
);
end;
/
