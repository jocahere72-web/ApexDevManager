prompt --application/pages/page_00035
begin
wwv_flow_api.create_page(
 p_id=>35
,p_user_interface_id=>wwv_flow_api.id(237318207209524256)
,p_name=>unistr('Gesti\00F3n de Archivo Fuentes Externas')
,p_step_title=>unistr('Gesti\00F3n de Archivo Fuentes Externas')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function actualizarcolumnas() {',
'    ',
'    try {',
'        ',
'        respuesta = await apex.server.process("ActualizarColumnas", {',
'            pageItems: "#P58_ID_PRCSO_CRGA"',
'        }); ',
'        ',
'        respuesta.columnas =JSON.parse(respuesta.columnas); ',
'        ',
'        let columnas = Array.from($(''#archivo_ig_content_container th[role="columnheader"]'').find(''span'')).filter((f) => { ',
'            return respuesta.columnas.some((s) => s.columna === $(f).text().toUpperCase()) ',
'        }); ',
'        ',
'        ',
'         let columnasR = Array.from($(''#archivo_ig_content_container th[role="columnheader"]'').find(''span'')).filter((f) => { ',
'            return !respuesta.columnas.some((s) => s.columna === $(f).text().toUpperCase()) ',
'        });',
'        ',
'        /*columnasR.forEach((span) => {',
'            let cellIndex = $(span).parent()[0].cellIndex;',
'            $(''table tr'').find(`td:eq(${cellIndex}),th:eq(${cellIndex})`).remove();',
'        });*/',
'        ',
'        console.log(columnasR);',
'        ',
'        for await (columna of columnas) {',
'            let textcol = $(columna).text()',
'            let objeto = respuesta.columnas.find((f) => f.columna === textcol.toUpperCase())',
'            $(columna).text(objeto.descrpcion)',
'            //$(columna).parent().attr({ ''title'': objeto.descripcion })',
'        }',
'		',
'    } catch(e) {',
'        console.log(e);',
'    }',
'}',
'',
'actualizarcolumnas();',
''))
,p_css_file_urls=>'#IMAGE_PREFIX#css/infortributos/utilidades.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.col-3>.rel-col .col-1{',
'  padding: 0;',
'}',
'',
'.t-Form-inputContainer span.display_only {',
'    font-weight: 400;',
'    font-style: oblique;',
'}',
'',
'.t-Form-label{',
'  font-weight: 700;',
'}',
'',
'.t-Wizard{',
'  max-width: none;',
'}'))
,p_step_template=>wwv_flow_api.id(237212187010524183)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'RROBLEDO'
,p_last_upd_yyyymmddhh24miss=>'20201123020505'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(188113218758245867)
,p_plug_name=>'Container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95090543439200030)
,p_plug_name=>'Cantidad Registro vehiculo'
,p_parent_plug_id=>wwv_flow_api.id(188113218758245867)
,p_region_css_classes=>'badgeListColor1'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select ''Cantidad de Vehiculos Registrados'' as label, ',
'    count(*)  as value ',
'    from si_i_vehiculos h'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(180720513969896258)
,p_plug_name=>'Datos Archivo'
,p_region_name=>'archivo'
,p_parent_plug_id=>wwv_flow_api.id(188113218758245867)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(237243066872524200)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_rgstro_extrna ,',
'        clumna1 ,',
'        clumna2 ,',
'        clumna3 ,',
'        clumna4 ,',
'        clumna5 ,',
'        clumna6 ,',
'        clumna7 ,',
'        clumna8 ,',
'        clumna9 ,',
'        clumna10 ,',
'        clumna11 ,',
'        clumna12 ,',
'        clumna13 ,',
'        clumna14 ,',
'        clumna15 ,',
'        clumna16 ,',
'        clumna17 ,',
'        clumna18 ,',
'        clumna19 ,',
'        clumna20 ,',
'        clumna21 ,',
'        clumna22 ,',
'        clumna23 ,',
'        clumna24 ,',
'        clumna25 ,',
'        clumna26 ,',
'        clumna27 ,',
'        clumna28 ,',
'        clumna29 ,',
'        clumna30 ,',
'        clumna31 ,',
'        clumna32 ,',
'        clumna33 ,',
'        clumna34 ,',
'        clumna35 ,',
'        clumna36 ,',
'        id_prcso_crga ,',
'        id_prcso_intrmdia ,',
'        nmero_lnea ,',
'        indcdor_rgstro, ',
'        cdgo_crga   ',
'from gi_g_rgstro_vehiculo a',
'where a.id_prcso_crga = :P35_ID_PRCSO_CRGA;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95090348168200028)
,p_name=>'ID_RGSTRO_EXTRNA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RGSTRO_EXTRNA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Rgstro Extrna'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>590
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95090453177200029)
,p_name=>'CDGO_CRGA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CRGA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Cdgo Crga'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>600
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>5
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
 p_id=>wwv_flow_api.id(185982167451434946)
