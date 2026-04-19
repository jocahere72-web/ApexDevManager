prompt --application/pages/page_00032
begin
wwv_flow_api.create_page(
 p_id=>32
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Fiscalizaci\00F3n Puntual')
,p_page_mode=>'MODAL'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buildJsonVigencia(){',
'    ',
'     var region = apex.region(''vigencia'');',
'    ',
'    if(region) {',
'        ',
'        var view = apex.region("vigencia").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        var jsonarray = [];',
'',
'        records.forEach(function(vigencia){',
'            if(jsonarray.length > 0) {',
'                var condicion = false;',
'                var index;',
'                ',
'                jsonarray.forEach(function(e, i){',
'                    if(e.ID_IMPSTO == model.getValue(vigencia, "ID_IMPSTO") && e.ID_IMPSTO_SBMPSTO == model.getValue(vigencia, "ID_IMPSTO_SBMPSTO")) {',
'                        index = i;',
'                        condicion = true;',
'                    } ',
'                });',
'                ',
'                if(condicion) {',
'                    jsonarray[index].VGNCIA.push(',
'                        {',
'                            "VGNCIA": model.getValue(vigencia, "VGNCIA"),',
'                            "ID_PRDO": model.getValue(vigencia, "ID_PRDO"),',
'                            "DCLRCION_VGNCIA_FRMLRIO" : model.getValue(vigencia, "ID_DCLRCION_VGNCIA_FRMLRIO")',
'                        }',
'                    )',
'                }else{',
'                    ',
'                    jsonarray.push(',
'                        {',
'                            "ID_IMPSTO" : model.getValue(vigencia, "ID_IMPSTO"),',
'                            "ID_IMPSTO_SBMPSTO" : model.getValue(vigencia, "ID_IMPSTO_SBMPSTO"),',
'                            "ID_SJTO_IMPSTO" : model.getValue(vigencia, "ID_SJTO_IMPSTO"),',
'                            "VGNCIA": [',
'                                {',
'                                    "VGNCIA": model.getValue(vigencia, "VGNCIA"),',
'                                    "ID_PRDO": model.getValue(vigencia, "ID_PRDO"),',
'                                    "DCLRCION_VGNCIA_FRMLRIO" : model.getValue(vigencia, "ID_DCLRCION_VGNCIA_FRMLRIO")',
'                                }',
'                            ]',
'                        }',
'                    )    ',
'                }',
'                ',
'            }else{',
'                jsonarray.push(',
'                    {"ID_IMPSTO" : model.getValue(vigencia, "ID_IMPSTO"),',
'                     "ID_IMPSTO_SBMPSTO" : model.getValue(vigencia, "ID_IMPSTO_SBMPSTO"),',
'                     "ID_SJTO_IMPSTO" : model.getValue(vigencia, "ID_SJTO_IMPSTO"),',
'                     "VGNCIA": [',
'                         {',
'                             "VGNCIA": model.getValue(vigencia, "VGNCIA"),',
'                             "ID_PRDO": model.getValue(vigencia, "ID_PRDO"),',
'                             "DCLRCION_VGNCIA_FRMLRIO" : model.getValue(vigencia, "ID_DCLRCION_VGNCIA_FRMLRIO")',
'                         }',
'                     ]',
'                   }',
'                )',
'            }',
'            ',
'        });',
'        ',
'        window.localStorage.setItem(''jsonCandidato'', JSON.stringify(jsonarray));',
'    }',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20240621173222'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(61730318404569902)
,p_plug_name=>'Container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(61730464304569903)
,p_plug_name=>'Candidatos'
,p_region_name=>'vigencia'
,p_parent_plug_id=>wwv_flow_api.id(61730318404569902)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_impsto,',
'        a.id_impsto_sbmpsto,',
'        a.id_sjto_impsto,',
'        a.idntfccion_sjto,',
'        c.nmbre_rzon_scial,',
'        a.vgncia,',
'        a.id_prdo,',
'        b.prdo,',
'        a.id_dclrcion_vgncia_frmlrio',
'from v_fi_g_pblcion_omsos_cncdos a',
'join df_i_periodos               b  on  a.id_prdo   =   b.id_prdo',
'                                    and a.vgncia    =   b.vgncia',
'join si_i_personas               c  on  a.id_sjto_impsto    =   c.id_sjto_impsto',
'where not exists(',
'                    select      1',
'                    from        fi_g_fiscalizacion_expdnte i',
'                    inner join  fi_g_candidatos            j   on  i.id_cnddto = j.id_cnddto',
'                    inner join  fi_g_candidatos_vigencia   k   on  j.id_cnddto = k.id_cnddto',
'                    where       j.id_prgrma                 =   :P32_ID_PRGRMA',
'                    and         j.id_sbprgrma               =   :P32_ID_SBPRGRMA',
'                    and         i.cdgo_expdnte_estdo        in  (''ABT'', ''CER'')',
'                    and         k.id_dclrcion_vgncia_frmlrio=   a.id_dclrcion_vgncia_frmlrio',
'                    and         j.id_sjto_impsto            =   a.id_sjto_impsto',
'',
'                )',
'and a.idntfccion_sjto = :P32_IDNTFCCION_SJTO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(61730654258569905)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(61730759984569906)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(61730918017569908)
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
 p_id=>wwv_flow_api.id(61731057180569909)
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
 p_id=>wwv_flow_api.id(61731173111569910)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(61731290090569911)
,p_name=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION_VGNCIA_FRMLRIO'
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
 p_id=>wwv_flow_api.id(61731578487569914)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67416262875949901)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(67661043043672501)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(67661167389672502)
,p_name=>'NMBRE_RZON_SCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RZON_SCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Raz\00F3n Social')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(61730575494569904)
,p_internal_uid=>61730575494569904
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(61739726065613876)
,p_interactive_grid_id=>wwv_flow_api.id(61730575494569904)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(61739804588613876)
,p_report_id=>wwv_flow_api.id(61739726065613876)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1037573015569)
,p_view_id=>wwv_flow_api.id(61739804588613876)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(67661167389672502)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(61740378162613884)
,p_view_id=>wwv_flow_api.id(61739804588613876)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(61730654258569905)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(61740803819613888)
,p_view_id=>wwv_flow_api.id(61739804588613876)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(61730759984569906)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(61741805015613898)
,p_view_id=>wwv_flow_api.id(61739804588613876)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(61730918017569908)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(61742354659613900)
,p_view_id=>wwv_flow_api.id(61739804588613876)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(61731057180569909)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(61742815785613902)
,p_view_id=>wwv_flow_api.id(61739804588613876)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(61731173111569910)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(61743232648613903)
,p_view_id=>wwv_flow_api.id(61739804588613876)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(61731290090569911)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67422128100950381)
,p_view_id=>wwv_flow_api.id(61739804588613876)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(67416262875949901)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67667048293676378)
,p_view_id=>wwv_flow_api.id(61739804588613876)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(67661043043672501)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(61732632355569925)
,p_plug_name=>'Parametros'
,p_parent_plug_id=>wwv_flow_api.id(61730318404569902)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_plug_read_only_when=>'P32_ID_SJTO_IMPSTO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71134002140842701)
,p_plug_name=>'Candidatos Manual'
,p_parent_plug_id=>wwv_flow_api.id(61730318404569902)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select seq_id ',
'      , c001 as id_impsto',
'      , c002 as id_impsto_sbmpsto',
'      , c003 as id_sjto_impsto',
'      , c004 as idntfccion_sjto',
'      , c005 as nmbre_rzon_scial',
'      , c006 as vgncia',
'      , c007 as id_prdo',
'      , c008 as prdo',
'      , c009 as id_dclrcion_vgncia_frmlrio',
'   from apex_collections',
'  where collection_name = ''CANDIDATOS'''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P32_ID_PRGRMA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P32_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71135424701842715)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71135936004842720)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P32_ID_IMPSTO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71136029542842721)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P32_ID_IMPSTO_SBMPSTO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71136181093842722)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P32_ID_SJTO_IMPSTO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71136220602842723)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>4000
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
,p_default_type=>'ITEM'
,p_default_expression=>'P32_IDNTFCCION_SJTO'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71136393587842724)
,p_name=>'NMBRE_RZON_SCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RZON_SCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Raz\00F3n Social')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
,p_default_type=>'SQL_QUERY'
,p_default_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rzon_scial',
'  from si_i_personas a',
' where a.id_sjto_impsto = :P32_ID_SJTO_IMPSTO'))
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71136487100842725)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.vgncia as l',
'        , a.vgncia as v',
'     from (',
'                select vgncia',
'                     , rownum as n',
'                  from df_s_vigencias',
'                 where vgncia <= extract( year from sysdate )',
'              order by vgncia desc',
'        ) a',
'    where a.n <= (',
'                    select vlor',
'                      from df_i_definiciones_impuesto',
'                     where cdgo_clnte        = :F_CDGO_CLNTE',
'                       and id_impsto         = :P32_ID_IMPSTO',
'                       and cdgo_dfncn_impsto = ''ANI''',
'                 )'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'ID_IMPSTO'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71136536941842726)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select upper( a.prdo || '' - '' || a.dscrpcion || '' ('' || b.dscrpcion || '')'' ) as l',
'         , a.id_prdo as v',
'      from df_i_periodos a',
'      join df_s_periodicidad b',
'        on a.cdgo_prdcdad      = b.cdgo_prdcdad',
'     where a.cdgo_clnte        = :F_CDGO_CLNTE',
'       and a.id_impsto         = :ID_IMPSTO',
'       and a.id_impsto_sbmpsto = :ID_IMPSTO_SBMPSTO',
'       and a.vgncia            = :VGNCIA',
'       and (( :P32_CDGO_PRGRMA <> ''O''',
'       and exists (',
'                       select 1',
'                         from gi_g_declaraciones d',
'                        where d.cdgo_clnte        = a.cdgo_clnte  ',
'                          and d.id_impsto         = a.id_impsto  ',
'                          and d.id_impsto_sbmpsto = a.id_impsto_sbmpsto',
'                          and d.id_sjto_impsto    = :ID_SJTO_IMPSTO',
'                          and d.vgncia            = a.vgncia',
'                          and d.id_prdo           = a.id_prdo',
'                          and not d.cdgo_dclrcion_estdo in ( ''REG'' , ''AUT'' )',
'                  ))',
'        or ( :P32_CDGO_PRGRMA = ''O'' ',
'       and not exists (',
'                           select a.id_prdo',
'                             from gi_g_declaraciones d',
'                            where d.cdgo_clnte        = a.cdgo_clnte  ',
'                              and d.id_impsto         = a.id_impsto  ',
'                              and d.id_impsto_sbmpsto = a.id_impsto_sbmpsto',
'                              and d.id_sjto_impsto    = :ID_SJTO_IMPSTO',
'                              and d.vgncia            = a.vgncia',
'                              and d.id_prdo           = a.id_prdo',
'                              and not d.cdgo_dclrcion_estdo in ( ''REG'' , ''AUT'' )',
'                      )))',
'  order by b.cntdad_vce_anio',
'         , a.prdo'))
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ID_IMPSTO,ID_IMPSTO_SBMPSTO,VGNCIA,ID_SJTO_IMPSTO'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71136713113842728)
,p_name=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(72111939605007908)
,p_name=>'SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(72112784546007916)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(71134978455842710)
,p_internal_uid=>71134978455842710
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
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
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
 p_id=>wwv_flow_api.id(71310234975479596)
