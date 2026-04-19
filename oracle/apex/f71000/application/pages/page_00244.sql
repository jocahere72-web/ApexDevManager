prompt --application/pages/page_00244
begin
wwv_flow_api.create_page(
 p_id=>244
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Aplicaci\00F3n Titulos')
,p_step_title=>unistr('Aplicaci\00F3n Titulos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/accounting.min.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function buildJsonTitulos() {',
'    ',
'    var region = apex.region(''titulos'');',
'    ',
'    if(region) {',
'        ',
'        var view = apex.region("titulos").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = model._data;//view.view$.grid("getSelectedRecords");',
'        ',
'        var jsonTitulos = records.map((titulos) => {',
'            return {"ID_TTLO_JDCIAL" : model.getValue(titulos, "ID_TTLO_JDCIAL"),',
'                    "ID_INSTNCIA_FLJO" : model.getValue(titulos, "ID_INSTNCIA_FLJO"),',
'                    "TTLO_JDCIAL_ESTDO" : model.getValue(titulos, "TTLO_JDCIAL_ESTDO")',
'                   }; ',
'        });',
'        $s(''P244_JSON_TTLOS'', JSON.stringify(jsonTitulos));',
'        console.log(''json_titulos: ''+JSON.stringify(jsonTitulos))',
'        //window.localStorage.setItem(''jsonTitulos'', JSON.stringify(jsonTitulos));',
'    }',
'};',
'',
'function calculaTotal() {',
'        ',
'        var i, records, record, sal, model,',
'            v_vlor_ttal = 0,',
'            total = 0,',
'            vgncia_prdo = '' {"VGNCIA_PRDO":['',',
'            view = apex.region("deuda").widget().interactiveGrid("getCurrentView");',
'            model = view.model;',
'            records = view.getSelectedRecords();',
'            ',
'            //Realizamos un filtro de todos los datos seleccionados del interactive grid que esten en estado Normal',
'            records = records.filter(function (record) {',
'                return ( [''NO'', ''CN''].includes( model.getValue(record, "CDGO_MVNT_FNCRO_ESTDO")) && model.getValue(record, "DSCRPCION_INDCDOR_MVMNTO_BLQDO") === ''No'' ) ',
'            });',
'            ',
'            if ( records.length > 0 ) {',
'             ',
'                for ( i = 0; i < records.length; i++ ) {',
'                    record = records[i];',
'                    v_vlor_ttal = parseFloat(accounting.unformat(model.getValue(record, "VLOR_TTAL"),","));',
'                     console.log(''v_vlor_ttal''+v_vlor_ttal);',
'                    if (v_vlor_ttal > 0) { ',
'                        vgncia_prdo = vgncia_prdo + ''{"vgncia":''      + parseFloat(model.getValue(record, "VGNCIA")) + ',
'                                                    '',"prdo":''        + parseFloat(model.getValue(record, "PRDO")) + ',
'                                                    '',"id_orgen":''    + model.getValue(record, "ID_ORGEN") + ''},'';',
'                        if ( !isNaN(v_vlor_ttal) ) {',
'                            total += v_vlor_ttal;',
'                        }',
'                    }  ',
'                     ',
'               }',
'            } ',
'            ',
'    ',
'            $s("P244_VLOR_TTAL", total);',
'            vgncia_prdo = vgncia_prdo.substring(vgncia_prdo.length-1, 1) ;',
'            vgncia_prdo = vgncia_prdo + '']}''',
'            $s("P244_VGNCIA_PRDO", vgncia_prdo);',
'    ',
'        //Seleccionamos los item no procesados en el interactive grid ',
'        apex.region("deuda").widget().interactiveGrid("setSelectedRecords", records);',
'};',
'',
'/*function fnc_documentosVl() {',
'    var igRegion = apex.region("documentos");',
'    if (igRegion) {',
'        var igView = igRegion.widget().interactiveGrid("getViews", "grid");',
'        var igModel = igView.model;',
'        var recordCount = igModel._data.length;',
'        return recordCount;',
'    } ',
'});*/',
'',
'//VIEJO',
'/*//var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function calculaTotal() {',
'        var i, record,',
'            v_vlor_ttal = 0,',
'            total = 0,',
'            vgncia_prdo = '' {"VGNCIA_PRDO":['',',
'            view = apex.region("carteraCautelar").widget().interactiveGrid("getCurrentView"),',
'            model = view.model,',
'            //records = view.getSelectedRecords();            ',
'            records = model._data;//.getSelectedRecords();',
'    ',
'            if ( records.length > 0 ) {',
'                for ( i = 0; i < records.length; i++ ) {',
'                    record = records[i];',
'                    vgncia_prdo = vgncia_prdo + ''{"vgncia":''      + parseFloat(model.getValue(record, "VGNCIA")) + ',
'                                                '',"prdo":''        + parseFloat(model.getValue(record, "PRDO")) + ',
'                                                ''},'';',
'                    v_vlor_ttal = parseFloat(accounting.unformat(model.getValue(record, "VLOR_TTAL"),","));',
'                    if ( !isNaN(v_vlor_ttal) ) {',
'                        total += v_vlor_ttal;',
'                    }',
'                }',
'            }',
'            $s("P244_VLOR_TTAL", total);',
'            vgncia_prdo = vgncia_prdo.substring(vgncia_prdo.length-1, 1) ;',
'            vgncia_prdo = vgncia_prdo + '']}''',
'            $s("P244_VGNCIA_PRDO", vgncia_prdo);',
'        //Seleccionamos los item no procesados en el interactive grid ',
'        //apex.region("carteraCautelar").widget().interactiveGrid("setSelectedRecords", records);',
'}',
'',
'/*function buildJsonConcepto(){',
'    ',
'    var region = apex.region(''carteraCautelar'');',
'    ',
'    if(region){',
'        ',
'        var view = apex.region("carteraCautelar").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = model._data;',
'        ',
'        var jsonconceptos = records.map((concepto) => {',
'            return {"vgncia" : model.getValue(concepto, "VGNCIA"),',
'                    "id_prdo" : model.getValue(concepto, "ID_PRDO"),',
'                    "prdo" : model.getValue(concepto,  "PRDO"),',
'                    "id_cncpto" : model.getValue(concepto,  "ID_CNCPTO"),',
'                    "id_impsto" : model.getValue(concepto,  "ID_IMPSTO"),',
'                    "id_impsto_sbmpsto" : model.getValue(concepto,  "ID_IMPSTO_SBMPSTO"),',
'                    "id_sjto_impsto" : model.getValue(concepto,  "ID_SJTO_IMPSTO")',
'                    //"vlor_aplcar" : model.getValue(concepto,  "VLOR_APLCAR").trim().replace(/\./g, "")',
'                   }; ',
'        });',
'        ',
'        window.localStorage.setItem(''jsonconceptos'', JSON.stringify(jsonconceptos));',
'        ',
'        var conceptos = JSON.parse(window.localStorage.jsonconceptos)',
'        ',
'        return conceptos.length',
'        ',
'    }',
'    ',
'}*//*',
'function buildJsonTitulos() {',
'    ',
'    var region = apex.region(''titulos'');',
'    ',
'    if(region) {',
'        ',
'        var view = apex.region("titulos").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        var jsonTitulos = records.map((titulos) => {',
'            return {"ID_TTLO_JDCIAL" : model.getValue(titulos, "ID_TTLO_JDCIAL"),',
'                    "ACCION" : model.getValue(titulos, "ACCION")',
'                   }; ',
'        });',
'        $s(''P244_JSON'', JSON.stringify(jsonTitulos));',
'        console.log(''json: ''+JSON.stringify(jsonTitulos))',
'        window.localStorage.setItem(''jsonTitulos'', JSON.stringify(jsonTitulos));',
'    }',
'}',
'',
'function buildJsonCartera() {',
'    ',
'    var region = apex.region(''cartera'');',
'    ',
'    if(region) {',
'        ',
'        var view = apex.region("cartera").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        var jsonCartera = records.map((cartera) => {',
'            return {"ID_IMPSTO" : model.getValue(cartera, "ID_IMPSTO"),',
'                    "ID_IMPSTO_SBMPSTO" : model.getValue(cartera, "ID_IMPSTO_SBMPSTO"),',
'                    "ID_SJTO_IMPSTO" : model.getValue(cartera, "ID_SJTO_IMPSTO"),',
'                    "ID_SJTO_RSPNSBLE" : model.getValue(cartera, "ID_SJTO_RSPNSBLE"),',
'                    "VGNCIA" : model.getValue(cartera, "VGNCIA"),',
'                    "ID_PRDO" : model.getValue(cartera, "ID_PRDO"),',
'                    "ID_CNCPTO" : model.getValue(cartera, "ID_CNCPTO")',
'                   }; ',
'        });',
'        $s(''P244_JSON_CRTRAS'', JSON.stringify(jsonCartera));',
'        console.log(''json_cartera: ''+JSON.stringify(jsonCartera))',
'        //window.localStorage.setItem(''jsonCartera'', JSON.stringify(jsonCartera));',
'    }',
'}',
'/*function calcularValor() {',
'    // Obtener la instancia de la grilla interactiva',
'    var grid = apex.region("cartera").widget().interactiveGrid("getViews", "grid");',
'',
'    // Obtener las filas seleccionadas',
'    var selectedRecords = grid.getSelectedRecords();',
'',
'    // Realizar la resta y almacenar el resultado',
'    var resultado = 0; // Inicializa el resultado',
'',
'    selectedRecords.forEach(function(record) {',
'        // Reemplaza ''nombre_columna'' con el nombre de la columna que deseas restar',
'        var valorColumna = parseFloat(record["VLOR_TTAL"]); ',
'        //console.log(''valorColumna: ''+valorColumna);',
'        // Realizar la resta',
'        resultado = valorColumna;',
'    });',
'        //console.log(''resultado: ''+resultado);',
'    ',
'    // Asignar el resultado al elemento de Apex',
'    $s(''P244_VALOR_TTLO_2'', resultado);',
'}*/'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if( apex.region("deuda") )',
'    apex.region("deuda").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");',
'//VIEJO',
'//apex.item("P244_VLOR_ABNO").hide();',
'/*if( apex.region("carteraCautelar") )',
'    apex.region("carteraCautelar").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");*/'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20260304083656'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29958422114839201)
,p_plug_name=>'Tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29958595005839202)
,p_plug_name=>'<b>Cartera Vigencias Futuras</b>'
,p_parent_plug_id=>wwv_flow_api.id(29958422114839201)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_ttlo_jdcial_sldo_fvor,',
'       a.id_ttlo_jdcial,',
'       a.id_instncia_fljo,',
'       a.id_sjto_impsto,',
'       a.idntfccion_sjto,',
'       a.vlor_sldo_fvor,',
'       a.obsrvcnes,',
'       a.fcha_rgstro,',
'       a.id_fncnrio',
'  from gf_g_titulos_judicial_saldo_favor a',
' where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from gf_g_titulos_judicial_saldo_favor ',
' where id_instncia_fljo = :F_ID_INSTNCIA_FLJO'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(29958752389839204)
,p_name=>'ID_TTLO_JDCIAL_SLDO_FVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_SLDO_FVOR'
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
 p_id=>wwv_flow_api.id(29958888849839205)
,p_name=>'ID_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL'
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
 p_id=>wwv_flow_api.id(29958917761839206)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
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
 p_id=>wwv_flow_api.id(29959014266839207)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(29959136791839208)
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
 p_id=>wwv_flow_api.id(29959240120839209)
,p_name=>'VLOR_SLDO_FVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_FVOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Saldo A Favor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(29959356345839210)
,p_name=>'OBSRVCNES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCNES'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Observaciones'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(29959439825839211)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha De Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
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
 p_id=>wwv_flow_api.id(29959506932839212)
,p_name=>'ID_FNCNRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FNCNRIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(29958611729839203)
,p_internal_uid=>29958611729839203
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
 p_id=>wwv_flow_api.id(29965454754853123)
,p_interactive_grid_id=>wwv_flow_api.id(29958611729839203)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(29965513831853125)
,p_report_id=>wwv_flow_api.id(29965454754853123)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29966086279853137)
,p_view_id=>wwv_flow_api.id(29965513831853125)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(29958752389839204)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29966486266853142)
,p_view_id=>wwv_flow_api.id(29965513831853125)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(29958888849839205)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29966955551853143)
,p_view_id=>wwv_flow_api.id(29965513831853125)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(29958917761839206)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29967435782853145)
,p_view_id=>wwv_flow_api.id(29965513831853125)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(29959014266839207)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29967905098853147)
,p_view_id=>wwv_flow_api.id(29965513831853125)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(29959136791839208)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29968479188853149)
,p_view_id=>wwv_flow_api.id(29965513831853125)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(29959240120839209)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29968983178853150)
,p_view_id=>wwv_flow_api.id(29965513831853125)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(29959356345839210)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29969466745853152)
,p_view_id=>wwv_flow_api.id(29965513831853125)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(29959439825839211)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29969929140853154)
,p_view_id=>wwv_flow_api.id(29965513831853125)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(29959506932839212)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43110008901147239)
,p_plug_name=>'<b>Cartera Consignada</b>'
,p_region_name=>'cartera'
,p_parent_plug_id=>wwv_flow_api.id(29958422114839201)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_impsto',
'        ,a.id_impsto_sbmpsto ',
'        ,b.vgncia',
'        ,b.id_prdo',
'        ,(select dscrpcion from df_i_periodos where id_prdo = b.id_prdo) dscrpcion_prdo',
'        ,b.vlor_cptal',
'        ,b.vlor_intres ',
'        ,b.vlor_dscto',
'        ,b.vlor_ttal',
'        ,b.vlor_ttal_ttlo',
'        ,b.id_orgen',
'        ,b.vlor_ttal_aplcar',
'        ,b.vlor_ttal_aplccion',
'        ,b.vlor_dscnto_aplccion',
'        ,b.tpo_dcmnto',
'        ,b.cdgo_mvmnto_orgn',
'        ,b.prdo ',
'        ,trunc(b.fcha_pryccion) fcha_pryccion',
' from gf_g_titulos_jdcial_impsto a  ',
' join gf_g_titulos_jdcial_vgncia b on a.id_instncia_fljo = b.id_instncia_fljo',
' where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1 ',
' from gf_g_titulos_jdcial_impsto',
' where id_instncia_fljo= :F_ID_INSTNCIA_FLJO;'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21900464220322403)
,p_name=>'FCHA_PRYCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_PRYCCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha <br> Proyecci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
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
 p_id=>wwv_flow_api.id(21979924039478505)
