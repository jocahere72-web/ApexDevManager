prompt --application/pages/page_00122
begin
wwv_flow_api.create_page(
 p_id=>122
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Sanciones_temp'
,p_page_mode=>'MODAL'
,p_step_title=>'Sanciones'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'var htmldb_ch_message=''"OK_TO_GET_NEXT_PREV_PK_VALUE"'';',
'',
unistr('//funci\00F3n que validad cuantos calculos son Predeterminados.'),
'function validaCalculaValorPredeterminada() {',
'    var region = apex.region(''calculavalor'');',
'    var o_mnsje_rspsta;',
'',
unistr('    console.log("Entrando a funci\00F3n que valida cuantos calculos son Predeterminados.");'),
'    if (region) {',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = model._data;',
'        var json = records.map( (calculavalor) => {',
'            return {',
'                "ID_SNCION": model.getValue(calculavalor, "ID_SNCION"),',
'                "SNCION_PRDTRMNDA": model.getValue(calculavalor, "SNCION_PRDTRMNDA")',
'            };',
'        }).filter(function (f) { return f.SNCION_PRDTRMNDA.v === ''S''});',
'    ',
'          ',
'        if (json.length > 1) {',
'            o_mnsje_rspsta = ''2 O MAS PREDETERMINADOS'';',
'            console.log("mensaje: "+o_mnsje_rspsta);',
'            region.widget().interactiveGrid("getActions").disable("save");',
'            apex.message.clearErrors();',
'            apex.message.showErrors ([',
'                {',
'                    type:       "error",',
'                    location:   [ "page"],//"page",',
'                    message:    o_mnsje_rspsta,',
'                    unsafe:     false',
'                }',
'            ]);',
'        }else if(json.length === 1) {',
'            o_mnsje_rspsta = ''1 PREDETERMINADO'';',
'            console.log("mensaje: "+o_mnsje_rspsta);',
'            region.widget().interactiveGrid("getActions").enable("save");',
'            apex.message.clearErrors();',
'            /*apex.message.showErrors ([',
'                {',
'                    type:       "error",',
'                    location:   "page",',
'                    message:    o_mnsje_rspsta,',
'                    unsafe:     false',
'                }',
'            ]);*/',
'            apex.submit( ''SAVE'' );',
'        }else if(json.length < 1) {',
'            o_mnsje_rspsta = ''no hay PREDETERMINADO'';',
'            console.log("mensaje: "+o_mnsje_rspsta);',
'            region.widget().interactiveGrid("getActions").enable("save");',
'            apex.message.clearErrors();',
'            /*apex.message.showErrors ([',
'                {',
'                    type:       "error",',
'                    location:   "page",',
'                    message:    o_mnsje_rspsta,',
'                    unsafe:     false',
'                }',
'            ]);*/',
'            apex.submit( ''SAVE'' );',
'        };',
'    }',
'}'))
,p_step_template=>wwv_flow_api.id(164066978207707637)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'700'
,p_dialog_width=>'70%'
,p_protection_level=>'C'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20250311144748'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55529873231376753)
,p_plug_name=>'Pantalla Basada en GI_D_SANCIONES'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55567373836431832)
,p_plug_name=>'Tributo'
,p_parent_plug_id=>wwv_flow_api.id(55529873231376753)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55567438031431833)
,p_plug_name=>'Vigencia-Periodo'
,p_parent_plug_id=>wwv_flow_api.id(55529873231376753)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55567567804431834)
,p_plug_name=>'Porcentajes '
,p_parent_plug_id=>wwv_flow_api.id(55529873231376753)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55655519882040614)
,p_plug_name=>unistr('Calculo Valor Sanci\00F3n ')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P122_ID_SNCION'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55553958839376987)
,p_plug_name=>unistr('Gesti\00F3n Sanciones_temp')
,p_region_name=>'calculavalor'
,p_parent_plug_id=>wwv_flow_api.id(55655519882040614)
,p_region_template_options=>'#DEFAULT#:margin-bottom-sm'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_sncion_clclo_vlr,',
'       id_sncion,',
'       vlor,',
'       cdgo_nmbre_vlor,',
'   ---    nmbre_vlor,',
'       id_indcdor_ecnmco,',
'       cdgo_indcdor_tpo,      ',
'       undad_vlor,',
'       INDCDOR_ECNMCO_ACTUAL,',
'       sncion_prdtrmnda',
'  from gi_d_sanciones_calculo_valor',
' where id_sncion = :P122_ID_SNCION'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P122_ID_SNCION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P122_ID_SNCION'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3622539177320044)
,p_name=>'SNCION_PRDTRMNDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNCION_PRDTRMNDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFSanci\00F3n Predeterminada?')
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
,p_filter_exact_match=>false
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
 p_id=>wwv_flow_api.id(19977916023279204)
