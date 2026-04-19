prompt --application/pages/page_00025
begin
wwv_flow_api.create_page(
 p_id=>25
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>'Candidatos'
,p_step_title=>'Candidatos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function iniciar_flujo(id_instancia,id_fljo_trea){    ',
'    apex.server.process("AjaxIrFlujo", {f01: id_instancia, f02: id_fljo_trea}, {',
'        success: function (data) { ',
'            if (data.type === ''OK'') {',
'                console.log(data.test);',
'                window.localStorage.clear();',
'                window.location.href = data.url;',
'            }else{',
'                apex.message.showErrors({',
'                    type: apex.message.TYPE.ERROR,',
'                    location: ["page"],',
'                    message: data.msg,',
'                    unsafe: false',
'                });',
'            }',
'        },',
'        error: function () {',
'            console.log(arguments);',
'        }',
'    });',
'}'))
,p_step_template=>wwv_flow_api.id(36470205860968633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20210830122738'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(60357025125278802)
,p_plug_name=>'&P25_FUNCIONARIO.'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(60357139348278803)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_parent_plug_id=>wwv_flow_api.id(60357025125278802)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36491913657968646)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(63333999720511102)
,p_plug_name=>unistr('Confirmaci\00F3n de Actos para &P25_FUNCIONARIO.')
,p_parent_plug_id=>wwv_flow_api.id(60357025125278802)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(36509862944968653)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(63323692732487203)
,p_plug_name=>'Actos Por Confirmar'
,p_parent_plug_id=>wwv_flow_api.id(63333999720511102)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  c.candidato,',
'        c.nmbre_impsto,',
'        c.nmbre_impsto_sbmpsto,',
'        c.nmbre_prgrma,',
'        c.nmbre_sbprgrma,',
'        a.id_instncia_fljo ',
'from fi_g_fiscalizacion_expdnte     a',
'join fi_g_fsclzcion_expdnte_acto    b  on  a.id_fsclzcion_expdnte  =    b.id_fsclzcion_expdnte',
'join v_fi_g_candidatos              c  on  a.id_cnddto             =    c.id_cnddto',
'where c.cdgo_clnte      = :F_CDGO_CLNTE',
'and   a.id_fncnrio      = :P25_ID_FNCNRIO',
'and   b.id_acto_tpo in (select id_acto_tpo ',
'                        from fi_d_actos_revision',
'                        where indcdor_rvsion = ''S'')',
'and a.cdgo_expdnte_estdo = ''ABT''',
'and b.id_acto is null;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(63324048736487207)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button onclick="iniciar_flujo(&ID_INSTNCIA_FLJO.,&ID_FLJO_TREA.)" style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Ir al Flujo &ID_INSTNCIA_FLJO.<span class="fa fa-external-link-square"></span>',
'</button>'))
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(63324189991487208)
,p_name=>'CANDIDATO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANDIDATO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Candidato'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>200
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(63324294676487209)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(63324395959487210)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'SubTributo'
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
 p_id=>wwv_flow_api.id(63324494591487211)
,p_name=>'NMBRE_PRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_PRGRMA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Programa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(63324506062487212)
,p_name=>'NMBRE_SBPRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SBPRGRMA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Subprograma'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(63323936700487206)
,p_internal_uid=>63323936700487206
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
 p_id=>wwv_flow_api.id(63330106185501158)
,p_interactive_grid_id=>wwv_flow_api.id(63323936700487206)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(63330271379501160)
,p_report_id=>wwv_flow_api.id(63330106185501158)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(63330763879501174)
,p_view_id=>wwv_flow_api.id(63330271379501160)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(63324048736487207)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(63331253536501179)
,p_view_id=>wwv_flow_api.id(63330271379501160)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(63324189991487208)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(63331754382501181)
,p_view_id=>wwv_flow_api.id(63330271379501160)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(63324294676487209)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(63332270992501183)
,p_view_id=>wwv_flow_api.id(63330271379501160)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(63324395959487210)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(63332790042501184)
,p_view_id=>wwv_flow_api.id(63330271379501160)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(63324494591487211)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(63333253479501186)
,p_view_id=>wwv_flow_api.id(63330271379501160)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(63324506062487212)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(109616690692345498)
,p_plug_name=>'Expedientes'
,p_parent_plug_id=>wwv_flow_api.id(63333999720511102)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.candidato,',
'        a.nmbre_impsto,',
'        a.nmbre_impsto_sbmpsto,',
'        a.nmbre_prgrma,',
'        a.nmbre_sbprgrma,',
'        d.id_instncia_fljo',
'from v_fi_g_candidatos           a',
'--join v_fi_g_fsclzcion_lote       b     on a.id_fsclzcion_lte = b.id_fsclzcion_lte',
'join fi_g_candidatos_funcionario c     on a.id_cnddto        = c.id_cnddto',
'join fi_g_fiscalizacion_expdnte  d     on a.id_cnddto        = d.id_cnddto',
'where a.cdgo_clnte      = :F_CDGO_CLNTE',
'and c.id_fncnrio        = :P25_ID_FNCNRIO',
'and a.id_cnddto         = nvl(:CANDIDATO, a.id_cnddto)',
'and a.id_impsto_sbmpsto = nvl(:P25_SB_IMPSTO, a.id_impsto_sbmpsto)',
'and a.id_prgrma         = nvl(:P25_PRGRMA,  a.id_prgrma)',
'and a.id_sbprgrma       = nvl(:P25_SBPRGRMA, a.id_sbprgrma);'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109617111790345502)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button onclick="iniciar_flujo(&ID_INSTNCIA_FLJO.,&ID_FLJO_TREA.)" style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Ir al Flujo &ID_INSTNCIA_FLJO.<span class="fa fa-external-link-square"></span>',
'</button>'))
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(114156581071860299)
,p_name=>'CANDIDATO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANDIDATO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Candidato'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>201
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(114156735593860300)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(114156871611860301)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'SubTributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(114156918669860302)
,p_name=>'NMBRE_PRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_PRGRMA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Programa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(114156991632860303)
,p_name=>'NMBRE_SBPRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SBPRGRMA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Subprograma'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(109616840355345499)
,p_internal_uid=>109616840355345499
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
 p_id=>wwv_flow_api.id(109628145078381956)
