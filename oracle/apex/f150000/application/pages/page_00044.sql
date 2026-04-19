prompt --application/pages/page_00044
begin
wwv_flow_api.create_page(
 p_id=>44
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Pago PSE Plusval\00EDa')
,p_step_title=>unistr('Pago PSE Plusval\00EDa')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function obtenerJson(){',
'    var region = apex.region("ig");',
'    if (region) {',
'',
'        var view = apex.region("ig").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        //console.log(''records: ''+records);',
'',
'        //Obtenemos un json con los datos seleccionados que no han sido procesados',
'        var json =  records.map((modelo) => {',
'        //var json = records.map(function (record) {',
'            //console.log(model.getValue(modelo, "ID_SLDO_FVOR"));',
'            return { "ID_PLSVLIA_DTLLE":       model.getValue(modelo, "ID_PLSVLIA_DTLLE"),',
'                     "ID_DCMNTO":     model.getValue(modelo, "ID_DCMNTO")};',
'                     /*"ID_SJTO_IMPSTO":     model.getValue(record, "ID_SJTO_IMPSTO").trim()};*/',
'        });  ',
'        ',
'        //console.log(''json: ''+json);',
'        ',
'        $s(''P44_JSON'', JSON.stringify(json));',
'        window.localStorage.setItem(''jsonSaldo'', JSON.stringify(json));',
'    };',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery( apex.gPageContext$ ).on( "apexreadyend", function( e ) {',
'    ocultarAyudaD();',
'    apex.item( "informacion_basica" ).hide();',
'    apex.item( "liquidaciones" ).hide();',
'    ',
'});',
'',
'',
'apex.jQuery(apex.gPageContext$).on("apexreadyend", async function (e) {',
'    if($v(''P44_RSPSTA'') == ''0'' ){',
'        apex.item( "informacion_basica" ).hide();',
'        apex.item( "ig" ).hide();',
'   }',
'    if($v(''P44_RSPSTA'') == ''1'' ){',
'        apex.item( "informacion_basica" ).show();',
'        apex.item( "ig" ).show();',
'   }',
'    ',
'});'))
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer {',
'    display: none;',
'}'))
,p_step_template=>wwv_flow_api.id(252165693921651362)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250716134224'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(202002432251287529)
,p_plug_name=>'Liquidaciones'
,p_region_name=>'ig'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.id_plsvlia_dtlle				',
'	, e.id_prcso_plsvlia',
'	, case ',
'		when r.indcdor_pgo_aplcdo = ''N'' and e.vlor_plsvlia_actlzda > 0 and to_char(r.fcha_dcmnto,''YYYY'') = to_char(sysdate,''YYYY'') and pkg_gn_generalidades.fnc_vl_pago_pse(p.cdgo_clnte,',
'                                                   p.id_impsto,',
'                                                   p.id_impsto_sbmpsto) = ''S'' THEN --',
'			''<a href="f?p=''||:APP_ID||'':23:''||:APP_SESSION||''::NO:RP,23:P23_ID_IMPSTO,P23_ID_IMPSTO_SBMPSTO,P23_FCHA,P23_ID_SJTO_IMPSTO,P23_ID_ORGEN,P23_CDGO_ORGN_TPO:''||p.id_impsto||'',''||p.id_impsto_sbmpsto||'',''||trunc(r.fcha_vncmnto)||'',''||e.id_sjto_impsto|'
||'|'',''||r.id_dcmnto||'',DC" title="Pago PSE" class="t-Button t-Button--icon t-Button--iconRight lto5482178785609347_0 t-Button--hot"><span class="t-Button-label">Pago PSE</span><span aria-hidden="true" class="t-Icon t-Icon--right fa fa-credit-card"></sp'
||'an></a>''',
'	  else',
'		null',
'	  end as pse_lqdcion',
'	/*, case ',
'		when r.indcdor_pgo_aplcdo = ''N'' and r.id_dcmnto is not null  then',
'			--''<span aria-hidden="true" class="t-Icon t-Icon--right fa fa-credit-card"></span>''',
'            ''<button type="submit" class="t-Button t-Button--icon t-Button--iconRight t-Button--hot">Imprimir <i class="fa fa-print"></i></button>''',
'	  else',
'		null',
'	  end as rcbo_pgo*/     ',
'	, e.cdgo_prdial		',
'	, e.area_objto			',
'	, e.mtrcla_inmblria		',
'	, e.prptrio				',
'	, e.vlor_p1				',
'	, e.vlor_p2	 			',
'	, e.drccion				',
'	, e.hcho_gnrdor  	',
'	, e.vlor_plsvlia_actlzda',
'	, e.dscrpcion_error		',
'	, e.estdo_rgstro		',
'	, e.id_lqdcion	',
'    , r.nmro_dcmnto',
'    , decode(r.indcdor_pgo_aplcdo,''S'',''Si'',''No'') indcdor_pgdo ',
'    , vgncia',
'    , r.vlor_ttal_dcmnto',
'    , e.fcha_rgstro ',
'    , d.idntfccion_rspnsble ',
'    , r.id_dcmnto',
'from gi_g_plusvalia_procso_dtlle     e',
'join gi_g_plusvalia_proceso          p on e.id_prcso_plsvlia = p.id_prcso_plsvlia',
'left join re_g_documentos            r on e.id_dcmnto        = r.id_dcmnto',
'left join v_si_i_sujetos_responsable d on e.id_sjto_impsto   = d.id_sjto_impsto',
'									  and d.prncpal_s_n      = ''S''',
'where(  e.cdgo_prdial  = :P44_PRMTRO or :P44_PRMTRO is null )--( e.id_sjto_impsto  = :P44_ID_SJTO_IMPSTO or :P44_ID_SJTO_IMPSTO is null )',
'  and ( e.mtrcla_inmblria = :P44_MTRCLA_INMBLRIA  or :P44_MTRCLA_INMBLRIA  is null )  ',
'  and ( d.idntfccion_rspnsble = :P44_IDNTFCCION_RSPNSBLE or :P44_IDNTFCCION_RSPNSBLE is null ) ',
'  and (:P44_PRMTRO is not null or :P44_IDNTFCCION_RSPNSBLE is not null)'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21912753174483742)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21912895626483743)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21979177015591701)
,p_name=>'ID_PLSVLIA_DTLLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PLSVLIA_DTLLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(21979239611591702)
,p_name=>'ID_PRCSO_PLSVLIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSO_PLSVLIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(21979318584591703)
,p_name=>'PSE_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PSE_LQDCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'PSE'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>'&PSE_LQDCION.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21979443471591704)
,p_name=>'CDGO_PRDIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_PRDIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Referencia<br>Catastral'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21979543483591705)
,p_name=>'AREA_OBJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AREA_OBJTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('\00C1rea<br>Objeto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_format_mask=>'99G999G999G999G990D00'
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
 p_id=>wwv_flow_api.id(21979660847591706)
