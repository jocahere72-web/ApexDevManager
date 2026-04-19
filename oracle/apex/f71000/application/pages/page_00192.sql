prompt --application/pages/page_00192
begin
wwv_flow_api.create_page(
 p_id=>192
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Aplicaci\00F3n de Recaudos')
,p_step_title=>unistr('Aplicaci\00F3n de Recaudos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let btnAplicarTodo$;',
'',
'function validarGridRecaudo() {',
'    var region = apex.region("re");',
'    if (region) {',
'        var view = apex.region("re").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'',
'        //Realizamos un filtro de todos los datos seleccionados del interactive grid que no esten procesados',
'        records = records.filter(function (record) {',
'            return model.getValue(record, "CDGO_RCDO_ESTDO") === ''RG''',
'        });',
'       ',
'        //Obtenemos un json con los datos seleccionados que no han sido procesados',
'        var json = records.map(function (record) {',
'                                                    return { "ID_RCDO": model.getValue(record, "ID_RCDO").trim()};',
'                                                 }); ',
'        ',
'        //Habilitamos o deshabilitamos el botom dependiendo si hay mas de un registro seleccionado',
'        if (json.length > 0 ){',
'            $("#Btn_Aplicar_Pagos").show();',
'            $("#opciones").show();',
'        }else {',
'            $("#Btn_Aplicar_Pagos").hide();',
'            $("#opciones").hide();',
'        }',
'        ',
'        //Seteamos el valor del json en forma de cadena al item ',
'        $s(''P192_JSON'', json.length > 0 ? JSON.stringify(json) : '''');',
'            ',
'        //Seleccionamos los item no procesados en el interactive grid ',
'        apex.region("re").widget().interactiveGrid("setSelectedRecords", records);  ',
'    }',
'}',
' ',
'',
'const gridSelectAll = (e, btn, grid, datos) => {',
'    let json = datos.filter((data) => {',
'        return data.CDGO_RCDO_ESTDO === ''RG'';',
'        ',
'    });   ',
'    ',
unistr('    //javascript:apex.confirm("\00BFEsta seguro que desea aplicar los " + json.length + " recaudos?",''AplicarTodos'');'),
unistr('    apex.message.confirm( "\00BFEsta seguro que desea aplicar todos los recaudos?", function( okPressed ) { '),
'        if( okPressed ) {',
'            console.log("Ok");',
'            disableBtn(btn); ',
'            $(''#Btn_Aplicar_Pagos'').prop(''disabled'',true);',
'            apex.submit("AplicarTodos");            ',
'        }',
'    });',
'   ',
'};',
'',
'function AplicarRecaudos(){',
unistr('     apex.message.confirm( "\00BFEsta seguro que desea aplicar  los recaudos sas?", function( okPressed ) { '),
'        if( okPressed ) {',
'            apex.item( "Btn_Aplicar_Pagos" ).disable();',
'            console.log("Ok putntual");',
'            //disableBtn(btn); ',
'            $(''#Btn_Aplicar_Pagos'').prop(''disabled'',true);',
'            $(''button[data-action="selectAll"]'').prop(''disabled'',true);',
'            apex.submit("Btn_Aplicar_Cambios");            ',
'        }',
'    });',
'}',
'',
'const disableBtn = (btn) => {',
'    btnAplicarTodo$ = $(btn); ',
'    btnAplicarTodo$.prop( "disabled", true );',
'    apex.item( "Btn_Aplicar_Pagos" ).disable();',
'    console.log("desactivar Botones");',
'};',
'',
'',
'const enableBtn = () => {',
'    if(btnAplicarTodo$)',
'    btnAplicarTodo$.prop( "disabled", false );',
'    apex.item( "Btn_Aplicar_Pagos" ).enable();',
'    console.log("Activar Botones");',
'};',
''))
,p_javascript_code_onload=>'$("#Btn_Aplicar_Pagos").hide();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-label{',
'    font-weight: 700;',
'}',
'',
'.a-IRR-noDataMsg {',
'    padding: 0;',
'}',
'',
'',
'span.a-GV-rowLabel {',
'    display: none;',
'}',
'',
'/*',
'.a-MediaBlock{',
'    display: none;',
'}',
'*/'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(177374633629050691)
,p_last_updated_by=>'HMARTINEZ'
,p_last_upd_yyyymmddhh24miss=>'20210224182411'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69377270717232501)
,p_plug_name=>unistr('Aplicaci\00F3n de Recaudos')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44526899342715232)
,p_plug_name=>unistr('Tab Aplicaci\00F3n de Recaudos')
,p_parent_plug_id=>wwv_flow_api.id(69377270717232501)
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44526926320715233)
,p_plug_name=>'<i><b>Recaudos</b></i>'
,p_region_name=>'re'
,p_parent_plug_id=>wwv_flow_api.id(44526899342715232)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select id_rcdo_cntrol ',
'         , id_rcdo',
'         , dscrpcion_sjto_tpo ',
'         , idntfccion_sjto',
'         , dscrpcion_rcdo_orgn_tpo',
'         , nmro_dcmnto',
'         , fcha_rcdo',
'         , vlor',
'         , fcha_apliccion',
'         , dscrpcion_rcdo_estdo',
'         , cdgo_rcdo_estdo',
'         , mnsje_rspsta',
'         , obsrvcion',
'     from v_re_g_recaudos'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(89129713491107840)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18926758864551303)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_api.id(18926810563551304)
,p_name=>'MNSJE_RSPSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MNSJE_RSPSTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Mensaje Respuesta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(44625039581613002)
,p_name=>'ID_RCDO_CNTROL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RCDO_CNTROL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(89130004560107843)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(44625164671613003)
,p_name=>'DSCRPCION_SJTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_SJTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>50
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
 p_id=>wwv_flow_api.id(44625297159613004)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(44625310722613005)
,p_name=>'DSCRPCION_RCDO_ORGN_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_RCDO_ORGN_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Origen'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>50
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
 p_id=>wwv_flow_api.id(44625401037613006)
,p_name=>'NMRO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00FAmero')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(44625523837613007)
,p_name=>'FCHA_RCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RCDO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Recaudo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
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
 p_id=>wwv_flow_api.id(44625629548613008)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Recaudo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(44625789128613009)
,p_name=>'FCHA_APLICCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_APLICCION'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha Aplicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(44625893858613010)
,p_name=>'DSCRPCION_RCDO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_RCDO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>50
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
 p_id=>wwv_flow_api.id(44625993228613011)
,p_name=>'CDGO_RCDO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_RCDO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(44626123852613013)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(44626664368613018)
,p_name=>'ID_RCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RCDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 de Recaudo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(44624974143613001)
,p_internal_uid=>44624974143613001
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'    ',
unistr('    //No seleccionar ninguna fila cuando la p\00E1gina es renderizada'),
'    config.initialSelection = false;',
'    ',
'    return selectAll(config, [{',
'        name: ''Aplicar Todos'',',
'        action: gridSelectAll,',
'        hot: true',
'    }]);',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(44630862244625637)
,p_interactive_grid_id=>wwv_flow_api.id(44624974143613001)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>100
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(44630989039625637)
,p_report_id=>wwv_flow_api.id(44630862244625637)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18937621739583812)
,p_view_id=>wwv_flow_api.id(44630989039625637)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(18926758864551303)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>226
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18941196004641566)
,p_view_id=>wwv_flow_api.id(44630989039625637)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(18926810563551304)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>230
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(44631435102625640)
,p_view_id=>wwv_flow_api.id(44630989039625637)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(44625039581613002)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(44631913525625641)
,p_view_id=>wwv_flow_api.id(44630989039625637)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(44625164671613003)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(44632424376625642)
,p_view_id=>wwv_flow_api.id(44630989039625637)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(44625297159613004)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>196
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(44632901781625643)
,p_view_id=>wwv_flow_api.id(44630989039625637)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(44625310722613005)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>127
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(44633497256625644)
,p_view_id=>wwv_flow_api.id(44630989039625637)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(44625401037613006)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(44633951979625646)
,p_view_id=>wwv_flow_api.id(44630989039625637)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(44625523837613007)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>124
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(44634494111625647)
,p_view_id=>wwv_flow_api.id(44630989039625637)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(44625629548613008)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>129
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(44634996627625648)
,p_view_id=>wwv_flow_api.id(44630989039625637)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(44625789128613009)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>178
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(44635460807625649)
,p_view_id=>wwv_flow_api.id(44630989039625637)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(44625893858613010)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>104
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(44635982275625650)
,p_view_id=>wwv_flow_api.id(44630989039625637)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(44625993228613011)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(44662324074966193)
,p_view_id=>wwv_flow_api.id(44630989039625637)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(44626664368613018)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>136
,p_sort_order=>2
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_filter(
 p_id=>wwv_flow_api.id(66394000048)
,p_report_id=>wwv_flow_api.id(44630862244625637)
,p_type=>'COLUMN'
,p_column_id=>wwv_flow_api.id(44625893858613010)
,p_operator=>'EQ'
,p_is_case_sensitive=>true
,p_expression=>'REGISTRADO'
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89129713491107840)
,p_plug_name=>'<i><b>Control de Recaudos</b></i>'
,p_region_name=>'TCR'
,p_parent_plug_id=>wwv_flow_api.id(44526899342715232)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select id_rcdo_cntrol',
'         , dscrpcion_orgen',
'         , dscrpcion_bnco',
'         , nmro_cnta',
'         , fcha_cntrol',
'         , vlor_rcdos   as ttal_cntrol',
'         , cntdad_rcdos as nmero_rgstro',
'         , file_name',
'         , fcha_rgstro',
'         , user_name || '' - '' || nmbre_trcro as user_nmbre_trcro',
'         , obsrvcion',
'         , nmbre_impsto ',
'         , nmbre_impsto_sbmpsto',
'      from v_re_g_recaudos_control a',
'     where cdgo_clnte        = :F_CDGO_CLNTE',
'       and id_impsto         = nvl( :P192_ID_IMPSTO , id_impsto )',
'       and id_impsto_sbmpsto = nvl( :P192_ID_IMPSTO_SBMPSTO , id_impsto_sbmpsto )',
'       and id_rcdo_cntrol in ( ',
'                                   select b.id_rcdo_cntrol ',
'                                     from re_g_recaudos b ',
'                                    where b.cdgo_rcdo_estdo = ''RG''',
'                                      and b.id_rcdo_cntrol  = a.id_rcdo_cntrol ',
'                             )'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18926538156551301)
,p_name=>'FILE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FILE_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18926659428551302)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>1000
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
 p_id=>wwv_flow_api.id(67469091256082401)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>200
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
 p_id=>wwv_flow_api.id(67469191366082402)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub-Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>50
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
 p_id=>wwv_flow_api.id(89130004560107843)
,p_name=>'ID_RCDO_CNTROL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RCDO_CNTROL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00B0 de Control')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(89130106214107844)
,p_name=>'DSCRPCION_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Origen Recaudo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>50
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
 p_id=>wwv_flow_api.id(89130213464107845)
