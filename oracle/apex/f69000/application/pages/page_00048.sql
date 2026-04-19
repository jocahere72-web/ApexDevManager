prompt --application/pages/page_00048
begin
wwv_flow_api.create_page(
 p_id=>48
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Re-liquidaci\00F3n de veh\00EDculo')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Re-liquidaci\00F3n de veh\00EDculo')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function reliquidar(){    ',
'   ',
unistr('    //Obtenemos el modelo de la regi\00F3n del InteractiveGrid de Liquidaci\00F3n '),
'    var liquidaciones =   apex.region("reliquidacion").widget().interactiveGrid("getViews", "grid").model;',
'        ',
'    var vigencias  = [];',
'    var region = apex.region( "Liquidaciones2" );',
'',
'            try{',
'                var spinner = apex.util.showSpinner();      ',
'              let  resp = await apex.server.process(',
'                            ''Reliquidar'',',
'                            {',
'                                x01: $v(''P48_CDGO_CLNTE''),',
'                                x02: $v(''P48_ID_IMPSTO''),',
'                                x03: $v(''P48_ID_IMPSTO_SBMPSTO''),',
'                                x04: $v(''P48_ID_SJTO_IMPSTO''),  ',
'                                x05: ''LB'',',
'                                x06: $v(''P48_ID_USRIO''),',
'                                x07: ''ANU'', ',
'                                x08:$v(''P48_CDGO_MRCA''),',
'                                x09:$v(''P48_CDGO_CLSE''),',
'                                x10:$v(''P48_CDGO_SRVCIO''),',
'                                x11:$v(''P48_CDGO_OPRCIO''),',
'                                x12:$v(''P48_CDGO_CRRCRIA''),',
'                                x13:$v(''P48_MDLO''),',
'                                x14:JSON.stringify(obtener_datos()) ',
'',
'                            });',
'                        ',
'                          console.log(''repuesta1'',resp); ',
'                $("#apex_wait_overlay").remove();',
'                  $(".u-Processing").remove();',
'                           return resp; ',
'                ',
'                } catch (e) {',
'                    console.log(e);',
'                };',
'          //apex.navigation.dialog.close(true);',
' ',
'};',
'',
'',
'',
'function obtener_datos(){',
'    var v_array = [];',
'    var liquidaciones = apex.region("reliquidacion").widget().interactiveGrid("getViews", "grid").model;',
'    ',
'              liquidaciones.forEach(function(liquidacion) {',
'               v_array.push({"VGNCIA_LQDCION": liquidacion[liquidaciones.getFieldKey("VGNCIA_LQDCION")],',
'                  "LINEA": liquidacion[liquidaciones.getFieldKey("LNEA")].v,',
'                  "CLNDRJE":liquidacion[liquidaciones.getFieldKey("CLNDRJE")],',
'                  "BLNDJE":liquidacion[liquidaciones.getFieldKey("BLNDJE")].v,',
'                  "PRDO_LQDCION":liquidacion[liquidaciones.getFieldKey("PRDO_LQDCION")].v})',
'           ',
'                   });',
'             console.log(v_array); ',
'         return v_array;  ',
'};',
'',
'',
'function calcularCilindraje(){',
unistr('    //Obtenemos el modelo de la regi\00F3n del InteractiveGrid de Liquidaci\00F3n'),
'    var liquidaciones = apex.region("reliquidacion").widget().interactiveGrid("getViews", "grid").model;',
'  ',
'    liquidaciones.forEach(function(liquidacion) {   ',
'        try{',
'                apex.server.process(',
'                    ''calcularCilindraje'',',
'                    {',
'                        x01: liquidacion[liquidaciones.getFieldKey("VGNCIA_LQDCION")],',
'                        x02: liquidacion[liquidaciones.getFieldKey("LNEA")].v,',
'                        x03: $v(''P48_ID_SJTO_IMPSTO''),',
'                        x04: $v(''P48_CDGO_MRCA'')',
'                    }).then((resp) => {',
'                            console.log(''Respuesta:  '',resp);                            ',
'                            liquidaciones.setValue(liquidacion,"CLNDRJE",resp.v_clndrje); ',
'                    });       ',
'',
'        } catch (e) {',
'            console.log(e);',
'        };',
'',
'    });',
'',
'};',
'',
'',
'',
'',
'',
'',
'',
'/*function estadoLiquidacion(){',
unistr('    //Obtenemos el modelo de la regi\00F3n del InteractiveGrid de Liquidaci\00F3n'),
'    var liquidaciones = apex.region("reliquidacion").widget().interactiveGrid("getViews", "grid").model;',
'  ',
'    //Recorrido del InteractiveGrid',
'   var record =  apex.region("reliquidacion").widget().interactiveGrid("getSelectedRecords")[0];',
'   var registro =   liquidaciones.getValue(record,"INDCDOR");',
'',
'    //console.log(column);',
'    console.log(record);',
'    console.log(registro);',
'    //Recorrido del InteractiveGrid',
'    ',
'      if (registro === 1) {',
'                  ',
'                  ',
'                                console.log(''ENTRANDO EN TRUE'');',
'                     }',
'                    else {',
'        ',
'                              console.log(''ENTRANDO EN FALSE'');',
'                    }',
'                       ',
'    liquidaciones.forEach(function(liquidacion,index) {  ',
'        ',
'',
'        ',
'        ',
'        try{',
'                apex.server.process(',
'                    ''EstadoLiquidacion'',',
'                    {',
'                        x01: $v(''P33_CDGO_CLNTE''),',
'                        x02: $v(''P33_ID_IMPSTO''),',
'                        x03: $v(''P33_ID_IMPSTO_SBMPSTO''),',
'                        x04: $v(''P33_ID_SJTO_IMPSTO''),',
'                        x05: liquidacion[liquidaciones.getFieldKey("VGNCIA_LQDCION")],',
'                        x06: liquidacion[liquidaciones.getFieldKey("PRDO_LQDCION")].v',
'                    }).then((resp) => {',
'                            console.log(''Respuesta:  '',resp.o_mnsje_rspsta);',
'                         ',
'                    ',
'                            liquidaciones.setValue(liquidacion,"OBSRVCION",resp.o_mnsje_rspsta); ',
'                            liquidaciones.setValue(liquidacion,"INDCDOR",resp.o_cdgo_rspsta); ',
'                           ',
'                       ',
'                   ',
'                    });       ',
'',
'        } catch (e) {',
'            console.log(e);',
'        };',
'',
'    });',
'',
'};',
'*/',
'',
'',
''))
,p_javascript_code_onload=>'$(''#btn_branch'').hide();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-Toolbar {',
'    width: 100%;',
'    display: none;',
'}',
'',
'.fa-trash-o{',
'    color:red;',
'}',
'',
'.t-Form-label{',
'  font-weight: 700;',
'}',
'',
'.a-IRR-noDataMsg {',
'    padding: 0;',
'}',
''))
,p_step_template=>wwv_flow_api.id(88493856244834640)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'800'
,p_dialog_width=>'90%'
,p_last_updated_by=>'RROBLEDO'
,p_last_upd_yyyymmddhh24miss=>'20210405134429'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(97877148355567727)
,p_plug_name=>'Liquidaciones '
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88515074654834653)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(97875869724567714)
,p_plug_name=>'Liquidaciones '
,p_region_name=>'Liquidaciones2'
,p_parent_plug_id=>wwv_flow_api.id(97877148355567727)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88515074654834653)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select a.cdgo_cncpto||'' - ''|| a.dscrpcion_cncpto as cncpto',
'       , to_char(a.bse_cncpto,''FM$999G999G999G999G999G999G990'')  as bse_cncpto',
'       , c.vgncia',
'       , a.trfa  as trfa',
'       , to_char(a.vlor_lqddo,''FM$999G999G999G999G999G999G990'')  as vlor_lqddo',
'       , to_char(a.vlor_clcldo,''FM$999G999G999G999G999G999G990'') as vlor_clcldo',
'       , b.frccion',
'       , c.dscrpcion_lqdcion_estdo',
'    from v_gi_g_liquidaciones_concepto  a',
'    join v_gi_g_liquidaciones_ad_vehclo b on b.id_lqdcion         = a.id_lqdcion',
'    join v_gi_g_liquidaciones              c on c.id_lqdcion      = a.id_lqdcion',
'                                         --and c.cdgo_lqdcion_estdo = ''L''',
'   where c.id_sjto_impsto     = :P48_ID_SJTO_IMPSTO  '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97876268860567718)
,p_name=>'BSE_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BSE_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Concepto Base '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>29
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
 p_id=>wwv_flow_api.id(97876319271567719)
