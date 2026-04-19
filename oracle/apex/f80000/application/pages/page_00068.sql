prompt --application/pages/page_00068
begin
wwv_flow_api.create_page(
 p_id=>68
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Solicitud de Desembargo - Contribuyentes'
,p_step_title=>'Solicitud de Desembargo - Contribuyentes'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function validar_sel(valid) {',
'',
'    var region = apex.region("solicitudes");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'              ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "ID_DS": model.getValue(record, "ID_DSMBRGO_SLCTUD").trim()',
'                   };',
'        });',
'               ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM ',
'        //$s(''P40_JSON'', json.length > 0 ? JSON.stringify(json) : '''');',
'                ',
'        //window.localStorage.setItem(''jsonEmbargo'', json.length > 0 ? JSON.stringify(json) : '''');',
'        ',
'         //HABILITAMOS O DESHABILITAMOS EL BOTOM DEPENDIENDO SI HAY MAS DE UN REGISTRO SELECCIONADO',
'        if (json.length === 1 ){',
'            /*apex.item("btn_agregar_entidades_a_investigacion").show();',
'            apex.item("btn_cambiar_estado_entidades").show();   */',
'            apex.item("Evidencia_Solicitud").show();                  ',
'            $s(''P68_ID_DSMBRGO_SLCTUD'',  json[0]["ID_DS"] );//SETEAMOS EL VALOR DEL ID DE LA CARTERA SI SOLO HAY UNO SELECIONADO ',
'        }else {',
'            /*apex.item("btn_agregar_entidades_a_investigacion").hide();',
'            apex.item("btn_cambiar_estado_entidades").hide();*/',
'            apex.item("Evidencia_Solicitud").hide();',
'            $s(''P68_ID_DSMBRGO_SLCTUD'',  '''');',
'        }',
'        ',
'        ',
'        //SOLO SE PUEDE INICIAR EL PROCESO SI HAY POR LO MENOS UN REGISTRO SELECCIONADO',
'        /*if (records.length > 0 ) {',
'            apex.item("btn_Procesar_Embargo").show();',
'        }else {',
'            apex.item("btn_Procesar_Embargo").hide();',
'        }*/',
'		',
'        return;',
'    }',
'    ',
'    apex.item("Evidencia_Solicitud").hide();',
'    /*apex.item("btn_agregar_entidades_a_investigacion").hide();',
'    apex.item("btn_cambiar_estado_entidades").hide();',
'    apex.item("BTN_AGREGAR_RSPNSBLE").hide();    */',
'',
'}'))
,p_javascript_code_onload=>'validar_sel();'
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(17445683081942948)
,p_last_upd_yyyymmddhh24miss=>'20200725113320'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11687185023080209)
,p_plug_name=>'Solicitudes de Desembargo'
,p_region_name=>'solicitudes'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_dsmbrgo_slctud,',
'       a.cdgo_clnte,',
'       to_char(a.fcha_slctud,''dd/mm/yyyy'') as fcha_slctud,',
'       a.idntfccion_rspnsble,',
'       a.nmbre_rspnsble,',
'       a.estado_slctud,',
'       a.id_csles_dsmbrgo',
'  from mc_g_desembargos_solicitud a',
' where a.idntfccion_rspnsble = TRIM(:P68_IDNTFCCION_RSPNSBLE)',
'   and a.cdgo_clnte = :F_CDGO_CLNTE'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11687321985080211)
,p_name=>'ID_DSMBRGO_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSMBRGO_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(11687417499080212)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
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
 p_id=>wwv_flow_api.id(11687548334080213)
,p_name=>'IDNTFCCION_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_RSPNSBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Identificaci\00F3n Solicitante')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11687685226080214)
,p_name=>'NMBRE_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RSPNSBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Solicitante'
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
 p_id=>wwv_flow_api.id(11687788319080215)
,p_name=>'ESTADO_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTADO_SLCTUD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Estado de Solicitud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Solicitado;S,Aprobado;A'
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
 p_id=>wwv_flow_api.id(11687806618080216)
,p_name=>'ID_CSLES_DSMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CSLES_DSMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Causal de Solicitud'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_csal,id_csles_dsmbrgo',
'from mc_d_causales_desembargo',
'WHERE cdgo_clnte = :F_CDGO_CLNTE'))
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
 p_id=>wwv_flow_api.id(11689469811080232)
,p_name=>'FCHA_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_SLCTUD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Solicitud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_api.id(11687243283080210)
,p_internal_uid=>11687243283080210
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
 p_id=>wwv_flow_api.id(11906129567385680)
,p_interactive_grid_id=>wwv_flow_api.id(11687243283080210)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(11906218292385680)
,p_report_id=>wwv_flow_api.id(11906129567385680)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11906771556385685)
,p_view_id=>wwv_flow_api.id(11906218292385680)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(11687321985080211)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11907232866385688)
,p_view_id=>wwv_flow_api.id(11906218292385680)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(11687417499080212)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11907722040385691)
,p_view_id=>wwv_flow_api.id(11906218292385680)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(11687548334080213)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11908268122385693)
,p_view_id=>wwv_flow_api.id(11906218292385680)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(11687685226080214)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11908768848385694)
,p_view_id=>wwv_flow_api.id(11906218292385680)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(11687788319080215)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11909226265385695)
,p_view_id=>wwv_flow_api.id(11906218292385680)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(11687806618080216)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12113066132526247)
,p_view_id=>wwv_flow_api.id(11906218292385680)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(11689469811080232)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11687969392080217)
,p_plug_name=>'Evidencias de Solicitud'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>7
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_dsmbrgo_slctud_entddes,b.id_dsmbrgo_slctud,b.id_entddes',
'from mc_g_dsmbrgs_slctd_entdds b'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(11687185023080209)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11688138752080219)
,p_name=>'ID_DSMBRGO_SLCTUD_ENTDDES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSMBRGO_SLCTUD_ENTDDES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11688287659080220)
,p_name=>'ID_DSMBRGO_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSMBRGO_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(11687321985080211)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11688361935080221)
,p_name=>'ID_ENTDDES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ENTDDES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Entidad'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion,a.id_entddes',
'from mc_d_entidades a',
'where a.cdgo_clnte = :F_CDGO_CLNTE;'))
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
 p_id=>wwv_flow_api.id(11688457136080222)
,p_name=>'PDF'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver evidencia <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:mc_g_dsmbrgs_slctd_entdds,blob_slctud,filename_slctud,mime_type_slctud,id_dsmbrgo_slctud_entdde'
||'s,&ID_DSMBRGO_SLCTUD_ENTDDES.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11689378517080231)
,p_name=>'MODIFICAR'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Modificar <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:114:&SESSION.::&DEBUG.:RP,114:P114_ID_DSMBRGO_SLCTUD,P114_ID_DSMBRGO_SLCTUD_ENTDDES:&ID_DSMBRGO_SLCTUD.,&ID_DSMBRGO_SLCTUD_ENTDDES.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(11688019589080218)
,p_internal_uid=>11688019589080218
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
 p_id=>wwv_flow_api.id(11911781774445575)
,p_interactive_grid_id=>wwv_flow_api.id(11688019589080218)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(11911832682445575)
,p_report_id=>wwv_flow_api.id(11911781774445575)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11912343945445576)
,p_view_id=>wwv_flow_api.id(11911832682445575)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(11688138752080219)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11912837432445578)
,p_view_id=>wwv_flow_api.id(11911832682445575)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(11688287659080220)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11913333539445579)
,p_view_id=>wwv_flow_api.id(11911832682445575)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(11688361935080221)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>409
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11913855052445581)
,p_view_id=>wwv_flow_api.id(11911832682445575)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(11688457136080222)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12094607954254590)
,p_view_id=>wwv_flow_api.id(11911832682445575)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(11689378517080231)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>82
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103143198491723825)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17345839561919369)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103145292869723846)
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
 p_id=>wwv_flow_api.id(116929995454382706)
,p_plug_name=>'Ayuda'
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
unistr('<p>Funcionalidad que permite realizar la legitimaci\00F3n de un responsable</p>'),
'<p><b>1.</b>Permite verificar: si tiene o no embargos activos, si tiene convenio de pago y si tiene cartera mayor a 0</p>',
'<p><b>2.</b>Permite realizar una solicitud de desembargo puntual en caso dado el responsable ingresado este legitimado</p>',
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103144049499723834)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(103145292869723846)
,p_button_name=>'Consultar_Condiciones_de_Regla_de_Negocio'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Consultar Condiciones De <br> Regla De Negocio'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103144356766723837)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(103145292869723846)
,p_button_name=>'Vldar_lgtmcion'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Validar Legitimaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P68_TIPO_SOLICITUD'
,p_button_condition2=>'SD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103145311502723847)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(103145292869723846)
,p_button_name=>'Consultar_Desembargos'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Consultar Desembargos'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P68_TIPO_SOLICITUD'
,p_button_condition2=>'RD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(105081359964319307)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(103145292869723846)
,p_button_name=>'Solicitud_Desembargo'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Solicitud Desembargo'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>':P68_INDCDOR_LGTMCION = ''S'' AND :P68_TIPO_SOLICITUD = ''SD'''
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-window-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(11688508462080223)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(103145292869723846)
,p_button_name=>'Evidencia_Solicitud'
,p_button_static_id=>'Evidencia_Solicitud'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Evidencia de Solicitud'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-clipboard-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(103144725028723841)
,p_branch_name=>unistr('Ir a P\00E1gina 71')
,p_branch_action=>'f?p=&APP_ID.:71:&SESSION.::&DEBUG.:RP,71:P71_ID_RGLA_NGCIO_CLNTE:&P68_ID_RGLA_NGCIO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(103144049499723834)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(109877947732202201)
,p_branch_name=>unistr('Ir a P\00E1gina 73')
,p_branch_action=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:RP,73:P73_IDNTFCCION_RSPNSBLE:&P68_IDNTFCCION_RSPNSBLE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(105081359964319307)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(11688795258080225)
,p_branch_action=>'f?p=&APP_ID.:114:&SESSION.::&DEBUG.:RP,114:P114_ID_DSMBRGO_SLCTUD:&P68_ID_DSMBRGO_SLCTUD.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(11688508462080223)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11688646385080224)
,p_name=>'P68_ID_DSMBRGO_SLCTUD'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(103143198491723825)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11688831480080226)
,p_name=>'P68_INDCDOR_LGTMCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(103143198491723825)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103143937308723833)
,p_name=>'P68_ID_RGLA_NGCIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(103143198491723825)
,p_prompt=>'Reglas de Negocio'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrp_rgla_ngcio_clnte,id_rgla_ngcio_clnte --,dscrp_rgla_ngcio_clnte --nmbre_rgla',
'from v_gn_d_reglas_negocio_cliente',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and id_prcso = ''24'';'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>'P68_TIPO_SOLICITUD'
,p_display_when2=>'SD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione la regla de negocio a aplicar a la solicitud de desembargo.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103144183629723835)
,p_name=>'P68_IDNTFCCION_RSPNSBLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(103143198491723825)
,p_prompt=>unistr('Identificaci\00F3n Responsable')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del responsable de la solicitud de desembargo.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103144282734723836)
,p_name=>'P68_NMBRE_RSPNSBLE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(103143198491723825)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103144804311723842)
,p_name=>'P68_RSPSTA_LGTMCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(103143198491723825)
,p_prompt=>unistr('Respuesta de Legitimaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P68_TIPO_SOLICITUD'
,p_display_when2=>'SD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la respuesta de legitimaci\00F3n de la solicitud de desembargo.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103144934732723843)
,p_name=>'P68_OBSRVCION_RSPSTA_LGTMCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(103143198491723825)
,p_prompt=>unistr('Observacion de Respuesta de Legitimaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_display_when=>'P68_TIPO_SOLICITUD'
,p_display_when2=>'SD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la observaci\00F3n de legitimaci\00F3n de desembargo. ')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103145457714723848)
,p_name=>'P68_TIPO_SOLICITUD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(103143198491723825)
,p_item_default=>'SD'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'Seleccione el tipo de solicitud de desembargo.'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(105080786645319301)
,p_validation_name=>'Identificacion nula'
,p_validation_sequence=>10
,p_validation=>'P68_IDNTFCCION_RSPNSBLE'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>unistr('Debe ingresar un numero de Identificaci\00F3n.')
,p_when_button_pressed=>wwv_flow_api.id(103144356766723837)
,p_associated_item=>wwv_flow_api.id(103144183629723835)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(116929638500382703)
,p_validation_name=>'Regla de Negocio nula'
,p_validation_sequence=>20
,p_validation=>'P68_ID_RGLA_NGCIO'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>unistr('Debe Escoger una regla de negocio para validar la legitimaci\00F3n.')
,p_when_button_pressed=>wwv_flow_api.id(103144356766723837)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(116929869332382705)
,p_validation_name=>'Regla de Negocio nula_1'
,p_validation_sequence=>30
,p_validation=>'P68_ID_RGLA_NGCIO'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>unistr('Debe Escoger una regla de negocio para validar la legitimaci\00F3n.')
,p_when_button_pressed=>wwv_flow_api.id(103144049499723834)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(116929723037382704)
,p_validation_name=>'Identifiacion nula - solicitud'
,p_validation_sequence=>40
,p_validation=>'P68_IDNTFCCION_RSPNSBLE'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>unistr('Debe ingresar un numero de Identificaci\00F3n.')
,p_when_button_pressed=>wwv_flow_api.id(105081359964319307)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(105080883345319302)
,p_name=>unistr('Mostrar Campos de legitimaci\00F3n')
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P68_TIPO_SOLICITUD'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(105080911124319303)
,p_event_id=>wwv_flow_api.id(105080883345319302)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(11689008989080228)
,p_name=>'Al seleccionar un registro de solicitud'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(11687185023080209)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11689135110080229)
,p_event_id=>wwv_flow_api.id(11689008989080228)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103145170359723845)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validar legitimacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_CB_MEDIDAS_CAUTELARES.prc_vl_legitimacion_desembargo (p_cdgo_clnte => :F_CDGO_CLNTE,',
'                                                          p_idntfccion => :P68_IDNTFCCION_RSPNSBLE,',
'                                                          p_nmbre_cmplto => null,',
'                                                          p_id_rgla_ngcio_clnte => :P68_ID_RGLA_NGCIO,',
'                                                          p_vlda_prcsmnto => :P68_RSPSTA_LGTMCION,',
'                                                          p_indcdor_prcsmnto => :P68_INDCDOR_LGTMCION,',
'                                                          p_obsrvcion_prcsmnto => :P68_OBSRVCION_RSPSTA_LGTMCION);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(103144356766723837)
);
end;
/
