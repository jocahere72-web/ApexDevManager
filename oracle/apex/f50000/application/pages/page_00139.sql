prompt --application/pages/page_00139
begin
wwv_flow_api.create_page(
 p_id=>139
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Gesti\00F3n de Tributo Actos')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Gesti\00F3n de Tributo Actos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'var htmldb_ch_message=''"OK_TO_GET_NEXT_PREV_PK_VALUE"'';',
'',
'function definirItemRequerido (nombreItem) {',
'    let item = $("#" + nombreItem);',
'    item.prop("required",true);',
'    item.closest(".t-Form-fieldContainer").addClass("is-required");',
'}',
'',
'function definirItemNoRequerido (nombreItem) {',
'    let item = $("#" + nombreItem);',
'    item.prop("required",false);',
'    item.closest(".t-Form-fieldContainer").removeClass("is-required");',
'}'))
,p_step_template=>wwv_flow_api.id(29525011823068496)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_protection_level=>'C'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250121093251'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18007125385280775)
,p_plug_name=>'Pantalla Basada en DF_I_IMPUESTOS_ACTO'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18024833651280904)
,p_plug_name=>unistr('Gesti\00F3n de Tributo Acto')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29551431083068507)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto_acto_cncpto,',
'       cdgo_clnte,',
'       vgncia,',
'       id_prdo,',
'       id_impsto_acto,',
'       id_cncpto,',
'       actvo,',
'       gnra_intres_mra,',
'       indcdor_trfa_crctrstcas,',
'       orden,',
'       fcha_vncmnto,',
'       id_cncpto_intres_mra,',
'       id_cncpto_intres_fnccion,',
'       id_cncpto_intres_vncdo,',
'       id_impsto_acto_cncpto_rlcnal,',
'       indcdor_cncpto_oblgtrio',
'  from df_i_impuestos_acto_concepto',
' where id_impsto_acto = :P139_ID_IMPSTO_ACTO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P139_ID_IMPSTO_ACTO,P139_ID_IMPSTO,P139_ID_IMPSTO_SBMPSTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P139_ID_IMPSTO_ACTO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18026092441280906)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18026568972280909)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_label=>'Acciones'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18027188086280911)
,p_name=>'ID_IMPSTO_ACTO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(18027779172280912)
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'F_CDGO_CLNTE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18028366513280913)
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
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(97138285891768233)
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18028924682280913)
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
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(dscrpcion) d,',
'       id_prdo r',
'  from df_i_periodos',
' where cdgo_clnte        = :F_CDGO_CLNTE ',
'   and ID_IMPSTO         = :P139_ID_IMPSTO',
'   and ID_IMPSTO_SBMPSTO = :P139_ID_IMPSTO_SBMPSTO',
'   and vgncia = :VGNCIA '))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'VGNCIA'
,p_ajax_items_to_submit=>'P139_ID_IMPSTO,P139_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18029530056280913)
,p_name=>'ID_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_enable_filter=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P139_ID_IMPSTO_ACTO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18030144486280913)
,p_name=>'ID_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d,',
'       id_cncpto r',
'from df_i_conceptos',
'where cdgo_clnte = :F_CDGO_CLNTE',
' and ID_IMPSTO = :P139_ID_IMPSTO',
' and ctgria_cncpto = ''C''',
'order by 1;'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18030709188280914)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFActivo?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>true
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'S'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18031338456280914)
,p_name=>'GNRA_INTRES_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GNRA_INTRES_MRA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFGenera Inter\00E9s Mora?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>true
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18031922497280914)
,p_name=>'INDCDOR_TRFA_CRCTRSTCAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_TRFA_CRCTRSTCAS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFIndicador Tarifa Caracter\00EDsticas?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>true
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18032576836280915)
,p_name=>'ORDEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORDEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Orden'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_03=>'center'
,p_item_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_is_required=>false
,p_max_length=>6
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18033120085280915)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1997:2028'
,p_item_attributes=>'onkeydown="return false"'
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18033742921280915)
,p_name=>'ID_CNCPTO_INTRES_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO_INTRES_MRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Concepto Inter\00E9s Mora')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d,',
'       id_cncpto r',
'from df_i_conceptos',
'where cdgo_clnte    = :F_CDGO_CLNTE ',
'  and id_impsto     = :P139_ID_IMPSTO',
'  and ctgria_cncpto = ''I''',
'  and actvo = ''S''',
'order by 1'))
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18034376585280916)
,p_name=>'ID_CNCPTO_INTRES_FNCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO_INTRES_FNCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Inter\00E9s Financiaci\00F3n ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d,',
'       id_cncpto r',
'from df_i_conceptos',
'where cdgo_clnte = :F_CDGO_CLNTE and',
'      actvo = ''S''',
'      and ID_IMPSTO = :P139_ID_IMPSTO',
'      and ctgria_cncpto = ''I''',
'order by 1'))
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18034907789280916)
,p_name=>'ID_CNCPTO_INTRES_VNCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO_INTRES_VNCDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Inter\00E9s Vencido ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d,',
'       id_cncpto r',
'from df_i_conceptos',
'where cdgo_clnte = :F_CDGO_CLNTE and',
'      actvo = ''S''',
'      and ID_IMPSTO = :P139_ID_IMPSTO',
'     -- and ID_IMPSTO = :P139_ID_IMPSTO',
'      and ctgria_cncpto = ''I''',
'order by 1'))
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(49756019661223902)
,p_name=>'ID_IMPSTO_ACTO_CNCPTO_RLCNAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO_CNCPTO_RLCNAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Acto Concepto Relacional '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select b.dscrpcion || ''-'' || a.vgncia d ',
'        , a.id_impsto_acto_cncpto       ',
'     from v_df_i_impuestos_acto_concepto a',
'     join df_i_conceptos b',
'       on a.id_cncpto = b.id_cncpto',
'    where a.cdgo_clnte          = :F_CDGO_CLNTE ',
'      and a.id_impsto           = :P139_ID_IMPSTO',
'      and a.id_impsto_sbmpsto   = :P139_ID_IMPSTO_SBMPSTO',
'      and a.gnra_intres_mra     = ''N''',
'      and a.id_impsto_acto_cncpto_rlcnal is null',
' order by d;'))
,p_lov_display_extra=>false
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
 p_id=>wwv_flow_api.id(101880805947258101)