,p_name=>'CDGO_INDCDOR_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_INDCDOR_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Indicador Econ\00F3mico')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_indcdor_tpo d,',
'        cdgo_indcdor_tpo r ',
'  from DF_S_INDICADORES_TIPO',
''))
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
 p_id=>wwv_flow_api.id(19978082968279205)
,p_name=>'INDCDOR_ECNMCO_ACTUAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_ECNMCO_ACTUAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFUsa valor indicador actual?')
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
,p_filter_exact_match=>false
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
 p_id=>wwv_flow_api.id(19978161289279206)
,p_name=>'ID_INDCDOR_ECNMCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INDCDOR_ECNMCO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(55555119879376994)
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
 p_id=>wwv_flow_api.id(55555670664377001)
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
 p_id=>wwv_flow_api.id(55556231151377009)
,p_name=>'ID_SNCION_CLCLO_VLR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SNCION_CLCLO_VLR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_enable_filter=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(55556865901377010)
,p_name=>'ID_SNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SNCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_enable_filter=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P122_ID_SNCION'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(55557435307377010)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor M\00EDnimo de la Sanci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(55558055191377011)
,p_name=>'NMBRE_VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_NMBRE_VLOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'NOMBRE VALOR'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion r,',
'        a.cdgo_nmbre_vlor b',
'from  gi_d_sancion_cdgo_clclo_vlor a'))
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(55559271587377013)
,p_name=>'UNDAD_VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNDAD_VLOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Unidad Valor M\00EDnimo Sanci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Fijo;Fijo,Indicador;Indicador'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(55554480158376988)
,p_internal_uid=>55554480158376988
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>false
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
 p_id=>wwv_flow_api.id(55554812774376992)
