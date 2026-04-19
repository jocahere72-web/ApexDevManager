prompt --application/pages/page_00030
begin
wwv_flow_api.create_page(
 p_id=>30
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Condiciones'
,p_page_mode=>'MODAL'
,p_step_title=>'Condiciones'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'',
'function isNumber(event) {',
'    if (event) {',
'        var charCode = (event.which) ? event.which : event.keyCode;',
'        if (event.altKey // alt',
'            || event.ctrlKey // crtl',
'            || event.shiftKey // shift',
'            || event.which === 0 // special chars',
'            || !(',
'                   (charCode >= 48 && charCode <= 57) // numbers',
'                || charCode === 13  // Enter',
'                || (charCode >= 96 && charCode <= 105) // numblocks',
'                || (charCode >= 37 && charCode <= 40) // cursors',
'                || charCode === 8 // backspace',
'                || charCode === 46  // delete',
'                ) ',
'          ) { ',
'            event.preventDefault();',
'            return false;',
'        }',
'    }',
'    return true;',
'};'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'60%'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250429171634'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(45459281543856317)
,p_plug_name=>unistr('Informaci\00F3n de Condici\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(45460281665856327)
,p_plug_name=>'Funciones - Reglas de Negocio'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select id_dscnto_fncion,',
'        id_dscnto_rgla,',
'        id_dscnto_cndcion,',
'        id_rgla_ngcio_clnte_fncion,',
'        dscrpcion',
'        actvo',
'   from re_g_descuentos_funcion    a',
' where id_dscnto_cndcion           = :P30_ID_DSCNTO_CNDCION'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P30_ID_DSCNTO_CNDCION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P30_ID_DSCNTO_CNDCION'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(47250129906112302)
,p_name=>'ID_DSCNTO_FNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSCNTO_FNCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(47250202666112303)
,p_name=>'ID_DSCNTO_RGLA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSCNTO_RGLA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P30_ID_DSCNTO_RGLA'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(47250318130112304)
,p_name=>'ID_DSCNTO_CNDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSCNTO_CNDCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P30_ID_DSCNTO_CNDCION'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(47250431627112305)
,p_name=>'ID_RGLA_NGCIO_CLNTE_FNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RGLA_NGCIO_CLNTE_FNCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Funci\00F3n - Regla de Negocio')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select c.dscrpcion||'' - ''||a.DSCRP_RGLA_NGCIO_CLNTE,',
'        b.id_rgla_ngcio_clnte_fncion',
'   from v_gn_d_reglas_negocio_cliente   a',
'   join gn_d_rglas_ngcio_clnte_fnc      b on a.id_rgla_ngcio_clnte  = b.id_rgla_ngcio_clnte',
'   join gn_d_funciones                  c on b.id_fncion            = c.id_fncion',
'  where a.cdgo_clnte                    = :F_CDGO_CLNTE',
'    and a.id_impsto                     = :P30_ID_IMPSTO',
'    and a.id_impsto_sbmpsto             = :P30_ID_IMPSTO_SBMPSTO',
'    --and a.id_prcso = 73',
';'))
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
 p_id=>wwv_flow_api.id(47250897087112309)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFActivo?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>false
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
,p_default_type=>'STATIC'
,p_default_expression=>'S'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(47250953355112310)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(47251034156112311)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(47250001881112301)
,p_internal_uid=>47250001881112301
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
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
 p_id=>wwv_flow_api.id(47259730998139475)