,p_name=>'TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRFA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tarifa '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
,p_max_length=>41
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
 p_id=>wwv_flow_api.id(97876428885567720)
,p_name=>'VLOR_LQDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_LQDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor liquidado '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>29
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
 p_id=>wwv_flow_api.id(97876554905567721)
,p_name=>'VLOR_CLCLDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CLCLDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Calculado '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>29
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
 p_id=>wwv_flow_api.id(97876824005567724)
,p_name=>'FRCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FRCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Fracci\00F3n ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(97876930605567725)
,p_name=>'CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Concepto '
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>108
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
 p_id=>wwv_flow_api.id(97877069555567726)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(98262171642276393)
,p_name=>'DSCRPCION_LQDCION_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_LQDCION_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(97875943245567715)
,p_internal_uid=>97875943245567715
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>true
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
 p_id=>wwv_flow_api.id(98054052147645948)
,p_interactive_grid_id=>wwv_flow_api.id(97875943245567715)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(98054196969645948)
,p_report_id=>wwv_flow_api.id(98054052147645948)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6278569196937986)
,p_view_id=>wwv_flow_api.id(98054196969645948)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(97876930605567725)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>312
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6284799704977903)
,p_view_id=>wwv_flow_api.id(98054196969645948)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(97877069555567726)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>79
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98055517578645984)
,p_view_id=>wwv_flow_api.id(98054196969645948)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(97876268860567718)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98056065179645986)
,p_view_id=>wwv_flow_api.id(98054196969645948)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(97876319271567719)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98056510094645988)
,p_view_id=>wwv_flow_api.id(98054196969645948)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(97876428885567720)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98057093856645990)
,p_view_id=>wwv_flow_api.id(98054196969645948)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(97876554905567721)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98058588379645996)
,p_view_id=>wwv_flow_api.id(98054196969645948)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(97876824005567724)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98272086654311974)
,p_view_id=>wwv_flow_api.id(98054196969645948)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(98262171642276393)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_filter(
 p_id=>wwv_flow_api.id(6277654600935891)
,p_report_id=>wwv_flow_api.id(98054052147645948)
,p_type=>'COLUMN'
,p_column_id=>wwv_flow_api.id(98262171642276393)
,p_operator=>'EQ'
,p_is_case_sensitive=>true
,p_expression=>'Liquidada'
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(111195316209244190)
,p_plug_name=>unistr('Reliquidaci\00F3n  2')
,p_region_name=>'reliquidacion'
,p_parent_plug_id=>wwv_flow_api.id(97877148355567727)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders:js-showMaximizeButton:t-Form--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select x.vgncia_lqdcion',
'     , x.prdo_lqdcion',
'     , x.lnea',
'     , x.clndrje',
'     , x.blndje    ',
'     , z.dscrpcion',
'     , z.indcdor',
'     , z.id_lqdcion',
'     , case when z.indcdor = 1 then',
'                    ''<span aria-hidden="true" class="fa fa-trash-o"></span>'' ',
'            else',
'                    ''''',
'       end as elmnar              ',
'  from (',
'            select a.vgncia_lqdcion',
'                 , (',
'                        select id_prdo',
'                          from df_i_periodos',
'                         where cdgo_clnte        = :F_CDGO_CLNTE',
'                           and id_impsto         = :P48_ID_IMPSTO',
'                           and id_impsto_sbmpsto = :P48_ID_IMPSTO_SBMPSTO',
'                           and vgncia            = a.vgncia_lqdcion',
'                    ) as prdo_lqdcion',
'                 , a.lnea',
'                 , a.blndje',
'                 , a.clndrje',
'                 , :P48_ID_SJTO_IMPSTO    as id_sjto_impsto',
'                 , :P48_ID_IMPSTO         as id_impsto',
'                 , :P48_ID_IMPSTO_SBMPSTO as id_impsto_sbmpsto',
'                 , :F_CDGO_CLNTE          as cdgo_clnte',
'              from (',
'                         select (level + (:P48_VGNCIA_INCIO_LQDCION)) - 1  vgncia_lqdcion',
'                              , null as lnea',
'                              , null as blndje',
'                              , null as clndrje',
'                           from dual',
'                        connect by (level + (:P48_VGNCIA_INCIO_LQDCION)) - 1 <= extract (year from sysdate)',
'                    ) a',
'        ) x',
'     left join table(pkg_gi_vehiculos.fnc_co_liquidacion_estado( p_id_sjto_impsto => :P48_ID_SJTO_IMPSTO',
'                                                               , p_vgncia         => x.vgncia_lqdcion',
'                                                               , p_id_priodo      => x.prdo_lqdcion)) z on 1 = 1 ',
'                                                               ',
'                                                               ',
'                     '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111195769283244194)
,p_name=>'VGNCIA_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA_LQDCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Vigencia '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_static_id=>'VGNCIA_LQDCION'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111195844105244195)
,p_name=>'PRDO_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO_LQDCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Periodo '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select prdo    as d',
'        , id_prdo as r',
'     from df_i_periodos'))
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
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111195926345244196)
,p_name=>'LNEA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LNEA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>unistr('L\00EDnea ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
,p_is_required=>false
,p_max_length=>0
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select l.dscrpcion_vhclo_lnea||'' - [''||d.clndrje_dsde||'']'' as d',
'     , d.id_vhclo_grpo                                     as r',
'  from df_s_vehiculos_grupo d',
'  join df_s_vehiculos_linea l on d.id_vhclo_lnea = l.id_vhclo_lnea',
'  join  df_s_vehiculos_clase_ctgria h  on h.id_vhclo_clse_ctgria = d.id_vhclo_clse_ctgria and h.vgncia =  d.vgncia',
'  and d.cdgo_vhclo_mrca = l.cdgo_vhclo_mrca',
'  where d.vgncia   = :VGNCIA_LQDCION',
'   and h.cdgo_vhclo_clse      =  :P48_CDGO_CLSE',
'   and h.cdgo_vhclo_ctgtria   =  :P48_VHCLO_CTGTRIA',
'   and d.cdgo_vhclo_mrca      =  :P48_CDGO_MRCA',
'   and l.mnstrio              = ''S'''))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'VGNCIA_LQDCION'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_static_id=>'lnea'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'PLSQL_EXPRESSION'
,p_readonly_condition=>':INDCDOR != 0'
,p_readonly_for_each_row=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111196044454244197)
,p_name=>'BLNDJE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BLNDJE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Blindaje '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_vhclo_blndje as d',
'     , cdgo_vhclo_blndje      as r',
'  from df_s_vehiculos_blindaje',
''))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'VGNCIA_LQDCION'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'PLSQL_EXPRESSION'
,p_readonly_condition=>':INDCDOR != 0'
,p_readonly_for_each_row=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111196159493244198)
,p_name=>'CLNDRJE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLNDRJE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Cilindraje '
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>0
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_static_id=>'CLNDRJE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'PLSQL_EXPRESSION'
,p_readonly_condition=>':INDCDOR != 0'
,p_readonly_for_each_row=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111196449145244201)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado '
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111196526677244202)
,p_name=>'INDCDOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR'
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
 p_id=>wwv_flow_api.id(111196797081244205)
