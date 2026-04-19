prompt --application/pages/page_00109
begin
wwv_flow_api.create_page(
 p_id=>109
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Declaraciones Concepto Relacional'
,p_page_mode=>'MODAL'
,p_step_title=>'Declaraciones Concepto Relacional'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'75%'
,p_dialog_chained=>'N'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20241220082557'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(48357904359997002)
,p_plug_name=>'Concepto Relacional'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_dclrcion_cncpto_rlcnal,',
'        a.id_dclrcion_acto_cncpto,',
'        --a.cdgo_cncpto_tpo,',
'        a.id_cncpto,',
'        a.id_frmlrio_rgion,',
'        a.id_frmlrio_rgion_atrbto,',
'        a.fla,',
'        a.id_frmlrio_rgion_pgna,',
'        a.id_frmlrio_rgion_item_pgna,',
'        a.id_frmlrio_rgion_item',
'from    gi_d_dclrcnes_cncpto_rlcnal a',
'where   a.id_dclrcion_acto_cncpto   =   :P109_ID_DCLRCION_ACTO_CNCPTO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48358208469997005)
,p_name=>'ID_DCLRCION_CNCPTO_RLCNAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION_CNCPTO_RLCNAL'
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
 p_id=>wwv_flow_api.id(48358314685997006)
,p_name=>'ID_DCLRCION_ACTO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION_ACTO_CNCPTO'
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
,p_default_expression=>'P109_ID_DCLRCION_ACTO_CNCPTO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48358588729997008)
,p_name=>'ID_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion,',
'       b.id_cncpto',
'  from df_i_impuestos_acto_concepto a',
'  join df_i_conceptos b',
'    on ( a.id_cncpto_intres_mra = b.id_cncpto',
'      or a.id_cncpto            = b.id_cncpto_rlcnal ',
'      or a.id_cncpto_intres_mra = b.id_cncpto_rlcnal )',
' where exists(select    1',
'              from      gi_d_dclrcnes_acto_cncpto   c',
'              where     c.id_dclrcion_acto_cncpto   =   :P109_ID_DCLRCION_ACTO_CNCPTO',
'              and       c.id_impsto_acto_cncpto     =   a.id_impsto_acto_cncpto)',
'order by b.dscrpcion;'))
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
 p_id=>wwv_flow_api.id(48358697933997009)
,p_name=>'ID_FRMLRIO_RGION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_RGION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Regi\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_frmlrio_rgion',
'from    gi_d_formularios_region a',
'where   exists(select      1',
'               from        gi_d_dclrcnes_vgncias_frmlr b',
'               inner join  gi_d_dclrcnes_acto_cncpto   c   on  c.id_dclrcion_vgncia_frmlrio =  b.id_dclrcion_vgncia_frmlrio',
'               where       c.id_dclrcion_acto_cncpto   =   :P109_ID_DCLRCION_ACTO_CNCPTO',
'               and         b.id_frmlrio                =   a.id_frmlrio)',
'and     a.actvo =   ''S''',
'order by orden;'))
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
 p_id=>wwv_flow_api.id(48358747410997010)
,p_name=>'ID_FRMLRIO_RGION_ATRBTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_RGION_ATRBTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Atributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(48358870972997011)
,p_name=>'FLA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FLA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Fila'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(48358958843997012)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48359054853997013)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(148716349086015844)
,p_name=>'ID_FRMLRIO_RGION_PGNA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_RGION_PGNA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Regi\00F3n v2')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
'where d.alias = :P109_ALIAS',
'group by a.plug_name, a.id',
'order by a.plug_name ;'))
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
 p_id=>wwv_flow_api.id(148716477777015845)
,p_name=>'ID_FRMLRIO_RGION_ITEM_PGNA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_RGION_ITEM_PGNA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Display \00CDtem v2')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(149177483019584806)
,p_name=>'ID_FRMLRIO_RGION_ITEM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_RGION_ITEM'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('\00CDtem v2')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(48358094810997003)
,p_internal_uid=>48358094810997003
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
 p_id=>wwv_flow_api.id(48371991916081276)
,p_interactive_grid_id=>wwv_flow_api.id(48358094810997003)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(48372081532081277)
,p_report_id=>wwv_flow_api.id(48371991916081276)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48372562644081282)
,p_view_id=>wwv_flow_api.id(48372081532081277)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(48358208469997005)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48373091371081286)
,p_view_id=>wwv_flow_api.id(48372081532081277)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(48358314685997006)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48374098540081289)
,p_view_id=>wwv_flow_api.id(48372081532081277)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(48358588729997008)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48374549316081290)
,p_view_id=>wwv_flow_api.id(48372081532081277)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(48358697933997009)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48375014891081292)
,p_view_id=>wwv_flow_api.id(48372081532081277)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(48358747410997010)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48375515847081295)
,p_view_id=>wwv_flow_api.id(48372081532081277)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(48358870972997011)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48394631288112302)
,p_view_id=>wwv_flow_api.id(48372081532081277)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(48358958843997012)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(149155094079275078)
,p_view_id=>wwv_flow_api.id(48372081532081277)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(148716349086015844)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(149155561905275089)
,p_view_id=>wwv_flow_api.id(48372081532081277)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(148716477777015845)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(149216840023464851)
,p_view_id=>wwv_flow_api.id(48372081532081277)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(149177483019584806)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48358170135997004)
,p_name=>'P109_ID_DCLRCION_ACTO_CNCPTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(48357904359997002)
,p_prompt=>'Nuevo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148716525591015846)
,p_name=>'P109_ALIAS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(48357904359997002)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(149177550005584807)
,p_name=>'bloquear columna'
,p_event_sequence=>10
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(48357904359997002)
,p_triggering_element=>'ID_FRMLRIO_RGION_ITEM_PGNA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(149177627067584808)
,p_event_id=>wwv_flow_api.id(149177550005584807)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'ID_FRMLRIO_RGION_ITEM'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(48359124967997014)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(48357904359997002)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Concepto Relacional: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
