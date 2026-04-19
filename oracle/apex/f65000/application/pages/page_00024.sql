prompt --application/pages/page_00024
begin
wwv_flow_api.create_page(
 p_id=>24
,p_user_interface_id=>wwv_flow_api.id(30413944355578333)
,p_name=>unistr('Gu\00EDas de Notificaci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Guias de Notificaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ACARABALLO'
,p_last_upd_yyyymmddhh24miss=>'20240531172742'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122265500807567703)
,p_plug_name=>unistr('Gu\00EDas de Notificaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122266123704567709)
,p_plug_name=>unistr('Gu\00EDas')
,p_parent_plug_id=>wwv_flow_api.id(122265500807567703)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30338884622578288)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.seq_id,',
'       a.c001 name,',
'       a.c004 no_guia,',
'       a.c002 file_name,',
'       a.c003 mime_type,',
'       a.d001 created_on,',
unistr('       case when b.id_crreo_certificado is not null then ''S\00ED'' else ''No'' end as "\00BFEncontrada?"'),
'from apex_collections a',
'left join nt_g_correo_certificado b on a.c004 = b.nmro_guia',
'where a.collection_name = ''GUIAS_NOTIFICACION'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from apex_collections',
'where collection_name = ''GUIAS_NOTIFICACION'''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35333662163237801)
,p_name=>unistr('\00BFEncontrada?')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('\00BFEncontrada?')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFEncontrada?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>2
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(122266530075567713)
,p_name=>'NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(122267408571567722)
,p_name=>'FILE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FILE_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(122267509165567723)
,p_name=>'MIME_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MIME_TYPE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(122267749505567725)
,p_name=>'CREATED_ON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_ON'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(122267820424567726)
,p_name=>'NO_GUIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NO_GUIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('No. Gu\00EDa')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(122268004427567728)
,p_name=>'SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(122266232675567710)
,p_internal_uid=>122266232675567710
,p_is_editable=>false
,p_lazy_loading=>false
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
 p_id=>wwv_flow_api.id(122388914243516164)
,p_interactive_grid_id=>wwv_flow_api.id(122266232675567710)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>5
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(122389022091516166)
,p_report_id=>wwv_flow_api.id(122388914243516164)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35339828758237981)
,p_view_id=>wwv_flow_api.id(122389022091516166)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(35333662163237801)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(122390510734516175)
,p_view_id=>wwv_flow_api.id(122389022091516166)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(122266530075567713)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(122441508606656080)
,p_view_id=>wwv_flow_api.id(122389022091516166)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(122267408571567722)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(122442032181656083)
,p_view_id=>wwv_flow_api.id(122389022091516166)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(122267509165567723)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(122479862437868672)
,p_view_id=>wwv_flow_api.id(122389022091516166)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(122267749505567725)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(122499554378131624)
,p_view_id=>wwv_flow_api.id(122389022091516166)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(122267820424567726)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(122526408246200373)
,p_view_id=>wwv_flow_api.id(122389022091516166)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(122268004427567728)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(122265800789567706)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(122265500807567703)
,p_button_name=>'BTN_CNCLAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(122265627508567704)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(122265500807567703)
,p_button_name=>'BTN_PRCSAR_GUIAS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Procesar Gu\00EDas')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from apex_collections',
'where collection_name = ''GUIAS_NOTIFICACION'''))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(122267328516567721)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(122265500807567703)
,p_button_name=>'BTN_CNFRMAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Confirmar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'javascript:apex.confirm(''Solo se procesaran las guÃ­as encontradas, Â¿Esta seguro de procesarlas?'', ''BTN_CNFRMAR'');'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from apex_collections',
'where collection_name = ''GUIAS_NOTIFICACION'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122265756658567705)
,p_name=>'P24_GUIAS_NTFCCION'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(122265500807567703)
,p_prompt=>unistr('Gu\00EDas')
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from apex_collections',
'where collection_name = ''GUIAS_NOTIFICACION'''))
,p_display_when_type=>'NOT_EXISTS'
,p_field_template=>wwv_flow_api.id(30391508947578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'REQUEST'
,p_attribute_10=>'Y'
,p_attribute_11=>'image/*,application/pdf'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(122268395645567731)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Confirmar Guias de Notificacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar2(3000);',
'begin',
'    pkg_nt_notificacion.prc_ac_guias_notificacion(',
'        p_cdgo_clnte                => :F_CDGO_CLNTE,',
'        p_collection_name           => ''GUIAS_NOTIFICACION'',',
'        o_cdgo_rspsta               => v_cdgo_rspsta,',
'        o_mnsje_rspsta              => v_mnsje_rspsta',
'    );',
'    --Validamos si hubo errores',
'    if(v_cdgo_rspsta != 0)then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(122267328516567721)
,p_process_success_message=>unistr('\00A1Gu\00EDas actualizadas exitosamente!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(122267205544567720)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Borra Coleccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_existe_coleccion boolean;',
'begin   ',
'    v_existe_coleccion := apex_collection.collection_exists(p_collection_name => ''GUIAS_NOTIFICACION'');',
'    if(v_existe_coleccion)then',
'        apex_collection.truncate_collection( p_collection_name => ''GUIAS_NOTIFICACION'');',
'    end if;',
'end;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_CNCLAR,BTN_CNFRMAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(122266049269567708)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar Ventana'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(122265800789567706)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(122267149762567719)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Guias Notificacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*Creamos la coleccion*/',
'apex_collection.create_or_truncate_collection(',
'    p_collection_name => ''GUIAS_NOTIFICACION''',
');',
'',
'/*Recorremos las guias y guardamos en la temporal*/',
'for c_guias in(select *',
'               from apex_application_temp_files',
'               where application_id = :APP_ID) loop',
'    /*Adicionamos el registro en la coleccion*/',
'    apex_collection.add_member (',
'        p_collection_name   => ''GUIAS_NOTIFICACION'',',
'        p_c001              => c_guias.name,',
'        p_c002              => c_guias.filename,',
'        p_c003              => c_guias.mime_type,',
'        p_c004              => substr(c_guias.filename, 1, instr(c_guias.filename, ''.'' ) - 1),',
'        p_d001              => c_guias.created_on,',
'        p_blob001           => c_guias.blob_content',
'    );',
'    ',
'    ',
'end loop;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(122265627508567704)
);
end;
/
