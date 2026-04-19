prompt --application/pages/page_00332
begin
wwv_flow_api.create_page(
 p_id=>332
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Registro de Archivo de Conciliaci\00F3n de Recaudos')
,p_step_title=>unistr('Registro de Archivo de Conciliaci\00F3n de Recaudos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const eliminarConciliacion = function(p_id_conciliacion){',
unistr('    apex.message.confirm( "\00BFDesea eliminar esta conciliaci\00F3n?", function( okPressed ) { '),
'        if( okPressed ) {',
'            apex.server.process("Eliminar_Conciliacion", {',
'               x01: p_id_conciliacion',
'            }).then((resp) => {',
'                console.log(resp);',
'                if (resp.o_cdgo_rspsta > 0) {',
'                    ',
'                    fnErrorAlertaSwal(resp.o_mnsje_rspsta);',
'',
'',
'                }else{      ',
'',
unistr('                    apex.message.showPageSuccess( "Se ha eliminado la conciliaci\00F3n.");'),
'',
'                    var region = apex.region("ARCHIVOS_CONCILIACION");',
'                    region.refresh();',
'',
'                }',
'            });',
'        }',
'    });',
'}',
'',
'var fnErrorAlertaSwal = function(pMsg){',
'    Swal.fire({',
'            icon: ''error'',',
unistr('            title:  ''<H2 >Validaci\00F3n</H2>'','),
'            html: ''<H4>''+pMsg+''</H4>''',
'        });',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20231108145421'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104128659710092021)
,p_plug_name=>'<b>Datos del Archivo</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(62644637787304708)
,p_plug_name=>'Buscar Documento'
,p_parent_plug_id=>wwv_flow_api.id(104128659710092021)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104129077955092025)
,p_plug_name=>unistr('<b>Archivos de Conciliaci\00F3n</b>')
,p_region_name=>'ARCHIVOS_CONCILIACION'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_rcdo_archvo_cnclcion',
'     , a.nmbre_archvo',
'     --, a.fcha_cnclcion',
'     , to_char(a.fcha_cnclcion, ''dd/mm/yyyy'') fcha_cnclcion',
'     , a.estdo_archvo',
'     , a.dscrpcion_estdo_archvo',
'     , case',
'         when (select count(l.id_rcdo_lte_cnclcion) ',
'                 from re_g_recaudos_lte_cnclcion l ',
'                where l.id_rcdo_archvo_cnclcion = a.id_rcdo_archvo_cnclcion) = 0 and a.estdo_archvo = ''IN'' then',
'            ''<a onclick="javascript:eliminarConciliacion(''||a.id_rcdo_archvo_cnclcion||'')" title="Eliminar" class="t-Button t-Button--noLabel t-Button--icon t-Button--danger"><b>Eliminar</b> <span aria-hidden="true" class="t-Icon fa fa-trash"></span>'
||'</a>''',
'        else',
'            null',
'       end link_eliminar',
'      , a.fcha_cnclcion fcha_orden',
'from v_re_g_recaudos_archvo_cnclcn a'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3747865694474310)
,p_name=>'LINK_ELIMINAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LINK_ELIMINAR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'&LINK_ELIMINAR.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(7817818205684536)
,p_name=>'LINK_CONCILIACION'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_LINK'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:333:&SESSION.::&DEBUG.:RP:P333_ID_RCDO_ARCHVO_CNCLCN,P333_FCHA_CNCLCION:&ID_RCDO_ARCHVO_CNCLCION.,&FCHA_CNCLCION.'
,p_link_text=>'<b>Conciliar</b>  <span aria-hidden="true" class="t-Icon fa fa-arrow-right"></span>'
,p_link_attributes=>'title="Conciliar" class="t-Button t-Button--noLabel t-Button--icon t-Button--hot"'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104129239233092027)
,p_name=>'ID_RCDO_ARCHVO_CNCLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RCDO_ARCHVO_CNCLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104129394700092028)
,p_name=>'NMBRE_ARCHVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_ARCHVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Archivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(104129462882092029)
,p_name=>'FCHA_CNCLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CNCLCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Fecha Conciliaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(104129551937092030)
,p_name=>'ESTDO_ARCHVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTDO_ARCHVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104129644037092031)
,p_name=>'DSCRPCION_ESTDO_ARCHVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ESTDO_ARCHVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(142861862076770602)
,p_name=>'FCHA_ORDEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ORDEN'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fcha Orden'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(104129134114092026)
,p_internal_uid=>104129134114092026
,p_is_editable=>false
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
 p_id=>wwv_flow_api.id(105181351969377805)
