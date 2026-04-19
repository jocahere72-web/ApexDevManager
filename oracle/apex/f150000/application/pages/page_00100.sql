prompt --application/pages/page_00100
begin
wwv_flow_api.create_page(
 p_id=>100
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Emisi\00F3n de Recibos de Cuotas de Acuerdo de Pago')
,p_step_title=>unistr('Emisi\00F3n de Recibos de Cuotas de Acuerdo de Pago')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var sel = [];',
'function seleccionar_convenio(this_) {',
'',
'    if (this_.data.selectedRecords.length === 0) {',
'        return;',
'    };',
'',
'    var i, records, record, model, estdo, nmro_cnvnio, ctas_pndntes,',
'        id_cnvnio = 0,',
'        view = apex.region("acuerdo_pago").widget().interactiveGrid("getCurrentView");',
'    model = view.model;',
'    records = view.getSelectedRecords();',
'',
'    records = records.filter(function (record) {',
'        return model.getValue(record, "DSCRPCION_CNVNIO_ESTDO") === ''APLICADO''',
'    });',
'',
'    if (records.length > 0) {',
'        for (i = 0; i < records.length; i++) {',
'            record = records[i];',
'            id_cnvnio = parseFloat(model.getValue(record, "ID_CNVNIO"));',
'            estdo = model.getValue(record, "DSCRPCION_CNVNIO_ESTDO");',
'            nmro_cnvnio = model.getValue(record, "NMRO_CNVNIO");',
'            ctas_pndntes = model.getValue(record, "CTAS_PDNTES");',
'',
'        }',
unistr('        $setDetailTab(''#acuerdo_pago_tab'', (records.length === 1 ? '' - <b> Acuerdo de Pago N\00B0 '' + nmro_cnvnio + ''</b>'' : ''''));'),
'    }',
'',
'    if (estdo !== ''APLICADO'') {',
'        apex.message.clearErrors();',
'        apex.message.showErrors([',
'            {',
'                type: "error",',
'                location: ["page"],',
'                message: "El acuerdo de pago que intenta seleccinar no esta Aplicado",',
'                unsafe: false',
'            }',
'        ]);',
'',
'    }',
'',
'',
'    $s("P100_ID_CNVNIO", id_cnvnio);',
'',
'    if ($v(''P100_ID_CNVNIO'')) {',
'        $(''#plan_pagos_tab'').show();',
'    }/*else{',
'        $(''#plan_pagos_tab'').hide();',
'    }*/',
'',
'    apex.region("acuerdo_pago").widget().interactiveGrid("setSelectedRecords", records);',
'}',
'',
'',
'',
'function seleccionar_cuotas() {',
'    ',
'    var i, records, record, sal, model, records_2,',
'        total = 0,',
'        ctas = [],',
'        view = apex.region("plan_pagos").widget().interactiveGrid("getCurrentView");',
'    model = view.model;',
'    _data = model._data;',
'    records = view.getSelectedRecords();',
'    if (sel.length !== records.length){',
'        apex.message.clearErrors();    ',
'    }',
'    /*first = _data.filter((f) => {',
'        return [''ADEUDADA'', ''VENCIDA''].includes(model.getValue(f, "ESTDO_CTA"))',
'    });*/',
'    records = records.filter(function (record) {',
'        return [''ADEUDADA'', ''VENCIDA''].includes(model.getValue(record, "ESTDO_CTA"))',
'    });',
'    arrCuotas = records.map((m) => { return parseFloat(model.getValue(m, "NMRO_CTA")) });',
'',
'    /*if (first.length > 0) {',
'        if (arrCuotas.indexOf(parseFloat(model.getValue(first[0], "NMRO_CTA"))) == -1) {',
'            records.push(first[0]);',
'        }',
'    }*/',
'    ',
'    records_2 = records;/*',
'    records = records.sort((a, b) => {',
'        let n1 = parseFloat(model.getValue(a, "NMRO_CTA"));',
'        let n2 = parseFloat(model.getValue(b, "NMRO_CTA"));',
'        return (n1 > n2) ? 1 : -1;',
'    }).filter(function (a, i, b) {',
'        return i === 0 || Math.abs((parseFloat(model.getValue(a, "ROW_NUM")) - parseFloat(model.getValue(b[i - 1], "ROW_NUM")))) === 1;',
'    });*/',
'',
'',
'    if (records.length > 0) {',
'',
'        for (i = 0; i < records.length; i++) {',
'            record = records[i];',
'            ctas.push(parseFloat(model.getValue(record, "NMRO_CTA")));',
'            total += parseFloat(model.getValue(record, "VLOR_TTAL"));',
'            console.log(''total '' + total);',
'        }',
'',
'    }',
'',
'    $s("P100_NMRO_CTAS", ctas.join('':''));',
'    total = total.toString().replace(".", ",");',
'    $s("P100_VLOR_TTAL", total);',
'    apex.region("plan_pagos").widget().interactiveGrid("setSelectedRecords", records);',
'    sel = records;',
'    if ($v(''P100_NMRO_CTAS'')) {',
'        apex.item(''BTN_IMPRIMIR'').show();',
'    } else {',
'        apex.item(''BTN_IMPRIMIR'').hide();',
'    }',
'/*',
'    if (records.length !== records_2.length) {',
'        apex.message.clearErrors();',
'        apex.message.showErrors([',
'            {',
'                type: "error",',
'                location: ["page"],',
'                message: "Debe seleccionar la siguiente cuota",',
'                unsafe: false',
'            }',
'        ]);',
'    }*/',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery( apex.gPageContext$ ).on( "apexreadyend", function( e ) {',
'    // code here',
'    apex.region("acuerdo_pago").widget().interactiveGrid("setSelectedRecords", []);',
'   // $(''#plan_pagos_tab'').hide();',
'    ocultarAyudaD();',
'});',
'',
'',
'apex.jQuery(apex.gPageContext$).on("apexreadyend", async function (e) {',
'    if($v(''P100_RSPSTA'') == ''0'' ){',
'        apex.item( "informacion_basica" ).hide();',
'        apex.item( "tab_selector_convenio" ).hide();',
'   }',
'});'))
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_step_template=>wwv_flow_api.id(252165693921651362)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_rejoin_existing_sessions=>'P'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20241018101709'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(165770809935518111)
,p_plug_name=>'Tab Selector'
,p_region_name=>'tab_selector_convenio'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P100_ID_SJTO_IMPSTO'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(165505635716283025)
,p_plug_name=>'Acuerdo de Pago'
,p_region_name=>'acuerdo_pago'
,p_parent_plug_id=>wwv_flow_api.id(165770809935518111)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_cnvnio,',
'        a.nmro_cnvnio,',
'        a.fcha_aplccion,',
'        to_char(a.ttal_cnvnio, :F_FRMTO_MNDA) ttal_cnvnio,',
'        a.dscrpcion_dcrto_cnvnio,',
'        (select min(vgncia) from gf_g_convenios_cartera m where m.id_cnvnio = a.id_cnvnio) vgncia_mmna,',
'        (select max(vgncia) from gf_g_convenios_cartera m where m.id_cnvnio = a.id_cnvnio) vgncia_mxma,',
'        (select count(nmro_cta) from gf_g_convenios_extracto m where m.id_cnvnio = a.id_cnvnio and m.indcdor_cta_pgda = ''N'' and actvo = ''S'') ctas_pdntes,',
'        dscrpcion_cnvnio_estdo,',
'        1 cartera,',
'        2 pagos',
'   from v_gf_g_convenios    a',
'  where (a.id_sjto_impsto    = :P100_ID_SJTO_IMPSTO or a.id_sjto_impsto = :P100_ID_SJTO_IMPSTO_1)',
'    and cdgo_cnvnio_estdo   = ''APL''',
'    and (:F_CDGO_CLNTE      = 10 and id_cnvnio_tpo       in (1,4)',
'      or (a.cdgo_clnte      = :F_CDGO_CLNTE) ',
'        )'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P100_ID_SJTO_IMPSTO_1,P100_ID_SJTO_IMPSTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P100_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(72333321455733317)
,p_name=>'CTAS_PDNTES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CTAS_PDNTES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 Cuota<br> Pendientes')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_03=>'center'
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
 p_id=>wwv_flow_api.id(165769719334518100)
,p_name=>'ID_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNVNIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(165769849182518101)
,p_name=>'NMRO_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNVNIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 Acuerdo <br> de Pago')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(165769957769518102)
,p_name=>'FCHA_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_APLCCION'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(165770015493518103)
,p_name=>'TTAL_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TTAL_CNVNIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total <br>Al Crear el Acuerdo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_api.id(165770101551518104)
,p_name=>'DSCRPCION_DCRTO_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_DCRTO_CNVNIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Decreto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(165770284311518105)
,p_name=>'VGNCIA_MMNA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA_MMNA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Desde'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(165770302309518106)
,p_name=>'VGNCIA_MXMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA_MXMA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Hasta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(165770430636518107)
,p_name=>'DSCRPCION_CNVNIO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNVNIO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(165770512005518108)
,p_name=>'CARTERA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CARTERA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Cartera'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:102:&SESSION.::&DEBUG.:RP,102:P102_ID_CNVNIO:&ID_CNVNIO.'
,p_link_text=>'<center><span class="fa fa-eye fa-1x fa-spin"></span></center>'
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
,p_display_condition_type=>'NEVER'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(165770611574518109)
,p_name=>'PAGOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAGOS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Pagos'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:103:&SESSION.::&DEBUG.:RP,103:P103_ID_CNVNIO:&ID_CNVNIO.'
,p_link_text=>'<center><span class="fa fa-eye fa-1x fa-spin"></span></center>'
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
,p_display_condition_type=>'NEVER'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(165770726451518110)
,p_name=>'Seleccionar'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(165508052630283049)
,p_internal_uid=>165508052630283049
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
' config.initialSelection = false;',
' return config;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(165775976984520674)
,p_interactive_grid_id=>wwv_flow_api.id(165508052630283049)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(165776064288520674)
,p_report_id=>wwv_flow_api.id(165775976984520674)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(72902121861061311)
,p_view_id=>wwv_flow_api.id(165776064288520674)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(72333321455733317)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>85
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(165776553066520675)
,p_view_id=>wwv_flow_api.id(165776064288520674)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(165769719334518100)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(165777057244520677)
,p_view_id=>wwv_flow_api.id(165776064288520674)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(165769849182518101)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(165777590913520678)
,p_view_id=>wwv_flow_api.id(165776064288520674)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(165769957769518102)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(165778002481520680)
,p_view_id=>wwv_flow_api.id(165776064288520674)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(165770015493518103)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>144
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(165778595477520681)
,p_view_id=>wwv_flow_api.id(165776064288520674)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(165770101551518104)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>162
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(165779075029520682)
,p_view_id=>wwv_flow_api.id(165776064288520674)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(165770284311518105)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(165779565950520683)
,p_view_id=>wwv_flow_api.id(165776064288520674)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(165770302309518106)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(165780089686520685)
,p_view_id=>wwv_flow_api.id(165776064288520674)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(165770430636518107)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(165780527249520686)
,p_view_id=>wwv_flow_api.id(165776064288520674)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(165770512005518108)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>67
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(165781035608520687)
,p_view_id=>wwv_flow_api.id(165776064288520674)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(165770611574518109)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>87
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(165507052627283039)
,p_plug_name=>unistr('C\00E1lculo de Cuotas')
,p_region_name=>'plan_pagos'
,p_parent_plug_id=>wwv_flow_api.id(165770809935518111)
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.*',
'   from (select row_number() over (partition by decode(a.estdo_cta, ''PAGADA'',0, 1) order by a.nmro_cta) row_num,',
'                a.id_cnvnio_extrcto,',
'                a.id_cnvnio,',
'                a.nmro_cta,',
'                a.fcha_vncmnto,',
'                a.estdo_cta,',
'                sum(a.vlor_cncpto_ttal) vlor_cta',
'           from table (pkg_gf_convenios.fnc_cl_convenios_cuota_cncpto (:F_CDGO_CLNTE, :P100_ID_CNVNIO, :P100_FCHA_VNCMNTO)) a',
'          --where a.estdo_cta != ''PAGADA''',
'        group by a.id_cnvnio_extrcto,',
'                a.id_cnvnio,',
'                a.nmro_cta,',
'                a.fcha_vncmnto,',
'                a.estdo_cta',
'        order by a.id_cnvnio,',
'                a.nmro_cta,',
'                a.fcha_vncmnto,',
'                a.estdo_cta',
'         ) a',
'   '))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(165505635716283025)
,p_ajax_items_to_submit=>'P100_ID_CNVNIO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P100_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4472355225232504)
,p_name=>'ROW_NUM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROW_NUM'
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
 p_id=>wwv_flow_api.id(72332663553733310)
