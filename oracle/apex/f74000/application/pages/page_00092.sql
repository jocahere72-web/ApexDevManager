prompt --application/pages/page_00092
begin
wwv_flow_api.create_page(
 p_id=>92
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Fiscalizaci\00F3n Candidatos Puntual')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Fiscalizaci\00F3n Candidatos Puntual')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20240622102029'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29643443951846137)
,p_plug_name=>'Container'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29641005826846113)
,p_plug_name=>unistr('Par\00E1metros')
,p_parent_plug_id=>wwv_flow_api.id(29643443951846137)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29641264471846115)
,p_plug_name=>'Candidatos Manual'
,p_parent_plug_id=>wwv_flow_api.id(29643443951846137)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>20
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
,p_ajax_items_to_submit=>'P92_ID_PRGRMA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P92_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(29641464543846117)
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
 p_id=>wwv_flow_api.id(29641585889846118)
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
,p_default_expression=>'P92_ID_IMPSTO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(29641608748846119)
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
,p_default_expression=>'P92_ID_IMPSTO_SBMPSTO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(29641723003846120)
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
,p_default_expression=>'P92_ID_SJTO_IMPSTO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(29641826633846121)
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
,p_is_required=>false
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
,p_default_expression=>'P92_IDNTFCCION_SJTO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(29641962719846122)
,p_name=>'NMBRE_RZON_SCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RZON_SCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Raz\00F3n Social')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
,p_default_type=>'SQL_QUERY'
,p_default_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rzon_scial',
'  from si_i_personas a',
' where a.id_sjto_impsto = :P92_ID_SJTO_IMPSTO'))
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(29642011663846123)
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
'                       and id_impsto         = :P92_ID_IMPSTO',
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
 p_id=>wwv_flow_api.id(29642119897846124)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(a.prdo || '' - '' || a.dscrpcion || '' ('' || b.dscrpcion || '')'') as l,',
'       a.id_prdo as v',
'  from df_i_periodos a',
'  join df_s_periodicidad b',
'    on a.cdgo_prdcdad = b.cdgo_prdcdad',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_impsto = :ID_IMPSTO',
'   and a.id_impsto_sbmpsto = :ID_IMPSTO_SBMPSTO',
'   and a.vgncia = :VGNCIA',
'   and ((:P92_CDGO_PRGRMA <> ''O'' and exists',
'        (select 1',
'            from gi_g_declaraciones d',
'           where d.cdgo_clnte = a.cdgo_clnte',
'             and d.id_impsto = a.id_impsto',
'             and d.id_impsto_sbmpsto = a.id_impsto_sbmpsto',
'             and d.id_sjto_impsto = :ID_SJTO_IMPSTO',
'             and d.vgncia = a.vgncia',
'             and d.id_prdo = a.id_prdo',
'             and not d.cdgo_dclrcion_estdo in (''REG'', ''AUT''))) or',
'       (:P92_CDGO_PRGRMA = ''O'' and not exists',
'        (select a.id_prdo',
'            from gi_g_declaraciones d',
'           where d.cdgo_clnte = a.cdgo_clnte',
'             and d.id_impsto = a.id_impsto',
'             and d.id_impsto_sbmpsto = a.id_impsto_sbmpsto',
'             and d.id_sjto_impsto = :ID_SJTO_IMPSTO',
'             and d.vgncia = a.vgncia',
'             and d.id_prdo = a.id_prdo',
'             and not d.cdgo_dclrcion_estdo in (''REG'', ''AUT''))))',
' order by b.cntdad_vce_anio, a.prdo',
''))
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
 p_id=>wwv_flow_api.id(29642276136846125)
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(29642308089846126)
,p_name=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(29642440605846127)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(29641387779846116)
,p_internal_uid=>29641387779846116
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
 p_id=>wwv_flow_api.id(29670859050850955)
