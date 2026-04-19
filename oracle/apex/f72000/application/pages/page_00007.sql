prompt --application/pages/page_00007
begin
wwv_flow_api.create_page(
 p_id=>7
,p_user_interface_id=>wwv_flow_api.id(72999165452094574)
,p_name=>'Vigencias'
,p_page_mode=>'MODAL'
,p_step_title=>'Vigencias'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function obtenerVigencias(){',
'    var region = apex.region("P7_VGNCIAS_GRID");',
'    var vigencias  = [];',
'    if (region) {',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;  ',
'        var records = view.view$.grid("getSelectedRecords");',
'        if($.isEmptyObject(records) == false){',
'            for(let i=0; i<records.length; i++){',
'                vigencias.push({"ID_ACTO_VGNCIA":model.getValue(records[i], "ID_ACTO_VGNCIA").trim()});',
'            }',
'           $s("P7_JSON_VGNCIAS",JSON.stringify(vigencias));',
'        }',
'        else{',
'           $s("P7_JSON_VGNCIAS",null);   ',
'        }',
'    }',
'};',
'',
''))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20191230174837'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(111819241535918525)
,p_plug_name=>'Seleccionar Vigencia'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(223683624094157615)
,p_plug_name=>'Vigencias Seleccionadas'
,p_region_name=>'P7_VGNCIAS_GRID'
,p_parent_plug_id=>wwv_flow_api.id(111819241535918525)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select c.id_acto_vgncia, c.vgncia, d.prdo ',
'from gj_g_recursos a',
'inner join v_pq_g_solicitudes b on a.id_slctud = b.id_slctud',
'inner join gn_g_actos_vigencia c on a.id_acto = c.id_acto and',
'                               b.id_sjto_impsto = c.id_sjto_impsto and',
'                               c.id_acto_vgncia not in (select id_acto_vgncia',
'                                                        from gj_g_recursos_vigencia',
'                                                        where id_rcrso = a.id_rcrso)',
'inner join df_i_periodos d on c.id_prdo = d.id_prdo',
'where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO */',
'',
'',
'select  c.id_acto_vgncia, c.vgncia, d.prdo ',
'from gj_g_recursos a',
'inner join v_pq_g_solicitudes       b on    a.id_slctud      = b.id_slctud',
'inner join gn_g_actos_vigencia      c on    a.id_acto        = c.id_acto and',
'                                            b.id_sjto_impsto = c.id_sjto_impsto and',
'                                            c.id_acto_vgncia not in (select id_acto_vgncia from gj_g_recursos_vigencia where id_rcrso = a.id_rcrso)',
'inner join df_i_periodos            d on    c.id_prdo        = d.id_prdo',
'join gf_g_movimientos_financiero    e on    e.id_sjto_impsto = b.id_sjto_impsto  and e.id_prdo = d.id_prdo  and  e.indcdor_mvmnto_blqdo =''N''',
'where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111818828394918521)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(114017894191929501)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(223683834200157617)
,p_name=>'ID_ACTO_VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(223683912997157618)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(223683664598157616)
,p_internal_uid=>223683664598157616
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
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
 p_id=>wwv_flow_api.id(223713643623402778)
,p_interactive_grid_id=>wwv_flow_api.id(223683664598157616)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(223713700474402778)
,p_report_id=>wwv_flow_api.id(223713643623402778)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114023836869929688)
,p_view_id=>wwv_flow_api.id(223713700474402778)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(114017894191929501)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(223714211263402781)
,p_view_id=>wwv_flow_api.id(223713700474402778)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(223683834200157617)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(223714689244402782)
,p_view_id=>wwv_flow_api.id(223713700474402778)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(223683912997157618)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(111819160207918524)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(111819241535918525)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(111819055744918523)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_api.id(111819241535918525)
,p_button_name=>'BTN_ADICIONAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Adicionar Vigencias'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  c.id_acto_vgncia, c.vgncia, d.prdo ',
'from gj_g_recursos a',
'inner join v_pq_g_solicitudes       b on    a.id_slctud      = b.id_slctud',
'inner join gn_g_actos_vigencia      c on    a.id_acto        = c.id_acto and',
'                                            b.id_sjto_impsto = c.id_sjto_impsto and',
'                                            c.id_acto_vgncia not in (select id_acto_vgncia from gj_g_recursos_vigencia where id_rcrso = a.id_rcrso)',
'inner join df_i_periodos            d on    c.id_prdo        = d.id_prdo',
'join gf_g_movimientos_financiero    e on    e.id_sjto_impsto = b.id_sjto_impsto  and e.id_prdo = d.id_prdo  and  e.indcdor_mvmnto_blqdo =''N''',
'where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111902718748539101)
,p_name=>'P7_JSON_VGNCIAS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(111819241535918525)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(114018089229929503)
,p_validation_name=>'Nuevo'
,p_validation_sequence=>10
,p_validation=>'P7_JSON_VGNCIAS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor valide las vigencias seleccionadas'
,p_when_button_pressed=>wwv_flow_api.id(111819055744918523)
,p_associated_item=>wwv_flow_api.id(111902718748539101)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(111902836234539102)
,p_name=>'Al cambiar seleccion en vigencias'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(223683624094157615)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(111902934427539103)
,p_event_id=>wwv_flow_api.id(111902836234539102)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'obtenerVigencias();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50305415086125403)
,p_name=>'Sujeto impuesto sin vigencias asociadas'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NOT_EXISTS'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  c.id_acto_vgncia, c.vgncia, d.prdo ',
'from gj_g_recursos a',
'inner join v_pq_g_solicitudes       b on    a.id_slctud      = b.id_slctud',
'inner join gn_g_actos_vigencia      c on    a.id_acto        = c.id_acto and',
'                                            b.id_sjto_impsto = c.id_sjto_impsto and',
'                                            c.id_acto_vgncia not in (select id_acto_vgncia from gj_g_recursos_vigencia where id_rcrso = a.id_rcrso)',
'inner join df_i_periodos            d on    c.id_prdo        = d.id_prdo',
'join gf_g_movimientos_financiero    e on    e.id_sjto_impsto = b.id_sjto_impsto  and e.id_prdo = d.id_prdo  and  e.indcdor_mvmnto_blqdo =''N''',
'where a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO;'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50305543187125404)
,p_event_id=>wwv_flow_api.id(50305415086125403)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.alert(''Las vigencias asociadas al sujeto impuesto se encuentran bloqueadas. '');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(111903094868539104)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Vigencias'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(4000);',
'begin',
'    pkg_gj_recurso.prc_rg_recrso_vgncias(',
'        p_cdgo_clnte			=> :F_CDGO_CLNTE,',
'        p_id_instncia_fljo_hjo  => :F_ID_INSTNCIA_FLJO,',
'        p_json_vgncias          => :P7_JSON_VGNCIAS,',
'        p_id_usrio			    => :F_ID_USRIO,',
'        o_cdgo_rspsta			=> v_cdgo_rspsta,',
'        o_mnsje_rspsta          => v_mnsje_rspsta',
'    );',
'    ',
'    if(v_cdgo_rspsta != 0)then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(111819055744918523)
,p_process_success_message=>'Vigencias Registradas Exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(111819592319918528)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_ADICIONAR,BTN_CANCELAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
