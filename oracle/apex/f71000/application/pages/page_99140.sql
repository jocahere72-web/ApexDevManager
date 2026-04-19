prompt --application/pages/page_99140
begin
wwv_flow_api.create_page(
 p_id=>99140
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Emisi\00F3n de Recibos Cuotas Sin Validacion de Fecha')
,p_step_title=>unistr('Emisi\00F3n de Recibos Cuotas Sin Validacion de Fecha')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
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
'    $s("P99140_ID_CNVNIO", id_cnvnio);',
'',
'    if ($v(''P99140_ID_CNVNIO'')) {',
'        $(''#plan_pagos_tab'').show();',
'    }/*else{',
'        $(''#plan_pagos_tab'').hide();',
'    }*/',
'',
'    apex.region("acuerdo_pago").widget().interactiveGrid("setSelectedRecords", records);',
'}',
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
'    $s("P99140_NMRO_CTAS", ctas.join('':''));',
'    total = total.toString().replace(".", ",");',
'    $s("P99140_VLOR_TTAL", total);',
'    apex.region("plan_pagos").widget().interactiveGrid("setSelectedRecords", records);',
'    sel = records;',
'    if ($v(''P99140_NMRO_CTAS'')) {',
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
''))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20240909115616'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52219392029038456)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i></b>',
'</h5>',
'<i>',
'    Funcionalidad que permite<br><br>    ',
'    <b>1. </b>Seleccionar el acuerdo de pago.<br><br>',
'    <b>2. </b>Seleccionar la(s) cuotas de acuerdo de pago a pagar.<br><br>',
'    <b>3. </b>Generar recibos de cuota(s) seleccionadas.<br><br>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(116172225167546366)
,p_plug_name=>'Tab Selector'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(115907050948311280)
,p_plug_name=>'Acuerdo de Pago'
,p_region_name=>'acuerdo_pago'
,p_parent_plug_id=>wwv_flow_api.id(116172225167546366)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
'        (select count(nmro_cta) from gf_g_convenios_extracto m where m.id_cnvnio = a.id_cnvnio and m.indcdor_cta_pgda = ''N'') ctas_pdntes,',
'        dscrpcion_cnvnio_estdo,',
'        1 cartera,',
'        2 pagos',
'   from v_gf_g_convenios a',
'  where a.id_sjto_impsto = :P99140_ID_SJTO_IMPSTO',
'    and cdgo_cnvnio_estdo = ''APL'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22734736687761572)
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
 p_id=>wwv_flow_api.id(116171134566546355)
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
 p_id=>wwv_flow_api.id(116171264414546356)
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
 p_id=>wwv_flow_api.id(116171373001546357)
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
 p_id=>wwv_flow_api.id(116171430725546358)
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
 p_id=>wwv_flow_api.id(116171516783546359)
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
 p_id=>wwv_flow_api.id(116171699543546360)
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
 p_id=>wwv_flow_api.id(116171717541546361)
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
 p_id=>wwv_flow_api.id(116171845868546362)
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
 p_id=>wwv_flow_api.id(116171927237546363)
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
,p_link_target=>'f?p=&APP_ID.:141:&SESSION.::&DEBUG.:RP,141:P141_ID_CNVNIO:&ID_CNVNIO.'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116172026806546364)
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
,p_link_target=>'f?p=&APP_ID.:142:&SESSION.::&DEBUG.:RP,142:P142_ID_CNVNIO:&ID_CNVNIO.'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116172141683546365)
,p_name=>'Seleccionar'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(115909467862311304)
,p_internal_uid=>115909467862311304
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
' config.initialSelection = false;',
' return config;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(116177392216548929)
,p_interactive_grid_id=>wwv_flow_api.id(115909467862311304)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(116177479520548929)
,p_report_id=>wwv_flow_api.id(116177392216548929)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23303537093089566)
,p_view_id=>wwv_flow_api.id(116177479520548929)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(22734736687761572)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>85
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116177968298548930)
,p_view_id=>wwv_flow_api.id(116177479520548929)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(116171134566546355)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116178472476548932)
,p_view_id=>wwv_flow_api.id(116177479520548929)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(116171264414546356)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116179006145548933)
,p_view_id=>wwv_flow_api.id(116177479520548929)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(116171373001546357)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116179417713548935)
,p_view_id=>wwv_flow_api.id(116177479520548929)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(116171430725546358)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>144
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116180010709548936)
,p_view_id=>wwv_flow_api.id(116177479520548929)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(116171516783546359)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>162
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116180490261548937)
,p_view_id=>wwv_flow_api.id(116177479520548929)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(116171699543546360)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116180981182548938)
,p_view_id=>wwv_flow_api.id(116177479520548929)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(116171717541546361)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116181504918548940)
,p_view_id=>wwv_flow_api.id(116177479520548929)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(116171845868546362)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116181942481548941)
,p_view_id=>wwv_flow_api.id(116177479520548929)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(116171927237546363)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>67
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116182450840548942)
,p_view_id=>wwv_flow_api.id(116177479520548929)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(116172026806546364)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>87
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(115908467859311294)
,p_plug_name=>unistr('C\00E1lculo de Cuotas')
,p_region_name=>'plan_pagos'
,p_parent_plug_id=>wwv_flow_api.id(116172225167546366)
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
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
'                sum(a.VLOR_CNCPTO_CPTAL) VLOR_CNCPTO_CPTAL,',
'                sum(a.VLOR_CNCPTO_INTRES) VLOR_CNCPTO_INTRES,',
'                sum(a.vlor_cncpto_fnccion) vlor_cncpto_fnccion,',
'            --    :P99140_FCHA_VNCMNTO,',
'                sum(a.vlor_cncpto_ttal) vlor_cta',
'           from table (pkg_gf_convenios.fnc_cl_convenios_cuota_cncpto (:F_CDGO_CLNTE, :P99140_ID_CNVNIO, :P99140_FCHA_VNCMNTO)) a',
'          --where a.estdo_cta != ''PAGADA''',
'        group by a.id_cnvnio_extrcto,',
'                a.id_cnvnio,',
'                a.nmro_cta,',
'                a.fcha_vncmnto,',
'           --     :P99140_FCHA_VNCMNTO,',
'                a.estdo_cta',
'        order by a.id_cnvnio,',
'                a.nmro_cta,',
'                a.fcha_vncmnto,',
'                a.estdo_cta',
'         ) a',
'   '))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(115907050948311280)
,p_ajax_items_to_submit=>'P99140_ID_CNVNIO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22734078785761565)
,p_name=>'VLOR_CTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Cuota'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(24098009678327855)
,p_name=>'ROW_NUM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROW_NUM'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(33415381216951263)
,p_name=>'ID_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNVNIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_parent_column_id=>wwv_flow_api.id(116171134566546355)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(33415423073951264)
,p_name=>'ID_CNVNIO_EXTRCTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNVNIO_EXTRCTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(99438799491525255)
,p_name=>'VLOR_CNCPTO_FNCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CNCPTO_FNCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Financiaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(104895737596135761)
,p_name=>'VLOR_CNCPTO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CNCPTO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(104895911226135762)
,p_name=>'VLOR_CNCPTO_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CNCPTO_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Interes de Mora'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(115908870439311298)
,p_name=>'NMRO_CTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 Cuota')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(115908975953311299)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(115909210238311301)
,p_name=>'ESTDO_CTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTDO_CTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado Cuota'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(115909373444311303)
,p_name=>'Imprimir'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(115908697405311296)
,p_internal_uid=>115908697405311296
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(116163904843532794)
,p_interactive_grid_id=>wwv_flow_api.id(115908697405311296)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(116163916859532794)
,p_report_id=>wwv_flow_api.id(116163904843532794)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23115972100371716)
,p_view_id=>wwv_flow_api.id(116163916859532794)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(22734078785761565)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(24103989649328094)
,p_view_id=>wwv_flow_api.id(116163916859532794)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(24098009678327855)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33445260839064097)
,p_view_id=>wwv_flow_api.id(116163916859532794)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(33415381216951263)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33451795002084598)
,p_view_id=>wwv_flow_api.id(116163916859532794)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(33415423073951264)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99444618182525761)
,p_view_id=>wwv_flow_api.id(116163916859532794)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(99438799491525255)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116164969452532800)
,p_view_id=>wwv_flow_api.id(116163916859532794)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(115908870439311298)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>215
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116165473658532801)
,p_view_id=>wwv_flow_api.id(116163916859532794)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(115908975953311299)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>214
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116166453981532804)
,p_view_id=>wwv_flow_api.id(116163916859532794)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(115909210238311301)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>257
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(138716139862727265)
,p_view_id=>wwv_flow_api.id(116163916859532794)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(104895737596135761)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(138716670697727271)
,p_view_id=>wwv_flow_api.id(116163916859532794)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(104895911226135762)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(19733561566159406)
,p_view_id=>wwv_flow_api.id(116163916859532794)
,p_execution_seq=>10
,p_name=>'PAGADA'
,p_background_color=>'#A1F7B2'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(115909210238311301)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'PAGADA'
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(19733646066167378)
,p_view_id=>wwv_flow_api.id(116163916859532794)
,p_execution_seq=>5
,p_name=>'VENCIDA'
,p_background_color=>'#FF6161'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(115909210238311301)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'VENCIDA'
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(116172734941546371)
,p_plug_name=>'Fecha de Vencimiento'
,p_parent_plug_id=>wwv_flow_api.id(115908467859311294)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(291683209630687640)
,p_plug_name=>'Sujeto Tributo'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(68394764416368155)
,p_plug_name=>'Plugin Sujeto Tributo'
,p_parent_plug_id=>wwv_flow_api.id(291683209630687640)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'P99140_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19745057586156188)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(116172734941546371)
,p_button_name=>'BTN_IMPRIMIR'
,p_button_static_id=>'BTN_IMPRIMIR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19747929339156191)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(291683209630687640)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19748350028156192)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(291683209630687640)
,p_button_name=>'BTN_CONSULTA_PARAMETROS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Consulta Par\00E1metros')
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(19762204449156208)
,p_branch_name=>'Imprimir Recibo Cuota'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_NMBRE_RPRTE:&P99140_ID_RPRTE.,Documento_No_&P99140_NMRO_DCMNTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(96440935671390215)
,p_branch_sequence=>10
,p_branch_condition_type=>'SQL_EXPRESSION'
,p_branch_condition=>':F_ID_DCMNTO > 0 and :P99140_CDGO_RSPSTA = 0'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(19761865408156207)
,p_branch_name=>'Ir a Busqueda Sujeto Impuesto'
,p_branch_action=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP:P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO,P3_VLDAR_CRTRA,P3_IMPSTO_SBMPSTO,P3_NMBRE_ITEM_IMPSTO,P3_NMBRE_ITEM_SBIMPSTO:&APP_ID.,&APP_PAGE_ID.,P99140_ID_SJTO_IMPSTO,&P99140_ID_IMPSTO.,N,&P99140_ID_IMPSTO_SBMPSTO.,P99140_ID_IMPSTO,P99140_ID_IMPSTO_SBMPSTO&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(19748350028156192)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19738251700156181)
,p_name=>'P99140_ID_CNVNIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(115907050948311280)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19738607176156182)
,p_name=>'P99140_VLOR_TTAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(115907050948311280)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19744362269156187)
,p_name=>'P99140_NMRO_CTAS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(115908467859311294)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19745480488156189)
,p_name=>'P99140_ID_RPRTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(116172734941546371)
,p_prompt=>'Reporte Cuota Acuerdo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_rprte d ,',
'        id_rprte r',
'   from gn_d_reportes',
'  where cdgo_rprte_grpo = ''RCA'';'))
,p_lov_display_null=>'YES'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccionar el documento de pago de cuota(s).'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19746398770156190)
,p_name=>'P99140_FCHA_VNCMNTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(116172734941546371)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Vencimiento'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese la fecha de vencimiento de la(s) cuota(s)'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19747283694156191)
,p_name=>'P99140_NMRO_DCMNTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(116172734941546371)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19748798254156192)
,p_name=>'P99140_INDCDOR_ENTRNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(291683209630687640)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19749135589156193)
,p_name=>'P99140_INDCDOR_ACTLZA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(291683209630687640)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19749535618156193)
,p_name=>'P99140_DFNCION_ISI'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(291683209630687640)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
':P99140_DFNCION_ISI :=  pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte 				    => :F_CDGO_CLNTE,',
'										                             p_cdgo_dfncion_clnte_ctgria	=> ''CLN'',',
'										                             p_cdgo_dfncion_clnte			=> ''ISI'') ;',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19749994511156193)
,p_name=>'P99140_ID_SJTO_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(291683209630687640)
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19750350096156194)
,p_name=>'P99140_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(291683209630687640)
,p_prompt=>'Tributo'
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
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el tributo asociado al acuerdo de pago.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19751256338156194)
,p_name=>'P99140_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(291683209630687640)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and id_impsto = :P99140_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P99140_ID_IMPSTO'
,p_ajax_items_to_submit=>'P99140_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el sub tributo asociado al acuerdo de pago.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19752158575156195)
,p_name=>'P99140_IDNTFCCION_PRMT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(291683209630687640)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del sujeto al que se le realiz\00F3 el acuerdo de pago.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19753074239156195)
,p_name=>'P99140_RSPSTA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(291683209630687640)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19753409958156195)
,p_name=>'P99140_CDGO_RSPSTA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(291683209630687640)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19753888323156196)
,p_name=>'P99140_ULTMO_DIA_MES'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(291683209630687640)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(19754626876156200)
,p_computation_sequence=>10
,p_computation_item=>'P99140_ULTMO_DIA_MES'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select to_char(last_day(SYSDATE), ''DD/MM/YYYY'')from dual;'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19755099876156200)
,p_validation_name=>'Validar Impuesto'
,p_validation_sequence=>10
,p_validation=>'P99140_ID_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe selecccionar un impuesto'
,p_validation_condition=>'BTN_CONSULTA_PARAMETROS,BTN_CONSULTAR'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_when_button_pressed=>wwv_flow_api.id(19748350028156192)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19756280437156201)
,p_validation_name=>'Fecha de Vencimiento no nula'
,p_validation_sequence=>30
,p_validation=>'P99140_FCHA_VNCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor seleccione una fecha de vencimiento'
,p_when_button_pressed=>wwv_flow_api.id(96440935671390215)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19755473472156201)
,p_validation_name=>unistr('Validar que la fecha de vencimiento este dentro de un rango de fechas en la parametrizaci\00F3n de tasas mora')
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_fcha_vlda varchar2(1);',
'',
'begin ',
'',
'    v_fcha_vlda := pkg_gn_generalidades.fnc_vl_fcha_vncmnto_tsas_mra (:F_CDGO_CLNTE, :P99140_ID_IMPSTO, to_date(:P99140_FCHA_VNCMNTO));',
'    ',
'    if v_fcha_vlda = ''S'' then ',
'        return true;',
'    else ',
'        return false;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('La fecha de Vencimiento seleccionada no es valida. Por favor revise las par\00E1metrizaci\00F3n de Tasas Mora')
,p_validation_condition=>'P99140_FCHA_VNCMNTO'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_associated_item=>wwv_flow_api.id(19746398770156190)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19755871516156201)
,p_validation_name=>'Reporte No nulo'
,p_validation_sequence=>50
,p_validation=>'P99140_ID_RPRTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor Seleccione una Plantilla'
,p_when_button_pressed=>wwv_flow_api.id(96440935671390215)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19758570383156204)
,p_name=>'Al selccionar Cuotas'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(115908467859311294)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19759066150156205)
,p_event_id=>wwv_flow_api.id(19758570383156204)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'seleccionar_cuotas();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19759463145156205)
,p_name=>'Seleccionar acuerdo de Pago'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(115907050948311280)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19759987643156206)
,p_event_id=>wwv_flow_api.id(19759463145156205)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'seleccionar_convenio(this);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19760356366156206)
,p_name=>unistr('Al cambiar la fecha de vencimiento Refrescar region Proyecci\00F3n de Cuota')
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P99140_FCHA_VNCMNTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19760883183156206)
,p_event_id=>wwv_flow_api.id(19760356366156206)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P99140_FCHA_VNCMNTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19761316605156207)
,p_event_id=>wwv_flow_api.id(19760356366156206)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(115908467859311294)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19757756752156203)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de Datos del Sujeto Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select idntfccion_sjto_frmtda,',
'        idntfccion_antrior_frmtda,',
'        upper(a.nmbre_pais || '' '' || a.nmbre_dprtmnto || '' '' || a.nmbre_mncpio),',
'        a.drccion,',
'        a.drccion_ntfccion,',
'        b.id_prdio,',
'        upper(a.nmbre_pais_ntfccion || '' '' || a.nmbre_dprtmnto_ntfccion || '' '' || a.nmbre_mncpio_ntfccion),',
'        a.tlfno,',
'        a.email,',
unistr('        decode(a.estdo_blqdo_sjto, ''S'', ''S\00ED'', ''No''),'),
unistr('        decode(a.estdo_blqdo_sjto_impsto, ''S'', ''S\00ED'', ''No''), '),
'        a.cdgo_sjto_tpo,',
'        b.dscrpcion_prdo_dstno,',
'        b.dscrpcion_estrto,',
'        b.nmbre_dstno_igac,',
'        b.cdgo_prdio_clsfccion,',
'        b.dscrpcion_uso_suelo,',
'        b.mtrcla_inmblria,',
'        to_char(b.avluo_ctstral, :F_FRMTO_MNDA)avluo_ctstral,',
'        to_char(b.avluo_cmrcial, :F_FRMTO_MNDA)avluo_cmrcial,',
'        (b.area_trrno|| '' '' || ''mts2''),',
'        (b.area_cnstrda|| '' '' || ''mts2''),',
'        (b.area_grvble|| '' '' || ''mts2''),',
unistr('        decode(b.indcdor_prdio_mncpio, ''S'', ''S\00ED'', ''No''),'),
'        nvl2(b.nmbre_brrio,b.nmbre_brrio,''NO DEFINIDO''),',
'        nvl2(b.nmbre_entdad,upper(b.nmbre_entdad),''NO DEFINIDO'')',
'        ',
'  into :P99140_IDNTFCCION,',
'       :P99140_IDNTFCCION_ANTRIOR,',
'       :P99140_UBCCION,',
'       :P99140_ID_PRDIO,',
'       :P99140_DRCCION,',
'       :P99140_DRCCION_NTFCCION,',
'       :P99140_UBCCION_NTFCCION,',
'       :P99140_TLFNO,',
'       :P99140_EMAIL,',
'       :P99140_ID_SJTO_ESTDO,',
'       :P99140_ESTDO_BLQDO,',
'       :P99140_CDGO_SJTO_TPO,',
'       :P99140_ID_PRDIO_DSTNO,',
'       :P99140_CDGO_ESTRTO,',
'       :P99140_CDGO_DSTNO_IGAC,',
'       :P99140_CDGO_PRDIO_CLSFCCION,',
'       :P99140_ID_PRDIO_USO_SLO,',
'       :P99140_MTRCLA_INMBLRIA,',
'       :P99140_AVLUO_CTSTRAL,',
'       :P99140_AVLUO_CMRCIAL,',
'       :P99140_AREA_TRRNO,',
'       :P99140_AREA_CNSTRDA,',
'       :P99140_AREA_GRVBLE,',
'       :P99140_INDCDOR_PRDIO_MNCPIO,',
'       :P99140_ID_BRRIO,',
'       :P99140_ID_ENTDAD',
'       ',
'  from V_SI_I_SUJETOS_IMPUESTO a ',
'  join v_si_i_predios b on a.id_sjto_impsto = b.id_sjto_impsto',
' where a.id_sjto_impsto = :P99140_ID_SJTO_IMPSTO;'))
,p_process_error_message=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19756569824156201)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto Impuesto x BTN_CONSULTAR'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    ',
'begin',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte    = :F_CDGO_CLNTE',
'       and (id_impsto    = :P99140_ID_IMPSTO or :P99140_ID_IMPSTO is null)',
'       and idntfccion_sjto    = :P99140_IDNTFCCION_PRMT;',
'    ',
'    :P99140_RSPSTA := '''';',
'    :P99140_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'exception',
'    when no_data_found then ',
'    :P99140_ID_SJTO_IMPSTO := null;',
'    :P99140_RSPSTA := ''No Existe el Sujeto Impuesto'';',
'end;'))
,p_process_error_message=>'&P99140_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(19747929339156191)
,p_process_success_message=>'&P99140_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19756902556156202)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto Impuesto X enter del item identificacion_prmt'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    ',
'begin',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte        = :F_CDGO_CLNTE',
'       and (id_impsto        = :P99140_ID_IMPSTO or :P99140_ID_IMPSTO is null)',
'       and idntfccion_sjto   = :P99140_IDNTFCCION_PRMT;',
'    ',
'    :P99140_RSPSTA := '''';',
'    :P99140_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'exception',
'    when no_data_found then ',
'    :P99140_ID_SJTO_IMPSTO := null;',
'    :P99140_RSPSTA := ''No Existe el Sujeto Impuesto'';',
'end;'))
,p_process_error_message=>'&P99140_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P99140_IDNTFCCION_PRMT'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'&P99140_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19757350800156202)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Cache de Id sujeto Impuesto'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P99140_ID_SJTO_IMPSTO'
,p_process_error_message=>'&P99140_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(19747929339156191)
,p_process_when=>':P99140_ID_SJTO_IMPSTO IS NULL or :P99140_ID_SJTO_IMPSTO = 0'
,p_process_when_type=>'SQL_EXPRESSION'
,p_process_success_message=>'&P99140_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19758152443156203)
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
'                                                        p_id_cnvnio           => :P99140_ID_CNVNIO,',
'                                                        p_cdnas_ctas          => :P99140_NMRO_CTAS,',
'                                                        p_fcha_vncmnto        => :P99140_FCHA_VNCMNTO,',
'                                                        p_indcdor_entrno      => ''PRVDO'',',
'                                                        o_id_dcmnto           => :F_ID_DCMNTO,',
'                                                        o_nmro_dcmnto         => :P99140_NMRO_DCMNTO,',
'                                                        o_cdgo_rspsta         => :P99140_CDGO_RSPSTA,',
'                                                        o_mnsje_rspsta        => :P99140_RSPSTA);',
'end; '))
,p_process_error_message=>'&P99140_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(96440935671390215)
,p_process_when=>'P99140_ID_RPRTE'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'&P99140_RSPSTA.'
);
end;
/