,p_name=>'VLOR_CTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Cuota'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_03=>'center'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(83013965984923008)
,p_name=>'ID_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNVNIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_parent_column_id=>wwv_flow_api.id(165769719334518100)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(83014007841923009)
,p_name=>'ID_CNVNIO_EXTRCTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNVNIO_EXTRCTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(165507455207283043)
,p_name=>'NMRO_CTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 Cuota')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(165507560721283044)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
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
 p_id=>wwv_flow_api.id(165507795006283046)
,p_name=>'ESTDO_CTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTDO_CTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado Cuota'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>8
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
 p_id=>wwv_flow_api.id(165507958212283048)
,p_name=>'Imprimir'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(165507282173283041)
,p_internal_uid=>165507282173283041
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
 p_id=>wwv_flow_api.id(165762489611504539)
,p_interactive_grid_id=>wwv_flow_api.id(165507282173283041)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(165762501627504539)
,p_report_id=>wwv_flow_api.id(165762489611504539)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4500900918497352)
,p_view_id=>wwv_flow_api.id(165762501627504539)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(4472355225232504)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(72714556868343461)
,p_view_id=>wwv_flow_api.id(165762501627504539)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(72332663553733310)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83043845607035842)
,p_view_id=>wwv_flow_api.id(165762501627504539)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(83013965984923008)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83050379770056343)
,p_view_id=>wwv_flow_api.id(165762501627504539)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(83014007841923009)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(165763554220504545)
,p_view_id=>wwv_flow_api.id(165762501627504539)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(165507455207283043)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>215
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(165764058426504546)
,p_view_id=>wwv_flow_api.id(165762501627504539)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(165507560721283044)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>214
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(165765038749504549)
,p_view_id=>wwv_flow_api.id(165762501627504539)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(165507795006283046)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>257
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(69332146334131151)
,p_view_id=>wwv_flow_api.id(165762501627504539)
,p_execution_seq=>10
,p_name=>'PAGADA'
,p_background_color=>'#A1F7B2'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(165507795006283046)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'PAGADA'
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(69332230834139123)
,p_view_id=>wwv_flow_api.id(165762501627504539)
,p_execution_seq=>5
,p_name=>'VENCIDA'
,p_background_color=>'#FF6161'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(165507795006283046)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'VENCIDA'
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(165771319709518116)
,p_plug_name=>'Fecha de Vencimiento'
,p_parent_plug_id=>wwv_flow_api.id(165507052627283039)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(341281794398659385)
,p_plug_name=>'Sujeto Tributo'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69301509988464512)
,p_plug_name=>unistr('Informaci\00F3n B\00E1sica')
,p_region_name=>'informacion_basica'
,p_parent_plug_id=>wwv_flow_api.id(341281794398659385)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P100_ID_SJTO_IMPSTO'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(85164310862979609)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(165505635716283025)
,p_button_name=>'BTN_SGNTE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69341845532127964)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(165771319709518116)
,p_button_name=>'BTN_IMPRIMIR'
,p_button_static_id=>'BTN_IMPRIMIR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(89517815607717301)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(165771319709518116)
,p_button_name=>'BTN_PGO_PSE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pago PSE'
,p_button_position=>'BODY'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'    v_ip    varchar2(1);',
'    v_b number := 1;',
'begin',
'',
'    /*begin',
'        select ''S''',
'        into    v_ip',
'        from     ip_prmtdas',
'        where     ip = ''192.888.888''; --pkg_ws_pagos_placetopay.fnc_co_ip_publica(p_url => ''https://api.myip.com'');',
'    exception',
'        when  no_data_found then',
'            v_ip := ''N'';',
'        when  others then',
'             v_ip := ''N'';',
'    end;',
'    ',
'    if v_ip = ''N'' then',
'        return false;',
'    else',
'        return true;',
'    end if;*/',
'',
unistr('    -- Se comentarea linea mientras que Placetopay habilita servicio en producci\00F3n'),
'    if pkg_gn_generalidades.fnc_vl_pago_pse(p_cdgo_clnte => :F_CDGO_CLNTE,',
'                                            p_cdgo_impsto => :P100_ID_IMPSTO,',
'                                            p_cdgo_impsto_sbmpsto => :P100_ID_IMPSTO_SBMPSTO)  = ''S'' then',
'        return true;',
'    else',
'        return false;',
'    end if;',
'    ',
'    ',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-credit-card'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(85164727783979613)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(165771319709518116)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Regresar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69344772739127979)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_api.id(341281794398659385)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>4
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4473489371232515)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(341281794398659385)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,100::'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4545075423036401)
,p_branch_name=>'Imprimir Recibo Cuota 150000'
,p_branch_action=>'f?p=&APP_ID.:100:&SESSION.:PRINT_REPORT=re_c_recibo_cuota_acuerdo:&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(69341845532127964)
,p_branch_sequence=>20
,p_branch_condition_type=>'PLSQL_EXPRESSION'
,p_branch_condition=>':F_ID_DCMNTO > 0 and :P100_CDGO_RSPSTA = 0'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(89523903824739621)
,p_branch_name=>'Ir_a_pagona_23'
,p_branch_action=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23:P23_CDGO_CLNTE,P23_FCHA,P23_CDGO_ORGN_TPO,P23_ID_IMPSTO,P23_CDGO_RCBO_TPO,P23_ID_ORGEN,P23_ID_IMPSTO_SBMPSTO:&F_CDGO_CLNTE.,&P100_FCHA_VNCMNTO.,DC,&P100_ID_IMPSTO.,DCO,&F_ID_DCMNTO.,&P100_ID_IMPSTO_SBMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(89517815607717301)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4472487516232505)
,p_name=>'P100_TPO_BSQDA_PRSNA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(341281794398659385)
,p_prompt=>'Tipo de busqueda'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Placa / NIT;IDN,N\00B0 Acuerdo de Pago;NCN')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_display_when=>'P100_CDGO_SJTO_TPO_IMPSTO'
,p_display_when2=>'E'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4472510890232506)
,p_name=>'P100_TPO_BSQDA_VHCLO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(341281794398659385)
,p_prompt=>'Tipo de busqueda'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Placa;IDN,N\00B0 Acuerdo de Pago;NCN')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_display_when=>'P100_CDGO_SJTO_TPO_IMPSTO'
,p_display_when2=>'V'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4472668865232507)
,p_name=>'P100_CDGO_SJTO_TPO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(341281794398659385)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5041967078330401)
,p_name=>'P100_ID_SJTO_IMPSTO_1'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(341281794398659385)
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28414140270075103)
,p_name=>'P100_ID_DCMNTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(165505635716283025)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69301639192464513)
,p_name=>'P100_IDNTFCCION_SJTO_FRMTDA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(69301509988464512)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69301744244464514)
,p_name=>'P100_IDNTFCCION_ANTRIOR_FRMTDA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(69301509988464512)
,p_prompt=>unistr('Identificaci\00F3n Anterior')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_display_when=>'P100_CDGO_SJTO_TPO_IMPSTO'
,p_display_when2=>'P'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69301801294464515)
,p_name=>'P100_UBCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(69301509988464512)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69301985188464516)
,p_name=>'P100_DRCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(69301509988464512)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69302001245464517)
,p_name=>'P100_CDGO_SJTO_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(69301509988464512)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69302115474464518)
,p_name=>'P100_TPO_BSQDA_PRDIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(341281794398659385)
,p_prompt=>'Tipo de busqueda'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Direcci\00F3n;DIR,Referencia;IDN,Referencia Anterior;IDA,Matricula;MTR,N\00B0 Acuerdo de Pago;NCN')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_display_when=>'P100_CDGO_SJTO_TPO_IMPSTO'
,p_display_when2=>'P'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69302381916464520)
,p_name=>'P100_MTRCLA_INMBLRIA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(69301509988464512)
,p_prompt=>'Matricula Inmobiliaria'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_display_when=>'P100_CDGO_SJTO_TPO_IMPSTO'
,p_display_when2=>'P'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69336781913127941)
,p_name=>'P100_ID_CNVNIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(165505635716283025)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69337010201127955)
,p_name=>'P100_VLOR_TTAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(165505635716283025)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69341188660127963)
,p_name=>'P100_NMRO_CTAS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(165507052627283039)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69342291322127967)
,p_name=>'P100_ID_RPRTE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(165771319709518116)
,p_prompt=>'Reporte Cuota Acuerdo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_rprte d ,',
'        id_rprte r',
'   from gn_d_reportes',
'  where cdgo_rprte_grpo = ''RCA'';'))
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccionar el documento de pago de cuota(s).'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69343191382127974)
,p_name=>'P100_FCHA_VNCMNTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(165771319709518116)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Vencimiento'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese la fecha de vencimiento de la(s) cuota(s)'
,p_attribute_02=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69344046537127975)
,p_name=>'P100_NMRO_DCMNTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(165771319709518116)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69345565891127980)
,p_name=>'P100_INDCDOR_ENTRNO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(341281794398659385)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69345939225127981)
,p_name=>'P100_INDCDOR_ACTLZA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(341281794398659385)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69346382026127982)
,p_name=>'P100_DFNCION_ISI'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(341281794398659385)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
':P100_DFNCION_ISI :=  pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte 				    => :F_CDGO_CLNTE,',
'										                             p_cdgo_dfncion_clnte_ctgria	=> ''CLN'',',
'										                             p_cdgo_dfncion_clnte			=> ''ISI'') ;',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69346784238127982)
,p_name=>'P100_ID_SJTO_IMPSTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(341281794398659385)
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69347198256127982)
,p_name=>'P100_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(341281794398659385)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_help_text=>'Seleccione el tributo asociado al acuerdo de pago.'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69348009259127983)
,p_name=>'P100_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(341281794398659385)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_help_text=>'Seleccione el sub tributo asociado al acuerdo de pago.'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69348998652127984)
,p_name=>'P100_PRMTRO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(341281794398659385)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del sujeto al que se le realiz\00F3 el acuerdo de pago.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69349833774127984)
,p_name=>'P100_RSPSTA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(341281794398659385)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69350284914127984)
,p_name=>'P100_CDGO_RSPSTA'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(341281794398659385)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69350624866127985)
,p_name=>'P100_ULTMO_DIA_MES'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(341281794398659385)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4472750374232508)
,p_computation_sequence=>10
,p_computation_item=>'P100_CDGO_SJTO_TPO_IMPSTO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_sjto_tpo',
'  from df_c_impuestos    a',
' where a.cdgo_clnte      = :F_CDGO_CLNTE',
'   and a.id_impsto       = :P100_ID_IMPSTO'))
,p_compute_when=>'P100_ID_IMPSTO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(69351897589127996)
,p_validation_name=>'Validar Impuesto'
,p_validation_sequence=>10
,p_validation=>'P100_ID_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe selecccionar un impuesto'
,p_validation_condition=>'BTN_CONSULTA_PARAMETROS,BTN_CONSULTAR'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(69353074864127999)
,p_validation_name=>'Fecha de Vencimiento no nula'
,p_validation_sequence=>30
,p_validation=>'P100_FCHA_VNCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor seleccione una fecha de vencimiento'
,p_when_button_pressed=>wwv_flow_api.id(69341845532127964)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(69352695070127999)
,p_validation_name=>'Reporte No nulo'
,p_validation_sequence=>50
,p_validation=>'P100_ID_RPRTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor Seleccione una Plantilla'
,p_when_button_pressed=>wwv_flow_api.id(69341845532127964)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(69355360722128002)
,p_name=>'Al selccionar Cuotas'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(165507052627283039)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(69355802114128004)
,p_event_id=>wwv_flow_api.id(69355360722128002)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'seleccionar_cuotas();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(69357114711128005)
,p_name=>unistr('Al cambiar la fecha de vencimiento Refrescar region Proyecci\00F3n de Cuota')
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P100_FCHA_VNCMNTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(69357612247128007)
,p_event_id=>wwv_flow_api.id(69357114711128005)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P100_FCHA_VNCMNTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(69358147067128008)
,p_event_id=>wwv_flow_api.id(69357114711128005)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(165507052627283039)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(69302540194464522)
,p_name=>unistr('Al hacer clic en el bot\00F3n consultar')
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(69344772739127979)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(69302773239464524)
,p_event_id=>wwv_flow_api.id(69302540194464522)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    v_ctdad_acrdos          number    := 0;',
'    v_id_cnvnio             number;',
'    v_tpo_bsqda             varchar2(3);',
'    ',
'begin',
'    ',
'    if :P100_CDGO_SJTO_TPO_IMPSTO = ''P'' then',
'        v_tpo_bsqda    := :P100_TPO_BSQDA_PRDIO;',
'    elsif :P100_CDGO_SJTO_TPO_IMPSTO = ''E'' then',
'        v_tpo_bsqda    := :P100_TPO_BSQDA_PRSNA;',
'    elsif :P100_CDGO_SJTO_TPO_IMPSTO = ''V'' then',
'        v_tpo_bsqda    := :P100_TPO_BSQDA_VHCLO;',
'    end if;',
'    ',
'    if v_tpo_bsqda  in (''IDN'', ''IDA'', ''DIR'', ''MTR'') then',
'        begin ',
'            select a.id_sjto_impsto',
'              into v_id_sjto_impsto',
'              from v_si_i_sujetos_impuesto    a',
'              left join si_i_predios               b on a.id_sjto_impsto    = b.id_sjto_impsto',
'             where cdgo_clnte                 = :F_CDGO_CLNTE',
'               and id_impsto                  = :P100_ID_IMPSTO              ',
'               and id_sjto_estdo = 1',
'               and ((v_tpo_bsqda = ''IDN'' and (a.idntfccion_sjto     = :P100_PRMTRO)or a.idntfccion_antrior = :P100_PRMTRO )or',
'                       (v_tpo_bsqda = ''IDA'' and a.idntfccion_antrior  = :P100_PRMTRO) or',
'                       (v_tpo_bsqda = ''DIR'' and a.drccion             = :P100_PRMTRO) or',
'                       (v_tpo_bsqda = ''MTR'' and b.mtrcla_inmblria     like ''%''||:P100_PRMTRO||''%'' ));',
'            -- Se consulta el numero de acuerdo de pagos',
'            begin ',
'                select nvl(count(id_cnvnio), 0)',
'                  into v_ctdad_acrdos',
'                  from gf_g_convenios    a',
'                 where id_sjto_impsto    = v_id_sjto_impsto',
'                   and cdgo_cnvnio_estdo = ''APL'';',
'            exception',
'                when others then ',
'                    v_ctdad_acrdos := 0;',
'            end;',
'',
'            if v_ctdad_acrdos > 0 then ',
'                -- tiene acuerdo de pagos',
'                :P100_RSPSTA            := ''1'';',
'                :P100_ID_SJTO_IMPSTO    := v_id_sjto_impsto;',
'                apex_util.set_session_state(''P100_RSPSTA'', ''1'');',
'                apex_util.set_session_state(''P100_ID_SJTO_IMPSTO_1'', v_id_sjto_impsto);',
'            else-- No tiene acuerdo de pagos ',
'                :P100_RSPSTA            := ''2'';',
'                :P100_ID_SJTO_IMPSTO    := null;',
'                apex_util.set_session_state(''P100_RSPSTA'', ''2'');',
'                apex_util.set_session_state(''P100_ID_SJTO_IMPSTO_1'', null);',
'            end if;',
'        exception',
'            when no_data_found then ',
'            :P100_RSPSTA                := ''0'';',
'            :P100_ID_SJTO_IMPSTO        := null;',
'            apex_util.set_session_state(''P100_RSPSTA'', ''0'');',
'            apex_util.set_session_state(''P100_ID_SJTO_IMPSTO_1'', null);',
'         ',
'            when others then ',
'                apex_util.set_session_state(''P100_RSPSTA'', ''0'');',
'                apex_util.set_session_state(''P100_ID_SJTO_IMPSTO_1'', null);',
'        end;',
'    elsif v_tpo_bsqda = ''NCN'' then ',
'        begin ',
'            select id_sjto_impsto',
'                 , id_cnvnio',
'              into v_id_sjto_impsto',
'                 , v_id_cnvnio',
'              from gf_g_convenios    a',
'             where a.nmro_cnvnio     = :P100_PRMTRO',
'               and cdgo_cnvnio_estdo = ''APL'';',
'            ',
'            :P100_RSPSTA           := ''1'';',
'            :P100_ID_SJTO_IMPSTO   := v_id_sjto_impsto;',
'            :P100_ID_CNVNIO        := v_id_cnvnio;',
'            apex_util.set_session_state(''P100_RSPSTA'', ''1'');',
'            apex_util.set_session_state(''P100_ID_SJTO_IMPSTO_1'', v_id_sjto_impsto);',
'            apex_util.set_session_state(''P100_ID_CNVNIO'', v_id_cnvnio);',
'        exception',
'            when others then ',
'                -- No Existe el Acuerdo de pago',
'                :P100_RSPSTA           := ''3''; ',
'                :P100_ID_SJTO_IMPSTO   := null;',
'                apex_util.set_session_state(''P100_RSPSTA'', ''3'');',
'                apex_util.set_session_state(''P100_ID_SJTO_IMPSTO'', null);',
'        end;',
'    end if;',
'end;'))
,p_attribute_02=>'P100_PRMTRO,P100_TPO_BSQDA_PRDIO,P100_TPO_BSQDA_PRSNA,P100_TPO_BSQDA_VHCLO,P100_CDGO_SJTO_TPO_IMPSTO'
,p_attribute_03=>'P100_ID_SJTO_IMPSTO,P100_RSPSTA,P100_ID_CNVNIO,P100_ID_SJTO_IMPSTO_1'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(69302688326464523)
,p_event_id=>wwv_flow_api.id(69302540194464522)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($v(''P100_RSPSTA'') == ''1'' ){',
'    // Si existe el sujeto y tiene acuerdo de pagos',
'    apex.submit();',
'}',
'else if  ($v(''P100_RSPSTA'') == ''0'' ){',
'    // No existe el sujeto impuesto',
'    Swal.fire({',
'        icon: ''error'',',
'        title:  ''<H2 >ACUERDO DE PAGO</H2>'',',
'        html: ''<H4>El Sujeto Impuesto ingresado NO existe.</H4>''',
'    });',
unistr('    // Se ocultan las regiones de informaci\00F3n b\00E1sica, convenio y cuotas'),
'    apex.item( "informacion_basica" ).hide();',
'    apex.item( "tab_selector_convenio" ).hide();',
'}',
'',
'else if  ($v(''P100_RSPSTA'') == ''2'' ){    ',
'    // Exite el Sujeto Impuesto pero no tiene acuerdo de pagos aplicados',
'    Swal.fire({',
'        icon: ''error'',',
'        title:  ''<H2 >ACUERDO DE PAGO</H2>'',',
'        html: ''<H4>El Sujeto Impuesto Consultado no tiene Acuerdos de Pagos Aplicados.</H4>''',
'    });',
unistr('    // Se ocultan las regiones de informaci\00F3n b\00E1sica, convenio y cuotas'),
'    apex.item( "informacion_basica" ).hide();',
'    apex.item( "tab_selector_convenio" ).hide(); ',
'}',
'else if  ($v(''P100_RSPSTA'') == ''3'' ){    ',
'    // El Acuerdo de Pago consultado no Existe',
'    Swal.fire({',
'        icon: ''error'',',
'        title:  ''<H2 >ACUERDO DE PAGO</H2>'',',
'        html: ''<H4>El Acuerdo de Pago consultado no Existe.</H4>''',
'    });',
unistr('    // Se ocultan las regiones de informaci\00F3n b\00E1sica, convenio y cuotas'),
'    apex.item( "informacion_basica" ).hide();',
'    apex.item( "tab_selector_convenio" ).hide(); ',
'}',
'',
';',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4472885944232509)
,p_name=>unistr('Al cambiar el tipo de busqueda para predio actualizar el label del \00EDtem de parametros')
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P100_TPO_BSQDA_PRDIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4472975941232510)
,p_event_id=>wwv_flow_api.id(4472885944232509)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var valor = $(''#P100_TPO_BSQDA_PRDIO'').find(''[value='' + $(''#P100_TPO_BSQDA_PRDIO'').val() + '']'').text();',
'$(''#P100_PRMTRO_LABEL'').text(valor);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4473073909232511)
,p_name=>unistr('Al cambiar el tipo de busqueda para persona actualizar el label del \00EDtem de parametros_1')
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P100_TPO_BSQDA_PRSNA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4473129221232512)
,p_event_id=>wwv_flow_api.id(4473073909232511)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var valor = $(''#P100_TPO_BSQDA_PRSNA'').find(''[value='' + $(''#P100_TPO_BSQDA_PRSNA'').val() + '']'').text();',
'$(''#P100_PRMTRO_LABEL'').text(valor);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4473282272232513)
,p_name=>unistr('Al cambiar el tipo de busqueda para veh\00EDculo actualizar el label del \00EDtem de parametros_1_1')
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P100_TPO_BSQDA_VHCLO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4473303163232514)
,p_event_id=>wwv_flow_api.id(4473282272232513)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var valor = $(''#P100_TPO_BSQDA_VHCLO'').find(''[value='' + $(''#P100_TPO_BSQDA_VHCLO'').val() + '']'').text();',
'$(''#P100_PRMTRO_LABEL'').text(valor);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(89519042614717313)
,p_name=>'Seleccionar acuerdo de Pago'
,p_event_sequence=>100
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(165505635716283025)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(89519164852717314)
,p_event_id=>wwv_flow_api.id(89519042614717313)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'seleccionar_convenio(this);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(85164411872979610)
,p_name=>unistr('Al dar clic en bot\00F3n Siguiente')
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(85164310862979609)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(85164531284979611)
,p_event_id=>wwv_flow_api.id(85164411872979610)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var gridView = apex.region("acuerdo_pago").widget().interactiveGrid("getViews").grid;',
'var records = gridView.getSelectedRecords();',
'',
'if(records.length >= 1){',
'    $(''a[href=#plan_pagos]'').click();',
'} else {',
'    Swal.fire(''Debe seleccionar un acuerdo de pago'');',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(85164883727979614)
,p_name=>'Al dar clic en Regresar'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(85164727783979613)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(85165097685979616)
,p_event_id=>wwv_flow_api.id(85164883727979614)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''a[href=#acuerdo_pago]'').click();'
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69354554098128001)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de Datos del Sujeto Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto number := nvl(:P100_ID_SJTO_IMPSTO, :P100_ID_SJTO_IMPSTO_1);',
'begin',
'    if :P100_CDGO_SJTO_TPO_IMPSTO = ''P'' then',
'        select a.idntfccion_sjto_frmtda',
'                , a.idntfccion_antrior_frmtda',
'                , upper(a.nmbre_pais || '' '' || a.nmbre_dprtmnto || '' '' || a.nmbre_mncpio)',
'                , a.drccion',
'                , a.cdgo_sjto_tpo',
'                , NVL(b.mtrcla_inmblria, ''--'')',
'             into :P100_IDNTFCCION_SJTO_FRMTDA',
'                , :P100_IDNTFCCION_ANTRIOR_FRMTDA',
'                , :P100_UBCCION',
'                , :P100_DRCCION',
'                , :P100_CDGO_SJTO_TPO   ',
'                , :P100_MTRCLA_INMBLRIA',
'             from V_SI_I_SUJETOS_IMPUESTO    a',
'             join si_i_predios               b on a.id_sjto_impsto = b.id_sjto_impsto',
'            where a.id_sjto_impsto           = v_id_sjto_impsto;',
'    elsif :P100_CDGO_SJTO_TPO_IMPSTO = ''E'' then',
'        select a.idntfccion_sjto_frmtda',
'                , a.idntfccion_antrior_frmtda',
'                , upper(a.nmbre_pais || '' '' || a.nmbre_dprtmnto || '' '' || a.nmbre_mncpio)',
'                , a.drccion',
'                , a.cdgo_sjto_tpo',
'                , ''--''',
'             into :P100_IDNTFCCION_SJTO_FRMTDA',
'                , :P100_IDNTFCCION_ANTRIOR_FRMTDA',
'                , :P100_UBCCION',
'                , :P100_DRCCION',
'                , :P100_CDGO_SJTO_TPO   ',
'                , :P100_MTRCLA_INMBLRIA',
'             from V_SI_I_SUJETOS_IMPUESTO    a',
'            where a.id_sjto_impsto           = v_id_sjto_impsto;',
'    elsif :P100_CDGO_SJTO_TPO_IMPSTO = ''V'' then',
'        select a.idntfccion_sjto_frmtda',
'                , a.idntfccion_antrior_frmtda',
'                , upper(a.nmbre_pais || '' '' || a.nmbre_dprtmnto || '' '' || a.nmbre_mncpio)',
'                , a.drccion',
'                , a.cdgo_sjto_tpo',
'                , ''--''',
'             into :P100_IDNTFCCION_SJTO_FRMTDA',
'                , :P100_IDNTFCCION_ANTRIOR_FRMTDA',
'                , :P100_UBCCION',
'                , :P100_DRCCION',
'                , :P100_CDGO_SJTO_TPO   ',
'                , :P100_MTRCLA_INMBLRIA',
'             from V_SI_I_SUJETOS_IMPUESTO    a',
'            where a.id_sjto_impsto           = v_id_sjto_impsto;        ',
'    end if;',
'',
'exception',
'    when others then',
'        :P100_IDNTFCCION_SJTO_FRMTDA       := null;',
'        :P100_IDNTFCCION_ANTRIOR_FRMTDA    := null;',
'        :P100_UBCCION                      := null;',
'        :P100_DRCCION                      := null;',
'        :P100_CDGO_SJTO_TPO                := null;',
'        :P100_MTRCLA_INMBLRIA              := null;',
'        :P100_ID_SJTO_IMPSTO               := null;',
'end;'))
,p_process_error_message=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69353381183128000)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto Impuesto x BTN_CONSULTAR'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    ',
'begin',
'    select a.id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto    a',
'      join si_i_predios               b on a.id_sjto_impsto    = b.id_sjto_impsto',
'     where cdgo_clnte                 = :F_CDGO_CLNTE',
'       and id_impsto                  = :P100_ID_IMPSTO',
'       and (',
'               (:P100_TPO_BSQDA       = ''REF'' and a.idntfccion_sjto     = :P100_PRMTRO) or',
'               (:P100_TPO_BSQDA       = ''RAN'' and a.idntfccion_antrior  = :P100_PRMTRO) or',
'               (:P100_TPO_BSQDA       = ''DIR'' and a.drccion             = :P100_PRMTRO) or',
'               (:P100_TPO_BSQDA       = ''MTR'' and b.mtrcla_inmblria     = :P100_PRMTRO)',
'            );',
'    ',
'    :P100_RSPSTA := ''1'';',
'    :P100_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'exception',
'    when no_data_found then ',
'    :P100_ID_SJTO_IMPSTO := null;',
'     :P100_RSPSTA := ''0'';',
'     --:P100_RSPSTA := '' No Existe el Sujeto Impuesto'' ;',
'end;'))
,p_process_error_message=>'&P100_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(69344772739127979)
,p_process_success_message=>'&P100_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69354105613128000)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Cache de Id sujeto Impuesto'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P100_ID_SJTO_IMPSTO'
,p_process_error_message=>'&P100_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(69344772739127979)
,p_process_when=>':P100_ID_SJTO_IMPSTO IS NULL or :P100_ID_SJTO_IMPSTO = 0'
,p_process_when_type=>'SQL_EXPRESSION'
,p_process_success_message=>'&P100_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69354957857128002)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Documentos de Cuotas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_id_cnvnio_mgrdo    varchar2(1);',
'    v_mnsje_rspsta       varchar2(1000);',
'    ',
'begin',
'        pkg_gf_convenios.prc_gn_recibo_couta_convenio (p_cdgo_clnte          => :F_CDGO_CLNTE,',
'                                                        p_id_cnvnio           => :P100_ID_CNVNIO,',
'                                                        p_cdnas_ctas          => :P100_NMRO_CTAS,',
'                                                        p_fcha_vncmnto        => :P100_FCHA_VNCMNTO,',
'                                                        p_indcdor_entrno      => ''PBLCO'',',
'                                                        o_id_dcmnto           => :F_ID_DCMNTO,',
'                                                        o_nmro_dcmnto         => :P100_NMRO_DCMNTO,',
'                                                        o_cdgo_rspsta         => :P100_CDGO_RSPSTA,',
'                                                        o_mnsje_rspsta        => :P100_RSPSTA);',
'                                                        ',
'',
'    ',
'    if :P100_CDGO_RSPSTA != 0 then',
'',
'       v_mnsje_rspsta := ''Error al generar el documento de convenio'';',
'       raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'end; '))
,p_process_error_message=>'Error al generar el documento de cuota de Acuerdo de pago'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(69341845532127964)
,p_process_when=>'P100_ID_RPRTE'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'&P100_RSPSTA.',
''))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(28414052664075102)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Documentos de Cuotas - PSE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_id_cnvnio_mgrdo    varchar2(1);',
'    v_mnsje_rspsta       varchar2(1000);',
'    v_id_dcmnto          number;',
'begin',
'        pkg_gf_convenios.prc_gn_recibo_couta_convenio (p_cdgo_clnte          => :F_CDGO_CLNTE,',
'                                                        p_id_cnvnio           => :P100_ID_CNVNIO,',
'                                                        p_cdnas_ctas          => :P100_NMRO_CTAS,',
'                                                        p_fcha_vncmnto        => :P100_FCHA_VNCMNTO,',
'                                                        p_indcdor_entrno      => ''PBLCO'',',
'                                                        o_id_dcmnto           => :F_ID_DCMNTO,',
'                                                        o_nmro_dcmnto         => :P100_NMRO_DCMNTO,',
'                                                        o_cdgo_rspsta         => :P100_CDGO_RSPSTA,',
'                                                        o_mnsje_rspsta        => :P100_RSPSTA);',
'                                                        ',
'        --apex_util.set_session_state(''F_ID_DCMNTO'', v_id_dcmnto);',
'        ',
'    if :P100_CDGO_RSPSTA != 0 then',
'       v_mnsje_rspsta := ''Error al generar el documento de convenio para recaudo por PSE.'';',
'       raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'end; '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(89517815607717301)
);
end;
/
