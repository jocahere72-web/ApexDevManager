prompt --application/pages/page_00062
begin
wwv_flow_api.create_page(
 p_id=>62
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Gesti\00F3n de omisos desconocidos')
,p_step_title=>unistr('Gesti\00F3n de omisos desconocidos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1',
'#APP_IMAGES#xlsx.min.js',
'#APP_IMAGES#FileSaver.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function seleccionarTodos(e,btn,grid,data){',
'',
'    var jsonCandidatos = data.map((candidato) => {',
'        return {',
'            "ID_CNDDTO" : candidato.ID_CNDDTO',
'        };',
'    });',
'    ',
'    //$s(''P62_JSON'', JSON.stringify(jsonCandidatos));',
'     window.localStorage.setItem(''jsonCandidatos'', JSON.stringify(jsonCandidatos));',
'     json_itemSession(jsonCandidatos);      ',
'     ocultarBotonAsignacion();',
'}',
'',
'function buildJsonCandidatos(){',
'',
'    var region = apex.region(''candidatos'');',
'    ',
'    if(region){',
'        ',
'        var view = apex.region("candidatos").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        var jsonCandidatos = records.map((candidato) => {',
'            return {"ID_CNDDTO" : model.getValue(candidato, "ID_CNDDTO")}; ',
'        });',
'        ',
'        $s(''P62_JSON'', JSON.stringify(jsonCandidatos));',
'        window.localStorage.setItem(''jsonCandidatos'', JSON.stringify(jsonCandidatos));',
'        ',
'        ocultarBotonAsignacion();',
'        ',
'      ',
'    }',
'}',
'',
'function ocultarBotonAsignacion(){',
'    if(JSON.parse(window.localStorage.jsonCandidatos).length > 0 && $("#P62_ID_FNCNRIO :selected").length > 0){',
'        apex.item(''asignar'').show();',
'    }else{',
'        apex.item(''asignar'').hide();',
'    }',
'    ',
'    if($("#P62_ID_FNCNRIO :selected").length > 1){',
'        $("#P62_DSTRBUIR_CONTAINER").show();',
'    }else{',
'        $("#P62_DSTRBUIR_CONTAINER").hide();',
'    }',
'    ',
'}',
'',
'const fnConsultarSujetosExcel = function(p_id_lote){',
'    ',
'    var popup = apex.widget.waitPopup();',
'    ',
'    apex.server.process(',
'            "Obtener_informacion_Excel",',
'            {    ',
'                 x01: p_id_lote',
'            },',
'            {',
'                //dataType: ''text'',',
'                success: function( pData ){',
'',
'                    popup.remove();',
'                    ',
'                    var wb = XLSX.utils.book_new();',
'                        ',
'                    wb.Props = {',
unistr('                            Title: "Candidatos para proceso de Fiscalizaci\00F3n",'),
'                            Subject: "",',
'                            Author: "Equipo GENESYS",',
'                            CreatedDate: new Date(2017,12,19)',
'                    };',
'                    ',
'                    //Parseamos los candidatos que se devuelven del lote',
'                    var v_candidatos = JSON.parse(pData.o_json_cnddto);',
'                        ',
'                    wb.SheetNames.push("Candidatos");',
'                    //var ws_data = [[''hello'' , ''world'']];',
'                    //var ws = XLSX.utils.aoa_to_sheet(ws_data);',
'                    var ws = XLSX.utils.json_to_sheet(v_candidatos);',
'',
'',
'                    wb.Sheets["Candidatos"] = ws;',
'',
'                    /*',
'                        const content = XLSX.write(book, { type: ''buffer'', bookType: ''xlsx'', bookSST: false });',
'                                    fs.writeFileSync("/path/to/folder/test-write.xlsx", content);',
'                    */',
'',
'                    var wbout = XLSX.write(wb, { type: ''binary'', bookType: ''xls'', bookSST: false });',
'',
'',
'                    function s2ab(s) {',
'',
'                            var buf = new ArrayBuffer(s.length);',
'                            var view = new Uint8Array(buf);',
'                            for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF;',
'                            return buf;',
'',
'                    }',
'                        ',
'                        ',
'                    ',
'                    // Descarga el archivo',
'                    saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), pData.o_file_name);',
'                    ',
'                    ',
'                  ',
'                }',
'            }',
'        );',
'}',
'',
'',
'function json_itemSession(p_json){    ',
'    console.log(p_json); ',
'    let array = p_json.length <= 1001 ? p_json : p_json.slice(0, 1000);',
'    apex.server.process("set_p62_json", {',
'        f01: JSON.stringify(array)',
'    }, {',
'        success: function (data) { ',
'                console.log(data.P62_JSON);          ',
'        },',
'        error: function () {',
'            console.log(''Error al consultar.'')',
'            console.log(arguments);',
'        }',
'    });',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''asignar'').hide();',
'$("#P62_DSTRBUIR_CONTAINER").hide();',
'window.localStorage.setItem(''jsonCandidatos'', [{}]);'))
,p_step_template=>wwv_flow_api.id(36470205860968633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LARIZA'
,p_last_upd_yyyymmddhh24miss=>'20211112151719'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(179492359137247937)
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
 p_id=>wwv_flow_api.id(179492403821247938)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(181556053570186526)
,p_plug_name=>unistr('Fiscalizaci\00F3n Selecci\00F3n de Lote')
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
 p_id=>wwv_flow_api.id(188960167495134226)
,p_plug_name=>'Tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(36509862944968653)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(188960319878134227)
,p_plug_name=>'Vigencia'
,p_region_name=>'vigencias'
,p_parent_plug_id=>wwv_flow_api.id(188960167495134226)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_cnddto_vgncia,',
'        a.id_cnddto,',
'        a.vgncia,',
'        f.prdo,',
'        b.candidato',
'        --e.dscrpcion',
'from fi_g_candidatos_vigencia       a',
'join v_fi_g_candidatos              b   on  a.id_cnddto = b.id_cnddto',
'join df_i_periodos                  f   on  a.id_prdo   = f.id_prdo',
'                                   --     and a.vgncia    = f.vgncia',
'where a.id_cnddto in (select b.id_cnddto from json_table(:P62_JSON, ''$[*]'' columns(id_cnddto number path ''$.ID_CNDDTO'')) b);'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(188961619704134240)
,p_name=>'ID_CNDDTO_VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNDDTO_VGNCIA'
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
 p_id=>wwv_flow_api.id(188961692961134241)
,p_name=>'ID_CNDDTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNDDTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(188961816159134242)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(202354504189270832)
,p_name=>'CANDIDATO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANDIDATO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Candidato'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>200
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(209198683448352226)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(188961493219134239)
,p_internal_uid=>188961493219134239
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
 p_id=>wwv_flow_api.id(188995939656250559)
,p_interactive_grid_id=>wwv_flow_api.id(188961493219134239)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(188996045793250559)
,p_report_id=>wwv_flow_api.id(188995939656250559)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(141569269438550365)
,p_view_id=>wwv_flow_api.id(188996045793250559)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(209198683448352226)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(188996528229250564)
,p_view_id=>wwv_flow_api.id(188996045793250559)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(188961619704134240)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(188997043596250566)
,p_view_id=>wwv_flow_api.id(188996045793250559)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(188961692961134241)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(188997564475250568)
,p_view_id=>wwv_flow_api.id(188996045793250559)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(188961816159134242)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(202367612597417846)
,p_view_id=>wwv_flow_api.id(188996045793250559)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(202354504189270832)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>264
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(188960463884134228)
,p_plug_name=>'Candidatos'
,p_region_name=>'candidatos'
,p_parent_plug_id=>wwv_flow_api.id(188960167495134226)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_cnddto,',
'        a.candidato,',
'        a.id_sjto_impsto,',
'        b.idntfccion_sjto,',
'        b.id_impsto,',
'        b.nmbre_impsto,',
'        c.id_impsto_sbmpsto,',
'        c.nmbre_impsto_sbmpsto,',
'        a.id_fsclzcion_lte,',
'        a.cdgo_cnddto_estdo',
'from v_fi_g_candidatos            a',
'join v_si_i_sujetos_impuesto    b  on   a.id_sjto_impsto    = b.id_sjto_impsto',
'join df_i_impuestos_subimpuesto c  on   a.id_impsto_sbmpsto = c.id_impsto_sbmpsto',
'where a.id_fsclzcion_lte = :P62_ID_FSCLZCION_LTE',
'and a.indcdor_asgndo = ''N''',
'and a.actvo = ''S'';',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(188960624068134230)
,p_name=>'ID_CNDDTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNDDTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>30
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(188960703117134231)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>40
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(188960908704134233)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>60
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(188960972052134234)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(188961149438134235)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(188961193735134236)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'SubTributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(188961400881134238)
,p_name=>'CDGO_CNDDTO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNDDTO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>3
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(189482866792744427)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(189483194181744430)
,p_name=>'ID_FSCLZCION_LTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FSCLZCION_LTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(202353902413270826)
,p_name=>'CANDIDATO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANDIDATO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Candidato'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(209198816499352227)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(188960478619134229)
,p_internal_uid=>188960478619134229
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'    ',
'    window.localStorage.removeItem(''jsonCandidatos'');',
'    ',
'    config.initialSelection = false;',
'    ',
'    return selectAll(config, {',
'        name: ''Seleccionar Todos'',',
'        action: seleccionarTodos',
'    }) ;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(188977064977193499)
,p_interactive_grid_id=>wwv_flow_api.id(188960478619134229)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(188977179342193500)
,p_report_id=>wwv_flow_api.id(188977064977193499)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(188977616676193514)
,p_view_id=>wwv_flow_api.id(188977179342193500)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(188960624068134230)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(188978161811193518)
,p_view_id=>wwv_flow_api.id(188977179342193500)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(188960703117134231)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(188979120784193523)
,p_view_id=>wwv_flow_api.id(188977179342193500)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(188960908704134233)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(188979595314193525)
,p_view_id=>wwv_flow_api.id(188977179342193500)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(188960972052134234)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(188980126482193526)
,p_view_id=>wwv_flow_api.id(188977179342193500)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(188961149438134235)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(188980597869193528)
,p_view_id=>wwv_flow_api.id(188977179342193500)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(188961193735134236)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(188981590636193539)
,p_view_id=>wwv_flow_api.id(188977179342193500)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(188961400881134238)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189565486038936620)
,p_view_id=>wwv_flow_api.id(188977179342193500)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(189483194181744430)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(202359877147271111)
,p_view_id=>wwv_flow_api.id(188977179342193500)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(202353902413270826)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209206940335379119)
,p_view_id=>wwv_flow_api.id(188977179342193500)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(209198816499352227)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(141563834867048800)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(179492403821247938)
,p_button_name=>'BTN_NVO_LTE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Lote'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:RP,9:P9_TIPO_PROGRAMA:&P62_ID_PAGINA.'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(141562618398048789)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(179492403821247938)
,p_button_name=>'BTN_PRCSAR_LTE'
,p_button_static_id=>'procesar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Procesar Lote'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:64:&SESSION.::&DEBUG.:RP,64:P64_ID_CNDDTO_LTE,P64_APP_ID,P64_APP_PAGE_ID,P64_ID_FSCLZCION_LTE:&P62_ID_FSCLZCION_LTE.,&APP_ID.,&APP_PAGE_ID.,&P62_ID_FSCLZCION_LTE.'
,p_button_condition=>':P62_ID_FSCLZCION_LTE is not null and :P62_ID_FSCLZCION_LTE_PRCSDO is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(141563073020048799)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(179492403821247938)
,p_button_name=>'BTN_ASGNAR'
,p_button_static_id=>'asignar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555595557968673)
,p_button_image_alt=>'Asignar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(141563400693048800)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(179492403821247938)
,p_button_name=>'BTN_ANLR_LTE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Eliminar Lote'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P62_ID_FSCLZCION_LTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14560585121099026)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(179492403821247938)
,p_button_name=>'BTN_DSCRGAR_ARCHVO_LTE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>unistr('Descargar informaci\00F3n<br> del lote')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P62_ID_FSCLZCION_LTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-download'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14560834862106818)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(179492403821247938)
,p_button_name=>'BTN_CARGAR_ARCHIVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Agregar candidatos <br>mediante cargue<br> de archivos'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:132:&SESSION.::&DEBUG.:RP,132:P132_ID_FSCLZCION_LTE,P132_ID_CRGA:&P62_ID_FSCLZCION_LTE.,&P62_ID_CRGA.'
,p_button_condition=>'P62_ID_CRGA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-file-excel-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(141582455660048987)
,p_branch_name=>'Go To Page 62'
,p_branch_action=>'f?p=&APP_ID.:62:&SESSION.::&DEBUG.:RP,62::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'BTN_ANLR_LTE,BTN_ASGNAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14560019053024802)
,p_name=>'P62_ID_PAGINA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(181556053570186526)
,p_source=>'62'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14562235938277061)
,p_name=>'P62_ID_CRGA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(181556053570186526)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_crga    number;',
'begin',
'    ',
'    begin',
'        select id_crga into v_id_crga',
'          from gn_d_codigos_proceso',
'         where cdgo_prcso = ''FIS'';',
'    exception',
'        when others then',
'            v_id_crga := null;',
'    end;',
'    ',
'    return v_id_crga;',
'    ',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141564545436048803)
,p_name=>'P62_ID_FSCLZCION_LTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(181556053570186526)
,p_prompt=>'Lote'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select UPPER( ''Lote: ''|| a.id_fsclzcion_lte || '' Fecha: '' ||  a.fcha_rgstro  || '' -'' || '' Tributo: '' || a.nmbre_impsto || '' -'' || '' Programa: '' || a.nmbre_prgrma || '' -'' || '' Subprograma: '' || a.nmbre_sbprgrma ) as d,',
'       a.id_fsclzcion_lte as r',
'from v_fi_g_fiscalizacion_lote a',
'where a.cdgo_clnte = :F_CDGO_CLNTE ',
'and a.id_fncnrio_rgstro = :F_ID_FNCNRIO --:F_ID_USRIO',
'and a.indcdor_prcsdo <> ''A''',
'and a.cdgo_prgrma = ''OD''',
'and ( a.id_fsclzcion_lte in ( select  c.id_fsclzcion_lte from fi_g_candidatos c where c.indcdor_asgndo = ''N'' ) or a.indcdor_prcsdo = ''N'')',
'order by a.id_fsclzcion_lte;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141564928333048825)
,p_name=>'P62_OBSRVCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(181556053570186526)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P62_ID_FSCLZCION_LTE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141565366846048825)
,p_name=>'P62_ID_FNCNRIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(181556053570186526)
,p_prompt=>'Funcionarios'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.prmer_nmbre ||'' ''|| c.prmer_aplldo as  d,',
'       a.id_fncnrio                         as  r',
'from df_c_funcionarios          a',
'join fi_d_programas_funcionario b   on  a.id_fncnrio    =   b.id_fncnrio',
'join si_c_terceros              c   on  a.id_trcro      =   c.id_trcro',
'where c.cdgo_clnte = :F_CDGO_CLNTE',
'and b.id_prgrma = (select l.id_prgrma from fi_g_fiscalizacion_lote l',
'                   where l.id_fsclzcion_lte = :P62_ID_FSCLZCION_LTE)',
'order by c.prmer_nmbre;'))
,p_lov_display_null=>'YES'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct 1',
'from fi_g_candidatos    a',
'where a.id_fsclzcion_lte = :P62_ID_FSCLZCION_LTE',
'and a.indcdor_asgndo = ''N'';'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'MULTI'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141565765824048826)
,p_name=>'P62_DSTRBUIR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(181556053570186526)
,p_prompt=>unistr('Distribuir Poblaci\00F3n')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141566123070048827)
,p_name=>'P62_ID_FSCLZCION_LTE_PRCSDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(181556053570186526)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141572021949048917)
,p_name=>'P62_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(188960463884134228)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(141581458604048984)
,p_name=>'Al cambiar'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P62_ID_FSCLZCION_LTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(141581901162048986)
,p_event_id=>wwv_flow_api.id(141581458604048984)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(141579581136048975)
,p_name=>'Al seleccionar Candidato'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(188960463884134228)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(141580028230048979)
,p_event_id=>wwv_flow_api.id(141579581136048975)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buildJsonCandidatos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(141580580539048980)
,p_event_id=>wwv_flow_api.id(141579581136048975)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P62_JSON'
,p_attribute_03=>'P62_JSON'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(141581042428048981)
,p_event_id=>wwv_flow_api.id(141579581136048975)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(188960319878134227)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(141576968347048952)
,p_name=>'AsignarFuncionarios'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(141563073020048799)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(141577494199048970)
,p_event_id=>wwv_flow_api.id(141576968347048952)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function AsignarFuncionarios() {',
'    ',
'    try{',
'        var popup = apex.widget.waitPopup();',
'        var json = window.localStorage.jsonCandidatos;',
'            ',
'        apex.server.process("ajaxAsignarFuncionarios",{',
'                f01: json,',
'                pageItems: "#P62_ID_FNCNRIO, #P62_DSTRBUIR"',
'            },{',
'                success: function(data) {',
'                    popup.remove();',
'                    if(data.o_cdgo_rspsta > 0) {',
'                        apex.message.clearErrors();',
'                        apex.message.showErrors ([',
'                            {',
'                                type:       "error",',
'                                location:   "page",',
'                                message:    data.o_mnsje_rspsta,',
'                                unsafe:     false',
'                            }',
'                        ]);',
'                    }else{',
unistr('                        apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                        if(data.o_cnddto_x_asgnar == 0){',
'                            apex.submit({request : "BTN_ASGNAR"});',
'                        }else{',
'                            var modelCandidato = apex.region("candidatos").widget().interactiveGrid("getViews", "grid").model;',
'                            var modelVigencia = apex.region("vigencias").widget().interactiveGrid("getViews", "grid").model;',
'                            modelCandidato.fetchRecords(modelCandidato._data);	',
'                            modelVigencia.fetchRecords(modelVigencia._data);	',
'                            ',
'                        }',
'                        ',
'                    }',
'                }',
'            })',
'',
'        ',
'    }catch(e){',
'        popup.remove();',
'        console.log(e);',
'    }',
'}',
'',
'',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de asignar los candidatos seleccionados?", function(okPressed) {'),
'    if(okPressed) {',
'       AsignarFuncionarios();',
'    }',
'});',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(141577763849048972)
,p_name=>'Al seleccionar Funcionario'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P62_ID_FNCNRIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(141578233952048972)
,p_event_id=>wwv_flow_api.id(141577763849048972)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'ocultarBotonAsignacion();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(141578693830048972)
,p_name=>'Sin seleccionar'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P62_ID_FSCLZCION_LTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_BE.CTB.SELECT2|ITEM TYPE|slctunselect'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(141579173593048973)
,p_event_id=>wwv_flow_api.id(141578693830048972)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(141562618398048789)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14563199269851606)
,p_name=>'Al dar click en BTN_DSCRGAR_ARCHVO_LTE'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(14560585121099026)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14563533992851628)
,p_event_id=>wwv_flow_api.id(14563199269851606)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnConsultarSujetosExcel($v(''P62_ID_FSCLZCION_LTE''));'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(141576524005048951)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Valida Procesamiento del lote'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  --Se valida si el lote fue procesado',
'  begin',
'      select distinct 1',
'      into :P62_ID_FSCLZCION_LTE_PRCSDO',
'      from fi_g_candidatos a',
'      where a.id_fsclzcion_lte = :P62_ID_FSCLZCION_LTE;',
'  exception',
'      when no_data_found then',
'          :P62_ID_FSCLZCION_LTE_PRCSDO := null;',
'  end;',
'  ',
'  ',
unistr('  --Se obtiene la obsevaci\00F3n del lote'),
'  begin',
'       select a.obsrvcion',
'       into :P62_OBSRVCION',
'       from fi_g_fiscalizacion_lote a',
'       where a.cdgo_clnte = :F_CDGO_CLNTE ',
'       and a.id_fsclzcion_lte = :P62_ID_FSCLZCION_LTE;',
'  exception',
'      when no_data_found then',
'          :P62_ID_FSCLZCION_LTE_PRCSDO := null;',
'  end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(141575794022048942)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Anular Lote'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    update fi_g_fiscalizacion_lote a',
'    set a.indcdor_prcsdo = ''A''',
'    where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_fsclzcion_lte = :P62_ID_FSCLZCION_LTE;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(141563400693048800)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(141576176513048950)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajaxAsignarFuncionarios'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cnddto          clob;',
'    v_cdgo_rspsta     number;',
'    v_cnddto_x_asgnar number;',
'    v_url             varchar2(4000);',
'    v_mnsje_rspsta    varchar(1000);',
'    v_exception       exception;',
'begin',
'',
'    for i in 1..apex_application.g_f01.count loop',
'        v_cnddto := v_cnddto || apex_application.g_f01(i);',
'    end loop;	',
'',
'    pkg_fi_fiscalizacion.prc_rg_cnddto_fncnrio_msvo(p_cdgo_clnte	   => :F_CDGO_CLNTE,',
'									                p_id_usrio         => :F_ID_USRIO,',
'									                p_funcionario      => :P62_ID_FNCNRIO,',
'									                p_candidato		   => v_cnddto,',
'                                                    p_id_fsclzcion_lte => :P62_ID_FSCLZCION_LTE,',
'                                                    p_dstrbuir         => :P62_DSTRBUIR,',
'                                                    o_cnddto_x_asgnar  => v_cnddto_x_asgnar,',
'									                o_cdgo_rspsta      => v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta     => v_mnsje_rspsta);',
'                                                    ',
'     if v_cdgo_rspsta > 0 then',
'         raise v_exception;',
'     end if;',
'                                                    ',
'     v_url := APEX_UTIL.PREPARE_URL(p_url => ''f?p='' || :APP_ID || '':'' || :APP_PAGE_ID || '':''|| :APP_SESSION || '':::'' || :APP_PAGE_ID || ''::'');                                                    ',
'                                                    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cnddto_x_asgnar'', v_cnddto_x_asgnar);',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.write(''v_url'', v_url);',
'    apex_json.close_object;                                                    ',
'exception',
'    when v_exception then',
'        rollback;',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;           ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14561040515116290)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Obtener_informacion_Excel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json_cnddto json_object_t := new json_object_t();',
'    v_json_array json_array_t := new json_array_t();',
'    v_lte         number := APEX_APPLICATION.g_x01;',
'begin',
'    for c_cnddtos_lte in (select  a.cdgo_clnte,',
'                                  a.id_fsclzcion_lte,',
'                                  a.id_cnddto,',
'                                  a.candidato,',
'                                  a.cdgo_prgrma,',
'                                  a.nmbre_prgrma,',
'                                  a.cdgo_sbprgrma,',
'                                  a.nmbre_sbprgrma',
'                            from  v_fi_g_candidatos     a',
'                           where a.id_fsclzcion_lte = v_lte',
'                             and a.indcdor_asgndo = ''N''',
'                             and a.actvo = ''S'')',
'     loop',
'         ',
'         ',
'         v_json_cnddto.put(''CLIENTE'', c_cnddtos_lte.cdgo_clnte);',
'         v_json_cnddto.put(''LOTE'', c_cnddtos_lte.id_fsclzcion_lte);',
'         v_json_cnddto.put(''CANDIDATO'', c_cnddtos_lte.id_cnddto);',
'         v_json_cnddto.put(''NOMBRE'', c_cnddtos_lte.candidato);',
'         v_json_cnddto.put(''CODIGO_PROGRAMA'', c_cnddtos_lte.cdgo_prgrma);',
'         v_json_cnddto.put(''PROGRAMA'', c_cnddtos_lte.nmbre_prgrma);',
'         v_json_cnddto.put(''CODIGO_SUBPROGRAMA'', c_cnddtos_lte.cdgo_sbprgrma);',
'         v_json_cnddto.put(''SUBPROGRAMA'', c_cnddtos_lte.nmbre_sbprgrma);',
'         ',
'         v_json_array.append(v_json_cnddto);',
'         ',
'     end loop;',
'     ',
'     apex_json.open_object();',
'     apex_json.write(''o_json_cnddto'',v_json_array.to_clob());',
'     apex_json.write(''o_file_name'', ''Lote_fiscalizacion_''||v_lte||''_''||to_char(sysdate,''yyyymmddhhmiss'')||''.xlsx'');',
'     apex_json.close_object();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14561357392121790)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set_p62_json'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_json  clob ;',
'v_count number := 0;',
'begin',
'for i in 1..apex_application.g_f01.count loop',
'        --if v_count >= 101 then',
'        --  EXIT WHEN v_count > 100; ',
'        --else',
'          v_json := v_json || apex_application.g_f01(i);',
'        --end if;',
'        --v_count := v_count + 1;',
' end loop;	',
'    ',
'apex_util.Set_session_state(''P62_JSON'', v_json);',
'apex_json.Open_Object();',
'apex_json.write(''P62_JSON'', v_json);',
'apex_json.close_Object();',
'',
'exception',
'  when others then',
'  insert into muerto(c_001, t_001) values(v_json, systimestamp);',
'  commit;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
