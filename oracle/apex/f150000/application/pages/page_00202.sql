prompt --application/pages/page_00202
begin
wwv_flow_api.create_page(
 p_id=>202
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Proyecci\00F3n - Liquidaci\00F3n de Rentas')
,p_step_title=>unistr('Proyecci\00F3n - Liquidaci\00F3n de Rentas')
,p_allow_duplicate_submissions=>'N'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer {',
'    display: none;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'HMARTINEZ'
,p_last_upd_yyyymmddhh24miss=>'20201229080907'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10245117411597597)
,p_plug_name=>unistr('Proyecci\00F3n ')
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(252183924525651399)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(4794665765814946)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(252197199379651439)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10245501274597601)
,p_plug_name=>unistr('Proyecci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(10245117411597597)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--large'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10246643718597613)
,p_plug_name=>unistr('Proyecci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(10245501274597601)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select distinct a.cdgo_impsto_acto ',
'        , a.cdgo_cncpto || '' - '' || a.dscrpcion_cncpto  dscrpcion_cncpto',
'        , a.vlor_trfa',
'        , a.vlor_lqddo',
'        , a.vlor_intres_mra',
'        , a.vlor_ttal vlor_ttal',
'        , a.fcha_vncmnto',
'        , a.dias_mra',
'        , a.txto_trfa',
'     from table (pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte 				=> :F_CDGO_CLNTE',
'                                                            , p_id_impsto               => :P200_ID_IMPSTO',
'                                                            , p_id_impsto_sbmpsto       => :P200_ID_IMPSTO_SBMPSTO  ',
'                                                            , p_id_impsto_acto		 	=> :P200_ID_IMPSTO_ACTO',
'                                                            , p_id_sjto_impsto          => :P200_ID_SJTO_IMPSTO',
'                                                            , p_json_cncptos			=> null',
'                                                            , p_vlor_bse				=> to_number(:P202_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                                            , p_indcdor_usa_extrnjro	=> nvl(:P200_INDCDOR_EXTRNJRO, ''N'')',
'                                                            , p_indcdor_usa_mxto		=> nvl(:P200_INDCDOR_MXTO, ''N'')',
'                                                            , p_fcha_expdcion			=> to_date(:P202_FCHA_EXPDCION)',
'                                                            , p_fcha_vncmnto            => to_date(:P202_FCHA_VNCMNTO )',
'                                                            , p_indcdor_lqdccion_adcnal => ''N''',
'                                                            , p_id_rnta_antrior		    => null',
'                                                            , p_indcdor_cntrto_gslna    => ''N''))',
'                                                           a',
' where a.cdgo_clnte        = :F_CDGO_CLNTE',
'   and a.vlor_lqddo        > 0',
'   and a.id_impsto_acto    = :P200_ID_IMPSTO_ACTO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_gnra_intres_mra    varchar2(1);',
'begin',
'    if :P202_FCHA_VNCMNTO is not null or :P202_VLOR_BSE_GRVBLE is not null then ',
'        begin',
'            select a.gnra_intres_mra',
'              into v_gnra_intres_mra',
'              from v_df_i_impuestos_acto_concepto      a ',
'              join (select id_impsto_acto_cncpto ',
'                      from json_table(:P200_ID_IMPSTO_ACTO_CNCPTO,''$[*]''columns id_impsto_acto_cncpto path ''$.ID_IMPSTO_ACTO_CNCPTO'')',
'                   )                                   b on a.id_impsto_acto_cncpto    = b.id_impsto_acto_cncpto',
'            where a.gnra_intres_mra                    = ''S'';',
'           return true;',
'        exception',
'            when others then ',
'                return true;',
'        end;',
'    else',
'        return false;',
'    end if;',
'end;'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10247037675597616)
,p_name=>'CDGO_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_IMPSTO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(10247260168597619)
,p_name=>'VLOR_TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TRFA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Tarifa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_03=>'center'
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
 p_id=>wwv_flow_api.id(10247351031597620)
