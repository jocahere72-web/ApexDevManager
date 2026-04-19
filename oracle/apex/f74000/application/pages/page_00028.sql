prompt --application/pages/page_00028
begin
wwv_flow_api.create_page(
 p_id=>28
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>'Programa Sancionatorio Funcionario'
,p_page_mode=>'MODAL'
,p_step_title=>'Asignar Funcionario'
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
'        var records = model._data;',
'        ',
'        var jsonVigencia = records.map((vigencia) => {',
'            return {"ID_CNDDTO_PDRE" : model.getValue(vigencia, "ID_CNDDTO"),',
'                    "ID_IMPSTO" : model.getValue(vigencia, "ID_IMPSTO"),',
'                    "ID_IMPSTO_SBMPSTO" : model.getValue(vigencia, "ID_IMPSTO_SBMPSTO"),',
'                    "ID_SJTO_IMPSTO" : model.getValue(vigencia, "ID_SJTO_IMPSTO"),',
'                    "ID_PRGRMA" : $("#P28_ID_PRGRMA").val(),',
'                    "ID_SBPRGRMA" : model.getValue(vigencia, "ID_SBPRGRMA").v,',
'                    "ID_INSTNCIA_FLJO_PDRE" : model.getValue(vigencia, "ID_INSTNCIA_FLJO"),',
'                    "ID_FSCLZCION_EXPDNTE" : model.getValue(vigencia, "ID_FSCLZCION_EXPDNTE"),',
'                    "VGNCIA":[',
'                                {',
'                                    "VGNCIA": model.getValue(vigencia, "VGNCIA"),',
'                                    "ID_PRDO": model.getValue(vigencia, "ID_PRDO"),',
'                                    "DCLRCION_VGNCIA_FRMLRIO" : model.getValue(vigencia, "ID_DCLRCION_VGNCIA_FRMLRIO"),',
'                                    "ID_DCLRCION" : model.getValue(vigencia, "ID_DCLRCION"),',
'                                    "ID_SJTO_IMPSTO" : model.getValue(vigencia, "ID_SJTO_IMPSTO")',
'                                }',
'                             ]',
'                   }; ',
'        });',
'        ',
'        $s(''P28_JSON'', JSON.stringify(jsonVigencia));',
'        ',
'        return jsonVigencia.filter(function(f,i,r){return f.ID_SBPRGRMA === ""}).length;',
'        ',
'    }',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'100%'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20230531165523'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(60865923529777213)
,p_plug_name=>'Contenedor'
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
 p_id=>wwv_flow_api.id(27037387803996407)
,p_plug_name=>'Declaraciones Presentadas'
,p_region_name=>'vigencia'
,p_parent_plug_id=>wwv_flow_api.id(60865923529777213)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * ',
'from (',
'        select a.cdgo_clnte,',
'               a.id_dclrcion,',
'               a.nmro_cnsctvo,',
'               m.dscrpcion,',
'               c.id_cnddto,',
'               c.id_impsto,',
'               c.id_impsto_sbmpsto,',
'               c.id_sjto_impsto,',
'               c.id_prgrma,',
'               n.id_fsclzcion_expdnte,',
'               n.id_instncia_fljo,',
'               a.vgncia,',
'               d.prdo,',
'               a.id_prdo,',
'               a.id_dclrcion_vgncia_frmlrio,',
'               (',
'                    select to_number(csan)',
'                    from json_table (pkg_gi_declaraciones.fnc_gn_json_propiedades(''FIS'', a.id_dclrcion),''$[*]''',
'                         columns(csan varchar2 path ''$.CSAN''))',
'                ) as sncion_impsta,',
'                (',
'                    select to_number(vasa)',
'                    from json_table (pkg_gi_declaraciones.fnc_gn_json_propiedades(''FIS'', a.id_dclrcion),''$[*]''',
'                         columns(vasa varchar2 path ''$.VASA''))',
'                ) as sncion_dclrda',
'    ',
'        from gi_g_declaraciones                     a',
'        join v_fi_g_fiscalizacion_expdnte_dtlle     b   on a.id_dclrcion          =   b.id_dclrcion',
'        join v_fi_g_candidatos            c   on  b.id_cnddto                     =   c.id_cnddto',
'        join df_i_periodos                d   on  a.id_prdo                       =   d.id_prdo',
'        join  gi_d_dclrcnes_vgncias_frmlr k   on  a.id_dclrcion_vgncia_frmlrio    =   k.id_dclrcion_vgncia_frmlrio',
'        join  gi_d_dclrcnes_tpos_vgncias  l   on  k.id_dclrcion_tpo_vgncia        =   l.id_dclrcion_tpo_vgncia',
'        join  gi_d_declaraciones_tipo     m   on  l.id_dclrcn_tpo                 =   m.id_dclrcn_tpo',
'        join  fi_g_fiscalizacion_expdnte  n   on  c.id_cnddto                     =   n.id_cnddto',
'        where a.cdgo_clnte = :F_CDGO_CLNTE',
'        and c.id_cnddto = :P28_ID_CNDDTO ',
'        and a.cdgo_dclrcion_estdo in (''PRS'', ''APL'')',
') x',
'where x.sncion_dclrda != 0',
'or  x.sncion_impsta - x.sncion_dclrda >= (select j.vlr_sncion',
'                                            from fi_d_programas_sancion j',
'                                            where j.cdgo_clnte = :F_CDGO_CLNTE',
'                                            and j.id_prgrma = x.id_prgrma);'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(13536949404406005)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(13537072216406006)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
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
 p_id=>wwv_flow_api.id(13537180501406007)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(13538251748406018)
,p_name=>'ID_DCLRCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(13582815918680403)
,p_name=>'ID_FSCLZCION_EXPDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FSCLZCION_EXPDNTE'
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
 p_id=>wwv_flow_api.id(13582922622680404)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
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
 p_id=>wwv_flow_api.id(13614400848702205)
,p_name=>'ID_SBPRGRMA'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'SubProgramas'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_sbprgrma as d,',
'       a.id_sbprgrma as r',
'from fi_d_subprogramas a',
'where a.id_prgrma = :P28_ID_PRGRMA;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(27037549788996409)
,p_name=>'ID_CNDDTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNDDTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(27037660129996410)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(27037765733996411)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(27037833000996412)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(27037921666996413)
,p_name=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(27038315079996417)
,p_name=>'NMRO_CNSCTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNSCTVO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('No. Declaraci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(27038453361996418)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Declaraci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(27066633224787407)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
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
 p_id=>wwv_flow_api.id(27066789773787408)
,p_name=>'ID_PRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRGRMA'
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
 p_id=>wwv_flow_api.id(27066827186787409)
,p_name=>'SNCION_IMPSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNCION_IMPSTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Sanci\00F3n Impuesta')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(27066910084787410)
,p_name=>'SNCION_DCLRDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNCION_DCLRDA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Sanci\00F3n Declarada')
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(27037473005996408)
,p_internal_uid=>27037473005996408
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
 p_id=>wwv_flow_api.id(27042923042003790)
