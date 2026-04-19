prompt --application/pages/page_00059
begin
wwv_flow_api.create_page(
 p_id=>59
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>'Registro de Fuentes Externa'
,p_step_title=>'Registro de Fuentes Externa'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function jsonSujetos(){',
'    ',
'    var region = apex.region(''archivo'');',
'    ',
'    if(region) {',
'        ',
'        var view = apex.region("archivo").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        var jsonsujeto = records.map((s) => {',
'            return {',
'                        "id_fnte_extrna" : model.getValue(s, "ID_FNTE_EXTRNA")',
'                   }; ',
'        });',
'        ',
'        window.localStorage.setItem(''jsonsujeto'', JSON.stringify(jsonsujeto));',
'        ',
'    }',
'    ',
'}',
'',
'function allSujetos(e,btn,ig, data){',
'    ',
'    var jsonsujeto = data.map((s) => {',
'        return {',
'            "ID_FNTE_EXTRNA" : s.ID_FNTE_EXTRNA',
'        }; ',
'    });',
'    ',
'    window.localStorage.setItem(''jsonsujeto'', JSON.stringify(jsonsujeto));',
'   ',
'}'))
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
,p_step_template=>wwv_flow_api.id(36470205860968633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20251002162702'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(92689243291037836)
,p_plug_name=>'Container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(179149454892530532)
,p_plug_name=>'Datos Archivo'
,p_region_name=>'archivo'
,p_parent_plug_id=>wwv_flow_api.id(92689243291037836)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_fnte_extrna ,',
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
'        cdgo_crga,',
'        indcdor_rgstro',
'from fi_g_fuentes_externa a',
'where a.id_prcso_crga = :P59_ID_PRCSO_CRGA',
'and a.indcdor_rgstro = ''N'';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(92689730810037841)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(184411079143069219)
,p_name=>'ID_FNTE_EXTRNA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FNTE_EXTRNA'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(184411108374069220)
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
 p_id=>wwv_flow_api.id(184411201758069221)
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
 p_id=>wwv_flow_api.id(184411309020069222)
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
 p_id=>wwv_flow_api.id(184411463788069223)
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
 p_id=>wwv_flow_api.id(184411579781069224)
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
 p_id=>wwv_flow_api.id(184411651783069225)
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
 p_id=>wwv_flow_api.id(184411760604069226)
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
 p_id=>wwv_flow_api.id(184411847187069227)
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
 p_id=>wwv_flow_api.id(184411928184069228)
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
 p_id=>wwv_flow_api.id(184412011577069229)
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
 p_id=>wwv_flow_api.id(184412111759069230)
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
 p_id=>wwv_flow_api.id(184412231533069231)
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
 p_id=>wwv_flow_api.id(184412351008069232)
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
 p_id=>wwv_flow_api.id(184412422984069233)
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
 p_id=>wwv_flow_api.id(184412542980069234)
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
 p_id=>wwv_flow_api.id(184412656149069235)
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
 p_id=>wwv_flow_api.id(184412699956069236)
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
 p_id=>wwv_flow_api.id(184412836999069237)
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
 p_id=>wwv_flow_api.id(184412960598069238)
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
 p_id=>wwv_flow_api.id(184413011308069239)
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
 p_id=>wwv_flow_api.id(184413098324069240)
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
 p_id=>wwv_flow_api.id(184413200776069241)
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
 p_id=>wwv_flow_api.id(184413377481069242)
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
 p_id=>wwv_flow_api.id(184413471545069243)
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
 p_id=>wwv_flow_api.id(184413519962069244)
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
 p_id=>wwv_flow_api.id(184413607765069245)
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
 p_id=>wwv_flow_api.id(184413728219069246)
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
 p_id=>wwv_flow_api.id(184413829230069247)
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
 p_id=>wwv_flow_api.id(184413920595069248)
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
 p_id=>wwv_flow_api.id(184414040313069249)
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
 p_id=>wwv_flow_api.id(184414144287069250)
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
 p_id=>wwv_flow_api.id(184414208317069251)
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(184414328794069252)
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
 p_id=>wwv_flow_api.id(184414440972069253)
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(184414524737069254)
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
 p_id=>wwv_flow_api.id(184414609156069255)
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
 p_id=>wwv_flow_api.id(184416144773070220)
,p_name=>'ID_PRCSO_CRGA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSO_CRGA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>400
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
 p_id=>wwv_flow_api.id(184416265381070221)
,p_name=>'ID_PRCSO_INTRMDIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSO_INTRMDIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>410
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
 p_id=>wwv_flow_api.id(184416341645070222)
,p_name=>'NMERO_LNEA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMERO_LNEA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>420
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
 p_id=>wwv_flow_api.id(184416421479070223)
,p_name=>'CDGO_CRGA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CRGA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>430
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
 p_id=>wwv_flow_api.id(186543142767880151)
,p_name=>'INDCDOR_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_RGSTRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFRegistrado En Genesys?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>440
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
 p_id=>wwv_flow_api.id(184410973629069218)
,p_internal_uid=>184410973629069218
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'config.initialSelection = false;',
'  window.localStorage.removeItem(''jsonsujeto'');',
'   return selectAll(config, {',
'       name: ''Seleccionar Todos'',',
'       action: allSujetos',
'   }) ;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(184421791814071219)
,p_interactive_grid_id=>wwv_flow_api.id(184410973629069218)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(184421844113071219)
,p_report_id=>wwv_flow_api.id(184421791814071219)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184422294814071225)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(184411079143069219)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184422861145071231)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(184411108374069220)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184423369105071234)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(184411201758069221)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184423858024071237)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(184411309020069222)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184424385847071239)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(184411463788069223)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>188
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184424803579071240)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(184411579781069224)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184425330177071242)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(184411651783069225)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184425795762071243)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(184411760604069226)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>243
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184426311918071245)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(184411847187069227)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>171
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184426890144071247)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(184411928184069228)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184427377457071248)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(184412011577069229)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184427810335071250)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(184412111759069230)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184428301290071252)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(184412231533069231)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184428811631071253)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(184412351008069232)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184429346359071255)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(184412422984069233)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184429873451071256)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(184412542980069234)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184430319666071258)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(184412656149069235)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184430831328071260)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(184412699956069236)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184431381635071261)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(184412836999069237)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184431804049071263)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(184412960598069238)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184432350854071265)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(184413011308069239)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184432859969071271)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(184413098324069240)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184433307139071273)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(184413200776069241)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184433864974071275)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(184413377481069242)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184434342513071276)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(184413471545069243)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184434858476071278)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>25
,p_column_id=>wwv_flow_api.id(184413519962069244)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184435329155071280)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>26
,p_column_id=>wwv_flow_api.id(184413607765069245)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184435861386071281)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>27
,p_column_id=>wwv_flow_api.id(184413728219069246)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184436377284071283)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>28
,p_column_id=>wwv_flow_api.id(184413829230069247)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184436852679071285)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>29
,p_column_id=>wwv_flow_api.id(184413920595069248)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184437333673071287)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>30
,p_column_id=>wwv_flow_api.id(184414040313069249)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184437842448071288)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>31
,p_column_id=>wwv_flow_api.id(184414144287069250)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184438324618071290)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>32
,p_column_id=>wwv_flow_api.id(184414208317069251)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184438881150071304)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>33
,p_column_id=>wwv_flow_api.id(184414328794069252)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184439347081071306)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>34
,p_column_id=>wwv_flow_api.id(184414440972069253)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184439862115071307)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>35
,p_column_id=>wwv_flow_api.id(184414524737069254)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184440392084071309)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>36
,p_column_id=>wwv_flow_api.id(184414609156069255)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184447778772071341)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>52
,p_column_id=>wwv_flow_api.id(184416144773070220)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184448206446071342)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>53
,p_column_id=>wwv_flow_api.id(184416265381070221)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184448774786071344)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>54
,p_column_id=>wwv_flow_api.id(184416341645070222)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(184449198610071345)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>55
,p_column_id=>wwv_flow_api.id(184416421479070223)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(187693950668022877)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_display_seq=>41
,p_column_id=>wwv_flow_api.id(186543142767880151)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(93854153436842331)
,p_view_id=>wwv_flow_api.id(184421844113071219)
,p_execution_seq=>5
,p_name=>'Desconocido'
,p_background_color=>'#FF7755 '
,p_text_color=>'#000000'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(186543142767880151)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'N'
,p_is_enabled=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(221748557072801699)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
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
unistr('<i>Funcionalidad que permite crear lotes para ser procesados y obtener la poblaci\00F3n que va hacer fiscalizada de acuerdo a los parametros de busqueda de la consulta y distribuir la poblaci\00F3n entre los funcionarios de Fiscalizaci\00F3n</i>'),
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
 p_id=>wwv_flow_api.id(271803944784392309)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(92687579329037819)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(271803944784392309)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:58:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(93562708069648376)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(271803944784392309)
