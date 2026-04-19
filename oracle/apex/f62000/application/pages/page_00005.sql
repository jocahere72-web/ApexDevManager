prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(323679016569283847)
,p_name=>'Flujos de Trabajo'
,p_step_title=>'Flujos de Trabajo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'var P5_UNDAD_DRCION;',
'var formula = {',
'    "MN": {',
'        "HR": 60,',
'        "DI": 1440,',
'        "SM": 10080,',
'        "MS": 43200',
'    },',
'    "HR": {',
'        "DI": 24,',
'        "SM": 168,',
'        "MS": 720',
'    },',
'    "DI": {',
'        "SM": 7,',
'        "MS": 30',
'    },',
'    "SM": {',
'        "MS": 4.28',
'    },',
'    "MS": {}',
'};',
'',
'function validar_sel() {',
'',
'    var region = apex.region("id_tareas");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'               ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "ID_TREA": model.getValue(record, "ID_TREA").d.trim()};',
'        });',
'        ',
'        $setDetailTab(''#id_tareas_tab'', (records.length === 1 ? '' => <b>Tarea: '' + json[0].ID_TREA + ''<b/>'': ''''),[1,2] , false);',
'        ',
'    }',
'}',
'',
'function calcularTiempo(this_, tipo) {',
'    apex.message.clearErrors();',
'    var undad_fljo = $v(''P5_UNDAD_DRCION'');',
'    var drcion_fljo = $v(''P5_DRCION'');',
'    var element = this_.triggeringElement;',
'    var inputKeys = $(element).parent().parent().parent().data(''id'');',
'    ',
'    var view = apex.region("id_tareas").widget().interactiveGrid("getViews", "grid");',
'    var model = view.model;',
'    var records = model._data;',
'',
'    var data = records.map((m) => {',
'        var id = model.getValue(m, ''ID_FLJO_TREA'');',
'        var undad =  inputKeys == id && tipo === ''U'' ? $(element).val() : model.getValue(m, ''UNDAD_DRCION'').v,',
'            drcion = inputKeys == id && tipo === ''D'' ? $(element).val() : model.getValue(m, ''DRCION''),',
'            frmla = formula[undad][undad_fljo],',
'            conversion = drcion / (frmla || 1);',
'',
'        return {',
'            undad: undad,',
'            drcion: drcion,',
'            conversion: conversion',
'        }',
'    });',
'',
'    var total = data.reduce((p, c) => {',
'        p.conversion += c.conversion',
'        return p',
'    });',
'',
'    if (parseFloat(total.conversion) > parseFloat(drcion_fljo)) {',
'        apex.region("id_tareas").widget().interactiveGrid("getActions").disable("save");',
'        apex.message.showErrors([',
'            {',
'                type:       "error",',
'                location:   [ "page"],',
unistr('                message:    "La duraci\00F3n total de las tareas del flujo de trabajo no debe ser superior al tiempo definido para el flujo de trabajo en general.",'),
'                unsafe:     false',
'            }',
'        ]);',
'    } else {',
'        apex.region("id_tareas").widget().interactiveGrid("getActions").enable("save");',
'    }',
'}',
'',
''))
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_step_template=>wwv_flow_api.id(39255447011898276)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HGOMEZ'
,p_last_upd_yyyymmddhh24miss=>'20250425103212'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50443365279763301)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(39299295614898312)
,p_plug_display_sequence=>80
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
'Funcionalidad que permite:<br>',
unistr('<b>1.</b> Ingresar el flujo de trabajo de un proceso espec\00EDfico, en el flujo de trabajo se puede establecer la duraci\00F3n global del flujo de trabajo, permitiendo activarlo y desactivarlo en cualquier momento. <br>'),
unistr('<b>2.</b> Ingresar las tareas correspondiente al flujo de trabajo, especificando cual es la tarea que inicia el proceso ademas de establecer la duraci\00F3n de dicha tarea y de forma opcional si esta maneja un estado permite establecer los permisos de lo')
||unistr('s funcionarios que podr\00E1n autorizar dicho estado.<br>'),
unistr('<b>3.</b> Ingresar la transici\00F3n de las tareas ingresadas, estableciendo el orden en que estas ser\00E1n ejecutadas en el proceso con los par\00E1metros y condiciones que se deben cumplir para poder continuar con la siguiente tarea.<br>'),
unistr('<b>4.</b> Ingreso del perfil del participante o funcionario que realiza una tarea espec\00EDfica.'),
'<br><br>    ',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'        </i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94886232188405037)
,p_plug_name=>'Flujos'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(39299295614898312)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_02'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_fljo,',
'       dscrpcion_fljo',
' from v_wf_d_flujos',
'where cdgo_clnte = :F_CDGO_CLNTE'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
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
 p_id=>wwv_flow_api.id(94886378610405038)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_finder_drop_down=>'N'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'NONE'
,p_show_detail_link=>'C'
,p_detail_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP,5:P5_ID_FLJO:#ID_FLJO#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'SROMERO'
,p_internal_uid=>94886378610405038
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94886426585405039)
,p_db_column_name=>'ID_FLJO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id fljo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35561015909386120)
,p_db_column_name=>'DSCRPCION_FLJO'
,p_display_order=>20
,p_column_identifier=>'E'
,p_column_label=>'Dscrpcion Fljo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(110294474333110549)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1102945'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_FLJO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94887507083405050)
,p_plug_name=>'Detalles de Flujo'
,p_region_name=>'detalles_flujo'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(39306030053898315)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105157391394528501)
,p_plug_name=>'Flujos a Generar'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(39298132994898311)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_fljo_trea_fljo,',
'        id_fljo,',
'        id_fljo_trea,',
'        id_fljo_hjo,',
'        fncion,',
'        indcdor_vldar,',
'        indcdor_msvo',
'from wf_d_flujos_tarea_flujo',
'where id_fljo = :P5_ID_FLJO'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(110468951578427318)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from v_wf_d_flujos',
'where id_fljo = :P5_ID_FLJO'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(105157587699528503)
,p_name=>'ID_FLJO_TREA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA_FLJO'
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(105157627115528504)
,p_name=>'ID_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P5_ID_FLJO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(105157729159528505)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(110470641074427351)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(105157875962528506)
,p_name=>'ID_FLJO_HJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_HJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Flujo a Generar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(102655522517182207)
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
 p_id=>wwv_flow_api.id(105157949572528507)
,p_name=>'INDCDOR_VLDAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_VLDAR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFIndicador de Validar?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(105158005439528508)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(105158161326528509)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(105331805500631401)
,p_name=>'FNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FNCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>unistr('Funci\00F3n a Ejecutar')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
,p_is_required=>false
,p_max_length=>1000
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select p.object_name|| ''.''||p.procedure_name || '' version '' || a.overload d,',
'          nvl2(a.package_name, (a.package_name|| ''.''||a.object_name || ''('' || listagg('':param'' || a.position ,'' , '') within group (order by a.position) || '')''), p.object_name|| ''.''||p.procedure_name || ''()'')  b ',
'     from user_procedures p',
'left join user_arguments a',
'       on p.subprogram_id = a.subprogram_id',
'      and p.object_id     = a.object_id ',
'    where upper(p.object_name) like ''PKG%''',
'      and p.procedure_name is not null',
' group by a.object_name,',
'          a.overload,',
'          a.package_name,',
'          p.object_name,',
'          p.procedure_name;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(107694646797112707)
,p_name=>'INDCDOR_MSVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_MSVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFIndicador Masivo?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(105157499771528502)
,p_internal_uid=>105157499771528502
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
 p_id=>wwv_flow_api.id(105171345391539320)
