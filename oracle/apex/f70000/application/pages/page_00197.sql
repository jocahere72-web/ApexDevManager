prompt --application/pages/page_00197
begin
wwv_flow_api.create_page(
 p_id=>197
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Autorizaci\00F3n por Usuario para liquidar rentas')
,p_step_title=>unistr('Autorizaci\00F3n por Usuario para liquidar rentas')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20210303141859'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(243543823370324250)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
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
unistr('	Funcionalidad que permite ingresar, consultar, modificar y eliminar las tasas de inter\00E9s vigente en un rango de tiempo. '),
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(311135849116377744)
,p_plug_name=>unistr('<b>Usuarios que No requieren autorizaci\00F3n para liquidar rentas</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select id_usrio_rnta_sn_atrzcion ',
'    , cdgo_clnte                ',
'    , id_usrio                  ',
'    , id_impsto_sbmpsto         ',
'    , fcha_incio                ',
'    , fcha_fnal                 ',
'    from gi_g_rntas_usrio_sn_atrzcn',
'	where cdgo_clnte		= :F_CDGO_CLNTE'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(214107706846308595)
,p_name=>'ID_USRIO_RNTA_SN_ATRZCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_USRIO_RNTA_SN_ATRZCION'
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
 p_id=>wwv_flow_api.id(214107750004308596)
,p_name=>'P156_ID_USRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_USRIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Usuario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro',
'    , id_usrio',
'from v_sg_g_usuarios',
'where cdgo_clnte = :F_CDGO_CLNTE',
'    and actvo = ''S''',
'order by nmbre_trcro ;'))
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
 p_id=>wwv_flow_api.id(214107868631308597)
,p_name=>'P156_ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Sub Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto',
'    , id_impsto_sbmpsto',
'from df_i_impuestos_subimpuesto',
'where cdgo_clnte		= :F_CDGO_CLNTE',
'    and id_impsto = (select id_impsto from gi_d_rentas_configuracion where cdgo_clnte = :F_CDGO_CLNTE)',
'order by nmbre_impsto_sbmpsto;',
' '))
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
 p_id=>wwv_flow_api.id(214107994977308598)
,p_name=>'P156_FCHA_INCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_INCIO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Inicio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
,p_item_attributes=>'onkeydown="return false"'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(214108065508308599)
,p_name=>'P156_FCHA_FNAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_FNAL'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Final'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
,p_item_attributes=>'onkeydown="return false"'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(311137120127377750)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(311137600051377751)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_label=>'Actions'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(311138740537377753)
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'F_CDGO_CLNTE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(311136419885377747)
,p_internal_uid=>311136419885377747
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_submit_checked_rows=>false
,p_lazy_loading=>true
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(311136755182377748)
,p_interactive_grid_id=>wwv_flow_api.id(311136419885377747)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(311136845240377749)
,p_report_id=>wwv_flow_api.id(311136755182377748)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(214122277932598236)
,p_view_id=>wwv_flow_api.id(311136845240377749)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(214107706846308595)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(214122771642598251)
,p_view_id=>wwv_flow_api.id(311136845240377749)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(214107750004308596)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(214123306013598254)
,p_view_id=>wwv_flow_api.id(311136845240377749)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(214107868631308597)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(214123784239598257)
,p_view_id=>wwv_flow_api.id(311136845240377749)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(214107994977308598)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(214124301787598259)
,p_view_id=>wwv_flow_api.id(311136845240377749)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(214108065508308599)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(311137992865377752)
,p_view_id=>wwv_flow_api.id(311136845240377749)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(311137600051377751)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(311139154959377753)
,p_view_id=>wwv_flow_api.id(311136845240377749)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(311138740537377753)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(107080261090833862)
,p_tabular_form_region_id=>wwv_flow_api.id(311135849116377744)
,p_validation_name=>'Fecha_Fin_Mayor_Fecha_Inicio'
,p_validation_sequence=>30
,p_validation=>'TO_DATE(:P197_FCHA_INCIO,''DD/MM/YYYY'') <= TO_DATE(:P197_FCHA_FNAL,''DD/MM/YYYY'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La "#COLUMN_HEADER#" debe ser mayor que la "Fecha Desde"'
,p_always_execute=>'Y'
,p_associated_column=>'FCHA_HSTA'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(107079878226833861)
,p_tabular_form_region_id=>wwv_flow_api.id(311135849116377744)
,p_validation_name=>'Validar Rangos de Fecha'
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
' v_id_usrio_rnta_sn_atrzcion number;',
'begin     ',
'  ',
'  --Verifica si el usuaro, subtributo y fechas ya estan parametrizadas',
'  select id_usrio_rnta_sn_atrzcion',
'    into v_id_usrio_rnta_sn_atrzcion',
'    from gi_g_rntas_usrio_sn_atrzcn ',
'   where cdgo_clnte = :F_CDGO_CLNTE',
'    and (to_date(:P197_FCHA_INCIO,''DD/MM/YYYY'') between  fcha_incio                         and  fcha_fnal ',
'         or fcha_incio                     between  to_date(:P197_FCHA_INCIO,''DD/MM/YYYY'')  and  to_date(:P197_FCHA_FNAL,''DD/MM/YYYY''))',
'     and (to_date(:P197_FCHA_FNAL,''DD/MM/YYYY'') between  fcha_incio                         and  fcha_fnal',
'          or fcha_fnal                     between  to_date(:P197_FCHA_INCIO,''DD/MM/YYYY'')  and  to_date(:P197_FCHA_FNAL,''DD/MM/YYYY''))',
'     and id_usrio = :P197_ID_USRIO',
'     and id_impsto_sbmpsto  = :P197_ID_IMPSTO_SBMPSTO ;',
'     ',
'     if v_id_usrio_rnta_sn_atrzcion is null then',
'         return true;  ',
'     else',
'         return false;',
'     end if;',
'',
'exception ',
'     when too_many_rows then ',
'          return false;',
'     when no_data_found then ',
'          return true;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('El rango de fechas ingresado ya esta parametrizado para el Usuario/Sub tributo y esta incluido en otro rango \00F3 abarca un rango de fechas existente.')
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(107080912106833897)
,p_name=>'Al cerrar dialogo'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(107080591472833862)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(311135849116377744)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'GI_G_RNTAS_USRIO_SN_ATRZCN - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CONSULTAR'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
);
end;
/
