prompt --application/pages/page_00081
begin
wwv_flow_api.create_page(
 p_id=>81
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Conceptos por impuestos'
,p_step_title=>'Conceptos por Tributos'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#WORKSPACE_IMAGES#funciones.js'))
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-GV {',
'--font-size: 12px;',
'line-height: 11px;',
'}'))
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20201222101359'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39630017586141536)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29551431083068507)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto_acto_cncpto,',
'       nmbre_impsto_acto,',
'       dscrpcion_cncpto,',
'       dscrpcion_actvo,',
'       dscrpcion_gnra_intres_mra,',
'       dscrpcion_cncpto_intres_mra,',
'       unco       ',
'   from v_df_i_impuestos_acto_concepto',
' where cdgo_clnte   =  :F_CDGO_CLNTE',
'   and vgncia       =  :P81_VGNCIA',
'   and id_prdo      =  :P81_PRDO',
' '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(39630151202141537)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'50'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:146:&SESSION.::&DEBUG.:RP,146:P146_ID_IMPSTO_ACTO_CNCPTO,P146_CDGO_CLNTE,P146_IMPUESTO,P146_SUB_IMPUESTO:#ID_IMPSTO_ACTO_CNCPTO#,&F_CDGO_CLNTE.,&P81_IMPUESTO.,&P81_SUB_IMPUESTO.'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'ELAFAURIE'
,p_internal_uid=>39630151202141537
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39631303279141549)
,p_db_column_name=>'NMBRE_IMPSTO_ACTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39631409281141550)
,p_db_column_name=>'DSCRPCION_CNCPTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(40116322911175903)
,p_db_column_name=>'DSCRPCION_CNCPTO_INTRES_MRA'
,p_display_order=>30
,p_column_identifier=>'E'
,p_column_label=>unistr('Concepto de Inter\00E9s de Mora')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(40116279554175902)
,p_db_column_name=>'DSCRPCION_GNRA_INTRES_MRA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('\00BFGenera Inter\00E9s de Mora?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(40116458310175904)
,p_db_column_name=>'UNCO'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>unistr('\00BF\00DAnico?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(40116112592175901)
,p_db_column_name=>'DSCRPCION_ACTVO'
,p_display_order=>60
,p_column_identifier=>'C'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(40116544642175905)
,p_db_column_name=>'ID_IMPSTO_ACTO_CNCPTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Id Impsto Acto Cncpto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(40123329318176211)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'401234'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_IMPSTO_ACTO:DSCRPCION_CNCPTO:DSCRPCION_ACTVO:DSCRPCION_GNRA_INTRES_MRA:DSCRPCION_CNCPTO_INTRES_MRA:UNCO:ID_IMPSTO_ACTO_CNCPTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40116681702175906)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98809839597635805)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29541487623068504)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98810518766635812)
,p_plug_name=>'Vigencia'
,p_parent_plug_id=>wwv_flow_api.id(98809839597635805)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98843081369774947)
,p_plug_name=>'Conceptos por Tributos'
,p_region_name=>'emp'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
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
'       id_cncpto_intres_mra,',
'       orden',
'       ',
'  from df_i_impuestos_acto_concepto',
' where cdgo_clnte   =  :F_CDGO_CLNTE',
'   and vgncia       =  :P81_VGNCIA',
'   and id_prdo      =  :P81_PRDO',
' ',
'  ',
'   '))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P81_PRDO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P81_PRDO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98809591754635802)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98809611750635803)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98844288802774952)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98844801216774954)
,p_name=>'ID_IMPSTO_ACTO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO_CNCPTO'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98845496628774955)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'&F_CDGO_CLNTE.'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98846054228774957)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P81_VGNCIA'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98846685586774957)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P81_PRDO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98847268389774957)
,p_name=>'ID_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_acto,',
'       id_impsto_acto',
'  from df_i_impuestos_acto',
' where          id_impsto = :P81_IMPUESTO ',
'   and  id_impsto_sbmpsto = :P81_SUB_IMPUESTO',
' order by nmbre_impsto_acto'))
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
 p_id=>wwv_flow_api.id(98847876475774958)