,p_interactive_grid_id=>wwv_flow_api.id(105157499771528502)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(105171444500539321)
,p_report_id=>wwv_flow_api.id(105171345391539320)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105171984109539327)
,p_view_id=>wwv_flow_api.id(105171444500539321)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(105157587699528503)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105172481327539330)
,p_view_id=>wwv_flow_api.id(105171444500539321)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(105157627115528504)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105172963415539331)
,p_view_id=>wwv_flow_api.id(105171444500539321)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(105157729159528505)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105173420710539333)
,p_view_id=>wwv_flow_api.id(105171444500539321)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(105157875962528506)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105173947922539334)
,p_view_id=>wwv_flow_api.id(105171444500539321)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(105157949572528507)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105183701034555812)
,p_view_id=>wwv_flow_api.id(105171444500539321)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(105158005439528508)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105337862997631550)
,p_view_id=>wwv_flow_api.id(105171444500539321)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(105331805500631401)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>291
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108505323292443822)
,p_view_id=>wwv_flow_api.id(105171444500539321)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(107694646797112707)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>162
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(110318969746427265)
,p_plug_name=>'Flujo de Trabajo'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(39299295614898312)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(110354507640565128)
,p_plug_name=>'Transiciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(39299295614898312)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  id_fljo_trnscion,',
'  id_fljo,',
'  id_fljo_trea,',
'  id_fljo_trea_dstno,',
'  orden,',
'  nmbre_trnscion,',
'  cdgo_mtdo_asgncion,',
'  indcdor_actlzar,',
'  indcdor_aprbar_tdo_prtcpntes',
'from wf_d_flujos_transicion',
'where id_fljo = :P5_ID_FLJO',
'--order by orden '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from wf_d_flujos ',
' where id_fljo = :P5_ID_FLJO'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(2770766304002501)
,p_name=>'CDGO_MTDO_ASGNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MTDO_ASGNCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('M\00E9todo de asignaci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion ,',
'       cdgo_mtdo_asgncion',
'  from df_s_metodos_asignacion;'))
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
 p_id=>wwv_flow_api.id(16574523991784010)
