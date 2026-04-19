prompt --application/pages/page_00173
begin
wwv_flow_api.create_page(
 p_id=>173
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Procesos en Segundo Plano'
,p_page_mode=>'MODAL'
,p_step_title=>'Procesos en Segundo Plano'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function actualizarCronometros() {',
'    // Buscamos todas las filas que tengan nuestra clase de reloj',
'    document.querySelectorAll(''.reloj-dinamico'').forEach(span => {',
'        // Obtenemos la fecha de inicio desde la columna oculta de la misma fila',
'        // APEX IR usa el atributo data-column o headers para identificar celdas',
'        let fila = span.closest(''tr'');',
'        let startStr = fila.querySelector(''td[data-column="START_TIME_ISO"]'')?.innerText || ',
'                       fila.querySelector(''td[headers="START_TIME_ISO"]'')?.innerText;',
'',
'        if (startStr) {',
'            let startTime = new Date(startStr);',
'            let now = new Date();',
'            let diff = Math.floor((now - startTime) / 1000);',
'',
'            if (diff >= 0) {',
'                let h = Math.floor(diff / 3600);',
'                let m = Math.floor((diff % 3600) / 60);',
'                let s = diff % 60;',
'',
'                // Formato HH:MM:SS o MM:SS',
'                let display = (h > 0 ? h + ":" : "") + ',
'                              (m < 10 ? "0" + m : m) + ":" + ',
'                              (s < 10 ? "0" + s : s);',
'                ',
'                span.innerText = display;',
'            }',
'        }',
'    });',
'}',
'',
'// Ejecutar cada segundo',
'setInterval(actualizarCronometros, 1000);'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_dialog_chained=>'N'
,p_last_updated_by=>'LPICO'
,p_last_upd_yyyymmddhh24miss=>'20260317145546'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7314363045225820)
,p_plug_name=>'Panel de Ejecuciones'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27319331228569543)
,p_plug_name=>unistr('Procesos en Segundo Plano en Acci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(7314363045225820)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('-- Parte 1: Selecciona los procesos en ejecuci\00F3n'),
'SELECT ',
unistr('    ''Generaci\00F3n de Documentos'' AS "Proceso en Ejecuci\00F3n",'),
'    ''Ejecutando'' AS "Estado de Proceso",',
'    r.JOB_NAME AS "Nombre de Proceso",',
'    CASE ',
'        WHEN (EXTRACT(DAY FROM r.ELAPSED_TIME)*86400 +',
'              EXTRACT(HOUR FROM r.ELAPSED_TIME)*3600 +',
'              EXTRACT(MINUTE FROM r.ELAPSED_TIME)*60 +',
'              EXTRACT(SECOND FROM r.ELAPSED_TIME)) < 60',
'        THEN TO_CHAR(ROUND(EXTRACT(SECOND FROM r.ELAPSED_TIME))) || '' segundos''',
'        ELSE ',
'            TO_CHAR(FLOOR((EXTRACT(DAY FROM r.ELAPSED_TIME)*86400 +',
'                           EXTRACT(HOUR FROM r.ELAPSED_TIME)*3600 +',
'                           EXTRACT(MINUTE FROM r.ELAPSED_TIME)*60 +',
'                           EXTRACT(SECOND FROM r.ELAPSED_TIME)) / 60)) || '':'' ||',
'            LPAD(MOD(ROUND(EXTRACT(DAY FROM r.ELAPSED_TIME)*86400 +',
'                           EXTRACT(HOUR FROM r.ELAPSED_TIME)*3600 +',
'                           EXTRACT(MINUTE FROM r.ELAPSED_TIME)*60 +',
'                           EXTRACT(SECOND FROM r.ELAPSED_TIME)), 60), 2, ''0'') || '' Minutos''',
unistr('    END AS "Duraci\00F3n",'),
'    ''El proceso se encuentra ejecutando en segundo plano.'' AS "Mensaje Estado"',
'FROM DBA_SCHEDULER_RUNNING_JOBS r',
'WHERE r.JOB_NAME LIKE ''%IT_CB_GN_DCMNTOS_PRSSVO%''',
'   OR r.JOB_NAME LIKE ''%IT_%''',
'',
'UNION ALL',
'',
unistr('-- Parte 2: Muestra el mensaje de "vac\00EDo" solo si no hay registros arriba'),
'SELECT ',
unistr('    ''N/A'' AS "Proceso en Ejecuci\00F3n",'),
'    ''Inactivo'' AS "Estado de Proceso",',
'    ''Ninguno'' AS "Nombre de Proceso",',
unistr('    ''0 segundos'' AS "Duraci\00F3n",'),
unistr('    ''No se est\00E1 ejecutando ning\00FAn proceso en el momento'' AS "Mensaje Estado"'),
'FROM DUAL',
'WHERE NOT EXISTS (',
'    SELECT 1 ',
'    FROM DBA_SCHEDULER_RUNNING_JOBS ',
'    WHERE JOB_NAME LIKE ''%IT_CB_GN_DCMNTOS_PRSSVO%''',
'    OR JOB_NAME like ''%IT_RG_PRCSOS_PRSSVOS%''',
'    OR JOB_NAME like ''%IT_GENERA_SLCCION_PRSSVO_CDDTOS%''',
')',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(7312566890225802)
,p_name=>unistr('Proceso en Ejecuci\00F3n')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('Proceso en Ejecuci\00F3n')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Proceso En Ejecuci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>24
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
 p_id=>wwv_flow_api.id(7312639373225803)
,p_name=>'Estado de Proceso'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Estado de Proceso'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado De Proceso'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_api.id(7312726119225804)
,p_name=>'Nombre de Proceso'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Nombre de Proceso'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre De Proceso'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>128
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
 p_id=>wwv_flow_api.id(7312968908225806)
,p_name=>'Mensaje Estado'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Mensaje Estado'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Mensaje Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>52
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
 p_id=>wwv_flow_api.id(7513965121805308)
,p_name=>unistr('Duraci\00F3n')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('Duraci\00F3n')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Duraci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>51
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_static_id=>'col-cronometro'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(27319472257569544)
,p_internal_uid=>27319472257569544
,p_is_editable=>false
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
 p_id=>wwv_flow_api.id(27549834931891619)
,p_interactive_grid_id=>wwv_flow_api.id(27319472257569544)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(27549950715891620)
,p_report_id=>wwv_flow_api.id(27549834931891619)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7321386788254070)
,p_view_id=>wwv_flow_api.id(27549950715891620)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(7312566890225802)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7321871550254073)
,p_view_id=>wwv_flow_api.id(27549950715891620)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(7312639373225803)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7322390891254075)
,p_view_id=>wwv_flow_api.id(27549950715891620)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(7312726119225804)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7323336300254077)
,p_view_id=>wwv_flow_api.id(27549950715891620)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(7312968908225806)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>355.391
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7529290882925862)
,p_view_id=>wwv_flow_api.id(27549950715891620)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(7513965121805308)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(6420536348916)
,p_view_id=>wwv_flow_api.id(27549950715891620)
,p_execution_seq=>5
,p_name=>'Ejecutando'
,p_background_color=>'#FFFF99'
,p_text_color=>'#000000'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(7312639373225803)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'Ejecutando'
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7316022859225837)
,p_plug_name=>'Historial de Procesos Ejecutados'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7314412989225821)
,p_plug_name=>'Historial de Procesos Ejecutados'
,p_parent_plug_id=>wwv_flow_api.id(7316022859225837)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT *',
'FROM (',
'  SELECT',
'    r.JOB_NAME AS "Nombre del Job",',
'    TO_CHAR(r.ACTUAL_START_DATE, ''DD/MM/YYYY HH24:MI:SS'') AS "Fecha y Hora de Inicio",',
'    TO_CHAR(r.LOG_DATE, ''DD/MM/YYYY HH24:MI:SS'') AS "Fecha Registro Log",',
'    CASE ',
unistr('      WHEN r.STATUS = ''SUCCEEDED'' THEN ''Finaliz\00F3 correctamente'''),
unistr('      WHEN r.STATUS = ''FAILED''    THEN ''Fall\00F3 durante la ejecuci\00F3n'''),
'      WHEN r.STATUS = ''STOPPED''   THEN ''Detenido manualmente''',
unistr('      WHEN r.STATUS = ''RUNNING''   THEN ''En ejecuci\00F3n'''),
'      ELSE r.STATUS',
unistr('    END AS "Estado de la Ejecuci\00F3n",'),
'    CASE ',
'      WHEN (EXTRACT(SECOND FROM r.RUN_DURATION)',
'            + EXTRACT(MINUTE FROM r.RUN_DURATION)*60',
'            + EXTRACT(HOUR   FROM r.RUN_DURATION)*3600',
'            + EXTRACT(DAY    FROM r.RUN_DURATION)*86400) < 60',
'        THEN TO_CHAR(',
'          ROUND(EXTRACT(SECOND FROM r.RUN_DURATION)',
'          + EXTRACT(MINUTE FROM r.RUN_DURATION)*60',
'          + EXTRACT(HOUR   FROM r.RUN_DURATION)*3600',
'          + EXTRACT(DAY    FROM r.RUN_DURATION)*86400)',
'        ) || '' segundos''',
'        ',
'      WHEN (EXTRACT(SECOND FROM r.RUN_DURATION)',
'            + EXTRACT(MINUTE FROM r.RUN_DURATION)*60',
'            + EXTRACT(HOUR   FROM r.RUN_DURATION)*3600',
'            + EXTRACT(DAY    FROM r.RUN_DURATION)*86400) < 3600',
'        THEN TO_CHAR(',
'          ROUND(',
'            (EXTRACT(SECOND FROM r.RUN_DURATION)',
'            + EXTRACT(MINUTE FROM r.RUN_DURATION)*60',
'            + EXTRACT(HOUR   FROM r.RUN_DURATION)*3600',
'            + EXTRACT(DAY    FROM r.RUN_DURATION)*86400) / 60, 2)',
'        ) || '' minutos''',
'        ',
'      WHEN (EXTRACT(SECOND FROM r.RUN_DURATION)',
'            + EXTRACT(MINUTE FROM r.RUN_DURATION)*60',
'            + EXTRACT(HOUR   FROM r.RUN_DURATION)*3600',
'            + EXTRACT(DAY    FROM r.RUN_DURATION)*86400) < 86400',
'        THEN TO_CHAR(',
'          ROUND(',
'            (EXTRACT(SECOND FROM r.RUN_DURATION)',
'            + EXTRACT(MINUTE FROM r.RUN_DURATION)*60',
'            + EXTRACT(HOUR   FROM r.RUN_DURATION)*3600',
'            + EXTRACT(DAY    FROM r.RUN_DURATION)*86400) / 3600, 2)',
'        ) || '' horas''',
'        ',
'      ELSE TO_CHAR(',
'          ROUND(',
'            (EXTRACT(SECOND FROM r.RUN_DURATION)',
'            + EXTRACT(MINUTE FROM r.RUN_DURATION)*60',
'            + EXTRACT(HOUR   FROM r.RUN_DURATION)*3600',
'            + EXTRACT(DAY    FROM r.RUN_DURATION)*86400) / 86400, 2)',
unistr('        ) || '' d\00EDas'''),
unistr('    END AS "Duraci\00F3n",'),
'    ',
unistr('    r.ADDITIONAL_INFO AS "Informaci\00F3n Adicional"'),
'    ',
'  FROM DBA_SCHEDULER_JOB_RUN_DETAILS r',
'  WHERE r.JOB_NAME like ''%IT_CB_GN_DCMNTOS_PRSSVO%'' ',
'    OR r.JOB_NAME like ''%IT_RG_PRCSOS_PRSSVOS%''',
'    OR r.JOB_NAME like ''%IT_GENERA_SLCCION_PRSSVO_CDDTOS%''',
'  ORDER BY r.LOG_DATE DESC',
')',
'WHERE ROWNUM <= 10;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(7315427308225831)
,p_name=>'Nombre del Job'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Nombre del Job'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Del Job'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>261
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
 p_id=>wwv_flow_api.id(7315594542225832)
