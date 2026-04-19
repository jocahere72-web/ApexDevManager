prompt --application/pages/page_00069
begin
wwv_flow_api.create_page(
 p_id=>69
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Par\00E1metros para Desembargo Masivo')
,p_step_title=>unistr('Par\00E1metros para Desembargo Masivo')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function validar_sel() {',
'',
'    var region = apex.region("parametros_desembargo");',
'    if (region) {',
'        ',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "ID_PRMTROS_DSMBRGO": model.getValue(record, "ID_PRMTROS_DSMBRGO").trim()',
'                   };',
'        });',
'               ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM ',
'        $s(''P69_JSON'', json.length > 0 ? JSON.stringify(json) : '''');',
'        ',
'        //HABILITAMOS O DESHABILITAMOS EL BOTOM DEPENDIENDO SI HAY MAS DE UN REGISTRO SELECCIONADO',
'        if (json.length === 1 ){',
'            ',
'            $s(''P69_ID_PRMTROS_DSMBRGO'',  json[0]["ID_PRMTROS_DSMBRGO"] );//SETEAMOS EL VALOR DEL SIMU SUJETO SI SOLO HAY UNO SELECIONADO ',
'            ',
'        }else {',
'            ',
'            $s(''P69_ID_PRMTROS_DSMBRGO'',  '''');',
'            ',
'        }',
'        ',
'        return;',
'    } ',
'',
'}',
'',
'$(document).on("scroll",function() {',
'  apex.navigation.dialog.close(true);',
'});',
''))
,p_javascript_code_onload=>'validar_sel()'
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(17445683081942948)
,p_last_upd_yyyymmddhh24miss=>'20200725113320'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(54429115243813801)
,p_plug_name=>'ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
'	Funcionalidad que permite: <br><br>',
unistr('  <b>1.</b> Consultar la parametrizaci\00F3n para el desembargo masivo.<br><br>'),
unistr('  <b>2.</b> Ingresar una parametrizaci\00F3n del desembargo masivo, hacer clic en el bot\00F3n Nueva Parametrizaci\00F3n, se abrir\00E1 una ventana modal para diligenciar los datos de la parametrizaci\00F3n del desembargo, hacer clic en el bot\00F3n insertar. <br><br>'),
unistr('  <b>3.</b> Modificar y eliminar una parametrizaci\00F3n del desembargo masivo, hacer clic en el bot\00F3n editar, se abrir\00E1 una ventana modal con los datos de la parametrizaci\00F3n seleccionada del desembargo, hacer clic en el bot\00F3n que corresponda a la acci\00F3n')
||unistr(' a ejecutar "Aplicar Cambios" \00F3 "Eliminar" . <br><br>    '),
unistr(' <b>4.</b> Activar Parametrizaci\00F3n para el desembargo masivo, seleccionar la parametrizaci\00F3n en estado inactivo y hacer clic en el bot\00F3n Activar Parametrizaci\00F3n. El sistema solo permitir\00E1 mantener activa una parametrizaci\00F3n para el desembargo masivo.')
||'<br><br>  ',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105081830093319312)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'  <br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(106150389932151722)
,p_plug_name=>unistr('Par\00E1metros para Desembargo Masivo')
,p_region_name=>'parametros_desembargo'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_PRMTROS_DSMBRGO,',
'        cdgo_clnte,',
'       TPO_CRTRA,',
'       TPOS_MDDA_CTLAR,',
'       CSLES_DSMBRGO,',
'       dscrpcion_prmtros,',
'       ESTADO',
'  from MC_D_PARAMETROS_DESEMBARGO',
'  where cdgo_clnte = :F_CDGO_CLNTE'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(105081746770319311)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
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
,p_default_type=>'ITEM'
,p_default_expression=>'F_CDGO_CLNTE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(105082137317319315)
,p_name=>'Editar'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Editar',
'<span class="fa fa-pencil"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.:RP,70:P70_CDGO_CLNTE,P70_ID_PRMTROS_DSMBRGO:&CDGO_CLNTE.,&ID_PRMTROS_DSMBRGO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(105082849800319322)
,p_name=>'DSCRPCION_PRMTROS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_PRMTROS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n de Parametrizaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>500
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
 p_id=>wwv_flow_api.id(105083039922319324)
,p_name=>'ESTADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Estado'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Activo;A,Inactivo;I'
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
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(105083560022319329)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(105083667105319330)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(106152131019151724)
,p_name=>'ID_PRMTROS_DSMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRMTROS_DSMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(106152733117151724)
,p_name=>'TPO_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_CRTRA'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(106153378300151725)
,p_name=>'TPOS_MDDA_CTLAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPOS_MDDA_CTLAR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(106153990605151725)
,p_name=>'CSLES_DSMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CSLES_DSMBRGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(106150898030151722)
,p_internal_uid=>106150898030151722
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
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(106151253796151722)
,p_interactive_grid_id=>wwv_flow_api.id(106150898030151722)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(106151380728151723)
,p_report_id=>wwv_flow_api.id(106151253796151722)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106152558288151724)
,p_view_id=>wwv_flow_api.id(106151380728151723)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(106152131019151724)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106153117473151725)
,p_view_id=>wwv_flow_api.id(106151380728151723)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(106152733117151724)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106153711239151725)
,p_view_id=>wwv_flow_api.id(106151380728151723)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(106153378300151725)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106154396197151725)
,p_view_id=>wwv_flow_api.id(106151380728151723)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(106153990605151725)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106167018384199712)
,p_view_id=>wwv_flow_api.id(106151380728151723)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(105081746770319311)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106215854049346044)
,p_view_id=>wwv_flow_api.id(106151380728151723)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(105082137317319315)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>131
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106228580805426942)
,p_view_id=>wwv_flow_api.id(106151380728151723)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(105082849800319322)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>784
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106249861386484993)
,p_view_id=>wwv_flow_api.id(106151380728151723)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(105083039922319324)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>124
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106262547430660263)
,p_view_id=>wwv_flow_api.id(106151380728151723)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(105083560022319329)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(105082055986319314)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(105081830093319312)
,p_button_name=>'Nueva_Parametrizacion'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nueva Parametrizaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(105083244197319326)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(105081830093319312)
,p_button_name=>'Activar_Parametrizacion'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>unistr('Activar Parametrizaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(105082335216319317)
,p_branch_name=>unistr('Ir a P\00E1gina 70')
,p_branch_action=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.:RP,70:P70_CDGO_CLNTE:&F_CDGO_CLNTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(105082055986319314)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105083328216319327)
,p_name=>'P69_ID_PRMTROS_DSMBRGO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(106150389932151722)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105083465023319328)
,p_name=>'P69_JSON'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(106150389932151722)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(105082618047319320)
,p_name=>'close dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(105082734124319321)
,p_event_id=>wwv_flow_api.id(105082618047319320)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var region = apex.region("parametros_desembargo");',
'',
'if (region) ',
'    region.refresh(); '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(105083836002319332)
,p_name=>'Al seleccionar datos de la grilla'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(106150389932151722)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(105083986734319333)
,p_event_id=>wwv_flow_api.id(105083836002319332)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel()'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(105083726475319331)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(106150389932151722)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Par\00E1metros para Desembargo Masivo: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(105084220263319336)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Activar parametrizacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_cb_medidas_cautelares.prc_ac_estd_prmtrzcion_dsmbrgo(p_id_prmtros_dsmbrgo => :P69_ID_PRMTROS_DSMBRGO,',
'                                                         p_cdgo_clnte => :F_CDGO_CLNTE);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Parametrizaci\00F3n Activada!')
);
end;
/
