prompt --application/pages/page_00239
begin
wwv_flow_api.create_page(
 p_id=>239
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Asociaci\00F3n T\00EDtulo Judicial')
,p_step_title=>unistr('Asociaci\00F3n T\00EDtulo Judicial')
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.jQuery(\201Cspan[data-style]\201D).each('),
'function()',
'{',
unistr('apex.jQuery(this). parent().attr( \2018style\2019, apex.jQuery(this).attr(\2018data-style\2019) );'),
'}',
');'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*var region_1 = apex.region("dato_ig").widget().interactiveGrid("refresh","grid");',
'var region_2 = apex.region("dato_ig_d").widget().interactiveGrid("refresh","grid");*/',
'function obtenerDatos(){   ',
'    let titulo=apex.item(''P239_ID_TTLO'').getValue();',
'    var region = apex.region("titulo_ig");',
'    var json  = [];',
'    let i;    ',
'    if (region) {            ',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;  ',
'        var records = view.view$.grid("getSelectedRecords");',
'        if($.isEmptyObject(records) == false){',
'           ',
'         apex.item(''P239_ID_TTLO'').setValue(records[0][1])',
'            window.localStorage.setItem("id_titulo",apex.item(''P239_ID_TTLO'').getValue());',
'                 ',
'           console.log(records[0][1])',
'          ',
'         ',
'         //apex.region("titulo_ig").widget().interactiveGrid("getViews","grid").setSelectedRecords(records[0][0], true);',
'          ',
'        }',
'        else{',
'            apex.item(''P239_ID_TTLO'').setValue("")',
'          window.localStorage.setItem("id_titulo",apex.item(''P239_ID_TTLO'').getValue());',
unistr('             console.log("Seleccion vac\00EDa")'),
'            ',
'        }',
'    } ',
'    ',
'    ',
'    ',
'}',
'',
'function irFlujo(id_instancia){',
'    apex.server.process("IniciarFlujo", {f01: id_instancia}).then(function(data){',
'        if (data.type === ''OK'') {',
'            window.localStorage.clear();',
'            window.location.href = data.url;',
'        }else{',
'            apex.message.showErrors({',
'                type: apex.message.TYPE.ERROR,',
'                location: ["page"],',
'                message: data.msg,',
'                unsafe: false',
'            });',
'        }',
'    }); ',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*var d = document.getElementById("workflow"); ',
'd.setAttribute("align","center");*/',
'',
''))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20231031174834'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7284234185620002)
,p_plug_name=>'WorkFlow'
,p_region_name=>'workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'false'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8015962558213502)
,p_plug_name=>'Datos Solicitud'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8664476708411404)
,p_plug_name=>unistr('Datos T\00EDtulo Judicial')
,p_region_name=>'datos_titulo'
,p_parent_plug_id=>wwv_flow_api.id(8015962558213502)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8918798176830401)
,p_plug_name=>unistr('Datos T\00EDtulo Judicial<style> 	#titulo_ig .t-Region-headerItems--title  	{background-color: #0466b8;color:white; 	} 	#titulo_ig:hover{box-shadow: 0px 0px 13px -3px rgba(0,0,0,0.6);transition: box-shadow 0.5s; 	} 	#titulo_ig{border-color:#0466b8;}	 </s')
||'tyle>'
,p_region_name=>'titulo_ig'
,p_parent_plug_id=>wwv_flow_api.id(8664476708411404)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr(' select a.id_ttlo_jdcial as Id_T\00EDtulo,'),
unistr('        a.nmro_ttlo_jdcial as Numero_T\00EDtulo, '),
unistr('        a.fcha_cnsttcion as Fecha_Constituci\00F3n,'),
'        a.vlor as Valor,',
'        a.nmbre_area as Nombre_Area,',
unistr('        a.idntfccion_dmnddo as Identificaci\00F3n_Demandado,'),
'        a.nmbre_dmnddo as Nombre_Demandado,',
'        a.cdgo_entdad_cnsgnnte as Cod_Entidad_Demandante,',
unistr('        --a.idntfccion_dmndnte as Identificaci\00F3n_Demandante,'),
'        case when a.nmbre_bnco_cnsgnnte is not null then ',
'            a.nmbre_bnco',
'        else',
'            a.nmbre_bnco_cnsgnnte',
'        end as nmbre_bnco,',
unistr('        a.dscrpcion_ttlo_estdo as Descripci\00F3n_Estado_T\00EDtulo,'),
'        a.id_instncia_fljo',
'   from v_gf_g_titulos_judicial a',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and a.idntfccion_dmnddo = ''985037''--39_IDNTFCCION_SLCTNTE',
'    and a.id_slctud is null',
'    --and a.cdgo_ttlo_jdcial_estdo not in (''APL'', ''FSN'');',
'    and a.cdgo_ttlo_jdcial_estdo not in (''ATJ'', ''DVL'');'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21031180248960323)
,p_name=>'ver'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver <br> Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#" onclick="irFlujo(&ID_INSTNCIA_FLJO.)" style="color:blue" >',
'    <span class="fa fa-eye"></span>',
'</a>',
''))
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21031293195960324)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(152953457003229404)
,p_name=>unistr('ID_T\00CDTULO')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('ID_T\00CDTULO')
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
 p_id=>wwv_flow_api.id(152953503082229405)
