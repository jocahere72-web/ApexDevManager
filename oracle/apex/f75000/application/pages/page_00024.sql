prompt --application/pages/page_00024
begin
wwv_flow_api.create_page(
 p_id=>24
,p_user_interface_id=>wwv_flow_api.id(237318207209524256)
,p_name=>unistr('Liquidaci\00F3n de Veh\00EDculo  ')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Liquidaci\00F3n de Veh\00EDculo  ')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function obtener_datos(){',
'    var v_array = [];',
'',
'    var liquidaciones = apex.region("liquidacion").widget().interactiveGrid("getViews", "grid").model;',
'              liquidaciones.forEach(function(liquidacion) {',
'               v_array.push({"VGNCIA_LQDCION": liquidacion[liquidaciones.getFieldKey("VGNCIA_LQDCION")],',
'                  "LINEA": liquidacion[liquidaciones.getFieldKey("LNEA")].v,',
'                  "CLNDRJE":liquidacion[liquidaciones.getFieldKey("CLNDRJE")],',
'                  "BLNDJE":liquidacion[liquidaciones.getFieldKey("BLNDJE")].v,',
'                  "PRDO_LQDCION":liquidacion[liquidaciones.getFieldKey("PRDO_LQDCION")].v})',
'',
'                   });',
'         ',
'             console.log(v_array); ',
'             return v_array;  ',
'};',
'',
'',
'',
'',
'',
'function calcularCilindraje(){',
unistr('    //Obtenemos el modelo de la regi\00F3n del InteractiveGrid de Liquidaci\00F3n'),
'    var liquidaciones = apex.region("liquidacion").widget().interactiveGrid("getViews", "grid").model;',
'',
'    //Recorrido del InteractiveGrid',
'    liquidaciones.forEach(function(liquidacion) {   ',
'        try{',
'                apex.server.process(',
'                    ''CalcularCilindraje'',',
'                    {',
'                        x01: liquidacion[liquidaciones.getFieldKey("VGNCIA_LQDCION")],',
'                        x02: liquidacion[liquidaciones.getFieldKey("LNEA")].v,',
'                        x03: $v(''P24_ID_SJTO_IMPSTO'')',
'                       ',
'                    }).then((resp) => {              ',
'                            console.log(''Respuesta:  '',resp);',
'                            liquidaciones.setValue(liquidacion,"CLNDRJE",resp.v_clndrje); ',
'                    });       ',
'',
'        } catch (e) {',
'            console.log(e);',
'        };',
'',
'    });',
'',
'}',
'',
'',
'',
'async function reliquidar() {',
unistr('  //Obtenemos el modelo de la regi\00F3n del InteractiveGrid de Liquidaci\00F3n'),
'  var liquidaciones = apex',
'    .region("liquidacion")',
'    .widget()',
'    .interactiveGrid("getViews", "grid").model;',
'',
'  var vigencias = [];',
'   var spinner = apex.util.showSpinner();',
'  console.log($v("P24_CDGO_CLNTE"),$v(''P24_ID_IMPSTO''),$v(''P24_ID_IMPSTO_SBMPSTO''),$v(''P24_ID_SJTO_IMPSTO''));',
'',
'  try {',
'    let resp = await apex.server.process("CalcularLiquidacion", {',
'        x01: $v("P24_CDGO_CLNTE"),',
'        x02: $v(''P24_ID_IMPSTO''),',
'        x03: $v(''P24_ID_IMPSTO_SBMPSTO''),',
'        x04: $v(''P24_ID_SJTO_IMPSTO''), ',
'        x05: ''LB'',',
'        x06: $v(''P24_ID_USRIO''),',
'        x07:''ANU'',',
'        x08:$v(''P24_VHCLO_CLSE''),',
'        x09:$v(''P24_VHCLO_MRCA''),',
'        x10:$v(''P24_VHCLO_SRVCIO''),',
'        x11:$v(''P24_VHCLO_OPRCION''),',
'        x12:$v(''P24_VHCLO_CRRCRIA''),',
'        x13:$v(''P24_MDLO''),',
'        x14:JSON.stringify(obtener_datos()) ',
'    });',
'         console.log(''repuesta1'',resp); ',
'        $("#apex_wait_overlay").remove();',
'        $(".u-Processing").remove();',
'              return resp; ',
'  } catch (e) {',
'    console.log(e);',
'  }',
'',
'  //apex.navigation.dialog.close(true);',
'}; ',
'',
'',
'',
'',
'',
'',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-Toolbar {',
'    width: 100%;',
'    display: none;',
'}',
'#btn_branch{',
'    display: none;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'RROBLEDO'
,p_last_upd_yyyymmddhh24miss=>'20210403163138'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(88606940904044503)
,p_plug_name=>unistr('Liquidaci\00F3n ')
,p_region_name=>'liquidacion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(237222694005524189)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.vgncia_lqdcion',
'     , (',
'            select id_prdo',
'              from df_i_periodos',
'             where cdgo_clnte        = :F_CDGO_CLNTE',
'               and id_impsto         = :P24_ID_IMPSTO',
'               and id_impsto_sbmpsto = :P24_ID_IMPSTO_SBMPSTO',
'               and vgncia            = a.vgncia_lqdcion',
'        ) as prdo_lqdcion',
'     , a.lnea',
'     , a.blndje',
'     , a.clndrje',
'  from ( ',
'             select (level + (:P24_VGNCIA_INCIO_LQDCION)) - 1 vgncia_lqdcion',
'                  , null as lnea',
'                  , null as blndje',
'                  , null as clndrje',
'               from dual',
'            connect by (level + (:P24_VGNCIA_INCIO_LQDCION)) - 1 < extract (year from sysdate)',
'        ) a;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(88607166452044505)
,p_name=>'VGNCIA_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA_LQDCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Vigencia '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(82985243259908691)
,p_lov_display_extra=>true
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(88607272175044506)
,p_name=>'PRDO_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO_LQDCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select prdo     as d',
'     , id_prdo  as r',
'  from df_i_periodos;'))
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'VGNCIA_LQDCION'
,p_ajax_items_to_submit=>'PRDO_LQDCION'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(88607328168044507)
,p_name=>'LNEA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LNEA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Linea'
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
'  where d.vgncia              = :VGNCIA_LQDCION',
'   and h.cdgo_vhclo_clse      = :P24_VHCLO_CLSE',
'   and h.cdgo_vhclo_ctgtria   = :P24_VHCLO_CTGRIA',
'   and d.cdgo_vhclo_mrca      = :P24_VHCLO_MRCA',
'   and l.mnstrio              = ''S''',
''))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'VGNCIA_LQDCION'
,p_ajax_items_to_submit=>'LNEA'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(88607562907044509)
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
,p_item_attributes=>' onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_is_required=>false
,p_max_length=>0
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
 p_id=>wwv_flow_api.id(88607820848044512)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(88608738510044521)
