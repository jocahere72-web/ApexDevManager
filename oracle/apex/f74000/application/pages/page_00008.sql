prompt --application/pages/page_00008
begin
wwv_flow_api.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Selecci\00F3n Poblaci\00F3n')
,p_step_title=>unistr('Selecci\00F3n Poblaci\00F3n')
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
'   // $s(''P8_JSON'', JSON.stringify(jsonCandidatos));',
'    window.localStorage.setItem(''jsonCandidatos'', JSON.stringify(jsonCandidatos));',
'    json_itemSession(jsonCandidatos); ',
'    ocultarBotonAsignacion();',
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
'        $s(''P8_JSON'', JSON.stringify(jsonCandidatos));',
'        window.localStorage.setItem(''jsonCandidatos'', JSON.stringify(jsonCandidatos));',
'        ',
'        ocultarBotonAsignacion();',
'        ',
'      ',
'    }',
'}',
'',
'function ocultarBotonAsignacion(){',
'    if(JSON.parse(window.localStorage.jsonCandidatos).length > 0 && $("#P8_ID_FNCNRIO :selected").length > 0){',
'        apex.item(''asignar'').show();',
'    }else{',
'        apex.item(''asignar'').hide();',
'    }',
'    ',
'    if($("#P8_ID_FNCNRIO :selected").length > 1){',
'        $("#P8_DSTRBUIR_CONTAINER").show();',
'    }else{',
'        $("#P8_DSTRBUIR_CONTAINER").hide();',
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
'function json_itemSession(p_json){',
'    console.log(p_json); ',
'    let array = p_json.length <= 1001 ? p_json : p_json.slice(0, 1000);',
'    apex.server.process("set_p8_json", {',
'        f01: JSON.stringify(array)',
'    }, {',
'        success: function (data) { ',
'                console.log(data.P8_JSON);          ',
'        },',
'        error: function () {',
'            console.log(''hola esta vuelta fallo.'')',
'            console.log(arguments);',
'        }',
'    });',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''asignar'').hide();',
'$("#P8_DSTRBUIR_CONTAINER").hide();',
'window.localStorage.setItem(''jsonCandidatos'', [{}]);'))
,p_step_template=>wwv_flow_api.id(36470205860968633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20240709090619'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37930494179199212)
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
 p_id=>wwv_flow_api.id(37930538863199213)
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
 p_id=>wwv_flow_api.id(39994188612137801)
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
 p_id=>wwv_flow_api.id(47398302537085501)
,p_plug_name=>'Tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(36509862944968653)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(47398454920085502)
,p_plug_name=>'Vigencia'
,p_region_name=>'vigencias'
,p_parent_plug_id=>wwv_flow_api.id(47398302537085501)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_cnddto_vgncia,',
'        a.id_cnddto,',
'        a.vgncia,',
'        f.prdo,',
'        b.candidato,',
'        e.dscrpcion',
'from fi_g_candidatos_vigencia       a',
'join v_fi_g_candidatos              b   on  a.id_cnddto = b.id_cnddto',
'join df_i_periodos                  f   on  a.id_prdo   = f.id_prdo',
'                                        and a.vgncia    = f.vgncia',
'left join gi_d_dclrcnes_vgncias_frmlr    c   on  a.id_dclrcion_vgncia_frmlrio    =  c.id_dclrcion_vgncia_frmlrio',
'left join gi_d_dclrcnes_tpos_vgncias     d   on  c.id_dclrcion_tpo_vgncia        =  d.id_dclrcion_tpo_vgncia',
'left join gi_d_declaraciones_tipo        e   on  d.id_dclrcn_tpo                 =  e.id_dclrcn_tpo',
'where a.id_cnddto in (select b.id_cnddto from json_table(:P8_JSON, ''$[*]'' columns(id_cnddto number path ''$.ID_CNDDTO'')) b);'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(47399754746085515)
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
 p_id=>wwv_flow_api.id(47399828003085516)
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
 p_id=>wwv_flow_api.id(47399951201085517)
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
 p_id=>wwv_flow_api.id(60792639231222107)
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
 p_id=>wwv_flow_api.id(60792726322222108)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Tipo de Declaraci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(67636818490303501)
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
 p_id=>wwv_flow_api.id(47399628261085514)
,p_internal_uid=>47399628261085514
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
 p_id=>wwv_flow_api.id(47434074698201834)
,p_interactive_grid_id=>wwv_flow_api.id(47399628261085514)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(47434180835201834)
,p_report_id=>wwv_flow_api.id(47434074698201834)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1246887044698)
,p_view_id=>wwv_flow_api.id(47434180835201834)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(60792726322222108)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7404480501640)
,p_view_id=>wwv_flow_api.id(47434180835201834)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(67636818490303501)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(47434663271201839)
,p_view_id=>wwv_flow_api.id(47434180835201834)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(47399754746085515)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(47435178638201841)
,p_view_id=>wwv_flow_api.id(47434180835201834)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(47399828003085516)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(47435699517201843)
,p_view_id=>wwv_flow_api.id(47434180835201834)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(47399951201085517)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(60805747639369121)
,p_view_id=>wwv_flow_api.id(47434180835201834)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(60792639231222107)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>264
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(47398598926085503)
,p_plug_name=>'Candidatos'
,p_region_name=>'candidatos'
,p_parent_plug_id=>wwv_flow_api.id(47398302537085501)
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
'where a.id_fsclzcion_lte = :P8_ID_FSCLZCION_LTE',
'and a.indcdor_asgndo = ''N''',
'and a.actvo = ''S'';',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(47398759110085505)
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
 p_id=>wwv_flow_api.id(47398838159085506)
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
 p_id=>wwv_flow_api.id(47399043746085508)
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
 p_id=>wwv_flow_api.id(47399107094085509)
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
 p_id=>wwv_flow_api.id(47399284480085510)
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
 p_id=>wwv_flow_api.id(47399328777085511)
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
 p_id=>wwv_flow_api.id(47399535923085513)
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
 p_id=>wwv_flow_api.id(47921001834695702)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(47921329223695705)
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
 p_id=>wwv_flow_api.id(60792037455222101)
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
 p_id=>wwv_flow_api.id(67636951541303502)
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
 p_id=>wwv_flow_api.id(47398613661085504)
