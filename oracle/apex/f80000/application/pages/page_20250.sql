prompt --application/pages/page_20250
begin
wwv_flow_api.create_page(
 p_id=>2025043
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Desembargo Propietarios'
,p_page_mode=>'MODAL'
,p_step_title=>'Desembargo Propietarios'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1',
'#APP_IMAGES#pdf-lib.min.js',
'#APP_IMAGES#FileSaver.min.js',
'#APP_IMAGES#jszip.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//Se ocultan los botones ',
'',
'function  datos_responsables() {',
'    ',
'   console.log(''Entro 1'');     ',
'    ',
'    var region = apex.region("Responsables");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        // Total de registros en la grilla',
'        var totalRegistros = model.getTotalRecords();',
'',
'        // Registros seleccionados',
'        var seleccionados = view.getSelectedRecords().length;',
'',
'        // Registros no seleccionados',
'        var noSeleccionados = totalRegistros - seleccionados;',
'',
unistr('        // Actualizar los items de p\00E1gina'),
'        apex.item("P2025043_TOTAL_SELECCIONADOS").setValue(seleccionados);',
'        apex.item("P2025043_TOTAL_NO_SELECCIONADOS").setValue(noSeleccionados);',
'           console.log(''Entro 2'',seleccionados);     ',
'           console.log(''Entro 2'',noSeleccionados); ',
'              ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "ID_ER": model.getValue(record, "ID_EMBRGOS_RSLCION").trim(),',
'                     "ID_EC": model.getValue(record, "ID_EMBRGOS_CRTRA").trim(),',
'                     "IDNTF": model.getValue(record, "IDNTFCCION").trim(),',
'                     "ID_RE": model.getValue(record, "ID_EMBRGOS_RSPNSBLE").trim(), ',
'                     "CD_TD": model.getValue(record, "CSAL_DSMBRGO").trim(),                    ',
'                     "ID_CC": model.getValue(record, "CDGO_CLNTE").trim()',
'                   };',
'        });',
'        $s(''P2025043_JSON'', json.length > 0 ? JSON.stringify(json) : '''');  ',
'         apex.item("Desembargo").show();                  ',
'       }     ',
'   ',
'}'))
,p_step_template=>wwv_flow_api.id(17323495682919353)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'700'
,p_dialog_width=>'1000'
,p_last_updated_by=>'YGOMEZ'
,p_last_upd_yyyymmddhh24miss=>'20250924170036'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(28222553983965242)
,p_plug_name=>'Responsables'
,p_region_name=>'Responsables'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.id_embrgos_rspnsble,',
'       r.id_embrgos_crtra,',
'       r.id_embrgos_rslcion,',
'       r.dscrpcion_idntfccion_tpo,',
'       r.idntfccion,',
'       r.nmbre_cmplto,',
'       aa.id_sjto_rspnsble,',
'       t.cdgo_clnte,',
'       :P2025043_CSAL_DSMBRGO as CSAL_DSMBRGO,',
'       sum(decode(x.indcdor_pgdo,0,x.vlor_ttal,0)) as saldo',
'         from v_mc_g_embargos_rspnsble_emb r ',
'         join (select distinct d.id_sjto_impsto, d.id_impsto, d.id_impsto_sbmpsto, d.id_embrgos_crtra, d.cdgo_clnte',
'                from mc_g_embargos_cartera_detalle d ) t on t.id_embrgos_crtra = r.id_embrgos_crtra',
'         join (select distinct a.id_sjto_rspnsble, a.id_sjto_impsto, a.idntfccion ',
'                from si_i_sujetos_responsable a ) aa on aa.id_sjto_impsto = t.id_sjto_impsto ',
'                                                    and aa.idntfccion = r.idntfccion -- and a.cdgo_idntfccion_tpo = r.nmtcnco_idntfccion_tpo   ',
'         join  table(pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto( ',
'                                                                                  p_cdgo_clnte        => :F_CDGO_CLNTE,',
'                                                                                  p_id_impsto         => t.id_impsto,',
'                                                                                  p_id_impsto_sbmpsto => t.id_impsto_sbmpsto,',
'                                                                                  p_id_sjto_impsto    => t.id_sjto_impsto,',
'                                                                                  p_fcha_vncmnto      => sysdate,',
'                                                                                  p_id_rspnsble       => aa.id_sjto_rspnsble ))  x  on INSTR(:P2025043_VGNCIAS, x.vgncia)  > 0',
'      where r.id_embrgos_rslcion = :P2025043_ID_EMBRGOS_RSLCION',
'        and NVL(r.dsmbrgdo,''N'') = ''N''',
'      group by ',
'      r.id_embrgos_rspnsble,',
'       r.id_embrgos_crtra,',
'       r.id_embrgos_rslcion,',
'       r.dscrpcion_idntfccion_tpo,',
'       r.idntfccion,',
'       r.nmbre_cmplto,',
'       aa.id_sjto_rspnsble,',
'       t.cdgo_clnte',
'      having ((sum(decode(x.indcdor_pgdo,0,x.vlor_ttal,0)) = 0 and :P2025043_CSAL_DSMBRGO in (''T'',''P'')) ',
'             or (sum(decode(x.indcdor_pgdo,0,x.vlor_ttal,0)) > 0 and :P2025043_CSAL_DSMBRGO = ''TP''))'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P2025043_ID_EMBRGOS_RSLCION,P2025043_CSAL_DSMBRGO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28222823152965244)
,p_name=>'ID_EMBRGOS_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSPNSBLE'
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
 p_id=>wwv_flow_api.id(28222877795965245)
