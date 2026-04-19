prompt --application/pages/page_00289
begin
wwv_flow_api.create_page(
 p_id=>289
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Re Asignaci\00F3n De T\00EDtulos')
,p_step_title=>unistr('Re Asignaci\00F3n De T\00EDtulos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function fnc_jsonSeleccion() {',
'    ',
'    var region = apex.region(''titulos'');',
'    ',
'    if (region) {',
'        ',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'',
'        var jsonTitulos = records.map((record) => {',
'            return {',
'                "ID_TTLO_JDCIAL": model.getValue(record, "ID_TTLO_JDCIAL"),',
'                "ID_FNCNRIO": model.getValue(record, "ID_FNCNRIO")',
'            };',
'        });',
'',
'        var json = JSON.stringify(jsonTitulos);',
'        $s(''P289_JSON'', JSON.stringify(jsonTitulos));',
'       // console.log(''Jason titulos: ''+json);',
'        ',
'        ',
'        if (isEmptyObject(jsonTitulos)){',
'            return ''N'';',
'        }else{',
'            return ''S'';',
'        }',
'   ',
'    }',
'}',
'',
'function isEmptyObject(obj) {',
'    return Object.entries(obj).length === 0;',
'}',
'',
unistr('function fnc_reaignarT\00EDtulos() {'),
'    try {',
'                       ',
unistr('        apex.server.process("reasignarT\00EDtulos", {'),
'            pageItems: "#F_CDGO_CLNTE, #P289_JSON, #P289_ID_FNCNRIO, #P289_ID_FNCNRIO_ASGNA,  #P289_OBSRVCNES"',
'        }, {',
'            success: function (data) {',
'                ',
'                if (data.o_cdgo_rspsta != 0) {',
'                    console.log(''RESPUESTA: '' + data.o_cdgo_rspsta);',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([',
'                        {',
'                            type: "error",',
'                            location: "page",',
'                            message: data.o_mnsje_rspsta,',
'                            unsafe: false',
'                        }',
'                    ]);',
'                } else {',
unistr('                    apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito."); '),
'                    fnc_limpiarItems();',
'                    fnc_reload();',
'                }',
'            }',
'        })',
'    } catch (e) {',
'        console.log(e);',
'    }',
'} ',
'',
'function fnc_limpiarItems(){',
'    apex.item("P289_NMRO_TTLO_JDCIAL").setValue("");',
'    apex.item("P289_ID_FNCNRIO").setValue("");',
'    apex.item("P289_OBSRVCNES").setValue("");    ',
'}',
'',
'function fnc_reload(){',
'    setTimeout(function() {   ',
'    apex.submit();',
' }, 20000);',
'}',
''))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20240618102040'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(28553084488914716)
,p_plug_name=>unistr('Par\00E1metros De B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(28553348219914719)
,p_plug_name=>unistr('T\00EDtulos')
,p_region_name=>'titulos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_ttlo_jdcial,',
'       nmro_ttlo_jdcial,',
'       fcha_cnsttcion,',
'       vlor,',
'       idntfccion_dmnddo,',
'       nmbre_dmnddo,',
'       dscrpcion_ttlo_estdo,',
'       id_fncnrio,',
'       nmbre_trcro',
'  from v_gf_g_titulos_judicial ',
' where nmro_ttlo_jdcial = :P289_NMRO_TTLO_JDCIAL',
' and cdgo_ttlo_jdcial_estdo in (''RGS'',''ACN'',''ASL'')'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(29407495854156715)
,p_name=>'NMRO_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_JDCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('No. T\00EDtulos Judicial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(29407561734156716)
,p_name=>'FCHA_CNSTTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CNSTTCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha Constituci\00F3n')
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
 p_id=>wwv_flow_api.id(29407658142156717)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(29407724325156718)
,p_name=>'IDNTFCCION_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n <br> Demandado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(29407822237156719)
,p_name=>'NMBRE_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombres <br>Demandado'
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
 p_id=>wwv_flow_api.id(29407986879156720)
,p_name=>'DSCRPCION_TTLO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TTLO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(29408156391156722)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(29408269452156723)
,p_name=>'ID_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'N'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(29408356879156724)
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(29408842882156729)
,p_name=>'NMBRE_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TRCRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Funcionario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>503
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(29407367779156714)
,p_internal_uid=>29407367779156714
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
 p_id=>wwv_flow_api.id(29429382006219297)
,p_interactive_grid_id=>wwv_flow_api.id(29407367779156714)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(29429436042219305)
,p_report_id=>wwv_flow_api.id(29429382006219297)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29429997325219326)
,p_view_id=>wwv_flow_api.id(29429436042219305)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(29407495854156715)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29430402667219335)
,p_view_id=>wwv_flow_api.id(29429436042219305)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(29407561734156716)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29430902420219337)
,p_view_id=>wwv_flow_api.id(29429436042219305)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(29407658142156717)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29431370043219339)
,p_view_id=>wwv_flow_api.id(29429436042219305)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(29407724325156718)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29431832642219341)
,p_view_id=>wwv_flow_api.id(29429436042219305)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(29407822237156719)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29432347454219343)
,p_view_id=>wwv_flow_api.id(29429436042219305)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(29407986879156720)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29452676602307152)
,p_view_id=>wwv_flow_api.id(29429436042219305)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(29408269452156723)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29453773076347795)
,p_view_id=>wwv_flow_api.id(29429436042219305)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(29408356879156724)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29457620698734474)
,p_view_id=>wwv_flow_api.id(29429436042219305)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(29408842882156729)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(28556198003914747)
,p_plug_name=>unistr('Re Asignaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29408042392156721)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
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
 p_id=>wwv_flow_api.id(28556464778914750)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(29408042392156721)
,p_button_name=>'BTN_REASIGNAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Re - Asignar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(28553279060914718)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(28553084488914716)
,p_button_name=>'btn_Consultar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28553149487914717)
,p_name=>'P289_NMRO_TTLO_JDCIAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(28553084488914716)
,p_prompt=>unistr('<b>No. T\00EDtulo Judicial</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28556211171914748)
,p_name=>'P289_ID_FNCNRIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(28556198003914747)
,p_prompt=>'<b>Funcionario</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_trcro as d, a.id_fncnrio as r',
'  from v_mc_g_embargos_resolucion a',
'  join v_sg_g_usuarios b',
'    on b.id_fncnrio = a.id_fncnrio',
' where b.actvo = ''S''',
'   and b.id_fncnrio != 700012',
' group by b.nmbre_trcro, a.id_fncnrio',
' order by a.id_fncnrio',
''))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28556384204914749)
,p_name=>'P289_OBSRVCNES'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(28556198003914747)
,p_prompt=>'<b>Observaciones</b>'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cHeight=>10
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29352797904621906)
,p_name=>'P289_ID_FNCNRIO_ASGNA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(28556198003914747)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29408424347156725)
,p_name=>'P289_JSON'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(28556198003914747)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29408579363156726)
,p_name=>'Al dar click BTN_REASIGNAR'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(28556464778914750)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29408609559156727)
,p_event_id=>wwv_flow_api.id(29408579363156726)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function reasignacion() {    ',
'    ',
'    var titulos = fnc_jsonSeleccion();',
'    ',
'    if (apex.item("P289_ID_FNCNRIO").getValue() === "") {',
'        apex.message.clearErrors();',
'        apex.message.showErrors([',
'            {',
'                type: "error",',
'                location: "page",',
unistr('                message: ''\00A1Por favor, seleccione un funcionario para re-asignar!'','),
'                unsafe: false',
'            }',
'        ]);',
'    }else if(apex.item("P289_OBSRVCNES").getValue() === ""){',
'        apex.message.clearErrors();',
'        apex.message.showErrors([',
'            {',
'                type: "error",',
'                location: "page",',
unistr('                message: ''\00A1Por favor, debes colocar una observaci\00F3n!'','),
'                unsafe: false',
'            }',
'        ]);',
'    }else if (titulos == ''N'') { ',
'         apex.message.clearErrors();',
'         apex.message.showErrors([',
'            {',
'                type: "error",',
'                location: "page",',
unistr('                message: ''Debe al menos selecconar un t\00EDtulo'','),
'                unsafe: false',
'            }',
'        ]);        ',
'    } else {',
unistr('       console.log(''T\00EDtulos: ''+ titulos);'),
unistr('       fnc_reaignarT\00EDtulos(); '),
'    }',
'',
'}',
'',
'reasignacion();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29352854571621907)
,p_name=>'Al dar click BTN_CONSULTAR'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(28553279060914718)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29352943077621908)
,p_event_id=>wwv_flow_api.id(29352854571621907)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function fnc_validarItem(){',
'    if (apex.item("P289_NMRO_TTLO_JDCIAL").getValue() === ""){',
'        console.error("No hay titulo para consultar.");',
'        apex.message.clearErrors();',
'        apex.message.showErrors([{',
'            type: "error",',
'            location: "page",',
unistr('            message: "\00A1Por favor, ingrese un t\00EDtulo para consultar!",'),
'            unsafe: false',
'        }]);',
'    }',
'    else{',
'        apex.submit();',
'    }',
'}',
'',
'fnc_validarItem();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29352604495621905)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CargarFuncionarioSesion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' v_usrio varchar2(100);',
'begin',
'',
'  v_usrio := :APP_USER;',
'  ',
'  select a.id_fncnrio',
'  into :P289_ID_FNCNRIO_ASGNA',
'  from v_sg_g_usuarios a',
' where a.user_name = v_usrio; ',
' exception when others then',
'  :P289_ID_FNCNRIO_ASGNA := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29408733233156728)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('reasignarT\00EDtulos')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_cdgo_rspsta   number;',
'    v_mnsje_rspsta  varchar2(4000);',
'    v_accion        varchar2(100);',
'    v_exception     exception;',
'begin',
'',
'    v_cdgo_rspsta:= 0;',
'    v_mnsje_rspsta:= ''OK'';   ',
'    ',
'  pkg_gf_titulos_judicial.prc_rg_titulos_judicial_rsgndo(p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                                         p_json_ttlos         => :P289_JSON,',
'                                                         p_id_fncnrio_asgndo  => :P289_ID_FNCNRIO,',
'                                                         p_id_fncnrio_asgna   => :P289_ID_FNCNRIO_ASGNA,',
'                                                         p_obsvcions          => :P289_OBSRVCNES,',
'                                                         o_cdgo_rspsta        => v_cdgo_rspsta,',
'                                                         o_mnsje_rspsta       => v_mnsje_rspsta);',
'                                                    ',
'                                               ',
'    if v_cdgo_rspsta > 0 then',
'        raise v_exception;     ',
'    else',
'        commit;',
'    end if;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'',
'exception',
'   when v_exception then',
'        rollback;',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
