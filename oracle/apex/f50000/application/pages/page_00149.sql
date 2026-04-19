prompt --application/pages/page_00149
begin
wwv_flow_api.create_page(
 p_id=>149
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Hist\00F3rico EAN')
,p_step_title=>unistr('Hist\00F3rico EAN')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20200406173106'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67469208983082403)
,p_plug_name=>unistr('Hist\00F3rico EAN')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29551431083068507)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_ean_hstrco',
'     , a.cdgo_clnte',
'     , a.cdgo_ean',
'     , a.fcha_rgstro',
'  from df_h_ean a',
' where a.cdgo_clnte = :F_CDGO_CLNTE'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67469419396082405)
,p_name=>'ID_EAN_HSTRCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EAN_HSTRCO'
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
 p_id=>wwv_flow_api.id(67469562574082406)
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
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'F_CDGO_CLNTE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67469678019082407)
,p_name=>'CDGO_EAN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_EAN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('C\00F3digo EAN ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>13
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
 p_id=>wwv_flow_api.id(67469774811082408)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Fecha de Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67469961048082410)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67470080155082411)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(67469389054082404)
,p_internal_uid=>67469389054082404
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
 p_id=>wwv_flow_api.id(67588497017803149)
,p_interactive_grid_id=>wwv_flow_api.id(67469389054082404)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(67588559394803149)
,p_report_id=>wwv_flow_api.id(67588497017803149)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67589072242803152)
,p_view_id=>wwv_flow_api.id(67588559394803149)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(67469419396082405)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67589462997803156)
,p_view_id=>wwv_flow_api.id(67588559394803149)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(67469562574082406)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67589967321803160)
,p_view_id=>wwv_flow_api.id(67588559394803149)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(67469678019082407)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>370
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67590488186803162)
,p_view_id=>wwv_flow_api.id(67588559394803149)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(67469774811082408)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>559
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67593404124829242)
,p_view_id=>wwv_flow_api.id(67588559394803149)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(67469961048082410)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(70351102205020535)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br><h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
unistr('Funcionalidad que permite consultar, modificar y eliminar el hist\00F3rico de ean en el sistema de informaci\00F3n.'),
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(67470245395082413)
,p_tabular_form_region_id=>wwv_flow_api.id(67469208983082403)
,p_validation_name=>unistr('M\00EDnima Longitud')
,p_validation_sequence=>10
,p_validation=>'length(:CDGO_EAN) = 13'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'#COLUMN_HEADER# debe tener 13 caracteres.'
,p_associated_column=>'CDGO_EAN'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(67470377907082414)
,p_tabular_form_region_id=>wwv_flow_api.id(67469208983082403)
,p_validation_name=>unistr('Valida si Existe el C\00F3digo EAN')
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmbre_clnte df_s_clientes.nmbre_clnte%type;',
'begin',
'    ',
'    select lower(b.nmbre_clnte) as nmbre_clnte',
'      into v_nmbre_clnte',
'      from df_h_ean a',
'      join df_s_clientes b',
'        on a.cdgo_clnte = b.cdgo_clnte',
'     where a.cdgo_clnte <> :F_CDGO_CLNTE',
'       and a.cdgo_ean   = :CDGO_EAN;',
'',
unistr('    return ''El c\00F3digo EAN '' || :CDGO_EAN || '', ya se encuentra parametrizado en el cliente '' || v_nmbre_clnte || ''.'';'),
'    ',
'exception',
'     when no_data_found then ',
'          return null;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'CDGO_EAN'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(67470136926082412)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(67469208983082403)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Crud Hist\00F3rico EAN ')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