,p_name=>'Fecha y Hora de Inicio'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Fecha y Hora de Inicio'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Y Hora De Inicio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>19
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
 p_id=>wwv_flow_api.id(7315682331225833)
,p_name=>'Fecha Registro Log'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Fecha Registro Log'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Registro Log'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>19
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
 p_id=>wwv_flow_api.id(7315734266225834)
,p_name=>unistr('Estado de la Ejecuci\00F3n')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('Estado de la Ejecuci\00F3n')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Estado De La Ejecuci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(7315910475225836)
,p_name=>unistr('Informaci\00F3n Adicional')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('Informaci\00F3n Adicional')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Informaci\00F3n Adicional')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(7424294103044001)
,p_name=>unistr('Duraci\00F3n')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('Duraci\00F3n')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Duraci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>49
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(7314892424225825)
,p_internal_uid=>7314892424225825
,p_is_editable=>false
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
 p_id=>wwv_flow_api.id(7334500634624842)
,p_interactive_grid_id=>wwv_flow_api.id(7314892424225825)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(7334647371624842)
,p_report_id=>wwv_flow_api.id(7334500634624842)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7338252721627068)
,p_view_id=>wwv_flow_api.id(7334647371624842)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(7315427308225831)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7338785644627069)
,p_view_id=>wwv_flow_api.id(7334647371624842)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(7315594542225832)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7339299222627070)
,p_view_id=>wwv_flow_api.id(7334647371624842)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(7315682331225833)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7339773012627072)
,p_view_id=>wwv_flow_api.id(7334647371624842)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(7315734266225834)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7340777746627075)
,p_view_id=>wwv_flow_api.id(7334647371624842)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(7315910475225836)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7430366242044153)
,p_view_id=>wwv_flow_api.id(7334647371624842)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(7424294103044001)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(70840999999)
,p_view_id=>wwv_flow_api.id(7334647371624842)
,p_execution_seq=>5
,p_name=>unistr('Finaliz\00F3 correctamente')
,p_column_id=>wwv_flow_api.id(7315734266225834)
,p_background_color=>'#99FF99'
,p_text_color=>'#000000'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(7315734266225834)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>unistr('Finaliz\00F3 correctamente')
,p_is_enabled=>true
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7314569012225822)
,p_name=>'P173_ID_FLJO_TREA_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(7314412989225821)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7314607968225823)
,p_name=>'P173_ID_PRCSO_SMU_LTE_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(7314412989225821)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7314727729225824)
,p_name=>'P173_PRCSO_TPO_1'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(7314412989225821)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27319172526569541)
,p_name=>'P173_ID_PRCSO_SMU_LTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(27319331228569543)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27319233947569542)
,p_name=>'P173_ID_FLJO_TREA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(27319331228569543)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28019041107107519)
,p_name=>'P173_PRCSO_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(27319331228569543)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
