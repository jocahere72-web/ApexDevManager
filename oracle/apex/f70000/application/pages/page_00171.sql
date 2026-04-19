prompt --application/pages/page_00171
begin
wwv_flow_api.create_page(
 p_id=>171
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Gesti\00F3n Relaci\00F3n de Productos por Resoluci\00F3n ')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Gesti\00F3n Relaci\00F3n de Productos por Resoluci\00F3n ')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_step_template=>wwv_flow_api.id(164066978207707637)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'70%'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20210410102301'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95154250388667139)
,p_plug_name=>unistr('Gesti\00F3n Relaci\00F3n de Productos por Resoluci\00F3n ')
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
 p_id=>wwv_flow_api.id(95190387956075704)
,p_plug_name=>unistr('Gesti\00F3n de Productos  ')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_prdcto',
'     , id_rslcion',
'     , id_rslcion_prdcto',
'  from si_d_resoluciones_producto',
'where id_rslcion = :P171_ID_RSLCION'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P171_ID_RSLCION'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95190579478075706)
,p_name=>'ID_RSLCION_PRDCTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RSLCION_PRDCTO'
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
 p_id=>wwv_flow_api.id(95190641045075707)
,p_name=>'ID_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RSLCION'
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
,p_default_expression=>'P171_ID_RSLCION'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95190814895075709)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95190965876075710)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97264347397471908)
,p_name=>'ID_PRDCTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDCTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select distinct dscrpcion ||'' ''|| cncntrcion ||'' - ''|| dscrpcion_prdcto_frma as v',
'       , id_prdcto                                                             as r       ',
'    from v_gi_d_productos',
'   where actvo = ''S'' '))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(95190434706075705)
,p_internal_uid=>95190434706075705
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
 p_id=>wwv_flow_api.id(95207528182281353)
