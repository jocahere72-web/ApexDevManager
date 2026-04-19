prompt --application/pages/page_00022
begin
wwv_flow_api.create_page(
 p_id=>22
,p_user_interface_id=>wwv_flow_api.id(323679016569283847)
,p_name=>'Manejador de Evento de Flujo'
,p_step_title=>'Manejador de Evento de Flujo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(39266481085898285)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20191106161953'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27090282374387301)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(39299295614898312)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
'	Funcionalidad que permite consultar, ingresar, modificar y eliminar los eventos pertenecientes a un flujo de trabajo.',
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(102701995354360801)
,p_plug_name=>'Manejador de Evento de Flujo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(39299295614898312)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_fljo_evnto_mnjdor,',
'       id_fljo,',
'	   id_fljo_trea,',
'	   id_fljo_evnto,',
'	   fncion	',
'  from wf_d_flujos_evento_manejdor',
' where id_fljo_evnto in ( select id_fljo_evnto',
'                            from v_wf_d_flujos_evento',
'                           where cdgo_clnte = :F_CDGO_CLNTE )'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(102650990688149824)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(102651087631149825)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(102703762152360806)
,p_name=>'ID_FLJO_EVNTO_MNJDOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_EVNTO_MNJDOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(102704399781360807)
,p_name=>'ID_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(102655522517182207)
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(102704937277360807)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tarea Flujo'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trea ',
'     , id_fljo_trea',
'  from v_wf_d_flujos_tarea',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_fljo    = :ID_FLJO ',
''))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'ID_FLJO'
,p_ajax_items_to_submit=>'ID_FLJO'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(102705545473360807)
,p_name=>'ID_FLJO_EVNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_EVNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Evento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_evnto || '' - '' ||dscrpcion_fljo as r ',
'     , id_fljo_evnto as v',
'  from v_wf_d_flujos_evento',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'  order by 1'))
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(102706122173360808)
,p_name=>'FNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FNCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>unistr('Funci\00F3n ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
,p_is_required=>true
,p_max_length=>1000
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select p.object_name|| ''.''||p.procedure_name || '' version '' || a.overload d,',
'          nvl2(a.package_name, (a.package_name|| ''.''||a.object_name || ''('' || listagg('':param'' || a.position ,'' , '') within group (order by a.position) || '')''), p.object_name|| ''.''||p.procedure_name || ''()'')  b ',
'     from user_procedures p',
'left join user_arguments a',
'       on p.subprogram_id = a.subprogram_id',
'      and p.object_id     = a.object_id ',
'    where upper(p.object_name) like ''PKG%''',
'      and p.procedure_name is not null',
' group by a.object_name,',
'          a.overload,',
'          a.package_name,',
'          p.object_name,',
'          p.procedure_name;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(102702466683360804)
,p_internal_uid=>102702466683360804
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
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
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
 p_id=>wwv_flow_api.id(102702890108360804)
,p_interactive_grid_id=>wwv_flow_api.id(102702466683360804)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(102702912319360804)
,p_report_id=>wwv_flow_api.id(102702890108360804)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(102704107664360807)
,p_view_id=>wwv_flow_api.id(102702912319360804)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(102703762152360806)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(102704750576360807)
,p_view_id=>wwv_flow_api.id(102702912319360804)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(102704399781360807)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>235
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(102705352518360807)
,p_view_id=>wwv_flow_api.id(102702912319360804)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(102704937277360807)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>159
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(102705956365360807)
,p_view_id=>wwv_flow_api.id(102702912319360804)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(102705545473360807)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>271
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(102706557208360808)
,p_view_id=>wwv_flow_api.id(102702912319360804)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(102706122173360808)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>451
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(102708912246374471)
,p_view_id=>wwv_flow_api.id(102702912319360804)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(102650990688149824)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102767364757077250)
,p_name=>'P22_ID_FLJO_EVNTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(102701995354360801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(27090431463387303)
,p_tabular_form_region_id=>wwv_flow_api.id(102701995354360801)
,p_validation_name=>'Validar Registro Duplicado'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'v number ;',
'begin',
'    select  count (*) into v',
'        from wf_d_flujos_evento_manejdor a ',
'        where a.id_fljo_evnto = :ID_FLJO_EVNTO',
'          and a.id_fljo       = :ID_FLJO',
'          and a.id_fljo_trea  = :ID_FLJO_TREA',
'          and a.fncion        = :FNCION;      ',
'    return not v > 0;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Sr(a). &F_NMBRE_USRIO., el valor ingresado ya se encuentra registrado. Por favor valide e intente nuevamente'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(102651100556149826)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(102701995354360801)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Manejador de Evento de Flujo - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