,p_name=>'DSCRPCION_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_PRDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
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
 p_id=>wwv_flow_api.id(43111593443147255)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(43111686541147256)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(177369392791050685)
,p_lov_display_extra=>true
,p_lov_display_null=>true
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(43111843493147257)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Sub Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(177369818921050685)
,p_lov_display_extra=>true
,p_lov_display_null=>true
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(43112001066147259)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(43112326107147262)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(43760030079350239)
,p_name=>'VLOR_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(43760088853350240)
,p_name=>'VLOR_DSCTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br>Descuento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(43760184725350241)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(43760297692350242)
,p_name=>'VLOR_TTAL_TTLO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_TTLO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Total T\00EDtulo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(43760406104350243)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Orgen'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(43760536671350244)
,p_name=>'VLOR_TTAL_APLCAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_APLCAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total <br>a Aplicar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(43760587643350245)
,p_name=>'VLOR_TTAL_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_APLCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Total<br>Aplicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(43760699023350246)
,p_name=>'VLOR_DSCNTO_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO_APLCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Descuento <br>Aplicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(43760783454350247)
,p_name=>'TPO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_DCMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo <br>Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(43760962523350248)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Cdgo Mvmnto Orgn'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
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
 p_id=>wwv_flow_api.id(43761058267350249)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Prdo'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>250
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(43110936975147248)
,p_internal_uid=>43110936975147248
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
 p_id=>wwv_flow_api.id(43118433632149942)