,p_internal_uid=>47398613661085504
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
 p_id=>wwv_flow_api.id(47415200019144774)
,p_interactive_grid_id=>wwv_flow_api.id(47398613661085504)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(47415314384144775)
,p_report_id=>wwv_flow_api.id(47415200019144774)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(47415751718144789)
,p_view_id=>wwv_flow_api.id(47415314384144775)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(47398759110085505)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(47416296853144793)
,p_view_id=>wwv_flow_api.id(47415314384144775)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(47398838159085506)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(47417255826144798)
,p_view_id=>wwv_flow_api.id(47415314384144775)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(47399043746085508)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(47417730356144800)
,p_view_id=>wwv_flow_api.id(47415314384144775)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(47399107094085509)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(47418261524144801)
,p_view_id=>wwv_flow_api.id(47415314384144775)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(47399284480085510)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(47418732911144803)
,p_view_id=>wwv_flow_api.id(47415314384144775)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(47399328777085511)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(47419725678144814)
,p_view_id=>wwv_flow_api.id(47415314384144775)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(47399535923085513)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48003621080887895)
,p_view_id=>wwv_flow_api.id(47415314384144775)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(47921329223695705)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(60798012189222386)
,p_view_id=>wwv_flow_api.id(47415314384144775)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(60792037455222101)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67645075377330394)
,p_view_id=>wwv_flow_api.id(47415314384144775)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(67636951541303502)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39994392614137803)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(37930538863199213)
,p_button_name=>'BTN_NVO_LTE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Lote'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:RP,9:P9_TIPO_PROGRAMA:&P8_ID_PAGINA.'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(146796932499898522)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(37930538863199213)
,p_button_name=>'BTN_CARGAR_ARCHIVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Agregar candidatos <br>mediante cargue<br> de archivos'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:132:&SESSION.::&DEBUG.:RP,132:P132_ID_FSCLZCION_LTE,P132_ID_CRGA:&P8_ID_FSCLZCION_LTE.,&P8_ID_CRGA.'
,p_button_condition=>'P8_ID_CRGA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-file-excel-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(47465066162509601)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(37930538863199213)
,p_button_name=>'BTN_PRCSAR_LTE'
,p_button_static_id=>'procesar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Procesar Lote'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:RP,10:P10_ID_CNDDTO_LTE,P10_APP_ID,P10_APP_PAGE_ID:&P8_ID_FSCLZCION_LTE.,&APP_ID.,&APP_PAGE_ID.'
,p_button_condition=>':P8_ID_FSCLZCION_LTE is not null and :P8_ID_FSCLZCION_LTE_PRCSDO is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23032104574051301)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(37930538863199213)
,p_button_name=>'BTN_AGRGAR_SJTO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Agregar Candidato(s)'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:72:&SESSION.::&DEBUG.:RP,72:P72_ID_CNDDTO_LTE:&P8_ID_FSCLZCION_LTE.'
,p_button_condition=>':P8_ID_FSCLZCION_LTE is not null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(48030874388376201)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(37930538863199213)
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
 p_id=>wwv_flow_api.id(14444885177012902)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(37930538863199213)