,p_interactive_grid_id=>wwv_flow_api.id(29641387779846116)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(29670948477850964)
,p_report_id=>wwv_flow_api.id(29670859050850955)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29671476878850970)
,p_view_id=>wwv_flow_api.id(29670948477850964)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(29641464543846117)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29671959311850974)
,p_view_id=>wwv_flow_api.id(29670948477850964)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(29641585889846118)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29672483652850975)
,p_view_id=>wwv_flow_api.id(29670948477850964)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(29641608748846119)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29672929034850977)
,p_view_id=>wwv_flow_api.id(29670948477850964)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(29641723003846120)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29673425887850978)
,p_view_id=>wwv_flow_api.id(29670948477850964)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(29641826633846121)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29673911983850982)
,p_view_id=>wwv_flow_api.id(29670948477850964)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(29641962719846122)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29674426668850984)
,p_view_id=>wwv_flow_api.id(29670948477850964)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(29642011663846123)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29674990263850988)
,p_view_id=>wwv_flow_api.id(29670948477850964)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(29642119897846124)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29675449034850989)
,p_view_id=>wwv_flow_api.id(29670948477850964)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(29642276136846125)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29675972161850991)
,p_view_id=>wwv_flow_api.id(29670948477850964)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(29642308089846126)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29676496390850993)
,p_view_id=>wwv_flow_api.id(29670948477850964)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(29642440605846127)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(29643215947846135)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(29641264471846115)
,p_button_name=>'BTN_ADD_CNDDTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(29667568933770449)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(29641005826846113)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P92_ID_SJTO_IMPSTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(29700306590294222)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(29641005826846113)
,p_button_name=>'BTN_NUEVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Nueva Consulta'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:92:&SESSION.::&DEBUG.:RP,92::'
,p_button_condition=>'P92_ID_SJTO_IMPSTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29641107496846114)
,p_name=>'P92_IDNTFCCION_SJTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(29641005826846113)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29668099268776804)
,p_name=>'P92_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(29641005826846113)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29668530191783952)
,p_name=>'P92_ID_PRGRMA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(29641005826846113)
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
 p_id=>wwv_flow_api.id(29668842070785612)
,p_name=>'P92_CDGO_PRGRMA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(29641005826846113)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29669297804790422)
,p_name=>'P92_ID_SBPRGRMA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(29641005826846113)
,p_prompt=>'Sub Programa'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_sbprgrma as d,',
'       id_sbprgrma    as r',
'from fi_d_subprogramas ',
'where id_prgrma = :P92_ID_PRGRMA',
'and actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P92_ID_PRGRMA'
,p_ajax_items_to_submit=>'P92_ID_SBPRGRMA'
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
 p_id=>wwv_flow_api.id(29669585133810888)
,p_name=>'P92_ID_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(29641005826846113)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto',
'     , b.id_impsto',
'  from fi_d_programas_impuesto a',
'  join df_c_impuestos b',
'    on a.id_impsto = b.id_impsto',
' where a.id_prgrma = :P92_ID_PRGRMA'))
,p_lov_cascade_parent_items=>'P92_ID_PRGRMA'
,p_ajax_items_to_submit=>'P92_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29669808896813946)
,p_name=>'P92_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(29641005826846113)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto_sbmpsto',
'     , a.id_impsto_sbmpsto',
'  from df_i_impuestos_subimpuesto a',
' where a.id_impsto = :P92_ID_IMPSTO'))
,p_lov_cascade_parent_items=>'P92_ID_IMPSTO'
,p_ajax_items_to_submit=>'P92_ID_IMPSTO_SBMPSTO,P92_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29739310058370502)
,p_name=>'P92_ID_FSCLZCION_LTE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(29641005826846113)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29642778770846130)
,p_name=>'Al Guardar Candidato'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(29641264471846115)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridsave'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29642891189846131)
,p_event_id=>wwv_flow_api.id(29642778770846130)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(29641264471846115)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29642923956846132)
,p_name=>'Al cambiar P92_ID_IMPSTO'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P92_ID_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29643023522846133)
,p_event_id=>wwv_flow_api.id(29642923956846132)
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
 p_id=>wwv_flow_api.id(29643130222846134)