,p_name=>unistr('NUMERO_T\00CDTULO')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('NUMERO_T\00CDTULO')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('N\00FAmero T\00EDtulo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(152953616790229406)
,p_name=>unistr('FECHA_CONSTITUCI\00D3N')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('FECHA_CONSTITUCI\00D3N')
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha <br> Constituci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(152953765161229407)
,p_name=>'VALOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(152953866837229408)
,p_name=>'NOMBRE_AREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOMBRE_AREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Nombre \00C1rea')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(152953911284229409)
,p_name=>unistr('IDENTIFICACI\00D3N_DEMANDADO')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('IDENTIFICACI\00D3N_DEMANDADO')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n <br> Demandado')
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
 p_id=>wwv_flow_api.id(152954074767229410)
,p_name=>'NOMBRE_DEMANDADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOMBRE_DEMANDADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre <br> Demandado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(152954182295229411)
,p_name=>'COD_ENTIDAD_DEMANDANTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COD_ENTIDAD_DEMANDANTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cod Entidad Demandante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(152954261026229412)
,p_name=>'NMBRE_BNCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_BNCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Banco'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(152954331093229413)
,p_name=>unistr('DESCRIPCI\00D3N_ESTADO_T\00CDTULO')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('DESCRIPCI\00D3N_ESTADO_T\00CDTULO')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n <br> Estado T\00EDtulo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(152954679569229416)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>30
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(152954753590229417)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(153327291042851601)
,p_name=>'Ver Detalle'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>unistr('Ver Detalle<br>T\00EDtulo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_01=>'<span class="fa fa-eye">&EMPLOYEE_STATUS.</span>'
,p_link_target=>unistr('f?p=&APP_ID.:362:&SESSION.::&DEBUG.:RP:P362_ID_TTLO:&"ID_T\00CDTULO".')
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_display_condition_type=>'NEVER'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(152953315938229403)
,p_internal_uid=>152953315938229403
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
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(152980323345655548)
,p_interactive_grid_id=>wwv_flow_api.id(152953315938229403)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(152980412454655550)
,p_report_id=>wwv_flow_api.id(152980323345655548)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(312357017599)
,p_view_id=>wwv_flow_api.id(152980412454655550)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(21031180248960323)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100.941
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6805351026933)
,p_view_id=>wwv_flow_api.id(152980412454655550)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(21031293195960324)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152980979183655563)
,p_view_id=>wwv_flow_api.id(152980412454655550)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(152953457003229404)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152981459028655569)
,p_view_id=>wwv_flow_api.id(152980412454655550)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(152953503082229405)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>140.949
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152981970209655573)
,p_view_id=>wwv_flow_api.id(152980412454655550)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(152953616790229406)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152982445949655576)
,p_view_id=>wwv_flow_api.id(152980412454655550)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(152953765161229407)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>93.9922
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152982917609655578)
,p_view_id=>wwv_flow_api.id(152980412454655550)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(152953866837229408)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152983469075655581)
,p_view_id=>wwv_flow_api.id(152980412454655550)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(152953911284229409)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>198.938
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152983943362655583)
,p_view_id=>wwv_flow_api.id(152980412454655550)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(152954074767229410)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>216
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152984419441655586)
,p_view_id=>wwv_flow_api.id(152980412454655550)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(152954182295229411)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>103
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152984918848655588)
,p_view_id=>wwv_flow_api.id(152980412454655550)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(152954261026229412)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114.953
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152985445663655590)
,p_view_id=>wwv_flow_api.id(152980412454655550)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(152954331093229413)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152998677533948121)
,p_view_id=>wwv_flow_api.id(152980412454655550)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(152954679569229416)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>42
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(153332572616856581)
,p_view_id=>wwv_flow_api.id(152980412454655550)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(153327291042851601)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(153452548092129801)
,p_plug_name=>'Datos Demandante<style> 	#dnte_ig .t-Region-headerItems--title  	{background-color: #0466b8;color:white; 	} 	#dnte_ig:hover{box-shadow: 0px 0px 13px -3px rgba(0,0,0,0.6);transition: box-shadow 0.5s; 	} 	#dnte_ig{border-color:#0466b8;}	 </style>'
,p_region_name=>'dnte_ig'
,p_parent_plug_id=>wwv_flow_api.id(8664476708411404)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>6
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr(' select a.id_ttlo_jdcial as Id_T\00EDtulo,'),
'        a.cdgo_entdad_cnsgnnte as Cod_Entidad_Demandante,',
unistr('        --a.idntfccion_dmndnte as Identificaci\00F3n_Demandante,'),
'        case when a.nmbre_bnco_cnsgnnte is not null then ',
'            a.nmbre_bnco',
'        else',
'            a.nmbre_bnco_cnsgnnte',
'        end as nmbre_bnco,',
unistr('        a.dscrpcion_ttlo_estdo as Descripci\00F3n_Estado_T\00EDtulo'),
'       ',
'   from v_gf_g_titulos_judicial a',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and a.idntfccion_dmnddo = ''985037''--39_IDNTFCCION_SLCTNTE',
'    and a.id_slctud is null',
'    --and a.cdgo_ttlo_jdcial_estdo not in (''APL'', ''FSN'');',
'    and a.cdgo_ttlo_jdcial_estdo not in (''ATJ'', ''DVL'');'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(8918798176830401)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(153455766564129833)
,p_name=>'COD_ENTIDAD_DEMANDANTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COD_ENTIDAD_DEMANDANTE'
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
 p_id=>wwv_flow_api.id(153455944623129835)
