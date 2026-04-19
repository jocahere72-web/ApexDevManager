prompt --application/pages/page_00106
begin
wwv_flow_api.create_page(
 p_id=>106
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Cartera para Ajuste'
,p_step_title=>'Cartera para Ajuste'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//apex.item( "VLOR_AJSTE_INTRES" ).disable();',
'',
'function recorrer_grid() { ',
'    ',
'   var region = apex.region("conceptos_ajustes");',
'   var id_ajuste = $(''#P106_ID_AJSTE'').val();',
'    ',
'    if (region && !id_ajuste) {',
'        ',
'       var view = apex.region("conceptos_ajustes").widget().interactiveGrid("getViews", "grid");',
'       var model = view.model;  ',
'       var records = model._data;//view.view$.grid("getSelectedRecords");       ',
'        ',
'       var json = records.map(function(record){           ',
'           return { "VGNCIA": model.getValue(record, "VGNCIA").trim(),',
'                    "ID_PRDO": model.getValue(record, "ID_PRDO"),',
'                    "ID_CNCPTO": model.getValue(record, "ID_CNCPTO"),',
'                    "VLOR_SLDO_CPTAL": model.getValue(record, "VLOR_SLDO_CPTAL").trim().replaceAll(''.'','''').replace(''$'',''''),',
'                    "VLOR_AJSTE": model.getValue(record, "VLOR_AJSTE").trim().replaceAll(''.'','''').replace(''$'',''''),',
'                    "ID_ORGEN": model.getValue(record, "ID_ORGEN").trim().split(''.'').join(''''),',
'                    "VLOR_INTRES_CPTAL": model.getValue(record, "VLOR_INTRES").trim().replaceAll(''.'','''').replace(''$'',''''),',
'                    "VLOR_AJSTE_INTRES": model.getValue(record, "VLOR_AJSTE_INTRES").trim().replaceAll(''.'','''').replace(''$'',''''),',
'                    "FCHA_INTRES": apex.item( "P106_FCHA_INTRES" ).getValue()',
'                  };',
'       }).filter(function(f){',
'          return parseFloat(f["VLOR_AJSTE"]) > 0 ;',
'       }); ',
'       $(''#P106_JSON'').val(json.length > 0 ? JSON.stringify(json) : '''');     ',
'   } ',
'   ',
'}',
'',
'async function Calcular_Interes(p_this) {',
'  let item_vlor = p_this.triggeringElement.value.replaceAll(''.'', '''');',
'  console.log(item_vlor);',
'  let conceptos_ajustes = apex.region("conceptos_ajustes").widget().interactiveGrid("getViews", "grid").model;',
'    ',
'  let table = apex.region("conceptos_ajustes").widget().interactiveGrid("getViews").grid.getSelectedRecords();',
'  let value = table[0];',
'  //console.log(''aqui => '', value)',
'  try {',
'    var saldo = value[conceptos_ajustes.getFieldKey("VLOR_AJSTE")].trim().replaceAll(''.'', '''').replace(''$'', '''');',
'    apex.server.process(',
'      ''Calcular_Interes_Mora'',',
'      {',
'        x01: item_vlor,',
'        x02: value[conceptos_ajustes.getFieldKey("VGNCIA")],',
'        x03: value[conceptos_ajustes.getFieldKey("ID_PRDO")],',
'        x04: value[conceptos_ajustes.getFieldKey("ID_CNCPTO")],',
'        x05: value[conceptos_ajustes.getFieldKey("ID_ORGEN")],',
'        x06: apex.item("P106_FCHA_INTRES").getValue(),',
'        x07: value[conceptos_ajustes.getFieldKey("CDGO_MVMNTO_ORGN")]',
'      }).then((resp) => {',
'        console.log(''Respuesta: '', resp);',
'        conceptos_ajustes.setValue(value, "VLOR_AJSTE_INTRES", new Intl.NumberFormat(''de-DE'').format(resp.v_vlor_intres));',
'        let capital_interes = value[conceptos_ajustes.getFieldKey("VLOR_INTRES_MASCARA")].trim().replaceAll(''.'', '''').replace(''$'', '''');',
'        let ajuste_interes = resp.v_vlor_intres;',
'        let total_interes = capital_interes - ajuste_interes;',
'        conceptos_ajustes.setValue(value, "TTAL_INTRES", new Intl.NumberFormat(''de-DE'').format(total_interes));',
'        let capital = value[conceptos_ajustes.getFieldKey("VLOR_SLDO_CPTAL")].trim().replaceAll(''.'','''').replace(''$'','''');',
'        let ajuste = value[conceptos_ajustes.getFieldKey("VLOR_AJSTE")].trim().replaceAll(''.'','''').replace(''$'','''');',
'        let total   = capital - ajuste;',
'                    //console.log(''Saldo Capital: ''+capital);',
'                    //console.log(''Saldo Interes: ''+interes);',
'                    //console.log(''Saldo Total: ''+total);',
'         conceptos_ajustes.setValue(value,"TTAL_CPTAL",new Intl.NumberFormat(''de-DE'').format(total));',
'      });',
'  } catch (e) {',
'    console.log(e);',
'  };',
'}',
'',
'async function Interes(p_this){',
' ',
'    var item_vlor = p_this.triggeringElement.value;',
'    ',
unistr('    //Obtenemos el modelo de la regi\00F3n del InteractiveGrid de Liquidaci\00F3n'),
'    var conceptos_ajustes = apex.region("conceptos_ajustes").widget().interactiveGrid("getViews", "grid").model;',
'    ',
'    //Recorrido del InteractiveGrid',
'    conceptos_ajustes.forEach(function(dato) {     ',
'            try{',
'                //console.log(dato[conceptos_ajustes.getFieldKey("VLOR_SLDO_CPTAL")]);',
'                var saldo = dato[conceptos_ajustes.getFieldKey("VLOR_SLDO_CPTAL")].trim().replaceAll(''.'','''').replace(''$'','''');',
'                console.log(''Saldo Capital ''+saldo);',
'                    apex.server.process(',
'                        ''Calcular_Interes_Mora'',',
'                        {',
'                            x01: saldo,',
'                            x02: dato[conceptos_ajustes.getFieldKey("VGNCIA")],',
'                            x03: dato[conceptos_ajustes.getFieldKey("ID_PRDO")],',
'                            x04: dato[conceptos_ajustes.getFieldKey("ID_CNCPTO")],',
'                            x05: dato[conceptos_ajustes.getFieldKey("ID_ORGEN")],',
'                            x06: apex.item( "P106_FCHA_INTRES" ).getValue(),',
'                            x07: dato[conceptos_ajustes.getFieldKey("CDGO_MVMNTO_ORGN")]',
'',
'                        }).then((resp) => {   ',
'                                console.log(''Respuesta:  '',resp);',
'                                conceptos_ajustes.setValue(dato,"VLOR_INTRES_MASCARA",new Intl.NumberFormat(''de-DE'').format(resp.v_vlor_intres));',
'                        });       ',
'',
'            } catch (e) {',
'                console.log(e);',
'            };',
'          });',
'}',
'',
'async function Interes2(p_this){',
' ',
'    var item_vlor = p_this.triggeringElement.value;',
'    ',
unistr('    //Obtenemos el modelo de la regi\00F3n del InteractiveGrid de Liquidaci\00F3n'),
'    var conceptos_ajustes = apex.region("conceptos_ajustes").widget().interactiveGrid("getViews", "grid").model;',
'    ',
'    //Recorrido del InteractiveGrid',
'    conceptos_ajustes.forEach(function(dato) {     ',
'            try{',
'                    //console.log(dato[conceptos_ajustes.getFieldKey("VLOR_AJSTE")]);',
'                    var saldo = dato[conceptos_ajustes.getFieldKey("VLOR_AJSTE")].trim().replaceAll(''.'','''').replace(''$'','''');',
'                    //console.log(''Saldo Interes ''+saldo);',
'                   apex.server.process(',
'                        ''Calcular_Interes_Mora'',',
'                        {',
'                            x01: saldo,',
'                            x02: dato[conceptos_ajustes.getFieldKey("VGNCIA")],',
'                            x03: dato[conceptos_ajustes.getFieldKey("ID_PRDO")],',
'                            x04: dato[conceptos_ajustes.getFieldKey("ID_CNCPTO")],',
'                            x05: dato[conceptos_ajustes.getFieldKey("ID_ORGEN")],',
'                            x06: apex.item( "P106_FCHA_INTRES" ).getValue(),',
'                            x07: dato[conceptos_ajustes.getFieldKey("CDGO_MVMNTO_ORGN")]',
'                            ',
'                        }).then((resp) => {   ',
'                            console.log(''Respuesta:  '',resp);',
'                            conceptos_ajustes.setValue(dato,"VLOR_AJSTE_INTRES",new Intl.NumberFormat(''de-DE'').format(resp.v_vlor_intres));',
'                            let capital_interes = dato[conceptos_ajustes.getFieldKey("VLOR_INTRES_MASCARA")].trim().replaceAll(''.'', '''').replace(''$'', '''');',
'                            let ajuste_interes = dato[conceptos_ajustes.getFieldKey("VLOR_AJSTE_INTRES")].trim().replaceAll(''.'', '''').replace(''$'', '''');;',
'                            let total_interes = capital_interes - ajuste_interes;',
'                            conceptos_ajustes.setValue(dato, "TTAL_INTRES", new Intl.NumberFormat(''de-DE'').format(total_interes));',
'                        });',
'',
'            } catch (e) {',
'                console.log(e);',
'            };',
'          });',
'}',
'',
'',
'',
''))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20260227094504'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(79403359063385903)
,p_plug_name=>'Workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
 p_id=>wwv_flow_api.id(118984816407096115)
,p_plug_name=>'Nuevo'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4209170344077901)
,p_plug_name=>'<b>Conceptos del Ajuste Registrado </b>'
,p_parent_plug_id=>wwv_flow_api.id(118984816407096115)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    id_ajste_dtlle, ',
'    id_ajste,',
'    dscrpcion_concepto,',
'    vgncia,',
'    dscrpcion_periodo,',
'    to_char(sldo_cptal, :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') sldo_cptal,',
'    vlor_ajste,    ',
'    vlor_ajste vlor_ajste_mascara,',
'   -- to_char(vlor_ajste, :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor_ajste_mascara',
'    intres_ajste_mrtrio  ',
'  from v_gf_g_ajuste_detalle ',
'where id_ajste = :P106_ID_AJSTE'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P106_ID_AJSTE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P106_ID_AJSTE'
,p_plug_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_plug_read_only_when=>'P106_ID_AJSTE'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4209961368077909)
,p_name=>'APEX$ROW_SELECTOR'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4210591834077915)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4211238734077922)
,p_name=>'ID_AJSTE_DTLLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_AJSTE_DTLLE'
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
 p_id=>wwv_flow_api.id(4211366531077923)
,p_name=>'ID_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_AJSTE'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4211496466077924)
,p_name=>'DSCRPCION_CONCEPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CONCEPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(4211588517077925)
,p_name=>'DSCRPCION_PERIODO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_PERIODO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(4211635503077926)
,p_name=>'SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SLDO_CPTAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Saldo Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(4211881510077928)
,p_name=>'VLOR_AJSTE_MASCARA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_AJSTE_MASCARA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor del  Ajuste '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(4211917174077929)
,p_name=>'VLOR_AJSTE_RESGISTRADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_AJSTE'
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
 p_id=>wwv_flow_api.id(143070420295718801)
,p_name=>'INTRES_AJSTE_MRTRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INTRES_AJSTE_MRTRIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Inter\00E9s Ajuste')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(4209801816077908)
,p_internal_uid=>4209801816077908
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>'La consulta no arrojo resultado'
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
 p_id=>wwv_flow_api.id(4216402099095944)
,p_interactive_grid_id=>wwv_flow_api.id(4209801816077908)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(4216551824095956)
,p_report_id=>wwv_flow_api.id(4216402099095944)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8830337020373)
,p_view_id=>wwv_flow_api.id(4216551824095956)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(143070420295718801)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4217066887095995)
,p_view_id=>wwv_flow_api.id(4216551824095956)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(4209961368077909)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4217904048096014)
,p_view_id=>wwv_flow_api.id(4216551824095956)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(4210591834077915)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4218403777096016)
,p_view_id=>wwv_flow_api.id(4216551824095956)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(4211238734077922)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4218935731096018)
,p_view_id=>wwv_flow_api.id(4216551824095956)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(4211366531077923)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4219413449096020)
,p_view_id=>wwv_flow_api.id(4216551824095956)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(4211496466077924)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4219987955096022)
,p_view_id=>wwv_flow_api.id(4216551824095956)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(4211588517077925)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4220454789096023)
,p_view_id=>wwv_flow_api.id(4216551824095956)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(4211635503077926)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4220933894096025)
,p_view_id=>wwv_flow_api.id(4216551824095956)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(4211881510077928)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4221423152096027)
,p_view_id=>wwv_flow_api.id(4216551824095956)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(4211917174077929)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(75687000008)
,p_view_id=>wwv_flow_api.id(4216551824095956)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(4211881510077928)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(9124666022872)
,p_view_id=>wwv_flow_api.id(4216551824095956)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(143070420295718801)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(118983404718096101)
,p_plug_name=>'<b>Ajustes Relacionados</b>'
,p_parent_plug_id=>wwv_flow_api.id(118984816407096115)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'a.vgncia,',
'a.id_prdo,',
'a.dscrpcion_cncpto,',
'a.id_mvmnto_fncro,',
'a.cdgo_mvmnto_orgn,',
'--a.id_sjto_impsto ,',
'--a.cdgo_mvmnto_tpo,',
'a.dscrpcion_prdo,',
'to_char(case ',
'   when a.vlor_dbe = 0 then a.vlor_hber',
'   when a.vlor_hber =0 then  a.vlor_dbe',
'   end, :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor_ajste,',
'a.dscrpcion_mvmnto_tpo,',
'a.fcha_frmtda',
'from v_gf_g_movimientos_detalle a',
'where id_sjto_impsto               = :P106_ID_SJTO_IMPSTO--370139',
'and cdgo_mvmnto_tpo            in (''AC'', ''AD'');',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 	a.id_mvmnto_fncro',
'     ',
'from v_gf_g_movimientos_detalle a',
'where a.cdgo_clnte     = :F_CDGO_CLNTE',
'  and a.id_sjto_impsto = :P106_ID_SJTO_IMPSTO --370139--',
'  and a.cdgo_mvmnto_tpo in (''AC'', ''AJ'');'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(118983663274096103)
,p_name=>'ID_MVMNTO_FNCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_MVMNTO_FNCRO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Movimiento Financiero'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(118983746812096104)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Cdgo Mvmnto Orgn'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>20
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
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(118984018891096107)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(118984132034096108)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Prdo'
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
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(118984438431096111)
,p_name=>'DSCRPCION_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_PRDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(118984726112096114)
,p_name=>'VLOR_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_AJSTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Ajuste'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(118984920243096116)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n Concepto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(118985053258096117)
,p_name=>'DSCRPCION_MVMNTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_MVMNTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(118985116330096118)
,p_name=>'FCHA_FRMTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_FRMTDA'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Movimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(118983582012096102)
,p_internal_uid=>118983582012096102
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
 p_id=>wwv_flow_api.id(118991381428119576)
,p_interactive_grid_id=>wwv_flow_api.id(118983582012096102)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(118991488146119577)
,p_report_id=>wwv_flow_api.id(118991381428119576)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(118991914438119584)
,p_view_id=>wwv_flow_api.id(118991488146119577)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(118983663274096103)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(118992447147119588)
,p_view_id=>wwv_flow_api.id(118991488146119577)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(118983746812096104)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(118993937922119593)
,p_view_id=>wwv_flow_api.id(118991488146119577)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(118984018891096107)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(118994410786119594)
,p_view_id=>wwv_flow_api.id(118991488146119577)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(118984132034096108)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(118995928586119598)
,p_view_id=>wwv_flow_api.id(118991488146119577)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(118984438431096111)
,p_is_visible=>true
,p_is_frozen=>false
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119003751087231798)
,p_view_id=>wwv_flow_api.id(118991488146119577)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(118984726112096114)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119007879981282538)
,p_view_id=>wwv_flow_api.id(118991488146119577)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(118984920243096116)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119008373088282540)
,p_view_id=>wwv_flow_api.id(118991488146119577)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(118985053258096117)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119026603091451311)
,p_view_id=>wwv_flow_api.id(118991488146119577)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(118985116330096118)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(256156824152323165)
,p_plug_name=>'<b>Insertar Valor del Ajuste</b>'
,p_region_name=>'conceptos_ajustes'
,p_parent_plug_id=>wwv_flow_api.id(118984816407096115)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* select a.vgncia ,',
'        a.id_prdo,',
'        a.prdo,',
'        a.id_cncpto,',
'        a.cdgo_cncpto,',
'        a.dscrpcion_cncpto ,',
'        a.vlor_sldo_cptal,',
'        to_char(a.vlor_sldo_cptal, :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor_sldo_cptal_mascarca,',
'        nvl(a.vlor_intres,0) vlor_intres,',
'        to_char( nvl(a.vlor_intres,0),:F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor_intres_mascara,',
'        rownum as num',
'from v_gf_g_cartera_x_concepto a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.id_sjto_impsto = :P106_ID_SJTO_IMPSTO ',
'  and a.vlor_sldo_cptal >= 0',
'--  order by a.vgncia desc;*/',
'',
'select a.vgncia ,',
'    a.id_prdo,',
'    a.prdo,',
'    a.id_cncpto,',
'    a.cdgo_cncpto,',
'    a.dscrpcion_cncpto ,',
'    a.vlor_sldo_cptal,',
'    to_char(a.vlor_sldo_cptal, :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor_sldo_cptal_mascarca,',
'    nvl(a.vlor_intres,0) vlor_intres,',
'    to_char( nvl(a.vlor_intres,0),:F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor_intres_mascara,',
'    rownum as num ,',
'    a.id_orgen,',
'    a.cdgo_mvmnto_orgn',
'from v_gf_g_cartera_x_concepto a',
'where     a.cdgo_clnte = :F_CDGO_CLNTE',
'and       a.id_sjto_impsto = :P106_ID_SJTO_IMPSTO',
'-- and a.vlor_sldo_cptal > 0',
'-- order by a.vgncia desc;',
'and     ((a.vlor_sldo_cptal > 0 and :P106_TPO_AJSTE = ''CR'') or (a.vlor_sldo_cptal >= 0 and :P106_TPO_AJSTE = ''DB''))'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P106_ID_AJSTE'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(72923040368268001)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Origen'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(113291660917347702)
,p_name=>'APEX$ROW_SELECTOR'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(119744405456972799)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(119744545025972800)
,p_name=>'ID_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(127328912279675011)
,p_name=>'VLOR_SLDO_CPTAL_MASCARCA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL_MASCARCA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(142663736675266012)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(142763428074894509)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
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
 p_id=>wwv_flow_api.id(142763537732894510)
,p_name=>'VLOR_INTRES_MASCARA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES_MASCARA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Inter\00E9s de Mora')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(142763629181894511)
,p_name=>'VLOR_AJSTE'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ajuste Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_item_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:0});"'
,p_is_required=>false
,p_static_id=>'estilo'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    options.features = options.features || {};',
'    options.features.sort = false;',
'    return options;',
'}'))
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(142763770806894512)
,p_name=>'VLOR_AJSTE_INTRES'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Ajuste Inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_static_id=>'VLOR_AJSTE_INTRES'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(142936581873845703)
,p_name=>'TTAL_CPTAL'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Saldo Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_static_id=>'TTAL_CPTAL'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(142936643317845704)
,p_name=>'TTAL_INTRES'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Saldo Inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_static_id=>'TTAL_INTRES'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(258213624480318970)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(258213892507318972)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(258214014375318974)
,p_name=>'CDGO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(258214119447318975)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Descripci\00F3n Concepto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(258214256960318976)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(258214454209318978)
,p_name=>'NUM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NUM'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(256157069741323167)
,p_internal_uid=>256157069741323167
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>'La consulta no arrojo resultado'
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
 p_id=>wwv_flow_api.id(257535751879986197)
,p_interactive_grid_id=>wwv_flow_api.id(256157069741323167)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(257535817325986198)
,p_report_id=>wwv_flow_api.id(257535751879986197)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(136163000070)
,p_view_id=>wwv_flow_api.id(257535817325986198)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(113291660917347702)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(72929714566279014)
,p_view_id=>wwv_flow_api.id(257535817325986198)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(72923040368268001)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119850343374794780)
,p_view_id=>wwv_flow_api.id(257535817325986198)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(119744405456972799)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119850840634794783)
,p_view_id=>wwv_flow_api.id(257535817325986198)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(119744545025972800)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(128218796941181057)
,p_view_id=>wwv_flow_api.id(257535817325986198)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(127328912279675011)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>164
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(142668822621286424)
,p_view_id=>wwv_flow_api.id(257535817325986198)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(142663736675266012)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(142781744672905162)
,p_view_id=>wwv_flow_api.id(257535817325986198)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(142763428074894509)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(142782205511905165)
,p_view_id=>wwv_flow_api.id(257535817325986198)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(142763537732894510)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(142784442667917733)
,p_view_id=>wwv_flow_api.id(257535817325986198)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(142763629181894511)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(142786117800955117)
,p_view_id=>wwv_flow_api.id(257535817325986198)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(142763770806894512)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(142974528097403282)
,p_view_id=>wwv_flow_api.id(257535817325986198)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(142936581873845703)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(142975072437403287)
,p_view_id=>wwv_flow_api.id(257535817325986198)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(142936643317845704)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(258263163296569218)
,p_view_id=>wwv_flow_api.id(257535817325986198)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(258213624480318970)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>90
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(258264744290569239)
,p_view_id=>wwv_flow_api.id(257535817325986198)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(258213892507318972)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(258266313323569244)
,p_view_id=>wwv_flow_api.id(257535817325986198)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(258214014375318974)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(258267179774569247)
,p_view_id=>wwv_flow_api.id(257535817325986198)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(258214119447318975)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>225
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(258267956203569249)
,p_view_id=>wwv_flow_api.id(257535817325986198)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(258214256960318976)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(258269505809569253)
,p_view_id=>wwv_flow_api.id(257535817325986198)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(258214454209318978)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(142509195478514005)
,p_plug_name=>unistr('Fecha_Proyecci\00F3n_Intereses')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P106_ID_AJSTE'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(428610728819473479)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
 p_id=>wwv_flow_api.id(435871272628589564)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'<p>Esta funcionalidad permite gestionar los procesos de ajustes .</p>',
'<p>En esta etapa se Registra el Ajuste.</p>',
unistr('<p>Se debe ingresar el valor del ajuste en la secci\00F3n Insertar Valor del Ajustes en el campo Valor Ajuste. </p>'),
unistr('<p>Hacer clic en el bot\00F3n <b>Insertar Ajuste</b> para pasar a la siguiente etapa del proceso. </p>'),
'<p><b>Nota:</b> Solo se insertaran los detalles del  ajuste  con valor digitado y mayores a cero. </p>',
'</i>',
'</br>',
'',
'<br>',
unistr('<i><p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p></i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79166878187240263)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(428610728819473479)
,p_button_name=>'BTN_INSRTAR'
,p_button_static_id=>'BTN_INSRTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar Ajuste'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select a.id_cncpto',
'  from v_gf_g_cartera_x_concepto a',
' where a.cdgo_clnte        = :F_CDGO_CLNTE',
'   and a.id_sjto_impsto    = nvl(:P102_ID_SJTO_IMPSTO,:P106_ID_SJTO_IMPSTO)',
'   and a.id_impsto         = nvl(:P102_ID_IMPSTO,:P106_ID_IMPSTO)',
'   and a.id_impsto_sbmpsto = nvl(:P102_ID_IMPSTO_SBMPSTO,:P106_ID_IMPSTO_SBMPSTO)',
'   and a.vlor_sldo_cptal   > 0',
'   and :P106_ID_AJSTE is null*/',
'   ',
'select     a.id_cncpto',
'from       v_gf_g_cartera_x_concepto a',
'where      a.cdgo_clnte = :F_CDGO_CLNTE',
'and        a.id_sjto_impsto = nvl(:P102_ID_SJTO_IMPSTO,:P106_ID_SJTO_IMPSTO)',
'and        a.id_impsto = nvl(:P102_ID_IMPSTO,:P106_ID_IMPSTO)',
'and        a.id_impsto_sbmpsto = nvl(:P102_ID_IMPSTO_SBMPSTO,:P106_ID_IMPSTO_SBMPSTO)',
'-- and a.vlor_sldo_cptal > 0',
'and      ((a.vlor_sldo_cptal > 0 and :P106_TPO_AJSTE = ''CR'') or (a.vlor_sldo_cptal >= 0 and :P106_TPO_AJSTE = ''DB''))',
'and      :P106_ID_AJSTE is null'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99854519552663787)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(428610728819473479)
,p_button_name=>'revertir'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Revertir'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-step-backward'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4200999768984501)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(428610728819473479)
,p_button_name=>'BTN_IMPRMIR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>'P106_ID_AJSTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4185158076479901)
,p_branch_name=>'Imprimir Reporte'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_XML:199,<data><id_ajuste>&P106_ID_AJSTE.</id_ajuste><id_impuesto>&P106_ID_IMPSTO.</id_impuesto><P104_ID_INSTNCIA_FLJO>&F_ID_INSTNCIA_FLJO.</P104_ID_INSTNCIA_FLJO></data>&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4200999768984501)
,p_branch_sequence=>10
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P106_ID_AJSTE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4209296136077902)
,p_name=>'P106_ID_AJSTE_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4209170344077901)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4209310622077903)
,p_name=>'P106_ID_SJTO_IMPSTO_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4209170344077901)
,p_source=>'P102_ID_SJTO_IMPSTO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4209407457077904)
,p_name=>'P106_IDNTFCCION_1'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(4209170344077901)
,p_item_default=>':P102_IDNTFCCION'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_source=>'P102_IDNTFCCION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4209535887077905)
,p_name=>'P106_ID_IMPSTO_1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(4209170344077901)
,p_prompt=>'P106_ID_IMPSTO'
,p_source=>'P102_ID_IMPSTO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4209667209077906)
,p_name=>'P106_JSON_1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(4209170344077901)
,p_item_default=>'999'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4209773257077907)
,p_name=>'P106_MNSJ_RSPSTA_1'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(4209170344077901)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16695713838054701)
,p_name=>'P106_MNSJ_RSPSTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(256156824152323165)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18261804338042802)
,p_name=>'P106_TPO_AJSTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(118984816407096115)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18261946602042803)
,p_name=>'P106_ID_AJSTE_MTVO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(118984816407096115)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18262074806042804)
,p_name=>'P106_TPO_DCMNTO_SPRTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(118984816407096115)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18262146884042805)
,p_name=>'P106_NMRO_DCMTO_SPRTE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(118984816407096115)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18262277421042806)
,p_name=>'P106_FCHA_DCMNTO_SPRTE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(118984816407096115)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18262397941042807)
,p_name=>'P106_NMRO_SLCTUD'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(118984816407096115)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18262439582042808)
,p_name=>'P106_FILE_BLOB'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(118984816407096115)
,p_use_cache_before_default=>'NO'
,p_source=>'FILE_BLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18262590517042809)
,p_name=>'P106_NMRO_DCMTO_SPRTE_ADJNTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(118984816407096115)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18262674842042810)
,p_name=>'P106_OBSRVCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(118984816407096115)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18293023007232601)
,p_name=>'P106_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(118984816407096115)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79154935580240224)
,p_name=>'P106_JSON'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(256156824152323165)
,p_item_default=>'999'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79160920672240246)
,p_name=>'P106_ID_AJSTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(256156824152323165)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79187814626295161)
,p_name=>'P106_ID_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(256156824152323165)
,p_prompt=>'P106_ID_IMPSTO'
,p_source=>'P102_ID_IMPSTO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79188674003295162)
,p_name=>'P106_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(256156824152323165)
,p_source=>'P102_ID_SJTO_IMPSTO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79189005737295162)
,p_name=>'P106_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(256156824152323165)
,p_item_default=>':P102_IDNTFCCION'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_source=>'P102_IDNTFCCION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(142509277234514006)
,p_name=>'P106_FCHA_INTRES'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(142509195478514005)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>unistr('<b>Fecha Proyecci\00F3n Inter\00E9s</b>')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+1m'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(92571383979036601)
,p_computation_sequence=>10
,p_computation_item=>'P106_ID_AJSTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_ajste from gf_g_ajustes ',
'            where id_instncia_fljo =:F_ID_INSTNCIA_FLJO;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(79172213258240285)
,p_validation_name=>unistr('\00CDtem Numero Solicitud no nulo')
,p_validation_sequence=>50
,p_validation=>'P106_NMRO_SLCTUD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor ingrese el numero de solicitud de Ajuste'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(79166878187240263)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(79173423727240285)
,p_validation_name=>unistr('\00CDtem Tipo Ajuste no nulo')
,p_validation_sequence=>60
,p_validation=>'P106_TPO_AJSTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor escoja el tipo de ajuste a realizar'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(79166878187240263)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(79173016599240285)
,p_validation_name=>unistr('\00CDtem Id.Motivo no nulo')
,p_validation_sequence=>70
,p_validation=>'P106_ID_AJSTE_MTVO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor escoja el motivo de ajuste a realizar'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(79166878187240263)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(79172646223240285)
,p_validation_name=>'Item Fecha Documento no nulo'
,p_validation_sequence=>80
,p_validation=>'P106_FCHA_DCMNTO_SPRTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor ingrese la fecha del documento'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(79166878187240263)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(79173807318240285)
,p_validation_name=>'Item Tipo Documento no nulo'
,p_validation_sequence=>90
,p_validation=>'P106_TPO_DCMNTO_SPRTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor ingrese el tipo de documento soporte'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(79166878187240263)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(79174275488240286)
,p_validation_name=>'Item Num Documento no nulo'
,p_validation_sequence=>100
,p_validation=>'P106_NMRO_DCMTO_SPRTE_ADJNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor ingrese el numero de documento soporte'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(79166878187240263)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(79174688357240286)
,p_validation_name=>'Item Observacion no nulo'
,p_validation_sequence=>110
,p_validation=>'P106_OBSRVCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por favor ingrese una observaci\00F3n sobre el ajuste.')
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(79166878187240263)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(83899549027889401)
,p_name=>'Nuevo'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(79166878187240263)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(83899674983889402)
,p_event_id=>wwv_flow_api.id(83899549027889401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.localStorage.clear();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(81670460973910233)
,p_name=>'Recorrer_grid_Valor_Ajuste'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(79166878187240263)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(81670819767910248)
,p_event_id=>wwv_flow_api.id(81670460973910233)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'Interes2(this);',
'//recorrer_grid();',
'setTimeout(recorrer_grid(), 5000); ',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(36706637367063901)
,p_name=>'Confirmar_Insertar_Valor_Ajuste'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(79166878187240263)
,p_condition_element=>'P106_JSON'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(36706781616063902)
,p_event_id=>wwv_flow_api.id(36706637367063901)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.message.confirm ("Debe insertar al menos un valor en ''Valor Ajuste'' para poder ajustar la Cartera."  , function( Aceptar ){',
'   if( Aceptar ) {',
'/*   apex.page.submit( "" ); */',
'   }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(36750478087483201)
,p_event_id=>wwv_flow_api.id(36706637367063901)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>' apex.page.submit("BTN_INSRTAR");   '
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(99854781071668434)
,p_name=>'revertir'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(99854519552663787)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(99855152744668499)
,p_event_id=>wwv_flow_api.id(99854781071668434)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'debugger;',
'revertirTarea();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4273401787168001)
,p_name=>'Nuevo_1'
,p_event_sequence=>70
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(256156824152323165)
,p_triggering_element=>'VLOR_SLDO_CPTAL_MASCARCA,VGNCIA,DSCRPCION_CNCPTO,PRDO'
,p_bind_type=>'bind'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4273598366168002)
,p_event_id=>wwv_flow_api.id(4273401787168001)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'VLOR_AJSTE'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>':VLOR_SLDO_CPTAL'
,p_attribute_07=>'VLOR_SLDO_CPTAL'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(142509364498514007)
,p_name=>'Al_seleccionar_fecha'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P106_FCHA_INTRES'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(142509499629514008)
,p_event_id=>wwv_flow_api.id(142509364498514007)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Interes(this);',
'Interes2(this);',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(143122871039995301)
,p_name=>'Al_cambiar_VLOR_AJSTE'
,p_event_sequence=>100
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(256156824152323165)
,p_triggering_element=>'VLOR_AJSTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(143122931076995302)
,p_event_id=>wwv_flow_api.id(143122871039995301)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Calcular_Interes(this);',
'apex.item( "VLOR_AJSTE_INTRES" ).disable();',
'apex.item( "TTAL_CPTAL" ).disable();',
'apex.item( "TTAL_INTRES" ).disable();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79174922151240288)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Identificaci\00F3n del Sujeto Impuesto')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select a.idntfccion_sjto,',
'           a.id_impsto,           ',
'           a.id_sjto_impsto,',
'           :P102_ID_IMPSTO_SBMPSTO,',
'           :P105_TPO_AJSTE,',
'           :P105_ID_AJSTE_MTVO,',
'           :P105_OBSRVCION,',
'           :P105_TPO_DCMNTO_SPRTE,',
'            nvl(:P105_NMRO_ACTO_DSPLAY,:P105_NMRO_DCMTO_SPRTE_ADJNTO),',
'           :P105_FCHA_DCMNTO_SPRTE,',
'           :P105_NMRO_SLCTUD,',
'           :P105_FILE_BLOB,',
'           :P105_NMRO_DCMTO_SPRTE_ADJNTO',
'      into :P106_IDNTFCCION,',
'           :P106_ID_IMPSTO,',
'           :P106_ID_SJTO_IMPSTO,',
'           :P106_ID_IMPSTO_SBMPSTO,',
'           :P106_TPO_AJSTE,',
'           :P106_ID_AJSTE_MTVO,',
'           :P106_OBSRVCION,',
'           :P106_TPO_DCMNTO_SPRTE,',
'           :P106_NMRO_DCMTO_SPRTE,',
'           :P106_FCHA_DCMNTO_SPRTE,',
'           :P106_NMRO_SLCTUD,',
'           :P106_FILE_BLOB,',
'           :P106_NMRO_DCMTO_SPRTE_ADJNTO',
'      from v_si_i_sujetos_impuesto a',
'     where a.cdgo_clnte      = :F_CDGO_CLNTE',
'       and a.id_sjto_impsto  = :P102_ID_SJTO_IMPSTO;',
'       ',
'       ',
'       ',
'       ',
'       ',
'       ',
'       ',
'       ',
'       ',
'       ',
'       ',
'       ',
'       ',
'       ',
'  /*  select a.idntfccion_sjto, a.id_impsto ,a.id_sjto_impsto,b.id_impsto_sbmpsto',
'    into :P106_IDNTFCCION, :P106_ID_IMPSTO ,:P106_ID_SJTO_IMPSTO,:P106_ID_IMPSTO_SBMPSTO	',
'    from v_si_i_sujetos_impuesto a',
'	    join v_gf_g_cartera_x_concepto b on a.id_sjto_impsto = b.id_sjto_impsto',
'     where a.cdgo_clnte      = :F_CDGO_CLNTE',
'       and a.id_sjto_impsto  = :P102_ID_SJTO_IMPSTO;	*/   ',
'',
'exception ',
'    when no_data_found then ',
'        apex_util.set_session_state(''P106_IDNTFCCION'',  '''');',
'end;',
'',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79175719756240289)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registro Ajuste'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
unistr('	v_id_ajste	 number;  -- ID del Ajuste. El cual es retornado por el procedimiento de creaci\00F3n de AJUSTE'),
'	v_xml        clob;',
'    ',
'    v_o_cdgo_rspsta			   number;',
'    v_o_mnsje_rspsta		varchar2(1000);',
'    vv_o_cdgo_rspsta			   number;',
'    vv_o_mnsje_rspsta		varchar2(1000);',
'    ',
'    v_temp_files apex_application_temp_files%rowtype;',
'    v_count      number;',
'    filecounts   exception;',
'    ',
'    l_file_names apex_t_varchar2;    ',
'    l_file       apex_application_temp_files%rowtype; ',
'    ',
'begin',
'',
'-- Creamos el AJUSTE mediante procedimiento pkg_gf_ajustes.prc_rg_ajustes',
'     begin',
'                                     ',
'            	pkg_gf_ajustes.prc_rg_ajustes (p_cdgo_clnte                 => :F_CDGO_CLNTE,',
'                                               p_id_impsto                  => :P106_ID_IMPSTO,',
'                                               p_id_impsto_sbmpsto          =>  nvl(:P102_ID_IMPSTO_SBMPSTO,:P106_ID_IMPSTO_SBMPSTO),',
'                                               p_id_sjto_impsto             => :P106_ID_SJTO_IMPSTO,',
'                                               p_orgen                      => ''M'',',
'                                               p_tpo_ajste                  => nvl(:P105_TPO_AJSTE,:P106_TPO_AJSTE),',
'                                               p_id_ajste_mtvo              => nvl(:P105_ID_AJSTE_MTVO,:P106_ID_AJSTE_MTVO),',
'                                               p_obsrvcion                  => nvl(:P105_OBSRVCION,:P106_OBSRVCION),',
'                                        --     p_tpo_dcmnto_sprte           => nvl(:P105_TPO_DCMNTO_SPRTE,:P106_TPO_DCMNTO_SPRTE),',
'                                               p_tpo_dcmnto_sprte          => nvl(nvl(:P105_TPO_DCMNTO_SPRTE,:P106_TPO_DCMNTO_SPRTE),''Soporte Externo'') ,    ',
'                                               p_nmro_dcmto_sprte           => nvl(:P105_NMRO_ACTO_DSPLAY,:P105_NMRO_DCMTO_SPRTE_ADJNTO),',
'                                         --    p_nmro_dcmto_sprte           => :P105_NMRO_ACTO_DSPLAY,',
'                                               p_fcha_dcmnto_sprte          => nvl(:P105_FCHA_DCMNTO_SPRTE,:P106_FCHA_DCMNTO_SPRTE),',
'                                               p_nmro_slctud                => nvl(:P105_NMRO_SLCTUD,:P106_NMRO_SLCTUD),',
'                                               p_id_usrio                   => :F_ID_USRIO,',
'                                               p_id_instncia_fljo           => :F_ID_INSTNCIA_FLJO,',
'                                               p_id_fljo_trea               => :F_ID_FLJO_TREA ,',
'                                               p_json                       => :P106_JSON,',
'                                               p_adjnto	 			        => :P105_FILE_BLOB,-- p_adjnto	 			        => nvl(:P105_FILE_BLOB,:P106_FILE_BLOB),   ',
'                                               p_nmro_dcmto_sprte_adjnto    => nvl(:P105_NMRO_DCMTO_SPRTE_ADJNTO,:P106_NMRO_DCMTO_SPRTE_ADJNTO),',
'                                               p_ind_ajste_prcso            => ''C'',',
'                                               p_id_ajste                   => v_id_ajste ,',
'                                               o_cdgo_rspsta        		=> v_o_cdgo_rspsta,',
'                                               o_mnsje_rspsta        		=> v_o_mnsje_rspsta);	                    ',
'      exception',
'       when no_data_found then',
'					 rollback;',
'					 vv_o_cdgo_rspsta := 101;',
'					 vv_o_mnsje_rspsta := '' |AJT10-Proceso No. 10 - Codigo: ''||vv_o_cdgo_rspsta ||',
'								   '' proceso de apex No fue posible cargar el archivo. asociado al flujo No asociada a la instancia del flujo No.''||:F_ID_INSTNCIA_FLJO||'' ''||v_o_mnsje_rspsta ;',
'					return;',
'     when others then ',
'                     rollback;',
'					 vv_o_cdgo_rspsta := 102;',
'					 vv_o_mnsje_rspsta := '' |AJT10-Proceso No. 10 - Codigo: ''||vv_o_cdgo_rspsta  ||',
'					    		   ''proceso de apex no se pudo registrar la propiedad del id del Ajuste del evento. asociado al flujo No asociada a la instancia del flujo No.''||:F_ID_INSTNCIA_FLJO||'' ''||v_o_mnsje_rspsta  ;',
'                     return;',
'     end;',
'	 --  :F_ID_AJSTE   :=   v_id_ajste;',
'   --    :P106_ID_AJSTE:=   v_id_ajste;',
'   ',
'      ',
'       if (v_o_cdgo_rspsta = 0) then',
'            :P106_ID_AJSTE:=   v_id_ajste;',
'		    :P106_MNSJ_RSPSTA:=''Ajuste Registrado Correctamente'';',
'            commit;',
'       else',
'          rollback;',
'         :P106_MNSJ_RSPSTA:=v_o_mnsje_rspsta;',
'        -- RAISE_APPLICATION_ERROR (-20000,v_o_mnsje_rspsta); ',
'	   end if;          ',
'    ',
'  ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(79166878187240263)
,p_process_success_message=>'&P106_MNSJ_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4191379721679501)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Imprimir Reporte'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_id_reporte number;',
'begin',
'select id_rprte into v_id_reporte from gn_d_reportes ',
'where cdgo_rprte_grpo = ''AJ1'' and nmbre_plntlla = ''gf_g_registro_ajuste'';',
'',
'apex_session.attach ( p_app_id => 66000, p_page_id => 2, p_session_id => :APP_SESSION );    ',
'',
'apex_util.set_session_state(''P2_ID_RPRTE'', v_id_reporte);   ',
'apex_util.set_session_state(''P2_XML'', ''<id_ajuste>''||:P106_ID_AJSTE||''</id_ajuste><id_impuesto>''||:P106_ID_IMPSTO||''</id_impuesto><P104_ID_INSTNCIA_FLJO>''||:F_ID_INSTNCIA_FLJO||''</P104_ID_INSTNCIA_FLJO>''); ',
'apex_session.attach ( p_app_id => 71000, p_page_id => 104, p_session_id => :APP_SESSION );    ',
'end;    '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(79166878187240263)
,p_process_when=>'P106_ID_AJSTE'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(83853421755488401)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'Proceso_Workflow_Boton_Insertar'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(86110161112432801)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Enviar Alerta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
unistr('	v_id_ajste	         number;  -- ID del Ajuste. El cual es retornado por el procedimiento de creaci\00F3n de AJUSTE'),
'    c_id_usrio           number;',
'  --  p_usrios             genesys.pkg_ma_mail.g_users;',
'    v_id_fljo_trea       wf_g_instancias_transicion.id_fljo_trea_orgen%type;',
'    v_cdgo_rspsta        number;',
'	v_mnsje_rspsta       varchar2(1000);',
'    v_ttlo               varchar2(1000);',
'begin',
'',
'',
'                begin ',
'                   v_ttlo  :=''Aprobar'';',
'                   pkg_gf_ajustes.prc_ajustes_gen_url (:F_ID_INSTNCIA_FLJO,:F_ID_FLJO_TREA,:P_CDGO_CLNTE,v_ttlo,v_cdgo_rspsta,v_mnsje_rspsta);',
'            /*   exception',
'                   when others then',
'                    RAISE_APPLICATION_ERROR (-20000,v_mnsje_rspsta);  ',
'                end;*/',
'                  if (v_cdgo_rspsta = 0) then	    ',
'                    commit; ',
'                  else',
'                    rollback;',
'                    RAISE_APPLICATION_ERROR (-20000,v_mnsje_rspsta); ',
'	              end if; ',
'                end;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(79166878187240263)
,p_process_when=>'P106_ID_AJSTE'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(119186685372814901)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Borrar Estado de Sesion'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'102,105'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(79166878187240263)
,p_process_when=>'P106_ID_AJSTE'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(142509020657514004)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calcular_Interes_Mora'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cptal_ajste        number       := apex_application.g_x01;',
'    v_vgncia             number       := apex_application.g_x02;',
'    v_id_prdo            number       := apex_application.g_x03;',
'    v_id_cncpto          number       := apex_application.g_x04;',
'    v_id_orgen           number       := apex_application.g_x05;',
'    v_fecha              date         := apex_application.g_x06;',
'    v_cdgo_mvmnto        varchar2(4)  := apex_application.g_x07;',
'    v_vlor_intres        number;',
'begin  ',
'    v_vlor_intres := pkg_gf_movimientos_financiero.fnc_cl_interes_mora(   p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                                                          p_id_impsto          => :P106_ID_IMPSTO,',
'                                                                          p_id_impsto_sbmpsto  => :P106_ID_IMPSTO_SBMPSTO,',
'                                                                          p_vgncia             => v_vgncia,',
'                                                                          p_id_prdo            => v_id_prdo,',
'                                                                          p_id_cncpto          => v_id_cncpto,',
'                                                                          p_cdgo_mvmnto_orgn   => v_cdgo_mvmnto,',
'                                                                          p_id_orgen           => v_id_orgen,',
'                                                                          p_vlor_cptal         => v_cptal_ajste,',
'                                                                          p_indcdor_clclo      => ''CLD'',',
'                                                                          p_fcha_pryccion      => v_fecha);',
'                                                                      ',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'' , 0);',
'        apex_json.write(''o_mnsje_rspsta'',''OK'');',
'        apex_json.write(''v_vlor_intres'', v_vlor_intres);',
'        apex_json.close_object();',
'',
'    exception when others then',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'' , 1);',
'        apex_json.write(''o_mnsje_rspsta'',''No se pudo calcular el interes mora'' || sqlerrm);        ',
'        apex_json.write(''v_vlor_intres'' , v_vlor_intres);',
'        apex_json.close_object();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