,p_name=>'CLUMNA1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA1'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna1'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185982260835434947)
,p_name=>'CLUMNA2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA2'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna2'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185982368097434948)
,p_name=>'CLUMNA3'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA3'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna3'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185982522865434949)
,p_name=>'CLUMNA4'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA4'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna4'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185982638858434950)
,p_name=>'CLUMNA5'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA5'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna5'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185982710860434951)
,p_name=>'CLUMNA6'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA6'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna6'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185982819681434952)
,p_name=>'CLUMNA7'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA7'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna7'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185982906264434953)
,p_name=>'CLUMNA8'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA8'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna8'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185982987261434954)
,p_name=>'CLUMNA9'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA9'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna9'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185983070654434955)
,p_name=>'CLUMNA10'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA10'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna10'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185983170836434956)
,p_name=>'CLUMNA11'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA11'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna11'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185983290610434957)
,p_name=>'CLUMNA12'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA12'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna12'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185983410085434958)
,p_name=>'CLUMNA13'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA13'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna13'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185983482061434959)
,p_name=>'CLUMNA14'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA14'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna14'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185983602057434960)
,p_name=>'CLUMNA15'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA15'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna15'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185983715226434961)
,p_name=>'CLUMNA16'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA16'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna16'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185983759033434962)
,p_name=>'CLUMNA17'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA17'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna17'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185983896076434963)
,p_name=>'CLUMNA18'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA18'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna18'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185984019675434964)
,p_name=>'CLUMNA19'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA19'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna19'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185984070385434965)
,p_name=>'CLUMNA20'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA20'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna20'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185984157401434966)
,p_name=>'CLUMNA21'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA21'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna21'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185984259853434967)
,p_name=>'CLUMNA22'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA22'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna22'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185984436558434968)
,p_name=>'CLUMNA23'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA23'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna23'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185984530622434969)
,p_name=>'CLUMNA24'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA24'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna24'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185984579039434970)
,p_name=>'CLUMNA25'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA25'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna25'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185984666842434971)
,p_name=>'CLUMNA26'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA26'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna26'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>290
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185984787296434972)
,p_name=>'CLUMNA27'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA27'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna27'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>300
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185984888307434973)
,p_name=>'CLUMNA28'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA28'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna28'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>310
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185984979672434974)
,p_name=>'CLUMNA29'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA29'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna29'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>320
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185985099390434975)
,p_name=>'CLUMNA30'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA30'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna30'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>330
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185985203364434976)
,p_name=>'CLUMNA31'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA31'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna31'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>340
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185985267394434977)
,p_name=>'CLUMNA32'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA32'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna32'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>350
,p_value_alignment=>'CENTER'
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(185985387871434978)
,p_name=>'CLUMNA33'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA33'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna33'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>360
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185985500049434979)
,p_name=>'CLUMNA34'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA34'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna34'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>370
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185985583814434980)
,p_name=>'CLUMNA35'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA35'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna35'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>380
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185985668233434981)
,p_name=>'CLUMNA36'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLUMNA36'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Clumna36'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>390
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(185987203850435946)
,p_name=>'ID_PRCSO_CRGA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSO_CRGA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>540
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
 p_id=>wwv_flow_api.id(185987324458435947)