,p_name=>'NMBRE_BNCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_BNCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Banco'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(153456030145129836)
,p_name=>unistr('DESCRIPCI\00D3N_ESTADO_T\00CDTULO')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('DESCRIPCI\00D3N_ESTADO_T\00CDTULO')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n Estado T\00EDtulo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(153456275263129838)
,p_name=>unistr('ID_T\00CDTULO')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('ID_T\00CDTULO')
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(152953457003229404)
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(153452603036129802)
,p_internal_uid=>153452603036129802
,p_is_editable=>false
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
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(153458485590137201)
,p_interactive_grid_id=>wwv_flow_api.id(153452603036129802)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(153458580216137209)
,p_report_id=>wwv_flow_api.id(153458485590137201)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(153483223114175476)
,p_view_id=>wwv_flow_api.id(153458580216137209)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(153455766564129833)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(153484225540175480)
,p_view_id=>wwv_flow_api.id(153458580216137209)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(153455944623129835)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(153484703090175482)
,p_view_id=>wwv_flow_api.id(153458580216137209)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(153456030145129836)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(153493885966217266)
,p_view_id=>wwv_flow_api.id(153458580216137209)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(153456275263129838)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(153454145505129817)
,p_plug_name=>'Datos Demandado<style> 	#ddo_ig .t-Region-headerItems--title  	{background-color: #0466b8;color:white; 	} 	#ddo_ig:hover{box-shadow: 0px 0px 13px -3px rgba(0,0,0,0.6);transition: box-shadow 0.5s; 	} 	#ddo_ig{border-color:#0466b8;}	 </style>'
,p_region_name=>'ddo_ig'
,p_parent_plug_id=>wwv_flow_api.id(8664476708411404)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_column=>7
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ',
unistr('        a.id_ttlo_jdcial as Id_T\00EDtulo,'),
unistr('        a.idntfccion_dmnddo as Identificaci\00F3n_Demandado,'),
'        a.nmbre_dmnddo as Nombre_Demandado',
'      ',
'        ',
'       ',
'   from v_gf_g_titulos_judicial a',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and a.idntfccion_dmnddo = ''985037''--39_IDNTFCCION_SLCTNTE',
'    and a.id_slctud is null',
'    --and a.cdgo_ttlo_jdcial_estdo not in (''APL'', ''FSN'');',
'    and a.cdgo_ttlo_jdcial_estdo not in (''ATJ'', ''DVL'');'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(8918798176830401)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(153455110307129827)
,p_name=>unistr('IDENTIFICACI\00D3N_DEMANDADO')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('IDENTIFICACI\00D3N_DEMANDADO')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n Demandado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(153455213465129828)
,p_name=>'NOMBRE_DEMANDADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOMBRE_DEMANDADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Demandado'
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
 p_id=>wwv_flow_api.id(153456145861129837)