,p_button_name=>'BTN_ANLR_LTE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Eliminar Lote'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P8_ID_FSCLZCION_LTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(146796581923898518)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(37930538863199213)
,p_button_name=>'BTN_DSCRGAR_ARCHVO_LTE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>unistr('Descargar informaci\00F3n<br> del lote')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:8:&SESSION.:imprimir:&DEBUG.:RP::'
,p_button_condition=>'P8_ID_FSCLZCION_LTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-download'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(49142355310313006)
,p_branch_name=>'Go To Page 8'
,p_branch_action=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP,8::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'BTN_ANLR_LTE,BTN_ASGNAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14444764369012901)
,p_name=>'P8_OBSRVCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(39994188612137801)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P8_ID_FSCLZCION_LTE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14553537053968101)
,p_name=>'P8_ID_PAGINA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(39994188612137801)
,p_source=>'8'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39994218089137802)
,p_name=>'P8_ID_FSCLZCION_LTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(39994188612137801)
,p_prompt=>'Lote'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select UPPER( ''Lote: ''|| a.id_fsclzcion_lte || '' Fecha: '' ||  a.fcha_rgstro  || '' -'' || '' Tributo: '' || a.nmbre_impsto || '' -'' || '' Programa: '' || a.nmbre_prgrma || '' -'' || '' Subprograma: '' || a.nmbre_sbprgrma ) as d,',
'       a.id_fsclzcion_lte as r',
'from v_fi_g_fiscalizacion_lote a',
'where a.cdgo_clnte = :F_CDGO_CLNTE ',
'and a.id_fncnrio_rgstro = :F_ID_FNCNRIO ',
'and a.indcdor_prcsdo <> ''A''',
'and ( a.id_fsclzcion_lte in ( select  c.id_fsclzcion_lte from fi_g_candidatos c where c.indcdor_asgndo = ''N'' ) or a.indcdor_prcsdo = ''N'')',
'and cdgo_prgrma != ''OD''',
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
 p_id=>wwv_flow_api.id(47921286027695704)
,p_name=>'P8_ID_FNCNRIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(39994188612137801)
,p_prompt=>'Funcionarios'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.prmer_nmbre ||'' ''|| c.prmer_aplldo as  d,',
'       a.id_fncnrio                         as  r',
'from df_c_funcionarios          a',
'join fi_d_programas_funcionario b   on  a.id_fncnrio    =   b.id_fncnrio',
'join si_c_terceros              c   on  a.id_trcro      =   c.id_trcro',
'where c.cdgo_clnte = :F_CDGO_CLNTE',
'and b.actvo = ''S''',
'and b.id_prgrma = (select l.id_prgrma from fi_g_fiscalizacion_lote l',
'                   where l.id_fsclzcion_lte = :P8_ID_FSCLZCION_LTE)',
'and b.id_sbprgrma = (select k.id_sbprgrma from fi_g_fiscalizacion_lote k',
'                   where k.id_fsclzcion_lte = :P8_ID_FSCLZCION_LTE)',
'order by c.prmer_nmbre;'))
,p_lov_display_null=>'YES'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct 1',
'from fi_g_candidatos    a',
'where a.id_fsclzcion_lte = :P8_ID_FSCLZCION_LTE',
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
 p_id=>wwv_flow_api.id(49142718908313010)