,p_name=>'ELMNAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ELMNAR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Inactivar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&ELMNAR.'
,p_link_target=>'f?p=&APP_ID.:48:&SESSION.:inactivarLiquidacion:&DEBUG.:RP:P48_ID_LQDCION:&ID_LQDCION.'
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
 p_id=>wwv_flow_api.id(111196913050244206)
,p_name=>'ID_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_LQDCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(111195383003244191)
,p_internal_uid=>111195383003244191
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
 p_id=>wwv_flow_api.id(111260385981662033)
,p_interactive_grid_id=>wwv_flow_api.id(111195383003244191)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(111260556904662035)
,p_report_id=>wwv_flow_api.id(111260385981662033)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17827773820025789)
,p_view_id=>wwv_flow_api.id(111260556904662035)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(111196797081244205)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>52
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17836450664218557)
,p_view_id=>wwv_flow_api.id(111260556904662035)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(111196913050244206)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111261988603662074)
,p_view_id=>wwv_flow_api.id(111260556904662035)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(111195769283244194)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>121
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111262543448662075)
,p_view_id=>wwv_flow_api.id(111260556904662035)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(111195844105244195)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>101
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111262984975662078)
,p_view_id=>wwv_flow_api.id(111260556904662035)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(111195926345244196)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>354
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111263498892662080)
,p_view_id=>wwv_flow_api.id(111260556904662035)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(111196044454244197)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111263978578662082)
,p_view_id=>wwv_flow_api.id(111260556904662035)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(111196159493244198)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111264523471662083)
,p_view_id=>wwv_flow_api.id(111260556904662035)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(111196449145244201)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>341
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111265019680662085)
,p_view_id=>wwv_flow_api.id(111260556904662035)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(111196526677244202)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>107
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(17845704479308631)
,p_view_id=>wwv_flow_api.id(111260556904662035)
,p_execution_seq=>5
,p_name=>'Ya tienen Cartera'
,p_background_color=>'#D2EEFC'
,p_text_color=>'#000000'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(111196526677244202)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'2'
,p_is_enabled=>true
);
end;
/
begin
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(17845784453312713)
,p_view_id=>wwv_flow_api.id(111260556904662035)
,p_execution_seq=>10
,p_name=>unistr('Ya tienen Liquidaci\00F3n Valida')
,p_background_color=>'#D2EEFC'
,p_text_color=>'#000000'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(111196526677244202)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'1'
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(97877221387567728)
,p_plug_name=>unistr('Reliquidaci\00F3n ')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88515074654834653)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7465367443794301)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(97875869724567714)
,p_button_name=>'btn_branch'
,p_button_static_id=>'btn_branch'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(88588617354834707)
,p_button_image_alt=>'Btn Branch'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:47:&SESSION.:regresar:&DEBUG.:::'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6282394449936011)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(97875869724567714)
,p_button_name=>'Btn_Reliquidar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reliquidar'
,p_button_position=>'BOTTOM'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-rotate-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6299199361936193)
,p_branch_name=>unistr('ir a consulta caracter\00EDsticas liquidaci\00F3n ')
,p_branch_action=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.::P29_ID_SJTO_IMPSTO:&P33_ID_SJTO_IMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'consultar'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6282717466936017)
,p_name=>'P48_VGNCIA_INCIO_LQDCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(97877221387567728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6283161210936034)
,p_name=>'P48_ID_SJTO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(97877221387567728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6283547519936035)
,p_name=>'P48_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(97877221387567728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6283920625936035)
,p_name=>'P48_ID_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(97877221387567728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6284313282936035)
,p_name=>'P48_CDGO_CLNTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(97877221387567728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6284704558936035)
,p_name=>'P48_ID_USRIO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(97877221387567728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6285119809936035)
,p_name=>'P48_ID_LQDCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(97877221387567728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6285532493936036)
,p_name=>'P48_CDGO_MRCA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(97877221387567728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6285930482936036)
,p_name=>'P48_CDGO_CLSE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(97877221387567728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6286394529936036)
,p_name=>'P48_CDGO_SRVCIO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(97877221387567728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6286708342936036)
,p_name=>'P48_CDGO_OPRCIO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(97877221387567728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6287166074936045)
,p_name=>'P48_CDGO_CRRCRIA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(97877221387567728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6287564012936045)
,p_name=>'P48_MDLO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(97877221387567728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6804826757875201)
,p_name=>'P48_VHCLO_CTGTRIA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(97877221387567728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8028344055128402)
,p_name=>'P48_RSTA'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(97877221387567728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8726518172997001)
,p_name=>'P48_AVALUO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(97877221387567728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(6292507644936136)
,p_computation_sequence=>10
,p_computation_item=>'P48_CDGO_CLNTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'F_CDGO_CLNTE'
,p_compute_when=>'P48_CDGO_CLNTE'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(6292808976936148)
,p_computation_sequence=>20
,p_computation_item=>'P48_ID_USRIO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'F_ID_USRIO'
,p_compute_when=>'P48_ID_USRIO'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6296390899936182)
,p_name=>'Al dar click '
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(6282394449936011)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6296819630936187)
,p_event_id=>wwv_flow_api.id(6296390899936182)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function consultar(){',
'    try{',
'        ',
'      ',
'       console.log(x);',
'       apex.submit(''consultar''); ',
'        ',
'    }catch(e){',
'                console.log(e);',
'        }',
'};',
'',
'async function liquidarL() {',
'',
'    var liquidacionesGrid = apex.region("reliquidacion").widget().interactiveGrid("getViews", "grid").model;',
'    var totaRegistro = liquidacionesGrid.getTotalRecords();',
'    var bloqueado = 0;',
'    var cont = 0;',
'    var cont2 = 0;',
'',
'    console.log(''numero de fila:'', totaRegistro);',
'',
'    liquidacionesGrid.forEach(function(liquidacion) {',
'        console.log(''entrando al para'', cont);',
'        if (liquidacion[liquidacionesGrid.getFieldKey("INDCDOR")] == '''') {',
'            if (liquidacion[liquidacionesGrid.getFieldKey("LNEA")].v == '''' ||',
'                liquidacion[liquidacionesGrid.getFieldKey("CLNDRJE")] == '''' ||',
'                liquidacion[liquidacionesGrid.getFieldKey("BLNDJE")].v == '''') {',
'                cont += 1;',
'                console.log(''entrando al desbloqueado'', cont);',
'            }',
'        } else {',
'',
'            cont2 += 1;',
'            console.log(''entrando al bloqueado'', cont2);',
'',
'        }',
'',
'    });',
'',
'  ',
'    if (cont > 0) {',
'            apex.item(''P48_RSTA'').setValue(''N'');',
'        Swal.fire({ // icon: ''error'',',
unistr('            title: ''<H2 >Validaci\00F3n</H2>'','),
unistr('            html: `<h4>Faltan datos para la liquidaci\00F3n, por favor valide e intente nevamente</h4>`'),
'            ',
'        });',
'     ',
'        $(''#btn_branch'').click();',
'',
'    } else if (cont2 > 0) {',
'       var resp = await reliquidar();',
'      if (resp.o_cdgo_rspsta == 0) {',
'             apex.item(''P48_RSTA'').setValue(''S'');',
'            Swal.fire({',
'                title: ''<H2 >Exito</H2>'',',
'                html: `<h4> ${resp.o_mnsje_rspsta} </h4>`',
'            }).then((result) => {',
'           /*  $(''#btn_branch'').click();*/',
'           ',
'              apex.submit(''regresar'');  ',
'       ',
'            });',
'           // apex.navigation.dialog.close(true)',
'',
'        }',
'    } else {',
'',
'        var resp = await reliquidar();',
'        console.log(''repuesta2'', resp);',
'        if (resp.o_cdgo_rspsta == 0) {',
'            Swal.fire({',
'                title: ''<H2 >Exito</H2>'',',
'                html: `<h4> ${resp.o_mnsje_rspsta} </h4>`',
'            }).then((result) => {',
'          /*    $(''#btn_branch'').click();*/',
'                 apex.item(''P48_RSTA'').setValue(''S'');',
'                apex.submit(''regresar''); ',
'            });',
'            //apex.navigation.dialog.close(true)',
'',
'        }',
'',
'    }',
'',
'};',
'obtener_datos();',
'liquidarL();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6298145534936188)
,p_name=>'Refrescar_region'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6298693726936190)
,p_event_id=>wwv_flow_api.id(6298145534936188)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(97875869724567714)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8933760266564101)
,p_name=>'obtener el cilindraje'
,p_event_sequence=>50
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(111195316209244190)
,p_triggering_element=>'BLNDJE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8933818545564102)
,p_event_id=>wwv_flow_api.id(8933760266564101)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calcularCilindraje();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6294242473936162)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Inactivar Liquidaci\00F3n ')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'        v_indcdor number;',
'        v_error   exception; ',
'begin',
'        v_indcdor := pkg_gi_vehiculos.fnc_ac_liquidacion_vehiculo(p_lquidcion          => :P48_ID_LQDCION,',
'                                                                  p_cdgo_lqdcion_estdo => ''I'');',
'        ',
'        if v_indcdor <> 0 then',
'              raise v_error;              ',
'        end if;',
'exception ',
'        when others then    ',
unistr('                raise_application_error(-20000 , ''Error al inactvar la liquidaci\00F3n #''||:P48_ID_LQDCION);'),
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'inactivarLiquidacion'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6293192776936148)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Crear_collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''LIQUIDACION'');',
'End;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6293537278936150)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'calcularCilindraje'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  ',
'  cursor c1 (R_id_vhclo_grpo in number)is         ',
'       select d.clndrje_dsde',
'      from df_s_vehiculos_grupo d',
'       where d.id_vhclo_grpo = R_id_vhclo_grpo; ',
'      ',
'        v_clndrje         number;',
'        v_cdgo_vhclo_mrca varchar2(10);',
'        v_id_vhclo_lnea  number;',
'        v_vgncia         number;',
'        ',
'        ',
'begin',
unistr('   --recibiendo los par\00E1metros de ajax'),
'   ',
'  -- v_vgncia            := apex_application.g_x01;',
'   v_id_vhclo_lnea     := apex_application.g_x02;',
' --  v_id_sjto_impsto    := apex_application.g_x03;',
' --- v_cod_marca         := apex_application.g_x04;',
'   ',
'',
'    for r1 in c1(v_id_vhclo_lnea) loop ',
'            v_clndrje := r1.clndrje_dsde;',
'    end loop; ',
'',
'',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'' , 0);',
'    apex_json.write(''o_mnsje_rspsta'',''OK'');',
'    apex_json.write(''v_clndrje''     , v_clndrje);',
'    apex_json.close_object();',
'    ',
'exception when others then',
'',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'' , 1);',
'        apex_json.write(''o_mnsje_rspsta'',''No se encontro Cilindraje'');        ',
'        apex_json.write(''v_id_vhclo_lnea'' , v_id_vhclo_lnea);',
'        apex_json.write(''v_vgncia'' , v_vgncia);',
'        apex_json.close_object();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6294679335936162)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reliquidar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'   v_vgncia        number;',
'   v_id_vhclo_lnea number;',
'   v_clndrje       number;',
'   v_blndje        number;',
'   v_trfa          number;',
'   v_fraccion      number;',
'   v_salida        number;',
'   v_avluo         number;',
'   v_cdgo_rspsta   number;',
'   v_mnsje_rspsta  varchar2(1000);',
'   v_error         exception;',
' ',
'  v_cdgo_clnte         number; ',
'  v_id_impsto          number; ',
'  v_id_impsto_sbmpsto  number; ',
'  v_id_sjto_impsto     number;',
'  v_cdgo_vhclo_blndje  varchar2(3); ',
'  v_id_prdo            number; ',
'  v_cdgo_lqdcion_tpo   varchar2(2); ',
'  v_id_usrio           number; ',
'  v_cdgo_prdcdad       varchar2(3); ',
'  v_o_id_lqdcion       number;',
'  v_tpo_lqdcion        varchar2(3); ',
'  v_cdgo_vhclo_mrca    varchar2(10); ',
'  v_cdgo_vhclo_clse    varchar2(10); ',
'  v_cdgo_vhclo_srvcio  varchar2(10);',
'  v_cdgo_vhclo_oprcion varchar2(10);',
'  v_cdgo_vhclo_crrcria varchar2(10);',
'  v_mdlo               number; ',
'  v_json              clob;   ',
'  v_array             varchar2(1000):= ''[]''; ',
'  v_array_liq         json_array_t; ',
'  v_json_1            json_object_t;',
'  v_lquidacion        varchar2(1000); ',
'  v_avaluo            number; ',
'  v_to_json           clob;',
'begin',
'',
unistr('   --recibiendo los par\00E1metros de ajax'),
'   v_cdgo_clnte        := apex_application.g_x01;',
'   v_id_impsto         := apex_application.g_x02;',
'   v_id_impsto_sbmpsto := apex_application.g_x03;',
'   v_id_sjto_impsto    := apex_application.g_x04;',
'   v_cdgo_lqdcion_tpo  := apex_application.g_x05;',
'   v_id_usrio          := apex_application.g_x06;',
'   v_cdgo_prdcdad      := apex_application.g_x07;',
'  v_cdgo_vhclo_mrca    := apex_application.g_x08;',
'  v_cdgo_vhclo_clse    := apex_application.g_x09;',
'  v_cdgo_vhclo_srvcio  := apex_application.g_x10;',
'  v_cdgo_vhclo_oprcion := apex_application.g_x11;',
'  v_cdgo_vhclo_crrcria := apex_application.g_x12; ',
'  v_mdlo               := apex_application.g_x13; ',
'  v_json               := apex_application.g_x14;',
'   ',
'',
'',
'',
'   /* proceso de novedades */',
'   ',
'/* pkg_gi_vehiculos.prc_vl_nvdds_vhclos(p_id_sjto_impsto     => :P47_ID_SJTO_IMPSTO,',
'                                     p_vhclo_clse          => :P47_VHCLO_CLSE_1,',
'                                     p_vhclo_mrca          => :P47_VHCLO_MRCA_1,',
'                                     p_vhclo_lnea          => :P47_VHCLO_LNEA_1,',
'                                     p_clndrje             => :P47_CLNDRJE_1,',
'                                     p_mdlo                => :P47_MDLO_1,',
'                                     p_fcha_cmpra          => :P47_FCHA_CMPRA_1,',
'                                     p_fcha_mtrcla         => :P47_FCHA_MTRCLA_1,',
'                                     p_fcha_imprtcion      => :P47_FCHA_IMPRTCION_1,',
'                                     p_blnddo              => :P47_BLNDDO_1,',
'                                     p_vhclo_crrcria       => :P47_VHCLO_CRRCRIA_1,',
'                                     p_vhclo_srvcio        => :P47_VHCLO_SRVCIO_1,',
'                                     p_vhclo_oprcion       => :P47_VHCLO_OPRCION_1,',
'                                     p_cpcdad_crga         => :P47_CPCDAD_CRGA_1,',
'                                     p_cpcdad_psjro        => :P47_CPCDAD_PSJRO_1,',
'                                     p_nmro_mtor           => :P47_NMRO_MTOR_1,',
'                                     p_nmro_chsis          => :P47_NMRO_CHSIS_1,',
'                                     p_dclrcion_imprtcion  => :P47_DCLRCION_IMPRTCION_1,',
'                                     p_nmro_mtrcla         => :P47_NMRO_MTRCLA_1,',
'                                     p_avluo               => :P47_AVLUO_1,',
'                                     p_vlor_cmrcial        => :P47_VLOR_CMRCIAL_1,',
'                                     p_orgnsmo_trnsto      => :P47_ORGNSMO_TRNSTO_1,',
'                                     p_vhclo_cmbstble      => :P47_VHCLO_CMBSTBLE_1,',
'                                     p_vhclo_trnsmsion     => :P47_VHCLO_TRNSMSION_1,',
'                                     p_clsco_s_n           => :P47_CLSCO_S_N_1,',
'                                     p_intrndo_s_n         => :P47_INTRNDO_S_N_1,',
'                                     p_dprtmnto            => :P47_DPRTMNTO_1,',
'                                     p_mncpio              => :P47_MNCPIO_1,',
'                                     p_cdgo_nvda           => :P47_CDGO_NVDDA,',
'                                     p_fcha_nvvdad         => :P47_FECHA_NOVEDAD,',
'                                     o_cdgo_rspsta         => v_cdgo_rspsta,',
'                                     o_mnsje_rspsta        => v_mnsje_rspsta);*/',
'                                                          ',
'                      ',
'                    /*insert into muerto (v_001,t_001) values (''saliendo de novedad validacion''||''o_cdgo_rspsta: ''||v_cdgo_rspsta||''v_mnsje_rspsta: ''||v_mnsje_rspsta,systimestamp);    ',
'                    commit;*/',
'    ',
'    -- Validamos si ocurrio error    ',
'/*    if v_cdgo_rspsta <> 0 then',
'      raise_application_error(-20000 , v_mnsje_rspsta);',
'    end if;*/',
'',
'  /*insert into muerto (v_001,t_001) values (v_cdgo_clnte||'' - ''||v_id_impsto ||'' - ''||v_id_impsto_sbmpsto ||'' - ''||v_id_sjto_impsto||'' - ''||',
'                                      v_vgncia ||'' - ''||v_id_vhclo_lnea||'' - ''||v_clndrje ||'' - ''||v_cdgo_vhclo_blndje||'' - ''||',
'                                      v_id_prdo ||'' - ''||v_cdgo_lqdcion_tpo ||'' - ''||v_id_usrio ||'' - ''||v_cdgo_prdcdad||''-''||v_cdgo_vhclo_clse||''-''||v_cdgo_vhclo_mrca||''-''||v_mdlo,systimestamp);commit;*/',
'',
'',
'   ',
'/*insert into muerto (v_001,c_001) values (v_vgncia||''-''||v_id_vhclo_lnea||''-''||v_clndrje,v_json); commit;*/',
'',
'insert into muerto (v_001) values (''avaluo new''||replace(TO_CHAR(:P47_AVLUO_1),'','','''')); commit;',
'',
'pkg_gi_vehiculos.prc_rg_reliquidacion_vehiculo(p_cdgo_clnte => v_cdgo_clnte,',
'                                               p_id_impsto => v_id_impsto,',
'                                               p_id_impsto_sbmpsto => v_id_impsto_sbmpsto,',
'                                               p_id_sjto_impsto => v_id_sjto_impsto,',
'                                               p_cdgo_lqdcion_tpo => v_cdgo_lqdcion_tpo,',
'                                               p_id_usrio => v_id_usrio,',
'                                               p_cdgo_prdcdad => v_cdgo_prdcdad,',
'                                               p_cdgo_vhclo_mrca => v_cdgo_vhclo_mrca,',
'                                               p_cdgo_vhclo_clse => v_cdgo_vhclo_clse,',
'                                               p_cdgo_vhclo_srvcio => v_cdgo_vhclo_srvcio,',
'                                               p_cdgo_vhclo_oprcion => v_cdgo_vhclo_oprcion,',
'                                               p_cdgo_vhclo_crrcria => v_cdgo_vhclo_crrcria,',
'                                               p_mdlo => v_mdlo,',
'                                               p_json => v_json,',
'                                               p_avluo => replace(TO_CHAR(:P47_AVLUO_1),'','',''''),',
'                                               o_cdgo_rspsta => v_cdgo_rspsta,',
'                                               o_mnsje_rspstas => v_mnsje_rspsta);   ',
'',
'',
'   ',
'',
'   ',
'insert into muerto (v_001,t_001) values (''id_lqdcion: ''||v_o_id_lqdcion||''o_cdgo_rspsta: ''||v_cdgo_rspsta||''v_mnsje_rspsta: ''||v_mnsje_rspsta,systimestamp);commit;',
'   -- :P24_ID_LQDCION := v_o_id_lqdcion;',
'',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'', 0);',
'    apex_json.write(''o_mnsje_rspsta'',v_mnsje_rspsta);',
'   -- apex_json.write(''id_lqdcion'', v_o_id_lqdcion);',
'    --apex_json.write(''v_vgncia'', v_vgncia);',
'    apex_json.close_object();',
'    ',
'',
'end;      '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6295022777936164)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'EstadoLiquidacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'  v_cdgo_clnte        number; ',
'  v_id_impsto         number; ',
'  v_id_impsto_sbmpsto number; ',
'  v_id_sjto_impsto    number;',
'  v_vgncia            number;',
'  v_id_prdo           number;',
'  v_o_cdgo_rspsta     number; ',
'  v_o_mnsje_rspsta    varchar2(4000);',
'begin ',
'  /* Recibiendo parametro de ajax   */',
'   v_cdgo_clnte        := apex_application.g_x01;',
'   v_id_impsto         := apex_application.g_x02;',
'   v_id_impsto_sbmpsto := apex_application.g_x03;',
'   v_id_sjto_impsto    := apex_application.g_x04;',
'   v_vgncia            := apex_application.g_x05;',
'   v_id_prdo           := apex_application.g_x06;',
'',
'  /* Procedieminto de estado de vehiculos  */',
'   pkg_gi_vehiculos.prc_co_estdo_lqdcion_vehiculos(p_cdgo_clnte         => v_cdgo_clnte,',
'                                                    p_id_impsto         => v_id_impsto,',
'                                                    p_id_impsto_sbmpsto => v_id_impsto_sbmpsto,',
'                                                    p_id_sjto_impsto    => v_id_sjto_impsto,',
'                                                    p_vgncia            => v_vgncia,',
'                                                    p_id_prdo           => v_id_prdo,',
'                                                    o_cdgo_rspsta       => v_o_cdgo_rspsta,',
'                                                    o_mnsje_rspsta      => v_o_mnsje_rspsta);',
'',
'',
'',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'',  v_o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_o_mnsje_rspsta);',
'    apex_json.write(''prmtros'', ''v_cdgo_clnte: ''||v_cdgo_clnte||'', v_id_impsto: ''||v_id_impsto||'', v_id_impsto_sbmpsto: ''||v_id_impsto_sbmpsto||'', v_id_sjto_impsto: ''||v_id_sjto_impsto',
'                    ||'', v_vgncia: ''||v_vgncia||'', v_id_prdo: ''||v_id_prdo);',
'    apex_json.close_object();',
'',
'end ; ',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
