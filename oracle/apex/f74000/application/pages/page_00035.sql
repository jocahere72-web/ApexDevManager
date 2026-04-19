prompt --application/pages/page_00035
begin
wwv_flow_api.create_page(
 p_id=>35
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Aplicaci\00F3n Liquidaci\00F3n de Aforo ')
,p_step_title=>unistr('Aplicaci\00F3n Liquidaci\00F3n de Aforo ')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function iniciar_flujo(id_instancia,id_fljo_trea){    ',
'    apex.server.process("AjaxIrFlujo", {f01: id_instancia, f02: id_fljo_trea}, {',
'        success: function (data) { ',
'            if (data.type === ''OK'') {',
'                console.log(data.test);',
'                window.localStorage.clear();',
'                window.location.href = data.url;',
'            }else{',
'                apex.message.showErrors({',
'                    type: apex.message.TYPE.ERROR,',
'                    location: ["page"],',
'                    message: data.msg,',
'                    unsafe: false',
'                });',
'            }',
'        },',
'        error: function () {',
'            console.log(arguments);',
'        }',
'    });',
'}',
'',
'function jsonLiquidacionAforo(){',
'    ',
'    var region = apex.region("aforo");',
'    ',
'    if(region){',
'        ',
'        var view = apex.region("aforo").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        records = records.filter(function(element){',
'            console.log(Number(model.getValue(element, "TRMNO")));',
'            return Number(model.getValue(element, "TRMNO")) <= 0;',
'        });',
'        ',
'        var json = records.map(function (record) {',
'            return {',
'                        "id_cnddto"                 : model.getValue(record, "ID_CNDDTO"),',
'                        "id_fsclzcion_expdnte_acto" : model.getValue(record, "ID_FSCLZCION_EXPDNTE_ACTO"),',
'                        "nmro_acto"                 : model.getValue(record, "NMRO_ACTO")',
'                   };',
'        });',
'        ',
'        window.localStorage.setItem(''jsonLiquidacionAforo'', JSON.stringify(json));',
'        ',
'        //Declarar la primary key en el interactive grid para que funcione',
'        //Esta instruccion desmarca todos los registros del interactive grid que no se ecuentren en el records',
'        apex.region("aforo").widget().interactiveGrid("setSelectedRecords", records); ',
'        ',
'        ocultarBotonAplicacion();',
'        ',
'    }',
'}',
'',
'function allLiquidacionAforo(e,btn,ig, data){',
'    ',
'    var json = data.map(function (element) {',
'            return {',
'                        "id_cnddto"                 : element.ID_CNDDTO,',
'                        "id_fsclzcion_expdnte_acto" : element.ID_FSCLZCION_EXPDNTE_ACTO,',
'                        "nmro_acto"                 : element.NMRO_ACTO',
'                   };',
'        });',
'    ',
'    window.localStorage.setItem(''jsonLiquidacionAforo'', JSON.stringify(json)); ',
'}',
'',
'function ocultarBotonAplicacion(){',
'    if(JSON.parse(window.localStorage.jsonLiquidacionAforo).length > 0){',
'        apex.item(''aplicar'').show();',
'    }else{',
'        apex.item(''aplicar'').hide();',
'    }	',
'    ',
'}'))
,p_javascript_code_onload=>'apex.item(''aplicar'').hide();'
,p_step_template=>wwv_flow_api.id(36470205860968633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20241004095622'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(66769368595029503)
,p_plug_name=>'Liquidaciones de Aforo'
,p_region_name=>'aforo'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  c.id_cnddto,',
'        a.id_instncia_fljo,',
'        g.dscrpcion,',
'        d.nmro_acto,',
'        e.idntfccion_sjto,',
'        c.candidato,',
'        c.nmbre_impsto,',
'        c.nmbre_impsto_sbmpsto,',
'        c.nmbre_prgrma,',
'        c.nmbre_sbprgrma,',
'        d.fcha_ntfccion,',
'        b.id_fsclzcion_expdnte_acto,',
'        (',
'            select to_char( pk_util_calendario.fnc_cl_fecha_final(p_cdgo_clnte => :F_CDGO_CLNTE, ',
'                                                              p_fecha_inicial  => d.fcha_ntfccion,',
'                                                              p_undad_drcion   => f.undad_drcion,',
'                                                              p_drcion         => f.drcion,',
'                                                              p_dia_tpo        => f.dia_tpo), ''DD/MM/YYYY'') from dual',
'        ) as fcha_aplccion,',
'        (select ',
'            case',
'                when x.termino < 0 then 0 ',
'                else x.termino',
'            end ',
'         from (',
'                select to_date( to_char( pk_util_calendario.fnc_cl_fecha_final(p_cdgo_clnte     => :F_CDGO_CLNTE, ',
'                                                                               p_fecha_inicial  => d.fcha_ntfccion,',
'                                                                               p_undad_drcion   => f.undad_drcion,',
'                                                                               p_drcion         => f.drcion,',
'                                                                               p_dia_tpo        => f.dia_tpo), ''DD/MM/YYYY'' ) ) - TRUNC(sysdate)',
'                as termino from dual',
'              ) x) as trmno',
'from fi_g_fiscalizacion_expdnte     a',
'join fi_g_fsclzcion_expdnte_acto    b  on  a.id_fsclzcion_expdnte  =    b.id_fsclzcion_expdnte',
'join v_fi_g_candidatos              c  on  a.id_cnddto             =    c.id_cnddto',
'join v_si_i_sujetos_impuesto        e  on  c.id_sjto_impsto        =    e.id_sjto_impsto',
'join gn_g_actos                     d  on  b.id_acto               =    d.id_acto',
'join gn_d_actos_tipo_tarea          f  on  b.id_acto_tpo           =    f.id_acto_tpo',
'join gn_d_actos_tipo                g  on  d.id_acto_tpo           =    g.id_acto_tpo',
'where c.cdgo_clnte      = :F_CDGO_CLNTE',
'--and   a.id_fncnrio      = :F_ID_FNCNRIO',
'and   b.id_acto_tpo in (select a.id_acto_tpo',
'                        from gn_d_actos_tipo a',
'                        where a.cdgo_acto_tpo in (''LODA'', ''LODR''))',
'and not d.fcha_ntfccion is null',
'and b.indcdor_aplcdo = ''N''',
'and d.nmro_acto = nvl(:P35_NMRO_ACTO, d.nmro_acto)',
'and b.id_acto_tpo = nvl(:P35_ID_ACTO_TPO, b.id_acto_tpo)',
'and e.idntfccion_sjto = nvl(:P35_IDNTFCCION_SJTO, e.idntfccion_sjto)',
'and c.id_impsto = nvl(:P35_IMPUESTO, c.id_impsto)',
'and c.id_impsto_sbmpsto = nvl(:P35_SB_IMPSTO, c.id_impsto_sbmpsto)',
'and c.id_prgrma = nvl(:P35_PRGRMA, c.id_prgrma)',
'and c.id_sbprgrma = nvl(:P35_SBPRGRMA, c.id_sbprgrma);'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66769549654029505)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button onclick="iniciar_flujo(&ID_INSTNCIA_FLJO.,&ID_FLJO_TREA.)" style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Ir al Flujo<span class="fa fa-external-link-square"></span>',
'</button>'))
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
 p_id=>wwv_flow_api.id(66769697357029506)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero')
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66769790309029507)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(66769826322029508)
,p_name=>'CANDIDATO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANDIDATO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Candidato'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(66769992471029509)
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
 p_id=>wwv_flow_api.id(66770036955029510)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'SubTributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(66770196120029511)
