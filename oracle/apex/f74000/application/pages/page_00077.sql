prompt --application/pages/page_00077
begin
wwv_flow_api.create_page(
 p_id=>77
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Generar Sanci\00F3n Liquidados')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Generar Sanci\00F3n Liquidados')
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var sel = [];',
'',
'function apenascargue(){',
'    ',
'    var cncptos_rnta = [];',
'    ',
'   ',
'    ',
'    if($v(''P77_CONCEPTOS_RENTA'')){',
'        try{',
'            // convierte en tipo json',
'            cncptos_rnta = JSON.parse($v(''P77_CONCEPTOS_RENTA''));                    ',
'        }catch(e){',
'            cncptos_rnta = [];',
'        }',
'    }',
'    ',
unistr('    //si el json est\00E1 lleno '),
'    if (cncptos_rnta.length > 0){  ',
'        // construye la vista',
'        var view = apex.region(''conceptos'').widget().interactiveGrid("getCurrentView"); ',
'        // recorremos el json trayendo el valor',
'        cncptos_rnta = cncptos_rnta.map(m => Number(m.ID_CNCPTO));',
'        // construyo el modelo a partir de la vista',
'        var model = view.model;        ',
'        // trae todos los registros del modelo',
'        var records = model._data;',
'        console.log(cncptos_rnta, records);',
'        // recorre los registros y retorna los que coincidan con el valor del json',
'        records = records.filter((f)=> {',
'            return cncptos_rnta.indexOf(Number(model.getValue(f, ''ID_CNCPTO''))) > -1',
'        });',
'       ',
'        //setea los valores de los registros',
'        view.setSelectedRecords(records);  ',
'    }',
'}',
'',
'',
'function seleccion_conceptos_obligatorios(){',
'    var cncptos_oblgtrios = [];',
'    // trae el valor del json',
'    if($v(''P77_CNCPTOS_OBLGTRIOS'')){',
'        try{',
'            // convierte en tipo json',
'            cncptos_oblgtrios = JSON.parse($v(''P77_CNCPTOS_OBLGTRIOS''));                    ',
'        }catch(e){',
'            cncptos_oblgtrios = [];',
'        }        ',
'    } ',
unistr('    //si el json est\00E1 lleno '),
'    if (cncptos_oblgtrios.length > 0){ ',
'        var view = apex.region(''conceptos'').widget().interactiveGrid("getCurrentView"); ',
'        // recorremos el json trayendo el valor',
'        cncptos_oblgtrios = cncptos_oblgtrios.map(m => Number(m.ID_CNCPTO));',
'        // construyo el modelo a partir de la vista',
'        var model = view.model;        ',
'        // trae todos los registros del modelo',
'        var records = model._data;        ',
'        // recorre los registros y retorna los que coincidan con el valor del json',
'        records = records.filter((f)=> {',
'            return cncptos_oblgtrios.indexOf(Number(model.getValue(f, ''ID_CNCPTO''))) > -1',
'            console.log(''conceptos: '' + cncptos_oblgtrios, records);',
'        });',
'       ',
'        //setea los valores de los registros',
'        view.setSelectedRecords(records);  ',
'        ',
'    }     ',
'}',
'',
'function validar_sel() {',
'    ',
'    var region = apex.region("conceptos");',
'    ',
'    if (region) {',
'        ',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records_ = view.view$.grid("getSelectedRecords");//todos los seleccionados',
'        var records = model._data; //todos los datos de la grilla',
'        ',
'        //REALIZAMOS UN FILTRO DE TODOS LOS DATOS SELECCIONADOS DEL INTERACTIVE GRID QUE NO ESTEN PROCESADOS',
'        records = records.filter(function (record) {',
'            return model.getValue(record, "INDCDOR_CNCPTO_OBLGTRIO").v === ''S''',
'        });',
'       ',
'        records_.filter(function (record) {',
'            return model.getValue(record, "INDCDOR_CNCPTO_OBLGTRIO").v !== ''S''',
'        }).forEach(function (f){',
'            records.push(f);',
'        });',
'       ',
'       ',
'        //SELECCIONAMOS LOS ITEM NO PROCESADOS EN EL INTERACTIVE GRID',
'        //console.log(records);',
'        region.widget().interactiveGrid("setSelectedRecords", records);',
'        return;',
'    }',
'}',
'',
'',
'',
'function conceptos_renta(){',
'    var cncptos_rnta = [];',
'    ',
'    if($v(''P77_CONCEPTOS_RENTA'')){',
'        try{',
'            // convierte en tipo json',
'            cncptos_rnta = JSON.parse($v(''P77_CONCEPTOS_RENTA''));                    ',
'        }catch(e){',
'            cncptos_rnta = [];',
'        }',
'    }',
'    ',
unistr('    //si el json est\00E1 lleno '),
'    if (cncptos_rnta.length > 0){  ',
'        // construye la vista',
'        var view = apex.region(''conceptos'').widget().interactiveGrid("getCurrentView"); ',
'        // recorremos el json trayendo el valor',
'        cncptos_rnta = cncptos_rnta.map(m => Number(m.ID_CNCPTO));',
'        // construyo el modelo a partir de la vista',
'        var model = view.model;        ',
'        // trae todos los registros del modelo',
'        var records = model._data;',
'        console.log(cncptos_rnta, records);',
'        // recorre los registros y retorna los que coincidan con el valor del json',
'        records = records.filter((f)=> {',
'            return cncptos_rnta.indexOf(Number(model.getValue(f, ''ID_CNCPTO''))) > -1',
'        });',
'       ',
'        //setea los valores de los registros',
'        view.setSelectedRecords(records);  ',
'    }',
'}',
'',
'/*   Codigo Michael Rodriguez   */',
'const peticionServerProcess = (proc, json) => {',
'    return apex.server.process(proc, json);',
'}',
'',
'const setearItem = async () => {',
'    const { data } = await peticionServerProcess(''Setear item'', { x01: 1000});',
'    apex.region("Container").refresh();',
'    console.log(data);',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apenascargue();',
'//seleccion_conceptos_obligatorios();',
'validar_sel();',
'',
'',
'ocultarAyudaD();',
'',
'if($v(''P77_CONCEPTOS_RENTA'')){',
'    conceptos_renta();',
'}',
''))
,p_step_template=>wwv_flow_api.id(36468753189968632)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'650'
,p_dialog_width=>'85%'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20230503095337'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(84527540814429205)
,p_plug_name=>'Container'
,p_region_name=>'Container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23387428703739604)
,p_plug_name=>unistr('Informaci\00F3 Rentas')
,p_parent_plug_id=>wwv_flow_api.id(84527540814429205)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(84538810069686004)
,p_plug_name=>'Conceptos'
,p_region_name=>'conceptos'
,p_parent_plug_id=>wwv_flow_api.id(84527540814429205)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct',
'         a.id_cncpto',
'        ,a.id_impsto_acto_cncpto ',
'        , a.cdgo_cncpto',
'        , a.cdgo_cncpto || '' - '' || a.dscrpcion_cncpto  dscrpcion_cncpto',
'        , a.vlor_lqddo',
'        , nvl(a.vlor_intres_mra,0) vlor_intres_mra',
'        , nvl(a.vlor_ttal,0) vlor_ttal',
'        , a.fcha_vncmnto',
'        , a.dias_mra',
'        , a.txto_trfa',
'        , a.bse_grvble',
'        , nvl(a.vlor_pgdo,0) vlor_pgdo',
'        , a.indcdor_cncpto_oblgtrio ',
'        , (select b.id_cnddto_vgncia from fi_g_candidatos_vigencia b where b.id_cnddto = :P77_ID_CNDDTO) as id_cnddto_vgncia',
'        ,(select b.vgncia from fi_g_candidatos_vigencia b where b.id_cnddto = :P77_ID_CNDDTO) as vgncia',
'        ,(select b.id_prdo from fi_g_candidatos_vigencia b where b.id_cnddto = :P77_ID_CNDDTO) as id_prdo  ',
'        ,(select c.prdo from fi_g_candidatos_vigencia b ',
'                              join df_i_periodos      c   on  b.id_prdo   =   c.id_prdo',
'                              where b.id_cnddto = :P77_ID_CNDDTO) as prdo',
'        ,(select :P77_ID_IMPSTO from dual) as id_impsto',
'        ,(select :P77_ID_IMPSTO_SBMPSTO from dual) as id_impsto_sbmpsto',
'        ,(select :P77_ID_SJTO_IMPSTO from dual) as id_sjto_impsto',
'        ,a.orden',
'     from table',
'     (',
'        pkg_gi_rentas.fnc_cl_concepto_preliquidacion',
'        (',
'            p_cdgo_clnte 			          => :F_CDGO_CLNTE',
'            , p_id_impsto					      => :P77_ID_IMPSTO',
'            , p_id_impsto_sbmpsto			  => :P77_ID_IMPSTO_SBMPSTO',
'            , p_id_impsto_acto				  => :P77_ID_IMPSTO_ACTO',
'            , p_id_sjto_impsto                => :P77_ID_SJTO_IMPSTO',
'            , p_json_cncptos				    => null',
'            , p_vlor_bse					      => to_number(nvl(:P77_VLOR_BSE_GRVBLE, 0), ''999G999G999G999G999G999G990D99'')',
'            , p_indcdor_usa_extrnjro		=>  ''N''',
'            , p_indcdor_usa_mxto			  => ''N''',
'            , p_fcha_expdcion				    => to_date(:P77_FCHA_EXPDCION_2)',
'            , p_fcha_vncmnto				    => to_date(:P77_FCHA_VNCMNTO)',
'            , p_indcdor_lqdccion_adcnal => ''N''',
'            , p_id_rnta_antrior		    	=> ''N''',
'            , p_indcdor_cntrto_gslna    =>            ''N''',
'            -- Nuevo HMZ - 30/12/2021',
'            --, p_vlor_cntrto_ese         => to_number(null, ''999G999G999G999G999G999G990D99'')',
'        )',
'     ) a',
' where abs(a.vlor_lqddo) > 0'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23388327784739613)
,p_name=>'CDGO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(23388421184739614)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'<div class="wrap-cell">&DSCRPCION_CNCPTO.</div>'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23388588377739615)
,p_name=>'VLOR_LQDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_LQDDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor<br> Liquidado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_format_mask=>'999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(23388679925739616)
,p_name=>'VLOR_INTRES_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES_MRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Interes de<br> Mora'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_format_mask=>'999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(23388729528739617)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor <br> Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_format_mask=>'999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(23388895317739618)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Fecha de <br>Vencimiento'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23388901250739619)
,p_name=>'DIAS_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIAS_MRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('D\00EDas <br> Mora')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
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
 p_id=>wwv_flow_api.id(23389015406739620)