,p_name=>'Parametros'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>unistr('<u>Par\00E1metros</u>')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<button style="color:green" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Par\00E1metros'),
'<span class="fa fa-pencil"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:RP:P10_FLJO_TRNSCION:&ID_FLJO_TRNSCION.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(31960101784641508)
,p_name=>'INDCDOR_ACTLZAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_ACTLZAR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFIndicador Actualizar?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(49881386577728530)
,p_name=>'INDCDOR_APRBAR_TDO_PRTCPNTES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_APRBAR_TDO_PRTCPNTES'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50125629822422804)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50125701975422805)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(90520489442906328)
,p_name=>'ID_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P5_ID_FLJO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109883172488198934)
,p_name=>'Action'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'<u>Condiciones</u>'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:green" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Condiciones',
'<span class="fa fa-pencil"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:RP,14:P14_ID_FLJO_TRNSCION:&ID_FLJO_TRNSCION.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110354753855565130)
,p_name=>'ID_FLJO_TRNSCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TRNSCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110354801264565131)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tarea Inicio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  id_fljo_trea || ''. '' || nmbre_trea ||'' (''|| drcion ||'' ''|| dscrpcion_drcion || '')'' d ,',
'  id_fljo_trea r',
'from v_wf_d_flujos_tarea ',
'where id_fljo = nvl(:P5_ID_FLJO,id_fljo);'))
,p_lov_display_extra=>false
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
 p_id=>wwv_flow_api.id(110354959790565132)
,p_name=>'ID_FLJO_TREA_DSTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA_DSTNO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tarea Destino'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  id_fljo_trea || ''. '' || nmbre_trea ||'' (''|| drcion ||'' ''|| dscrpcion_drcion || '')'' r ,',
'  id_fljo_trea d ',
'from v_wf_d_flujos_tarea ',
'where id_fljo = :P5_ID_FLJO'))
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
 p_id=>wwv_flow_api.id(110355091405565133)
,p_name=>'ORDEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORDEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Orden'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_03=>'center'
,p_item_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_is_required=>true
,p_max_length=>3
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
 p_id=>wwv_flow_api.id(110355156412565134)
,p_name=>'NMBRE_TRNSCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TRNSCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nombre'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(110354621819565129)
,p_internal_uid=>110354621819565129
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
 p_id=>wwv_flow_api.id(110705120179902049)