,p_name=>'NMBRE_PRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_PRGRMA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Programa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(66770250589029512)
,p_name=>'NMBRE_SBPRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SBPRGRMA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'SubPrograma'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(66770452423029514)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67342907310367901)
,p_name=>'FCHA_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_NTFCCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha Notificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(67377125643456701)
,p_name=>'TRMNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRMNO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Termino'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67428373156473801)
,p_name=>'ID_CNDDTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNDDTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(67541023002073201)
,p_name=>'FCHA_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_APLCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Fecha Aplicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(68618987928261401)
,p_name=>'ID_FSCLZCION_EXPDNTE_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FSCLZCION_EXPDNTE_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(73251874343059301)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Tipo Liquidaci\00F3n Oficial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(66769416867029504)
,p_internal_uid=>66769416867029504
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'console.log("TEST");',
'console.log(config);',
'config.initialSelection = false;',
'  window.localStorage.removeItem(''jsonLiquidacionAforo'');',
'   return selectAll(config, {',
'       name: ''Seleccionar Todos'',',
'       action: allLiquidacionAforo',
'   }) ;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(66775984128145703)
,p_interactive_grid_id=>wwv_flow_api.id(66769416867029504)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(66776008474145705)
,p_report_id=>wwv_flow_api.id(66775984128145703)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12716399625818)
,p_view_id=>wwv_flow_api.id(66776008474145705)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(67377125643456701)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66776482573145736)
,p_view_id=>wwv_flow_api.id(66776008474145705)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(66769549654029505)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>82
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66776941961145748)
,p_view_id=>wwv_flow_api.id(66776008474145705)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(66769697357029506)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66777491464145750)
,p_view_id=>wwv_flow_api.id(66776008474145705)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(66769790309029507)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66777978936145751)
,p_view_id=>wwv_flow_api.id(66776008474145705)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(66769826322029508)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66778458180145753)
,p_view_id=>wwv_flow_api.id(66776008474145705)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(66769992471029509)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>212
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66778969172145755)
,p_view_id=>wwv_flow_api.id(66776008474145705)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(66770036955029510)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>155
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66779464650145756)
,p_view_id=>wwv_flow_api.id(66776008474145705)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(66770196120029511)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(66779964507145758)
,p_view_id=>wwv_flow_api.id(66776008474145705)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(66770250589029512)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>233
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67348924889368295)
,p_view_id=>wwv_flow_api.id(66776008474145705)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(67342907310367901)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67434352042474079)
,p_view_id=>wwv_flow_api.id(66776008474145705)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(67428373156473801)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67547010168076347)
,p_view_id=>wwv_flow_api.id(66776008474145705)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(67541023002073201)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(68624917846263051)
,p_view_id=>wwv_flow_api.id(66776008474145705)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(68618987928261401)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(73257859871064521)
,p_view_id=>wwv_flow_api.id(66776008474145705)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(73251874343059301)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>210
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(127210820167429321)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36491913657968646)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(153971898445371124)
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
 p_id=>wwv_flow_api.id(153973251210375688)
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
unistr('<i>Funcionalidad que permite aplicar las liquidaciones oficiales generadas en los procesos de fiscalizaci\00F3n.</i>'),
'</p>',
'',
'',
'<p align="justify">',
unistr('<i>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>'),
'</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(66731587004705357)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(153971898445371124)
,p_button_name=>'BTN_APLCAR'
,p_button_static_id=>'aplicar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(66731925593705385)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(153971898445371124)
,p_button_name=>'BTN_FSCLZCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Fiscalizar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP,32::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(66853952448150577)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(127210820167429321)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consulta'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66854338508150593)
,p_name=>'P35_IMPUESTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(127210820167429321)
,p_prompt=>'Impuesto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS_X_MENU_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto || '' ['' || a.cdgo_impsto || '']''display,',
'       a.id_impsto value',
'  from v_sg_g_menu_impuesto     a',
'  join sg_g_usuarios_impuesto   b on a.id_impsto = b.id_impsto',
' where a.cdgo_clnte       = :F_CDGO_CLNTE',
'   and a.id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'   and a.id_mnu           = :F_ID_MNU',
'   and b.id_usrio         = :F_ID_USRIO',
'   and a.actvo            = ''S''',
'   and b.actvo            = ''S''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66854733292150619)
,p_name=>'P35_IDNTFCCION_SJTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(127210820167429321)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66855175000150619)
,p_name=>'P35_SB_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(127210820167429321)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P35_IMPUESTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P35_IMPUESTO'
,p_ajax_items_to_submit=>'P35_IMPUESTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66855583852150619)
,p_name=>'P35_PRGRMA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(127210820167429321)
,p_prompt=>'Programa'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_PROGRAMAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  p.nmbre_prgrma as d,',
'        p.id_prgrma as r',
'from fi_d_programas p;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66855996676150621)
,p_name=>'P35_SBPRGRMA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(127210820167429321)
,p_prompt=>'SubProgramas'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_sbprgrma as  d,',
'       a.id_sbprgrma    as  r',
'from fi_d_subprogramas a',
'where a.id_prgrma = :P35_PRGRMA;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P35_PRGRMA'
,p_ajax_items_to_submit=>'P35_PRGRMA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66914918850404801)
,p_name=>'P35_NMRO_ACTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(127210820167429321)
,p_prompt=>unistr('N\00B0. Liquidaci\00F3n de Aforo')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73251915800059302)
,p_name=>'P35_ID_ACTO_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(127210820167429321)
,p_prompt=>unistr('Tipo Liquidaci\00F3n Oficial')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion as d,',
'       a.id_acto_tpo as r',
'from gn_d_actos_tipo a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.cdgo_acto_tpo in (''LODA'', ''LODR'')',
'order by dscrpcion;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(67343155833367903)
,p_name=>'Al seleccionar '
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(66769368595029503)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67343201890367904)
,p_event_id=>wwv_flow_api.id(67343155833367903)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'jsonLiquidacionAforo();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(67428435930473802)
,p_name=>'Aplicar'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(66731587004705357)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67428554260473803)
,p_event_id=>wwv_flow_api.id(67428435930473802)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function aplicarLiquidacionAforo(){',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        if(JSON.parse(window.localStorage.jsonLiquidacionAforo).length > 0){',
'            await apex.server.process("AplicarLiquidacionAforo", {',
'                f01: window.localStorage.jsonLiquidacionAforo',
'            },{',
'                success: function(data){',
'                    if(data.o_cdgo_rspsta > 0){',
'                        apex.message.clearErrors();',
'                        apex.message.showErrors([',
'                            {',
'                                type:       "error",',
'                                location:   "page",',
'                                message:    data.o_mnsje_rspsta,',
'                                unsafe:     false',
'                            }',
'                        ]);',
'                    }else{',
unistr('                        apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                        apex.submit();',
'                    }',
'                }',
'            })',
'        }else{',
'            apex.message.clearErrors();',
'            apex.message.showErrors([',
'                {',
'                    type:       "error",',
'                    location:   "page",',
'                    message:    "Seleccione las Liquidaciones de Aforo que se van aplicar",',
'                    unsafe:     false',
'                }',
'            ]);',
'            ',
'        }',
'        ',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'}',
'',
'aplicarLiquidacionAforo();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(66803414977748801)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AjaxIrFlujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_id_instncia_fljo number := apex_application.g_f01(1);',
'   v_id_fljo_trea number;-- := apex_application.g_f02(1);',
'   v_url varchar2(4000);',
'   v_id_fljo_trea_orgen number;',
'   ',
'   begin',
'   ',
'       begin',
'           select id_fljo_trea_orgen',
'           into v_id_fljo_trea_orgen',
'           from wf_g_instancias_transicion',
'           where id_instncia_fljo = v_id_instncia_fljo',
'           and id_estdo_trnscion in (1,2);',
'           --insert into muerto(v_001) values (v_id_fljo_trea_orgen); commit;',
'       exception',
'           when no_data_found then',
'               begin',
'                   select distinct first_value(id_fljo_trea_orgen) over (order by id_instncia_trnscion desc)',
'                   into v_id_fljo_trea_orgen',
'                   from wf_g_instancias_transicion',
'                   where id_instncia_fljo = v_id_instncia_fljo;',
'                   ',
'              exception',
'                  when others then',
'                      v_id_fljo_trea_orgen := null;',
'              end;',
'           when others then',
'               v_id_fljo_trea_orgen := null;',
'       end;',
'       ',
'       apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo );',
'       apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea_orgen );            	',
'       v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => v_id_instncia_fljo,',
'                                                     p_id_fljo_trea     => v_id_fljo_trea_orgen,',
'                                                     p_clear_session    => ''S'');',
'       apex_json.open_object;',
'       apex_json.write(''type'', ''OK'');',
'       apex_json.write(''msg'', ''Url generada exitosamente'');',
'       apex_json.write(''url'', v_url);',
'       apex_json.write(''test'', 1);',
'       apex_json.close_all();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(67428673246473804)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AplicarLiquidacionAforo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number        :=    0;',
'    v_mnsje_rspsta   varchar(500)  :=    ''OK'';',
'    v_cnddtos        clob;',
'    v_exception      exception;',
'    v_vlor_sldo_fvor number;',
'begin',
'    for i in 1..apex_application.g_f01.count loop',
'       v_cnddtos := v_cnddtos || apex_application.g_f01(i); ',
'    end loop;',
'    ',
'    if v_cnddtos is null then',
'        v_cdgo_rspsta := 1;',
'        v_mnsje_rspsta := ''Seleccione las liquidaciones oficiales que va aplicar'';',
'        --raise v_exception;',
'    end if;',
'    ',
'    pkg_fi_fiscalizacion.prc_rg_aplccion_lqudcion_afro(p_cdgo_clnte    => :F_CDGO_CLNTE,',
'                                                       p_json_cnddto   => v_cnddtos,',
'                                                       o_vlor_sldo_fvor => v_vlor_sldo_fvor,',
'                                                       o_cdgo_rspsta   => v_cdgo_rspsta,',
'                                                       o_mnsje_rspsta  => v_mnsje_rspsta);',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', 0);',
'    apex_json.write(''o_mnsje_rspsta'', ''Fino'');',
'    apex_json.write(''o_vlor_sldo_fvor'', v_vlor_sldo_fvor);',
'    apex_json.close_object;',
'exception',
'    when others then',
'        rollback;',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.write(''o_vlor_sldo_fvor'', 0);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
