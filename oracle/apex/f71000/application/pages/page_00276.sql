prompt --application/pages/page_00276
begin
wwv_flow_api.create_page(
 p_id=>276
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('M\00E9todo de aplicaci\00F3n de ajuste generados por otros procesos')
,p_step_title=>unistr('M\00E9todo de aplicaci\00F3n de ajuste generados por otros procesos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1234'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20210309180354'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(196319068519579520)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        ',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'     </b>',
'</h5>',
unistr('<i><p>Funcionalidad que permite parametrizar un metodo de aplicaci\00F3n de ajuste generados por otros procesos.</p></i>'),
'</br>  ',
'<br>        ',
unistr('<i><p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p></i></br>'),
'        '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(196371031527604949)
,p_plug_name=>unistr('M\00E9todo de aplicaci\00F3n de ajuste generados por otros procesos')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_ajsts_gnrdo_cnfg_aplc',
'       ,cdgo_clnte',
'       ,id_fljo',
'       ,ind_ajste_gnrdo',
'       ,id_fljo_gnrdo',
'from gf_d_ajsts_gnrdo_cnfg_aplc a'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(6565049984273133)
,p_name=>'ID_AJSTS_GNRDO_CNFG_APLC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_AJSTS_GNRDO_CNFG_APLC'
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
 p_id=>wwv_flow_api.id(6565168831273134)
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
 p_id=>wwv_flow_api.id(6565215623273135)
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
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_fljo  a',
'       ,id_fljo        b',
'from wf_d_flujos',
'where actvo = ''S'' ',
'order by 2 desc'))
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
 p_id=>wwv_flow_api.id(6565338626273136)
,p_name=>'IND_AJSTE_GNRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IND_AJSTE_GNRDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('M\00E9todo Aplicaci\00F3n  ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:GENERADO;G,AUTOMATICO;A'
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
 p_id=>wwv_flow_api.id(6565452043273137)
,p_name=>'ID_FLJO_GNRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_GNRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Flujo Generado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct  c.dscrpcion_fljo, ',
'        a.id_fljo_hjo      ',
'from wf_d_flujos_tarea_flujo    a',
'join wf_d_flujos                c on a.id_fljo_hjo = c.id_fljo '))
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(196319359726579523)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(196319542137579524)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(196371528261604949)
,p_internal_uid=>196371528261604949
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
 p_id=>wwv_flow_api.id(196371886733604951)
,p_interactive_grid_id=>wwv_flow_api.id(196371528261604949)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(196372013215604951)
,p_report_id=>wwv_flow_api.id(196371886733604951)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7554527283233661)
,p_view_id=>wwv_flow_api.id(196372013215604951)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(6565049984273133)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7555025219233664)
,p_view_id=>wwv_flow_api.id(196372013215604951)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(6565168831273134)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7555537521233666)
,p_view_id=>wwv_flow_api.id(196372013215604951)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(6565215623273135)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7556034071233667)
,p_view_id=>wwv_flow_api.id(196372013215604951)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(6565338626273136)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7556568388233669)
,p_view_id=>wwv_flow_api.id(196372013215604951)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(6565452043273137)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(196392026338641510)
,p_view_id=>wwv_flow_api.id(196372013215604951)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(196319359726579523)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6565518252273138)
,p_validation_name=>unistr('Validaci\00F3n si existe un m\00E9todo aplicaci\00F3n ')
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_fljo number;',
'    v_id_fljo_hjo number;',
'begin',
'    ',
'    select id_fljo,',
'           id_fljo_hjo',
'     into  v_id_fljo, ',
'           v_id_fljo_hjo  ',
'    from wf_d_flujos_tarea_flujo',
'    where id_fljo     = :ID_FLJO',
'      and id_fljo_hjo = :ID_FLJO_GNRDO;',
'    ',
'    if( v_id_fljo = :ID_FLJO  and v_id_fljo_hjo = :ID_FLJO_GNRDO ) then ',
'        return false;',
'    else',
'        return true;',
'    end if;',
'    ',
'exception     ',
'  when no_data_found then',
'        return true;  ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El valor ingresado en  #LABEL# ya se encuentra registrado.'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7551414369227201)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(196371031527604949)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Tipo de Adjuntos - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_exec_cond_for_each_row=>'Y'
);
end;
/
