prompt --application/pages/page_00114
begin
wwv_flow_api.create_page(
 p_id=>114
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Declaraciones Acto Concepto'
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Relaci\00F3n de Declaraci\00F3n con Acto Concepto')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20241220082512'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40836327796418605)
,p_plug_name=>'Acto Concepto'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_dclrcion_acto_cncpto,',
'        a.id_dclrcion_vgncia_frmlrio,',
'        a.id_impsto_acto_cncpto,',
'        a.id_frmlrio_rgion,',
'        a.id_frmlrio_rgion_atrbto,',
'        a.fla,',
'        a.id_frmlrio_rgion_pgna,',
'        a.id_frmlrio_rgion_item_pgna,',
'        a.id_frmlrio_rgion_item',
'from    gi_d_dclrcnes_acto_cncpto   a',
'where   a.id_dclrcion_vgncia_frmlrio    =   :P114_ID_DCLRCION_VGNCIA_FRMLRIO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(40836509481418607)
,p_name=>'ID_DCLRCION_ACTO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION_ACTO_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(40836689079418608)
,p_name=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION_VGNCIA_FRMLRIO'
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
,p_default_type=>'ITEM'
,p_default_expression=>'P114_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(40836793141418609)
,p_name=>'ID_IMPSTO_ACTO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Acto Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.dscrpcion,',
'            a.id_impsto_acto_cncpto',
'from        df_i_impuestos_acto_concepto    a',
'inner join  df_i_conceptos                  b   on  b.id_cncpto =   a.id_cncpto',
'where   exists(select      1',
'               from        gi_d_dclrcnes_vgncias_frmlr c',
'               inner join  gi_d_dclrcnes_tpos_vgncias  d   on  d.id_dclrcion_tpo_vgncia    =   c.id_dclrcion_tpo_vgncia',
'               inner join  gi_d_declaraciones_tipo     e   on  e.id_dclrcn_tpo             =   d.id_dclrcn_tpo',
'               where       c.id_dclrcion_vgncia_frmlrio    =   :P114_ID_DCLRCION_VGNCIA_FRMLRIO',
'               and         e.id_impsto_acto                =   a.id_impsto_acto',
'               and         d.vgncia                        =   a.vgncia',
'               and         d.id_prdo                       =   a.id_prdo);'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'-Seleccionar-'
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
 p_id=>wwv_flow_api.id(40836886864418610)
,p_name=>'ID_FRMLRIO_RGION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_RGION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>unistr('Regi\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_frmlrio_rgion',
'from    gi_d_formularios_region a',
'where   exists(select      1',
'               from        gi_d_dclrcnes_vgncias_frmlr b',
'               where       b.id_dclrcion_vgncia_frmlrio    =   :P114_ID_DCLRCION_VGNCIA_FRMLRIO',
'               and         b.id_frmlrio                    =   a.id_frmlrio)',
'and     a.actvo =   ''S''',
'order by orden;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'-Seleccionar-'
,p_enable_filter=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(40836914304418611)
,p_name=>'ID_FRMLRIO_RGION_ATRBTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_RGION_ATRBTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Atributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_frmlrio_rgion_atrbto',
'from    gi_d_frmlrios_rgion_atrbto  a',
'where   a.id_frmlrio_rgion  =   :ID_FRMLRIO_RGION',
'and     a.actvo             =   ''S''',
'order by a.orden;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'ID_FRMLRIO_RGION'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(40837023396418612)
,p_name=>'FLA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FLA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Fila'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  ''Fila '' || a.fla,',
'        a.fla',
'from    gi_d_frmlrios_rgn_atrbt_vlr a',
'where   a.id_frmlrio_rgion_atrbto   =   :ID_FRMLRIO_RGION_ATRBTO',
'order by a.fla;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'ID_FRMLRIO_RGION_ATRBTO'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(40837226778418614)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(40837302793418615)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48357805612997001)
,p_name=>'CNCPTO_RLCNAL'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Concepto Relacional'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:109:&SESSION.::&DEBUG.:RP,109:P109_ID_DCLRCION_ACTO_CNCPTO,P109_ALIAS:&ID_DCLRCION_ACTO_CNCPTO.,&P114_ALIAS.'
,p_link_text=>'Ver<span class="fa fa-eye" aria-hidden="true"></span>'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(148716148948015842)
,p_name=>'ID_FRMLRIO_RGION_PGNA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_RGION_PGNA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Regi\00F3n v2')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select    a.plug_name        as d,',
'          a.id as r',
'from apex_190100.WWV_FLOW_PAGE_PLUGS     a',
'join apex_190100.WWV_FLOW_STEPS          b on    a.flow_id = b.flow_id',
'                                           and   a.page_id = b.id     ',
'join gi_d_dclrcnes_vgncias_frmlr         d on    d.alias = b.alias',
'where d.alias = :P114_ALIAS',
'group by a.plug_name, a.id',
'order by a.plug_name ;'))
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
 p_id=>wwv_flow_api.id(148716221425015843)