,p_interactive_grid_id=>wwv_flow_api.id(47250001881112301)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(47259845189139476)
,p_report_id=>wwv_flow_api.id(47259730998139475)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(47260333630139480)
,p_view_id=>wwv_flow_api.id(47259845189139476)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(47250129906112302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(47260820900139482)
,p_view_id=>wwv_flow_api.id(47259845189139476)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(47250202666112303)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(47261368382139483)
,p_view_id=>wwv_flow_api.id(47259845189139476)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(47250318130112304)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(47261892939139485)
,p_view_id=>wwv_flow_api.id(47259845189139476)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(47250431627112305)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(47263888899139494)
,p_view_id=>wwv_flow_api.id(47259845189139476)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(47250897087112309)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(47264371635139495)
,p_view_id=>wwv_flow_api.id(47259845189139476)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(47250953355112310)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(180470639052444298)
,p_plug_name=>'Paz y Salvo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(180470903291444301)
,p_plug_name=>unistr('Fecha L\00EDmite Paz y Salvo')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(181144990324068411)
,p_plug_name=>'Pago'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(181145725267068414)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177323513323050604)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(181146121287068415)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(181145725267068414)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar / Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(181145595589068414)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(181145725267068414)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P30_ID_DSCNTO_CNDCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(181145446180068414)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(181145725267068414)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P30_ID_DSCNTO_CNDCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(181145382861068414)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(181145725267068414)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P30_ID_DSCNTO_CNDCION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45459300224856318)
,p_name=>'P30_CDGO_DSC_CNDCION_TPO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(45459281543856317)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Tipo de Condici\00F3n')
,p_source=>'CDGO_DSCNTO_CNDCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Documento de Pago;DCM,Paz y Salvo;PYS,Funciones de Regla de Negocio;FNC'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Seleccione de la lista el tipo de condici\00F3n del descuento.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45459422590856319)
,p_name=>'P30_ACTVO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(45459281543856317)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione "S\00ED" para activar la condici\00F3n de descuento y "No" para desactivarla.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47764031895414915)
,p_name=>'P30_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(45460281665856327)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47764117339414916)
,p_name=>'P30_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(45460281665856327)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(180470368338444296)
,p_name=>'P30_DESDE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(181144990324068411)
,p_prompt=>'<u><b>Desde</b></u>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(180470445715444297)
,p_name=>'P30_HASTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(181144990324068411)
,p_prompt=>'<u><b>Hasta</b></u>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(180470706341444299)
,p_name=>'P30_DESDE_TITULO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(180470639052444298)
,p_prompt=>'<u><b>Desde</b></u>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(180470824844444300)
,p_name=>'P30_HASTA_TITULO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(180470639052444298)
,p_prompt=>'<u><b>Hasta</b></u>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181148487657068419)
,p_name=>'P30_ID_DSCNTO_CNDCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(45459281543856317)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_DSCNTO_CNDCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181150081313068444)
,p_name=>'P30_VGNCIA_DSDE_PGO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(181144990324068411)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vigencia'
,p_source=>'VGNCIA_DSDE_PGO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione de la lista la vigencia inicial de pago.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181150477158068444)
,p_name=>'P30_ID_PRDO_DSDE_PGO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(181144990324068411)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Periodo'
,p_source=>'ID_PRDO_DSDE_PGO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select prdo as d,',
'       id_prdo as r',
'  from df_i_periodos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and vgncia = :P30_VGNCIA_DSDE_PGO ',
'   and id_impsto = (select id_impsto from re_g_descuentos_regla where id_dscnto_rgla = :P9_ID_DSCNTO_RGLA)',
' order by 1',
' '))
,p_lov_cascade_parent_items=>'P30_VGNCIA_DSDE_PGO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione de la lista el periodo inicial de pago'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181150907749068446)
,p_name=>'P30_VGNCIA_HSTA_PGO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(181144990324068411)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vigencia'
,p_source=>'VGNCIA_HSTA_PGO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione de la lista la vigencia final de pago.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181151283868068446)
,p_name=>'P30_ID_PRDO_HSTA_PGO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(181144990324068411)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Periodo'
,p_source=>'ID_PRDO_HSTA_PGO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select prdo as d,',
'       id_prdo as r',
'  from df_i_periodos  ',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and vgncia = :P30_VGNCIA_HSTA_PGO',
'   and id_impsto = (select id_impsto from re_g_descuentos_regla where id_dscnto_rgla = :P9_ID_DSCNTO_RGLA)',
' order by 1'))
,p_lov_cascade_parent_items=>'P30_VGNCIA_HSTA_PGO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Seleccione de la lista el periodo final de pago.',
''))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181151664464068446)
,p_name=>'P30_VGNCIA_DSDE_PAZ_SLVO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(180470639052444298)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vigencia '
,p_source=>'VGNCIA_DSDE_PAZ_SLVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione la vigencia inicial del Paz y salvo'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181152107915068446)
,p_name=>'P30_ID_PRDO_DSDE_PAZ_SLVO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(180470639052444298)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Periodo'
,p_source=>'ID_PRDO_DSDE_PAZ_SLVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select prdo as d,',
'       id_prdo as r',
'  from df_i_periodos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and vgncia = :P30_VGNCIA_DSDE_PAZ_SLVO',
'   and id_impsto = (select id_impsto from re_g_descuentos_regla where id_dscnto_rgla = :P9_ID_DSCNTO_RGLA)',
' order by 1',
' '))
,p_lov_cascade_parent_items=>'P30_VGNCIA_DSDE_PAZ_SLVO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione el periodo inicial del Paz y salvo'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181152511115068446)
,p_name=>'P30_VGNCIA_HSTA_PAZ_SLVO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(180470639052444298)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vigencia'
,p_source=>'VGNCIA_HSTA_PAZ_SLVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista la vigencia final del Paz y salvo'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181152893569068447)
,p_name=>'P30_ID_PRDO_HSTA_PAZ_SLVO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(180470639052444298)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Periodo'
,p_source=>'ID_PRDO_HSTA_PAZ_SLVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select prdo as d,',
'       id_prdo as r',
'  from df_i_periodos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and vgncia = :P30_VGNCIA_HSTA_PAZ_SLVO',
'   and id_impsto = (select id_impsto from re_g_descuentos_regla where id_dscnto_rgla = :P9_ID_DSCNTO_RGLA)',
' order by 1'))
,p_lov_cascade_parent_items=>'P30_VGNCIA_HSTA_PAZ_SLVO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione de la lista el periodo final del Paz y salvo'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181153303262068447)
,p_name=>'P30_FCHA_LMTE_PAZ_SLVO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(180470903291444301)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Fecha L\00EDmite ')
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'FCHA_LMTE_PAZ_SLVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>255
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha l\00EDmite del paz y salvo.')
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181154926144068448)
,p_name=>'P30_ID_DSCNTO_RGLA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(45459281543856317)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_DSCNTO_RGLA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(180471588223444308)
,p_validation_name=>'Vigencia Hasta de Pago Menor que Vigencia Desde de Pago'
,p_validation_sequence=>20
,p_validation=>'( :P30_VGNCIA_DSDE_PGO <= :P30_VGNCIA_HSTA_PGO)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La Vigencia Hasta, no puede ser menor que la Vigencia Desde'
,p_validation_condition=>'P30_CDGO_DSC_CNDCION_TPO'
,p_validation_condition2=>'DCM'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(181150907749068446)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(181216580397384160)
,p_validation_name=>'Vigencia Hasta de Paz y Salvo Menor que Vigencia Desde de Paz y Salvo'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'( :P30_VGNCIA_DSDE_PAZ_SLVO <= ',
' :P30_VGNCIA_HSTA_PAZ_SLVO)'))
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La Vigencia Hasta, no puede ser menor que la Vigencia Desde'
,p_validation_condition=>'P30_CDGO_DSC_CNDCION_TPO'
,p_validation_condition2=>'PYS'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(181152511115068446)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(47762849780414903)
,p_validation_name=>'Vigencia Desde Pago no Nula'
,p_validation_sequence=>50
,p_validation=>'P30_VGNCIA_DSDE_PGO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe ingresar un valor a Vigencia Desde'
,p_validation_condition=>'P30_CDGO_DSC_CNDCION_TPO'
,p_validation_condition2=>'DCM'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(181150081313068444)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(47763550865414910)
,p_validation_name=>'Periodo Desde Pago no Nulo'
,p_validation_sequence=>60
,p_validation=>'P30_ID_PRDO_DSDE_PGO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe ingresar un valor a Periodo Desde'
,p_validation_condition=>'P30_CDGO_DSC_CNDCION_TPO'
,p_validation_condition2=>'DCM'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(181150477158068444)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(47763008498414905)
,p_validation_name=>'Vigencia Hasta Pago no Nula'
,p_validation_sequence=>80
,p_validation=>'P30_VGNCIA_HSTA_PGO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe ingresar un valor a Vigencia Hasta'
,p_validation_condition=>'P30_CDGO_DSC_CNDCION_TPO'
,p_validation_condition2=>'DCM'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(181150907749068446)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(47763610809414911)
,p_validation_name=>'Periodo Hasta Pago no Nulo'
,p_validation_sequence=>90
,p_validation=>'P30_ID_PRDO_HSTA_PGO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe ingresar un valor a Periodo Hasta'
,p_validation_condition=>'P30_CDGO_DSC_CNDCION_TPO'
,p_validation_condition2=>'DCM'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(181151283868068446)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(47763378616414908)
,p_validation_name=>'Vigencia Desde Paz y Salvo no Nula'
,p_validation_sequence=>100
,p_validation=>'P30_VGNCIA_DSDE_PAZ_SLVO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe ingresar un valor a Vigencia Desde'
,p_validation_condition=>'P30_CDGO_DSC_CNDCION_TPO'
,p_validation_condition2=>'PYS'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(181151664464068446)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(47763730552414912)
,p_validation_name=>'Periodo Desde Paz y Salvo no Nulo'
,p_validation_sequence=>110
,p_validation=>'P30_ID_PRDO_DSDE_PAZ_SLVO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe ingresar un valor a Periodo Desde'
,p_validation_condition=>'P30_CDGO_DSC_CNDCION_TPO'
,p_validation_condition2=>'PYS'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(181152107915068446)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(47763406152414909)
,p_validation_name=>'Vigencia Hasta Paz y Salvo no Nula'
,p_validation_sequence=>130
,p_validation=>'P30_VGNCIA_HSTA_PAZ_SLVO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe ingresar un valor a Vigencia Hasta'
,p_validation_condition=>'P30_CDGO_DSC_CNDCION_TPO'
,p_validation_condition2=>'PYS'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(181152511115068446)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(47763812622414913)
,p_validation_name=>'Periodo Hasta Paz y Salvo no Nulo'
,p_validation_sequence=>140
,p_validation=>'P30_ID_PRDO_HSTA_PAZ_SLVO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe ingresar un valor a Periodo Hasta'
,p_validation_condition=>'P30_CDGO_DSC_CNDCION_TPO'
,p_validation_condition2=>'PYS'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(181152893569068447)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(181146198471068415)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(181146121287068415)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(181147006065068416)
,p_event_id=>wwv_flow_api.id(181146198471068415)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(180471057544444303)
,p_name=>'Solo_numeros'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(181144990324068411)
,p_bind_type=>'bind'
,p_bind_event_type=>'keydown'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(180471163223444304)
,p_event_id=>wwv_flow_api.id(180471057544444303)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return isNumber(event);',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(180471276461444305)
,p_name=>'Solo_numero'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(180470639052444298)
,p_bind_type=>'bind'
,p_bind_event_type=>'keydown'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(180471404487444306)
,p_event_id=>wwv_flow_api.id(180471276461444305)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'return isNumber(event);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(183940445379921470)
,p_name=>'valida '
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_VGNCIA_DSDE_PGO'
,p_condition_element=>'P30_VGNCIA_DSDE_PGO'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(183940554115921471)
,p_event_id=>wwv_flow_api.id(183940445379921470)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P30_ID_PRDO_DSDE_PGO,P30_VGNCIA_HSTA_PGO,P30_ID_PRDO_HSTA_PGO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(183940647836921472)
,p_event_id=>wwv_flow_api.id(183940445379921470)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P30_ID_PRDO_DSDE_PGO,P30_VGNCIA_HSTA_PGO,P30_ID_PRDO_HSTA_PGO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(183940833483921473)
,p_name=>'Valida vigencia tenga valor'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_VGNCIA_DSDE_PAZ_SLVO'
,p_condition_element=>'P30_VGNCIA_DSDE_PAZ_SLVO'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(183940886310921474)
,p_event_id=>wwv_flow_api.id(183940833483921473)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P30_ID_PRDO_DSDE_PAZ_SLVO,P30_VGNCIA_HSTA_PAZ_SLVO,P30_ID_PRDO_HSTA_PAZ_SLVO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(183940954143921475)
,p_event_id=>wwv_flow_api.id(183940833483921473)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P30_ID_PRDO_DSDE_PAZ_SLVO,P30_VGNCIA_HSTA_PAZ_SLVO,P30_ID_PRDO_HSTA_PAZ_SLVO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(45459550263856320)
,p_name=>unistr('Mostrar Regi\00F3n de Pago si el tipo de condici\00F3n es de documento')
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_CDGO_DSC_CNDCION_TPO'
,p_condition_element=>'P30_CDGO_DSC_CNDCION_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'DCM'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(45459670051856321)
,p_event_id=>wwv_flow_api.id(45459550263856320)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(181144990324068411)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(45459738031856322)
,p_event_id=>wwv_flow_api.id(45459550263856320)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(181144990324068411)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(45460788528856332)
,p_name=>unistr('Mostrar Regi\00F3n de Paz y Salvo si el tipo de condici\00F3n es de Paz y salvo')
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_CDGO_DSC_CNDCION_TPO'
,p_condition_element=>'P30_CDGO_DSC_CNDCION_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'PYS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(45461047235856335)
,p_event_id=>wwv_flow_api.id(45460788528856332)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(180470639052444298)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(45461200897856337)
,p_event_id=>wwv_flow_api.id(45460788528856332)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(180470903291444301)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(45461980675856344)
,p_event_id=>wwv_flow_api.id(45460788528856332)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(180470639052444298)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(45462035035856345)
,p_event_id=>wwv_flow_api.id(45460788528856332)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(180470903291444301)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(45462156457856346)
,p_name=>unistr('Mostrar Regi\00F3n de Funciones si el tipo de condici\00F3n es de Funciones')
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_CDGO_DSC_CNDCION_TPO'
,p_condition_element=>'P30_CDGO_DSC_CNDCION_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'FNC'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(45462287791856347)
,p_event_id=>wwv_flow_api.id(45462156457856346)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(45460281665856327)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(45462407384856349)
,p_event_id=>wwv_flow_api.id(45462156457856346)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(45460281665856327)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(181156047064068451)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from RE_G_DESCUENTOS_CONDICION'
,p_attribute_02=>'RE_G_DESCUENTOS_CONDICION'
,p_attribute_03=>'P30_ID_DSCNTO_CNDCION'
,p_attribute_04=>'ID_DSCNTO_CNDCION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(47763917754414914)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Antes de Insertar Condiciones'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    if :P30_CDGO_DSC_CNDCION_TPO = ''DCM'' then',
'        :P30_VGNCIA_DSDE_PAZ_SLVO    := null;',
'        :P30_ID_PRDO_DSDE_PAZ_SLVO   := null; ',
'        :P30_VGNCIA_HSTA_PAZ_SLVO    := null;',
'        :P30_ID_PRDO_HSTA_PAZ_SLVO   := null;',
'        :P30_FCHA_LMTE_PAZ_SLVO      := null;',
'    elsif :P30_CDGO_DSC_CNDCION_TPO = ''PYS'' then',
'        :P30_VGNCIA_DSDE_PGO         := null;',
'        :P30_ID_PRDO_DSDE_PGO        := null;',
'        :P30_VGNCIA_HSTA_PGO         := null;',
'        :P30_ID_PRDO_HSTA_PGO        := null;',
'     else',
'        :P30_VGNCIA_DSDE_PAZ_SLVO    := null;',
'        :P30_ID_PRDO_DSDE_PAZ_SLVO   := null; ',
'        :P30_VGNCIA_HSTA_PAZ_SLVO    := null;',
'        :P30_ID_PRDO_HSTA_PAZ_SLVO   := null;',
'        :P30_FCHA_LMTE_PAZ_SLVO      := null;',
'        :P30_VGNCIA_DSDE_PGO         := null;',
'        :P30_ID_PRDO_DSDE_PGO        := null;',
'        :P30_VGNCIA_HSTA_PGO         := null;',
'        :P30_ID_PRDO_HSTA_PGO        := null;',
'         ',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(181156493562068451)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of RE_G_DESCUENTOS_CONDICION'
,p_attribute_02=>'RE_G_DESCUENTOS_CONDICION'
,p_attribute_03=>'P30_ID_DSCNTO_CNDCION'
,p_attribute_04=>'ID_DSCNTO_CNDCION'
,p_attribute_09=>'P30_ID_DSCNTO_CNDCION'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n Procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(47251137327112312)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(45460281665856327)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Funciones - Reglas de Negocio - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE,CREATE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_exec_cond_for_each_row=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(181157271810068451)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