,p_name=>'MTRCLA_INMBLRIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MTRCLA_INMBLRIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Matr\00EDcula<br>Inmobiliaria')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(21979771420591707)
,p_name=>'PRPTRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRPTRIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Propietario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(21979888999591708)
,p_name=>'VLOR_P1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_P1'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor P1'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'99G999G999G999G990'
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
 p_id=>wwv_flow_api.id(21979931194591709)
,p_name=>'VLOR_P2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_P2'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor P2'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'99G999G999G999G990'
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
 p_id=>wwv_flow_api.id(21980008639591710)
,p_name=>'DRCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Direcci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(21980131519591711)
,p_name=>'HCHO_GNRDOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HCHO_GNRDOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Hecho<br>Generador'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(21980241522591712)
,p_name=>'VLOR_PLSVLIA_ACTLZDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_PLSVLIA_ACTLZDA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Plusval\00EDa<br>Actualizada')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'99G999G999G999G990'
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
 p_id=>wwv_flow_api.id(21980303375591713)
,p_name=>'DSCRPCION_ERROR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ERROR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21980442887591714)
,p_name=>'ESTDO_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTDO_RGSTRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(21980532123591715)
,p_name=>'NMRO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00FAmero<br>Documento')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(21980638503591716)
,p_name=>'INDCDOR_PGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_PGDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Indicador<br>Pago'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>2
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
 p_id=>wwv_flow_api.id(21980734345591717)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
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
 p_id=>wwv_flow_api.id(21980883973591718)
,p_name=>'VLOR_TTAL_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor<br>Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'99G999G999G999G990'
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
 p_id=>wwv_flow_api.id(21980987530591719)