,p_name=>'DSCRPCION_BNCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_BNCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Banco'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>113
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
 p_id=>wwv_flow_api.id(89130380998107846)
,p_name=>'NMRO_CNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero de Cuenta')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>50
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
 p_id=>wwv_flow_api.id(89130483156107847)
,p_name=>'FCHA_CNTROL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CNTROL'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Recaudo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
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
 p_id=>wwv_flow_api.id(89130508926107848)
,p_name=>'TTAL_CNTROL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TTAL_CNTROL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total Control'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(89130667595107849)
,p_name=>'NMERO_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMERO_RGSTRO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 de Registros')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(89130872495107851)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
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
 p_id=>wwv_flow_api.id(89131004097107852)
,p_name=>'USER_NMBRE_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_NMBRE_TRCRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Usuario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>546
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(89131490437107857)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(89129911144107842)
,p_internal_uid=>89129911144107842
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn recaudo control pendiente por aplicar pagos.')
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
 p_id=>wwv_flow_api.id(89180936798507070)
,p_interactive_grid_id=>wwv_flow_api.id(89129911144107842)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(89181089688507070)
,p_report_id=>wwv_flow_api.id(89180936798507070)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18932563934551503)
,p_view_id=>wwv_flow_api.id(89181089688507070)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(18926538156551301)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18933078555551507)
,p_view_id=>wwv_flow_api.id(89181089688507070)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(18926659428551302)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>400
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67475022687088139)
,p_view_id=>wwv_flow_api.id(89181089688507070)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(67469091256082401)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>217
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67475439341088176)
,p_view_id=>wwv_flow_api.id(89181089688507070)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(67469191366082402)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>270
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89181535761507073)
,p_view_id=>wwv_flow_api.id(89181089688507070)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(89130004560107843)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>144
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89182050820507076)
,p_view_id=>wwv_flow_api.id(89181089688507070)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(89130106214107844)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>176
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89182540230507077)
,p_view_id=>wwv_flow_api.id(89181089688507070)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(89130213464107845)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>217
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89183101564507078)
,p_view_id=>wwv_flow_api.id(89181089688507070)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(89130380998107846)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89183542815507081)
,p_view_id=>wwv_flow_api.id(89181089688507070)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(89130483156107847)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>138
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89184085142507082)
,p_view_id=>wwv_flow_api.id(89181089688507070)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(89130508926107848)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89184544217507083)
,p_view_id=>wwv_flow_api.id(89181089688507070)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(89130667595107849)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89185590033507085)
,p_view_id=>wwv_flow_api.id(89181089688507070)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(89130872495107851)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>106
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89186092497507086)
,p_view_id=>wwv_flow_api.id(89181089688507070)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(89131004097107852)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>311
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(93485549164050532)
,p_plug_name=>'Opciones'
,p_region_name=>'opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center;">',
'        <b>',
'            <i>Opciones <i class="fa fa-gears" aria-hidden="true"></i>',
'			</i>',
'        </b>',
'    </div>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138568896822992068)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'<i>',
'    Funcionalidad que permite: <br/><br/>',
'    <b>1.</b> Aplicar recaudos por los diferentes origen (Manual, Asobancaria o Web Service).<br/><br/>',
'    <b>2.</b> Visualizar los recaudos control que estan pendiente por aplicar.<br/><br/>',
'    <b>3.</b> Seleccionar recaudos para aplicar.<br/><br/>',
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138572092412069628)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_css_classes=>'parametroBusqueda1'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44605770925392636)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(93485549164050532)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:&P192_BRANCH.:&SESSION.::&DEBUG.:RP::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44664455679048498)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(93485549164050532)
,p_button_name=>'Btn_Aplicar_Cambios'
,p_button_static_id=>'Btn_Aplicar_Pagos'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Recaudos'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:AplicarRecaudos();'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44612446417392648)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(138572092412069628)
,p_button_name=>'Btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(74320539809173707)
,p_branch_name=>'Habilitar Botones'
,p_branch_action=>'javascript:enableBtn();'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44612837884392648)
,p_name=>'P192_BRANCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(138572092412069628)
,p_item_default=>'191'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44613280917392650)
,p_name=>'P192_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(138572092412069628)
,p_prompt=>'Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de lista el Tributo a consultar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'277'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44613619745392650)
,p_name=>'P192_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(138572092412069628)
,p_prompt=>'Sub-Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d',
'     , id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto  = :P192_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P192_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de lista el Sub-Tributo a consultar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'277'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44626549517613017)
,p_name=>'P192_JSON'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(138572092412069628)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60638639922517801)
,p_name=>'P192_ID_RCDO_CNTROL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(138572092412069628)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(44626384569613015)
,p_name=>'Al Seleccionar Recaudos'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(44526926320715233)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(44626442147613016)
,p_event_id=>wwv_flow_api.id(44626384569613015)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validarGridRecaudo();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50925283060832911)
,p_name=>'Al Seleccionar Recaudo Control'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(89129713491107840)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50925356169832912)
,p_event_id=>wwv_flow_api.id(50925283060832911)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$setDetailTab(''#SR_TCR_tab'', ''<i><b> - Control Recaudo: ('' + this.data.model.getValue(this.data.selectedRecords[0] , "ID_RCDO_CNTROL") + '') </b></i>'' );',
'$s(''P192_ID_RCDO_CNTROL'' , this.data.model.getValue(this.data.selectedRecords[0] , "ID_RCDO_CNTROL"));',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(60638839395517803)
,p_event_id=>wwv_flow_api.id(50925283060832911)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P192_ID_RCDO_CNTROL'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(117430263704299040)
,p_name=>'Ocultar Opciones'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(117430303419299041)
,p_event_id=>wwv_flow_api.id(117430263704299040)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(93485549164050532)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44740024592607805)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aplicar Recaudos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta  number;',
'    v_mnsje_rspsta varchar2(4000);',
'    v_json         clob;',
'begin',
'    if(:request = ''AplicarTodos'') then',
'    ',
'       --Json para Aplicar Todos los Recaudos',
'       declare',
'            a_json json_array_t := json_array_t();',
'            o_json json_object_t;',
'        begin',
'',
'            for c_rcdos in ( ',
'                              select a.id_rcdo',
'                                from re_g_recaudos a',
'                               where a.id_rcdo_cntrol  = :P192_ID_RCDO_CNTROL',
'                                 and a.cdgo_rcdo_estdo = ''RG'' ',
'                           ) loop',
'',
'                o_json :=  json_object_t();',
'                o_json.put( ''ID_RCDO'' , c_rcdos.id_rcdo );',
'                a_json.append(o_json);',
'            end loop;',
'            ',
'            --Json',
'            v_json := a_json.to_clob();',
'        end;',
'       ',
'       --Dejo de Funcionar en su Momento',
'       /*begin',
'           select nvl( json_arrayagg (',
'                                 json_object (''ID_RCDO'' value id_rcdo)',
'                                 returning clob',
'                              ) , ''[]'' )',
'             into v_json',
'             from re_g_recaudos',
'            where id_rcdo_cntrol  = :P192_ID_RCDO_CNTROL',
'              and cdgo_rcdo_estdo = ''RG'';',
'       end;*/',
'    else',
'       v_json := :P192_JSON;',
'    end if;',
'    ',
unistr('    --Up para Aplicaci\00F3n de Recaudo Masivo'),
'    pkg_re_recaudos.prc_ap_recaudos_masivo( p_id_usrio     => :F_ID_USRIO',
'                                          , p_cdgo_clnte   => :F_CDGO_CLNTE  ',
'                                          , p_json         => v_json',
'                                          , o_cdgo_rspsta  => v_cdgo_rspsta',
'                                          , o_mnsje_rspsta => v_mnsje_rspsta );',
'    ',
'    --Verifica si no hay Errores',
'    if( v_cdgo_rspsta <> 0 ) then',
'        raise_application_error( -20001 , v_mnsje_rspsta );',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Btn_Aplicar_Cambios,AplicarTodos'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('Proceso Ejecutado con \00C9xito.')
);
end;
/