,p_interactive_grid_id=>wwv_flow_api.id(110354621819565129)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(110705233724902049)
,p_report_id=>wwv_flow_api.id(110705120179902049)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1402062033942)
,p_view_id=>wwv_flow_api.id(110705233724902049)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(90520489442906328)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2776736380002594)
,p_view_id=>wwv_flow_api.id(110705233724902049)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(2770766304002501)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>74
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16633054678092462)
,p_view_id=>wwv_flow_api.id(110705233724902049)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(16574523991784010)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(31990157037785323)
,p_view_id=>wwv_flow_api.id(110705233724902049)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(31960101784641508)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>147
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49952414516914126)
,p_view_id=>wwv_flow_api.id(110705233724902049)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(49881386577728530)
,p_is_visible=>true
,p_is_frozen=>false
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50139366694423800)
,p_view_id=>wwv_flow_api.id(110705233724902049)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(50125629822422804)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110705728979902060)
,p_view_id=>wwv_flow_api.id(110705233724902049)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(110354753855565130)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110706109862902084)
,p_view_id=>wwv_flow_api.id(110705233724902049)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(110354801264565131)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>106
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110706657002902086)
,p_view_id=>wwv_flow_api.id(110705233724902049)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(110354959790565132)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>126
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110707105585902088)
,p_view_id=>wwv_flow_api.id(110705233724902049)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(110355091405565133)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>55
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110707679089902089)
,p_view_id=>wwv_flow_api.id(110705233724902049)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(110355156412565134)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>101
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110738957177268515)
,p_view_id=>wwv_flow_api.id(110705233724902049)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(109883172488198934)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>107
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(110468951578427318)
,p_plug_name=>'Tareas del Flujo'
,p_region_name=>'id_tareas'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(39299295614898312)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_fljo_trea,',
'       id_fljo,',
'       id_trea,',
'       undad_drcion,',
'       drcion,',
'       indcdor_incio,',
'       --indcdor_incio as indcdor_incio_oclto,',
'       cdgo_mtdo_asgncion,',
'       actvo,',
'       indcdor_procsar_estdo,',
'       indcdor_trnscion_atmtca,',
'       apex_util.prepare_url (p_url => ''f?p=''|| :app_id || '':18:''||  :app_session || ''::NO::P18_ID_FLJO_TREA:'' || id_fljo_trea  , p_checksum_type => ''SESSION'') url,',
'       indcdor_rvsion_fljos',
'from  wf_d_flujos_tarea',
'where id_fljo = :P5_ID_FLJO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from v_wf_d_flujos',
'where id_fljo = :P5_ID_FLJO'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(7040431388897601)
,p_name=>'CDGO_MTDO_ASGNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MTDO_ASGNCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('M\00E9todo de asignaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion as d,',
'        a.cdgo_mtdo_asgncion as r',
'from df_s_metodos_asignacion a',
'where a.cdgo_mtdo_asgncion in (''MAC'',''MCC'')'))
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
 p_id=>wwv_flow_api.id(9727713680392701)
