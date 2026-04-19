prompt --application/pages/page_00022
begin
wwv_flow_api.create_page(
 p_id=>22
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Cierre de Procesos Jur\00EDdicos')
,p_step_title=>'Finalizacion Procesos Juridicos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function validar_sel() {',
'',
'    var region = apex.region("Procesos_juridicos");',
'    if (region) {',
'',
'        var view = apex.region("Procesos_juridicos").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");   ',
'		',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "ID_PRCSOS_JRDCO"	: model.getValue(record, "ID_PRCSOS_JRDCO").trim(),',
'                     "ID_INSTNCIA_FLJO" : model.getValue(record, "ID_INSTNCIA_FLJO").trim(),',
'					 "ID_FLJO_TREA"     : model.getValue(record, "ID_FLJO_TREA").trim()};',
'        }); ',
'        ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM',
'        ',
'        $s(''P22_JSON'', json.length > 0 ? JSON.stringify(json) : '''');',
'        ',
'        ',
'        //HABILITAMOS O DESHABILITAMOS EL BOTOM DEPENDIENDO SI HAY MAS DE UN REGISTRO SELECCIONADO',
'        json.length > 0 ? apex.item("Finalizar_Procesos").show() ',
'                        : apex.item("Finalizar_Procesos").hide();',
'       ',
'        return;',
'    }',
'    apex.item("Finalizar_Procesos").hide();',
'    ',
'}',
''))
,p_javascript_code_onload=>'validar_sel();'
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(17445683081942948)
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20251229164447'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55071323628709113)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <b>',
'        <center>Opciones ',
'            <i class="fa fa-gears" aria-hidden="true"></i>',
'        </center>',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55071447502709114)
,p_plug_name=>'ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <center>',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'        </b>',
'    </center>',
'</h5>',
'<p>',
unistr('<b><i></i></b>Esta funcionalidad permite finalizar los procesos jur\00EDdicos los cuales su cartera asociada es igual a 0. se puede hacer de manera puntual o de manera masiva seleccionando los procesos a los cuales se les har\00E1 la finalizaci\00F3n y luego se ')
||'escoge la plantilla que se utilizara para generar los autos de cierre.<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</p>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55071688442709116)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55387407231586182)
,p_plug_name=>'Finalizacion Procesos Juridicos'
,p_region_name=>'Procesos_juridicos'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    j.cdgo_clnte,',
'    j.id_prcsos_jrdco,',
'    j.nmro_prcso_jrdco,',
'    j.id_instncia_fljo,',
'    d.id_fljo_trea,',
'    d.id_acto_tpo,',
'    t.cdgo_acto_tpo,',
'    t.dscrpcion,',
'    s.idntfccion_sjto',
'from cb_g_procesos_juridico j',
'join cb_g_procesos_jrdco_dcmnto d  on j.id_prcsos_jrdco = d.id_prcsos_jrdco',
'join v_cb_g_procesos_juridico_sjto s  on s.id_prcsos_jrdco = j.id_prcsos_jrdco',
'join gn_d_actos_tipo t  on t.id_acto_tpo = d.id_acto_tpo',
'join v_wf_g_instancias_flujo x on x.id_instncia_fljo = j.id_instncia_fljo and x.id_fljo = :P22_TIPO_FLUJO',
'where d.actvo = ''S''',
'--  and j.etpa_actual_mgra is null ',
'  and (j.nmro_prcso_jrdco = :P22_NMRO_PRCSO_JRDCO or :P22_NMRO_PRCSO_JRDCO is null)',
'  and (d.id_fljo_trea = :P22_ID_FLJO_TREA or :P22_ID_FLJO_TREA is null)',
'  and (s.idntfccion_sjto = :P22_SUJETO or :P22_SUJETO is null)',
'  and d.id_fljo_trea <> (',
'        select max(tr.id_fljo_trea) keep (dense_rank last order by tr.orden)',
'        from v_wf_g_instancias_transicion tr',
'        where tr.id_instncia_fljo = j.id_instncia_fljo',
'  )',
'  and not exists (',
'        select 1',
'        from v_gf_g_cartera_x_concepto a',
'        join cb_g_procesos_jrdco_mvmnto b ',
'          on b.id_sjto_impsto = a.id_sjto_impsto',
'        where b.id_prcsos_jrdco = j.id_prcsos_jrdco and a.vgncia = b.vgncia',
'          and b.id_prdo = a.id_prdo',
'          and a.cdgo_mvnt_fncro_estdo in (''NO'',''CN'')',
'          and nvl(a.vlor_sldo_cptal,0) > 0',
'  )',
'group by j.cdgo_clnte,',
'         j.id_prcsos_jrdco,',
'         j.nmro_prcso_jrdco,',
'         j.id_instncia_fljo,',
'         d.id_fljo_trea,',
'         d.id_acto_tpo,',
'         t.cdgo_acto_tpo,',
'         t.dscrpcion,',
'         s.idntfccion_sjto;',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(13544030390442103)
,p_name=>'PLANTILLA'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" aria-labelledby="id_tareas_ig_grid_vc_ctx id_tareas_ig_grid_vc_cur">Modificar plantilla <span class="fa fa-external-link"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:123:&SESSION.::&DEBUG.:RP,123:P123_TIPO_DCMNTO,P123_ID_PRCSOS_JRDCO,P123_NOMBRE_ETPA,P123_IDNTFCCION,P123_ID_INSTNCIA_FLJO,P123_ID_ACTO_TPO,P123_BRANCH:J,&ID_PRCSOS_JRDCO.,Cierre Proceso Juridico,&IDNTFCCION_SJTO.,&ID_INSTNCIA_FLJO.,&P22'
||'_ID_ACTO_TPO.,&APP_PAGE_ID.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14669794539475701)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n Sujeto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(55070360315709103)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n de Etapa')
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
 p_id=>wwv_flow_api.id(55071096033709110)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(55071142106709111)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(55389283423586200)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(55389847226586201)