,p_name=>'ID_FRMLRIO_RGION_ITEM_PGNA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_RGION_ITEM_PGNA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Display \00CDtem v2')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select    --a.name    as d,',
'          a.item_comment as d,',
'          a.id as r',
'from apex_190100.wwv_flow_step_items a',
'where a.item_plug_id = :ID_FRMLRIO_RGION_PGNA',
'group by a.item_comment, a.id',
'order by a.item_comment;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'ID_FRMLRIO_RGION_PGNA'
,p_ajax_items_to_submit=>'ID_FRMLRIO_RGION_ITEM'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(148716640801015847)
,p_name=>'ID_FRMLRIO_RGION_ITEM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_RGION_ITEM'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('\00CDtem v2')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select substr(a.name, instr(a.name, ''_'') + 1) as d,',
'       substr(a.name, instr(a.name, ''_'') + 1) as r ',
'from apex_190100.wwv_flow_step_items a',
'where a.id = :ID_FRMLRIO_RGION_ITEM_PGNA',
'group by substr(a.name, instr(a.name, ''_'') + 1), a.id',
'order by substr(a.name, instr(a.name, ''_'') + 1);'))
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ID_FRMLRIO_RGION_ITEM_PGNA'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'SQL_QUERY'
,p_default_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUBSTR(a.name, INSTR(a.name, ''_'') + 1) AS d',
'FROM apex_190100.wwv_flow_step_items a',
'WHERE a.id = :ID_FRMLRIO_RGION_ITEM_PGNA',
'GROUP BY SUBSTR(a.name, INSTR(a.name, ''_'') + 1), a.id',
'ORDER BY SUBSTR(a.name, INSTR(a.name, ''_'') + 1);'))
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(40836454097418606)
,p_internal_uid=>40836454097418606
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
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
 p_id=>wwv_flow_api.id(40843334500446208)
,p_interactive_grid_id=>wwv_flow_api.id(40836454097418606)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(40843403871446224)
,p_report_id=>wwv_flow_api.id(40843334500446208)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(40843857237446235)
,p_view_id=>wwv_flow_api.id(40843403871446224)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(40836509481418607)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(40844336393446303)
,p_view_id=>wwv_flow_api.id(40843403871446224)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(40836689079418608)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(40844801125446305)
,p_view_id=>wwv_flow_api.id(40843403871446224)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(40836793141418609)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(40845332309446307)
,p_view_id=>wwv_flow_api.id(40843403871446224)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(40836886864418610)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(40845843990446309)
,p_view_id=>wwv_flow_api.id(40843403871446224)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(40836914304418611)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(40846334058446311)
,p_view_id=>wwv_flow_api.id(40843403871446224)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(40837023396418612)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(40858670003500620)
,p_view_id=>wwv_flow_api.id(40843403871446224)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(40837226778418614)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48363621628004403)
,p_view_id=>wwv_flow_api.id(40843403871446224)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(48357805612997001)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(149120508428483948)
,p_view_id=>wwv_flow_api.id(40843403871446224)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(148716148948015842)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(149122204582508345)
,p_view_id=>wwv_flow_api.id(40843403871446224)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(148716221425015843)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(149175989137559520)
,p_view_id=>wwv_flow_api.id(40843403871446224)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(148716640801015847)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40836189314418603)
,p_name=>'P114_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(40836327796418605)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148716014100015841)
,p_name=>'P114_ALIAS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(40836327796418605)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(148716996189015850)
,p_name=>'bloquear columna'
,p_event_sequence=>10
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(40836327796418605)
,p_triggering_element=>'ID_FRMLRIO_RGION_ITEM_PGNA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(149176937192584801)
,p_event_id=>wwv_flow_api.id(148716996189015850)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'ID_FRMLRIO_RGION_ITEM'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40837426715418616)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(40836327796418605)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Acto Concepto: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
