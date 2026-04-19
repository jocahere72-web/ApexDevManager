prompt --application/pages/page_00144
begin
wwv_flow_api.create_page(
 p_id=>144
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Motivo Ajuste por Liquidaci\00F3n ')
,p_step_title=>unistr('Motivo Ajuste por Liquidaci\00F3n ')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.unselectable{',
'     background-color: #ddd  !important;;',
'     cursor: not-allowed !important;',
'}'))
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20200703173021'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(78127824266090070)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
unistr('Funcionalidad que permite ingresar, consultar, modificar y eliminar Motivos de Ajuste por Liquidaci\00F3n.'),
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(78502710374426354)
,p_plug_name=>unistr('Motivo Ajuste por Liquidaci\00F3n ')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select id_lqdcion_mtv_ajst ,',
'           cdgo_clnte ,',
'           id_impsto ,',
'           id_impsto_sbmpsto ,',
'           tpo_ajste ,',
'           id_ajste_mtvo',
'    from gi_d_liquidaciones_mtv_ajst',
'   where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(78502888407426356)
,p_name=>'ID_LQDCION_MTV_AJST'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_LQDCION_MTV_AJST'
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
 p_id=>wwv_flow_api.id(78503018196426357)
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
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(78503111033426358)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(21723560633280508)
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
 p_id=>wwv_flow_api.id(78503135496426359)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Sub-Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select initcap(nmbre_impsto_sbmpsto)  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
'  where id_impsto=:ID_IMPSTO',
' order by 1;'))
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ID_IMPSTO'
,p_ajax_items_to_submit=>'ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(78503329679426360)
,p_name=>'TPO_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_AJSTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tipo de Ajuste'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(39429438658673718)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    console.log($("#"+options.staticId));',
'    $("#"+options.staticId).attr("disabled", true);',
'    return options;',
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(78503413763426361)
,p_name=>'ID_AJSTE_MTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_AJSTE_MTVO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Motivo Ajuste'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.dscrpcion',
'           ,a.id_ajste_mtvo',
'from        gf_d_ajuste_motivo      a',
'where       a.cdgo_clnte        =       :F_CDGO_CLNTE',
'and         a.id_impsto         =       :ID_IMPSTO',
'order by    a.dscrpcion;'))
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
 p_id=>wwv_flow_api.id(78503507987426362)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(78503605222426363)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(78502814744426355)
,p_internal_uid=>78502814744426355
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
 p_id=>wwv_flow_api.id(78687160677183541)
,p_interactive_grid_id=>wwv_flow_api.id(78502814744426355)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(78687287089183541)
,p_report_id=>wwv_flow_api.id(78687160677183541)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(78687741432183545)
,p_view_id=>wwv_flow_api.id(78687287089183541)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(78502888407426356)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(78688262397183547)
,p_view_id=>wwv_flow_api.id(78687287089183541)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(78503018196426357)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(78688806772183549)
,p_view_id=>wwv_flow_api.id(78687287089183541)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(78503111033426358)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(78689250318183550)
,p_view_id=>wwv_flow_api.id(78687287089183541)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(78503135496426359)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(78689813605183552)
,p_view_id=>wwv_flow_api.id(78687287089183541)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(78503329679426360)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(78690307450183553)
,p_view_id=>wwv_flow_api.id(78687287089183541)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(78503413763426361)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(78691376153187057)
,p_view_id=>wwv_flow_api.id(78687287089183541)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(78503507987426362)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39149241365266745)
,p_name=>'Al cambiar ID_AJSTE_MTVO'
,p_event_sequence=>20
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(78502710374426354)
,p_triggering_element=>'ID_AJSTE_MTVO'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'ID_AJSTE_MTVO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39149399518266746)
,p_event_id=>wwv_flow_api.id(39149241365266745)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select tpo_ajste ',
'      into :TPO_AJSTE',
'      from gf_d_ajuste_motivo ',
'     where id_ajste_mtvo = :ID_AJSTE_MTVO;',
'     ',
'exception',
'     when no_data_found then ',
'         :TPO_AJSTE := null;',
'end;',
''))
,p_attribute_02=>'ID_AJSTE_MTVO'
,p_attribute_03=>'TPO_AJSTE'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39444067051807905)
,p_name=>'Al calcular TPO_AJSTE deshabilitar '
,p_event_sequence=>30
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(78502710374426354)
,p_triggering_element=>'TPO_AJSTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39444119818807906)
,p_event_id=>wwv_flow_api.id(39444067051807905)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(this.triggeringElement).attr("disabled", true);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39359889810159661)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(78502710374426354)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Motivo Ajuste por Liquidaci\00F3n : Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
