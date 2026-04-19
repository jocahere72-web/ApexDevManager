prompt --application/pages/page_00190
begin
wwv_flow_api.create_page(
 p_id=>190
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Calendario Presentaci\00F3n Ex\00F3gena')
,p_step_title=>unistr('Calendario Presentaci\00F3n Ex\00F3gena')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20250627152231'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104384695443128418)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
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
unistr('	Funcionalidad que permite ingresar, consultar, modificar y eliminar las fechas de presentaci\00F3n de la declaraci\00F3n ex\00F3gena para una vigencia espec\00EDfica.'),
'<br><br>	',
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104385080177128422)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104416105139474138)
,p_plug_name=>unistr('Calendario para la Declaraci\00F3n Ex\00F3gena')
,p_region_name=>'calendario'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_clndrio_exgna,',
'       a.cdgo_clnte,',
'       a.id_impsto,',
'       a.vgncia,',
'       a.fcha_dsde,',
'       a.fcha_hsta,',
'       a.ultmo_dgto_nit,',
'       a.id_prdo',
'  from df_i_calendario_exogena a',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_impsto  = :P190_IMPSTO',
'   and a.vgncia     = :P190_VIGENCIA',
'   and a.id_prdo    = :P190_PRDO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P190_IMPSTO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12174938472665127)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
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
,p_default_expression=>'P190_PRDO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104384781681128419)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104384830124128420)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104385548701128427)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
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
 p_id=>wwv_flow_api.id(104419196901474143)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
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
,p_default_expression=>'P190_IMPSTO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104419713476474143)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P190_VIGENCIA'
,p_duplicate_value=>true
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104420311925474144)
,p_name=>'FCHA_DSDE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_DSDE'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104420928567474144)
,p_name=>'FCHA_HSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_HSTA'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha M\00E1xima<br>de Presentaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_format_mask=>'dd/mm/yyyy'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104421520217474145)
,p_name=>'ULTMO_DGTO_NIT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ULTMO_DGTO_NIT'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('\00DAltimo D\00EDgito<br>de NIT')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_item_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:0;0,1;1,2;2,3;3,4;4,5;5,6;6,7;7,8;8,9;9'
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
 p_id=>wwv_flow_api.id(186979044635307602)
,p_name=>'ID_CLNDRIO_EXGNA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CLNDRIO_EXGNA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(104416691308474139)
,p_internal_uid=>104416691308474139
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
 p_id=>wwv_flow_api.id(104417036762474139)
,p_interactive_grid_id=>wwv_flow_api.id(104416691308474139)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(104417147818474139)
,p_report_id=>wwv_flow_api.id(104417036762474139)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12366706592049451)
,p_view_id=>wwv_flow_api.id(104417147818474139)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(12174938472665127)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104419518290474143)
,p_view_id=>wwv_flow_api.id(104417147818474139)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(104419196901474143)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104420158331474144)
,p_view_id=>wwv_flow_api.id(104417147818474139)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(104419713476474143)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>141
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104420760668474144)
,p_view_id=>wwv_flow_api.id(104417147818474139)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(104420311925474144)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104421374651474145)
,p_view_id=>wwv_flow_api.id(104417147818474139)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(104420928567474144)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104421912070474145)
,p_view_id=>wwv_flow_api.id(104417147818474139)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(104421520217474145)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104430472056568836)
,p_view_id=>wwv_flow_api.id(104417147818474139)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(104384781681128419)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104540885919392698)
,p_view_id=>wwv_flow_api.id(104417147818474139)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(104385548701128427)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(187079240275869197)
,p_view_id=>wwv_flow_api.id(104417147818474139)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(186979044635307602)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(104385427911128426)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(104385080177128422)
,p_button_name=>'CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column=>3
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11576585636196547)
,p_name=>'P190_PRDO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(104385080177128422)
,p_prompt=>'Periodo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.prdo||'' - ''||a.dscrpcion||''[''||a.cdgo_prdcdad||''] - ''|| b.nmbre_impsto_sbmpsto||''[''||b.cdgo_impsto_sbmpsto||'']'' d,',
'a.id_prdo r',
'from df_i_periodos a',
'join df_i_impuestos_subimpuesto b on b.id_impsto = a.id_impsto',
'                                  AND b.id_impsto_sbmpsto = a.id_impsto_sbmpsto',
'where a.id_impsto = :P190_IMPSTO',
'and a.vgncia = :P190_VIGENCIA',
'and b.actvo = ''S''',
'order by a.id_impsto, a.id_impsto_sbmpsto, a.cdgo_prdcdad, a.prdo asc;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P190_IMPSTO,P190_VIGENCIA'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'30%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104385151000128423)
,p_name=>'P190_VIGENCIA'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(104385080177128422)
,p_prompt=>'Vigencia'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select vgncia as d,',
'       vgncia as r',
'  from df_s_vigencias',
' where vgncia >= 2018',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P190_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'30%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104385205540128424)
,p_name=>'P190_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(104385080177128422)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto as r',
'  from df_c_impuestos ',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and cdgo_impsto = ''ICA'''))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Impuesto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d',
'      ,id_impsto as r',
'  from df_c_impuestos'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'30%'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(104384910691128421)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(104416105139474138)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Calendario para la Declaraci\00F3n Ex\00F3gena - Save Interactive Grid Data')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CONSULTAR'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_process_success_message=>'Se han guardado los cambios.'
);
end;
/