,p_name=>'BLNDJE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BLNDJE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Blindaje '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
,p_ajax_items_to_submit=>'BLNDJE'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(89735670261824235)
,p_name=>'VLOR_AVLUO'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_use_as_row_header=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(88607034045044504)
,p_internal_uid=>88607034045044504
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
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
,p_define_chart_view=>false
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(88612312350062267)
,p_interactive_grid_id=>wwv_flow_api.id(88607034045044504)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(88612474842062268)
,p_report_id=>wwv_flow_api.id(88612312350062267)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(88612998856062277)
,p_view_id=>wwv_flow_api.id(88612474842062268)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(88607166452044505)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(88613463088062280)
,p_view_id=>wwv_flow_api.id(88612474842062268)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(88607272175044506)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(88613970034062286)
,p_view_id=>wwv_flow_api.id(88612474842062268)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(88607328168044507)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(88614922074062289)
,p_view_id=>wwv_flow_api.id(88612474842062268)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(88607562907044509)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(88649054357138868)
,p_view_id=>wwv_flow_api.id(88612474842062268)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(88608738510044521)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(90327849223844249)
,p_view_id=>wwv_flow_api.id(88612474842062268)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(89735670261824235)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(88608484995044518)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(88606940904044503)
,p_button_name=>'Btn_Procesar'
,p_button_static_id=>'btn_procesar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(237296397635524233)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(90991221303206518)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(88606940904044503)
,p_button_name=>'btn_branch'
,p_button_static_id=>'btn_branch'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(237296259540524233)
,p_button_image_alt=>'Branch'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(90990591222206511)
,p_branch_name=>unistr('ir a Registro veh\00EDculo')
,p_branch_action=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(90991221303206518)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7390371888702801)
,p_name=>'P24_VHCLO_CTGRIA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(88606940904044503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88607612199044510)
,p_name=>'P24_VGNCIA_INCIO_LQDCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(88606940904044503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89153109071061425)
,p_name=>'P24_ID_SJTO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(88606940904044503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89155614435061450)
,p_name=>'P24_ID_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(88606940904044503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90989846607206504)
,p_name=>'P24_CDGO_CLNTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(88606940904044503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90990187425206507)
,p_name=>'P24_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(88606940904044503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90990367476206509)
,p_name=>'P24_ID_USRIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(88606940904044503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90990436133206510)
,p_name=>'P24_ID_LQDCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(88606940904044503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90991415870206520)
,p_name=>'P24_VGNCIAS_LQDDAS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(88606940904044503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100139084652740209)
,p_name=>'P24_VHCLO_CLSE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(88606940904044503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100139183684740210)
,p_name=>'P24_VHCLO_MRCA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(88606940904044503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100139211424740211)
,p_name=>'P24_VHCLO_SRVCIO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(88606940904044503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100139365646740212)
,p_name=>'P24_VHCLO_OPRCION'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(88606940904044503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100139448569740213)
,p_name=>'P24_VHCLO_CRRCRIA'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(88606940904044503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100139516472740214)
,p_name=>'P24_MDLO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(88606940904044503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(90987553664131664)
,p_computation_sequence=>30
,p_computation_item=>'P24_ID_IMPSTO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select id_impsto',
'      from df_c_impuestos',
'     where cdgo_clnte  = :F_CDGO_CLNTE',
'       and cdgo_impsto = ''VHL'';'))
,p_computation_error_message=>unistr('No Existe el Impuesto de Veh\00EDculo parametrizado!')
,p_compute_when=>'P24_ID_IMPSTO'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(90989905945206505)
,p_computation_sequence=>40
,p_computation_item=>'P24_CDGO_CLNTE'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'F_CDGO_CLNTE'
,p_compute_when=>'P24_CDGO_CLNTE'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(90990014735206506)
,p_computation_sequence=>50
,p_computation_item=>'P24_ID_IMPSTO_SBMPSTO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto_sbmpsto',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto  = :P24_ID_IMPSTO'))
,p_compute_when=>'P24_ID_IMPSTO_SBMPSTO'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(90990231570206508)
,p_computation_sequence=>60
,p_computation_item=>'P24_ID_USRIO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'F_ID_USRIO'
,p_compute_when=>'P24_ID_USRIO'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(89735308528824232)
,p_name=>'Al dar click en Btn_Procesar'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(88608484995044518)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(89735476473824233)
,p_event_id=>wwv_flow_api.id(89735308528824232)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function liquidarL() {',
'',
'    var liquidacionesGrid = apex.region("liquidacion").widget().interactiveGrid("getViews", "grid").model;',
'    var totaRegistro = liquidacionesGrid.getTotalRecords();',
'    var bloqueado = 0;',
'    var cont = 0;',
'    var cont2 = 0;',
'',
'    console.log(''numero de fila:'', totaRegistro);',
'',
'    liquidacionesGrid.forEach(function(liquidacion) {',
'        console.log(''entrando al para'', cont);',
'',
'            if (liquidacion[liquidacionesGrid.getFieldKey("LNEA")].v == '''' ||',
'                liquidacion[liquidacionesGrid.getFieldKey("CLNDRJE")] == '''' ||',
'                liquidacion[liquidacionesGrid.getFieldKey("BLNDJE")].v == '''') {',
'                cont = 1;',
'                console.log(''entrando faltan datos para liquidar'', cont);',
'            }else {',
'',
'               cont =  0;',
'                 console.log(''entrando se puede liquidar'', cont);',
'',
'        }',
'       ',
'     }); ',
'        ',
'        if (cont != 0) {',
'        Swal.fire({ // icon: ''error'',',
unistr('            title: ''<H2 >Validaci\00F3n</H2>'','),
unistr('            html: `<h4>Faltan datos para la liquidaci\00F3n, por favor valide e intente nevamente</h4>`'),
'        });',
'  ',
'} else {',
'     ',
'      var resp =  await reliquidar();',
'      console.log(''repuesta2'', resp);',
'     if (resp.o_cdgo_rspsta == 0) {',
'            Swal.fire({',
unistr('                title: ''<H2 >Informaci\00F3n</H2>'','),
'                html: `<h4> ${resp.o_mnsje_rspsta} </h4>`',
'            }).then((result) => {',
'                 $(''#btn_branch'').click();',
'            });',
'            /*apex.navigation.dialog.close(true)*/',
'',
'        }',
'    ',
'    }',
'',
'   ',
'',
'}',
'',
'',
'obtener_datos();',
'liquidarL(); ',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(90850429384137603)
,p_name=>'al obtener enfoque en el campo cilindraje'
,p_event_sequence=>50
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(88606940904044503)
,p_triggering_element=>'CLNDRJE'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusin'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(90850536333137604)
,p_event_id=>wwv_flow_api.id(90850429384137603)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calcularCilindraje();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(89735550082824234)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CalcularLiquidacion'
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
'  v_cdgo_clnte        number; ',
'  v_id_impsto         number; ',
'  v_id_impsto_sbmpsto number; ',
'  v_id_sjto_impsto    number;',
'  v_cdgo_vhclo_blndje varchar2(3); ',
'  v_id_prdo           number; ',
'  v_cdgo_lqdcion_tpo  varchar2(2); ',
'  v_id_usrio          number; ',
'  v_cdgo_prdcdad      varchar2(3); ',
'  v_o_id_lqdcion      number;',
'  v_tpo_lqdcion       varchar2(3); ',
'  v_cdgo_clse         varchar2(3);',
'  v_cdgo_mrca         varchar2(10);',
'  v_cgdo_srvcio       varchar2(10);',
'  v_cdgo_oprcion      varchar2(10);',
'  v_cdgo_crrcria      varchar2(10);',
'  v_cdgo_vhclo_mrca    varchar2(100);',
'  v_mdlo              number; ',
'  v_json              clob; ',
'begin',
unistr('   --recibiendo los par\00E1metros de ajax'),
'   v_cdgo_clnte        := apex_application.g_x01;',
'   v_id_impsto         := apex_application.g_x02;',
'   v_id_impsto_sbmpsto := apex_application.g_x03;',
'   v_id_sjto_impsto    := apex_application.g_x04;',
'   v_cdgo_lqdcion_tpo  := apex_application.g_x05;',
'   v_id_usrio          := apex_application.g_x06;',
'   v_cdgo_prdcdad      := apex_application.g_x07;',
'   v_cdgo_clse         := apex_application.g_x08;',
'   v_cdgo_mrca         := apex_application.g_x09;',
'   v_cgdo_srvcio       := apex_application.g_x10;',
'   v_cdgo_oprcion      := apex_application.g_x11;',
'   v_cdgo_crrcria      := apex_application.g_x12;',
'   v_mdlo              := apex_application.g_x13;',
'   v_json              := apex_application.g_x14;',
'                                ',
'   ',
'  insert into muerto (v_001,t_001,c_001) values (''Registro:'' ||v_cdgo_clnte||'' - ''||v_id_impsto ||'' - ''||v_id_impsto_sbmpsto ||'' - ''||v_id_sjto_impsto||'' - ''||',
'                                      v_vgncia ||'' - ''||v_id_vhclo_lnea||'' - ''||v_clndrje ||'' - ''||v_cdgo_vhclo_blndje||'' - ''||',
'                                      v_id_prdo ||'' - ''||v_cdgo_lqdcion_tpo ||'' - ''||v_id_usrio ||'' - ''||v_cdgo_prdcdad,systimestamp,v_json);commit;',
'                                      ',
'                                      ',
'   pkg_gi_vehiculos.prc_rg_reliquidacion_vehiculo(p_cdgo_clnte => v_cdgo_clnte,',
'                                               p_id_impsto => v_id_impsto,',
'                                               p_id_impsto_sbmpsto => v_id_impsto_sbmpsto,',
'                                               p_id_sjto_impsto => v_id_sjto_impsto,',
'                                               p_cdgo_lqdcion_tpo => v_cdgo_lqdcion_tpo,',
'                                               p_id_usrio => v_id_usrio,',
'                                               p_cdgo_prdcdad => v_cdgo_prdcdad,',
'                                               p_cdgo_vhclo_mrca => v_cdgo_mrca,',
'                                               p_cdgo_vhclo_clse => v_cdgo_clse,',
'                                               p_cdgo_vhclo_srvcio => v_cgdo_srvcio,',
'                                               p_cdgo_vhclo_oprcion => v_cdgo_oprcion,',
'                                               p_cdgo_vhclo_crrcria => v_cdgo_crrcria,',
'                                               p_mdlo => v_mdlo,',
'                                               p_avluo =>:P23_VLOR_CMRCIAL_OCLTO,',
'                                               p_json => v_json,',
'                                               o_cdgo_rspsta => v_cdgo_rspsta,',
'                                               o_mnsje_rspstas => v_mnsje_rspsta);                            ',
'',
'   ',
' ',
'    ',
'                                                                                                             ',
'                                                    ',
'                                                         ',
'  --insert into muerto (v_001,t_001) values (''id_lqdcion: ''||v_o_id_lqdcion||''o_cdgo_rspsta: ''||v_cdgo_rspsta||''v_mnsje_rspsta: ''||v_mnsje_rspsta,systimestamp);commit;',
'   ',
'   if v_cdgo_rspsta <> 0 then',
'        raise v_error;',
'   end if;',
'   ',
'  /*  :P24_ID_LQDCION := v_o_id_lqdcion;*/',
'',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'', 0);',
'    apex_json.write(''o_mnsje_rspsta'',v_mnsje_rspsta);',
'    ---apex_json.write(''id_lqdcion'', v_o_id_lqdcion);',
'   --- apex_json.write(''v_vgncia'', v_vgncia);',
'    apex_json.close_object();',
'    ',
'   ',
'exception',
'        when  v_error then',
'                 apex_json.open_object();',
'                 apex_json.write(''o_cdgo_rspsta'', 1);',
'                 apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'                 apex_json.close_object();',
'                 insert into muerto(t_001,v_001) values(systimestamp,v_cdgo_rspsta||'' - ''||v_mnsje_rspsta);',
'end;      '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(90991092940206516)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CalcularCilindraje'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'        v_clndrje        number;',
'        v_id_sjto_impsto number;',
'        v_id_vhclo_lnea  number;',
'        v_vgncia         number;',
'        ',
'cursor c1 (R_id_vhclo_grpo in number) is         ',
'       select d.clndrje_dsde',
'         from df_s_vehiculos_grupo d',
'       where d.id_vhclo_grpo = R_id_vhclo_grpo; ',
'        ',
'begin',
unistr('   --recibiendo los par\00E1metros de ajax'),
'  /* v_id_sjto_impsto    := apex_application.g_x03;',
'/*   v_vgncia            := apex_application.g_x01;*/',
'   v_id_vhclo_lnea     := apex_application.g_x02;',
'',
'  for r1 in c1(v_id_vhclo_lnea) loop ',
'            v_clndrje := r1.clndrje_dsde;',
'  end loop; ',
'    ',
'    ',
'    ',
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
'        apex_json.write(''v_id_sjto_impsto'' , v_id_sjto_impsto);',
'        apex_json.write(''v_id_vhclo_lnea'' , v_id_vhclo_lnea);',
'        apex_json.write(''v_vgncia'' , v_vgncia);',
'        apex_json.close_object();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
