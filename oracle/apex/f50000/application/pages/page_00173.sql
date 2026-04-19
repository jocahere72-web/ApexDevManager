prompt --application/pages/page_00173
begin
wwv_flow_api.create_page(
 p_id=>173
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Margen Utilidad Gasolina'
,p_step_title=>'Margen Utilidad Gasolina'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20200727081805'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(78133973428685802)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br> ',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i> ',
'    <p align="justify">Funcionalidad que permite ingresar, consultar, modificar y eliminar los deferentes ',
'	margenes de utilidad de gasolina por tipos de terceros.<br> ',
'        ',
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(78359341416948878)
,p_plug_name=>'Margen Utilidad Gasolina'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid',
'     , id_mrgen_utldad_gslna',
'     , cdgo_trcro_tpo',
'     , mrgen_utldad',
'     , fcha_incio',
'     , fcha_fin ',
'from df_s_margen_utilidad_gslna',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(78205642042692006)
,p_name=>'ID_MRGEN_UTLDAD_GSLNA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_MRGEN_UTLDAD_GSLNA'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(78205711843692007)
,p_name=>'FCHA_INCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_INCIO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Inicio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_format_mask=>'DD/MM/YYYY'
,p_item_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(78205865152692008)
,p_name=>'FCHA_FIN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_FIN'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Fin'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_format_mask=>'DD/MM/YYYY'
,p_item_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(78205926668692009)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(78360580496948882)
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
 p_id=>wwv_flow_api.id(78361051606948888)
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
 p_id=>wwv_flow_api.id(78362888203948892)
,p_name=>'CDGO_TRCRO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TRCRO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('C\00F3digo Tipo Tercero')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion, b.cdgo_trcro_tpo ',
'from  df_s_terceros_tipo b',
'order by b.dscrpcion'))
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
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(78363447743948893)
,p_name=>'MRGEN_UTLDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MRGEN_UTLDAD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Margen Utilidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_item_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_is_required=>true
,p_max_length=>5
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
 p_id=>wwv_flow_api.id(78359870083948879)
,p_internal_uid=>78359870083948879
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
 p_id=>wwv_flow_api.id(78360271946948880)
,p_interactive_grid_id=>wwv_flow_api.id(78359870083948879)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(78360337098948880)
,p_report_id=>wwv_flow_api.id(78360271946948880)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(78361413173948890)
,p_view_id=>wwv_flow_api.id(78360337098948880)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(78361051606948888)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(78363249055948893)
,p_view_id=>wwv_flow_api.id(78360337098948880)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(78362888203948892)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(78363812358948893)
,p_view_id=>wwv_flow_api.id(78360337098948880)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(78363447743948893)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(78439507164282117)
,p_view_id=>wwv_flow_api.id(78360337098948880)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(78205642042692006)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(78440051964282132)
,p_view_id=>wwv_flow_api.id(78360337098948880)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(78205711843692007)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(78440487506282134)
,p_view_id=>wwv_flow_api.id(78360337098948880)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(78205865152692008)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(78457919348491147)
,p_view_id=>wwv_flow_api.id(78360337098948880)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(78205926668692009)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(78205382298692003)
,p_tabular_form_region_id=>wwv_flow_api.id(78359341416948878)
,p_validation_name=>'fecha_fin_mayor_fecha_inicio'
,p_validation_sequence=>10
,p_validation=>'TO_DATE(:FCHA_INCIO,''DD/MM/YYYY'') <= TO_DATE(:FCHA_FIN,''DD/MM/YYYY'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'#COLUMN_HEADER# debe ser mayor que Fecha Inicio'
,p_always_execute=>'Y'
,p_associated_column=>'FCHA_FIN'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(78206084671692010)
,p_tabular_form_region_id=>wwv_flow_api.id(78359341416948878)
,p_validation_name=>'valida_rangos_de_fechas'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' v_id_mrgen_utldad_gslna df_s_margen_utilidad_gslna.id_mrgen_utldad_gslna%type;',
'begin    ',
' ',
'  --Verifica si el rango existe',
'  select id_mrgen_utldad_gslna',
'    into v_id_mrgen_utldad_gslna',
'    from df_s_margen_utilidad_gslna',
'   where cdgo_trcro_tpo = :CDGO_TRCRO_TPO',
'     and (to_date(:FCHA_INCIO,''DD/MM/YYYY'') between  fcha_incio                       and  fcha_fin',
'          or fcha_incio                     between  to_date(:FCHA_INCIO,''DD/MM/YYYY'')  and  to_date(:FCHA_FIN,''DD/MM/YYYY''))',
'     and (to_date(:FCHA_FIN,''DD/MM/YYYY'') between  fcha_incio                        and  fcha_fin',
'          or fcha_fin                     between  to_date(:FCHA_INCIO,''DD/MM/YYYY'')  and  to_date(:FCHA_FIN,''DD/MM/YYYY''))',
'     ',
'     and (  id_mrgen_utldad_gslna != :ID_MRGEN_UTLDAD_GSLNA',
'         or nvl(:ID_MRGEN_UTLDAD_GSLNA,''X'') = ''X''',
'         ) ;',
'     ',
'   -- si encuentra un registro',
'   if( v_id_mrgen_utldad_gslna IS NOT NULL ) then',
'       return false; ',
'   end if;',
'  ',
'exception',
'     when too_many_rows then',
'          return false;',
'     when no_data_found then',
'          return true;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'El rango de fechas ingresado esta incluido en otro rango o abarca un rango de fechas existente.',
''))
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(78365834321948896)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(78359341416948878)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Margen Utilidad Gasolina - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