,p_name=>'INDCDOR_CNCPTO_OBLGTRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_CNCPTO_OBLGTRIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BF Obligatorio ?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(18025324515280905)
,p_internal_uid=>18025324515280905
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
 p_id=>wwv_flow_api.id(18025767430280905)
,p_interactive_grid_id=>wwv_flow_api.id(18025324515280905)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(18025818788280906)
,p_report_id=>wwv_flow_api.id(18025767430280905)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12117463187358)
,p_view_id=>wwv_flow_api.id(18025818788280906)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(49756019661223902)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>472
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18026908197280910)
,p_view_id=>wwv_flow_api.id(18025818788280906)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(18026568972280909)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18027506696280912)
,p_view_id=>wwv_flow_api.id(18025818788280906)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(18027188086280911)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>141
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18028192323280912)
,p_view_id=>wwv_flow_api.id(18025818788280906)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(18027779172280912)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>155
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18028711951280913)
,p_view_id=>wwv_flow_api.id(18025818788280906)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(18028366513280913)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>116
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18029351573280913)
,p_view_id=>wwv_flow_api.id(18025818788280906)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(18028924682280913)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>180
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18029985620280913)
,p_view_id=>wwv_flow_api.id(18025818788280906)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(18029530056280913)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18030585052280914)
,p_view_id=>wwv_flow_api.id(18025818788280906)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(18030144486280913)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>440
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18031116179280914)
,p_view_id=>wwv_flow_api.id(18025818788280906)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(18030709188280914)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>74
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18031788314280914)
,p_view_id=>wwv_flow_api.id(18025818788280906)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(18031338456280914)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>170
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18032364247280915)
,p_view_id=>wwv_flow_api.id(18025818788280906)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(18031922497280914)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>218
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18032932147280915)
,p_view_id=>wwv_flow_api.id(18025818788280906)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(18032576836280915)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18033502068280915)
,p_view_id=>wwv_flow_api.id(18025818788280906)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(18033120085280915)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>215
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18034163131280915)
,p_view_id=>wwv_flow_api.id(18025818788280906)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(18033742921280915)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>377
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18034755950280916)
,p_view_id=>wwv_flow_api.id(18025818788280906)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(18034376585280916)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>233
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18035322035280916)
,p_view_id=>wwv_flow_api.id(18025818788280906)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(18034907789280916)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>176
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101886819523260916)
,p_view_id=>wwv_flow_api.id(18025818788280906)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(101880805947258101)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18007630374280776)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(18007125385280775)
,p_button_name=>'BTN_GUARDAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P139_ID_IMPSTO_ACTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18007833149280776)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(18007125385280775)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:130:&SESSION.::&DEBUG.:::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18007562363280776)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(18007125385280775)
,p_button_name=>'BTN_INSERTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P139_ID_IMPSTO_ACTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18007742895280776)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(18007125385280775)
,p_button_name=>'BTN_ELIMINAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de eliminar el registro?'',''BTN_ELIMINAR'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P139_ID_IMPSTO_ACTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(18009437399280779)
,p_branch_name=>'Go To Page 130'
,p_branch_action=>'f?p=&APP_ID.:130:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(18007833149280776)
,p_branch_sequence=>1
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(17727581361148837)
,p_branch_name=>'Go To Page 130'
,p_branch_action=>'f?p=&APP_ID.:130:&SESSION.::&DEBUG.:RP,130::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(18007742895280776)
,p_branch_sequence=>11
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18009899779280809)
,p_name=>'P139_ID_IMPSTO_ACTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(18007125385280775)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18010246161280820)
,p_name=>'P139_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(18007125385280775)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tributo'
,p_source=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tributo.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18010672465280828)
,p_name=>'P139_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(18007125385280775)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sub-Tributo'
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto,',
'       id_impsto_sbmpsto',
'  from v_df_i_impuestos_subimpuesto ',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P139_ID_IMPSTO'))
,p_lov_cascade_parent_items=>'P139_ID_IMPSTO'
,p_ajax_items_to_submit=>'P139_ID_IMPSTO,P139_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el sub tributo.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18011055984280828)
,p_name=>'P139_CDGO_IMPSTO_ACTO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(18007125385280775)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('C\00F3digo Tributo Acto')
,p_source=>'CDGO_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>7
,p_cMaxlength=>5
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el C\00F3digo del acto del tributo.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18011466035280828)
,p_name=>'P139_NMBRE_IMPSTO_ACTO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(18007125385280775)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nombre Tributo Acto'
,p_source=>'NMBRE_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el nombre correspondiente al acto del tributo.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18011840064280829)
,p_name=>'P139_ACTVO'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(18007125385280775)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18012218318280829)
,p_name=>'P139_TPO_DIAS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(18007125385280775)
,p_use_cache_before_default=>'NO'
,p_item_default=>'H'
,p_prompt=>unistr('Tipo de D\00EDa')
,p_source=>'TPO_DIAS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Habil;H,Calendario;C'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Seleccione el tipo de d\00EDa.')
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18012681091280829)
,p_name=>'P139_DIAS_MRGN_MRA'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(18007125385280775)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('D\00EDas Margen Mora')
,p_source=>'DIAS_MRGN_MRA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>4
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de d\00EDas de gracia para iniciar el c\00E1lculo de los intereses moratorios.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18013097329280830)
,p_name=>'P139_TXTO_BSE_GRVBLE'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(18007125385280775)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Texto Base Gravable '
,p_source=>'TXTO_BSE_GRVBLE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'n/1000'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18013420820280830)
,p_name=>'P139_INDCDOR_LQDCION_PBLCO'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(18007125385280775)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFLiquidaci\00F3n Desde Entorno P\00FAblico?')
,p_source=>'INDCDOR_LQDCION_PBLCO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indica si el acto se puede liquidar desde el portal ciudadano.'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18013872811280830)
,p_name=>'P139_INDCDOR_RQRE_ASCSDA'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(18007125385280775)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFRequiere Asociada?')
,p_source=>'INDCDOR_RQRE_ASCSDA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si se requiere la informaci\00F3n de la asociada. Aplica para tributos de Rentas Varias')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76582009212946938)
,p_name=>'P139_CDGO_UNDAD_TMPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(18007125385280775)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Unidad de Tiempo'
,p_source=>'CDGO_UNDAD_TMPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.cdgo_undad_tmpo',
'from    df_s_unidades_tiempo    a',
'order by    a.dscrpcion;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(49756192192223903)
,p_name=>unistr('Al cambiar Genera inter\00E9s Mora')
,p_event_sequence=>10
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(18024833651280904)
,p_triggering_element=>'GNRA_INTRES_MRA'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'GNRA_INTRES_MRA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49756207399223904)
,p_event_id=>wwv_flow_api.id(49756192192223903)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'ID_IMPSTO_ACTO_CNCPTO_RLCNAL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49756451106223906)
,p_event_id=>wwv_flow_api.id(49756192192223903)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'ID_IMPSTO_ACTO_CNCPTO_RLCNAL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49756518745223907)
,p_event_id=>wwv_flow_api.id(49756192192223903)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'ID_IMPSTO_ACTO_CNCPTO_RLCNAL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(76582118481946939)
,p_name=>unistr('Gesti\00F3n Tipo D\00EDa')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P139_CDGO_UNDAD_TMPO'
,p_condition_element=>'P139_CDGO_UNDAD_TMPO'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'DI'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76582279859946940)
,p_event_id=>wwv_flow_api.id(76582118481946939)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P139_TPO_DIAS'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76582505634946943)
,p_event_id=>wwv_flow_api.id(76582118481946939)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'definirItemRequerido("P139_TPO_DIAS");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76582335863946941)
,p_event_id=>wwv_flow_api.id(76582118481946939)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P139_TPO_DIAS'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76582685417946944)
,p_event_id=>wwv_flow_api.id(76582118481946939)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P139_TPO_DIAS'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76582484944946942)
,p_event_id=>wwv_flow_api.id(76582118481946939)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'definirItemNoRequerido("P139_TPO_DIAS");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18014658359280832)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Recuperacion Automatica de Filas Impuesto Acto'
,p_attribute_02=>'DF_I_IMPUESTOS_ACTO'
,p_attribute_03=>'P139_ID_IMPSTO_ACTO'
,p_attribute_04=>'ID_IMPSTO_ACTO'
,p_process_when=>'P139_ID_IMPSTO_ACTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18015093155280834)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of DF_I_IMPUESTOS_ACTO'
,p_attribute_02=>'DF_I_IMPUESTOS_ACTO'
,p_attribute_03=>'P139_ID_IMPSTO_ACTO'
,p_attribute_04=>'ID_IMPSTO_ACTO'
,p_attribute_09=>'P139_ID_IMPSTO_ACTO'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18035515958280917)
,p_process_sequence=>35
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(18024833651280904)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Gestion de Acto: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
end;
/