,p_interactive_grid_id=>wwv_flow_api.id(55554480158376988)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(55554973997376992)
,p_report_id=>wwv_flow_api.id(55554812774376992)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3862072879394013)
,p_view_id=>wwv_flow_api.id(55554973997376992)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(3622539177320044)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19990111665809372)
,p_view_id=>wwv_flow_api.id(55554973997376992)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(19977916023279204)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>141.517
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19990501856809376)
,p_view_id=>wwv_flow_api.id(55554973997376992)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(19978082968279205)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>205.517
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20054134522727851)
,p_view_id=>wwv_flow_api.id(55554973997376992)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(19978161289279206)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55556065817377002)
,p_view_id=>wwv_flow_api.id(55554973997376992)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(55555670664377001)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55556604226377010)
,p_view_id=>wwv_flow_api.id(55554973997376992)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(55556231151377009)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55557299916377010)
,p_view_id=>wwv_flow_api.id(55554973997376992)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(55556865901377010)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55557873013377010)
,p_view_id=>wwv_flow_api.id(55554973997376992)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(55557435307377010)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200.517
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55558483711377012)
,p_view_id=>wwv_flow_api.id(55554973997376992)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(55558055191377011)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55559611722377013)
,p_view_id=>wwv_flow_api.id(55554973997376992)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(55559271587377013)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55530374286376755)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(55529873231376753)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_redirect_url=>'javascript:apex.confirm(''Ã‚Â¿Esta Seguro de Eliminar la SanciÃƒÂ³n?'',''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P122_ID_SNCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55530253260376755)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(55529873231376753)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P122_ID_SNCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55530427094376755)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(55529873231376753)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:121:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55530193666376755)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(55529873231376753)
,p_button_name=>'CREATE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P122_ID_SNCION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(55532080857376783)
,p_branch_action=>'f?p=&APP_ID.:121:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55532408178376825)
,p_name=>'P122_ID_SNCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(55529873231376753)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_SNCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55532817067376840)
,p_name=>'P122_CDGO_CLNTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(55529873231376753)
,p_use_cache_before_default=>'NO'
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55533193464376850)
,p_name=>'P122_VGNCIA'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(55567438031431833)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vigencia:'
,p_source=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55533510807376851)
,p_name=>'P122_ID_PRDO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(55567438031431833)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Periodo:'
,p_source=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select  dscrpcion d, id_prdo r ',
'  from df_i_periodos',
'  where vgncia = :P122_VGNCIA',
'  and cdgo_clnte = :F_CDGO_CLNTE',
'  and id_impsto = :P122_ID_IMPSTO',
'  and id_impsto_sbmpsto = :P122_ID_IMPSTO_SBMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P122_ID_IMPSTO,P122_ID_IMPSTO_SBMPSTO,P122_VGNCIA'
,p_ajax_items_to_submit=>'P122_ID_IMPSTO,P122_ID_IMPSTO_SBMPSTO,P122_VGNCIA,P122_ID_PRDO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55533931885376851)
,p_name=>'P122_CDGO_SNCION_TPO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(55567373836431832)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Tipo de Sanci\00F3n:')
,p_source=>'CDGO_SNCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d,',
'        cdgo_sncion_tpo r ',
'  from gi_d_sanciones_tipo',
' order by cdgo_sncion_tpo'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55534356274376851)
,p_name=>'P122_PRCNTJE_TRFA'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(55567567804431834)
,p_use_cache_before_default=>'NO'
,p_prompt=>'% de la Tarifa '
,p_format_mask=>'990D999'
,p_source=>'PRCNTJE_TRFA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>5
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroComa'')" onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:4});"'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55534702622376851)
,p_name=>'P122_PRCNTJE_MXMO_INGR_BRT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(55567567804431834)
,p_use_cache_before_default=>'NO'
,p_source=>'PRCNTJE_MXMO_INGR_BRT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when_type=>'NEVER'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55535113068376852)
,p_name=>'P122_PRCNTJE_MXMO_IMPST_CRG'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(55567567804431834)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('% M\00E1ximo Impuesto a Cargo ')
,p_format_mask=>'990D999'
,p_source=>'PRCNTJE_MXMO_IMPST_CRG'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>5
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroComa'')" onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:4});"'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55535581759376852)
,p_name=>'P122_UNDAD_VLOR_SNCION_MNMO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(55529873231376753)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Undad Vlor Sncion Mnmo'
,p_source=>'UNDAD_VLOR_SNCION_MNMO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>9
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55535945462376852)
,p_name=>'P122_ID_INDCDOR_ECNMCO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(55529873231376753)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Indcdor Ecnmco'
,p_source=>'ID_INDCDOR_ECNMCO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55536388796376852)
,p_name=>'P122_VLOR_SNCION_MNMO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(55529873231376753)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vlor Sncion Mnmo'
,p_source=>'VLOR_SNCION_MNMO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55536727031376853)
,p_name=>'P122_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(55567373836431832)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tributo:'
,p_source=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55537195510376853)
,p_name=>'P122_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(55567373836431832)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sub-Tributo:'
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select initcap(NMBRE_IMPSTO_SBMPSTO)  as d, ID_IMPSTO_SBMPSTO as r',
'  from DF_I_IMPUESTOS_SUBIMPUESTO',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'  and  id_impsto = :P122_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P122_ID_IMPSTO'
,p_ajax_items_to_submit=>'P122_ID_IMPSTO,P122_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55537572856376853)
,p_name=>'P122_PRCNTJE_TRFA_INGRSO_BRTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(55567567804431834)
,p_use_cache_before_default=>'NO'
,p_source=>'PRCNTJE_TRFA_INGRSO_BRTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when_type=>'NEVER'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55537976917376853)
,p_name=>'P122_AUMNT_PRCNTJ_X_DCLRCN_INC_EXTM'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(55567567804431834)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('% Aumento x Declaraci\00F3n Inicial Extempor\00E1nea')
,p_format_mask=>'990D999'
,p_source=>'AUMNT_PRCNTJ_X_DCLRCN_INC_EXTM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>5
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroComa'')" onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:4});"'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55538321031376854)
,p_name=>'P122_PRCNTJE_TRFA_EMPL'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(55567567804431834)
,p_use_cache_before_default=>'NO'
,p_prompt=>'% de la Tarifa Emplazamiento'
,p_format_mask=>'990D999'
,p_source=>'PRCNTJE_TRFA_EMPL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>5
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroComa'')" onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:4});"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55538785137376855)
,p_name=>'P122_PRCNTJE_MXMO_INGR_BRT_EMPL'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(55567567804431834)
,p_use_cache_before_default=>'NO'
,p_source=>'PRCNTJE_MXMO_INGR_BRT_EMPL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when_type=>'NEVER'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55539169468376856)
,p_name=>'P122_PRCNTJE_MXMO_IMPST_CRG_EMPL'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(55567567804431834)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('% M\00E1ximo Impuesto a cargo con Emplazamiento')
,p_format_mask=>'990D999'
,p_source=>'PRCNTJE_MXMO_IMPST_CRG_EMPL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>5
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroComa'')" onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:4});"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55539522435376858)
,p_name=>'P122_PRCNTJE_TRFA_INGRSO_BRTO_EMPL'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(55567567804431834)
,p_use_cache_before_default=>'NO'
,p_source=>'PRCNTJE_TRFA_INGRSO_BRTO_EMPL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when_type=>'NEVER'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55551041965376954)
,p_name=>'P122_ID_SNCION_NEXT'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(55529873231376753)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_item_comment=>'Este elemento es necesario para el proceso Obtener Valor de Clave Primaria Anterior o Siguiente.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55551468285376954)
,p_name=>'P122_ID_SNCION_PREV'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(55529873231376753)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_item_comment=>'Este elemento es necesario para el proceso Obtener Valor de Clave Primaria Anterior o Siguiente.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55551873027376954)
,p_name=>'P122_ID_SNCION_COUNT'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(55529873231376753)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'Este elemento es necesario para el proceso Obtener Valor de Clave Primaria Anterior o Siguiente.'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(55655696266040615)
,p_validation_name=>'Nuevo'
,p_validation_sequence=>10
,p_validation=>'(:P122_PRCNTJE_TRFA >=0) and(:P122_PRCNTJE_TRFA <=1)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'EL porcentaje de la tarifa debe ser menor o igual al 100%.'
,p_associated_item=>wwv_flow_api.id(55534356274376851)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(55567742453431836)
,p_name=>'Al cambiar unidad'
,p_event_sequence=>10
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(55553958839376987)
,p_triggering_element=>'UNDAD_VLOR'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'UNDAD_VLOR'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Fijo'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(55567804057431837)
,p_event_id=>wwv_flow_api.id(55567742453431836)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'ID_INDCDOR_ECNMCO,CDGO_INDCDOR_TPO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(55567929654431838)
,p_event_id=>wwv_flow_api.id(55567742453431836)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'ID_INDCDOR_ECNMCO,CDGO_INDCDOR_TPO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19977705263279202)
,p_name=>unistr('Actualizar calculo valor sanci\00F3n')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P122_INDCDOR_ACTUAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19977845581279203)
,p_event_id=>wwv_flow_api.id(19977705263279202)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(55655519882040614)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3622675661320045)
,p_name=>unistr('Al guardar datos de la grilla validar que exista al menos una sanci\00F3n predeterminada')
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(55530253260376755)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3622778646320046)
,p_event_id=>wwv_flow_api.id(3622675661320045)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validaCalculaValorPredeterminada() ;'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55540367770376859)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from GI_D_SANCIONES'
,p_attribute_02=>'GI_D_SANCIONES'
,p_attribute_03=>'P122_ID_SNCION'
,p_attribute_04=>'ID_SNCION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55552899386376964)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_PAGINATION'
,p_process_name=>'Obtener Valor de Clave Primaria Anterior o Siguiente'
,p_attribute_02=>'GI_D_SANCIONES'
,p_attribute_03=>'P122_ID_SNCION'
,p_attribute_04=>'ID_SNCION'
,p_attribute_07=>'ID_SNCION'
,p_attribute_09=>'P122_ID_SNCION_NEXT'
,p_attribute_10=>'P122_ID_SNCION_PREV'
,p_attribute_13=>'P122_ID_SNCION_COUNT'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55540759449376863)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of GI_D_SANCIONES'
,p_attribute_02=>'GI_D_SANCIONES'
,p_attribute_03=>'P122_ID_SNCION'
,p_attribute_04=>'ID_SNCION'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55559862428377016)
,p_process_sequence=>35
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(55553958839376987)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Gesti\00F3n Sanciones_temp: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55541172317376863)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(55530374286376755)
);
end;
/