,p_name=>'ID_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,',
'       id_cncpto',
'  from df_i_conceptos',
' where id_impsto = :P81_IMPUESTO',
'   and cdgo_clnte = :F_CDGO_CLNTE'))
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
 p_id=>wwv_flow_api.id(98848425239774958)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFActivo?')
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
,p_filter_lov_type=>'LOV'
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
 p_id=>wwv_flow_api.id(98849068166774958)
,p_name=>'GNRA_INTRES_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GNRA_INTRES_MRA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFGenera<br>Inter\00E9s Mora?')
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
,p_filter_lov_type=>'LOV'
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
 p_id=>wwv_flow_api.id(98849639219774959)
,p_name=>'INDCDOR_TRFA_CRCTRSTCAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_TRFA_CRCTRSTCAS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFIndica<br>Caracter\00EDsticas<br> de Tarifa?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
,p_filter_lov_type=>'LOV'
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
 p_id=>wwv_flow_api.id(98850214144774959)
,p_name=>'ORDEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORDEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Orden'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select level d , level r',
'from   dual',
'where level>0',
'connect by level <= 100; '))
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
 p_id=>wwv_flow_api.id(173829751476867422)
,p_name=>'ID_CNCPTO_INTRES_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO_INTRES_MRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Concepto<br> Interes<br> Mora'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'     dscrpcion,',
'     id_cncpto',
' from df_i_conceptos ',
'where cdgo_cncpto_tpo = ''DBT''',
'   and id_impsto= :P81_IMPUESTO',
'   and cdgo_clnte = :F_CDGO_CLNTE;'))
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(98843577945774950)
,p_internal_uid=>98843577945774950
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_max_row_count=>100000
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
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
 p_id=>wwv_flow_api.id(98843994989774950)