,p_name=>'P8_ID_FSCLZCION_LTE_PRCSDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(39994188612137801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60792117987222102)
,p_name=>'P8_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(47398598926085503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67855015352874301)
,p_name=>'P8_DSTRBUIR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(39994188612137801)
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
 p_id=>wwv_flow_api.id(146797224023898525)
,p_name=>'P8_ID_CRGA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(39994188612137801)
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
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(29535684150458733)
,p_validation_name=>unistr('Validar Identificaci\00F3n')
,p_validation_sequence=>10
,p_validation=>'P8_IDNTFCCION_SJTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'P8_IDNTFCCION_SJTO'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(47881035367164702)
,p_name=>'Al cambiar'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8_ID_FSCLZCION_LTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47881166384164703)
,p_event_id=>wwv_flow_api.id(47881035367164702)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(48030959801376202)
,p_name=>'Al seleccionar Candidato'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(47398598926085503)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48031077482376203)
,p_event_id=>wwv_flow_api.id(48030959801376202)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buildJsonCandidatos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(60792453009222105)
,p_event_id=>wwv_flow_api.id(48030959801376202)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P8_JSON'
,p_attribute_03=>'P8_JSON'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(60792592279222106)
,p_event_id=>wwv_flow_api.id(48030959801376202)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(47398454920085502)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(48031234068376205)
,p_name=>'AsignarFuncionarios'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(48030874388376201)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48031393429376206)
,p_event_id=>wwv_flow_api.id(48031234068376205)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function AsignarFuncionarios() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        var json = window.localStorage.jsonCandidatos;',
'        let contentJson = JSON.parse(json);',
'        let array = contentJson.length <= 1001 ? contentJson : contentJson.slice(0, 1000);',
'        console.log(''array'', array)',
'        await apex.server.process("ajaxAsignarFuncionarios",{',
'                f01:json, //JSON.stringify(array), //apex.item(''P8_JSON'').getValue()',
'                pageItems: "#P8_ID_FNCNRIO, #P8_DSTRBUIR"',
'            },{',
'                success: function(data) {',
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
'                        setTimeout(() => {',
'                            location.reload();',
'                        }, 2000)',
'                        if(data.o_cnddto_x_asgnar == 0){',
'                            apex.submit({request : "BTN_ASGNAR"});',
'                        }/*else{',
'                            var modelCandidato = apex.region("candidatos").widget().interactiveGrid("getViews", "grid").model;',
'                            var modelVigencia = apex.region("vigencias").widget().interactiveGrid("getViews", "grid").model;',
'                            modelCandidato.fetchRecords(modelCandidato._data);	',
'                            modelVigencia.fetchRecords(modelVigencia._data);	',
'                            ',
'                        }*/',
'                        ',
'                    }',
'                }',
'            })',
'',
'        ',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
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
 p_id=>wwv_flow_api.id(48402300957185105)