,p_interactive_grid_id=>wwv_flow_api.id(71134978455842710)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(71310346983479596)
,p_report_id=>wwv_flow_api.id(71310234975479596)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71313593708493289)
,p_view_id=>wwv_flow_api.id(71310346983479596)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(71135424701842715)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71352650019865996)
,p_view_id=>wwv_flow_api.id(71310346983479596)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(71135936004842720)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71353140754866010)
,p_view_id=>wwv_flow_api.id(71310346983479596)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(71136029542842721)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71353620458866013)
,p_view_id=>wwv_flow_api.id(71310346983479596)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(71136181093842722)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71354131610866015)
,p_view_id=>wwv_flow_api.id(71310346983479596)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(71136220602842723)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>136
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71354678218866021)
,p_view_id=>wwv_flow_api.id(71310346983479596)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(71136393587842724)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>342
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71355126472866023)
,p_view_id=>wwv_flow_api.id(71310346983479596)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(71136487100842725)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71355686160866025)
,p_view_id=>wwv_flow_api.id(71310346983479596)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(71136536941842726)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>260
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71356687769866029)
,p_view_id=>wwv_flow_api.id(71310346983479596)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(71136713113842728)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>167
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(72525178177058151)
,p_view_id=>wwv_flow_api.id(71310346983479596)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(72111939605007908)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(72785553613214975)
,p_view_id=>wwv_flow_api.id(71310346983479596)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(72112784546007916)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72114123690007930)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(71134002140842701)
,p_button_name=>'BTN_INCIAR_FSCLZCION_MNUAL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Iniciar Fiscalizaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de iniciar el proceso de FiscalizaciÃ³n?'', ''BTN_INCIAR_FSCLZCION_MNUAL'');'
,p_icon_css_classes=>'fa-play'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(61732513786569924)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(61732632355569925)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P32_ID_SJTO_IMPSTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(61732740936569926)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(61730464304569903)
,p_button_name=>'BTN_INCIAR_FSCLZCION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Iniciar Fiscalizaci\00F3n')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      g.id_dclrcion_vgncia_frmlrio,',
'            trunc(',
'                    pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion (p_id_dclrcion_vgncia_frmlrio =>  g.id_dclrcion_vgncia_frmlrio,',
'                                                                    p_idntfccion =>  a.idntfccion_sjto,',
'                                                                    p_id_sjto_tpo =>  b.id_sjto_tpo)',
'                 ) fcha_mxma_prsntcion',
'from        v_si_i_sujetos_impuesto     a',
'inner join  si_i_personas               b   on  b.id_sjto_impsto        =   a.id_sjto_impsto',
'inner join  gi_d_declaraciones_tipo     c   on  c.cdgo_clnte            =   a.cdgo_clnte',
'                                            and c.id_impsto             =   a.id_impsto',
'inner join  df_s_periodicidad           d   on  d.cdgo_prdcdad          =   c.cdgo_prdcdad',
'inner join  gi_d_dclrcnes_tpos_sjto     e   on  e.id_dclrcn_tpo         =   c.id_dclrcn_tpo',
'                                            and e.id_sjto_tpo           =   b.id_sjto_tpo',
'inner join  gi_d_dclrcnes_tpos_vgncias  f   on  f.id_dclrcn_tpo         =   c.id_dclrcn_tpo',
'inner join  gi_d_dclrcnes_vgncias_frmlr g   on  g.id_dclrcion_tpo_vgncia=   f.id_dclrcion_tpo_vgncia',
'where       not exists(--Valida que no haya declarado',
'                        select  1',
'                        from    gi_g_declaraciones  h',
'                        where   h.id_dclrcion_vgncia_frmlrio    =   g.id_dclrcion_vgncia_frmlrio',
'                        and     h.id_sjto_impsto                =   a.id_sjto_impsto',
'                        and     h.cdgo_dclrcion_estdo           in  (''RLA'', ''PRS'', ''APL'', ''FRM'')',
'                        and     h.id_cnddto_vgncia              is  null',
'                      )',
unistr('and         trunc(--Valida que la fecha limite de presentaci\00F3n sea menor a la fecha actual'),
'                    pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion (p_id_dclrcion_vgncia_frmlrio =>  g.id_dclrcion_vgncia_frmlrio,',
'                                                                    p_idntfccion =>  a.idntfccion_sjto,',
'                                                                    p_id_sjto_tpo =>  b.id_sjto_tpo)',
'                 ) < trunc(systimestamp)',
'and         not exists(--Valida que no haya un expediente en general o para un programa especifico',
'                        select      1',
'                        from        fi_g_fiscalizacion_expdnte i',
'                        inner join  fi_g_candidatos            j   on  i.id_cnddto = j.id_cnddto',
'                        inner join  fi_g_candidatos_vigencia   k   on  j.id_cnddto = k.id_cnddto',
'                        where       j.id_prgrma                 =   nvl(:p_id_prgrma, j.id_prgrma)',
'                        and         i.cdgo_expdnte_estdo        =   ''APT''',
'                        and         k.id_dclrcion_vgncia_frmlrio=   g.id_dclrcion_vgncia_frmlrio',
'                        and         j.id_sjto_impsto            =   a.id_sjto_impsto',
'                      )',
unistr('and         floor(--Valida los anios que deben ser cumplidos para poder aplicar a fiscalizaci\00F3n'),
'                    months_between(',
'                                    trunc(systimestamp),',
'                                    trunc(',
'                                            pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion (p_id_dclrcion_vgncia_frmlrio =>  g.id_dclrcion_vgncia_frmlrio,',
'                                                                                            p_idntfccion =>  a.idntfccion_sjto,',
'                                                                                            p_id_sjto_tpo =>  b.id_sjto_tpo)',
'                                         )                                    ',
'                                  )',
'                    / 12',
'                 )                  <=  nvl(:p_mxmo_anios, 5)',
'--Condiciones en general',
'and         a.cdgo_sjto_estdo       =   ''A''',
'and         g.actvo                 =   ''S''',
'and         a.idntfccion_sjto       =   :P32_IDNTFCCION_SJTO;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-play'
,p_grid_new_grid=>false
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72114045856007929)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(61732632355569925)
,p_button_name=>'BTN_NUEVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Nueva Consulta'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP,32::'
,p_button_condition=>'P32_ID_SJTO_IMPSTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(72114373494007932)
,p_branch_name=>'Ir la pagina 79'
,p_branch_action=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,11::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72114123690007930)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(61973415927252501)
,p_branch_name=>'Ir a la pagina 11'
,p_branch_action=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'modal'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61732115468569920)
,p_name=>'P32_ID_PRGRMA'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(61732632355569925)
,p_prompt=>'Programa'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_PROGRAMAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  p.nmbre_prgrma as d,',
'        p.id_prgrma as r',
'from fi_d_programas p;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61732273030569921)
,p_name=>'P32_ID_SBPRGRMA'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(61732632355569925)
,p_prompt=>'SubPrograma'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_sbprgrma as d,',
'       id_sbprgrma    as r',
'from fi_d_subprogramas ',
'where id_prgrma = :P32_ID_PRGRMA',
'and actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P32_ID_PRGRMA'
,p_ajax_items_to_submit=>'P32_ID_SBPRGRMA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61732426796569923)
,p_name=>'P32_IDNTFCCION_SJTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(61732632355569925)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71136834716842729)
,p_name=>'P32_ID_SJTO_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(61732632355569925)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71136997944842730)
,p_name=>'P32_ID_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(61732632355569925)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto',
'     , b.id_impsto',
'  from fi_d_programas_impuesto a',
'  join df_c_impuestos b',
'    on a.id_impsto = b.id_impsto',
' where a.id_prgrma = :P32_ID_PRGRMA'))
,p_lov_cascade_parent_items=>'P32_ID_PRGRMA'
,p_ajax_items_to_submit=>'P32_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71137099907842731)
,p_name=>'P32_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(61732632355569925)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto_sbmpsto',
'     , a.id_impsto_sbmpsto',
'  from df_i_impuestos_subimpuesto a',
' where a.id_impsto = :P32_ID_IMPSTO'))
,p_lov_cascade_parent_items=>'P32_ID_IMPSTO'
,p_ajax_items_to_submit=>'P32_ID_IMPSTO_SBMPSTO,P32_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71137727402842738)
,p_name=>'P32_CDGO_PRGRMA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(61732632355569925)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(71138602714842747)
,p_validation_name=>'Validar Impuesto'
,p_validation_sequence=>40
,p_validation=>'P32_ID_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(61732513786569924)
,p_associated_item=>wwv_flow_api.id(71136997944842730)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(71138754392842748)
,p_validation_name=>'Validar SubImpuesto'
,p_validation_sequence=>50
,p_validation=>'P32_ID_IMPSTO_SBMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_associated_item=>wwv_flow_api.id(71137099907842731)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72111366931007902)
,p_validation_name=>unistr('Validar Identificaci\00F3n')
,p_validation_sequence=>60
,p_validation=>'P32_IDNTFCCION_SJTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_associated_item=>wwv_flow_api.id(61732426796569923)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(61733036684569929)
,p_name=>'Al seleccionar una vigencia'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(61730464304569903)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(61733134760569930)
,p_event_id=>wwv_flow_api.id(61733036684569929)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buildJsonVigencia();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(61950515726516001)
,p_name=>unistr('Iniciar Fiscalizaci\00F3n')
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(61732740936569926)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(61950628423516002)
,p_event_id=>wwv_flow_api.id(61950515726516001)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function abrirExpediente() {',
'    try {',
'        var json = JSON.parse(window.localStorage.jsonCandidato);',
'        ',
'        if (json.length > 0) {',
'            await apex.server.process("ajaxAbrirExpediente", {',
'            f01: window.localStorage.jsonCandidato,',
'            pageItems: "#F_CDGO_CLNTE, #F_ID_FNCNRIO, #P32_ID_PRGRMA, #P32_ID_SBPRGRMA"',
'            },{',
'                success: function(data) {',
'                    if(data.o_cdgo_rspsta > 0) {',
'                        apex.message.clearErrors();',
'                        apex.message.showErrors([',
'                            {',
'                                type:       "error",',
'                                location:   "page",',
'                                message:    data.o_mnsje_rspsta,',
'                                unsafe:     false',
'                            }',
'                        ]);',
'                    }else{',
unistr('                        apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                        apex.submit({request : "modal"});',
'                    }',
'                }',
'            })',
'        ',
'        }else{',
'            apex.message.clearErrors();',
'            apex.message.showErrors([',
'                {',
'                    type:       "alert",',
'                    location:   "page",',
unistr('                    message:    "Seleccione las vigencias per\00EDodos del candidato que se van a fiscalizar",'),
'                    unsafe:     false',
'                }',
'            ]);',
'        }',
'    } catch(e) {',
'        console.log(e);',
'    }',
'}',
'',
unistr('apex.message.confirm("\00BFEst\00E1 seguro de iniciar el proceso de Fiscalizaci\00F3n?", function(okPressed) {'),
'   if(okPressed) {',
'       abrirExpediente();',
'   } ',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(71137591596842736)
,p_name=>unistr('Busca C\00F3digo Programa')
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P32_ID_PRGRMA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71137645495842737)
,p_event_id=>wwv_flow_api.id(71137591596842736)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'   select cdgo_prgrma ',
'     into :P32_CDGO_PRGRMA',
'     from fi_d_programas ',
'    where id_prgrma = :P32_ID_PRGRMA;',
'exception',
'      when no_data_found then ',
'           :P32_CDGO_PRGRMA := null;',
'end;'))
,p_attribute_02=>'P32_CDGO_PRGRMA,P32_ID_PRGRMA'
,p_attribute_03=>'P32_CDGO_PRGRMA'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(72113194321007920)
,p_name=>'Al Guardar Candidato'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(71134002140842701)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridsave'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(72113263124007921)
,p_event_id=>wwv_flow_api.id(72113194321007920)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(71134002140842701)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(72113431466007923)
,p_name=>'Al Cambiar Impuesto'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P32_ID_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(72111481945007903)
,p_event_id=>wwv_flow_api.id(72113431466007923)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    apex_collection.create_or_truncate_collection( p_collection_name => ''CANDIDATOS'' );',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(72113363421007922)
,p_event_id=>wwv_flow_api.id(72113431466007923)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(71134002140842701)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(71138920574842750)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Busca los Datos del Sujeto Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'   select a.id_sjto_impsto',
'     into :P32_ID_SJTO_IMPSTO',
'     from v_si_i_sujetos_impuesto a',
'    where a.cdgo_clnte      = :F_CDGO_CLNTE',
'      and a.idntfccion_sjto = :P32_IDNTFCCION_SJTO',
'      and a.id_impsto       = :P32_ID_IMPSTO;',
'exception',
'     when others then ',
'          raise_application_error(-20326,''El Sujeto Impuesto no existe, por favor verifique.'');',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(61732513786569924)
,p_process_success_message=>'Sujeto Impuesto Encontrado.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(71135695496842717)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(71134002140842701)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Crud de Candidatos Manual'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_collection_name varchar2(10) := ''CANDIDATOS'';',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(4000);',
'begin',
'    ',
'    --Crud de Candidato Manual',
'    pkg_fi_fiscalizacion.prc_cd_cnddato_mnual( p_collection_name   => v_collection_name',
'                                             , p_seq_id            => :SEQ_ID',
'                                             , p_status            => :APEX$ROW_STATUS',
'                                             , p_cdgo_prgrma       => :P32_CDGO_PRGRMA',
'                                             , p_cdgo_clnte        => :F_CDGO_CLNTE',
'                                             , p_id_impsto         => :ID_IMPSTO ',
'                                             , p_id_impsto_sbmpsto => :ID_IMPSTO_SBMPSTO',
'                                             , p_id_sjto_impsto    => :ID_SJTO_IMPSTO',
'                                             , p_vgncia            => :VGNCIA  ',
'                                             , p_id_prdo           => :ID_PRDO ',
'                                             , p_idntfccion_sjto   => :IDNTFCCION_SJTO ',
'                                             , p_nmbre_rzon_scial  => :NMBRE_RZON_SCIAL',
'                                             , o_cdgo_rspsta       => v_cdgo_rspsta',
'                                             , o_mnsje_rspsta      => v_mnsje_rspsta );',
'    ',
'    --Verifica si Hubo Error',
'    if( v_cdgo_rspsta <> 0 ) then',
'        raise_application_error( -20001 , v_mnsje_rspsta );',
'    end if;           ',
'end;'))
,p_attribute_05=>'Y'
,p_attribute_06=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_INCIAR_FSCLZCION_MNUAL'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_exec_cond_for_each_row=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72114254665007931)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Abrir Expediente Manual'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cnddtos      number;',
'    v_cdgo_fljo    varchar2(5);',
'    v_cnddato      clob;',
'    v_id_cnddto    number;',
'    v_cdgo_rspsta  number;',
'    v_mnsje_rspsta varchar2(4000);',
'begin',
'    ',
'    --Busca si Exites Candidatos en la Coleccion',
'    select count(*)',
'      into v_cnddtos  ',
'      from apex_collections',
'     where collection_name = ''CANDIDATOS'';',
'    ',
'    --Verifica si no hay Candidados',
'    if( v_cnddtos = 0 ) then ',
'        raise_application_error( -20001 , ''No hay datos de candidatos ingresado, por favor verifique.'' );',
'    end if;',
'    ',
'    --Busca los Datos del Flujo',
'    begin',
'        select cdgo_fljo',
'          into v_cdgo_fljo',
'          from wf_d_flujos',
'         where id_fljo = (',
'                             select id_fljo',
'                               from fi_d_programas',
'                              where id_prgrma = :P32_ID_PRGRMA',
'                         );',
'    exception',
'        when no_data_found then',
'             raise_application_error( -20002 , ''No se encontro parametrizado el flujo del programa seleccionado.'' );',
'        when others then',
unistr('             raise_application_error( -20003 , ''Problemas al obtener el c\00F3digo del flujo.'' );'),
'    end;',
'    ',
'    --Construye el Json',
'    select json_array ( ',
'                            json_object( ''ID_IMPSTO''         value a.id_impsto',
'                                       , ''ID_IMPSTO_SBMPSTO'' value a.id_impsto_sbmpsto',
'                                       , ''ID_SJTO_IMPSTO''    value a.id_sjto_impsto',
'                                       , ''VGNCIA''            value json_arrayagg(',
'                                                                                      json_object( ''VGNCIA''                  value a.vgncia',
'                                                                                                 , ''ID_PRDO''                 value a.id_prdo',
'                                                                                                 , ''DCLRCION_VGNCIA_FRMLRIO'' value a.id_dclrcion_vgncia_frmlrio',
'                                                                                                 , ''ID_DCLRCION''             value a.id_dclrcion',
'                                                                                                 , ''ID_SJTO_IMPSTO''          value a.id_sjto_impsto)',
'                                                                                          order by a.vgncia',
'                                                                                                 , a.prdo              ',
'                                                                                         returning clob',
'                                                                                 )',
'                                           returning clob',
'                                        )',
'                    )',
'    into v_cnddato ',
'    from (',
'             select seq_id ',
'                  , c001 as id_impsto',
'                  , c002 as id_impsto_sbmpsto',
'                  , c003 as id_sjto_impsto',
'                  , c004 as idntfccion_sjto',
'                  , c005 as nmbre_rzon_scial',
'                  , c006 as vgncia',
'                  , c007 as id_prdo',
'                  , c008 as prdo',
'                  , c009 as id_dclrcion_vgncia_frmlrio',
'                  , c010 as id_dclrcion',
'               from apex_collections',
'              where collection_name = ''CANDIDATOS''',
'         ) a',
'  group by a.id_impsto',
'         , a.id_impsto_sbmpsto',
'         , a.id_sjto_impsto;',
'    ',
'    --Registra Candidato',
'    pkg_fi_fiscalizacion.prc_rg_candidato( p_cdgo_clnte	  => :F_CDGO_CLNTE',
'                                         , p_id_fncnrio   => :F_ID_FNCNRIO',
'                                         , p_cnddto       => v_cnddato',
'                                         , p_funcionario  => :F_ID_FNCNRIO',
'                                         , p_prgrma       => :P32_ID_PRGRMA',
'                                         , p_sbprgrma     => :P32_ID_SBPRGRMA',
'                                         , o_id_cnddto    => v_id_cnddto',
'                                         , o_cdgo_rspsta  => v_cdgo_rspsta',
'                                         , o_mnsje_rspsta => v_mnsje_rspsta);',
'                                         ',
'   --Verifica si Hubo Error',
'   if v_cdgo_rspsta <> 0 then',
'        raise_application_error( -20004 , v_mnsje_rspsta );',
'   end if;',
'        ',
unistr('   --Registra el Expendiente de Fiscalizaci\00F3n'),
'   pkg_fi_fiscalizacion.prc_rg_expediente( p_cdgo_clnte	  => :F_CDGO_CLNTE',
'                                         , p_id_usrio     => :F_ID_USRIO',
'                                         , p_id_fncnrio   => :F_ID_FNCNRIO',
'                                         , p_id_cnddto    => v_id_cnddto',
'                                         , p_cdgo_fljo    => v_cdgo_fljo',
'                                         , p_json         => v_cnddato',
'                                         , o_cdgo_rspsta  => v_cdgo_rspsta',
'                                         , o_mnsje_rspsta => v_mnsje_rspsta );',
'   ',
'   --Verifica si Hubo Error',
'   if v_cdgo_rspsta <> 0 then',
'        raise_application_error( -20005 , v_mnsje_rspsta );',
'   end if;',
'   ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(72114123690007930)
,p_process_success_message=>unistr('Acci\00F3n procesada con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(61950764389516003)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajaxAbrirExpediente'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_id_cnddto       number;',
'    v_cdgo_fljo       varchar2(5);',
'    v_mnsje_rspsta    varchar2(1000);',
'    v_cnddato         clob;',
'    v_exception       exception;',
'begin',
'    ',
'    for i in 1..apex_application.g_f01.count loop',
'        v_cnddato := v_cnddato || apex_application.g_f01(i);',
'    end loop;',
'    ',
'    begin',
'        ',
'        if :P32_ID_PRGRMA is null or :P32_ID_SBPRGRMA is null then',
'            v_cdgo_rspsta := 1;',
'            v_mnsje_rspsta := ''Seleccione el programa y subprograma'';',
'            raise v_exception;',
'       end if;',
'       ',
'        begin',
'            select cdgo_fljo',
'            into v_cdgo_fljo',
'            from wf_d_flujos',
'            where id_fljo = (select id_fljo from fi_d_programas',
'                             where id_prgrma = :P32_ID_PRGRMA);',
'        exception',
'            when no_data_found then',
'                v_cdgo_rspsta := 2;',
'                v_mnsje_rspsta := ''No se encontro parametrizado el flujo del programa seleccionado'';',
'                raise v_exception;',
'            when others then',
'                v_cdgo_rspsta := 3;',
unistr('                v_mnsje_rspsta := ''Problemas al obtener el c\00F3digo del flujo'';'),
'                 raise v_exception;',
'        end;',
'                         ',
'        pkg_fi_fiscalizacion.prc_rg_candidato(p_cdgo_clnte	   => :F_CDGO_CLNTE,',
'                                              p_id_fncnrio     => :F_ID_FNCNRIO,',
'                                              p_cnddto         => v_cnddato,',
'                                              p_funcionario    => :F_ID_FNCNRIO,',
'                                              p_prgrma         => :P32_ID_PRGRMA,',
'                                              p_sbprgrma       => :P32_ID_SBPRGRMA,',
'                                              o_id_cnddto      => v_id_cnddto,',
'                                              o_cdgo_rspsta    => v_cdgo_rspsta,',
'                                              o_mnsje_rspsta   => v_mnsje_rspsta);',
'    ',
'        if v_cdgo_rspsta > 0 then',
'            raise v_exception;',
'        end if;',
'   ',
'        pkg_fi_fiscalizacion.prc_rg_expediente(p_cdgo_clnte	     => :F_CDGO_CLNTE,',
'                                               p_id_usrio        => :F_ID_FNCNRIO,',
'                                               p_id_cnddto       => v_id_cnddto,',
'                                               p_cdgo_fljo       => v_cdgo_fljo,',
'                                               p_json            => v_cnddato,',
'                                               o_cdgo_rspsta     => v_cdgo_rspsta,',
'                                               o_mnsje_rspsta    => v_mnsje_rspsta);',
'        ',
'         if v_cdgo_rspsta > 0 then',
'            raise v_exception;',
'         end if;',
'         ',
'         apex_json.open_object;',
'         apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'         apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'         apex_json.close_object;',
'         ',
'    exception',
'        when v_exception then',
'            rollback;',
'            apex_json.open_object;',
'            apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'            apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'            apex_json.close_object;',
'    end;',
'',
'    ',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