,p_button_name=>'BTN_RGSTRAR'
,p_button_static_id=>'iniciarFisca'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar <br> Sujeto Impuestos'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_prcso_crga ',
'from fi_g_fuentes_externa a',
'where a.id_prcso_crga = :P59_ID_PRCSO_CRGA',
'and a.indcdor_rgstro = ''N'';'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92689560260037839)
,p_name=>'P59_ID_PRCSO_CRGA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(92689243291037836)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92689959283037843)
,p_name=>'P59_ID_SJTO_TPO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(92689243291037836)
,p_prompt=>'Tipo Sujeto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select a.nmbre_sjto_tpo as d,',
'       a.id_sjto_tpo',
'from DF_I_SUJETOS_TIPO a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_impsto = (',
'                        select id_impsto',
'                        from df_c_impuestos',
'                        where cdgo_clnte = :F_CDGO_CLNTE',
'                        and cdgo_impsto = ''ICA''',
'                  );'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(92690012651037844)
,p_name=>'Al seleccionar'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(179149454892530532)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92690107316037845)
,p_event_id=>wwv_flow_api.id(92690012651037844)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'jsonSujetos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(92690266499037846)
,p_name=>'Registrar Sujeto Impuesto'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(93562708069648376)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92690338209037847)
,p_event_id=>wwv_flow_api.id(92690266499037846)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function RegistrarSujetoImpuesto() {',
'    ',
'    try {',
'        ',
'        if ( JSON.parse(window.localStorage.jsonsujeto).length > 0 ) {',
'            ',
'            var json = window.localStorage.jsonsujeto;',
'            ',
'            await apex.server.process("RegistrarSujetoImpuesto", {',
'                f01: json,',
'                pageItems: "#P59_ID_SJTO_TPO"',
'            },{',
'                success: function(data) {',
'                    ',
'                    if(data.o_cdgo_rspsta > 0) {',
'                        ',
'                        apex.message.clearErrors();',
'                        apex.message.showErrors([',
'                            {',
'                                type:       "error",',
'                                location:   "page",',
'                                message:    data.o_mnsje_rspsta,',
'                                unsafe:     false',
'                            }',
'                        ]);',
'                    ',
'                    } else{',
unistr('                        apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                        apex.submit();',
'                    }',
'                }',
'            })',
'            ',
'        } else {',
'            apex.message.clearErrors();',
'            apex.message.showErrors([',
'                {',
'                    type:       "error",',
'                    location:   "page",',
'                    message:    "Seleccione los Sujetos para registrarlos en el Sistema Genesys",',
'                    unsafe:     false',
'                }',
'            ]);',
'        }',
'        ',
'        ',
'        ',
'    } catch(e) {',
'        console.log(e);',
'    }',
'    ',
'}',
'',
unistr('apex.message.confirm("\00BFEst\00E1 seguro de realizar el registro?", function(okPressed) {'),
'   if(okPressed) {',
'       RegistrarSujetoImpuesto();',
'   } ',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(92689805510037842)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(179149454892530532)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Datos Archivo - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(93893020166944450)
,p_process_sequence=>20
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
'                                                 p_id_prcso_crga   => :P58_ID_PRCSO_CRGA,',
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
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(92690446981037848)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RegistrarSujetoImpuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    ',
'    v_cdgo_rspsta   number;',
'    v_mnsje_rspsta  varchar2(1000);',
'    v_sujetos       clob;',
'    v_exception     exception;',
'',
'begin',
'',
'    for i in 1..apex_application.g_f01.count loop',
'        v_sujetos := v_sujetos || apex_application.g_f01(i);',
'    end loop;',
'    ',
'    if :P59_ID_SJTO_TPO is null then',
'        v_cdgo_rspsta := 1;',
'        v_mnsje_rspsta := ''Seleccione el tipo de sujeto'';',
'        raise v_exception;',
'    end if;',
'    ',
'    pkg_fi_fiscalizacion.prc_rg_sujetos(p_cdgo_clnte      => :F_CDGO_CLNTE,',
'                                        p_id_usrio        => :F_ID_USRIO,',
'                                        p_id_sjto_tpo     => :P59_ID_SJTO_TPO,',
'                                        p_sujeto          => v_sujetos,',
'                                        o_cdgo_rspsta     => v_cdgo_rspsta,',
'                                        o_mnsje_rspsta    => v_mnsje_rspsta);',
'                                        ',
'     if v_cdgo_rspsta > 0 then',
'         raise v_exception;',
'     end if;',
'    ',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'    ',
'exception',
'    when v_exception then',
'        rollback;',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