,p_name=>'Al seleccionar Funcionario'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8_ID_FNCNRIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48402466943185106)
,p_event_id=>wwv_flow_api.id(48402300957185105)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'ocultarBotonAsignacion();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(49142084736313003)
,p_name=>'Sin seleccionar'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8_ID_FSCLZCION_LTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_BE.CTB.SELECT2|ITEM TYPE|slctunselect'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49142112009313004)
,p_event_id=>wwv_flow_api.id(49142084736313003)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(47465066162509601)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(146796619988898519)
,p_name=>'Al dar click en BTN_DSCRGAR_ARCHVO_LTE'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(146796581923898518)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(146796730032898520)
,p_event_id=>wwv_flow_api.id(146796619988898519)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnConsultarSujetosExcel($v(''P8_ID_FSCLZCION_LTE''));'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(25529345878502102)
,p_name=>'Al cerrar la modal'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(146796932499898522)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25529453002502103)
,p_event_id=>wwv_flow_api.id(25529345878502102)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(47398598926085503)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29534989882458726)
,p_name=>'Al cambiar P8_ID_PRGRMA'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8_ID_PRGRMA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29535097404458727)
,p_event_id=>wwv_flow_api.id(29534989882458726)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'   select cdgo_prgrma ',
'     into :P8_CDGO_PRGRMA',
'     from fi_d_programas ',
'    where id_prgrma = :P8_ID_PRGRMA;',
'exception',
'      when no_data_found then ',
'           :P8_CDGO_PRGRMA := null;',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29537324400458750)
,p_name=>'Al cambiar P8_ID_IMPSTO'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8_ID_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29639842611846101)
,p_event_id=>wwv_flow_api.id(29537324400458750)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    apex_collection.create_or_truncate_collection( p_collection_name => ''CANDIDATOS'' );',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(49142662656313009)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Valida Procesamiento del lote'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  --Se valida si el lote fue procesado',
'  begin',
'      select distinct 1',
'      into :P8_ID_FSCLZCION_LTE_PRCSDO',
'      from fi_g_candidatos a',
'      where a.id_fsclzcion_lte = :P8_ID_FSCLZCION_LTE;',
'  exception',
'      when no_data_found then',
'          :P8_ID_FSCLZCION_LTE_PRCSDO := null;',
'  end;',
'  ',
'  ',
unistr('  --Se obtiene la obsevaci\00F3n del lote'),
'  begin',
'       select a.obsrvcion',
'       into :P8_OBSRVCION',
'       from fi_g_fiscalizacion_lote a',
'       where a.cdgo_clnte = :F_CDGO_CLNTE ',
'       and a.id_fsclzcion_lte = :P8_ID_FSCLZCION_LTE;',
'  exception',
'      when no_data_found then',
'          :P8_ID_FSCLZCION_LTE_PRCSDO := null;',
'  end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(97770592609805202)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'prc_dscrga_excel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'  v_num_fla       number := 5;     -- Numero de filas del excel',
'  v_num_impstos   number := 5;',
'  v_num_col       number := 0;     -- Inicio de columnas',
'  v_bfile         bfile;           -- Apuntador del documento en disco',
'  o_file_blob     blob;            -- Archivo blob de salida',
'  v_directorio    clob;            -- Directorio donde caera el archivo',
'  v_file_name     varchar2(3000);  -- Nombre del rachivo',
'  v_file_blob     blob;            ',
'  v_nmbre_clnte   varchar2(1000); ',
'  v_slgan         varchar2(1000); ',
'  v_nit           varchar2(1000);  ',
'  v_nmbre_dcmnto  varchar2(100);',
'  v_cdgo_prgrma   varchar2(100);',
'  v_cdgo_sbprgrma varchar2(100);',
'  v_id_lte        number;',
'begin',
'  -- Datos del cliente',
'    select  upper(nmbre_clnte)',
'        , nmro_idntfccion',
'        , upper(slgan)          ',
'    into  v_nmbre_clnte ',
'      , v_nit',
'      , v_slgan',
'    from df_s_clientes',
'    where cdgo_clnte = :F_CDGO_CLNTE;',
'  ',
'    v_id_lte := :P8_ID_FSCLZCION_LTE;',
'  ',
'    select  c.cdgo_prgrma,',
'            b.cdgo_sbprgrma',
'    into    v_cdgo_prgrma,',
'            v_cdgo_sbprgrma',
'    from fi_g_fiscalizacion_lote a ',
'    join fi_d_programas  c on a.id_prgrma = c.id_prgrma',
'    join fi_d_subprogramas  b on a.id_sbprgrma = b.id_sbprgrma',
'    where a.id_fsclzcion_lte = v_id_lte;  ',
'  ',
'  o_file_blob  :=  empty_blob(); -- Inicializacion del blob ',
'  v_directorio := ''COPIAS'';      -- Nombre del directorio donde caera el archivo',
'  v_file_name  := ''Temp_.xlsx'';  -- Nombre del archivo',
'  --se crea un hoja       ',
'  as_xlsx.new_sheet(''Candidatos'');',
'  ',
'  --combinamos celdas  ',
'  as_xlsx.mergecells( 1, 1, 12, 1 );  --Cliente',
'  as_xlsx.mergecells( 1, 2, 12, 2 );  --Slogan',
'  as_xlsx.mergecells( 1, 3, 12, 3 );  --Nit',
'',
'  ',
'  --estilos de encabezado          ',
'  as_xlsx.cell( 1, 1 , v_nmbre_clnte, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' )',
'                                   , p_fontId => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 12));      ',
'                                   ',
'  as_xlsx.cell( 1, 2 , v_slgan, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' )',
'                                   , p_fontId => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 12));',
'                                   ',
'  as_xlsx.cell( 1, 3 , ''Nit. '' || v_nit, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' )',
'                                   , p_fontId => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 12));',
'                                   ',
unistr('  as_xlsx.cell( 1, 4 , ''Identificaci\00F3n Lote:'', p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' )'),
'                                   , p_fontId => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 12));        ',
'',
'  as_xlsx.cell( 2, 4 ,  v_id_lte, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' )',
'                                   , p_fontId => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 12)); ',
'                                   ',
unistr('  as_xlsx.cell( 5, 4 ,  ''C\00F3digo Programa:'', p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' )'),
'                                   , p_fontId => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 12)); ',
'                                   ',
'  as_xlsx.cell( 6, 4 ,  v_cdgo_prgrma, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' )',
'                                   , p_fontId => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 12));   ',
'                                   ',
'                                   ',
unistr('  as_xlsx.cell( 7, 4 ,  ''C\00F3digo Sub-Programa:'', p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' )'),
'                                   , p_fontId => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 12));                                    ',
'   ',
'  as_xlsx.cell( 8, 4 ,  v_cdgo_sbprgrma, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' )',
'                                   , p_fontId => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 12));   ',
'                                   ',
'  -- Aliniar fila 6 del excel y creamos filtro',
'  as_xlsx.set_row(p_row  => 5',
'                , p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'', p_vertical => ''center'')',
'                , p_fontId    => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 11));  ',
'  ',
'  --as_xlsx.set_autofilter(4, 4, p_row_start => 5, p_row_end => 1000 ); --Filtro',
'  ',
'  --Nombre de las columnas',
'  as_xlsx.cell( 1, v_num_fla , ''CLIENTE*'');',
'  as_xlsx.cell( 2, v_num_fla , ''LOTE*'');',
'  as_xlsx.cell( 3, v_num_fla , ''CANDIDATO'');',
'  as_xlsx.cell( 4, v_num_fla , ''NOMBRE'');',
unistr('  as_xlsx.cell( 5, v_num_fla , ''C\00D3DIGO PROGRAMA*'');'),
'  as_xlsx.cell( 6, v_num_fla , ''PROGAMA'');',
unistr('  as_xlsx.cell( 7, v_num_fla , ''C\00D3DIGO SUBPROGRAMA*'');'),
'  as_xlsx.cell( 8, v_num_fla , ''SUBPROGRAMA'');',
unistr('  as_xlsx.cell( 9, v_num_fla , ''IDENTIFICACI\00D3N*'');'),
'  as_xlsx.cell( 10, v_num_fla , ''IMPUESTO*'');',
'  as_xlsx.cell( 11, v_num_fla , ''SUBIMPUESTO*'');',
'  as_xlsx.cell( 12, v_num_fla , ''VIGENCIA DESDE*'');',
'  as_xlsx.cell( 13, v_num_fla , ''VIGENCIA HASTA*'');',
'  as_xlsx.cell( 14, v_num_fla , ''PERIODO'');',
unistr('  as_xlsx.cell( 15, v_num_fla , ''C\00D3DIGO PERIODICIDAD'');'),
unistr('  as_xlsx.cell( 16, v_num_fla , ''C\00D3DIGO TRIBUTO ACTO'');'),
unistr('  as_xlsx.cell( 17, v_num_fla , ''FECHA EXPEDICI\00D3N'');'),
unistr('  as_xlsx.cell( 18, v_num_fla , ''N\00DAMERO RENTA'');'),
'',
'  /*-- Consulta de impuestos',
'  as_xlsx.cell( 17, v_num_fla , ''ID IMPUEST0'');',
'  as_xlsx.cell( 18, v_num_fla , ''COD. IMPUESTO'');',
'  as_xlsx.cell( 19, v_num_fla , ''NOMBRE IMPUESTO'');',
'  as_xlsx.cell( 20, v_num_fla , ''ID SUB. IMPUESTO'');',
'  as_xlsx.cell( 21, v_num_fla , ''COD. SUB. IMPUESTO'');',
'  as_xlsx.cell( 22, v_num_fla , ''NOMBRE SUB. IMPUESTO'');',
'  ',
'  for c_impsto in (select a.id_impsto, a.cdgo_impsto, a.nmbre_impsto ',
'                     from df_c_impuestos a',
'                     where cdgo_clnte = :F_CDGO_CLNTE) loop ',
'                    ',
'    v_num_impstos :=  v_num_impstos + 1;  ',
'    as_xlsx.cell( 17, v_num_impstos , c_impsto.id_impsto);',
'    as_xlsx.cell( 18, v_num_impstos , c_impsto.cdgo_impsto);',
'    as_xlsx.cell( 19, v_num_impstos , c_impsto.nmbre_impsto);',
'    ',
'    ',
'    for c_subimpsto in (select a.id_impsto_sbmpsto, a.cdgo_impsto_sbmpsto, a.nmbre_impsto_sbmpsto',
'                          from df_i_impuestos_subimpuesto a',
'                          where id_impsto = c_impsto.id_impsto) loop',
'    ',
'      v_num_impstos :=  v_num_impstos + 1;  ',
'      as_xlsx.cell( 20, v_num_impstos , c_subimpsto.id_impsto_sbmpsto);',
'      as_xlsx.cell( 21, v_num_impstos , c_subimpsto.cdgo_impsto_sbmpsto);',
'      as_xlsx.cell( 22, v_num_impstos , c_subimpsto.nmbre_impsto_sbmpsto);',
'    ',
'    end loop;',
'    ',
'  end loop;*/',
'',
'  -- Consulta ',
'  for c_candidatos in (select  a.cdgo_clnte,',
'                                a.id_fsclzcion_lte,',
'                                a.id_cnddto,',
'                                a.candidato,',
'                                a.cdgo_prgrma,',
'                                a.nmbre_prgrma,',
'                                a.cdgo_sbprgrma,',
'                                a.nmbre_sbprgrma,',
'                                a.idntfccion,',
'                                a.id_impsto,',
'                                a.id_impsto_sbmpsto',
'                          from  v_fi_g_candidatos a',
'                        where a.id_fsclzcion_lte = :P8_ID_FSCLZCION_LTE	',
'                         and a.indcdor_asgndo = ''N''',
'                         and a.actvo = ''S'') loop',
'                         ',
'      -- aqui se debe hacer la consulta y ir llenado las filas',
'      v_num_fla :=  v_num_fla + 1;  ',
'      as_xlsx.cell( 1, v_num_fla , c_candidatos.cdgo_clnte);    ',
'      as_xlsx.cell( 2, v_num_fla , c_candidatos.id_fsclzcion_lte);  ',
'      as_xlsx.cell( 3, v_num_fla , c_candidatos.id_cnddto);    ',
'      as_xlsx.cell( 4, v_num_fla , c_candidatos.candidato);',
'      as_xlsx.cell( 5, v_num_fla , c_candidatos.cdgo_prgrma);',
'      as_xlsx.cell( 6, v_num_fla , c_candidatos.nmbre_prgrma);      ',
'      as_xlsx.cell( 7, v_num_fla , c_candidatos.cdgo_sbprgrma);    ',
'      as_xlsx.cell( 8, v_num_fla , c_candidatos.nmbre_sbprgrma);    ',
'      as_xlsx.cell( 9, v_num_fla , c_candidatos.idntfccion);',
'      as_xlsx.cell( 10, v_num_fla , c_candidatos.id_impsto);',
'      as_xlsx.cell( 11, v_num_fla , c_candidatos.id_impsto_sbmpsto);',
'      as_xlsx.cell( 12, v_num_fla , '''');',
'      as_xlsx.cell( 13, v_num_fla , '''');',
'      as_xlsx.cell( 14, v_num_fla , '''');',
'      as_xlsx.cell( 15, v_num_fla , '''');',
'      as_xlsx.cell( 16, v_num_fla , '''');',
'      as_xlsx.cell( 17, v_num_fla , '''');',
'      as_xlsx.cell( 18, v_num_fla , '''');',
'',
'    end loop;',
'  /*',
'  -- Guardar Excel',
'  as_xlsx.save( v_directorio, v_file_name );',
'  ',
'  v_bfile := bfilename( v_directorio, v_file_name);',
'',
'  --------------------------------------------------------------------',
'  ',
'  dbms_lob.open(v_bfile, dbms_lob.lob_readonly);',
'  dbms_lob.createtemporary(',
'      lob_loc => o_file_blob, ',
'      cache   => true, ',
'      dur     => dbms_lob.session',
'  );',
'  -- Open temporary lob',
'  dbms_lob.open(o_file_blob, dbms_lob.lob_readwrite);',
'',
'  -- Load binary file into temporary LOB',
'  dbms_lob.loadfromfile(',
'      dest_lob => o_file_blob,',
'      src_lob  => v_bfile,',
'      amount   => dbms_lob.getlength(v_bfile)',
'  );',
'',
'  -- Close lob objects',
'  dbms_lob.close(o_file_blob);',
'  dbms_lob.close(v_bfile);',
'',
'  utl_file.fremove(v_directorio,v_file_name);',
'  */',
'  ',
'  o_file_blob := as_xlsx.finish ;',
'  ',
'  htp.init;',
'  owa_util.mime_header(''application/ms-excel'', false);',
'  ',
'  v_nmbre_dcmnto := ''Lote_'' || to_char(sysdate,''yyyymmddhhmiss'');',
'  ',
'  htp.p(''Content-length: '' ||sys.dbms_lob.getlength(o_file_blob) );  ',
'  htp.p(''Content-Disposition: attachment; filename="''|| v_nmbre_dcmnto ||''.xlsx"'');  ',
'  htp.p(''Cache-Control: max-age=0'');',
'  owa_util.http_header_close;  ',
'  wpg_docload.download_file(o_file_blob);  ',
'  apex_application.stop_apex_engine;',
'  ',
'  exception',
'    when others then',
'      raise_application_error(-20000,''Problemas al generar excel, ''||sqlerrm);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'imprimir'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14444987876012903)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Anular Lote'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    update fi_g_fiscalizacion_lote a',
'    set a.indcdor_prcsdo = ''A''',
'    where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_fsclzcion_lte = :P8_ID_FSCLZCION_LTE;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(14444885177012902)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(48031103422376204)
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
'                                                  p_id_usrio         => :F_ID_USRIO,',
'                                                  p_funcionario      => :P8_ID_FNCNRIO,',
'                                                  p_candidato		     => v_cnddto,',
'                                                  p_id_fsclzcion_lte => :P8_ID_FSCLZCION_LTE,',
'                                                  p_dstrbuir         => :P8_DSTRBUIR,',
'                                                  o_cnddto_x_asgnar  => v_cnddto_x_asgnar,',
'                                                  o_cdgo_rspsta      => v_cdgo_rspsta,',
'                                                  o_mnsje_rspsta     => v_mnsje_rspsta);',
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
 p_id=>wwv_flow_api.id(146796884767898521)
,p_process_sequence=>30
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
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14450317147515397)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set_p8_json'
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
'apex_util.Set_session_state(''P8_JSON'', v_json);',
'apex_json.Open_Object();',
'apex_json.write(''P8_JSON'', v_json);',
'apex_json.close_Object();',
'',
'exception',
'  when others then',
'  insert into muerto(c_001, t_001) values(v_json, systimestamp); commit;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
null;
end;
/
