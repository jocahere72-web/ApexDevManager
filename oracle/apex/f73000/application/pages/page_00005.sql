prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(76451776849582525)
,p_name=>'Valores Metadatos'
,p_page_mode=>'MODAL'
,p_step_title=>'Valores Metadatos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_last_updated_by=>'MCARO'
,p_last_upd_yyyymmddhh24miss=>'20191105141033'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4790779119844213)
,p_plug_name=>'Valores'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(76376636512582469)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select seq_id',
'        , c001',
'        , c002',
'        , n001 ',
'     from apex_collections a',
'    where a.collection_name = ''METADATA_VALORES'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4791119926844217)
,p_name=>'C001'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C001'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Valor Visible'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4791235958844218)
,p_name=>'C002'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C002'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Valor Oculto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4915462015782639)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4915553708782640)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4915747121782642)
,p_name=>'SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(4916525174782650)
,p_name=>'N001'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'N001'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(4790869403844214)
,p_internal_uid=>4790869403844214
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
,p_toolbar_buttons=>'SEARCH_COLUMN:ACTIONS_MENU:RESET:SAVE'
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
 p_id=>wwv_flow_api.id(4856386282632068)
,p_interactive_grid_id=>wwv_flow_api.id(4790869403844214)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(4856482047632068)
,p_report_id=>wwv_flow_api.id(4856386282632068)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4857928765632073)
,p_view_id=>wwv_flow_api.id(4856482047632068)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(4791119926844217)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4858408617632074)
,p_view_id=>wwv_flow_api.id(4856482047632068)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(4791235958844218)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5098673642365326)
,p_view_id=>wwv_flow_api.id(4856482047632068)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(4915462015782639)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5111119671616606)
,p_view_id=>wwv_flow_api.id(4856482047632068)
,p_display_seq=>57
,p_column_id=>wwv_flow_api.id(4915747121782642)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5247788794257697)
,p_view_id=>wwv_flow_api.id(4856482047632068)
,p_display_seq=>58
,p_column_id=>wwv_flow_api.id(4916525174782650)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4916339135782648)
,p_name=>'P5_ID_DCMNTO_TPO_MTDTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4790779119844213)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4915694925782641)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(4790779119844213)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Valores - Save Interactive Grid Data'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_nmro number; ',
'begin ',
'    if not apex_collection.collection_exists( p_collection_name  => ''METADATA_VALORES'') then',
'        apex_collection.create_or_truncate_collection( p_collection_name => ''METADATA_VALORES'');',
'    end if;',
'        ',
'    case :APEX$ROW_STATUS ',
'        when  ''C'' then',
'            ',
'             begin',
'                select count(1)',
'                  into v_nmro ',
'                  from apex_collections a',
'                 where a.collection_name = ''METADATA_VALORES''',
'                   and (a.c002   = trim(:C002) ',
'                    or (a.c002 is null and trim(:C002) is null));',
'               ',
'                if v_nmro > 0 then',
'                   ',
'                   for c_collections in ( select a.seq_id',
'                                            from apex_collections a',
'                                           where a.collection_name = ''METADATA_VALORES''',
'                                             and (a.c002   = trim(:C002) ',
'                                              or (a.c002 is null and trim(:C002) is null))',
'                                        ) ',
'                   loop',
'                       apex_collection.delete_member( p_collection_name => ''METADATA_VALORES''',
'                                                     , p_seq            => c_collections.seq_id );',
'                       commit;',
'                   end loop; ',
'                   raise_application_error(-20001, ''Ya existe un registro con valor oculto '' || :C002 );',
'                end if; ',
'            end;',
'        ',
'            :SEQ_ID := apex_collection.add_member( p_collection_name => ''METADATA_VALORES''',
'                                                 , p_c001            => :C001',
'                                                 , p_c002            => :C002 );',
'                                              ',
'        when ''U'' then',
'            ',
'            begin',
'                select count(1)',
'                  into v_nmro ',
'                  from apex_collections a',
'                 where a.collection_name = ''METADATA_VALORES''',
'                   and (a.c002   = trim(:C002) ',
'                    or (a.c002 is null and trim(:C002) is null))',
'                   and seq_id   != :SEQ_ID;',
'               ',
'                if v_nmro > 0 then                                      ',
'                   raise_application_error(-20001, ''Ya existe un registro con valor oculto '' || :C002 );',
'                end if; ',
'            end;',
'            apex_collection.update_member( p_collection_name => ''METADATA_VALORES''',
'                                         , p_seq  => :SEQ_ID',
'                                         , p_c001 => :C001',
'                                         , p_c002 => :C002',
'                                         , p_n001 => :N001);',
'        when ''D'' then',
'            apex_collection.delete_member( p_collection_name => ''METADATA_VALORES''',
'                                         , p_seq  => :SEQ_ID);',
'            delete from gd_d_dcmntos_tpo_mtdta_vlor where id_dcmnto_tpo_mtdta_vlor = :N001;                                         ',
'',
'    end case;',
'end ;',
''))
,p_attribute_05=>'Y'
,p_attribute_06=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