,p_interactive_grid_id=>wwv_flow_api.id(43110936975147248)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(43118520222149942)
,p_report_id=>wwv_flow_api.id(43118433632149942)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1999896032480)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(21979924039478505)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>87
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21907323963396203)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(21900464220322403)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>101
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43119952589149969)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(43111593443147255)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43120459912149971)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(43111686541147256)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>212
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43120915002149974)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(43111843493147257)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>179
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43121468847149976)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(43112001066147259)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>86
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43121933756149978)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(43112326107147262)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>111
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43765995551350382)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(43760030079350239)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43766521825350385)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(43760088853350240)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43766974627350387)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(43760184725350241)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43767510657350389)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(43760297692350242)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43768003075350391)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(43760406104350243)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43768551175350394)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(43760536671350244)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43769053302350397)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(43760587643350245)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>146
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43769556282350400)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(43760699023350246)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>139
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43770002473350402)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(43760783454350247)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43770509749350405)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(43760962523350248)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43771070119350407)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(43761058267350249)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(21892410882311838)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(43760088853350240)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(21893261731321827)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(43760030079350239)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(21893343337321827)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(43760184725350241)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(21893398692321827)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(43760536671350244)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(21901780971433561)
,p_view_id=>wwv_flow_api.id(43118520222149942)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(43112326107147262)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43486657311822586)
,p_plug_name=>'<b>Documentos Generados</b>'
,p_region_name=>'cartera'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select c.id_dcmnto,',
'        c.nmbre_impsto,',
'       c.nmro_dcmnto, ',
'       to_char(c.fcha_dcmnto,''DD/MM/YYYY HH12:MI:SS AM'') fcha_dcmnto, ',
'       initcap(c.dscrpcion_dcmnto_tpo) dscrpcion_dcmnto_tpo,',
'       c.vlor_ttal_dcmnto, ',
'       to_char(c.fcha_vncmnto,''DD/MM/YYYY'') fcha_vncmnto,',
'       initcap(c.dscrpcion_indcdor_pgo_aplcdo) dscrpcion_indcdor_pgo_aplcdo,',
'       1 as "IMPRIMIR"     ',
'   from gf_g_ttls_jdcl_impsto_dcmnt a ',
'    join gf_g_titulos_jdcial_impsto b on b.id_instncia_fljo = a.id_instncia_fljo',
'                                                    and b.id_instncia_fljo = :F_ID_INSTNCIA_FLJO ',
'    join v_re_g_documentos c on c.id_dcmnto = a.id_dcmnto;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'   from gf_g_ttls_jdcl_impsto_dcmnt a ',
'    join gf_g_titulos_judicial b on b.id_ttlo_jdcial = a.id_ttlo_jdcial',
'                                    and b.id_instncia_fljo = :F_ID_INSTNCIA_FLJO ',
'    join v_re_g_documentos c on c.id_dcmnto = a.id_dcmnto',
'    fetch first row only'))
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(43487954128822599)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_detail_link=>'f?p=140000:6:&SESSION.::&DEBUG.:RP,6:P6_ID_DCMNTO:#ID_DCMNTO#'
,p_detail_link_text=>'<center><span class="fa fa-eye" aria-hidden="true"></span></center>'
,p_owner=>'JPRADA'
,p_internal_uid=>43487954128822599
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21926403867019839)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Dcmnto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21926785406019845)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21927186899019846)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'No. Documento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21927528022019846)
,p_db_column_name=>'FCHA_DCMNTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Fecha Documento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21927982040019846)
,p_db_column_name=>'DSCRPCION_DCMNTO_TPO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Tipo Documento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21928314514019847)
,p_db_column_name=>'VLOR_TTAL_DCMNTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor Total Documento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21928754513019849)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Fecha Vencimiento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21929156108019849)
,p_db_column_name=>'DSCRPCION_INDCDOR_PGO_APLCDO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('\00BFPago Aplicado?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21979511288478501)
,p_db_column_name=>'IMPRIMIR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Imprimir'
,p_column_link=>'f?p=&APP_ID.:280:&SESSION.::&DEBUG.:280:P280_ID_DCMNTO,P280_NMBRE_RPRTE:#ID_DCMNTO#,#NMRO_DCMNTO##P244_ID_CMNTO#'
,p_column_linktext=>'<span class="fa fa-print" aria-hidden="true"></span>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(43517940195953795)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'219295'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_IMPSTO:NMRO_DCMNTO:FCHA_DCMNTO:DSCRPCION_DCMNTO_TPO:VLOR_TTAL_DCMNTO:FCHA_VNCMNTO:DSCRPCION_INDCDOR_PGO_APLCDO:IMPRIMIR:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69926859502607899)
,p_plug_name=>unistr('<b>T\00EDtulos Registrados </b>')
,p_region_name=>'titulos'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   a.id_ttlo_jdcial',
'        ,a.cdgo_clnte',
'        ,a.id_ttlo_jdcial_crgdo',
'        ,a.nmro_ttlo_jdcial',
'        ,a.fcha_cnsttcion',
'        ,a.vlor',
'        ,decode(a.id_ttlo_jdcial_area,a.id_ttlo_jdcial_area, c.nmbre_area , ''-'') as id_ttlo_jdcial_area',
'        ,decode(a.cdgo_idntfccion_tpo_dmnddo, a.cdgo_idntfccion_tpo_dmnddo, b.dscrpcion_idntfccion_tpo, ''-'') as cdgo_idntfccion_tpo_dmnddo',
'        ,a.idntfccion_dmnddo',
'        ,a.nmbre_dmnddo',
'        ,a.nmro_ttlo_pdre',
'        ,a.id_ttlo_pdre',
'        ,a.cdgo_entdad_cnsgnnte||'' - ''||d.nmbre_bnco as cdgo_entdad_cnsgnnte',
'        ,a.id_bnco_cnsgnnte',
'        ,decode(a.cdgo_ttlo_jdcial_estdo, a.cdgo_ttlo_jdcial_estdo, f.dscrpcion, ''-'') as cdgo_ttlo_jdcial_estdo',
'        ,a.cdgo_ttlo_jdcial_estdo as ttlo_jdcial_estdo',
'        ,a.id_embrgo_rslcion',
'        ,a.id_instncia_fljo_pdre',
'        ,a.id_instncia_fljo',
'        ,a.id_slctud',
'        ,a.cdgo_entdad_rcddr||'' - ''||e.nmbre_bnco as cdgo_entdad_rcddr',
'        ,a.id_bnco_rcddr',
'        ,a.cnsctvo_embrgo        ',
'from gf_g_titulos_judicial a',
'join df_s_identificaciones_tipo b on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo_dmnddo',
'join df_c_areas c on c.id_area = a.id_ttlo_jdcial_area',
'join df_c_bancos d on d.id_bnco = a.id_bnco_cnsgnnte',
'join df_c_bancos e on e.id_bnco = a.id_bnco_rcddr',
'left join gf_d_titulos_judicial_estdo f on f.cdgo_ttlo_jdcial_estdo = a.cdgo_ttlo_jdcial_estdo',
'--left join v_gf_g_titulos_jdcial_dcmnto c on a.id_ttlo_jdcial = c.id_ttlo_jdcial',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5543775129032417)
,p_name=>'Actos'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver Actos'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>320
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" >Actos',
'<span class="fa fa-external-link-square"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:2025031:&SESSION.::&DEBUG.:RP,2025031:P2025031_ID_TTLO_JDCIAL,P2025031_NMRO_TTLO_JDCIAL:&ID_TTLO_JDCIAL.,&NMRO_TTLO_JDCIAL.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22494493506648301)
,p_name=>'TTLO_JDCIAL_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TTLO_JDCIAL_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>270
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(69926997332607901)
,p_name=>'ID_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL'
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
 p_id=>wwv_flow_api.id(69927142879607902)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(69927226085607903)
,p_name=>'ID_TTLO_JDCIAL_CRGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_CRGDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(69927320405607904)
,p_name=>'NMRO_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_JDCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('N\00FAmero T\00EDtulo<br>Judicial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(69927426939607905)
,p_name=>'FCHA_CNSTTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CNSTTCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Fecha<br>Constituci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(69927564910607906)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(69927810563607909)
,p_name=>'ID_TTLO_JDCIAL_AREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_AREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('\00C1rea')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(69927978244607911)
,p_name=>'IDNTFCCION_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Identificaci\00F3n<br>Demandado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(69928097153607912)
,p_name=>'NMBRE_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Nombre<br>Demandado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(69928265222607913)
,p_name=>'NMRO_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_PDRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('N\00FAmero T\00EDtulo<br>Judicial Padre')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(69928315237607914)
,p_name=>'ID_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_PDRE'
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
 p_id=>wwv_flow_api.id(69928434924607915)
,p_name=>'CDGO_ENTDAD_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_CNSGNNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Entidad<br>Consignante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(69928534442607916)
,p_name=>'ID_BNCO_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_CNSGNNTE'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(69928661130607917)
,p_name=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Estado T\00EDtulo<br>Judicial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Consignar;CNS,Devolver;DVL,Fraccionar;FRC,Rechazar;RCH'
,p_lov_display_extra=>true
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(69928690026607918)
,p_name=>'ID_EMBRGO_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGO_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
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
 p_id=>wwv_flow_api.id(69928791639607919)
,p_name=>'ID_INSTNCIA_FLJO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO_PDRE'
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
 p_id=>wwv_flow_api.id(69928956063607920)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
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
 p_id=>wwv_flow_api.id(69929024218607921)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Id Solicitud<br>PQR'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'CENTER'
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
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(69929145862607922)
,p_name=>'CDGO_ENTDAD_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_RCDDR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Entidad<br>Recaudadora'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(69929189782607923)
,p_name=>'ID_BNCO_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_RCDDR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(70074839636263706)
,p_name=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Tipo<br>Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(70103868346878028)
,p_name=>'CNSCTVO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNSCTVO_EMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'No. Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
,p_value_alignment=>'CENTER'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(69926951782607900)
,p_internal_uid=>69926951782607900
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'ACTIONS_MENU'
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
 p_id=>wwv_flow_api.id(69936021692632229)