,p_name=>'INDCDOR_RVSION_FLJOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_RVSION_FLJOS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>'Revision'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(20493841489012147)
,p_name=>'INDCDOR_TRNSCION_ATMTCA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_TRNSCION_ATMTCA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFTransici\00F3n Autom\00E1tica?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(34600979914574201)
,p_name=>'INDCDOR_PROCSAR_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_PROCSAR_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFProcesar Estados ?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(34601014890574202)
,p_name=>'ESTADOS'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<button style="color:#0572CE;" type="button" id="&ID_FLJO_TREA." onclick="if(''&INDCDOR_PROCSAR_ESTDO.'' === ''S\00ED''){&URL.}" class="a-Button a-Button--noLabel a-Button--iconTextButton">Estados'),
'<span class="fa fa-plus"></span>',
'</button>'))
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35310441568671806)
,p_name=>'URL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'URL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110354042148565123)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110354145913565124)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110470641074427351)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110471269651427352)
,p_name=>'ID_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P5_ID_FLJO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110471888537427352)
,p_name=>'ID_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tarea del Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(323683273961283888)
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110472426630427353)
,p_name=>'UNDAD_DRCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNDAD_DRCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Unidad de Duraci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select d',
'      , v',
'   from (',
'               select max( case when v = :P5_UNDAD_DRCION',
'                          then vlor else 0 end ) over() as p',
'                    , d',
'                    , v',
'                    , vlor',
'                 from ( select vlor',
'                           , regexp_substr(cdna,''[^:]+'', 1, 1) d',
'                           , regexp_substr(cdna,''[^:]+'', 1, 2) v',
'                        from table(pkg_gn_generalidades.fnc_ca_split_table( p_cdna => ''Minutos:MN,Horas:HR,Dias:DI,Semanas:SM,Meses:MS'', p_crcter_dlmtdor => '','' ))',
'                     ) a',
'         )',
'   where vlor <= p;'))
,p_lov_display_extra=>true
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110473003095427353)
,p_name=>'DRCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Duraci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_item_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');" '
,p_is_required=>false
,p_max_length=>3
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110473609786427353)
,p_name=>'INDCDOR_INCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_INCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFTarea Inicial?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>true
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110474285071427354)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFActivo?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>false
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(110469313644427344)
,p_internal_uid=>110469313644427344
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
 p_id=>wwv_flow_api.id(110469731029427346)
,p_interactive_grid_id=>wwv_flow_api.id(110469313644427344)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(110469833695427346)
,p_report_id=>wwv_flow_api.id(110469731029427346)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1448629010652)
,p_view_id=>wwv_flow_api.id(110469833695427346)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(34601014890574202)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(41936593645202)
,p_view_id=>wwv_flow_api.id(110469833695427346)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(7040431388897601)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>206
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9733738374392842)
,p_view_id=>wwv_flow_api.id(110469833695427346)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(9727713680392701)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>94
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21297325822436841)
,p_view_id=>wwv_flow_api.id(110469833695427346)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(20493841489012147)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>312
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34606981833575554)
,p_view_id=>wwv_flow_api.id(110469833695427346)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(34600979914574201)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>141
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35344306287271240)
,p_view_id=>wwv_flow_api.id(110469833695427346)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(35310441568671806)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110471074094427352)
,p_view_id=>wwv_flow_api.id(110469833695427346)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(110470641074427351)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110471684950427352)
,p_view_id=>wwv_flow_api.id(110469833695427346)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(110471269651427352)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110472200474427353)
,p_view_id=>wwv_flow_api.id(110469833695427346)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(110471888537427352)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110472849048427353)
,p_view_id=>wwv_flow_api.id(110469833695427346)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(110472426630427353)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110473455564427353)
,p_view_id=>wwv_flow_api.id(110469833695427346)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(110473003095427353)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110474044475427354)
,p_view_id=>wwv_flow_api.id(110469833695427346)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(110473609786427353)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110474654290427354)
,p_view_id=>wwv_flow_api.id(110469833695427346)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(110474285071427354)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110475693869445372)
,p_view_id=>wwv_flow_api.id(110469833695427346)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(110354042148565123)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(110793349576098308)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(39299295614898312)
,p_plug_display_sequence=>70
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(221497391826663215)
,p_plug_name=>'Participantes'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(39299295614898312)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_FLJO_TREA_PRTCPNTE,',
'       ID_FLJO_TREA,',
'       TPO_PRTCPNTE,',
'       ID_PRTCPTE,',
'       ACTVO',
'  from WF_D_FLUJOS_TAREA_PRTCPNTE',
'--where id_fljo = :P5_ID_FLJO'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(110468951578427318)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from v_wf_d_flujos',
'where id_fljo = :P5_ID_FLJO'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110793799384098312)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110793863287098313)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(221499604109663235)
,p_name=>'ID_FLJO_TREA_PRTCPNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA_PRTCPNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(221500255358663236)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(110470641074427351)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(221500860113663237)
,p_name=>'TPO_PRTCPNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_PRTCPNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tipo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:USUARIO,PERFIL'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(221501448896663237)
,p_name=>'ID_PRTCPTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRTCPTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Participante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  nmbre_prtcpnte d, id_prtcpnte r',
'from (',
'  select nmbre_trcro nmbre_prtcpnte, id_usrio id_prtcpnte, ''USUARIO'' tpo_prtcpnte, cdgo_clnte',
'  from v_sg_g_usuarios where actvo = ''S''',
'  and id_fncnrio > 0',
'  union ',
'  select nmbre_prfil nmbre_prtcpnte, id_prfil id_prtcpnte, ''PERFIL'' tpo_prtcpnte, cdgo_clnte',
'  from v_sg_g_perfiles where actvo = ''S''',
')',
'where cdgo_clnte = :F_CDGO_CLNTE',
'  and tpo_prtcpnte = :TPO_PRTCPNTE'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'TPO_PRTCPNTE'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(221502031981663238)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFActivo?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>false
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(221497891348663226)
,p_internal_uid=>221497891348663226
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
 p_id=>wwv_flow_api.id(221498282434663230)