,p_name=>'ID_PRCSO_INTRMDIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSO_INTRMDIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>550
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
 p_id=>wwv_flow_api.id(185987400722435948)
,p_name=>'NMERO_LNEA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMERO_LNEA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>560
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
 p_id=>wwv_flow_api.id(188114201845245877)
,p_name=>'INDCDOR_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_RGSTRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFRegistrado En Genesys?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>580
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>1
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
 p_id=>wwv_flow_api.id(185982032706434944)
,p_internal_uid=>185982032706434944
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SAVE'
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
 p_id=>wwv_flow_api.id(185992850891436945)
,p_interactive_grid_id=>wwv_flow_api.id(185982032706434944)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(185992903190436945)
,p_report_id=>wwv_flow_api.id(185992850891436945)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95468400902324979)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>57
,p_column_id=>wwv_flow_api.id(95090348168200028)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95471612903359317)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>58
,p_column_id=>wwv_flow_api.id(95090453177200029)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185993920222436957)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(185982167451434946)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185994428182436960)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(185982260835434947)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185994917101436963)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(185982368097434948)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185995444924436965)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(185982522865434949)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185995862656436966)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(185982638858434950)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185996389254436968)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(185982710860434951)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>252
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185996854839436969)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(185982819681434952)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185997370995436971)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(185982906264434953)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185997949221436973)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(185982987261434954)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185998436534436974)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(185983070654434955)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185998869412436976)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(185983170836434956)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185999360367436978)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(185983290610434957)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185999870708436979)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(185983410085434958)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186000405436436981)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(185983482061434959)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186000932528436982)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(185983602057434960)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186001378743436984)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(185983715226434961)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186001890405436986)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(185983759033434962)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186002440712436987)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(185983896076434963)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186002863126436989)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(185984019675434964)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186003409931436991)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(185984070385434965)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186003919046436997)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(185984157401434966)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186004366216436999)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(185984259853434967)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186004924051437001)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(185984436558434968)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186005401590437002)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(185984530622434969)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186005917553437004)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>25
,p_column_id=>wwv_flow_api.id(185984579039434970)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186006388232437006)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>26
,p_column_id=>wwv_flow_api.id(185984666842434971)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186006920463437007)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>27
,p_column_id=>wwv_flow_api.id(185984787296434972)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186007436361437009)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>28
,p_column_id=>wwv_flow_api.id(185984888307434973)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186007911756437011)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>29
,p_column_id=>wwv_flow_api.id(185984979672434974)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186008392750437013)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>30
,p_column_id=>wwv_flow_api.id(185985099390434975)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186008901525437014)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>31
,p_column_id=>wwv_flow_api.id(185985203364434976)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186009383695437016)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>32
,p_column_id=>wwv_flow_api.id(185985267394434977)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186009940227437030)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>33
,p_column_id=>wwv_flow_api.id(185985387871434978)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186010406158437032)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>34
,p_column_id=>wwv_flow_api.id(185985500049434979)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186010921192437033)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>35
,p_column_id=>wwv_flow_api.id(185985583814434980)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186011451161437035)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>36
,p_column_id=>wwv_flow_api.id(185985668233434981)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186018837849437067)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>52
,p_column_id=>wwv_flow_api.id(185987203850435946)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186019265523437068)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>53
,p_column_id=>wwv_flow_api.id(185987324458435947)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(186019833863437070)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>54
,p_column_id=>wwv_flow_api.id(185987400722435948)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189265009745388603)
,p_view_id=>wwv_flow_api.id(185992903190436945)
,p_display_seq=>56
,p_column_id=>wwv_flow_api.id(188114201845245877)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(186817580723183846)
,p_plug_name=>'Cantidad Registro'
,p_parent_plug_id=>wwv_flow_api.id(188113218758245867)
,p_region_css_classes=>'badgeListColor1'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Cantidad de Registros'' as label, ',
'       count(*)  as value ',
'from gi_g_rgstro_vehiculo h',
'where id_prcso_crga = :P35_ID_PRCSO_CRGA;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(223610547704360297)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'    </b>',
'</h5>',
'',
'<p align="justify">',
unistr('<i>Funcionalidad que permite crear lotes para ser procesados y obtener la poblaci\00F3n para ser registrada de manera masiva en veh\00EDculos</i>'),
'</p>',
'',
'',
'<p align="justify">',
unistr('<i>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>'),
'</p>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(273666632336951982)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95444782323208090)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(273666632336951982)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(237296397635524233)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95445146236208092)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(273666632336951982)
,p_button_name=>'BTN_PRCSAR_ARCHVO'
,p_button_static_id=>'iniciarFisca'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(237296397635524233)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'    from et_g_procesos_carga',
'   where id_prcso_crga  = :P35_ID_PRCSO_CRGA',
'     and indcdor_prcsdo = ''S'''))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95445571567208093)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(273666632336951982)
,p_button_name=>'BTN_RGSTRAR_SJTO_IMPTO'
,p_button_static_id=>'iniciarFisca'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(237296397635524233)
,p_button_image_alt=>'Registrar Sujeto impuesto'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:59:&SESSION.::&DEBUG.:RP:P59_ID_PRCSO_CRGA:&P35_ID_PRCSO_CRGA.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'    from et_g_procesos_carga a',
'    join fi_g_fuentes_externa b on a.id_prcso_crga = b.id_prcso_crga',
'   where a.id_prcso_crga  = :P35_ID_PRCSO_CRGA',
'     and a.indcdor_prcsdo = ''S''',
'     and b.indcdor_rgstro = ''N'';'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-user-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95425738251208050)
,p_name=>'P35_ID_PRCSO_CRGA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(188113218758245867)
,p_prompt=>'Archivos'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select file_name || ''  |  '' || to_char( fcha_rgstro , ''DD/MM/YYYY HH:MI:SS AM'' )  || ''  |  '' || nmbre_trcro as d',
'       , id_prcso_crga as r',
'    from v_et_g_procesos_carga a ',
'   where cdgo_clnte        = :F_CDGO_CLNTE',
'     and ( indcdor_prcsdo = ''N'' or :P35_ID_PRCSO_CRGA is not null )',
'     and id_prcso_crga  in (',
'                                 select h.id_prcso_crga from gi_g_rgstro_vehiculo h ',
'                                  group by h.id_prcso_crga',
'                            );'))
,p_lov_display_null=>'YES'
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from et_g_procesos_carga',
' where id_prcso_crga  = :P35_ID_PRCSO_CRGA',
'   and indcdor_prcsdo = ''S'''))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(237296017260524231)
,p_item_template_options=>'#DEFAULT#:margin-top-none'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(95446776763208101)
,p_name=>'Al cambiar'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P35_ID_PRCSO_CRGA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95447208753208102)
,p_event_id=>wwv_flow_api.id(95446776763208101)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95446308693208101)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Procesar Archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'v_json clob; ',
'v_cdgo_rpsta number; ',
'V_ID_SJTO_IMPSTO number;',
'v_mnsje_rspsta varchar2(1000); ',
'v_error exception; ',
'begin',
'',
'select JSON_OBJECT(''cdgo_clnte'' value 6,',
'                   ''idntfccion'' value clumna4,',
'                   ''id_dprtmnto'' value 08,',
'                   ''id_mncpio'' value 001,',
'                   ''id_impsto'' value 10,',
'                   ''id_usrio'' value 65,',
'                   ',
'                   ''cdgo_vhclo_clse'' value (select j.cdgo_vhclo_clse',
'                      from df_s_vehiculos_clase j',
'                     where upper(j.dscrpcion_vhclo_clse) like ''%'' || upper(clumna8) || ''%''',
'                       and rownum <= 1),',
'                       ',
'                   ''cdgo_vhclo_ctgtria'' value',
'                   (select l.cdgo_vhclo_ctgtria',
'                      from df_s_vehiculos_categoria l',
'                      join df_s_vehiculos_clase_ctgria x',
'                        on l.cdgo_vhclo_ctgtria = x.cdgo_vhclo_ctgtria',
'                      join df_s_vehiculos_clase g',
'                        on g.cdgo_vhclo_clse = x.cdgo_vhclo_clse',
'                       and g.dscrpcion_vhclo_clse =',
'                           (select j.dscrpcion_vhclo_clse',
'                              from df_s_vehiculos_clase j',
'                             where upper(j.dscrpcion_vhclo_clse) like ''%'' || upper(clumna8) || ''%''',
'                               and rownum <= 1)),',
'                   ',
'                   ''cdgo_vhclo_mrca'' value (select m.cdgo_vhclo_mrca',
'                      from df_s_vehiculos_marca m',
'                     where upper(m.dscrpcion_vhclo_mrca) like ''%'' || upper(clumna5) || ''%''',
'                       and rownum = 1',
'                       and m.mnstrio = ''S''),',
'                   ',
'                   ''id_vhclo_lnea'' value',
'                   (select p.id_vhclo_lnea',
'                      from df_s_vehiculos_linea p',
'                     where p.cdgo_vhclo_mrca in (select m.cdgo_vhclo_mrca',
'                                                   from df_s_vehiculos_marca m',
'                                                  where upper(m.dscrpcion_vhclo_mrca) = upper(clumna5)',
'                                                    and m.mnstrio = ''S'')',
'                       and upper(p.dscrpcion_vhclo_lnea) like ''%'' || upper(clumna7) || ''%''',
'                       and p.mnstrio = ''S''',
'                       and rownum = 1),',
'                   ',
'                   ''nmro_mtrcla'' value clumna17,',
'                   ',
'                   ''fcha_mtrcla'' value to_char(to_date(substr(a.clumna14, 1, 10), ''DD/MM/YYYY HH:MI:SS''), ''DD/MM/YYYY''),',
'                   ',
'                   ''cdgo_vhclo_srvcio'' value (select t.cdgo_vhclo_srvcio',
'                      from df_s_vehiculos_servicio t',
'                     where t.dscrpcion_vhclo_srvcio = upper(clumna9)),',
'                   ',
'                   ''vlor_cmrcial'' value nvl(clumna25,0),',
'                   ',
'                   ''fcha_cmpra'' value to_char(to_date(substr(a.clumna14, 1, 10), ''DD/MM/YYYY HH:MI:SS''), ''DD/MM/YYYY''),',
'                   ',
'                   ''avluo'' value nvl(clumna25, 0),',
'                   ',
'                   ''clndrje'' value nvl(clumna11, 0),',
'                   ',
'                   ''cpcdad_crga'' value nvl(clumna12, 0),',
'                   ',
'                   ''cpcdad_psjro'' value nvl(clumna20, 0),',
'                   ',
'                   ''cdgo_vhclo_crrcria'' value (select y.cdgo_vhclo_crrcria',
'                      from df_s_vehiculos_carroceria y',
'                     where y.dscrpcion_vhclo_crrocria = clumna13),',
'                   ',
'                   ''nmro_chsis'' value clumna17,',
'                   ',
'                   ''nmro_mtor'' value clumna16,',
'                   ',
'                   ''mdlo'' value clumna10,',
'                   ',
'                   ''cdgo_vhclo_cmbstble'' value ''99'',',
'                   ''nmro_dclrcion_imprtcion'' value ''99'',',
'                   ''fcha_imprtcion'' value to_char(to_date(substr(a.clumna14, 1, 10), ''DD/MM/YYYY HH:MI:SS''), ''DD/MM/YYYY''),',
'                   ''id_orgnsmo_trnsto'' value (select nvl(x1.id_orgnsmo_trnsto,''99'')',
'                      from df_s_organismos_transito x1',
'                     where trim(upper(x1.nmbre_orgnsmo_trnsto)) like ''%'' || trim(upper(clumna2)) || ''%''),',
'                   ''cdgo_vhclo_blndje'' value case',
'                      when clumna23 is not null and upper(clumna23) = ''BLINDAJE'' then',
'                       ''01''',
'                      else',
'                       ''99''',
'                   end,',
'                   ''cdgo_vhclo_oprcion'' value ''99'',',
'                   ''id_asgrdra'' value (select nvl(s.id_asgrdra,''99'')  from df_s_aseguradoras s',
'                                       where rownum <=1),',
'                   ''nmro_soat'' value ''99'',',
'                   ''fcha_vncmnto_soat'' value null,',
'                   ''cdgo_vhclo_trnsmsion'' value ''MT'' ,',
'                   ''indcdor_blnddo'' value case',
'                      when clumna23 is not null and upper(clumna23) = ''BLINDAJE'' then',
'                       ''S''',
'                      else',
'                       ''N''',
'                   end,',
'                   ''blnddo_s_n'' value ''N'',',
'                   ''clsco_s_n'' value ''N'',',
'                   ''intrndo_s_n'' value ''N'',',
'                   ''id_sjto_tpo'' value 47)',
'  into v_json from gi_g_rgstro_vehiculo a',
' where a.id_prcso_crga = :P35_ID_PRCSO_CRGA;',
'',
'  -- Registramos el vehiculo  ',
'                pkg_gi_vehiculos.prc_rg_msvo_vehiculos(p_json_v          => v_json,',
'                                                      o_sjto_impsto     => V_ID_SJTO_IMPSTO,',
'                                                      o_cdgo_rspsta     => v_cdgo_rpsta,',
'                                                      o_mnsje_rspsta    => v_mnsje_rspsta); ',
'    if(v_cdgo_rpsta != 0) then            ',
'            raise v_error;',
'    end if; ',
'    ',
'    ',
'end; ',
'                                                        ',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(95445146236208092)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95445955060208093)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ActualizarColumnas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    ',
'    v_cdgo_rspsta   number;',
'    v_mnsje_rspsta  varchar2(1000);',
'    v_clmnas        clob;',
'    v_exception     exception;',
'',
'begin',
'',
'    begin',
'        pkg_fi_fiscalizacion.prc_co_columnas_etl(p_cdgo_clnte      => :F_CDGO_CLNTE,',
'                                                 p_id_prcso_crga   => :P35_ID_PRCSO_CRGA,',
'                                                 o_clmnas          => v_clmnas,',
'                                                 o_cdgo_rspsta     => v_cdgo_rspsta,',
'                                                 o_mnsje_rspsta    => v_mnsje_rspsta);',
'         if v_cdgo_rspsta > 0 then',
'             raise v_exception; ',
'         end if;',
'        ',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', 0);',
'        apex_json.write(''columnas'', v_clmnas);',
'        apex_json.write(''o_mnsje_rspsta'', ''Funciona'');',
'        apex_json.close_object;',
'   ',
'    end;',
'',
'    ',
'    ',
'exception',
'    when v_exception then',
'         apex_json.open_object;',
'         apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'         apex_json.write(''o_mnsje_rspsta'', ''v_mnsje_rspsta'');',
'         apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