,p_name=>'TXTO_TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_TRFA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Tarifa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23389177130739621)
,p_name=>'BSE_GRVBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BSE_GRVBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Base Gravable  / <br> Cantidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(23389237025739622)
,p_name=>'VLOR_PGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_PGDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor  <br> Pagado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
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
 p_id=>wwv_flow_api.id(23389335342739623)
,p_name=>'INDCDOR_CNCPTO_OBLGTRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_CNCPTO_OBLGTRIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('\00BFConcepto <br> Obligatorio?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>unistr('STATIC:S\00ED;S,No;N')
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23426319277654523)
,p_name=>'Row Selector'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23478632741055201)
,p_name=>'ID_IMPSTO_ACTO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO_CNCPTO'
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
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23478755513055202)
,p_name=>'ID_CNDDTO_VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNDDTO_VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(23478899936055203)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(23478947861055204)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(23479173338055206)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23479206662055207)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23479366233055208)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23479560698055210)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
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
 p_id=>wwv_flow_api.id(23479692028055211)
,p_name=>'ORDEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORDEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
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
 p_id=>wwv_flow_api.id(84539212087686008)
,p_name=>'ID_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(84538943842686005)
,p_internal_uid=>84538943842686005
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
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
 p_id=>wwv_flow_api.id(84544377877688596)