,p_interactive_grid_id=>wwv_flow_api.id(95190434706075705)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(95207658377281353)
,p_report_id=>wwv_flow_api.id(95207528182281353)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95208170351281362)
,p_view_id=>wwv_flow_api.id(95207658377281353)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(95190579478075706)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95208631041281366)
,p_view_id=>wwv_flow_api.id(95207658377281353)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(95190641045075707)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95210715818306044)
,p_view_id=>wwv_flow_api.id(95207658377281353)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(95190814895075709)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97323480976728455)
,p_view_id=>wwv_flow_api.id(95207658377281353)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(97264347397471908)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95190249255075703)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(95154250388667139)
,p_button_name=>'Btn_Aplicar_Cambios'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P171_ID_RSLCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8097030891788019)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(95154250388667139)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:125:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95190143598075702)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(95154250388667139)
,p_button_name=>'Btn_Eliminar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
,p_button_condition=>'P171_ID_RSLCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95155306055667150)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(95154250388667139)
,p_button_name=>'Btn_Guardar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar '
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P171_ID_RSLCION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(95193404049075735)
,p_branch_name=>unistr('Ir a P\00E1gina 171')
,p_branch_action=>'f?p=&APP_ID.:170:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(95190143598075702)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8106117910863850)
,p_name=>'P171_ID_SCRSAL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(95154250388667139)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_SJTO_SCRSAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95154441097667141)
,p_name=>'P171_ID_RSLCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(95154250388667139)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95154549499667142)
,p_name=>'P171_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(95154250388667139)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95154668049667143)
,p_name=>'P171_NMRO_RSLCION'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(95154250388667139)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00FAmero Resoluci\00F3n')
,p_source=>'NMRO_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95154721826667144)
,p_name=>'P171_FCHA_RSLCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(95154250388667139)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Fecha Resoluci\00F3n')
,p_source=>'FCHA_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95154835047667145)
,p_name=>'P171_FCHA_INCIAL'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(95154250388667139)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Inicial'
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'FCHA_INCIAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95154980481667146)
,p_name=>'P171_FCHA_FNAL'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(95154250388667139)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Final'
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'FCHA_FNAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95155070203667147)
,p_name=>'P171_FILE_BLOB'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(95154250388667139)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Resoluci\00F3n ')
,p_source=>'FILE_BLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
,p_attribute_02=>'FILE_MIMETYPE'
,p_attribute_03=>'FILE_NAME'
,p_attribute_06=>'Y'
,p_attribute_08=>'attachment'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95155123971667148)
,p_name=>'P171_FILE_NAME'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(95154250388667139)
,p_use_cache_before_default=>'NO'
,p_source=>'FILE_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95155225858667149)
,p_name=>'P171_FILE_MIMETYPE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(95154250388667139)
,p_use_cache_before_default=>'NO'
,p_source=>'FILE_MIMETYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(77989767183673845)
,p_validation_name=>unistr('Validaci\00F3n de fecha al cambiar')
,p_validation_sequence=>10
,p_validation=>'TO_DATE(:P171_FCHA_INCIAL,''DD/MM/RR'') <= TO_DATE(:P171_FCHA_FNAL,''DD/MM/RR'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'No debe ser mayor o igual que la Fecha de inicio.'
,p_associated_item=>wwv_flow_api.id(95154980481667146)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(95193292550075733)
,p_validation_name=>'Validar Rangos de Fecha'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
' v_id_rslcion  si_d_resoluciones.id_rslcion%type;',
'begin     ',
'  ',
'  --Verifica si el rango existe',
'  select id_rslcion',
'    into v_id_rslcion',
'    from si_d_resoluciones ',
'   where id_sjto_impsto = :P171_ID_SJTO_IMPSTO',
'     and (to_date(:P171_FCHA_INCIAL,''DD/MM/YYYY'') between  fcha_incial                              and  fcha_fnal ',
'          or fcha_incial                          between  to_date(:P171_FCHA_INCIAL,''DD/MM/YYYY'')  and  to_date(:P171_FCHA_FNAL,''DD/MM/YYYY''))',
'     and (to_date(:P171_FCHA_FNAL,''DD/MM/YYYY'')   between  Fcha_Incial                              and  fcha_fnal',
'          or fcha_fnal                            between  to_date(:P171_FCHA_INCIAL,''DD/MM/YYYY'')  and  to_date(:P171_FCHA_FNAL,''DD/MM/YYYY''));',
'      ',
'      ',
'   if( v_id_rslcion = :P171_ID_RSLCION ) then ',
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
,p_error_message=>unistr('El rango de fechas Ingresado ya esta incluido en una resoluci\00F3n existente.')
,p_validation_condition_type=>'NEVER'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(95193369819075734)
,p_validation_name=>'Blob no null'
,p_validation_sequence=>30
,p_validation=>'P171_FILE_BLOB'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'P171_ID_RSLCION'
,p_validation_condition_type=>'ITEM_IS_NULL'
,p_associated_item=>wwv_flow_api.id(95155070203667147)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(98694023128717806)
,p_name=>'Al cambiar fecha inicial'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P171_FCHA_INCIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(98694118019717807)
,p_event_id=>wwv_flow_api.id(98694023128717806)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P171_FCHA_FNAL").datepicker( ''option'' , ''minDate'' , $("#P171_FCHA_INCIAL").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95190066003075701)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Guardar Datos SI_D_RESOLUCIONES'
,p_attribute_02=>'SI_D_RESOLUCIONES'
,p_attribute_03=>'P171_ID_RSLCION'
,p_attribute_04=>'ID_RSLCION'
,p_attribute_09=>'P171_ID_RSLCION'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95191049634075711)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(95190387956075704)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Guardar Datos de Cuadr\00EDcula Interactiva SI_D_RESOLUCIONES_PRODUCTO')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95154321497667140)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>unistr('Inicializar pantalla Gesti\00F3n Relaci\00F3n de medicamentos por Resoluci\00F3n ')
,p_attribute_02=>'SI_D_RESOLUCIONES'
,p_attribute_03=>'P171_ID_RSLCION'
,p_attribute_04=>'ID_RSLCION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P171_ID_RSLCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