,p_interactive_grid_id=>wwv_flow_api.id(221497891348663226)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(221498334764663230)
,p_report_id=>wwv_flow_api.id(221498282434663230)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110849401740674865)
,p_view_id=>wwv_flow_api.id(221498334764663230)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(110793799384098312)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(221500089580663236)
,p_view_id=>wwv_flow_api.id(221498334764663230)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(221499604109663235)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(221500631667663236)
,p_view_id=>wwv_flow_api.id(221498334764663230)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(221500255358663236)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(221501252407663237)
,p_view_id=>wwv_flow_api.id(221498334764663230)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(221500860113663237)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(221501858887663238)
,p_view_id=>wwv_flow_api.id(221498334764663230)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(221501448896663237)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(221502435341663238)
,p_view_id=>wwv_flow_api.id(221498334764663230)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(221502031981663238)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(110793424741098309)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(110793349576098308)
,p_button_name=>'Nuevo_Flujo'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(39351872500898344)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Flujo'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP,5::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(110793558794098310)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(110793349576098308)
,p_button_name=>'Nueva_Tarea'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(39351872500898344)
,p_button_image_alt=>'Nueva Tarea'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP,4::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(110319338910427288)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(110318969746427265)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(39351872500898344)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P5_ID_FLJO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(110319529197427288)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(110318969746427265)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(39351872500898344)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(110319260316427288)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(110318969746427265)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(39351872500898344)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P5_ID_FLJO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(110319417495427288)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(110318969746427265)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(39351872500898344)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P5_ID_FLJO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44107585476046705)
,p_name=>'P5_ID_PRCSO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(110318969746427265)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Proceso'
,p_source=>'ID_PRCSO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.dscrpcion,',
'        a.id_prcso,',
'        nvl((select m.dscrpcion from df_s_procesos m where a.id_prcso_pdre = m.id_prcso), ''-'') dscrpcion_prcso_pdre         ',
'    from df_s_procesos a',
'    where connect_by_isleaf = 1',
'   start with id_prcso_pdre is null',
'	connect by prior id_prcso = id_prcso_pdre',
'	order siblings by a.dscrpcion'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(39351319077898342)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista el proceso en el que ser\00E1 aplicado el flujo de trabajo ')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90520533430906329)
,p_name=>'P5_ID_FLJO_TREA_INCIAL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(110318969746427265)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tarea inicial'
,p_source=>'ID_FLJO_TREA_INCIAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_trea || ''. '' || nmbre_trea d, id_trea r',
'from v_wf_d_flujos_tarea',
'where id_fljo = :P5_ID_FLJO',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(39351056969898342)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione la tarea con la que ser\00E1 iniciado el flujo de trabajo.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94887187150405046)
,p_name=>'P5_DRCION'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(110318969746427265)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Duraci\00F3n')
,p_source=>'DRCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>3
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');" '
,p_field_template=>wwv_flow_api.id(39351319077898342)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingresar la duraci\00F3n del flujo de trabajo')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110321156948427341)
,p_name=>'P5_ID_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(94886232188405037)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_FLJO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110321518277427371)
,p_name=>'P5_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(110318969746427265)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&F_CDGO_CLNTE.'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110321817830427374)
,p_name=>'P5_CDGO_FLJO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(110318969746427265)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('C\00F3digo')
,p_source=>'CDGO_FLJO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>1
,p_cMaxlength=>3
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'');" onkeyup="campoMayuscula(this)"'
,p_read_only_when=>'P5_CDGO_FLJO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(39351319077898342)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el c\00F3digo correspondiente al Flujo de trabajo')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110322263352427374)
,p_name=>'P5_DSCRPCION_FLJO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(110318969746427265)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DSCRPCION_FLJO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>100
,p_cHeight=>1
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(39351319077898342)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese una descripci\00F3n del la funci\00F3n que se ejecutar\00E1 en el flujo de trabajo ')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110322659869427374)
,p_name=>'P5_ACTVO'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(110318969746427265)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(39351319077898342)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione si el flujo de trabajo esta activo (Si) o inactivo (No)'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110323045224427374)
,p_name=>'P5_UNDAD_DRCION'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(110318969746427265)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Unidad Duraci\00F3n')
,p_source=>'UNDAD_DRCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_UNIDADES_DURACION'
,p_lov=>'.'||wwv_flow_api.id(110327057228444353)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccionar'
,p_lov_null_value=>'null'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(39351319077898342)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista presentada la unidad de duraci\00F3n del flujo de trabajo ')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118978190689091601)
,p_name=>'P5_INDCDOR_INCIA_USRIO_FNAL'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(110318969746427265)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>unistr('\00BFSe puede iniciar por usuario?')
,p_source=>'INDCDOR_INCIA_USRIO_FNAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(39351319077898342)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(35559677986386106)
,p_validation_name=>unistr('Duraci\00F3n mayor que cero')
,p_validation_sequence=>10
,p_validation=>'P5_DRCION'
,p_validation2=>'0'
,p_validation_type=>'ITEM_IN_VALIDATION_NOT_EQ_STRING2'
,p_error_message=>unistr('La Duraci\00F3n del Flujo debe ser mayor que cero (0).')
,p_associated_item=>wwv_flow_api.id(94887187150405046)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(35559924271386109)
,p_tabular_form_region_id=>wwv_flow_api.id(110468951578427318)
,p_validation_name=>unistr('Duraci\00F3n mayor que cero ')
,p_validation_sequence=>20
,p_validation=>'DRCION'
,p_validation2=>'0'
,p_validation_type=>'ITEM_IN_VALIDATION_NOT_EQ_STRING2'
,p_error_message=>unistr('La duraci\00F3n de la tarea debe ser mayor que cero (0).')
,p_associated_column=>'DRCION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(36998526761072103)
,p_tabular_form_region_id=>wwv_flow_api.id(110354507640565128)
,p_validation_name=>'validar que la tarea origen no sea igual a la de destino'
,p_validation_sequence=>30
,p_validation=>':ID_FLJO_TREA != :ID_FLJO_TREA_DSTNO'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La tarea inicio no debe ser igual a la tarea destino'
,p_associated_column=>'ID_FLJO_TREA_DSTNO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(49588904803850301)
,p_name=>'al seleccionar un registro'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(110468951578427318)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49589025871850302)
,p_event_id=>wwv_flow_api.id(49588904803850301)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(81964543829545701)
,p_name=>'al cambiar el id flujo'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_ID_FLJO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(81964675234545702)
,p_event_id=>wwv_flow_api.id(81964543829545701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'P5_ID_FLJO'
,p_attribute_02=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(36761867384560606)
,p_name=>'al obtener el foco'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_UNDAD_DRCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusin'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(36761942410560607)
,p_event_id=>wwv_flow_api.id(36761867384560606)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'P5_UNDAD_DRCION = $(this.triggeringElement).val()',
'console.log(P5_UNDAD_DRCION);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(36761546586560603)
,p_name=>unistr('al cambiar la duraci\00F3n')
,p_event_sequence=>60
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(110468951578427318)
,p_triggering_element=>'DRCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(36761683736560604)
,p_event_id=>wwv_flow_api.id(36761546586560603)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calcularTiempo(this,''D'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(35560279238386112)
,p_name=>unistr('al cambiar la selecci\00F3n')
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_UNDAD_DRCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(36761720849560605)
,p_event_id=>wwv_flow_api.id(35560279238386112)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var _item = $(this.triggeringElement).val();',
'var undad_fljo = $v(''P5_UNDAD_DRCION'');',
'apex.message.clearErrors();',
'var view = apex.region("id_tareas").widget().interactiveGrid("getViews", "grid");',
'var model = view.model;',
'var records = model._data;',
'var json  = Object.keys(formula);',
'var posItem = json.indexOf(_item);',
'var data = records.filter((f) =>{',
'    return  posItem < json.indexOf(model.getValue(f, ''UNDAD_DRCION'').v)',
'});',
'',
'if (data.length > 0 ){',
'    $s(''P5_UNDAD_DRCION'', P5_UNDAD_DRCION);  ',
'    apex.message.showErrors([',
'        {',
'            type:       "error",',
'            location:   [ "page", "inline" ],',
'            pageItem:   "P5_UNDAD_DRCION",',
unistr('            message:    "La unidad de duraci\00F3n no puede ser inferior a las definidas en las tareas del flujo de trabajo.",'),
'            unsafe:     false',
'        }',
'    ]);',
'}else {',
'    P5_UNDAD_DRCION =  $v(''P5_UNDAD_DRCION'');',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35560308540386113)
,p_event_id=>wwv_flow_api.id(35560279238386112)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'UNDAD_DRCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(36762081700560608)
,p_name=>unistr('al cambiar unidad de duraci\00F3n')
,p_event_sequence=>80
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(110468951578427318)
,p_triggering_element=>'UNDAD_DRCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(36998476749072102)
,p_event_id=>wwv_flow_api.id(36762081700560608)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P5_UNDAD_DRCION'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(36762122940560609)
,p_event_id=>wwv_flow_api.id(36762081700560608)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calcularTiempo(this,''U'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7040535899897602)
,p_name=>'Al cambiar'
,p_event_sequence=>90
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(110468951578427318)
,p_triggering_element=>'INDCDOR_INCIO'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'INDCDOR_INCIO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7040632293897603)
,p_event_id=>wwv_flow_api.id(7040535899897602)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'CDGO_MTDO_ASGNCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7040733558897604)
,p_event_id=>wwv_flow_api.id(7040535899897602)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'CDGO_MTDO_ASGNCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(110324677826427378)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from WF_D_FLUJOS'
,p_attribute_02=>'WF_D_FLUJOS'
,p_attribute_03=>'P5_ID_FLJO'
,p_attribute_04=>'ID_FLJO'
,p_process_when=>'select 1 from wf_d_flujos where id_fljo = :P5_ID_FLJO'
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(110325052204427380)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of WF_D_FLUJOS'
,p_attribute_02=>'WF_D_FLUJOS'
,p_attribute_03=>'P5_ID_FLJO'
,p_attribute_04=>'ID_FLJO'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(110325485010427380)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(110319417495427288)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(110354280721565125)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(110468951578427318)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Tareas: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE,CREATE'
,p_process_when_type=>'REQUEST_NOT_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(110793928822098314)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(221497391826663215)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Participante - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE,CREATE'
,p_process_when_type=>'REQUEST_NOT_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(50125863353422806)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(110354507640565128)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Transiciones - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE,CREATE'
,p_process_when_type=>'REQUEST_NOT_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(105158227135528510)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(105157391394528501)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Flujos Hijos - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE,CREATE'
,p_process_when_type=>'REQUEST_NOT_IN_CONDITION'
);
end;
/