,p_interactive_grid_id=>wwv_flow_api.id(109616840355345499)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(109628204498381956)
,p_report_id=>wwv_flow_api.id(109628145078381956)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109629697677381966)
,p_view_id=>wwv_flow_api.id(109628204498381956)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(109617111790345502)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114180472916125700)
,p_view_id=>wwv_flow_api.id(109628204498381956)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(114156581071860299)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114180924100125702)
,p_view_id=>wwv_flow_api.id(109628204498381956)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(114156735593860300)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114181377631125703)
,p_view_id=>wwv_flow_api.id(109628204498381956)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(114156871611860301)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114181951939125704)
,p_view_id=>wwv_flow_api.id(109628204498381956)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(114156918669860302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114182406637125706)
,p_view_id=>wwv_flow_api.id(109628204498381956)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(114156991632860303)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(207401076602277023)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>40
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
 p_id=>wwv_flow_api.id(207401885433281049)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(60357589238278807)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(207401076602277023)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:RP,24::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(60899254106689301)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(60357139348278803)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consulta'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59816040304518901)
,p_name=>'P25_ID_FNCNRIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(109616690692345498)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60357422536278806)
,p_name=>'P25_FUNCIONARIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(109616690692345498)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60379342174475101)
,p_name=>'P25_PRGRMA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(60357139348278803)
,p_prompt=>'Programa'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_PROGRAMAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  p.nmbre_prgrma as d,',
'        p.id_prgrma as r',
'from fi_d_programas p;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60379442353475102)
,p_name=>'P25_SBPRGRMA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(60357139348278803)
,p_prompt=>'SubProgramas'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_sbprgrma as  d,',
'       a.id_sbprgrma    as  r',
'from fi_d_subprogramas a',
'where a.id_prgrma = :P25_PRGRMA;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P25_PRGRMA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60379625463475104)
,p_name=>'P25_IMPUESTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(60357139348278803)
,p_prompt=>'Impuesto'
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
,p_field_template=>wwv_flow_api.id(36555007171968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60379791488475105)
,p_name=>'P25_SB_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(60357139348278803)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P25_IMPUESTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60379834754475106)
,p_name=>'P25_CNDDTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(60357139348278803)
,p_prompt=>'Candidato'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.candidato as d,',
'        a.id_cnddto   as  r',
'from v_fi_g_candidatos           a',
'join v_fi_g_fiscalizacion_lote   b     on a.id_fsclzcion_lte = b.id_fsclzcion_lte',
'join fi_g_candidatos_funcionario c     on a.id_cnddto        = c.id_cnddto',
'join fi_g_fiscalizacion_expdnte  d     on a.id_cnddto        = d.id_cnddto',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and c.id_fncnrio = :P25_ID_FNCNRIO',
'group by a.candidato,',
'         a.id_cnddto;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63323760453487204)
,p_name=>'P25_ID_FNCNRIO_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(63323692732487203)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63323856208487205)
,p_name=>'P25_FUNCIONARIO_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(63323692732487203)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(60379572034475103)
,p_computation_sequence=>10
,p_computation_item=>'P25_IMPUESTO'
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
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(60357313203278805)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Captura Funcionario'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select  b.prmer_nmbre   ||'' ''|| b.prmer_aplldo',
'    into :P25_FUNCIONARIO',
'    from df_c_funcionarios  a',
'    join si_c_terceros      b   on  a.id_trcro  =   b.id_trcro',
'    where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_fncnrio = :P25_ID_FNCNRIO;',
'',
'',
'exception',
'    when others then',
'        :P25_FUNCIONARIO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(59827755396602447)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AjaxIrFlujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_id_instncia_fljo number := apex_application.g_f01(1);',
'   v_id_fljo_trea number;-- := apex_application.g_f02(1);',
'   v_url varchar2(4000);',
'   v_id_fljo_trea_orgen number;',
'   ',
'   begin',
'   ',
'       begin',
'           select id_fljo_trea_orgen',
'           into v_id_fljo_trea_orgen',
'           from wf_g_instancias_transicion',
'           where id_instncia_fljo = v_id_instncia_fljo',
'           and id_estdo_trnscion in (1,2);',
'       exception',
'           when no_data_found then',
'               begin',
'                   select distinct first_value(id_fljo_trea_orgen) over (order by id_instncia_trnscion desc)',
'                   into v_id_fljo_trea_orgen',
'                   from wf_g_instancias_transicion',
'                   where id_instncia_fljo = v_id_instncia_fljo;',
'                   ',
'              exception',
'                  when others then',
'                      v_id_fljo_trea_orgen := null;',
'              end;',
'           when others then',
'               v_id_fljo_trea_orgen := null;',
'       end;',
'       ',
'       apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo );',
'       apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea_orgen );            	',
'       v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => v_id_instncia_fljo,',
'                                                     p_id_fljo_trea     => v_id_fljo_trea_orgen,',
'                                                     p_clear_session    => ''S'');',
'       apex_json.open_object;',
'       apex_json.write(''type'', ''OK'');',
'       apex_json.write(''msg'', ''Url generada exitosamente'');',
'       apex_json.write(''url'', v_url);',
'       apex_json.write(''test'', 1);',
'       apex_json.close_all();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
