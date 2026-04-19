prompt --application/pages/page_00131
begin
wwv_flow_api.create_page(
 p_id=>131
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Atributos Extracci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Atributos Extracci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'75%'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20200406190234'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67529982623566305)
,p_plug_name=>'Encabezado'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67550731537388818)
,p_plug_name=>'Atributos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_extrccion_atrbto,',
'        a.id_extrccion_frmlrio,',
'        a.id_frmlrio_rgion_atrbto,',
'        a.orden',
'from    gi_d_extracciones_atributo  a',
'where   a.id_extrccion_frmlrio  =   :P131_ID_EXTRCCION_FRMLRIO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67550914679388820)
,p_name=>'ID_EXTRCCION_ATRBTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EXTRCCION_ATRBTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67551042229388821)
,p_name=>'ID_EXTRCCION_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EXTRCCION_FRMLRIO'
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
,p_default_type=>'ITEM'
,p_default_expression=>'P131_ID_EXTRCCION_FRMLRIO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67551136831388822)
,p_name=>'ID_FRMLRIO_RGION_ATRBTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_RGION_ATRBTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Atributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.dscrpcion,',
'            a.id_frmlrio_rgion_atrbto',
'from        gi_d_frmlrios_rgion_atrbto  a',
'inner join  gi_d_formularios_region     b   on  b.id_frmlrio_rgion  =   a.id_frmlrio_rgion',
'where   exists(',
'                select  1',
'                from    gi_d_extracciones_formulrio c',
'                where   c.id_extrccion_frmlrio  =   :P131_ID_EXTRCCION_FRMLRIO',
'                and     c.id_frmlrio            =   b.id_frmlrio',
'              )',
'and     a.id_frmlrio_rgion   =   nvl(:ID_FRMLRIO_RGION, a.id_frmlrio_rgion)',
'order by    b.orden,',
'            a.orden'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
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
 p_id=>wwv_flow_api.id(67551256138388823)
,p_name=>'ORDEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORDEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Orden'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67551416966388825)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67551505121388826)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67551970425388830)
,p_name=>'ID_FRMLRIO_RGION'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>unistr('Regi\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_frmlrio_rgion',
'from    gi_d_formularios_region a',
'where   exists(',
'                select      *',
'                from        gi_d_extracciones_formulrio b',
'                where       b.id_extrccion_frmlrio  =   :P131_ID_EXTRCCION_FRMLRIO',
'                and         b.id_frmlrio            =   a.id_frmlrio',
'              )',
'order by a.orden'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(67550829337388819)
,p_internal_uid=>67550829337388819
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
 p_id=>wwv_flow_api.id(67604199388168375)
,p_interactive_grid_id=>wwv_flow_api.id(67550829337388819)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(67604231069168375)
,p_report_id=>wwv_flow_api.id(67604199388168375)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67604787395168376)
,p_view_id=>wwv_flow_api.id(67604231069168375)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(67550914679388820)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67605274419168378)
,p_view_id=>wwv_flow_api.id(67604231069168375)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(67551042229388821)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67605785989168379)
,p_view_id=>wwv_flow_api.id(67604231069168375)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(67551136831388822)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67606247614168381)
,p_view_id=>wwv_flow_api.id(67604231069168375)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(67551256138388823)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67614685909203990)
,p_view_id=>wwv_flow_api.id(67604231069168375)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(67551416966388825)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67628005429033427)
,p_view_id=>wwv_flow_api.id(67604231069168375)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(67551970425388830)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(67530023143566306)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(67529982623566305)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67529837096566304)
,p_name=>'P131_ID_EXTRCCION_FRMLRIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(67529982623566305)
,p_prompt=>'Formulario'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.cdgo_frmlrio || '' - '' || b.dscrpcion,',
'            a.id_extrccion_frmlrio',
'from        gi_d_extracciones_formulrio a',
'inner join  gi_d_formularios            b   on  b.id_frmlrio    =   a.id_frmlrio',
'where       a.id_extrccion_frmlrio  =   :P131_ID_EXTRCCION_FRMLRIO;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>9
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(67551615155388827)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(67550731537388818)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Atributos: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