,p_interactive_grid_id=>wwv_flow_api.id(98843577945774950)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(98844028929774951)
,p_report_id=>wwv_flow_api.id(98843994989774950)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98844612725774953)
,p_view_id=>wwv_flow_api.id(98844028929774951)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(98844288802774952)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98845237997774955)
,p_view_id=>wwv_flow_api.id(98844028929774951)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(98844801216774954)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98845861163774957)
,p_view_id=>wwv_flow_api.id(98844028929774951)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(98845496628774955)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98846412882774957)
,p_view_id=>wwv_flow_api.id(98844028929774951)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(98846054228774957)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98847003691774957)
,p_view_id=>wwv_flow_api.id(98844028929774951)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(98846685586774957)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98847641324774958)
,p_view_id=>wwv_flow_api.id(98844028929774951)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(98847268389774957)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>175
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98848220791774958)
,p_view_id=>wwv_flow_api.id(98844028929774951)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(98847876475774958)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>124
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98848878094774958)
,p_view_id=>wwv_flow_api.id(98844028929774951)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(98848425239774958)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>86
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98849404400774959)
,p_view_id=>wwv_flow_api.id(98844028929774951)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(98849068166774958)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98850000245774959)
,p_view_id=>wwv_flow_api.id(98844028929774951)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(98849639219774959)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>155
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98850690808774959)
,p_view_id=>wwv_flow_api.id(98844028929774951)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(98850214144774959)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98851767888775842)
,p_view_id=>wwv_flow_api.id(98844028929774951)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(98809591754635802)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(174600893612754414)
,p_view_id=>wwv_flow_api.id(98844028929774951)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(173829751476867422)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>124
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(167046148799624018)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
unistr('	Funcionalidad que permite ingresar, consultar, modificar y eliminar conceptos por tributo en una vigencia y per\00EDodo identificado.'),
'<br><br>',
unistr('<i><b>Nota:</b></i>Para realizar la consulta debe hacer la selecci\00F3n de los cuatro campos requeridos en los par\00E1metros de b\00FAsqueda y hacer clic en el bot\00F3n consultar.<br><br>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40116788802175907)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(40116681702175906)
,p_button_name=>'Nuevo'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Acto'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:146:&SESSION.::&DEBUG.:RP,146:F_BRANCH:&F_BRANCH.'
,p_icon_css_classes=>'fa-window-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(98810366437635810)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(98810518766635812)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_button_comment=>'Para realizar la consulta debe seleccionar todos los filtros'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98810136465635808)
,p_name=>'P81_VGNCIA'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(98810518766635812)
,p_prompt=>'<b>Vigencia</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccione Vigencia-'
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione la vigencia correspondiente al Tributo y Sub-tributo para consultar el concepto. Obligatorio'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'95%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98810250904635809)
,p_name=>'P81_PRDO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(98810518766635812)
,p_prompt=>unistr('<b>Per\00EDodo</b>')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,',
'       id_prdo',
'  from df_i_periodos',
' where  id_impsto         = :P81_IMPUESTO',
'   and  id_impsto_sbmpsto = :P81_SUB_IMPUESTO',
'   and  vgncia            = :P81_VGNCIA',
'  '))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccione Periodo-'
,p_lov_cascade_parent_items=>'P81_IMPUESTO,P81_SUB_IMPUESTO,P81_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el periodo correspondiente a la vigencia del Tributo y Sub-Tributo para consultar el concepto. Obligatorio'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'95%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(167044852150624005)
,p_name=>'P81_SUB_IMPUESTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(98810518766635812)
,p_prompt=>'<b>Sub-Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where id_impsto = :P81_IMPUESTO',
' order by 1',
'  '))
,p_lov_cascade_parent_items=>'P81_IMPUESTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el sub-tributo para consultar el concepto. Obligatorio'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'95%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(167044956189624006)
,p_name=>'P81_IMPUESTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(98810518766635812)
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
,p_lov_null_text=>'-Seleccione Tributo-'
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tributo para consultar el concepto. Obligatorio'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'95%'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(98811125215635818)
,p_tabular_form_region_id=>wwv_flow_api.id(98843081369774947)
,p_validation_name=>unistr('Acto y concepto no se repiten para el mismo per\00EDodo')
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from df_i_impuestos_acto_concepto',
' where cdgo_clnte             = :F_CDGO_CLNTE',
'   and id_prdo                = :P81_PRDO',
'   and id_cncpto              = :ID_CNCPTO',
'   and id_impsto_acto         = :ID_IMPSTO_ACTO',
'   and id_impsto_acto_cncpto != nvl(:ID_IMPSTO_ACTO_CNCPTO,-1)'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('Ya existe un registro para el acto e impuesto escogidos en el per\00EDodo se\00F1alado')
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(167045948912624016)
,p_name=>'New'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(167046030733624017)
,p_event_id=>wwv_flow_api.id(167045948912624016)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id){',
'	if($(''#''+id).attr(''aria-expanded'') == ''true''){',
'		$(''#''+id).click();',
'	}',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(173829894267867423)
,p_name=>'Deshabilitar Concepto Interes'
,p_event_sequence=>20
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(98843081369774947)
,p_triggering_element=>'GNRA_INTRES_MRA'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'GNRA_INTRES_MRA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(174467440387491645)
,p_event_id=>wwv_flow_api.id(173829894267867423)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'ID_CNCPTO_INTRES_MRA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(173830036437867425)
,p_event_id=>wwv_flow_api.id(173829894267867423)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'ID_CNCPTO_INTRES_MRA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(173830191350867426)
,p_event_id=>wwv_flow_api.id(173829894267867423)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'ID_CNCPTO_INTRES_MRA'
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(38735390752719516)
,p_name=>unistr('al hacer clic en el bot\00F3n consultar ')
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(98810366437635810)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(38735498918719517)
,p_event_id=>wwv_flow_api.id(38735390752719516)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (!apex.page.validate()) {',
'    alert("Corrija los errores");',
'}else{',
'    $redirect([''P81_IMPUESTO'',''P81_SUB_IMPUESTO'',''P81_VGNCIA'',''P81_PRDO''], [$v(''P81_IMPUESTO''),$v(''P81_SUB_IMPUESTO''),$v(''P81_VGNCIA''),$v(''P81_PRDO'')]);   ',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98809735247635804)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(98843081369774947)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Conceptos por impuestos - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