,p_name=>'IDNTFCCION_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_RSPNSBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
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
 p_id=>wwv_flow_api.id(21981683122591726)
,p_name=>'ID_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(197166346803969008)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha <br>Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(197291248184296268)
,p_name=>'ID_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_LQDCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Id.<br>Liquidaci\00F3n')
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
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(197166136524969006)
,p_internal_uid=>197166136524969006
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
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(197296707516296447)
,p_interactive_grid_id=>wwv_flow_api.id(197166136524969006)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(197296858466296448)
,p_report_id=>wwv_flow_api.id(197296707516296447)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21985189313593371)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(21979177015591701)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21985577062593432)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(21979239611591702)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21986047028593434)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(21979318584591703)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>119
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21986522673593436)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(21979443471591704)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>180
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21987086612593438)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(21979543483591705)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21987541550593440)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(21979660847591706)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21988001623593441)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(21979771420591707)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21988553417593443)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(21979888999591708)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21989054705593498)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(21979931194591709)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21989573647593500)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(21980008639591710)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21990023393593502)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(21980131519591711)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>170
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21990555962593504)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(21980241522591712)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21991014474593505)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(21980303375591713)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21991592169593567)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(21980442887591714)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21992091444593569)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(21980532123591715)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21992580607593571)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(21980638503591716)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21993057348593573)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(21980734345591717)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21993548928593575)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(21980883973591718)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21994056832593577)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(21980987530591719)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22036772789991496)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>37
,p_column_id=>wwv_flow_api.id(21981683122591726)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22083827573713320)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(21912753174483742)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(197297781583296457)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(197166346803969008)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>90
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(197302781944296474)
,p_view_id=>wwv_flow_api.id(197296858466296448)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(197291248184296268)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(202160334326720603)
,p_plug_name=>'Definiciones de Rentas'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(543220623974638069)
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
 p_id=>wwv_flow_api.id(271240339564443196)