,p_interactive_grid_id=>wwv_flow_api.id(104129134114092026)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>50
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(105181418914377806)
,p_report_id=>wwv_flow_api.id(105181351969377805)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7982373436509733)
,p_view_id=>wwv_flow_api.id(105181418914377806)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(7817818205684536)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9061774630092719)
,p_view_id=>wwv_flow_api.id(105181418914377806)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(3747865694474310)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105181919888377813)
,p_view_id=>wwv_flow_api.id(105181418914377806)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(104129239233092027)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105182498046377827)
,p_view_id=>wwv_flow_api.id(105181418914377806)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(104129394700092028)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105182956816377828)
,p_view_id=>wwv_flow_api.id(105181418914377806)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(104129462882092029)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105183402639377830)
,p_view_id=>wwv_flow_api.id(105181418914377806)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(104129551937092030)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105183920721377846)
,p_view_id=>wwv_flow_api.id(105181418914377806)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(104129644037092031)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(142879284639814506)
,p_view_id=>wwv_flow_api.id(105181418914377806)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(142861862076770602)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(62645101398304713)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(62644637787304708)
,p_button_name=>'BTN_BSCAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Buscar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(104128977542092024)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(104128659710092021)
,p_button_name=>'BTN_CREAR_ARCHIVO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear Archivo'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62644781423304709)
,p_name=>'P332_NMRO_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(62644637787304708)
,p_prompt=>'Documento: '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62644895619304710)
,p_name=>'P332_NMRO_LTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(62644637787304708)
,p_prompt=>'Lote:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62644963711304711)
,p_name=>'P332_FCHA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(62644637787304708)
,p_prompt=>'Fecha:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104128882679092023)
,p_name=>'P332_FCHA_CNCLCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(104128659710092021)
,p_prompt=>unistr('<b>Fecha de Conciliaci\00F3n</b>')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(104130129371092036)
,p_name=>'Al dar Click en BTN_CREAR_ARCHIVO'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(104128977542092024)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(104130253968092037)
,p_event_id=>wwv_flow_api.id(104130129371092036)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v(''P332_FCHA_CNCLCION'') == ''''){',
unistr('    fnErrorAlertaSwal(''Debe especificar la fecha de conciliaci\00F3n.'');'),
'}else{',
unistr('    apex.message.confirm( "\00BFDesea crear archivo de conciliaci\00F3n para la fecha especificada?", function( okPressed ) { '),
'        if( okPressed ) {',
'            apex.server.process("Crear_Archivo", {',
'               pageItems: "#P332_FCHA_CNCLCION"',
'            }).then((resp) => {',
'                console.log(resp);',
'                if (resp.o_cdgo_rspsta > 0) {',
'                    //console.log(resp);',
'                    /*apex.message.clearErrors();',
'                    apex.message.showErrors([',
'                        {',
'                            type: "error",',
'                            location: [',
'                                "page"',
'                            ],',
'                            message: resp.o_mnsje_rspsta,',
'                            unsafe: false',
'                        }',
'                    ]);*/',
'                    fnErrorAlertaSwal(resp.o_mnsje_rspsta);',
'',
'',
'                }else{      ',
'',
'                    apex.message.showPageSuccess( "Se ha creado el archivo para la fecha especificada.");',
'',
'                    var region = apex.region("ARCHIVOS_CONCILIACION");',
'                    region.refresh();',
'',
'                }',
'            });',
'        }',
'    });',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(62645264757304714)
,p_name=>'Al dar Click en BTN_BSCAR'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(62645101398304713)
,p_condition_element=>'P332_NMRO_DCMNTO'
,p_triggering_condition_type=>'GREATER_THAN'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(62645309753304715)
,p_event_id=>wwv_flow_api.id(62645264757304714)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'select TO_CHAR(a.fcha_cnclcion,''DD/MM/YYYY'') fcha_cnclcion, ',
'       b.nmro_lte',
'  INTO :P332_FCHA,:P332_NMRO_LTE',
'  from re_g_recaudos_archvo_cnclcn a',
'  join re_g_recaudos_lte_cnclcion b',
'    on b.id_rcdo_archvo_cnclcion = a.id_rcdo_archvo_cnclcion',
'  join re_g_recaudos_cncpto_cnclcn c',
'    on c.id_rcdo_lte_cnclcion = b.id_rcdo_lte_cnclcion',
' where c.nmro_dcmnto = :P332_NMRO_DCMNTO',
' group by a.fcha_cnclcion, b.nmro_lte;',
' exception',
'    when others then',
'      :P332_FCHA := NULL;',
'      :P332_NMRO_LTE := NULL;',
' END;',
' '))
,p_attribute_02=>'P332_NMRO_DCMNTO'
,p_attribute_03=>'P332_NMRO_LTE,P332_FCHA'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(105409984519116010)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Crear_Archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta  number;',
'    o_mnsje_rspsta varchar2(2000);',
'begin',
'    pkg_re_recaudos_conciliacion.prc_rg_archivo_conciliacion(p_fcha_cnclcion => :P332_FCHA_CNCLCION',
'                                                           , p_cdgo_rspsta  =>  o_cdgo_rspsta',
'                                                           , p_mnsje_rspsta =>  o_mnsje_rspsta);',
'    ',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.close_all();',
'    ',
'exception',
'    when others then',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'', 10);',
'        apex_json.write(''o_mnsje_rspsta'', ''Error al intentar crear el archivo.'');',
'        apex_json.close_all();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3747999574474311)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar_Conciliacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta  number;',
'    o_mnsje_rspsta varchar2(2000);',
'begin',
'    pkg_re_recaudos_conciliacion.prc_el_conciliacion(p_id_rcdo_archvo_cnclcion => APEX_APPLICATION.g_x01,',
'                                                     o_cdgo_rspsta             => o_cdgo_rspsta,',
'                                                     o_mnsje_rspsta            => o_mnsje_rspsta);',
'                                                     ',
'                                                     ',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.close_all();',
'    ',
'exception',
'    when others then',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'', 99);',
unistr('        apex_json.write(''o_mnsje_rspsta'', ''Error al intentar eliminar la conciliaci\00F3n'');'),
'        apex_json.close_all();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