,p_name=>'ID_EMBRGOS_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_CRTRA'
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
 p_id=>wwv_flow_api.id(28223014009965246)
,p_name=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSLCION'
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
 p_id=>wwv_flow_api.id(28223106515965247)
,p_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_IDNTFCCION_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Tipo Identificaci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(28223153245965248)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(28223283695965249)
,p_name=>'NMBRE_CMPLTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_CMPLTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>403
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
 p_id=>wwv_flow_api.id(28223660511965253)
,p_name=>'ID_SJTO_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_RSPNSBLE'
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
 p_id=>wwv_flow_api.id(28223767068965254)
,p_name=>'SALDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SALDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(28223986144965256)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28224118254965257)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>10
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28399906556384114)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(28400142536384117)
,p_name=>'CSAL_DSMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CSAL_DSMBRGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(28222706752965243)
,p_internal_uid=>28222706752965243
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
 p_id=>wwv_flow_api.id(28321881946998712)
,p_interactive_grid_id=>wwv_flow_api.id(28222706752965243)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(28322013792998712)
,p_report_id=>wwv_flow_api.id(28321881946998712)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28322428318998714)
,p_view_id=>wwv_flow_api.id(28322013792998712)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(28222823152965244)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28322949435998716)
,p_view_id=>wwv_flow_api.id(28322013792998712)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(28222877795965245)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28323459720998717)
,p_view_id=>wwv_flow_api.id(28322013792998712)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(28223014009965246)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28323978556998718)
,p_view_id=>wwv_flow_api.id(28322013792998712)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(28223106515965247)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28324447578998720)
,p_view_id=>wwv_flow_api.id(28322013792998712)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(28223153245965248)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28324987269998721)
,p_view_id=>wwv_flow_api.id(28322013792998712)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(28223283695965249)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28340912373722891)
,p_view_id=>wwv_flow_api.id(28322013792998712)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(28223660511965253)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28341335877722893)
,p_view_id=>wwv_flow_api.id(28322013792998712)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(28223767068965254)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28366089158427439)
,p_view_id=>wwv_flow_api.id(28322013792998712)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(28224118254965257)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28405820052384429)
,p_view_id=>wwv_flow_api.id(28322013792998712)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(28399906556384114)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28420585921770994)
,p_view_id=>wwv_flow_api.id(28322013792998712)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(28400142536384117)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(184933563400699137)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17345839561919369)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14405775563422345)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(28222553983965242)
,p_button_name=>'BTN_DESEMBARGO'
,p_button_static_id=>'Desembargo'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Desembargo'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-check-square-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14395202670422323)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_api.id(184933563400699137)
,p_button_name=>'btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14395687317422326)
,p_name=>'P2025043_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(184933563400699137)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14396011245422330)
,p_name=>'P2025043_CSAL_DSMBRGO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(184933563400699137)
,p_prompt=>'Causal de Desembargo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'SELECT  C.DSCRPCION_CSAL, C.CDGO_CSAL FROM MC_D_CAUSALES_DESEMBARGO C WHERE C.CDGO_CSAL IN (''P'',''T'',''TP'');'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14396463462422330)
,p_name=>'P2025043_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(184933563400699137)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14396880671422331)
,p_name=>'P2025043_ID_SJTO_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(184933563400699137)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14397247313422331)
,p_name=>'P2025043_ID_RSPNSBLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(184933563400699137)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14397639635422331)
,p_name=>'P2025043_INDCDOR_FSCA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(184933563400699137)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14398066218422332)
,p_name=>'P2025043_ID_EMBRGOS_RSLCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(184933563400699137)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14398422470422332)
,p_name=>'P2025043_JSON'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(184933563400699137)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14398858726422332)
,p_name=>'P2025043_TOTAL_SELECCIONADOS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(184933563400699137)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14399285896422332)
,p_name=>'P2025043_TOTAL_NO_SELECCIONADOS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(184933563400699137)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14399610012422332)
,p_name=>'P2025043_VGNCIAS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(184933563400699137)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14406522210422357)
,p_name=>'Selecciona Propietario'
,p_event_sequence=>80
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(28222553983965242)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14407052809422358)
,p_event_id=>wwv_flow_api.id(14406522210422357)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>' datos_responsables();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14406178907422357)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DesembargaPropietarios'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'v_cdgo_rspsta         number(10);',
'v_mnsje_rspsta        varchar2(4000);',
'v_total               number(10);',
'BEGIN',
'',
'select count(*) into v_total ',
'from v_mc_g_embargos_rspnsble_emb r ',
'    where r.id_embrgos_rslcion = :P2025043_ID_EMBRGOS_RSLCION ',
'    and r.dsmbrgdo = ''N'';',
'',
'if (v_total - NVL(:P2025043_TOTAL_SELECCIONADOS,0)) >= 1 then',
' if  :P2025043_TOTAL_SELECCIONADOS >= 1 then',
'   pkg_mc_medidas_cautelares.prc_gn_dsmbrgo_prptrio ( p_cdgo_clnte     => :F_CDGO_CLNTE',
'                                   , p_json                => :P2025043_JSON',
'                                   , p_id_usrio           => :F_ID_USRIO',
'                                   , p_dsmbrgo_tpo         => :P2025043_CSAL_DSMBRGO ',
'                                   , o_cdgo_rspsta         => v_cdgo_rspsta',
'                                   , o_mnsje_rspsta       =>  v_mnsje_rspsta );',
'                                   ',
'   apex_session.attach(p_app_id     => 80000,',
'                        p_page_id    => 2025043,',
'                        p_session_id => v(''APP_SESSION''));',
'                        ',
'     if v_cdgo_rspsta <> 0 then',
'          apex_error.add_error(',
'            p_message          => v_mnsje_rspsta,',
'            p_display_location => apex_error.c_inline_in_notification',
'          );',
'     end if;',
'',
'                                   ',
'      ',
'   else  ',
'       apex_error.add_error(',
'        p_message          => ''Debe tener uno o mas registros seleccionados para procesar.'',',
'        p_display_location => apex_error.c_inline_in_notification',
'      );',
'  end if;',
'else ',
'  apex_error.add_error(',
'        p_message          => ''No se pueden desembargar todos los propietarios, debe quedar por lo menos uno'',',
'        p_display_location => apex_error.c_inline_in_notification',
'      );',
'end if;',
'                                 ',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(14405775563422345)
,p_process_success_message=>unistr('Proceso ejecutado con \00E9xito')
);
end;
/