,p_name=>'VLOR_LQDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_LQDDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br>Liquidado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(10247453562597621)
,p_name=>'VLOR_INTRES_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES_MRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Interes de<br> Mora'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(10247562692597622)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br>Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(10247842910597625)
,p_name=>'DIAS_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIAS_MRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('D\00EDas de Mora')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'center'
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
,p_display_condition_type=>'SQL_EXPRESSION'
,p_display_condition=>':DIAS_MORA > 0'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10248034159597626)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de<br> Vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
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
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_display_condition=>'DIAS_MORA'
,p_display_condition2=>'0'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10248117040597627)
,p_name=>'TXTO_TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_TRFA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tarifa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(10344236247196189)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>108
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
 p_id=>wwv_flow_api.id(10246795566597614)
,p_internal_uid=>10246795566597614
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>false
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
 p_id=>wwv_flow_api.id(10273493289011074)
,p_interactive_grid_id=>wwv_flow_api.id(10246795566597614)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(10273580317011074)
,p_report_id=>wwv_flow_api.id(10273493289011074)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10274575866011084)
,p_view_id=>wwv_flow_api.id(10273580317011074)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(10247037675597616)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10276102345011089)
,p_view_id=>wwv_flow_api.id(10273580317011074)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(10247260168597619)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10276596185011091)
,p_view_id=>wwv_flow_api.id(10273580317011074)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(10247351031597620)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10277109884011092)
,p_view_id=>wwv_flow_api.id(10273580317011074)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(10247453562597621)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10277641288011094)
,p_view_id=>wwv_flow_api.id(10273580317011074)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(10247562692597622)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10279137174011098)
,p_view_id=>wwv_flow_api.id(10273580317011074)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(10247842910597625)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10279558535011100)
,p_view_id=>wwv_flow_api.id(10273580317011074)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(10248034159597626)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10280072051011102)
,p_view_id=>wwv_flow_api.id(10273580317011074)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(10248117040597627)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10350203342196395)
,p_view_id=>wwv_flow_api.id(10273580317011074)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(10344236247196189)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>423.9
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(5431541877590788)
,p_view_id=>wwv_flow_api.id(10273580317011074)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(10247562692597622)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(5431577168593051)
,p_view_id=>wwv_flow_api.id(10273580317011074)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(10247453562597621)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(5431652710593573)
,p_view_id=>wwv_flow_api.id(10273580317011074)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(10247351031597620)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5433545928590793)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(10245501274597601)
,p_button_name=>'BTN_PROYECTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>unistr('Generar Proyecci\00F3n')
,p_button_position=>'BODY'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5432013283590789)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(10245117411597597)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de cancelar? Al cancelar se perder todos los cambios que no se han guardado'',''CANCEL'');'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5432477372590789)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(10245117411597597)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-angle-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5432802047590789)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(10245117411597597)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(252201877336651464)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5445332259590819)
,p_branch_name=>'Ir a Adjuntos'
,p_branch_action=>'f?p=&APP_ID.:203:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5432477372590789)
,p_branch_sequence=>10
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P200_INDCDOR_RQRE_ADJNTO'
,p_branch_condition_text=>'S'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5444191653590818)
,p_branch_name=>'Ir a Resumen'
,p_branch_action=>'f?p=&APP_ID.:204:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5432477372590789)
,p_branch_sequence=>20
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P200_INDCDOR_RQRE_AUTRZCION'
,p_branch_condition_text=>'N'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(78952751262533307)
,p_branch_name=>unistr('Ir a la p\00E1gina de inicio')
,p_branch_action=>'P200_BRANCH'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_when_button_id=>wwv_flow_api.id(5432013283590789)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5444541372590819)
,p_branch_name=>unistr('Ir a Informaci\00F3n Asociada')
,p_branch_action=>'f?p=&APP_ID.:201:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5432802047590789)
,p_branch_sequence=>20
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P200_INDCDOR_RQRE_ASCDA'
,p_branch_condition_text=>'S'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5444933951590819)
,p_branch_name=>'Ir a Sujeto Impuesto'
,p_branch_action=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5432802047590789)
,p_branch_sequence=>30
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P200_INDCDOR_RQRE_ASCDA'
,p_branch_condition_text=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5433957679590793)
,p_name=>'P202_LBEL_ITEM_VLOR_BSE_GRVBLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(10245501274597601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5434379253590793)
,p_name=>'P202_VLOR_BSE_GRVBLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(10245501274597601)
,p_prompt=>'&P202_LBEL_ITEM_VLOR_BSE_GRVBLE.'
,p_format_mask=>'999G999G999G999G999G999G990D99'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event,''numeroEntero'');" onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:2});"'
,p_grid_column=>3
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_trfa_esqma',
'     from v_gi_d_tarifas_esquema            a',
'    where a.cdgo_clnte                      = :F_CDGO_CLNTE',
'      and a.id_impsto                       = :P200_ID_IMPSTO',
'      and a.id_impsto_sbmpsto               = :P200_ID_IMPSTO_SBMPSTO',
'      and a.id_impsto_acto                  = :P200_ID_IMPSTO_ACTO',
'      and a.vgncia                          = extract(year from to_date(:P202_FCHA_EXPDCION))',
unistr('      -- Se valida que la tarifa este entre la fecha de expedici\00F3n'),
'      and (trunc(to_date(:P202_FCHA_EXPDCION))  between trunc(fcha_incial) ',
'                                                and trunc(fcha_fnal))',
unistr('      -- Se valida que la fecha de expedici\00F3n este entre las fecha del indicador economico de la tarifa si usa indicador'),
'      and (trunc(to_date(:P202_FCHA_EXPDCION))  between trunc(fcha_dsde_cdgo_indcdor_tpo) ',
'                                                and trunc(fcha_hsta_cdgo_indcdor_tpo)',
'        or cdgo_indcdor_tpo is null)',
unistr('      -- Se valida que la fecha de expedici\00F3n este entre las fecha del indicador economico de la base si usa indicador para la base'),
'      and (trunc(to_date(:P202_FCHA_EXPDCION))  between trunc(fcha_dsde_cdgo_indcdor_tpo_bse) ',
'                                                and trunc(fcha_hsta_cdgo_indcdor_tpo_bse)',
'        or cdgo_indcdor_tpo_bse is null)',
unistr('      -- Se valida que la fecha de expedici\00F3n este entre las fecha del indicador economico de la liquidaci\00F3n si usa indicador para la liquidaci\00F3n'),
'      and (trunc(to_date(:P202_FCHA_EXPDCION))  between trunc(fcha_dsde_cdgo_indcdor_tpo_lqd) ',
'                                                and trunc(fcha_hsta_cdgo_indcdor_tpo_lqd) ',
'        or cdgo_indcdor_tpo_lqdccion is null)',
'      and a.indcdor_usa_bse                     = ''S'''))
,p_read_only_when_type=>'NOT_EXISTS'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5434739125590794)
,p_name=>'P202_FCHA_EXPDCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(10245501274597601)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'&P200_LBEL_ITEM_FCHA.'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5435167155590794)
,p_name=>'P202_FCHA_VNCMNTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(10245501274597601)
,p_item_default=>'select last_day(sysdate) ultma_fcha from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Fecha Pago'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_02=>'+0d'
,p_attribute_03=>'&P202_ULTMO_DIA.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5435570819590795)
,p_name=>'P202_ULTMO_DIA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(10245501274597601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(5440830940590816)
,p_computation_sequence=>20
,p_computation_item=>'P202_LBEL_ITEM_VLOR_BSE_GRVBLE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_lbel_bse      varchar2(100);',
'begin',
'    --if (:P200_LQDCION_MTPLE = ''N'') then',
'        select (txto_bse_grvble)',
'          into v_lbel_bse',
'          from df_i_impuestos_acto',
'         where id_impsto              = :P200_ID_IMPSTO',
'           and id_impsto_sbmpsto      = :P200_ID_IMPSTO_SBMPSTO',
'           and id_impsto_acto         = :P200_ID_IMPSTO_ACTO;',
'    --end if;',
'    return v_lbel_bse;',
'end;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(84590718070122408)
,p_computation_sequence=>30
,p_computation_item=>'P202_VLOR_BSE_GRVBLE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'1'
,p_compute_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_trfa_esqma',
'     from v_gi_d_tarifas_esquema            a',
'    where a.cdgo_clnte                      = :F_CDGO_CLNTE',
'      and a.id_impsto                       = :P200_ID_IMPSTO',
'      and a.id_impsto_sbmpsto               = :P200_ID_IMPSTO_SBMPSTO',
'      and a.id_impsto_acto                  = :P200_ID_IMPSTO_ACTO',
'      and a.vgncia                          = extract(year from to_date(nvl(:P202_FCHA_EXPDCION, sysdate)))',
unistr('      -- Se valida que la tarifa este entre la fecha de expedici\00F3n'),
'      and (trunc(to_date(nvl(:P202_FCHA_EXPDCION, sysdate)))  between trunc(fcha_incial) ',
'                                                and trunc(fcha_fnal))',
unistr('      -- Se valida que la fecha de expedici\00F3n este entre las fecha del indicador economico de la tarifa si usa indicador'),
'      and (trunc(to_date(nvl(:P202_FCHA_EXPDCION, sysdate)))  between trunc(fcha_dsde_cdgo_indcdor_tpo) ',
'                                                and trunc(fcha_hsta_cdgo_indcdor_tpo)',
'        or cdgo_indcdor_tpo is null)',
unistr('      -- Se valida que la fecha de expedici\00F3n este entre las fecha del indicador economico de la base si usa indicador para la base'),
'      and (trunc(to_date(nvl(:P202_FCHA_EXPDCION, sysdate)))  between trunc(fcha_dsde_cdgo_indcdor_tpo_bse) ',
'                                                and trunc(fcha_hsta_cdgo_indcdor_tpo_bse)',
'        or cdgo_indcdor_tpo_bse is null)',
unistr('      -- Se valida que la fecha de expedici\00F3n este entre las fecha del indicador economico de la liquidaci\00F3n si usa indicador para la liquidaci\00F3n'),
'      and (trunc(to_date(nvl(:P202_FCHA_EXPDCION, sysdate)))  between trunc(fcha_dsde_cdgo_indcdor_tpo_lqd) ',
'                                                and trunc(fcha_hsta_cdgo_indcdor_tpo_lqd) ',
'        or cdgo_indcdor_tpo_lqdccion is null)',
'      and a.indcdor_usa_bse                     = ''S'''))
,p_compute_when_type=>'NOT_EXISTS'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(5440401045590816)
,p_computation_sequence=>10
,p_computation_item=>'P202_ULTMO_DIA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select last_day(to_date(''1/12/''||to_char(sysdate,''YYYY''),''DD/MM/YYYY'')) ultma_fcha from dual'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5441212065590816)
,p_validation_name=>'Validar Valor Base No Nulo'
,p_validation_sequence=>10
,p_validation=>'P202_VLOR_BSE_GRVBLE'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>'Debe ingresar el &P202_LBEL_ITEM_VLOR_BSE_GRVBLE. para continuar'
,p_validation_condition=>'NEXT,BTN_PROYECTAR'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5434379253590793)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5441640771590817)
,p_validation_name=>unistr('Validar Fecha de Expedic\00F3n No null')
,p_validation_sequence=>20
,p_validation=>'P202_FCHA_EXPDCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar la fecha de &P200_LBEL_ITEM_FCHA. para continuar'
,p_validation_condition=>'NEXT,BTN_PROYECTAR'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5434739125590794)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5442048463590817)
,p_validation_name=>'Validar Fecha de Vencimiento no nullo'
,p_validation_sequence=>30
,p_validation=>'P202_FCHA_VNCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar una fecha de vencimiento para continuar'
,p_validation_condition=>'NEXT,BTN_PROYECTAR'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(5435167155590794)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5442841527590817)
,p_validation_name=>'Validar que la fecha de vencimiento este en el rango de tasas mora'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' v_fcha_vlda          varchar2(1);',
' v_gnra_intres_mra    varchar2(1);',
'begin     ',
'    ',
'    begin',
'        select a.gnra_intres_mra',
'          into v_gnra_intres_mra',
'          from v_df_i_impuestos_acto_concepto      a ',
'          join (select id_impsto_acto_cncpto ',
'                  from json_table(:P200_ID_IMPSTO_ACTO_CNCPTO,''$[*]''columns id_impsto_acto_cncpto path ''$.ID_IMPSTO_ACTO_CNCPTO'')',
'               )                                   b on a.id_impsto_acto_cncpto    = b.id_impsto_acto_cncpto',
'        where a.gnra_intres_mra                    = ''S''',
'          and :P202_FCHA_VNCMNTO                    is not null;',
'        ',
'        v_fcha_vlda := pkg_gn_generalidades.fnc_vl_fcha_vncmnto_tsas_mra (:F_CDGO_CLNTE, :P200_ID_IMPSTO, to_date(:P202_FCHA_VNCMNTO));',
'        if v_fcha_vlda = ''S''  then',
'            return true;',
'        else ',
'            return false;',
'        end if;       ',
'    exception',
'        when others then ',
'            return true;',
'    end;',
'    ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Debe seleccionar una fecha valida para poder continuar'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(5435167155590794)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5442446532590817)
,p_validation_name=>unistr('Validar que la proyecci\00F3n se valida')
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.cdgo_impsto_acto ',
'        , a.cdgo_cncpto || '' - '' || a.dscrpcion_cncpto  dscrpcion_cncpto',
'        , a.vlor_trfa',
'        , a.vlor_lqddo',
'        , a.vlor_intres_mra',
'        , a.vlor_ttal vlor_ttal',
'        , a.fcha_vncmnto',
'        , a.dias_mra',
'        , a.txto_trfa',
'     from table (pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte 				=> :F_CDGO_CLNTE',
'                                                            , p_id_impsto               => :P200_ID_IMPSTO',
'                                                            , p_id_impsto_sbmpsto       => :P200_ID_IMPSTO_SBMPSTO  ',
'                                                            , p_id_impsto_acto		 	=> :P200_ID_IMPSTO_ACTO',
'                                                            , p_id_sjto_impsto          => :P200_ID_SJTO_IMPSTO',
'                                                            , p_json_cncptos			=> null',
'                                                            , p_vlor_bse				=> to_number(:P202_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                                            , p_indcdor_usa_extrnjro	=> nvl(:P200_INDCDOR_EXTRNJRO, ''N'')',
'                                                            , p_indcdor_usa_mxto		=> nvl(:P200_INDCDOR_MXTO, ''N'')',
'                                                            , p_fcha_expdcion			=> to_date(:P202_FCHA_EXPDCION)',
'                                                            , p_fcha_vncmnto            => to_date(:P202_FCHA_VNCMNTO )',
'                                                            , p_indcdor_lqdccion_adcnal => ''N''',
'                                                            , p_id_rnta_antrior		    => null',
'                                                            , p_indcdor_cntrto_gslna    => ''N''))',
'                                                           a',
' where a.cdgo_clnte        = :F_CDGO_CLNTE',
'   and a.vlor_lqddo        > 0',
'   and a.id_impsto_acto    = :P200_ID_IMPSTO_ACTO'))
,p_validation_type=>'EXISTS'
,p_error_message=>unistr('Proyecci\00F3n no valida')
,p_when_button_pressed=>wwv_flow_api.id(5432477372590789)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5443120500590818)
,p_name=>'Refrescar al cambiar lo valores '
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P202_FCHA_VNCMNTO,P202_VLOR_BSE_GRVBLE,P202_FCHA_EXPDCION'
,p_condition_element=>'P202_FCHA_VNCMNTO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5443697932590818)
,p_event_id=>wwv_flow_api.id(5443120500590818)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
end;
/
