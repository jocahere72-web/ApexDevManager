prompt --application/pages/page_00149
begin
wwv_flow_api.create_page(
 p_id=>149
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Flujos Asociados'
,p_step_title=>'Flujos Asociados'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function irAFlujo(id_instancia){',
'    apex.server.process("IniciarFlujo", {',
'        f01: id_instancia',
'    },',
'    { success: function (data) { ',
'            if (data.type === ''OK'') {',
'                window.localStorage.clear();',
'                window.location.href = data.url;',
'            }else{',
'                apex.message.showErrors({',
'                    type: apex.message.TYPE.ERROR,',
'                    location: ["page"],',
'                    message: data.msg,',
'                    unsafe: false',
'                });',
'            }',
'        },',
'        error: function () {',
'            console.log(arguments);',
'        }',
'    }); ',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LOBREDOR'
,p_last_upd_yyyymmddhh24miss=>'20200116095356'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26819697483860201)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33495015288634737)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(127752670718559841)
,p_plug_name=>unistr('Reversi\00F3n de Acuerdos de Pago')
,p_region_name=>'acuerdoReversar'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.fcha_incio,',
'       d.estdo_instncia,',
'       d.id_fljo,',
'       d.id_instncia_fljo,',
'       d.obsrvcion,',
'       e.dscrpcion_fljo',
'    from wf_g_instancias_transicion a',
'    join v_wf_d_flujos_tarea    b on b.id_fljo_trea = a.id_fljo_trea_orgen',
'    join wf_d_estado_transicion c on a.id_estdo_trnscion = c.id_estdo_trnscion',
'    join wf_g_instancias_flujo d on a.id_instncia_fljo = d.id_instncia_fljo',
'    join wf_d_flujos e on d.id_fljo = e.id_fljo',
'                      and e.cdgo_fljo in (''CNV'',''RAP'')',
'    where a.id_estdo_trnscion in (1,2)',
'      and a.id_usrio = :F_ID_USRIO',
'      and b.cdgo_clnte = :F_CDGO_CLNTE',
'      and (e.id_fljo = :P149_ID_FLJO or :P149_ID_FLJO is null)',
'      and (trunc(d.fcha_incio) between :P149_FCHA_INCIAL and :P149_FCHA_FNAL',
'           or (trunc(d.fcha_incio) >= :P149_FCHA_INCIAL and :P149_FCHA_FNAL is null) ',
'           or (trunc(d.fcha_incio) <= :P149_FCHA_FNAL and :P149_FCHA_INCIAL  is null)',
'           or(:P149_FCHA_INCIAL is null and :P149_FCHA_FNAL is null ));    ',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P149_ID_CNVNIO_TPO,P149_NMRO_CNVNIO,P149_IDNTFCCION_SJTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(26636581499962708)
,p_name=>'FCHA_INCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_INCIO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha <br>Inicio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
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
 p_id=>wwv_flow_api.id(26636642097962709)
,p_name=>'ESTDO_INSTNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTDO_INSTNCIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
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
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(26636793920962710)
,p_name=>'ID_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
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
 p_id=>wwv_flow_api.id(26636803008962711)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Instancia <br> Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(26636913628962712)
,p_name=>'DSCRPCION_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_FLJO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(26637085276962713)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(148451567748070543)
,p_name=>'Ver'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ir a <br>Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#" onclick="irAFlujo(&ID_INSTNCIA_FLJO.)" style="color:blue" >',
'    <span class="fa fa-eye"></span>',
'</a>'))
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(127752755965559842)
,p_internal_uid=>127752755965559842
,p_is_editable=>false
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
 p_id=>wwv_flow_api.id(127758715358568612)
,p_interactive_grid_id=>wwv_flow_api.id(127752755965559842)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(127758829533568612)
,p_report_id=>wwv_flow_api.id(127758715358568612)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26776858075940253)
,p_view_id=>wwv_flow_api.id(127758829533568612)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(26636581499962708)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26777322605940254)
,p_view_id=>wwv_flow_api.id(127758829533568612)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(26636642097962709)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26777829844940259)
,p_view_id=>wwv_flow_api.id(127758829533568612)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(26636793920962710)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26778386500940260)
,p_view_id=>wwv_flow_api.id(127758829533568612)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(26636803008962711)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26778885439940262)
,p_view_id=>wwv_flow_api.id(127758829533568612)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(26636913628962712)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26779347028940263)
,p_view_id=>wwv_flow_api.id(127758829533568612)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(26637085276962713)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(148500185406142765)
,p_view_id=>wwv_flow_api.id(127758829533568612)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(148451567748070543)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(168006487557870909)
,p_plug_name=>'Ayuda'
,p_region_name=>'acuerdoReversar'
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
'    Esta funcionalidad permite<br><br>',
unistr('    Consultar los flujos de acuerdo de pago o reversi\00F3n de acuerdo de pago a los que el funcionario le haya sido parametrizado como participante de las etapas de \00E9ste.<br><br>'),
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26820412814860209)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(26819697483860201)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(47137059372211204)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(33495015288634737)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(33495190688634738)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(33495015288634737)
,p_button_name=>'BTN_NVA_PQR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva PQR'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(47137100416211205)
,p_branch_name=>'Go To Page &P149_PAGE.'
,p_branch_action=>'f?p=&P149_APP.:&P149_PAGE.:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(47137059372211204)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(33495253229634739)
,p_branch_name=>unistr('Ir a P\00E1gina 17')
,p_branch_action=>'f?p=62000:17:&SESSION.::&DEBUG.:RP,17:P17_ID_PRCSO:9&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(33495190688634738)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26820187099860206)
,p_name=>'P149_ID_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26819697483860201)
,p_prompt=>'Flujo de Proceso'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  dscrpcion_fljo d ',
'        ,id_fljo r',
' from wf_d_flujos',
'where cdgo_clnte = 6',
'  and cdgo_fljo in (''CNV'', ''RAP'');',
''))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el flujo de proceso a detallar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26820250612860207)
,p_name=>'P149_FCHA_INCIAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(26819697483860201)
,p_prompt=>'Fecha Inicial'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00EDnima del rango, correspondiente  al inicio del flujo del proceso.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26820305239860208)
,p_name=>'P149_FCHA_FNAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(26819697483860201)
,p_prompt=>'Fecha Final'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00E1xima del rango, correspondiente  al inicio del flujo del proceso.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47136871607211202)
,p_name=>'P149_APP'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(26819697483860201)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47136968214211203)
,p_name=>'P149_PAGE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(26819697483860201)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26637216534962715)
,p_process_sequence=>10
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