,p_name=>'ID_PRCSOS_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_JRDCO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_static_id=>'ID_PRCSOS_JRDCO'
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
 p_id=>wwv_flow_api.id(55390469029586201)
,p_name=>'NMRO_PRCSO_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_PRCSO_JRDCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00FAmero de Proceso Jur\00EDdico')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_03=>'center'
,p_is_required=>true
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_api.id(55391090208586201)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_static_id=>'ID_INSTNCIA_FLJO'
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
 p_id=>wwv_flow_api.id(55391688220586201)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_static_id=>'ID_FLJO_TREA'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(55392258481586202)
,p_name=>'CDGO_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ACTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Etapa Actual del Proceso'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>5
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(82189607194286201)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(55387989165586185)
,p_internal_uid=>55387989165586185
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
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
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
 p_id=>wwv_flow_api.id(55388321422586186)
,p_interactive_grid_id=>wwv_flow_api.id(55387989165586185)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(55388469739586186)
,p_report_id=>wwv_flow_api.id(55388321422586186)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13549698655510582)
,p_view_id=>wwv_flow_api.id(55388469739586186)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(13544030390442103)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14675795189475993)
,p_view_id=>wwv_flow_api.id(55388469739586186)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(14669794539475701)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55389687143586201)
,p_view_id=>wwv_flow_api.id(55388469739586186)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(55389283423586200)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55390270039586201)
,p_view_id=>wwv_flow_api.id(55388469739586186)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(55389847226586201)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55390880770586201)
,p_view_id=>wwv_flow_api.id(55388469739586186)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(55390469029586201)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>193
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55391410214586201)
,p_view_id=>wwv_flow_api.id(55388469739586186)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(55391090208586201)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55392044752586202)
,p_view_id=>wwv_flow_api.id(55388469739586186)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(55391688220586201)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55392641454586202)
,p_view_id=>wwv_flow_api.id(55388469739586186)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(55392258481586202)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>177
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55438718569051993)
,p_view_id=>wwv_flow_api.id(55388469739586186)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(55070360315709103)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>318
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55446346523174154)
,p_view_id=>wwv_flow_api.id(55388469739586186)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(55071096033709110)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>146
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(82201179525300566)
,p_view_id=>wwv_flow_api.id(55388469739586186)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(82189607194286201)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55071514602709115)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(55071323628709113)
,p_button_name=>'Finalizar_Procesos'
,p_button_static_id=>'Finalizar_Procesos'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Finalizar Procesos'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(62816120175590314)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(55071323628709113)
,p_button_name=>'Ir_impresion_actos'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>unistr('Ir a Impresi\00F3n </br>de Actos')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:RP,25::'
,p_icon_css_classes=>'fa-angle-double-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55071925670709119)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(55071688442709116)
,p_button_name=>'Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="top:25px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(55072739209709127)
,p_branch_name=>unistr('Ir a P\00E1gina 21')
,p_branch_action=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:RP,21:P21_CDGO_ACTO_TPO:&P22_ID_ACTO_TPO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(55071514602709115)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38951672312269711)
,p_name=>'P22_TIPO_FLUJO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(55071688442709116)
,p_prompt=>'Tipo de Proceso'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion_fljo ,b.id_fljo',
' from wf_d_flujos b',
'where id_prcso = 10',
'  and cdgo_clnte = :f_cdgo_clnte'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tipo de proceso que desea consultar '
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55071743640709117)
,p_name=>'P22_NMRO_PRCSO_JRDCO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(55071688442709116)
,p_prompt=>unistr('N\00FAmero Proceso Jur\00EDdico')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero del proceso Jur\00EDdico que desea consultar.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55071873229709118)
,p_name=>'P22_ID_FLJO_TREA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(55071688442709116)
,p_prompt=>unistr('Etapas Proceso Jur\00EDdico')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select initcap(a.nmbre_trea) nmbre_trea, a.id_fljo_trea',
'  from v_wf_d_flujos_tarea a',
' where a.id_fljo = :p22_tipo_flujo',
' order by a.nmbre_trea'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P22_TIPO_FLUJO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista la etapa del proceso seleccionado que desea consultar.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55072096220709120)
,p_name=>'P22_SUJETO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(55071688442709116)
,p_prompt=>'Sujeto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Es el n\00FAmero de identificaci\00F3n del sujeto asociado a un proceso jur\00EDdico, ingrese un n\00FAmero de identificaci\00F3n del sujeto para buscar de manera puntual el proceso donde este contenida esa identificaci\00F3n.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55072164536709121)
,p_name=>'P22_JSON'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(55071688442709116)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55072506849709125)
,p_name=>'P22_ID_ACTO_TPO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(55071688442709116)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.id_acto_tpo',
'  from gn_d_actos_tipo_tarea t',
' where t.id_fljo_trea = (select distinct first_value(id_fljo_trea) over(order by orden desc) ultima_tarea',
'                           from v_wf_g_instancias_transicion tr',
'                          where tr.id_fljo = :p22_tipo_flujo',
'                            and exists (select * ',
'                                          from wf_d_flujos b',
'                                         where b.id_fljo = tr.id_fljo ',
'                                           and b.id_prcso = 10',
'                                           and b.cdgo_clnte = :f_cdgo_clnte))'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(55072209441709122)
,p_name=>'Al seleccionar datos de la grilla'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(55387407231586182)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(55072379693709123)
,p_event_id=>wwv_flow_api.id(55072209441709122)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(55072855577709128)
,p_name=>'al cerrar el cuadro de dialogo'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(55072930409709129)
,p_event_id=>wwv_flow_api.id(55072855577709128)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(55387407231586182)
,p_stop_execution_on_error=>'Y'
);
end;
/
