prompt --application/pages/page_00056
begin
wwv_flow_api.create_page(
 p_id=>56
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Tasas Mora'
,p_step_title=>'Tasas Mora'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(99268463186773832)
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20201118110950'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29429083695772711)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
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
 p_id=>wwv_flow_api.id(97021109441826205)
,p_plug_name=>'Tasas Mora'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select id_tsa_mra',
'		, cdgo_clnte',
'		, fcha_dsde',
'		, fcha_hsta',
'		, vlor_tsa',
'		, tsa_dria ',
'	 from df_c_tasas_mora ',
'	where cdgo_clnte		= :F_CDGO_CLNTE'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96628971057115542)
,p_name=>'TSA_DRIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TSA_DRIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Tasa diaria'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_format_mask=>'999G999G999G999G990D00000000'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97022380452826211)
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
 p_id=>wwv_flow_api.id(97022860376826212)
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
 p_id=>wwv_flow_api.id(97023460603826213)
,p_name=>'ID_TSA_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TSA_MRA'
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
 p_id=>wwv_flow_api.id(97024000862826214)
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97025262841826215)
,p_name=>'FCHA_DSDE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_DSDE'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Desde'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97025850351826215)
,p_name=>'FCHA_HSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_HSTA'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Hasta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97026461354826216)
,p_name=>'VLOR_TSA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TSA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Tasa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990D00'
,p_item_attributes=>'onkeyup="formatNumber(event,{ precision: 2, thousand: ''.'',decimal: '','' });"  onkeypress="return validarExpresion(event, ''numeroComa'');"'
,p_is_required=>true
,p_max_length=>17
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(97021680210826208)
,p_internal_uid=>97021680210826208
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
 p_id=>wwv_flow_api.id(97022015507826209)
,p_interactive_grid_id=>wwv_flow_api.id(97021680210826208)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(97022105565826210)
,p_report_id=>wwv_flow_api.id(97022015507826209)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97023253190826213)
,p_view_id=>wwv_flow_api.id(97022105565826210)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(97022860376826212)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97023893159826214)
,p_view_id=>wwv_flow_api.id(97022105565826210)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(97023460603826213)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97024415284826214)
,p_view_id=>wwv_flow_api.id(97022105565826210)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(97024000862826214)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97025671881826215)
,p_view_id=>wwv_flow_api.id(97022105565826210)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(97025262841826215)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97026294926826216)
,p_view_id=>wwv_flow_api.id(97022105565826210)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(97025850351826215)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97026873297826216)
,p_view_id=>wwv_flow_api.id(97022105565826210)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(97026461354826216)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>85
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97038243900055684)
,p_view_id=>wwv_flow_api.id(97022105565826210)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(96628971057115542)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>85
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(97474797411250947)
,p_tabular_form_region_id=>wwv_flow_api.id(97021109441826205)
,p_validation_name=>'Fecha_Fin_Mayor_Fecha_Inicio'
,p_validation_sequence=>30
,p_validation=>'TO_DATE(:FCHA_DSDE,''DD/MM/YYYY'') <= TO_DATE(:FCHA_HSTA,''DD/MM/YYYY'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La "#COLUMN_HEADER#" debe ser mayor que la "Fecha Desde"'
,p_always_execute=>'Y'
,p_associated_column=>'FCHA_HSTA'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(39533170670578414)
,p_tabular_form_region_id=>wwv_flow_api.id(97021109441826205)
,p_validation_name=>'Validar Rangos de Fecha'
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
' v_id_tsa_mra df_c_tasas_mora.id_tsa_mra%type;',
'begin     ',
'  ',
'  --Verifica si el rango existe',
'  select id_tsa_mra',
'    into v_id_tsa_mra',
'    from df_c_tasas_mora ',
'   where (to_date(:FCHA_DSDE,''DD/MM/YYYY'') between  fcha_dsde                         and  fcha_hsta ',
'          or fcha_dsde                     between  to_date(:FCHA_DSDE,''DD/MM/YYYY'')  and  to_date(:FCHA_HSTA,''DD/MM/YYYY''))',
'     and (to_date(:FCHA_HSTA,''DD/MM/YYYY'') between  fcha_dsde                         and  fcha_hsta',
'          or fcha_hsta                     between  to_date(:FCHA_DSDE,''DD/MM/YYYY'')  and  to_date(:FCHA_HSTA,''DD/MM/YYYY''));',
'      ',
'   if( v_id_tsa_mra = :ID_TSA_MRA ) then ',
'       return true;',
'   else',
'       return false;    ',
'   end if;',
'   ',
'exception ',
'     when too_many_rows then ',
'          return false;',
'     when no_data_found then ',
'          return true;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El rango de fechas ingresado esta incluido en otro rango o abarca un rango de fechas existente.'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(24344612455774713)
,p_name=>'Al cerrar dialogo'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(97027687731826217)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(97021109441826205)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'DF_C_TASAS_MORA - Save Interactive Grid Data'
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
