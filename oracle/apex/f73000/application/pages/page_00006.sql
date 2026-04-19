prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6
,p_user_interface_id=>wwv_flow_api.id(76451776849582525)
,p_name=>'TRD'
,p_step_title=>'TRD'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_step_template=>wwv_flow_api.id(76345756650582452)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20191119084024'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5700421157061404)
,p_plug_name=>'TRD'
,p_region_name=>'tr'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(76376636512582469)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_trd ',
'     , cdgo_clnte ',
'     , id_area ',
'     , id_prcso ',
'     , cdgo_trd  ',
'     , ''<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Series',
'    <span class="fa fa-external-link-square"></span>',
'</button>'' as HTML',
'  from gd_d_trd',
' where cdgo_clnte = :F_CDGO_CLNTE '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5700604492061406)
,p_name=>'ID_TRD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TRD'
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
 p_id=>wwv_flow_api.id(5700756523061407)
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
,p_default_type=>'ITEM'
,p_default_expression=>'F_CDGO_CLNTE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5700858220061408)
,p_name=>'ID_AREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_AREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('\00C1rea')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_area',
'     , id_area ',
'  from df_c_areas',
' where cdgo_clnte = :F_CDGO_CLNTE   '))
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
 p_id=>wwv_flow_api.id(5700922127061409)
,p_name=>'ID_PRCSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Proceso'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_prcso',
'     , id_prcso ',
'  from df_c_procesos',
'  where id_area=:ID_AREA',
''))
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ID_AREA'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5701027587061410)
,p_name=>'CDGO_TRD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TRD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('C\00F3digo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_item_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'');" onkeyup="campoMayuscula(this)"'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(5701274743061412)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5701377790061413)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(27781581309873402)
,p_name=>'HTML'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HTML'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>' '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'&HTML.'
,p_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:RP,7:P7_ID_TRD:&ID_TRD.'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(5700549533061405)
,p_internal_uid=>5700549533061405
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
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
 p_id=>wwv_flow_api.id(5718386714133990)
,p_interactive_grid_id=>wwv_flow_api.id(5700549533061405)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(5718427110133990)
,p_report_id=>wwv_flow_api.id(5718386714133990)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5718958973133993)
,p_view_id=>wwv_flow_api.id(5718427110133990)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(5700604492061406)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5719486873133997)
,p_view_id=>wwv_flow_api.id(5718427110133990)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(5700756523061407)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5719948776133998)
,p_view_id=>wwv_flow_api.id(5718427110133990)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(5700858220061408)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>349
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5720442659134000)
,p_view_id=>wwv_flow_api.id(5718427110133990)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(5700922127061409)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>255
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5720992155134001)
,p_view_id=>wwv_flow_api.id(5718427110133990)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(5701027587061410)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>309
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5722691667134915)
,p_view_id=>wwv_flow_api.id(5718427110133990)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(5701274743061412)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27794730519895764)
,p_view_id=>wwv_flow_api.id(5718427110133990)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(27781581309873402)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>119
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5701684161061416)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'    </b>',
'</h5>',
'Funcionalidad que permite:<br><br>	',
unistr('<b>1.</b> Ingresar, consultar, modificar y eliminar las Tablas de Retenci\00F3n Documental (TRD).'),
'<br><br>',
unistr('<b>2.</b> Ingresar, consultar, modificar y eliminar Series de las Tablas de Retenci\00F3n Documental, hacer clic en el bot\00F3n Serie, el usuario ser\00E1 direccionado a la p\00E1gina de Series de TRD.<br><br>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6019756001699412)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6019881043699413)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6019756001699412)
,p_button_name=>'Imprimir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_trd',
'  from gd_d_trd',
' where cdgo_clnte = :F_CDGO_CLNTE'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(35822230109304511)
,p_branch_name=>unistr('Ir a P\00E1gina 6')
,p_branch_action=>'f?p=&APP_ID.:6:&SESSION.:PRINT_REPORT=gd_g_tabla_retencion_documental:&DEBUG.:6::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6019881043699413)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35821992975304508)
,p_name=>'P6_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5700421157061404)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36783699317900902)
,p_name=>'P6_JSON_PARAM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5700421157061404)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(35822002889304509)
,p_name=>unistr('al cambiar selecci\00F3n cuadricula')
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(5700421157061404)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35822128605304510)
,p_event_id=>wwv_flow_api.id(35822002889304509)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(this.data.selectedRecords.length > 0) {',
'    var records = this.data.selectedRecords;',
'    var model = this.data.model;',
'    var json = records.map((m)=>{',
'        return {id: model.getValue(m, ''ID_TRD'')}',
'        });',
'    $s(''P6_JSON'', JSON.stringify(json));',
'}else{',
'        $s(''P6_JSON'', null);',
'}',
'if(this.data.selectedRecords.length <= 0) {',
'    $x_Hide(B6019881043699413);',
'}else{',
'    $x_Show(B6019881043699413); ',
'}',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5701445183061414)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(5700421157061404)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'TRD - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(35821814201304507)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Json'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_nmbre_rprte gn_d_reportes.nmbre_rprte%type;',
'   v_object json_object_t := json_object_t();',
'begin	',
'',
' --Busca el Nombre del Reporte',
' /*select nmbre_rprte',
'   into v_nmbre_rprte',
'   from gn_d_reportes ',
'  where id_rprte = :P6_ID_RPRTE; */',
'',
'   v_object.put( ''cdgo_clnte''  , :F_CDGO_CLNTE );',
unistr('   v_object.put( ''nmbre_rprte'' , ''REPORTE TABLA DE RETENCI\00D3N DOCUMENTAL'' );'),
'   v_object.put( ''id_trd'' , json_array_t(:P6_JSON));',
'   ',
'   :P6_JSON_PARAM := v_object.to_clob();',
'              ',
'exception',
'     when others then',
'          null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(6019881043699413)
);
end;
/