,p_name=>unistr('ID_T\00CDTULO')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('ID_T\00CDTULO')
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(152953457003229404)
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(153454227815129818)
,p_internal_uid=>153454227815129818
,p_is_editable=>false
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
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(153459039543137211)
,p_interactive_grid_id=>wwv_flow_api.id(153454227815129818)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(153459102404137211)
,p_report_id=>wwv_flow_api.id(153459039543137211)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(153470320347137270)
,p_view_id=>wwv_flow_api.id(153459102404137211)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(153455110307129827)
,p_is_visible=>true
,p_is_frozen=>false
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(153470810723137272)
,p_view_id=>wwv_flow_api.id(153459102404137211)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(153455213465129828)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(153493493412217264)
,p_view_id=>wwv_flow_api.id(153459102404137211)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(153456145861129837)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9894201339271606)
,p_plug_name=>'Datos de la Solicitud'
,p_parent_plug_id=>wwv_flow_api.id(8015962558213502)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8664320173411403)
,p_plug_name=>'<b> DATOS SOLICITANTE </b>'
,p_parent_plug_id=>wwv_flow_api.id(9894201339271606)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8664592728411405)
,p_plug_name=>'<b> DATOS SOLICITUD </b>'
,p_parent_plug_id=>wwv_flow_api.id(9894201339271606)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(152837843052172832)
,p_plug_name=>'<b> DOCUMENTOS ADJUNTOS</b>'
,p_parent_plug_id=>wwv_flow_api.id(9894201339271606)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8664627417411406)
,p_plug_name=>'<b>DOCUMENTOS</b>'
,p_parent_plug_id=>wwv_flow_api.id(152837843052172832)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_dcmnto as Id_Documento,',
unistr('        c.dscrpcion_dcmnto as Descripci\00F3n_Documento,'),
'        a.file_name as Nombre_Archivo,',
unistr('        a.obsrvcion as Observaci\00F3n,'),
'        1 Descargar   ',
'   from pq_g_documentos             a',
'   join v_pq_g_solicitudes          b on a.id_slctud = b.id_slctud',
'   join v_pq_d_motivos_documento    c on a.id_mtvo_dcmnto = c.id_mtvo_dcmnto',
'  where b.id_instncia_fljo_gnrdo = :F_ID_INSTNCIA_FLJO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(152836385230172817)
,p_name=>'ID_DOCUMENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DOCUMENTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Documento'
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
 p_id=>wwv_flow_api.id(152836483173172818)
,p_name=>unistr('DESCRIPCI\00D3N_DOCUMENTO')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('DESCRIPCI\00D3N_DOCUMENTO')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n Documento')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(152836597719172819)
,p_name=>'NOMBRE_ARCHIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOMBRE_ARCHIVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Archivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>255
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
 p_id=>wwv_flow_api.id(152836640135172820)