,p_plug_name=>unistr('Informaci\00F3n B\00E1sica')
,p_region_name=>'informacion_basica'
,p_parent_plug_id=>wwv_flow_api.id(543220623974638069)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-none:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21912621480483741)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(202002432251287529)
,p_button_name=>'BTN_IMPRMR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   	',
'        e.*',
'from gi_g_plusvalia_procso_dtlle     e',
'join gi_g_plusvalia_proceso          p on e.id_prcso_plsvlia = p.id_prcso_plsvlia',
'left join re_g_documentos            r on e.id_dcmnto        = r.id_dcmnto',
'left join v_si_i_sujetos_responsable d on e.id_sjto_impsto   = d.id_sjto_impsto',
'                                      and d.prncpal_s_n      = ''S''',
'where ( e.id_sjto_impsto  = :P44_ID_SJTO_IMPSTO or :P44_ID_SJTO_IMPSTO is null )',
'  and ( e.mtrcla_inmblria = :P44_MTRCLA_INMBLRIA  or :P44_MTRCLA_INMBLRIA  is null )  ',
'  and ( d.idntfccion_rspnsble = :P44_IDNTFCCION_RSPNSBLE or :P44_IDNTFCCION_RSPNSBLE is null ) ',
'and r.indcdor_pgo_aplcdo = ''N''',
'and to_char(r.fcha_dcmnto,''YYYY'') = to_char(sysdate,''YYYY'');'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23626432523303010)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(202002432251287529)
,p_button_name=>'New'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'New'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(186566079062789454)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(543220623974638069)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23530068501821812)
,p_button_sequence=>65
,p_button_plug_id=>wwv_flow_api.id(543220623974638069)
,p_button_name=>'BTN_HSTRIAL_PGOS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Historial de Pagos'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.:RP:P33_ID_SJTO_IMPSTO,P33_PGNA_ANTRIOR:&P44_ID_SJTO_IMPSTO.,44'
,p_button_condition=>'P44_ID_SJTO_IMPSTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>2
,p_grid_column=>11
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(186565752935789424)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(543220623974638069)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,205,206::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21913507266483750)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(543220623974638069)
,p_button_name=>'BTN_LMPIAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Limpiar'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_icon_css_classes=>'fa-eraser'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(21911847793483733)
,p_branch_name=>'imprimir'
,p_branch_action=>'f?p=&APP_ID.:44:&SESSION.:imprimir:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(21912621480483741)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21912125237483736)
,p_name=>'P44_ID_PLSVLIA_DTLLE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(543220623974638069)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21912224612483737)
,p_name=>'P44_ID_DCMNTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(543220623974638069)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21913262749483747)
,p_name=>'P44_JSON'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(543220623974638069)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21981067134591720)
,p_name=>'P44_ID_RPRTE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(543220623974638069)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21981454932591724)
,p_name=>'P44_ESTDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(271240339564443196)
,p_prompt=>'Estado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21981591097591725)
,p_name=>'P44_BLQDO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(271240339564443196)
,p_prompt=>unistr('\00BFBloqueado?')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186565016963789423)
,p_name=>'P44_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(543220623974638069)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186566459034789454)
,p_name=>'P44_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(543220623974638069)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_help_text=>'Seleccione el tributo asociado al acuerdo de pago.'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186567730352789459)
,p_name=>'P44_ID_SJTO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(543220623974638069)
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186568168778789459)
,p_name=>'P44_PRMTRO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(543220623974638069)
,p_prompt=>'Referencia Catastral'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>5
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del sujeto al que se le realizar\00E1 la liquidaci\00F3n de la renta.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186569011278789460)
,p_name=>'P44_NMRO_MTRCLA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(543220623974638069)
,p_prompt=>unistr('N\00FAmero de Matr\00EDcula')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186569468510789498)
,p_name=>'P44_RSPSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(543220623974638069)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186569879815789498)
,p_name=>'P44_VGNCIA_ACTUAL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(543220623974638069)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte 				  => :F_CDGO_CLNTE, ',
'                                                       p_cdgo_dfncion_clnte_ctgria    => ''GFN'', ',
'                                                       p_cdgo_dfncion_clnte		      => ''VAC'') vngcia',
'from dual;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186570215941789499)
,p_name=>'P44_ID_PRDO_ACTUAL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(543220623974638069)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte 				  => :F_CDGO_CLNTE, ',
'                                                       p_cdgo_dfncion_clnte_ctgria    => ''GFN'', ',
'                                                       p_cdgo_dfncion_clnte 		  => ''PAC'') a',
'  from dual;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186570969535789499)
,p_name=>'P44_IDNTFCCION_SJTO_FRMTDA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(271240339564443196)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186571346962789500)
,p_name=>'P44_NMBRE_RZON_SCIAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(271240339564443196)
,p_prompt=>'Nombre / Razon Social'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186571722990789736)
,p_name=>'P44_UBCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(271240339564443196)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186572005686789736)
,p_name=>'P44_DRCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(271240339564443196)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(186575062214789863)
,p_name=>unistr('Al hacer clic en el bot\00F3n consultar')
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(186566079062789454)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(186575541971789863)
,p_event_id=>wwv_flow_api.id(186575062214789863)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto   varchar2(500);   ',
'begin',
'    ',
'--INSERT INTO MUERTO (n_001, v_001, t_001) values (44, '':P44_NMRO_MTRCLA: ''||:P44_NMRO_MTRCLA, systimestamp); COMMIT;',
'--INSERT INTO MUERTO (n_001, v_001, t_001) values (44, '':P44_PRMTRO: ''||:P44_PRMTRO, systimestamp); COMMIT;',
'    begin ',
'        select distinct(a.id_sjto_impsto)',
'        into   v_id_sjto_impsto',
'        from   v_si_i_sujetos_impuesto    a',
'        join   gi_g_plusvalia_procso_dtlle   b on a.id_sjto_impsto = b.id_sjto_impsto',
'        where  cdgo_clnte                 = :F_CDGO_CLNTE',
'        and    id_impsto                  = nvl(:P44_ID_IMPSTO,230019)',
'        and    (  ( case when :P44_PRMTRO is not null then',
'                   to_char(:P44_PRMTRO)',
'                 else ',
'                  a.idntfccion_sjto',
'                 end ) = a.idntfccion_sjto                ',
'    	      and ',
'                ( case when :P44_NMRO_MTRCLA is not null then',
'                    to_char(:P44_NMRO_MTRCLA)',
'                  else ',
'                    b.mtrcla_inmblria',
'                  end ) = b.mtrcla_inmblria ); ',
'              ',
'        INSERT INTO MUERTO (n_001, v_001, t_001) values (44, ''v_id_sjto_impsto: ''||v_id_sjto_impsto, systimestamp); COMMIT;',
'        --:P44_RSPSTA                := ''1'';',
'        --:P44_ID_SJTO_IMPSTO        := v_id_sjto_impsto;',
'        apex_util.set_session_state(''P44_RSPSTA'', ''1'');',
'        apex_util.set_session_state(''P44_ID_SJTO_IMPSTO'', v_id_sjto_impsto);',
'',
'    exception',
'        when no_data_found then ',
'--INSERT INTO MUERTO (n_001, v_001, t_001) values (44, ''no_data_found: ''||:P44_PRMTRO||'' - ''||:P44_NMRO_MTRCLA, systimestamp); COMMIT;',
'            :P44_RSPSTA                := ''0'';',
'            :P44_ID_SJTO_IMPSTO        := null;',
'            apex_util.set_session_state(''P44_RSPSTA'', ''0'');',
'            apex_util.set_session_state(''P44_ID_SJTO_IMPSTO'', null);',
'',
'        when others then ',
'--INSERT INTO MUERTO (n_001, v_001, t_001) values (44, ''others: ''||:P44_PRMTRO||'' - ''||:P44_NMRO_MTRCLA, systimestamp); COMMIT;',
'            apex_util.set_session_state(''P44_RSPSTA'', ''0'');',
'            apex_util.set_session_state(''P44_ID_SJTO_IMPSTO'', null);',
'    end;',
'end;'))
,p_attribute_02=>'P44_PRMTRO,P44_NMRO_MTRCLA'
,p_attribute_03=>'P44_ID_SJTO_IMPSTO,P44_RSPSTA'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(186576077379789863)
,p_event_id=>wwv_flow_api.id(186575062214789863)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log($v(''P44_ID_SJTO_IMPSTO''));',
'',
'if($v(''P44_RSPSTA'') == ''1'' && $v(''P44_ID_SJTO_IMPSTO'') !== null ){',
'    // Si existe el sujeto impuesto',
'    apex.submit();',
'    ',
'}',
'else if  ($v(''P44_RSPSTA'') == ''0'' ){',
'    // No existe el sujeto impuesto',
'    Swal.fire({',
'        icon: ''error'',',
unistr('        title:  ''<H2 >PLUSVAL\00CDA</H2>'','),
'        html: ''<H4>El Sujeto Impuesto ingresado NO existe.</H4>''',
'    });',
'',
'} ',
';',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(186576448623789935)
,p_name=>unistr('Refrescar P\00E1gina ')
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P44_ID_IMPSTO_ACTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(186576977483789936)
,p_event_id=>wwv_flow_api.id(186576448623789935)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P44_ID_IMPSTO_ACTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(186577480194789936)
,p_event_id=>wwv_flow_api.id(186576448623789935)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(186577844920789936)
,p_name=>'New'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P44_ID_IMPSTO_ACTO_CNCPTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(186578361199789937)
,p_event_id=>wwv_flow_api.id(186577844920789936)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P44_ID_IMPSTO_ACTO_CNCPTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21913007767483745)
,p_name=>'Al seleccionar registro'
,p_event_sequence=>90
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(202002432251287529)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21913121131483746)
,p_event_id=>wwv_flow_api.id(21913007767483745)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'obtenerJson();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23626554713303011)
,p_name=>'New_1'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(23626432523303010)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23626615706303012)
,p_event_id=>wwv_flow_api.id(23626554713303011)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function boton () {',
'    window.location.href = `f?p=${15000}:${1}:${7378974918527}::NO::::`;',
'}',
'',
'boton();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(186574260132789862)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de Datos del Sujeto Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    :P44_IDNTFCCION_SJTO_FRMTDA := null; ',
'    :P44_UBCCION                := null;',
'    :P44_DRCCION                := null;  ',
'    :P44_NMBRE_RZON_SCIAL       := null;',
'    :P44_ESTDO                  := null;',
'    :P44_BLQDO                  := null;',
'   ',
'   INSERT INTO MUERTO (n_001, v_001, t_001) values (44, ''P44_ID_SJTO_IMPSTO: ''||:P44_ID_SJTO_IMPSTO, systimestamp); COMMIT;',
'   ',
'   select a.idntfccion_sjto_frmtda',
'        , upper(a.nmbre_pais || '' '' || a.nmbre_dprtmnto || '' '' || a.nmbre_mncpio)',
'        , a.drccion ',
'        , b.prmer_nmbre||'' ''||b.sgndo_nmbre||'' ''||b.prmer_aplldo||'' ''||b.sgndo_aplldo nmbre_rzon_scial',
'        , a.dscrpcion_sjto_estdo',
'        , a.dsc_estdo_blqdo_sjto',
'     into :P44_IDNTFCCION_SJTO_FRMTDA',
'        , :P44_UBCCION',
'        , :P44_DRCCION ',
'        , :P44_NMBRE_RZON_SCIAL  ',
'        , :P44_ESTDO  ',
'        , :P44_BLQDO ',
'     from V_SI_I_SUJETOS_IMPUESTO    a',
'     join si_i_sujetos_responsable   b on a.id_sjto_impsto = b.id_sjto_impsto and b.prncpal_s_n = ''S''',
'    where a.id_sjto_impsto           = :P44_ID_SJTO_IMPSTO;',
'',
'exception',
'    when others then',
'        :P44_IDNTFCCION_SJTO_FRMTDA := null; ',
'        :P44_UBCCION                := null;',
'        :P44_DRCCION                := null;  ',
'        :P44_NMBRE_RZON_SCIAL       := null;',
'        :P44_ID_SJTO_IMPSTO         := null;',
'        :P44_ESTDO                  := null;',
'        :P44_BLQDO                  := null;',
'end;'))
,p_process_error_message=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21981213359591722)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de Datos del Reporte'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   ',
'begin',
'     ',
'    select a.id_rprte',
'      into :P44_ID_RPRTE',
'      from gn_d_reportes   a',
'       join gn_d_reporte_cliente    b on a.id_rprte = b.id_rprte',
'       and cdgo_clnte              = :F_CDGO_CLNTE',
'     where cdgo_rprte_grpo = ''RPP'' ',
'       and a.indcdor_gnrco = ''N'';',
'       ',
'       INSERT INTO MUERTO (n_001, v_001, t_001) values (44, ''P44_ID_RPRTE: ''||:P44_ID_RPRTE, systimestamp); COMMIT;',
'     ',
'exception',
'    when no_data_found then ',
'       begin ',
'           select a.id_rprte',
'          into :P44_ID_RPRTE',
'          from gn_d_reportes   a',
'         where cdgo_rprte_grpo = ''RPP'' ',
'           and a.indcdor_gnrco = ''S''',
'           and rownum = 1;',
'       exception ',
'           when others then ',
'               null;',
'       end;',
'    when others then ',
'        :P44_ID_RPRTE := NULL;',
'end; '))
,p_process_error_message=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(186573598234789765)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto Impuesto x BTN_CONSULTAR'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    ',
'begin',
'',
'INSERT INTO MUERTO (n_001, v_001, t_001) values (44, ''ingresa'', systimestamp); COMMIT;',
'',
'    select a.id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto    a',
'      --join si_i_predios               b on a.id_sjto_impsto    = b.id_sjto_impsto',
'     where cdgo_clnte                 = :F_CDGO_CLNTE',
'       and id_impsto                  = :P44_ID_IMPSTO',
'    /*   and (',
'               (:P44_TPO_BSQDA       = ''REF'' and a.idntfccion_sjto     = :P44_PRMTRO) or',
'               (:P44_TPO_BSQDA       = ''RAN'' and a.idntfccion_antrior  = :P44_PRMTRO) or',
'               (:P44_TPO_BSQDA       = ''DIR'' and a.drccion             = :P44_PRMTRO) or',
'               (:P44_TPO_BSQDA       = ''MTR'' and b.mtrcla_inmblria     = :P44_PRMTRO)',
'            )*/;',
'    ',
'    :P44_RSPSTA := ''1'';',
'    :P44_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'    exception',
'        when no_data_found then ',
'            :P44_ID_SJTO_IMPSTO := null;',
'            :P44_RSPSTA := ''0''; ',
'end;'))
,p_process_error_message=>'&P44_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(186566079062789454)
,p_process_success_message=>'&P44_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(186573960998789862)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Cache de Id sujeto Impuesto'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P44_ID_SJTO_IMPSTO'
,p_process_error_message=>'&P44_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(186566079062789454)
,p_process_when_type=>'NEVER'
,p_process_success_message=>'&P44_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21912990942483744)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(202002432251287529)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Liquidaciones - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21913392502483748)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_Json'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    select ID_PLSVLIA_DTLLE, ID_DCMNTO into :P44_ID_PLSVLIA_DTLLE, :P44_ID_DCMNTO ',
'        from json_table(:P44_JSON,''$[*]''',
'        columns (ID_PLSVLIA_DTLLE varchar2(100) PATH ''$.ID_PLSVLIA_DTLLE'',',
'                 ID_DCMNTO varchar2(100) PATH ''$.ID_DCMNTO''));',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(21912621480483741)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21913432293483749)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>unistr('Limpiar Items Sesi\00F3n')
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P44_ID_SJTO_IMPSTO,P44_NMRO_MTRCLA,P44_PRMTRO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(21913507266483750)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21911792302483732)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Imprimir'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_gn_d_reportes     gn_d_reportes%rowtype;',
'     v_blob              blob;',
'     v_object json_object_t := json_object_t();',
'     v_json                clob;',
'     --v_consecutivo         number := pkg_gn_generalidades.fnc_cl_consecutivo(:F_CDGO_CLNTE, ''PYZ'');',
'    ',
'begin',
'    ',
'    ',
'        --v_object.put(''id_impsto'', 230019);',
'        --v_object.put(''id_impsto_sbimpsto'',2300199);',
'        v_object.put(''cdgo_clnte'', :F_CDGO_CLNTE);',
'        --v_object.put(''usrio'', :F_NMBRE_USRIO);',
'        v_object.put(''id_sjto_impsto'',:P44_ID_SJTO_IMPSTO);',
'        -- v_object.put(''nmbre_rprte'',v_nmbre_rprte);',
'        --v_object.put(''cnsctvo'',v_consecutivo);',
'        v_object.put(''id_rprte'',:P44_ID_RPRTE);',
'        --:P273_JSON := v_object.to_clob();   ',
'        v_json := v_object.to_clob();   ',
'    ',
'    apex_session.attach( p_app_id     => 66000',
'                       , p_page_id    => 37',
'                       , p_session_id => v(''APP_SESSION'') );',
'                       ',
'    apex_session.attach( p_app_id     => 66000',
'                       , p_page_id    => 2',
'                       , p_session_id => v(''APP_SESSION'') );',
'    ',
'    ',
'    --BUSCAMOS LOS DATOS DE PLANTILLA DE REPORTES',
'    select /*+ RESULT_CACHE */',
'           r.*',
'      into v_gn_d_reportes ',
'      from gn_d_reportes r',
'     where id_rprte = :P44_ID_RPRTE;--(select id_rprte from gn_d_plantillas where id_plntlla = :P271_ID_PLNTLLA);',
'',
'    --SETEAMOS EN SESSION LOS ITEMS NECESARIOS PARA GENERAR EL ARCHIVO             ',
'    apex_util.set_session_state(''P37_ID_RPRTE'', v_gn_d_reportes.id_rprte);',
'    apex_util.set_session_state(''P37_JSON'' , v_json);',
'    apex_util.set_session_state(''P2_PRMTRO_1'' , :P44_ID_PLSVLIA_DTLLE);',
'    apex_util.set_session_state(''P2_PRMTRO_2'' , :P44_ID_DCMNTO);',
'    ',
'     ',
'    v_blob := apex_util.get_print_document( p_application_id     => 66000, ',
'                                            p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,',
'                                            p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,',
'                                            p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,',
'                                            p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo );',
'',
'    htp.init;',
'    owa_util.mime_header(''application/pdf'', FALSE );',
'    htp.p(''Content-length: '' ||dbms_lob.getlength(v_blob));',
'    htp.p(''Content-Disposition: attachment; filename="Liquidacion.pdf"'' );',
'    htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'    owa_util.http_header_close;',
'    wpg_docload.download_file(v_blob);',
'    apex_application.stop_apex_engine;',
'    ',
'exception  ',
'     when others then',
'          null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(21912621480483741)
,p_process_when=>'imprimir'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