,p_interactive_grid_id=>wwv_flow_api.id(69926951782607900)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(69936119529632231)
,p_report_id=>wwv_flow_api.id(69936021692632229)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5555707954427486)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>29
,p_column_id=>wwv_flow_api.id(5543775129032417)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22500385986648849)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(22494493506648301)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53229636997078482)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(70074839636263706)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69936647053632233)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(69926997332607901)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69937174582632235)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(69927142879607902)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69937592454632236)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(69927226085607903)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69938126643632238)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(69927320405607904)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69938664275632240)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(69927426939607905)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>88
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69939160615632241)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(69927564910607906)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69940615066632246)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(69927810563607909)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69941670783632249)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(69927978244607911)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69942100722632250)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(69928097153607912)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>163
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69942640418632252)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(69928265222607913)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69943139471632253)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(69928315237607914)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69943616501632255)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(69928434924607915)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69944086286632256)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(69928534442607916)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69944663241632258)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(69928661130607917)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>154
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69945104123632259)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(69928690026607918)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69945593967632261)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(69928791639607919)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69946175560632264)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(69928956063607920)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69946608950632266)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(69929024218607921)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>76
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69947176448632268)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(69929145862607922)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>131
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(69947591818632270)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(69929189782607923)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70201540817781438)
,p_view_id=>wwv_flow_api.id(69936119529632231)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(70103868346878028)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(193392361881690804)
,p_plug_name=>'<b>Deuda</b>'
,p_region_name=>'deuda'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.*,c.nmbre as scrsal',
'  from (',
'            select a.cdgo_mvmnto_orgn,',
'                    a.id_orgen,',
'                    pkg_gf_movimientos_financiero.fnc_co_dscrpcion_mvmnto_fnncro( p_id_mvmnto_fncro => a.id_mvmnto_fncro ) as dscrpcion_orgen,',
'                    a.vgncia, ',
'                    a.prdo,',
'                    --a.fcha_vncmnto,',
'                    case when a.cdgo_mvnt_fncro_estdo = ''AN'' and :P244_INDCDOR_FSCA = ''S'' then ''NO'' else a.cdgo_mvnt_fncro_estdo end as cdgo_mvnt_fncro_estdo,',
'                    a.dscrpcion_indcdor_mvmnto_blqdo,',
'                    a.dscrpcion_mvnt_fncro_estdo,',
'                    to_char(sum(a.vlor_sldo_cptal),:F_FRMTO_MNDA)    vlor_sldo_cptal, ',
'                    to_char(sum(a.vlor_intres),:F_FRMTO_MNDA)        vlor_intres, ',
'                    to_char(sum(a.vlor_ttal),:F_FRMTO_MNDA)          vlor_ttal ',
'               from table (pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto (p_cdgo_clnte 			            => :F_CDGO_CLNTE,',
'                                                                                 p_id_impsto                        => :P244_ID_IMPSTO,',
'                                                                                 p_id_impsto_sbmpsto                => :P244_ID_IMPSTO_SBMPSTO,',
'                                                                                 p_id_sjto_impsto                   => :P244_ID_SJTO_IMPSTO,',
'                                                                                 p_fcha_vncmnto                     => to_date(:P244_FCHA_VNCMNTO,''DD/MM/YYYY'')))a',
'            where a.CDGO_MVNT_FNCRO_ESTDO <> ''AN''',
'            group by a.cdgo_mvmnto_orgn,',
'                    a.id_orgen,',
'                    pkg_gf_movimientos_financiero.fnc_co_dscrpcion_mvmnto_fnncro( p_id_mvmnto_fncro => a.id_mvmnto_fncro ),',
'                    a.vgncia, ',
'                    a.prdo,',
'                    --a.fcha_vncmnto,',
'                    a.cdgo_mvnt_fncro_estdo,',
'                    a.dscrpcion_indcdor_mvmnto_blqdo,',
'                    a.dscrpcion_mvnt_fncro_estdo',
'            order by ( case when sum(a.vlor_ttal)  = 0 then 1 else 0 end )',
'                   , a.vgncia desc',
'                   , a.prdo desc',
'     ) a',
'     ',
'     left join gi_g_liquidaciones b',
'    on b.id_lqdcion = a.id_orgen',
'  left join si_i_sujetos_sucursal c',
'    on b.id_sjto_scrsal = c.id_sjto_scrsal',
'    where a.vgncia in (select distinct x.vgncia',
'                        from gf_g_titulos_jdcial_vgncia x',
'                        join gf_g_titulos_jdcial_impsto y on y.id_ttlo_jdcial_impsto = x.id_ttlo_jdcial_impsto',
'                        where y.id_ttlo_jdcial = NVL(:P244_ID_TTLO_JDCIAL, json_value(:P244_JSON_TTLOS, ''$.ID_TTLO_JDCIAL''))',
'                          and y.id_sjto_impsto = :P244_ID_SJTO_IMPSTO)',
'    and a.prdo in (select distinct z.prdo',
'                        from gf_g_titulos_jdcial_vgncia x',
'                        join gf_g_titulos_jdcial_impsto y on y.id_ttlo_jdcial_impsto = x.id_ttlo_jdcial_impsto',
'                        join df_i_periodos z on z.id_prdo = x.id_prdo',
'                        where y.id_ttlo_jdcial = NVL(:P244_ID_TTLO_JDCIAL, json_value(:P244_JSON_TTLOS, ''$.ID_TTLO_JDCIAL''))',
'                          and y.id_sjto_impsto = :P244_ID_SJTO_IMPSTO',
'                          and x.vgncia = a.vgncia)',
'    /*',
'    ',
'    select a.*,c.nmbre as scrsal',
'  from (',
'            select a.cdgo_mvmnto_orgn,',
'                    a.id_orgen,',
'                    pkg_gf_movimientos_financiero.fnc_co_dscrpcion_mvmnto_fnncro( p_id_mvmnto_fncro => a.id_mvmnto_fncro ) as dscrpcion_orgen,',
'                    a.vgncia, ',
'                    a.prdo,',
'                    --a.fcha_vncmnto,',
'                    case when a.cdgo_mvnt_fncro_estdo = ''AN'' and :P244_INDCDOR_FSCA = ''S'' then ''NO'' else a.cdgo_mvnt_fncro_estdo end as cdgo_mvnt_fncro_estdo,',
'                    a.dscrpcion_indcdor_mvmnto_blqdo,',
'                    a.dscrpcion_mvnt_fncro_estdo,',
'                    to_char(sum(a.vlor_sldo_cptal),:F_FRMTO_MNDA)    vlor_sldo_cptal, ',
'                    to_char(sum(a.vlor_intres),:F_FRMTO_MNDA)        vlor_intres, ',
'                    to_char(sum(a.vlor_ttal),:F_FRMTO_MNDA)          vlor_ttal',
'                    --,e.cnsctvo_embrgo  ',
'               from table (pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto (p_cdgo_clnte 			            => :F_CDGO_CLNTE,',
'                                                                                 p_id_impsto                        => :P244_ID_IMPSTO,',
'                                                                                 p_id_impsto_sbmpsto                => :P244_ID_IMPSTO_SBMPSTO,',
'                                                                                 p_id_sjto_impsto                   => :P244_ID_SJTO_IMPSTO,',
'                                                                                 p_fcha_vncmnto                     => to_date(:P244_FCHA_VNCMNTO,''DD/MM/YYYY'')))a',
'                /*left join mc_g_embargos_cartera_detalle d on  d.id_sjto_impsto = :P244_ID_SJTO_IMPSTO',
'                                                          and d.vgncia = a.vgncia',
'                                                          and d.id_orgen = a.id_orgen',
'                left join v_mc_g_embargos_resolucion e on e.id_embrgos_crtra = d.id_embrgos_crtra',
'                                                       and e.cdgo_estdos_crtra = ''E''*//*',
'            where a.CDGO_MVNT_FNCRO_ESTDO <> ''AN''',
'            group by a.cdgo_mvmnto_orgn,',
'                    a.id_orgen,',
'                    pkg_gf_movimientos_financiero.fnc_co_dscrpcion_mvmnto_fnncro( p_id_mvmnto_fncro => a.id_mvmnto_fncro ),',
'                    a.vgncia, ',
'                    a.prdo,',
'                    --a.fcha_vncmnto,',
'                    a.cdgo_mvnt_fncro_estdo,',
'                    a.dscrpcion_indcdor_mvmnto_blqdo,',
'                    a.dscrpcion_mvnt_fncro_estdo',
'                    --,e.cnsctvo_embrgo',
'            order by ( case when sum(a.vlor_ttal)  = 0 then 1 else 0 end )',
'                   , a.vgncia desc',
'                   , a.prdo desc',
'     ) a',
'     ',
'     left join gi_g_liquidaciones b',
'    on b.id_lqdcion = a.id_orgen',
'  left join si_i_sujetos_sucursal c',
'    on b.id_sjto_scrsal = c.id_sjto_scrsal',
'    where a.vgncia in (select distinct x.vgncia',
'                        from gf_g_titulos_jdcial_vgncia x',
'                        join gf_g_titulos_jdcial_impsto y on y.id_ttlo_jdcial_impsto = x.id_ttlo_jdcial_impsto',
'                        where y.id_ttlo_jdcial = NVL(json_value(:P244_JSON_TTLOS, ''$.ID_TTLO_JDCIAL''),:P244_ID_TTLO_JDCIAL)',
'                          and y.id_sjto_impsto = :P244_ID_SJTO_IMPSTO',
'                        )',
'    and a.prdo in (select distinct z.prdo',
'                        from gf_g_titulos_jdcial_vgncia x',
'                        join gf_g_titulos_jdcial_impsto y on y.id_ttlo_jdcial_impsto = x.id_ttlo_jdcial_impsto',
'                        join df_i_periodos z on z.id_prdo = x.id_prdo',
'                        where y.id_ttlo_jdcial = NVL(json_value(:P244_JSON_TTLOS, ''$.ID_TTLO_JDCIAL''),:P244_ID_TTLO_JDCIAL)',
'                          and y.id_sjto_impsto = :P244_ID_SJTO_IMPSTO',
'                          and x.vgncia = a.vgncia ',
'                        )*/',
'                   ;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_acto',
'from gf_g_titulos_jdcial_dcmnto a',
'join gf_g_ttls_jdcl_dcmnt_asccn ab on ab.id_ttlo_jdcial_dcmnto = a.id_ttlo_jdcial_dcmnto',
'join gf_g_titulos_judicial  b on ab.id_ttlo_jdcial = b.id_ttlo_jdcial',
'where b.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.id_acto_tpo = (select x.id_acto_tpo',
'                       from gn_d_actos_tipo x',
'                      where x.cdgo_acto_tpo = ''ATJ'')',
'and 1=2;'))
,p_plug_read_only_when_type=>'ALWAYS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18777044004277201)
,p_name=>'CDGO_MVNT_FNCRO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVNT_FNCRO_ESTDO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(28059822165799947)
,p_name=>'DSCRPCION_INDCDOR_MVMNTO_BLQDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_INDCDOR_MVMNTO_BLQDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFMovimiento<br>Bloqueado?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(47422942831101319)
,p_name=>'SCRSAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCRSAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Sucursal'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(65029794823953530)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('C\00F3digo Origen')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(65029909817953531)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00FAmero Origen')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(68401878071018040)
,p_name=>'DSCRPCION_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>unistr('Descripci\00F3n Origen')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attribute_01=>'&DSCRPCION_ORGEN.'
,p_link_target=>'#'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(186764002730364099)
,p_name=>'DSCRPCION_MVNT_FNCRO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_MVNT_FNCRO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(186764103447364100)
,p_name=>'+ Cartera'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<button style="color:green" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton "  title="M\00E1s Detalle" >'),
'<span class="fa fa-plus-square-o"></span>',
'</button>',
'',
'',
''))
,p_link_target=>'f?p=&APP_ID.:247:&SESSION.::&DEBUG.:RP,247:P247_ID_SJTO_IMPSTO,P247_VGNCIA,P247_PRDO,P247_FCHA_VNCMNTO,P247_ID_ORGEN:&P244_ID_SJTO_IMPSTO.,&VGNCIA.,&PRDO.,&P244_FCHA_VNCMNTO.,&ID_ORGEN.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(189122829168013793)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(193393453159690815)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(193393566468690816)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(193393614429690817)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(193393700678690818)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(193393832572690819)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>4000
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(193393343982690814)
,p_internal_uid=>193393343982690814
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
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(198380458239757566)
,p_interactive_grid_id=>wwv_flow_api.id(193393343982690814)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(198380568908757567)
,p_report_id=>wwv_flow_api.id(198380458239757566)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17780174487874282)
,p_view_id=>wwv_flow_api.id(198380568908757567)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(47422942831101319)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>67
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18783072566277600)
,p_view_id=>wwv_flow_api.id(198380568908757567)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(18777044004277201)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34114242500751297)
,p_view_id=>wwv_flow_api.id(198380568908757567)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(28059822165799947)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(65116905435218074)
,p_view_id=>wwv_flow_api.id(198380568908757567)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(65029794823953530)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(65117452003218096)
,p_view_id=>wwv_flow_api.id(198380568908757567)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(65029909817953531)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>133
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(73554521684122249)
,p_view_id=>wwv_flow_api.id(198380568908757567)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(68401878071018040)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>215
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(198381003239757578)
,p_view_id=>wwv_flow_api.id(198380568908757567)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(193393453159690815)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(198381401384757613)
,p_view_id=>wwv_flow_api.id(198380568908757567)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(193393566468690816)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>71
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(198381982613757615)
,p_view_id=>wwv_flow_api.id(198380568908757567)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(193393614429690817)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>131
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(198382422555757616)
,p_view_id=>wwv_flow_api.id(198380568908757567)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(193393700678690818)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(198382903352757618)
,p_view_id=>wwv_flow_api.id(198380568908757567)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(193393832572690819)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(199078324537447155)
,p_view_id=>wwv_flow_api.id(198380568908757567)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(186764002730364099)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>93
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(199097178842482744)
,p_view_id=>wwv_flow_api.id(198380568908757567)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(186764103447364100)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>48
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(17778649880841261)
,p_view_id=>wwv_flow_api.id(198380568908757567)
,p_execution_seq=>5
,p_name=>'Bloqueada'
,p_background_color=>'#F5D5D8'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(28059822165799947)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>unistr('S\00ED')
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(17778718328841217)
,p_view_id=>wwv_flow_api.id(198380568908757567)
,p_execution_seq=>10
,p_name=>'Convenio'
,p_background_color=>'#FBFFBF'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(186764002730364099)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'Convenio'
,p_is_enabled=>true
);
end;
/
begin
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(17779438907849070)
,p_view_id=>wwv_flow_api.id(198380568908757567)
,p_execution_seq=>15
,p_name=>'Anulada'
,p_background_color=>'#DEDBDE'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(186764002730364099)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'Anulada'
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_filter(
 p_id=>wwv_flow_api.id(17778680334841227)
,p_report_id=>wwv_flow_api.id(198380458239757566)
,p_type=>'COLUMN'
,p_column_id=>wwv_flow_api.id(193393614429690817)
,p_operator=>'NEQ'
,p_is_case_sensitive=>false
,p_expression=>'$0'
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(267981382032101819)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'Esta funcionalidad permite:<br><br>',
unistr('Proyectar la aplicaci\00F3n del T\00EDtulo Judicial.<br><br>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(427479396569929227)
,p_plug_name=>unistr('<b>Proceso Puntual T\00EDtulo Judicial No. &P244_NMRO_TTLO_JDCIAL.</b>')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(642024160833277339)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(15732989963677948)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(642024160833277339)
,p_button_name=>'REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:249:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15733319565677955)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(642024160833277339)
,p_button_name=>'BTN_GNRAR_ACTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Acto'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_acto ',
'from v_gf_g_titulos_jdcial_dcmnto ',
'where id_ttlo_jdcial = :P244_ID_TTLO_JDCIAL'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18516830013296538)
,p_button_sequence=>240
,p_button_plug_id=>wwv_flow_api.id(642024160833277339)
,p_button_name=>'BTN_VER_ACTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Ver Acto'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P244_ID_ACTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21900520795322404)
,p_button_sequence=>250
,p_button_plug_id=>wwv_flow_api.id(642024160833277339)
,p_button_name=>'BTN_GNRAR_DCMNTOS'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Generar Documentos'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''¿Esta seguro que desea generar los documentos de pago?'', ''BTN_GNRAR_DCMNTOS'');'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from gf_g_ttls_jdcl_impsto_dcmnt a',
'  join gf_g_titulos_judicial b',
'    on b.id_ttlo_jdcial = a.id_ttlo_jdcial',
'   and b.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'  join v_re_g_documentos c',
'    on c.id_dcmnto = a.id_dcmnto',
' fetch first row only'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-newspaper-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18214222714920672)
,p_button_sequence=>240
,p_button_plug_id=>wwv_flow_api.id(193392361881690804)
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
,p_grid_column=>11
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(17784932495841284)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(193392361881690804)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(17785396676841298)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(193392361881690804)
,p_button_name=>'BTN_SIGUIENTE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(15735042076693220)
,p_branch_name=>'Ir a Pagina 253 Generar Acto'
,p_branch_action=>'f?p=&APP_ID.:253:&SESSION.::&DEBUG.:RP,253:P253_PAGINA,P253_CDGO_TTLO_JDCIAL_ESTDO,P253_JSON_PAGINA,P253_ID_INSTNCIA_FLJO:&APP_PAGE_ID.,&P244_CDGO_TTLO_JDCIAL_ESTDO.,&P244_JSON.,&F_ID_INSTNCIA_FLJO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(15733319565677955)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(18517085861297793)
,p_branch_name=>unistr('Ir a P\00E1gina 127 Ver Acto')
,p_branch_action=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR,P127_COLUMNA_FILENAME:v_gn_g_actos,file_blob,file_mimetype,id_acto,&P244_ID_ACTO.,file_name&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(18516830013296538)
,p_branch_sequence=>50
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P244_ID_ACTO'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(17829593171638578)
,p_branch_name=>'Ir a Pagina 261 Deuda Proyectada'
,p_branch_action=>'f?p=&APP_ID.:261:&SESSION.::&DEBUG.:RP,261:P261_FCHA_VNCMNTO,P261_ID_SJTO_IMPSTO:&P244_FCHA_VNCMNTO.,&P244_ID_SJTO_IMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(17785396676841298)
,p_branch_sequence=>60
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15964007837764232)
,p_name=>'P244_ID_SJTO_IMPSTO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(193392361881690804)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15964172913764233)
,p_name=>'P244_ID_IMPSTO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(193392361881690804)
,p_prompt=>'<b>Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'  join gf_g_titulos_jdcial_impsto b on b.id_impsto = a.id_impsto',
'  join gf_g_titulos_judicial c on c.id_ttlo_jdcial = b.id_ttlo_jdcial',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'  and c.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'  and c.id_ttlo_jdcial = :P244_ID_TTLO_JDCIAL',
'group by b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'',',
'         a.id_impsto',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_colspan=>3
,p_grid_column=>3
,p_read_only_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15964298820764234)
,p_name=>'P244_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(193392361881690804)
,p_prompt=>'<b>Sub Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.nmbre_impsto_sbmpsto d,',
'        a.id_impsto_sbmpsto  r',
'   from df_i_impuestos_subimpuesto a',
'   join gf_g_titulos_jdcial_impsto b on b.id_impsto_sbmpsto = a.id_impsto_sbmpsto',
'   join gf_g_titulos_judicial c on c.id_ttlo_jdcial = b.id_ttlo_jdcial',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and b.id_impsto = :P244_ID_IMPSTO ',
'    and c.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'    and c.id_ttlo_jdcial = :P244_ID_TTLO_JDCIAL',
'  group by a.nmbre_impsto_sbmpsto,',
'           a.id_impsto_sbmpsto',
'  order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P244_ID_IMPSTO'
,p_ajax_items_to_submit=>'P244_ID_IMPSTO,P244_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>7
,p_read_only_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17785716955841302)
,p_name=>'P244_VLOR_TTAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(193392361881690804)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17786130376841316)
,p_name=>'P244_VGNCIA_PRDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(193392361881690804)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17916015916539608)
,p_name=>'P244_FCHA_LMTE_CLNDRIO'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(193392361881690804)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17916970018546144)
,p_name=>'P244_FCHA_VNCMNTO_OBLGCION'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(193392361881690804)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17925505122565325)
,p_name=>'P244_FCHA_VNCMNTO'
,p_is_required=>true
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(193392361881690804)
,p_item_default=>'select pk_util_calendario.fnc_cl_antrior_dia_habil(p_cdgo_clnte => :F_CDGO_CLNTE, p_fecha => last_day(sysdate)) from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'<b>Fecha Vencimiento</b>'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_cMaxlength=>10
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>7
,p_read_only_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'+0d'
,p_attribute_03=>'&P244_FCHA_LMTE_CLNDRIO.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18029311531044607)
,p_name=>'P244_IDNTFCCION_DMNDDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(69926859502607899)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18029745646044611)
,p_name=>'P244_ID_TTLO_JDCIAL'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(69926859502607899)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18216334960944201)
,p_name=>'P244_IDNTFCCION'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(193392361881690804)
,p_prompt=>unistr('<b>Identificaci\00F3n</b>')
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.idntfccion_sjto d, a.idntfccion_sjto r',
'  from v_si_i_sujetos_impuesto a',
'  join gf_g_titulos_jdcial_impsto b on b.id_sjto_impsto = a.id_sjto_impsto',
'  join gf_g_titulos_judicial c on c.id_ttlo_jdcial = b.id_ttlo_jdcial',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and b.id_impsto = :P244_ID_IMPSTO ',
'   and b.id_impsto_sbmpsto = :P244_ID_IMPSTO_SBMPSTO',
'   --and (a.idntfccion_sjto = :P244_IDNTFCCION or a.idntfccion_antrior = :P244_IDNTFCCION or a.mtrcla_inmblria = :P244_IDNTFCCION)',
'   and a.id_sjto_estdo = 1',
'   and c.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'   group by a.idntfccion_sjto;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P244_ID_IMPSTO,P244_ID_IMPSTO_SBMPSTO'
,p_ajax_items_to_submit=>'P244_ID_IMPSTO,P244_ID_IMPSTO_SBMPSTO,P244_IDNTFCCION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_colspan=>3
,p_grid_column=>3
,p_read_only_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18432554535205701)
,p_name=>'P244_RSPSTA'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(193392361881690804)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18516511949289572)
,p_name=>'P244_ID_ACTO'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(69926859502607899)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18652990872609301)
,p_name=>'P244_JSON_TTLOS'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(69926859502607899)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18653085414609302)
,p_name=>'P244_JSON_CNSGNR'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(69926859502607899)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18784489122295422)
,p_name=>'P244_INDCDOR_FSCA'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(193392361881690804)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19293572445510101)
,p_name=>'P244_ID_ACTO_TPO'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(69926859502607899)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21504606069536201)
,p_name=>'P244_NMRO_TTLO_JDCIAL'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(69926859502607899)
,p_prompt=>'Nmro Ttlo Jdcial'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21900211655322401)
,p_name=>'P244_FCHA_PRYCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(43110008901147239)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21920683529008201)
,p_name=>'P244_CDGO_TTLO_JDCIAL_ESTDO'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(69926859502607899)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21979610284478502)
,p_name=>'P244_ID_RPRTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(43486657311822586)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(17916526971541767)
,p_computation_sequence=>30
,p_computation_item=>'P244_FCHA_LMTE_CLNDRIO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select pkg_re_documentos.fnc_vl_fcha_mxma_tsas_mra (:F_CDGO_CLNTE, ',
'                                                    :P244_ID_IMPSTO, ',
'                                                    to_date(:P244_FCHA_VNCMNTO,''DD/MM/YY''), ',
'                                                    to_date(:P244_FCHA_VNCMNTO_OBLGCION,''DD/MM/YY''), ',
'                                                    :P244_ID_IMPSTO_SBMPSTO) fcha_vlda',
'from dual;*/',
'     ',
'select pkg_re_documentos.fnc_vl_fcha_mxma_tsas_mra (:F_CDGO_CLNTE, ',
'                                                    :P244_ID_IMPSTO, ',
'                                                    to_date(:P244_FCHA_VNCMNTO,''DD/MM/YY''), ',
'                                                    to_date(:P244_FCHA_VNCMNTO_OBLGCION,''DD/MM/YY'')',
'                                                   )  as fcha_vlda',
'from dual;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(17917183585547649)
,p_computation_sequence=>30
,p_computation_item=>'P244_FCHA_VNCMNTO_OBLGCION'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select min(fcha_vncmnto)',
'   from table (pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto (p_cdgo_clnte 			            => :F_CDGO_CLNTE,',
'                                                                     p_id_impsto                        => :P244_ID_IMPSTO,',
'                                                                     p_id_impsto_sbmpsto                => :P244_ID_IMPSTO_SBMPSTO,',
'                                                                     p_id_sjto_impsto                   => :P244_ID_SJTO_IMPSTO,',
'                                                                     p_fcha_vncmnto                     => :P244_FCHA_VNCMNTO) )a',
'',
'   join apex_collections b on collection_name = ''VGNCIA_PRDO_PGO'' ',
'     and b.n001 = a.vgncia ',
'     and b.n002 = a.prdo',
'     and b.n003 = a.id_orgen'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(21979739818478503)
,p_computation_sequence=>40
,p_computation_item=>'P244_ID_RPRTE'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_rprte    r',
'  from gn_d_reportes a',
' where a.cdgo_rprte_grpo = ''RPG''  ',
'   and a.indcdor_gnrco   = ''S'' ',
'fetch first 1 rows only  ;',
''))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(18216484763944202)
,p_computation_sequence=>10
,p_computation_item=>'P244_ID_SJTO_IMPSTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_sjto_impsto ',
'from v_si_i_sujetos_impuesto a ',
'where a.idntfccion_sjto = :P244_IDNTFCCION',
';'))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(5596716573958702)
,p_computation_sequence=>20
,p_computation_item=>'P244_ID_ACTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_acto ',
'from v_gf_g_titulos_jdcial_dcmnto a',
'join gn_d_actos_tipo b on b.id_acto_tpo = a.id_acto_tpo',
'where id_ttlo_jdcial = :P242_ID_TTLO_JDCIAL',
'and b.cdgo_acto_tpo = ''ATJ'' ',
''))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(19293673650510102)
,p_computation_sequence=>30
,p_computation_item=>'P244_ID_ACTO_TPO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_acto_tpo',
'from gn_d_actos_tipo ',
unistr('where id_prcso = (select id_prcso from df_s_procesos where nmbre = ''T\00EDtulo Judicial Puntual'')'),
'and cdgo_acto_tpo = :P244_CDGO_TTLO_JDCIAL_ESTDO;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(17835227216645599)
,p_validation_name=>'Validar si Existen Vigencias seleccionadas con deuda mayor a 0'
,p_validation_sequence=>20
,p_validation=>'P244_VLOR_TTAL'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>'Debe seleccionar vigencias con deuda superior a cero (0).'
,p_when_button_pressed=>wwv_flow_api.id(17785396676841298)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(18214591509925212)
,p_validation_name=>'Validar Impuesto'
,p_validation_sequence=>30
,p_validation=>'P244_ID_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe selecccionar un impuesto'
,p_when_button_pressed=>wwv_flow_api.id(18214222714920672)
,p_associated_item=>wwv_flow_api.id(15964172913764233)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(18216190054935036)
,p_validation_name=>unistr('identificaci\00F3n no nula')
,p_validation_sequence=>40
,p_validation=>'P244_IDNTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por favor ingrese un identificaci\00F3n para consultar')
,p_when_button_pressed=>wwv_flow_api.id(18214222714920672)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(15963260437764224)
,p_name=>'Al cambiar Tipo de Recibo'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P244_VLOR_ABNO'
,p_condition_element=>'P244_CDGO_RCBO_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'DAB'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15963315341764225)
,p_event_id=>wwv_flow_api.id(15963260437764224)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P244_VLOR_ABNO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15963486817764226)
,p_event_id=>wwv_flow_api.id(15963260437764224)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P244_VLOR_ABNO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(15963793082764229)
,p_name=>'Al cambiar el tipo de recibo'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P244_CDGO_RCBO_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15963827291764230)
,p_event_id=>wwv_flow_api.id(15963793082764229)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(17835483700662559)
,p_name=>unistr('Al seleccionar Calcular total Deuda Seleccionada regi\00F3n')
,p_event_sequence=>100
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(193392361881690804)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(17835899507662635)
,p_event_id=>wwv_flow_api.id(17835483700662559)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculaTotal();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(17912578660497432)
,p_name=>unistr('Al cambiar la fecha y el tipo de recibo se refresca la regi\00F3n de deuda proyectada')
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P244_FCHA_VNCMNTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(17912916334497455)
,p_event_id=>wwv_flow_api.id(17912578660497432)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    APEX_UTIL.SET_SESSION_STATE(''P244_FCHA_VNCMNTO'',:P244_FCHA_VNCMNTO);',
'    --APEX_UTIL.SET_SESSION_STATE(''P244_CDGO_RCBO_TPO'',:P244_CDGO_RCBO_TPO);',
'',
'--APEX_UTIL.SET_SESSION_STATE(''P244_CDGO_RCBO_TPO'',:P244_CDGO_RCBO_TPO);',
'',
' select sum (a.vlor_sldo_cptal) + sum (a.vlor_intres) - sum (a.vlor_dscnto)   vlor_ttal',
'   into :P244_VLOR_TTAL',
'   from (select a.cdgo_mvmnto_orgn,',
'				a.id_orgen,',
'				a.vgncia, ',
'				a.prdo,',
'				a.fcha_vncmnto,',
'				a.dscrpcion_mvnt_fncro_estdo,',
'				a.id_cncpto,',
'				a.vlor_sldo_cptal, ',
'				a.vlor_intres, ',
'				case when :P244_CDGO_RCBO_TPO = ''DNO'' then ',
'					nvl( ( select case when sum(vlor_dscnto) < a.vlor_sldo_cptal and sum(vlor_dscnto) > 0 then',
'										sum(vlor_dscnto)',
'									when sum(vlor_dscnto) > a.vlor_sldo_cptal and sum(vlor_dscnto) > 0 then',
'										a.vlor_sldo_cptal',
'								end as vlor_dscnto from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo( p_cdgo_clnte				=> :F_CDGO_CLNTE,',
'																													p_id_impsto				=> :P244_ID_IMPSTO,',
'																													p_id_impsto_sbmpsto		=> :P244_ID_IMPSTO_SBMPSTO,',
'																													p_vgncia				=> a.vgncia,',
'																													p_id_prdo				=> a.id_prdo,',
'																													p_id_cncpto				=> a.id_cncpto,',
'																													p_id_sjto_impsto		=> :P244_ID_SJTO_IMPSTO,',
'																													p_fcha_pryccion			=> :P244_FCHA_VNCMNTO,',
'																													p_vlor					=> a.vlor_sldo_cptal,',
'																													p_cdna_vgncia_prdo_pgo	=> :P244_VGNCIA_PRDO,',
'																													p_cdna_vgncia_prdo_ps	=> null))),0)',
'					+',
'					nvl( ( select case when sum(vlor_dscnto) < a.vlor_intres and sum(vlor_dscnto) > 0 then',
'										sum(vlor_dscnto)',
'									when sum(vlor_dscnto) > a.vlor_intres and sum(vlor_dscnto) > 0 then',
'										a.vlor_intres',
'								end as vlor_dscnto from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo( p_cdgo_clnte				=> :F_CDGO_CLNTE,',
'																													p_id_impsto				=> :P244_ID_IMPSTO,',
'																													p_id_impsto_sbmpsto		=> :P244_ID_IMPSTO_SBMPSTO,',
'																													p_vgncia				=> a.vgncia,',
'																													p_id_prdo				=> a.id_prdo,',
'																													p_id_cncpto				=> a.id_cncpto_intres_mra,',
'																													p_id_sjto_impsto		=> :P244_ID_SJTO_IMPSTO,',
'																													p_fcha_pryccion			=> :P244_FCHA_VNCMNTO,',
'																													p_vlor					=> a.vlor_intres,',
'																													p_cdna_vgncia_prdo_pgo	=> :P244_VGNCIA_PRDO, ',
'																													p_cdna_vgncia_prdo_ps	=> null',
'                                                                                                                    -- Ley 2155',
'                                                                                                                  , p_cdgo_mvmnto_orgn  => a.cdgo_mvmnto_orgn',
'                                                                                                                  , p_id_orgen          => a.id_orgen',
'                                                                                                                  , p_vlor_cptal        => a.vlor_sldo_cptal',
'                                                                                                                  , P_ID_CNCPTO_BASE    => a.id_cncpto  ))),0)',
'					else ',
'						0',
'				end as vlor_dscnto',
'   from table (pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto(p_cdgo_clnte			=> :F_CDGO_CLNTE,',
'																	p_id_impsto				=> :P244_ID_IMPSTO,',
'																	p_id_impsto_sbmpsto		=> :P244_ID_IMPSTO_SBMPSTO,',
'																	p_id_sjto_impsto		=> :P244_ID_SJTO_IMPSTO,',
'																	p_fcha_vncmnto			=> :P244_FCHA_VNCMNTO) )a',
'	',
'   join apex_collections b on collection_name = ''VGNCIA_PRDO_PGO'' ',
'		and b.n001 = a.vgncia ',
'		and b.n002 = a.prdo',
'		and b.n003 = a.id_orgen',
'   ) a;',
'    ',
'END;'))
,p_attribute_02=>'P244_FCHA_VNCMNTO'
,p_attribute_03=>'P244_VLOR_TTAL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(17913442540497459)
,p_event_id=>wwv_flow_api.id(17912578660497432)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(193392361881690804)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18212931577902951)
,p_name=>unistr('Al cambiar el Valor del impuesto Refrescar la regi\00F3n de deuda')
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P244_ID_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18213326964903000)
,p_event_id=>wwv_flow_api.id(18212931577902951)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(193392361881690804)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18213722318903003)
,p_event_id=>wwv_flow_api.id(18212931577902951)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#P244_IDNTFCCION'').text(''Referencia/Matricula'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18214770521930751)
,p_name=>'Al cambiar el valor del Subimpuesto'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P244_ID_IMPSTO_SBMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18215154931930752)
,p_event_id=>wwv_flow_api.id(18214770521930751)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P244_ID_IMPSTO_SBMPSTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18215681627930752)
,p_event_id=>wwv_flow_api.id(18214770521930751)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(193392361881690804)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18658343224617915)
,p_name=>'Seleccionar Titulos'
,p_event_sequence=>140
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(69926859502607899)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18658750342618005)
,p_event_id=>wwv_flow_api.id(18658343224617915)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buildJsonTitulos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19810809343734702)
,p_name=>'Al cerrar la modal'
,p_event_sequence=>150
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19810964430734703)
,p_event_id=>wwv_flow_api.id(19810809343734702)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(642024160833277339)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(17834817987643027)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>unistr('Limpiar Cache de toda la P\00E1gina')
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'261'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(17784932495841284)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18254574939920079)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto Impuesto x BTN_CONSULTAR'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    v_estdo_blqdo_sjto      si_i_sujetos_impuesto.estdo_blqdo%type;',
'    v_id_sjto_estdo       si_i_sujetos_impuesto.id_sjto_estdo%type;',
'    ',
'begin',
'    select a.id_sjto_impsto, a.estdo_blqdo_sjto, a.id_sjto_estdo',
'      into v_id_sjto_impsto, v_estdo_blqdo_sjto, v_id_sjto_estdo',
'      from v_si_i_sujetos_impuesto a',
'      join gf_g_titulos_jdcial_impsto b on a.id_sjto_impsto = b.id_sjto_impsto',
'     where a.cdgo_clnte = :F_CDGO_CLNTE',
'       and a.id_impsto = :P244_ID_IMPSTO',
'       and b.id_impsto_sbmpsto = :P244_ID_IMPSTO_SBMPSTO',
'       and (a.idntfccion_sjto = :P244_IDNTFCCION or a.idntfccion_antrior = :P244_IDNTFCCION or a.mtrcla_inmblria = :P244_IDNTFCCION)',
'        and a.id_sjto_estdo = 1',
'        and b.id_ttlo_jdcial = NVL(:P244_ID_TTLO_JDCIAL, json_value(:P244_JSON_TTLOS, ''$.ID_TTLO_JDCIAL''));    ',
'    ',
'    if v_estdo_blqdo_sjto = ''N'' and v_id_sjto_estdo = 1 then ',
'',
'        :P244_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'        ',
'    elsif v_estdo_blqdo_sjto = ''S'' then',
'        :P244_RSPSTA := ''El sujeto impuesto ingresado se encuentra bloqueado'';',
'        :P244_ID_SJTO_IMPSTO := null;',
'        v_id_sjto_impsto    := null;',
'    elsif v_id_sjto_estdo != 1 then',
'        :P244_RSPSTA := ''El sujeto impuesto ingresado No se encuentra activo'';',
'        :P244_ID_SJTO_IMPSTO := null;',
'        v_id_sjto_impsto    := null;',
'    end if;',
'exception',
'    when no_data_found then ',
'    :P244_ID_SJTO_IMPSTO := null;',
'        v_id_sjto_impsto    := null;',
'    :P244_RSPSTA := ''No Existe el Sujeto Impuesto'';',
'end; '))
,p_process_error_message=>'&P244_RSPSTA. '
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(18214222714920672)
,p_process_success_message=>'&P244_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18254802809921575)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Cache de Id sujeto Impuesto'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P244_ID_SJTO_IMPSTO'
,p_process_error_message=>'&P244_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(18214222714920672)
,p_process_when=>':P244_ID_SJTO_IMPSTO IS NULL or :P244_ID_SJTO_IMPSTO = 0'
,p_process_when_type=>'SQL_EXPRESSION'
,p_process_success_message=>'&P244_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18783954302292831)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Indicador Fiscalizaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    :P244_INDCDOR_FSCA := pkg_fi_fiscalizacion.fnc_co_indicador_fisca(p_cdgo_clnte	     => :F_CDGO_CLNTE,',
'                                                                     p_id_impsto         => :P244_ID_IMPSTO,',
'                                                                     p_id_impsto_sbmpsto => :P244_ID_IMPSTO_SBMPSTO,',
'                                                                     p_id_sjto_tpo       => :P244_ID_SJTO_IMPSTO);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(18214222714920672)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21900672489322405)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Documentos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number; ',
'    v_mnsje_rspsta   varchar2(1000);',
'begin',
'     ',
'        pkg_gf_titulos_judicial.prc_rg_documentos_titulos(  p_cdgo_clnte	    =>    :F_CDGO_CLNTE,',
'                                                            p_id_ttlo_jdcial    =>    :P244_ID_TTLO_JDCIAL,',
'                                                            p_json_ttlos        =>    :P244_JSON_TTLOS,',
'                                                            p_id_usrio          =>    :F_ID_USRIO, ',
'                                                            o_cdgo_rspsta	    =>    v_cdgo_rspsta,',
'                                                            o_mnsje_rspsta	    =>    v_mnsje_rspsta);',
'        if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, v_mnsje_rspsta);',
'                   apex_error.add_error (  p_message          => v_mnsje_rspsta,',
'                                            p_display_location => apex_error.c_inline_in_notification );',
'        end if;',
' ',
'end;'))
,p_process_error_message=>unistr('\00A1Documentos No Generados!')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(21900520795322404)
,p_process_success_message=>unistr('\00A1Documentos Generados Exitosamente!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(15734079529681607)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargue de Datos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     select idntfccion_dmnddo',
'            , id_ttlo_jdcial',
'            ,nmro_ttlo_jdcial',
'            ,cdgo_ttlo_jdcial_estdo',
'        into :P244_IDNTFCCION_DMNDDO',
'            ,:P244_ID_TTLO_JDCIAL',
'            ,:P244_NMRO_TTLO_JDCIAL',
'            ,:P244_CDGO_TTLO_JDCIAL_ESTDO',
'       from v_gf_g_titulos_judicial',
'      where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'      and rownum = 1;  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18516181089287271)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargue Datos Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    select b.id_acto',
'      into :P244_ID_ACTO',
'      from gf_g_titulos_jdcial_dcmnto b',
'      join gf_g_ttls_jdcl_dcmnt_asccn c on b.id_ttlo_jdcial_dcmnto = c.id_ttlo_jdcial_dcmnto',
'      join gf_g_titulos_judicial f on f.id_ttlo_jdcial = c.id_ttlo_jdcial',
'      join gn_d_actos_tipo d on d.id_acto_tpo = b.id_acto_tpo',
'      join gn_d_actos_tipo_tarea e on e.id_acto_tpo = b.id_acto_tpo',
'                                   and e.id_fljo_trea = :F_ID_FLJO_TREA ',
'     where --c.id_ttlo_jdcial = :P244_ID_TTLO_JDCIAL--nvl(nvl(json_value(:P244_JSON_CNSGNR, ''$.id_ttlo_jdcial''), json_value(:P244_JSON_DVLVR, ''$.id_ttlo_jdcial'')), json_value(:P244_JSON_FRCCNR, ''$.id_ttlo_jdcial''))',
'        f.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'       and rownum = 1;',
'exception ',
'    when others then',
'        :P244_ID_ACTO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18652564494589638)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Construir Json T\00EDtulos')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    for c_ttlos in (select id_ttlo_jdcial, ',
'                           ttlo_jdcial_estdo,',
'                           id_instncia_fljo ',
'                    from json_table(:P244_JSON_TTLOS, ''$[*]'' ',
'                                     columns (id_ttlo_jdcial            varchar2 path ''$.ID_TTLO_JDCIAL'',',
'                                              ttlo_jdcial_estdo    varchar2 path ''$.TTLO_JDCIAL_ESTDO'',',
'                                              id_instncia_fljo    varchar2 path ''$.ID_INSTNCIA_FLJO''))',
'    )loop',
'            if c_ttlos.ttlo_jdcial_estdo in (''ACN'',''CNS'',''ATJ'') then',
'                select json_arrayagg(',
'                           json_object (',
'                               ''id_ttlo_jdcial'' value id_ttlo_jdcial',
'                           )',
'                       ) as json_titulos',
'                into :P244_JSON_CNSGNR',
'                from (',
'                    /*select a.id_ttlo_jdcial from gf_g_titulos_judicial a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.ttlo_jdcial_estdo in (''ACN'', ''CNS'', ''ATJ'')*/',
'                    select id_ttlo_jdcial, ',
'                           ttlo_jdcial_estdo,',
'                           id_instncia_fljo',
'                    from json_table(:P244_JSON_TTLOS, ''$[*]'' ',
'                                     columns (id_ttlo_jdcial            varchar2 path ''$.ID_TTLO_JDCIAL'',',
'                                              ttlo_jdcial_estdo    varchar2 path ''$.TTLO_JDCIAL_ESTDO'',',
'                                              id_instncia_fljo    varchar2 path ''$.ID_INSTNCIA_FLJO'')) a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.ttlo_jdcial_estdo in (''ACN'', ''CNS'', ''ATJ'')',
'                );',
'            end if;',
'    end loop;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(15812889972281801)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'guardar_cartera'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(1000);',
'    v_cncptos         clob;',
'    v_exception       exception;',
'begin',
'',
'    for i in 1..apex_application.g_f01.count loop',
'        v_cncptos := v_cncptos || apex_application.g_f01(i);',
'    end loop;',
'    insert into muerto (c_001, t_001, v_001) values (v_cncptos, systimestamp, ''titulos''); commit;',
'   /* pkg_fi_fiscalizacion.prc_rg_fi_g_fsclzcion_sncion(p_cdgo_clnte           => :F_CDGO_CLNTE,',
'                                                      p_id_fsclzcion_expdnte => :P31_ID_FSCLZCION_EXPDNTE,',
'                                                      p_id_acto_tpo          => :P31_ACTO_TPO,',
'                                                      p_json                 => v_cncptos,',
'                                                      o_cdgo_rspsta          => v_cdgo_rspsta,',
'                                                      o_mnsje_rspsta         => v_mnsje_rspsta);',
'    ',
'    if v_cdgo_rspsta > 0 then',
'        raise v_exception;',
'    end if;*/',
'    ',
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
,p_process_when_type=>'NEVER'
);
end;
/