,p_name=>unistr('OBSERVACI\00D3N')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('OBSERVACI\00D3N')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(152836797824172821)
,p_name=>'DESCARGAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCARGAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Descargar'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(152835736074172811)
,p_internal_uid=>152835736074172811
,p_is_editable=>false
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
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(152891706837196607)
,p_interactive_grid_id=>wwv_flow_api.id(152835736074172811)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(152891871459196607)
,p_report_id=>wwv_flow_api.id(152891706837196607)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152897242241209635)
,p_view_id=>wwv_flow_api.id(152891871459196607)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(152836385230172817)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152897772355209637)
,p_view_id=>wwv_flow_api.id(152891871459196607)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(152836483173172818)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152898209483209639)
,p_view_id=>wwv_flow_api.id(152891871459196607)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(152836597719172819)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152898722676209646)
,p_view_id=>wwv_flow_api.id(152891871459196607)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(152836640135172820)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152899216681209649)
,p_view_id=>wwv_flow_api.id(152891871459196607)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(152836797824172821)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8664173034411401)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'Esta funcionalidad permite:<br><br>',
unistr('<b>1.</b> Visualizar informaci\00F3n de la solicitud de PQR.<br><br>'),
unistr('<b>2.</b> Registrar t\00EDtulo judicial puntualmente.<br><br>'),
unistr('<b>3.</b> Modificar t\00EDtulo judicial puntualmente.<br><br>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(382693699525507133)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_api.id(8663377900407555)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(382693699525507133)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8663792149407557)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(382693699525507133)
,p_button_name=>'BTN_NUEVO_REGISTRO'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nuevo T\00EDtulo')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=62000:17:&SESSION.::&DEBUG.:RP:P17_ID_PRCSO:35'
,p_button_condition=>'P239_ID_TTLO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9893821028271602)
,p_branch_name=>'Regresar'
,p_branch_action=>'P239_BRANCH'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_when_button_id=>wwv_flow_api.id(8663377900407555)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(8919911880830413)
,p_branch_name=>'Ir a Pag  254'
,p_branch_action=>'f?p=&APP_ID.:254:&SESSION.::&DEBUG.:RP:P254_ID_SJTO_IMPSTO:&P239_ID_SJTO_IMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8016015517213503)
,p_name=>'P239_ID_INSTNCIA_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(8015962558213502)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8664872724411408)
,p_name=>'P239_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(8664592728411405)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_colspan=>6
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8664977779411409)
,p_name=>'P239_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(8664592728411405)
,p_prompt=>'Sub - Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_SUBIMPUESTO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select upper(nmbre_impsto_sbmpsto)  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8665043432411410)
,p_name=>'P239_ID_SJTO_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(8664592728411405)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8665129348411411)
,p_name=>'P239_IDNTFCCION_SJTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(8664592728411405)
,p_prompt=>'Sujeto'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>6
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8665284697411412)
,p_name=>'P239_ID_SLCTUD'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(8664592728411405)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8665360145411413)
,p_name=>'P239_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(8664592728411405)
,p_prompt=>unistr('N\00B0 Radicado')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8665440151411414)
,p_name=>'P239_FCHA_RDCDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(8664592728411405)
,p_prompt=>'Fecha Radicado'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8665676871411416)
,p_name=>'P239_DSCRPCION_RSPNSBLE_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(8664320173411403)
,p_prompt=>'Tipo de Responsable'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8665827804411418)
,p_name=>'P239_DSCRPCION_IDNTFCC_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(8664320173411403)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8665911477411419)
,p_name=>'P239_IDNTFCCION_SLCTNTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(8664320173411403)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8666057735411420)
,p_name=>'P239_NMBRE_SLCTNTE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(8664320173411403)
,p_prompt=>'Nombre'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8666186156411421)
,p_name=>'P239_UBCCION_SLCTNTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(8664320173411403)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8666357727411423)
,p_name=>'P239_DRCCION_NTFCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(8664320173411403)
,p_prompt=>unistr('Direcci\00F3n Notificaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8666465861411424)
,p_name=>'P239_EMAIL_SLCTNTE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(8664320173411403)
,p_prompt=>'E-mail'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8666521684411425)
,p_name=>'P239_TLFNO_SLCTNTE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(8664320173411403)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8666660488411426)
,p_name=>'P239_CLLAR_SLCTNTE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(8664320173411403)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8667565624411435)
,p_name=>'P239_ID_TTLO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(8664476708411404)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8668000142411440)
,p_name=>'P239_ID_SJTO_RSPNSBLE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(8664476708411404)
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P239_ID_TTLO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8668393577411443)
,p_name=>'P239_IDNTFCCION_DMNDNTE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(8664476708411404)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8668497432411444)
,p_name=>'P239_NMBRE_DMNDNTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(8664476708411404)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8668518508411445)
,p_name=>'P239_CDGO_IDNTFCCION_TPO_DMNDO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(8664476708411404)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8668620264411446)
,p_name=>'P239_IDNTFCCION_DMNDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(8664476708411404)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8668770597411447)
,p_name=>'P239_NMBRE_DMNDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(8664476708411404)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9874175056197001)
,p_name=>'P239_DRCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(8664592728411405)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9893711780271601)
,p_name=>'P239_BRANCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(8015962558213502)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9893981776271603)
,p_name=>'P239_UBCCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(8664592728411405)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9894084258271604)
,p_name=>'P239_MTVO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(8664592728411405)
,p_prompt=>'Motivo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153109475976202343)
,p_name=>'P239_ID_DMNDNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(8664476708411404)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153109522427202344)
,p_name=>'P239_ID_DMNDDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(8664476708411404)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(9527788685427801)
,p_computation_sequence=>10
,p_computation_item=>'P239_IDNTFCCION_DMNDNTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmro_idntfccion',
'  from df_s_clientes',
' where cdgo_clnte = :F_CDGO_CLNTE;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(8015812060213501)
,p_computation_sequence=>10
,p_computation_item=>'F_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P239_ID_INSTNCIA_FLJO'
,p_compute_when=>'P239_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8919639205830410)
,p_validation_name=>'Validar Datos Demandante'
,p_validation_sequence=>20
,p_validation=>':P239_IDNTFCCION_DMNDNTE is not null or :P239_IDNTFCCION_DMNDNTE is not null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Registre Nombre del Demandante.'
,p_validation_condition_type=>'NEVER'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8919877468830412)
,p_validation_name=>'Validar Datos Demandado'
,p_validation_sequence=>40
,p_validation=>':P239_IDNTFCCION_DMNDO is not null or :P239_NMBRE_DMNDO is not null or :P239_CDGO_IDNTFCCION_TPO_DMNDO is not null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Registre Datos del Demandado.'
,p_validation_condition_type=>'NEVER'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8919379687830407)
,p_name=>'Refrescar Cerrar Modal'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(8918798176830401)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8919446794830408)
,p_event_id=>wwv_flow_api.id(8919379687830407)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(8918798176830401)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10278417929958702)
,p_name=>unistr('Color Estado T\00EDtulos')
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(8918798176830401)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10278561723958703)
,p_event_id=>wwv_flow_api.id(10278417929958702)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'EVENT_SOURCE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery("span[data-style]").each(',
'  function()',
'  { ',
'    apex.jQuery(this).parent().attr(''style'', apex.jQuery(this).attr(''data-style'')); ',
'  }',
');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(152955596365229425)
,p_name=>'Seleccion_Fila'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(8918798176830401)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(152955698904229426)
,p_event_id=>wwv_flow_api.id(152955596365229425)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'obtenerDatos();',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8664771781411407)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Datos Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  a.id_impsto,',
'            a.id_impsto_sbmpsto,',
'            a.id_sjto_impsto,',
'            nvl(a.idntfccion_sjto_frmtda, a.idntfccion) as idntfccion_sjto_frmtda,',
'            b.drccion_ntfccion,',
'            b.ubccion,',
'            a.id_slctud,',
'            a.nmro_rdcdo_dsplay,',
'            a.fcha_rdcdo,',
'            a.dscrpcion_mtvo,',
'            -- Solicitante',
'            b.dscrpcion_rspnsble_tpo,',
'            b.dscrpcion_idntfccion_tpo,',
'            b.idntfccion,',
'            b.nmbre_slctnte,',
'            b.ubccion,',
'            b.drccion_ntfccion,',
'            b.email,',
'			b.tlfno,',
'			b.cllar',
'      into ',
'           :P239_ID_IMPSTO,',
'           :P239_ID_IMPSTO_SBMPSTO,',
'           :P239_ID_SJTO_IMPSTO,',
'           :P239_IDNTFCCION_SJTO,',
'           :P239_DRCCION,',
'           :P239_UBCCION,',
'           :P239_ID_SLCTUD,',
'           :P239_NMRO_RDCDO_DSPLAY,',
'           :P239_FCHA_RDCDO,',
'           :P239_MTVO,',
'           -- Solicitante',
'           :P239_DSCRPCION_RSPNSBLE_TPO,',
'           :P239_DSCRPCION_IDNTFCC_TPO,',
'           :P239_IDNTFCCION_SLCTNTE,',
'           :P239_NMBRE_SLCTNTE,',
'           :P239_UBCCION_SLCTNTE,',
'           :P239_DRCCION_NTFCCION,',
'           :P239_EMAIL_SLCTNTE,',
'           :P239_TLFNO_SLCTNTE,',
'           :P239_CLLAR_SLCTNTE',
'      from v_pq_g_solicitudes a',
'      join v_pq_g_solicitantes b on a.id_slctud = b.id_slctud',
'      where a.id_instncia_fljo_gnrdo = :P239_ID_INSTNCIA_FLJO;',
'exception',
'    when no_data_found then',
'       raise_application_error(-20000, ''Solicitud no encontrada'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar solicitud''); ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(152954804025229418)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(8918798176830401)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('T\00EDtulo Judicial<style> 	#titulo_ig .t-Region-headerItems--title  	{background-color: #0572CE;color:white; 	} 	#titulo_ig:hover{;box-shadow: 0px 0px 13px -2px rgba(0,0,0,0.6);transition: box-shadow 0.5s; 	}	 </style> - Save Interactive Grid Data')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21041199075004289)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IniciarFlujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_instncia_fljo number := apex_application.g_f01(1);',
'    v_id_fljo_trea number;',
'    v_url varchar2(4000);',
'    ',
'begin',
'    begin',
'        apex_json.open_object();  ',
'    ',
'    begin',
'    ',
'        select a.id_fljo_trea_orgen ',
'          into v_id_fljo_trea',
'          from wf_g_instancias_transicion a',
'         where a.id_instncia_fljo = v_id_instncia_fljo',
'           and a.id_estdo_trnscion in (1,2);',
'           ',
'    exception when no_data_found then',
'              ',
'              begin                   ',
'                  select distinct first_value(id_fljo_trea_orgen) over(order by id_instncia_trnscion desc) ',
'                    into v_id_fljo_trea',
'                    from wf_g_instancias_transicion ',
'                   where id_instncia_fljo = v_id_instncia_fljo;',
'                   ',
'              exception when no_data_found  then',
'                        v_id_fljo_trea := null;',
'              end;',
'    end;',
'    ',
'        if nvl(v_id_fljo_trea, -1) > 0 then',
'            apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo );',
'            apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea );            	',
'            v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => v_id_instncia_fljo,',
'                                                          p_id_fljo_trea     => v_id_fljo_trea,',
'                                                          p_clear_session    => ''S'');',
'        ',
'            apex_json.write(''type'', ''OK'');',
'            apex_json.write(''msg'', ''Url generada exitosamente'');',
'            apex_json.write(''url'', v_url);',
'        ',
'        else',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'', ''No existe tarea destino'');',
'        ',
'        end if;',
'        apex_json.close_object();',
'    ',
'    exception when others then ',
'      apex_json.open_object();',
'      apex_json.write(''type'', ''OK'');',
'      apex_json.write(''msg'',apex_escape.html(sqlerrm));',
'      apex_json.close_object();',
'  end;',
'  ',
'  apex_json.close_all();',
'  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