,p_interactive_grid_id=>wwv_flow_api.id(84538943842686005)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(84544527488688598)
,p_report_id=>wwv_flow_api.id(84544377877688596)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23406409080641730)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(23388327784739613)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23406861522641750)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(23388421184739614)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>348.973
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23407363163641759)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(23388588377739615)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>126.81200000000001
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23407832821641762)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(23388679925739616)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>131.812
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23408360879641764)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(23388729528739617)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>154.30900000000003
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23408842702641765)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(23388895317739618)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97.809
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23409301397641767)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(23388901250739619)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>65.809
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23409891086641769)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(23389015406739620)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>69.809
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23410389580641771)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(23389177130739621)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>124.805
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23410826042641772)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(23389237025739622)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>108.805
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23411333100641774)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(23389335342739623)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92.543
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23484618078056249)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(23478632741055201)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23490108199081573)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(23478755513055202)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23494053470546649)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(23478899936055203)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23494571406546650)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(23478947861055204)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23496914901594450)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(23479173338055206)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23498538345608454)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(23479206662055207)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23499116447608456)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(23479366233055208)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23506346342736000)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_display_seq=>25
,p_column_id=>wwv_flow_api.id(23479560698055210)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23509016031872566)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_display_seq=>26
,p_column_id=>wwv_flow_api.id(23479692028055211)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(84545966359688610)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(84539212087686008)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(116644000012)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(23388588377739615)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(130475000084)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(23388729528739617)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(187990003497)
,p_view_id=>wwv_flow_api.id(84544527488688598)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(23388679925739616)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23342305049567407)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(84527540814429205)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23342787939567414)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(84527540814429205)
,p_button_name=>'BTN_RGSTRO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(36555595557968673)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P77_ID_IMPSTO_ACTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(23360699457567529)
,p_branch_name=>'Regresar'
,p_branch_action=>'f?p=&APP_ID.:&P77_PGNA.:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'modal'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23343166214567427)
,p_name=>'P77_ID_IMPSTO_ACTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(84527540814429205)
,p_prompt=>'Acto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.nmbre_impsto_acto as d',
'        , a.id_impsto_acto as r',
'     from v_df_i_impuestos_acto         a',
'    where  a.id_impsto = :P77_ID_IMPSTO and a.id_impsto_sbmpsto = :P77_ID_IMPSTO_SBMPSTO',
'-- order by a.nmbre_impsto_acto',
' ;'))
,p_lov_display_null=>'YES'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23351504089567515)
,p_name=>'P77_ID_FSCLZCION_EXPDNTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(84538810069686004)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23351935596567515)
,p_name=>'P77_CDGO_ACTO_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(84538810069686004)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23352399562567515)
,p_name=>'P77_ID_CNDDTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(84538810069686004)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23352728644567515)
,p_name=>'P77_PGNA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(84538810069686004)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23353161064567516)
,p_name=>'P77_ACTO_TPO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(84538810069686004)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23353959033567520)
,p_name=>'P77_ID_SJTO_IMPSTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(84538810069686004)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23354366443567521)
,p_name=>'P77_ID_TPO_BSE_SNCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(84538810069686004)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23373058685838802)
,p_name=>'P77_ID_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(84538810069686004)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23373101494838803)
,p_name=>'P77_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(84538810069686004)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23373250085838804)
,p_name=>'P77_VLOR_BSE_GRVBLE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(84527540814429205)
,p_prompt=>'Base Gravable'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event,''numeroEntero'');" onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:0});"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Consiste en la base o monto para hallar el valor liquidado de la renta correspondiente, se tienen en cuenta cantidades, valores de acto y/o n\00FAmero de eventos.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23373382129838805)
,p_name=>'P77_OBJTO_CNTRTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(84527540814429205)
,p_prompt=>'Objeto del Contrato'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>50
,p_cMaxlength=>300
,p_cHeight=>2
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23387131050739601)
,p_name=>'P77_FCHA_EXPDCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(84527540814429205)
,p_prompt=>unistr('Fecha De Expedici\00F3n')
,p_format_mask=>'DD/MM/YYYY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  to_char(a.fcha_expdcion, ''DD/MM/YYYY'')',
'from fi_g_candidatos_vigencia a ',
'where a.id_cnddto = :P77_ID_CNDDTO;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Fecha de expedici\00F3n del contrato.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23387569473739605)
,p_name=>'P77_USA_INDCDOR_EXTRNJRO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(23387428703739604)
,p_prompt=>'Usa Indcdor Extrnjro'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(36555007171968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23387906429739609)
,p_name=>'P77_INDCDOR_RQRE_AUTRZCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(23387428703739604)
,p_prompt=>'New'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(36555007171968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23388069177739610)
,p_name=>'P77_INDCDOR_RQRE_ADJNTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(23387428703739604)
,p_prompt=>'New'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(36555007171968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23388175348739611)
,p_name=>'P77_USA_INDCDOR_MXTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(23387428703739604)
,p_prompt=>'New'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(36555007171968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23388211992739612)
,p_name=>'P77_FCHA_VNCMNTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(84527540814429205)
,p_prompt=>'Fecha de Pago Proyectada'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Fecha de vencimiento para realizar el pago y proyectar los intereses si aplica.'
,p_attribute_02=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23424103340654501)
,p_name=>'P77_CONCEPTOS_RENTA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(84538810069686004)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23424433299654504)
,p_name=>'P77_CNCPTOS_SLCCNDOS'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(84538810069686004)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23456348797294901)
,p_name=>'P77_FCHA_EXPDCION_2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(84527540814429205)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23466927070163701)
,p_name=>'P77_NMRO_CNTRTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(84527540814429205)
,p_prompt=>unistr('N\00FAmero Contrato')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('N\00FAmero del contrato.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23467066716163702)
,p_name=>'P77_CNCPTOS_OBLGTRIOS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(84538810069686004)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24008178613593503)
,p_name=>'P77_CNCPTOS'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(84538810069686004)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24027983676338401)
,p_name=>'P77_ID_RNTA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(84538810069686004)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24028023938338402)
,p_name=>'P77_ID_DCMNTO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(84538810069686004)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24028182995338403)
,p_name=>'P77_NMRO_DCMNTO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(84538810069686004)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24028214883338404)
,p_name=>'P77_RSPSTA'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(84538810069686004)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25390259368687902)
,p_name=>'P77_ENTIDAD'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(84527540814429205)
,p_prompt=>'Entidad'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.nmbre_rzon_scial',
'from fi_g_candidatos_vigencia a ',
'left join gi_g_rentas b on a.nmro_rnta = b.nmro_rnta',
'left join df_s_entidades c on b.id_entdad = c.id_entdad',
'where a.id_cnddto = :P77_ID_CNDDTO;'))
,p_source_type=>'QUERY'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.nmbre_rzon_scial d,',
'       c.id_entdad r',
'from df_s_entidades c'))
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(23389641476739626)
,p_computation_sequence=>10
,p_computation_item=>'P77_FCHA_VNCMNTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' ',
'    select  pkg_gi_rentas.fnc_cl_fecha_documento_pago ( p_cdgo_clnte				=>    :F_CDGO_CLNTE',
'                                                        , p_id_impsto				=>    :P77_ID_IMPSTO',
'                                                        , p_id_impsto_sbmpsto		=>    :P77_ID_IMPSTO_SBMPSTO',
'                                                        , p_id_impsto_acto			=>    :P77_ID_IMPSTO_ACTO',
'                                                        , p_indcdor_usa_extrnjro	=>    ''N''',
'                                                        , p_fcha_expdcion			=>    :P77_FCHA_EXPDCION_2) a ',
'   from dual;',
''))
,p_compute_when=>'P77_FCHA_VNCMNTO'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(24018822729958301)
,p_computation_sequence=>20
,p_computation_item=>'P77_FCHA_VNCMNTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select  sysdate ',
'   from dual;',
''))
,p_compute_when=>':P77_FCHA_VNCMNTO IS NOT NULL AND :P77_FCHA_VNCMNTO > LAST_DAY(SYSDATE)'
,p_compute_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(23389711062739627)
,p_computation_sequence=>30
,p_computation_item=>'P77_VLOR_BSE_GRVBLE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'1'
,p_compute_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_trfa_esqma',
'     from v_gi_d_tarifas_esquema            a',
'    where a.cdgo_clnte                      = :F_CDGO_CLNTE',
'      and a.id_impsto                       = :P77_ID_IMPSTO',
'      and a.id_impsto_sbmpsto               = :P77_ID_IMPSTO_SBMPSTO',
'      and a.id_impsto_acto                  = :P77_ID_IMPSTO_ACTO',
'      and a.vgncia                          = extract(year from to_date(:P77_FCHA_EXPDCION))',
unistr('      -- Se valida que la tarifa este entre la fecha de expedici\00F3n'),
'      and (trunc(to_date(:P77_FCHA_EXPDCION))  between trunc(fcha_incial) ',
'                                                and trunc(fcha_fnal))',
unistr('      -- Se valida que la fecha de expedici\00F3n este entre las fecha del indicador economico de la tarifa si usa indicador'),
'      and (trunc(to_date(:P77_FCHA_EXPDCION))  between trunc(fcha_dsde_cdgo_indcdor_tpo) ',
'                                                and trunc(fcha_hsta_cdgo_indcdor_tpo)',
'        or cdgo_indcdor_tpo is null)',
unistr('      -- Se valida que la fecha de expedici\00F3n este entre las fecha del indicador economico de la base si usa indicador para la base'),
'      and (trunc(to_date(:P77_FCHA_EXPDCION))  between trunc(fcha_dsde_cdgo_indcdor_tpo_bse) ',
'                                                and trunc(fcha_hsta_cdgo_indcdor_tpo_bse)',
'        or cdgo_indcdor_tpo_bse is null)',
unistr('      -- Se valida que la fecha de expedici\00F3n este entre las fecha del indicador economico de la liquidaci\00F3n si usa indicador para la liquidaci\00F3n'),
'      and (trunc(to_date(:P77_FCHA_EXPDCION))  between trunc(fcha_dsde_cdgo_indcdor_tpo_lqd) ',
'                                                and trunc(fcha_hsta_cdgo_indcdor_tpo_lqd) ',
'        or cdgo_indcdor_tpo_lqdccion is null)',
'      and a.indcdor_usa_bse                     = ''S'''))
,p_compute_when_type=>'NOT_EXISTS'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(23467334550163705)
,p_computation_sequence=>40
,p_computation_item=>'P77_CNCPTOS_OBLGTRIOS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select json_arrayagg(json_object( key ''ID_CNCPTO'' is a.id_cncpto ) )cncptos',
'     from table (pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte 			        => :F_CDGO_CLNTE',
'                                                            , p_id_impsto					=> :P77_ID_IMPSTO',
'                                                            , p_id_impsto_sbmpsto			=> :P77_ID_IMPSTO_SBMPSTO',
'                                                            , p_id_impsto_acto				=> :P77_ID_IMPSTO_ACTO',
'                                                            , p_id_sjto_impsto         	    => :P77_ID_SJTO_IMPSTO',
'                                                            , p_json_cncptos			    => null',
'                                                            , p_vlor_bse					=> to_number(nvl(:P77_VLOR_BSE_GRVBLE,0), ''999G999G999G999G999G999G990D99'')',
'                                                            , p_indcdor_usa_extrnjro		=> ''N''',
'                                                            , p_indcdor_usa_mxto			=> ''N''',
'                                                            , p_fcha_expdcion				=> to_date(:P77_FCHA_EXPDCION)',
'                                                            , p_fcha_vncmnto				=> to_date(:P77_FCHA_VNCMNTO)',
'                                                            , p_indcdor_lqdccion_adcnal  	=> ''N'' ',
'                                                            --, p_id_rnta_antrior		    	=> :P141_ID_RNTA_ANTRIOR',
'                                                            , p_indcdor_cntrto_gslna   	=> ''N''',
'                                                             )',
'                ) a',
'     where abs(vlor_lqddo)               > 0',
'       and a.indcdor_cncpto_oblgtrio    = ''S'''))
,p_compute_when=>'P77_ID_TPO_BSE_SNCION'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(24008278955593504)
,p_computation_sequence=>50
,p_computation_item=>'P77_CNCPTOS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select json_arrayagg(  json_object( key ''ID_IMPSTO_ACTO_CNCPTO'' is l.id_impsto_acto_cncpto',
'                                   , key ''ID_IMPSTO_ACTO''        is l.id_impsto_acto',
'                                   , key ''GNRA_INTRES_MRA''       is l.gnra_intres_mra',
'                                   , key ''FCHA_VNCMNTO''          is l.fcha_vncmnto  ',
'                                   , key ''DIAS_MRA''              is l.dias_mra  ',
'                                   , key ''BSE_CNCPTO''            is l.bse_grvble',
'                                   , key ''VLOR_INDCDOR''          is l.vlor_cdgo_indcdor_tpo  ',
'                                   , key ''VLOR_TRFA''             is l.vlor_trfa  ',
'                                   , key ''VLOR''                  is l.vlor_trfa_clcldo  ',
'                                   , key ''TXTO_TRFA''             is l.txto_trfa',
'                                   , key ''VLOR_LQDDO''            is l.vlor_lqddo',
'                                   , key ''VLOR_PGDO''             is l.vlor_pgdo',
'                                   , key ''VLOR_INTRES_MRA''       is l.vlor_intres_mra',
'                                   , key ''VLOR_TTAL''             is l.vlor_ttal   )    )cncptos',
' from    (  select  a.id_impsto_acto_cncpto ',
'            , a.id_impsto_acto',
'            , a.gnra_intres_mra',
'            , to_char(a.fcha_vncmnto, ''dd/mm/yyyy'')   fcha_vncmnto',
'            , nvl(a.dias_mra,''0'') dias_mra',
'            , a.bse_grvble ',
'            , nvl(a.vlor_cdgo_indcdor_tpo,''0'') vlor_cdgo_indcdor_tpo',
'            , nvl(a.vlor_trfa,''0'')  vlor_trfa',
'            , nvl(a.vlor_trfa_clcldo,''0'') vlor_trfa_clcldo',
'            , a.txto_trfa',
'            , a.vlor_lqddo',
'            , a.vlor_pgdo',
'            , a.vlor_intres_mra',
'            , a.vlor_ttal ',
'             from table ',
'                  (',
'                      pkg_gi_rentas.fnc_cl_concepto_preliquidacion',
'                      (',
'                           p_cdgo_clnte 			    => :F_CDGO_CLNTE',
'                        , p_id_impsto				    => :P77_ID_IMPSTO',
'                        , p_id_impsto_sbmpsto			=> :P77_ID_IMPSTO_SBMPSTO',
'                        , p_id_impsto_acto				=> :P77_ID_IMPSTO_ACTO',
'                        , p_id_sjto_impsto          	=> :P77_ID_SJTO_IMPSTO',
'                        , p_json_cncptos				=> :P77_CNCPTOS_SLCCNDOS',
'                        , p_vlor_bse					=> to_number(:P77_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                        , p_indcdor_usa_extrnjro		=>  ''N''',
'                        , p_indcdor_usa_mxto			=>  ''N''',
'                        , p_fcha_expdcion				=> to_date(:P77_FCHA_EXPDCION)',
'                        , p_fcha_vncmnto				=> to_date(:P77_FCHA_VNCMNTO)',
'                        , p_indcdor_lqdccion_adcnal 	=>	''N''',
'                       -- , p_id_rnta_antrior		    	=> :P141_ID_RNTA_ANTRIOR',
'                        --  , p_indcdor_cntrto_gslna  => :P139_INDCDOR_CNTRTO_GSLNA)',
'                        , p_indcdor_cntrto_gslna    	=>	''N''',
'                        -- Nuevo HMZ - 30/12/2021',
'                        , p_vlor_cntrto_ese         =>  null',
'                      )',
'                ) a',
'     where abs(vlor_lqddo) > 0',
'     group by    a.id_impsto_acto_cncpto   , a.id_impsto_acto  , a.gnra_intres_mra  , to_char(a.fcha_vncmnto, ''dd/mm/yyyy'')   , nvl(a.dias_mra,''0'')  , a.bse_grvble   , nvl(a.vlor_cdgo_indcdor_tpo,''0'')  ',
'            , nvl(a.vlor_trfa,''0'')    , nvl(a.vlor_trfa_clcldo,''0'')   , a.txto_trfa   , a.vlor_lqddo , a.vlor_pgdo  , a.vlor_intres_mra   , a.vlor_ttal ',
'     ) l'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(23456456294294902)
,p_validation_name=>'Validar que la fecha de vencimiento este en el rango de tasas mora'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' v_fcha_vlda          varchar2(1);',
' v_gnra_intres_mra    varchar2(1);',
' v_fcha_vncmnto       date;',
'begin    ',
'   ',
'    begin         ',
'         select distinct a.gnra_intres_mra, min(a.fcha_vncmnto)',
'           into v_gnra_intres_mra, v_fcha_vncmnto ',
'           from table (pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte 			    => :F_CDGO_CLNTE',
'                                                                  , p_id_impsto					=> :P77_ID_IMPSTO',
'                                                                  , p_id_impsto_sbmpsto			=> :P77_ID_IMPSTO_SBMPSTO',
'                                                                  , p_id_impsto_acto			=> :P77_ID_IMPSTO_ACTO',
'                                                                  , p_id_sjto_impsto            => :P75_ID_SJTO_IMPSTO',
'                                                                  , p_json_cncptos				=> null',
'                                                                  , p_vlor_bse					=> to_number(:P77_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                                                  , p_indcdor_usa_extrnjro		=>  ''N''',
'                                                                  , p_indcdor_usa_mxto			=> ''N''',
'                                                                  , p_fcha_expdcion				=> to_date(:P77_FCHA_EXPDCION)',
'                                                                  , p_fcha_vncmnto				=> to_date(:P77_FCHA_VNCMNTO)',
'                                                                  , p_indcdor_lqdccion_adcnal   => ''N'' ',
'                                                                 -- , p_id_rnta_antrior		    => :P141_ID_RNTA_ANTRIOR',
'                                                              --  , p_indcdor_cntrto_gslna      => :P139_INDCDOR_CNTRTO_GSLNA)',
'                                                                  , p_indcdor_cntrto_gslna    	=> ''N'')',
'                ) a',
'             where abs(vlor_lqddo) > 0',
'               and a.gnra_intres_mra = ''S''',
'             group by  a.gnra_intres_mra;   ',
'       ',
'       if v_gnra_intres_mra = ''S'' then ',
'       ',
'           if v_fcha_vncmnto < :P77_FCHA_VNCMNTO   then',
'                 v_fcha_vlda := pkg_gn_generalidades.fnc_vl_fcha_vncmnto_tsas_mra (:F_CDGO_CLNTE, :P77_ID_IMPSTO, to_date(:P77_FCHA_VNCMNTO));',
'',
'                if v_fcha_vlda = ''S'' then',
'                   return true;',
'                else',
'                   return false;  ',
'                end if;',
'            else',
'                return true;',
'            end if;',
'        else',
'            return true;',
'        end if;',
'        ',
'    exception',
'        when no_data_found then',
'            return true; ',
'        when others then',
'            return false;',
'    end;',
'   ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('La fecha de pago seleccionada se encuentra fuera del rango de tasa mora parametrizado. Por favor, verifique y seleccione una fecha v\00E1lida que posea tasa mora.')
,p_validation_condition=>'P77_FCHA_VNCMNTO'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(23456516816294903)
,p_validation_name=>unistr('Validar que la proyecci\00F3n sea valida')
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct',
'          a.cdgo_cncpto || '' - '' || a.dscrpcion_cncpto  dscrpcion_cncpto',
'        , a.vlor_lqddo',
'        , a.vlor_intres_mra',
'        , a.vlor_ttal vlor_ttal',
'        , a.fcha_vncmnto',
'        , a.dias_mra',
'        , a.txto_trfa',
'        , a.bse_grvble',
'        , a.vlor_pgdo',
'     from table (',
'                   pkg_gi_rentas.fnc_cl_concepto_preliquidacion',
'                   (',
'                       p_cdgo_clnte 			        => :F_CDGO_CLNTE',
'                        , p_id_impsto					=> :P77_ID_IMPSTO',
'                        , p_id_impsto_sbmpsto			=> :P77_ID_IMPSTO_SBMPSTO',
'                        , p_id_impsto_acto				=> :P77_ID_IMPSTO_ACTO',
'                        , p_id_sjto_impsto            	=> :P77_ID_SJTO_IMPSTO',
'                        , p_json_cncptos				=> null',
'                        , p_vlor_bse					=> to_number(:P77_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                        , p_indcdor_usa_extrnjro		=> ''N''',
'                        , p_indcdor_usa_mxto			=>  ''N''',
'                        , p_fcha_expdcion				=> to_date(:P77_FCHA_EXPDCION)',
'                        , p_fcha_vncmnto				=> to_date(:P77_FCHA_VNCMNTO)',
'                        , p_indcdor_lqdccion_adcnal   	=> ''N'' ',
'                       -- , p_id_rnta_antrior		    	=> :P141_ID_RNTA_ANTRIOR',
'                       -- , p_indcdor_cntrto_gslna      	=> :P139_INDCDOR_CNTRTO_GSLNA',
'                        -- Nuevo HMZ - 30/12/2021',
'                       -- , p_vlor_cntrto_ese         => to_number(nvl(:P141_VLOR_CNTRTO_ESE, null), ''999G999G999G999G999G999G990D99'')',
'                   )',
'                ) a',
' where abs(a.vlor_lqddo)   > 0'))
,p_validation_type=>'EXISTS'
,p_error_message=>unistr('Proyecci\00F3n no valida')
,p_when_button_pressed=>wwv_flow_api.id(23342787939567414)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23355574037567522)
,p_name=>'Al seleccionar el impuesto acto'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P77_ID_IMPSTO_ACTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23356044675567524)
,p_event_id=>wwv_flow_api.id(23355574037567522)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23356440231567524)
,p_name=>'Liquidar'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(23342787939567414)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23356917482567526)
,p_event_id=>wwv_flow_api.id(23356440231567524)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function liquidar() {',
'    ',
'  ',
'            ',
'            await apex.server.process("Liquidar", {',
'            f01: window.localStorage.jsonconceptos,',
'            pageItems: "#F_CDGO_CLNTE, #P77_ID_IMPSTO_ACTO, #P77_ID_FSCLZCION_EXPDNTE, #P77_ACTO_TPO"',
'            },{',
'                success: function(data) {',
'                    if(data.o_cdgo_rspsta > 0) {',
'                        console.log(data.o_cdgo_rspsta);',
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
'                        apex.submit({request : "modal"});',
'                    }',
'                }',
'            })',
'            ',
'        }',
'   ',
'',
'liquidar();',
'',
unistr('/*apex.message.confirm("\00BFEst\00E1 seguro de realizar la liquidaci\00F3n?", function(okPressed) {'),
'   if(okPressed) {',
'       liquidar();',
'   } ',
'});*/',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23357364034567527)
,p_name=>'Al seleccionar'
,p_event_sequence=>40
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(84538810069686004)
,p_triggering_element=>'ID_TP_BS_SNCN_DCL_VGN_FRM'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23357838434567527)
,p_event_id=>wwv_flow_api.id(23357364034567527)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>' $s(''P77_ID_TPO_BSE_SNCION'', this.triggeringElement.value);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23358329184567527)
,p_event_id=>wwv_flow_api.id(23357364034567527)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'ingresoBrutos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23358770198567527)
,p_name=>'Al Cambiar'
,p_event_sequence=>50
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(84538810069686004)
,p_triggering_element=>'ID_TP_BS_SNCN_DCL_VGN_FRM_1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23359287336567528)
,p_event_id=>wwv_flow_api.id(23358770198567527)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>' $s(''P77_ID_TPO_BSE_SNCION'', this.triggeringElement.value);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23359606291567528)
,p_name=>'Al Cambiar_1'
,p_event_sequence=>60
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(84538810069686004)
,p_triggering_element=>'ID_TP_BS_SNCN_DCL_VGN_FRM_2'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23360111458567528)
,p_event_id=>wwv_flow_api.id(23359606291567528)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>' $s(''P77_ID_TPO_BSE_SNCION'', this.triggeringElement.value);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23389480467739624)
,p_name=>unistr('Actualizaci\00F3n de Pagina al cambiar la fecha de vencimiento y de pago')
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P77_FCHA_VNCMNTO,P77_VLOR_BSE_GRVBLE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23389598972739625)
,p_event_id=>wwv_flow_api.id(23389480467739624)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23424229307654502)
,p_name=>'Al seleccionar los conceptos, crear el json de conceptos a liquidar'
,p_event_sequence=>80
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(84538810069686004)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23424380920654503)
,p_event_id=>wwv_flow_api.id(23424229307654502)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'validar_sel();',
'if(this.data.selectedRecords.length > 0) {        ',
'    var model = this.data.model;',
'    var records = this.data.selectedRecords; ',
'',
'        var json = records.map(function (record){',
'            return {''cncpto'':  model.getValue(record, ''ID_CNCPTO''),',
'                    "vgncia" : model.getValue(record, "VGNCIA"),',
'                    "id_prdo" : model.getValue(record, "ID_PRDO"),',
'                    "bse" : model.getValue(record,  "BSE_GRVBLE").trim().replace(/\./g, ""),',
'                    "prdo" : model.getValue(record,  "PRDO"),',
'                    "id_impsto_acto_cncpto" : model.getValue(record,  "ID_IMPSTO_ACTO_CNCPTO"),',
'                    "orden" : model.getValue(record,  "ORDEN"),',
'                    "id_cnddto_vgncia" : model.getValue(record,  "ID_CNDDTO_VGNCIA") };',
'        });         ',
'    ',
'        $s(''P77_CNCPTOS_SLCCNDOS'', JSON.stringify(json));',
'    ',
'                       ',
'                    ',
'}',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23424573995654505)
,p_event_id=>wwv_flow_api.id(23424229307654502)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'NULL;'
,p_attribute_02=>'P77_CNCPTOS_SLCCNDOS'
,p_attribute_03=>'P77_CNCPTOS_SLCCNDOS'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23467173206163703)
,p_name=>'Seleccionar los Conceptos Obligatorios'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P77_CNCPTOS_OBLGTRIOS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23467256155163704)
,p_event_id=>wwv_flow_api.id(23467173206163703)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'seleccion_conceptos_obligatorios();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23479706749055212)
,p_name=>'Limpiar items numero y objeto de contrato'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P77_NMRO_CNTRTO,P77_OBJTO_CNTRTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23479807306055213)
,p_event_id=>wwv_flow_api.id(23479706749055212)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P77_NMRO_CNTRTO,P77_OBJTO_CNTRTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23387356879739603)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta Configuraci\00F3n de Rentas')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select indcdor_usa_extrnjro',
'         , indcdor_usa_mxto         ',
'     into :P77_USA_INDCDOR_EXTRNJRO',
'        , :P77_USA_INDCDOR_MXTO       ',
'     from gi_d_rentas_configuracion',
'    where cdgo_clnte = :F_CDGO_CLNTE;',
'    ',
'    select a.indcdor_rqre_adjnto',
'         , a.indcdor_rqre_autrzcion',
'      into :P77_INDCDOR_RQRE_ADJNTO',
'         , :P77_INDCDOR_RQRE_AUTRZCION',
'      from df_i_impuestos_subimpuesto    a',
'     where a.id_impsto_sbmpsto           = :P77_ID_IMPSTO_SBMPSTO;',
'     ',
'     select  to_char(a.fcha_expdcion, ''DD/MM/YYYY'')',
'     into :P77_FCHA_EXPDCION_2',
'     from fi_g_candidatos_vigencia a ',
'     where a.id_cnddto = :P77_ID_CNDDTO;',
'exception',
'    when others then',
'        :P77_INDCDOR_RQRE_ADJNTO    := ''N'';',
'        :P77_INDCDOR_RQRE_AUTRZCION := ''N'';',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23354722978567521)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Liquidar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta       number;',
'    v_id_sjto_impsto    number;',
'    v_id_impsto_ascda   number;',
'    v_txto_ascda        varchar2(100);',
'',
'    v_nmro_rnta         varchar2(30) ;',
'    v_id_fsclzcn_rnta   number;',
'    v_mnsje_rspsta      varchar2(1000);',
'    v_valida_campo      varchar2(1000);',
'    v_mensaje           varchar2(400);',
'    v_cncptos           clob;',
'    v_exception         exception;',
'    ',
'    v_tpo_fiscalizacion    varchar2(3);',
'begin',
'',
'     v_cncptos := :P77_CNCPTOS_SLCCNDOS;',
'        ',
'     /*begin   ',
'        select b.indcdor_fsclzcion_tpo ',
'        into    v_tpo_fiscalizacion',
'        from    fi_g_candidatos a ',
'        join    fi_g_fiscalizacion_lote b on b.id_fsclzcion_lte = a.id_fsclzcion_lte',
'        where a.id_cnddto = :P77_ID_CNDDTO;',
'    exception',
'        when others then',
'            v_cdgo_rspsta := 1;',
unistr('            v_mnsje_rspsta := v_cdgo_rspsta|| '' - No se encontro el tipo de fiscalizaci\00F3n ''||sqlerrm;'),
'            raise v_exception;',
'    end;',
'',
'    ',
'    ',
'    begin',
'        select c.cdgo_acto_tpo ',
'        into    :P77_ACTO_TPO',
'        from fi_d_programas_acto a',
'        join fi_g_candidatos b on a.id_prgrma = b.id_prgrma ',
'                            and a.id_sbprgrma = b.id_sbprgrma',
'        join gn_d_actos_tipo c on a.id_acto_tpo = c.id_acto_tpo',
'        join gn_d_actos_tipo_tarea d on c.id_acto_tpo = d.id_acto_tpo',
'        where b.id_cnddto = :P77_ID_CNDDTO ',
'        and d.id_fljo_trea = :F_ID_FLJO_TREA ;',
'      /*  select a.id_acto_tpo',
'        into :P77_ACTO_TPO',
'        from gn_d_actos_tipo a',
'        where a.cdgo_clnte = :F_CDGO_CLNTE',
'        and a.cdgo_acto_tpo = ''OLIQ'';*//*',
'    exception',
'        when others then',
'            v_cdgo_rspsta := 2;',
'            v_mnsje_rspsta := v_cdgo_rspsta|| '' - No se encontro el codigo del acto tipo ''||sqlerrm;',
'            raise v_exception;',
'    end;*/',
'    ',
'    begin',
'    insert into    fi_g_fscalizacion_renta (id_fsclzcion_expdnte,       nmro_cntrto,    objeto,             fcha_pago,        id_entdad) ',
'                                     values(:P77_ID_FSCLZCION_EXPDNTE, :P77_NMRO_CNTRTO,:P77_OBJTO_CNTRTO, :P77_FCHA_VNCMNTO, :P77_ENTIDAD)',
'                                     returning id_fsclzcn_rnta into v_id_fsclzcn_rnta ; commit ;',
'    ',
'    exception ',
'        when others then',
'        ',
'        ',
'          if :P77_ID_FSCLZCION_EXPDNTE is null then',
'              v_valida_campo := ''Expediente esta vacio'';',
'          elsif :P77_NMRO_CNTRTO is null then',
'              v_valida_campo := ''Numero del Contrato esta vacio'';',
'          elsif :P77_OBJTO_CNTRTO is null then',
'              v_valida_campo := ''Objeto del Contrato esta vacio'';',
'          elsif :P77_FCHA_VNCMNTO is null then',
'              v_valida_campo := ''Fecha de Pago esta vacio'';',
'          end if;',
'          v_cdgo_rspsta := 3;',
'          v_mnsje_rspsta :=  v_cdgo_rspsta||'' - No se pudo insertar registro en tabla fisca rentas: ''||v_valida_campo;',
'          raise v_exception;',
'     end;',
'',
'    ',
'    ',
'    ',
'    pkg_fi_fiscalizacion.prc_rg_fi_g_fsclzcion_sncion(p_cdgo_clnte           => :F_CDGO_CLNTE,',
'                                                      p_id_fsclzcion_expdnte => :P77_ID_FSCLZCION_EXPDNTE,',
'                                                      p_id_acto_tpo          => :P77_ID_IMPSTO_ACTO,',
'                                                      --p_id_acto_tpo          => :P77_ACTO_TPO,',
'                                                      p_json                 => v_cncptos,',
'                                                      p_id_fsclzcn_rnta     =>  v_id_fsclzcn_rnta,',
'                                                      o_cdgo_rspsta          => v_cdgo_rspsta,',
'                                                      o_mnsje_rspsta         => v_mnsje_rspsta);',
'    ',
'    if v_cdgo_rspsta > 0 then',
'        raise v_exception;',
'    end if;',
'  	',
'     /*   ',
'     pkg_fi_fiscalizacion.prc_rg_liquidacion(p_cdgo_clnte                =>  :F_CDGO_CLNTE,',
'                                            p_id_usrio                   =>  :F_ID_USRIO, ',
'                                            p_id_fsclzcion_expdnte       =>  :P75_ID_FSCLZCION_EXPDNTE,',
'                                          --  p_id_fsclzcion_expdnte_acto  =>  :P75_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                            p_tpo_fiscalizacion          => v_tpo_fiscalizacion,',
'                                            --p_json                 in  clob,',
'                                            o_cdgo_rspsta                =>  v_cdgo_rspsta,',
'                                            o_mnsje_rspsta               =>  v_mnsje_rspsta);',
'',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20002, v_mnsje_rspsta);',
'    end if;        ',
'    */',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'',
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
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23355120649567521)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IngresosBrutos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number := 0;',
'    v_id_dclrcn_tpo  number;',
'    v_id_dclrcion    number;',
'    v_mnsje_rspsta   varchar2(1000);',
'    v_cdgo_tpo_bse_sncion varchar2(5);',
'    v_exception      exception;',
'    json_hmlgcion    json_object_t;',
'    ',
'begin',
'',
unistr('    --Se valida el tipo de base sanci\00F3n'),
'    begin',
'        select a.cdgo_tpo_bse_sncion',
'        into v_cdgo_tpo_bse_sncion',
'        from fi_d_tipo_base_sancion a',
'        where a.cdgo_clnte = :F_CDGO_CLNTE',
'        and a.id_tpo_bse_sncion = :P77_ID_TPO_BSE_SNCION ;',
'    exception',
'        when others then',
'            null;',
'    end;',
'    ',
'    if v_cdgo_tpo_bse_sncion = ''IBD'' then',
'            ',
unistr('        --Se obtiene el tipo de declaraci\00F3n'),
'        begin',
'            select e.id_dclrcn_tpo',
'            into v_id_dclrcn_tpo',
'            from gi_d_dclrcnes_vgncias_frmlr  c',
'            join gi_d_dclrcnes_tpos_vgncias   d on c.id_dclrcion_tpo_vgncia = d.id_dclrcion_tpo_vgncia',
'            join gi_d_declaraciones_tipo      e on d.id_dclrcn_tpo = e.id_dclrcn_tpo',
'            where c.id_dclrcion_vgncia_frmlrio = :P77_DCLRCION_VGNCIA_FRMLRIO;',
'        exception',
'            when others then',
'                v_id_dclrcn_tpo := null;',
'        end;',
'',
unistr('        --Se obtiene la ultima declaraci\00F3n presentada por el sujeto impuesto'),
'        begin',
'            select max(f.id_dclrcion) as id_dclrcion',
'            into v_id_dclrcion',
'            from gi_d_dclrcnes_vgncias_frmlr  c',
'            join gi_d_dclrcnes_tpos_vgncias   d on c.id_dclrcion_tpo_vgncia = d.id_dclrcion_tpo_vgncia',
'            join gi_d_declaraciones_tipo      e on d.id_dclrcn_tpo = e.id_dclrcn_tpo',
'            join gi_g_declaraciones f on c.id_dclrcion_vgncia_frmlrio = f.id_dclrcion_vgncia_frmlrio',
'            where f.id_sjto_impsto = :P77_ID_SJTO_IMPSTO ',
'            and e.id_dclrcn_tpo = v_id_dclrcn_tpo',
'            and cdgo_dclrcion_estdo in (''PRS'', ''APL'');',
'        exception',
'            when others then',
'                v_id_dclrcion := 0;',
'        end;',
'',
unistr('        --Se obtiene el json de homologaci\00F3n'),
'        begin',
'            json_hmlgcion :=  new json_object_t(pkg_gi_declaraciones.fnc_gn_json_propiedades(''FIS'', v_id_dclrcion));',
'        exception',
'            when others then',
'                v_cdgo_rspsta := 1;',
unistr('                v_mnsje_rspsta := ''No se pudo obtener el ingreso bruto de la ultima declaraci\00F3n'';'),
'                raise v_exception;',
'        end;',
'',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.write(''ingrso_brto'', json_hmlgcion.get_string(''INBR''));',
'        apex_json.close_object;',
'        return;',
'    end if;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.write(''ingrso_brto'', 0);',
'    apex_json.close_object;',
'    ',
'     ',
'    ',
'    ',
'exception',
'    when v_exception then',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