,p_event_id=>wwv_flow_api.id(29642923956846132)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(29641264471846115)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29643567893846138)
,p_name=>unistr('Busca C\00F3digo Programa')
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P92_ID_PRGRMA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29643630536846139)
,p_event_id=>wwv_flow_api.id(29643567893846138)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'   select cdgo_prgrma ',
'     into :P92_CDGO_PRGRMA',
'     from fi_d_programas ',
'    where id_prgrma = :P92_ID_PRGRMA;',
'exception',
'      when no_data_found then ',
'           :P92_CDGO_PRGRMA := null;',
'end;'))
,p_attribute_02=>'P92_CDGO_PRGRMA,P92_ID_PRGRMA'
,p_attribute_03=>'P92_CDGO_PRGRMA'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29643394735846136)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Busca Datos Sujeto Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'   select a.id_sjto_impsto',
'     into :P92_ID_SJTO_IMPSTO',
'     from v_si_i_sujetos_impuesto a',
'    where a.cdgo_clnte      = :F_CDGO_CLNTE',
'      and a.idntfccion_sjto = :P92_IDNTFCCION_SJTO',
'      and a.id_impsto       = :P92_ID_IMPSTO;',
'exception',
'     when others then ',
'          raise_application_error(-20326,''El Sujeto Impuesto no existe, por favor verifique.'');',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(29667568933770449)
,p_process_success_message=>'Sujeto Impuesto Encontrado.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29643794806846140)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(29641264471846115)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Crud de Candidatos Manual'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_collection_name varchar2(10) := ''CANDIDATOS'';',
'  v_cdgo_rspsta     number;',
'  v_mnsje_rspsta    varchar2(4000);',
'begin',
'',
'  insert into muerto3_tmp (v_001,t_001) values (''P92_ID_FSCLZCION_LTE: ''||:P92_ID_FSCLZCION_LTE,systimestamp);',
'  commit;',
'  --Crud de Candidato Manual',
'  pkg_fi_fiscalizacion.prc_cd_cnddatos_mnual(p_collection_name   => v_collection_name,',
'                                             p_seq_id            => :SEQ_ID,',
'                                             p_status            => :APEX$ROW_STATUS,',
'                                             p_cdgo_prgrma       => :P92_CDGO_PRGRMA,',
'                                             p_cdgo_clnte        => :F_CDGO_CLNTE,',
'                                             p_id_fsclzcion_lte  => :P92_ID_FSCLZCION_LTE,',
'                                             p_id_impsto         => :ID_IMPSTO,',
'                                             p_id_impsto_sbmpsto => :ID_IMPSTO_SBMPSTO,',
'                                             p_id_sjto_impsto    => :ID_SJTO_IMPSTO,',
'                                             p_vgncia            => :VGNCIA,',
'                                             p_id_prdo           => :ID_PRDO,',
'                                             p_idntfccion_sjto   => :IDNTFCCION_SJTO,',
'                                             p_nmbre_rzon_scial  => :NMBRE_RZON_SCIAL,',
'                                             o_cdgo_rspsta       => v_cdgo_rspsta,',
'                                             o_mnsje_rspsta      => v_mnsje_rspsta);',
'',
'  --Verifica si Hubo Error',
'  if (v_cdgo_rspsta <> 0) then',
'    raise_application_error(-20001, v_mnsje_rspsta);',
'  end if;',
'end;',
''))
,p_attribute_05=>'Y'
,p_attribute_06=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_ADD_CNDDTO'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_exec_cond_for_each_row=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29739207053370501)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RegistrarCandidato'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_cnddtos      number;',
'  v_cdgo_fljo    varchar2(5);',
'  v_cnddato      clob;',
'  v_id_cnddto    number;',
'  v_cdgo_rspsta  number;',
'  v_mnsje_rspsta varchar2(4000);',
'begin',
'',
'  --Busca si Exites Candidatos en la Coleccion',
'  select count(*)',
'    into v_cnddtos',
'    from apex_collections',
'   where collection_name = ''CANDIDATOS'';',
'',
'  --Verifica si no hay Candidados',
'  if (v_cnddtos = 0) then',
'    raise_application_error(-20001,',
'                            ''No hay datos de candidatos ingresado, por favor verifique.'');',
'  end if;',
'',
'  --Busca los Datos del Flujo',
'  begin',
'    select cdgo_fljo',
'      into v_cdgo_fljo',
'      from wf_d_flujos',
'     where id_fljo = (select id_fljo',
'                        from fi_d_programas',
'                       where id_prgrma = :P92_ID_PRGRMA);',
'  exception',
'    when no_data_found then',
'      raise_application_error(-20002,',
'                              ''No se encontro parametrizado el flujo del programa seleccionado.'');',
'    when others then',
'      raise_application_error(-20003,',
unistr('                              ''Problemas al obtener el c\00F3digo del flujo.'');'),
'  end;',
'',
'  --Construye el Json',
'  select json_array(json_object(''ID_IMPSTO'' value a.id_impsto,',
'                                ''ID_IMPSTO_SBMPSTO'' value',
'                                a.id_impsto_sbmpsto,',
'                                ''ID_SJTO_IMPSTO'' value a.id_sjto_impsto,',
'                                ''VGNCIA'' value',
'                                json_arrayagg(json_object(''VGNCIA'' value',
'                                                          a.vgncia,',
'                                                          ''ID_PRDO'' value',
'                                                          a.id_prdo,',
'                                                          ''DCLRCION_VGNCIA_FRMLRIO''',
'                                                          value',
'                                                          a.id_dclrcion_vgncia_frmlrio,',
'                                                          ''ID_DCLRCION'' value',
'                                                          a.id_dclrcion,',
'                                                          ''ID_SJTO_IMPSTO''',
'                                                          value',
'                                                          a.id_sjto_impsto,',
'                                                          ''ID_FSCLZCION_LTE''',
'                                                          value',
'                                                          a.id_fsclzcion_lte)',
'                                              order by a.vgncia,',
'                                              a.prdo returning clob)',
'                                returning clob))',
'    into v_cnddato',
'    from (select seq_id,',
'                 c001   as id_impsto,',
'                 c002   as id_impsto_sbmpsto,',
'                 c003   as id_sjto_impsto,',
'                 c004   as idntfccion_sjto,',
'                 c005   as nmbre_rzon_scial,',
'                 c006   as vgncia,',
'                 c007   as id_prdo,',
'                 c008   as prdo,',
'                 c009   as id_dclrcion_vgncia_frmlrio,',
'                 c010   as id_dclrcion,',
'                 n001   as id_fsclzcion_lte ',
'            from apex_collections',
'           where collection_name = ''CANDIDATOS'') a',
'   group by a.id_impsto, a.id_impsto_sbmpsto, a.id_sjto_impsto;',
'',
'  --Registra Candidato',
'  pkg_fi_fiscalizacion.prc_rg_candidato(p_cdgo_clnte   => :F_CDGO_CLNTE,',
'                                        p_id_fncnrio   => :F_ID_FNCNRIO,',
'                                        p_cnddto       => v_cnddato,',
'                                        p_funcionario  => :F_ID_FNCNRIO,',
'                                        p_prgrma       => :P92_ID_PRGRMA,',
'                                        p_sbprgrma     => :P92_ID_SBPRGRMA,',
'                                        o_id_cnddto    => v_id_cnddto,',
'                                        o_cdgo_rspsta  => v_cdgo_rspsta,',
'                                        o_mnsje_rspsta => v_mnsje_rspsta);',
'',
'  --Verifica si Hubo Error',
'  if v_cdgo_rspsta <> 0 then',
'    raise_application_error(-20004, v_mnsje_rspsta);',
'  end if;',
'  ',
'  --Verifica si Hubo Error',
'  if v_cdgo_rspsta <> 0 then',
'    raise_application_error(-20005, v_mnsje_rspsta);',
'  end if;',
'',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(29643215947846135)
,p_process_success_message=>unistr('Acci\00F3n procesada con \00E9xito.')
);
end;
/