,p_interactive_grid_id=>wwv_flow_api.id(27037473005996408)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(27043010602003794)
,p_report_id=>wwv_flow_api.id(27042923042003790)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13550041155513294)
,p_view_id=>wwv_flow_api.id(27043010602003794)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(13536949404406005)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13550561973513298)
,p_view_id=>wwv_flow_api.id(27043010602003794)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(13537072216406006)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13551058443513300)
,p_view_id=>wwv_flow_api.id(27043010602003794)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(13537180501406007)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13578658410600714)
,p_view_id=>wwv_flow_api.id(27043010602003794)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(13538251748406018)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13590312869049845)
,p_view_id=>wwv_flow_api.id(27043010602003794)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(13582815918680403)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13590804209049854)
,p_view_id=>wwv_flow_api.id(27043010602003794)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(13582922622680404)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13628002408442964)
,p_view_id=>wwv_flow_api.id(27043010602003794)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(13614400848702205)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27043574517003806)
,p_view_id=>wwv_flow_api.id(27043010602003794)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(27037549788996409)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27044038101003813)
,p_view_id=>wwv_flow_api.id(27043010602003794)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(27037660129996410)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>71
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27044544002003815)
,p_view_id=>wwv_flow_api.id(27043010602003794)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(27037765733996411)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>64
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27044899332003816)
,p_view_id=>wwv_flow_api.id(27043010602003794)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(27037833000996412)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27045482517003818)
,p_view_id=>wwv_flow_api.id(27043010602003794)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(27037921666996413)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27053422391358575)
,p_view_id=>wwv_flow_api.id(27043010602003794)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(27038315079996417)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>108
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27053964044358579)
,p_view_id=>wwv_flow_api.id(27043010602003794)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(27038453361996418)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>556
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27072771071787676)
,p_view_id=>wwv_flow_api.id(27043010602003794)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(27066633224787407)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27073300211787680)
,p_view_id=>wwv_flow_api.id(27043010602003794)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(27066789773787408)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27073981845787687)
,p_view_id=>wwv_flow_api.id(27043010602003794)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(27066827186787409)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>127
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27074556406787688)
,p_view_id=>wwv_flow_api.id(27043010602003794)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(27066910084787410)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>124
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(60865372538777207)
,p_plug_name=>'Subprogramas Funcionario'
,p_parent_plug_id=>wwv_flow_api.id(60865923529777213)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(60865835717777212)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(60865923529777213)
,p_button_name=>'BTN_RGSTRAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(60866134785777215)
,p_branch_name=>'Ir a la pagina '
,p_branch_action=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13536639996406002)
,p_name=>'P28_ID_CNDDTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(60865372538777207)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13536705022406003)
,p_name=>'P28_ID_SJTO_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(60865372538777207)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13536880667406004)
,p_name=>'P28_ID_FSCLZCION_EXPDNTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(60865372538777207)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13614281979702203)
,p_name=>'P28_JSON'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(60865372538777207)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60865488190777208)
,p_name=>'P28_ID_FNCNRIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(60865372538777207)
,p_prompt=>'Funcionarios'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.prmer_nmbre ||'' ''|| c.prmer_aplldo as  d,',
'       a.id_fncnrio                         as  r',
'from df_c_funcionarios          a',
'join fi_d_programas_funcionario b   on  a.id_fncnrio    =   b.id_fncnrio',
'join si_c_terceros              c   on  a.id_trcro      =   c.id_trcro',
'where c.cdgo_clnte = :F_CDGO_CLNTE',
'and b.id_prgrma = :P28_ID_PRGRMA',
'order by c.prmer_nmbre;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'MULTI'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60865787963777211)
,p_name=>'P28_ID_PRGRMA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(60865372538777207)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13614667741702207)
,p_name=>'Registrar'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(60865835717777212)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13614730432702208)
,p_event_id=>wwv_flow_api.id(13614667741702207)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function AbrirExpedienteSancionatorio(){',
'    ',
'    try{',
'        ',
'        if (buildJsonVigencia() > 0) {',
'            ',
'            apex.message.clearErrors();',
'            ',
'            apex.message.showErrors ([',
'                {',
'                    type:       "error",',
'                    location:   "page",',
'                    message:    "Seleccione todos los Subprogramas",',
'                    unsafe:     false',
'                }',
'            ]);',
'        ',
'        }else{',
'            ',
'            apex.server.process("AbrirExpedienteSancionatorio",{',
'                f01: $v( "P28_JSON" ),',
'                pageItems: "#P28_ID_FNCNRIO"',
'            },{',
'                success: function(data) {',
'                    ',
'                    if(data.o_cdgo_rspsta != 0){',
'                        ',
'                        apex.message.clearErrors();',
'                        ',
'                        apex.message.showErrors ([',
'                            {',
'                                type:       "error",',
'                                location:   "page",',
'                                message:    data.o_mnsje_rspsta,',
'                                unsafe:     false',
'                            }',
'                        ]);',
'                    }else{',
unistr('                        apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                        apex.submit();',
'                    }',
'                }',
'            })',
'        }',
'        ',
'    }catch(e){',
'        console.log(e);',
'    }',
'    ',
'    ',
'    ',
'}',
'',
'AbrirExpedienteSancionatorio();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(60865669235777210)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Programa'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin                 ',
'    select id_prgrma',
'    into   :P28_ID_PRGRMA',
'    from fi_d_programas',
'    where cdgo_prgrma = ''S'';',
'exception',
'    when others then',
'        :P28_ID_PRGRMA := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13536507325406001)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select a.id_cnddto,',
'           a.id_sjto_impsto,',
'           c.id_fsclzcion_expdnte',
'    into   :P28_ID_CNDDTO,',
'           :P28_ID_SJTO_IMPSTO,',
'           :P28_ID_FSCLZCION_EXPDNTE',
'    from v_fi_g_candidatos          a',
'    join fi_g_fiscalizacion_expdnte c on a.id_cnddto        = c.id_cnddto',
'    join v_si_i_sujetos_impuesto    d on a.id_sjto_impsto   = d.id_sjto_impsto',
'    where c.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'    ',
'',
'exception',
'    when others then',
'        :P28_ID_SJTO_IMPSTO := null;',
'        :P28_ID_FSCLZCION_EXPDNTE := null;',
'        :P28_ID_CNDDTO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(60866018444777214)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar2(1000);',
'',
'',
'begin',
'    ',
'    begin',
'        pkg_fi_fiscalizacion.prc_rg_flujo_programa(p_cdgo_clnte          =>    :F_CDGO_CLNTE,',
'                                                   p_id_instncia_fljo    =>    :F_ID_INSTNCIA_FLJO,',
'                                                   p_id_fncnrio          =>    :F_ID_FNCNRIO,',
'                                                   p_id_fljo_trea		 =>	   :F_ID_FLJO_TREA,',
'                                                   p_funcionario         =>    :P28_ID_FNCNRIO,',
'                                                   p_id_prgrma           =>    :P28_ID_PRGRMA,',
'                                                   p_id_sbprgrma         =>    :P28_SBPRGRMA,',
'                                                   o_cdgo_rspsta         =>    v_cdgo_rspsta,',
'                                                   o_mnsje_rspsta        =>    v_mnsje_rspsta);',
'        if(v_cdgo_rspsta != 0)then',
'            raise_application_error(-20001, v_mnsje_rspsta);',
'        end if;',
'     ',
'     end;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(60865835717777212)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13614801289702209)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AbrirExpedienteSancionatorio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar2(1000);',
'    v_cnddtoVgncia   clob;',
'    v_exception      exception;',
'',
'begin',
'',
'    for i in 1..apex_application.g_f01.count loop',
'        v_cnddtoVgncia := v_cnddtoVgncia || apex_application.g_f01(i);',
'    end loop;',
'    ',
'    if :P28_ID_FNCNRIO is null then',
'        v_cdgo_rspsta := 1;',
'        v_mnsje_rspsta := ''Seleccione los funcionarios'';',
'        raise v_exception;',
'    end if;',
'     ',
'    begin',
'        pkg_fi_fiscalizacion.prc_rg_flujo_programa(p_cdgo_clnte          =>    :F_CDGO_CLNTE,',
'                                                   p_id_instncia_fljo    =>    :F_ID_INSTNCIA_FLJO,',
'                                                   p_id_fncnrio          =>    :F_ID_FNCNRIO,',
'                                                   p_id_usrio            =>    :F_ID_USRIO,',
'                                                   p_id_fljo_trea		 =>	   :F_ID_FLJO_TREA,',
'                                                   p_id_prgrma           =>    :P28_ID_PRGRMA,',
'                                                   p_funcionario         =>    :P28_ID_FNCNRIO,',
'                                                   p_cnddto_vgncia       =>    v_cnddtoVgncia,',
'                                                   o_cdgo_rspsta         =>    v_cdgo_rspsta,',
'                                                   o_mnsje_rspsta        =>    v_mnsje_rspsta);',
'        if v_cdgo_rspsta > 0 then',
'            raise v_exception;',
'        end if;',
'        ',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'     ',
'     end;',
'     ',
'exception',
'    when v_exception then',
'        rollback;',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
