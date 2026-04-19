prompt --application/pages/page_00115
begin
wwv_flow_api.create_page(
 p_id=>115
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Solicitudes de Desembargo - Funcionario'
,p_step_title=>'Solicitudes de Desembargo - Funcionario'
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
'            return { "ID_DS": model.getValue(record, "ID_DSMBRGO_SLCTUD").trim(),',
'                     "ID_ER": model.getValue(record, "ID_EMBRGOS_RSLCION").trim(),',
'                     "ES":    model.getValue(record, "ESTADO_SLCTUD").v',
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
'            apex.item("Entidades_Solicitud").show();     ',
'            ',
'            $s(''P115_ID_DSMBRGO_SLCTUD'',  json[0]["ID_DS"] );//SETEAMOS EL VALOR DEL ID DE LA CARTERA SI SOLO HAY UNO SELECIONADO ',
'            $s(''P115_ID_EMBRGOS_RSLCION'',  json[0]["ID_ER"] );',
'            ',
'            if (json[0]["ES"] == ''F''){',
'                apex.item("Entidades_Solicitud").hide();',
'            }',
'            ',
'        }else {',
'            /*apex.item("btn_agregar_entidades_a_investigacion").hide();',
'            apex.item("btn_cambiar_estado_entidades").hide();*/',
'            apex.item("Entidades_Solicitud").hide();',
'            $s(''P15_ID_DSMBRGO_SLCTUD'',  '''');',
'            $s(''P115_ID_EMBRGOS_RSLCION'',  '''');',
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
'    apex.item("Entidades_Solicitud").hide();',
'    /*apex.item("btn_agregar_entidades_a_investigacion").hide();',
'    apex.item("btn_cambiar_estado_entidades").hide();',
'    apex.item("BTN_AGREGAR_RSPNSBLE").hide();    */',
'',
'}'))
,p_javascript_code_onload=>'validar_sel();'
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(17445683081942948)
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250625170039'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11689803318080236)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(11689991606080237)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
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
'<p>1.Permite verificar: si tiene o no embargos activos, si tiene convenio de pago y si tiene cartera mayor a 0</p>',
'<p>2.Permite realizar una solicitud de desembargo puntual en caso dado el responsable ingresado este legitimado</p>',
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13013033097732701)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17345839561919369)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13013767261732708)
,p_plug_name=>'tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(17363723095919377)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11690409093080242)
,p_plug_name=>'Entidades de Solicitud'
,p_parent_plug_id=>wwv_flow_api.id(13013767261732708)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_dsmbrgo_slctud_entddes,',
'       b.id_dsmbrgo_slctud,',
'       b.id_embrgos_rslcion,',
'       c.nmro_acto,',
'       to_char(c.fcha_acto,''dd/mm/yyyy'') as fcha_acto,',
'       b.id_slctd_ofcio,',
'       a.nmro_acto_ofcio,',
'       to_char(a.fcha_ofcio,''dd/mm/yyyy'') as fcha_ofcio,',
'       b.id_entddes,',
'       a.dscrpcion',
'  from mc_g_dsmbrgs_slctd_entdds b',
'  left join v_mc_g_solicitudes_y_oficios a on b.id_embrgos_rslcion = a.id_embrgos_rslcion',
'                                          and b.id_slctd_ofcio = a.id_slctd_ofcio',
'  left join mc_g_embargos_resolucion c on c.id_embrgos_rslcion = b.id_embrgos_rslcion;'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(12099812218488327)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11690652949080244)
,p_name=>'ID_DSMBRGO_SLCTUD_ENTDDES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSMBRGO_SLCTUD_ENTDDES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11690758869080245)
,p_name=>'ID_DSMBRGO_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSMBRGO_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(12101605371488333)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11690833162080246)
,p_name=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11690949012080247)
,p_name=>'ID_SLCTD_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTD_OFCIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(11691045305080248)
,p_name=>'ID_ENTDDES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ENTDDES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(11691197588080249)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Resoluci\00F3n de Embargo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(11691248099080250)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12382825111040401)
,p_name=>'NMRO_ACTO_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO_OFCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Oficio de Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(12382908681040402)
,p_name=>'FCHA_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_OFCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de Oficio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12383050535040403)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Entidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(12383934722040412)
,p_name=>'MDFCAR'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Modificar - <br>Cargar Archivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Modificar <span class="fa fa-external-link"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:117:&SESSION.::&DEBUG.:RP,117:P117_ID_DSMBRGO_SLCTUD_ENTDDES,P117_ID_DSMBRGO_SLCTUD:&ID_DSMBRGO_SLCTUD_ENTDDES.,&ID_DSMBRGO_SLCTUD.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12384078842040413)
,p_name=>'PDF'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver o Descargar <br>Archivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(11690541853080243)
,p_internal_uid=>11690541853080243
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
 p_id=>wwv_flow_api.id(12389439473059514)
,p_interactive_grid_id=>wwv_flow_api.id(11690541853080243)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(12389575098059523)
,p_report_id=>wwv_flow_api.id(12389439473059514)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12390025327059536)
,p_view_id=>wwv_flow_api.id(12389575098059523)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(11690652949080244)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12390507542059539)
,p_view_id=>wwv_flow_api.id(12389575098059523)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(11690758869080245)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12391025288059541)
,p_view_id=>wwv_flow_api.id(12389575098059523)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(11690833162080246)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12391586633059543)
,p_view_id=>wwv_flow_api.id(12389575098059523)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(11690949012080247)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12392070816059545)
,p_view_id=>wwv_flow_api.id(12389575098059523)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(11691045305080248)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12392598502059546)
,p_view_id=>wwv_flow_api.id(12389575098059523)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(11691197588080249)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12393051329059548)
,p_view_id=>wwv_flow_api.id(12389575098059523)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(11691248099080250)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12393589794059549)
,p_view_id=>wwv_flow_api.id(12389575098059523)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(12382825111040401)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12394090516059558)
,p_view_id=>wwv_flow_api.id(12389575098059523)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(12382908681040402)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12394561826059560)
,p_view_id=>wwv_flow_api.id(12389575098059523)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(12383050535040403)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12431661191444048)
,p_view_id=>wwv_flow_api.id(12389575098059523)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(12383934722040412)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12433147591502040)
,p_view_id=>wwv_flow_api.id(12389575098059523)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(12384078842040413)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>126
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12099812218488327)
,p_plug_name=>'Solicitudes de Desembargo'
,p_region_name=>'solicitudes'
,p_parent_plug_id=>wwv_flow_api.id(13013767261732708)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_dsmbrgo_slctud,',
'       to_char(a.fcha_slctud,''dd/mm/yyyy'') as fcha_slctud,',
'       a.estado_slctud,',
'       a.id_embrgos_rslcion,',
'       c.nmro_acto as rslcion_embargo,',
'       to_char(c.fcha_acto,''dd/mm/yyyy'') as fcha_rslcion_embrgo,',
'       a.id_csles_dsmbrgo,',
'       b.dscrpcion_csal,',
'       a.tpo_slctud,',
'       a.id_fncnrio,',
'       a.obsrvcion',
'  from mc_g_desembargos_solicitud a',
'  join mc_d_causales_desembargo b on b.id_csles_dsmbrgo = a.id_csles_dsmbrgo',
'  left join mc_g_embargos_resolucion c on c.id_embrgos_rslcion = a.id_embrgos_rslcion',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.tpo_slctud = ''FN''',
'   and (:P115_ID_EMBRGOS_RSLCION_2 is null or a.id_embrgos_rslcion = :P115_ID_EMBRGOS_RSLCION_2)',
'   and (:P115_FECHA_SOLICITUD_DSDE is null or trunc(A.fcha_slctud) >= trunc(to_date(:P115_FECHA_SOLICITUD_DSDE,''DD/MM/YYYY'')))',
'   and (:P115_FECHA_SOLICITUD_HSTA is null or trunc(A.fcha_slctud) <= trunc(to_date(:P115_FECHA_SOLICITUD_HSTA,''DD/MM/YYYY'')))',
'   and (:P115_ESTADO_SOLICITUD is null or a.estado_slctud =  :P115_ESTADO_SOLICITUD)',
'   and (:P115_ID_CSLES_DSMBRGO is null or a.id_csles_dsmbrgo = :P115_ID_CSLES_DSMBRGO)',
'   /*and a.id_fncnrio = (select d.id_fncnrio',
'                         from v_sg_g_usuarios d',
'                        where d.id_usrio = :F_ID_USRIO);*/',
'                        ',
'                        '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11689564899080233)
,p_name=>'RSLCION_EMBARGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSLCION_EMBARGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Resoluci\00F3n de </br>Embargo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(11689648285080234)
,p_name=>'FCHA_RSLCION_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RSLCION_EMBRGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha de Resoluci\00F3n<br> de Embargo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11689750773080235)
,p_name=>'DSCRPCION_CSAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CSAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Causal de Desembargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(12101605371488333)
,p_name=>'ID_DSMBRGO_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSMBRGO_SLCTUD'
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
 p_id=>wwv_flow_api.id(12104079883488335)
,p_name=>'FCHA_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_SLCTUD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de </br>Solicitud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12105803756488336)
,p_name=>'ESTADO_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTADO_SLCTUD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Estado de </br>Solicitud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Solicitado;S,Aprobado;A,Rechazado;R,Finalizado;F'
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
 p_id=>wwv_flow_api.id(12106457676488336)
,p_name=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12107033931488336)
,p_name=>'ID_CSLES_DSMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CSLES_DSMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12107697661488337)
,p_name=>'TPO_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_SLCTUD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12108268783488338)
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62815179302590304)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62815292952590305)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62815482078590307)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n solicitud')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>2000
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
 p_id=>wwv_flow_api.id(12100346478488329)
,p_internal_uid=>12100346478488329
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
 p_id=>wwv_flow_api.id(12100717557488330)
,p_interactive_grid_id=>wwv_flow_api.id(12100346478488329)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(12100811031488330)
,p_report_id=>wwv_flow_api.id(12100717557488330)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12102075271488334)
,p_view_id=>wwv_flow_api.id(12100811031488330)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(12101605371488333)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12104463844488335)
,p_view_id=>wwv_flow_api.id(12100811031488330)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(12104079883488335)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>111
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12106229432488336)
,p_view_id=>wwv_flow_api.id(12100811031488330)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(12105803756488336)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12106852262488336)
,p_view_id=>wwv_flow_api.id(12100811031488330)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(12106457676488336)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12107464507488337)
,p_view_id=>wwv_flow_api.id(12100811031488330)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(12107033931488336)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12108026123488337)
,p_view_id=>wwv_flow_api.id(12100811031488330)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(12107697661488337)
,p_is_visible=>true
,p_is_frozen=>false
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12108627238488341)
,p_view_id=>wwv_flow_api.id(12100811031488330)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(12108268783488338)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12134419328866236)
,p_view_id=>wwv_flow_api.id(12100811031488330)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(11689564899080233)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12134972175866239)
,p_view_id=>wwv_flow_api.id(12100811031488330)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(11689648285080234)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>148
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12135412715866240)
,p_view_id=>wwv_flow_api.id(12100811031488330)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(11689750773080235)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>173
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62842579202092009)
,p_view_id=>wwv_flow_api.id(12100811031488330)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(62815179302590304)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62881121430390333)
,p_view_id=>wwv_flow_api.id(12100811031488330)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(62815482078590307)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(11690096187080238)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(11689803318080236)
,p_button_name=>'btn_slctud_dsmbrgo'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Solicitud de </br>Desembargo'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12383144660040404)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(11689803318080236)
,p_button_name=>'btn_entddes_slctud'
,p_button_static_id=>'Entidades_Solicitud'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Entidades de Solicitud'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-clipboard-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(187464707386158019)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(11689803318080236)
,p_button_name=>'BTN_SLCTUD_DSMBRGO_MSVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Solicitud Desembargo Masiva'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:148:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-external-link'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13013626922732707)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(13013033097732701)
,p_button_name=>'Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(11690190516080239)
,p_branch_action=>'f?p=&APP_ID.:116:&SESSION.::&DEBUG.:RP,116::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(11690096187080238)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(12383563480040408)
,p_branch_name=>unistr('Ir a P\00E1gina 117')
,p_branch_action=>'f?p=&APP_ID.:117:&SESSION.::&DEBUG.:RP,117:P117_ID_DSMBRGO_SLCTUD,P117_ID_EMBRGOS_RSLCION:&P115_ID_DSMBRGO_SLCTUD.,&P115_ID_EMBRGOS_RSLCION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(12383144660040404)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12383295963040405)
,p_name=>'P115_ID_DSMBRGO_SLCTUD'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(13013033097732701)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12383372169040406)
,p_name=>'P115_ID_EMBRGOS_RSLCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(13013033097732701)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13013101639732702)
,p_name=>'P115_FECHA_SOLICITUD_DSDE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(13013033097732701)
,p_prompt=>'Fecha Solicitud Desde'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Seleccione del calendario la fecha inicial de la solicitud de desembargo.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13013243478732703)
,p_name=>'P115_ESTADO_SOLICITUD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(13013033097732701)
,p_prompt=>'Estados de Solicitud'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Solicitado;S,Rechazado;R,Aprobado;A,Finalizado;F'
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de lista el estado de la solicitud a consultar.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13013360795732704)
,p_name=>'P115_ID_EMBRGOS_RSLCION_2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(13013033097732701)
,p_prompt=>unistr('Resoluci\00F3n de Embargo')
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_acto||'' - ''||a.fcha_acto||'' - ''||a.dscrpcion_tipo_embargo||'' - ''||a.idntfccion||'' - ''||a.vgncias,a.id_embrgos_rslcion',
'from v_mc_g_embargos_resolucion a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and exists (select 1',
'              from mc_g_desembargos_solicitud b',
'             where b.id_embrgos_rslcion = a.id_embrgos_rslcion',
'               and b.tpo_slctud = ''FN'')'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Consulta de la lista la resoluci\00F3n de desembargo a consultar.')
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13013411606732705)
,p_name=>'P115_ID_CSLES_DSMBRGO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(13013033097732701)
,p_prompt=>'Causales de Desembargo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_csal,id_csles_dsmbrgo',
'from mc_d_causales_desembargo',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and slctud_fncnrio = ''S'''))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista la causal de desembargo a consultar.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13013536850732706)
,p_name=>'P115_FECHA_SOLICITUD_HSTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(13013033097732701)
,p_prompt=>'Fecha Solicitud Hasta'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Seleccione del calendario la fecha final de la solicitud de desembargo.'
,p_attribute_02=>'&P115_FECHA_SOLICITUD_DSDE.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12383757333040410)
,p_name=>'Al seleccionar una solicitud'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(12099812218488327)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12383828576040411)
,p_event_id=>wwv_flow_api.id(12383757333040410)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(153747595138710202)
,p_event_id=>wwv_flow_api.id(12383757333040410)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_entddes number;',
'begin',
'    select count(1) into v_entddes',
'    from mc_g_dsmbrgs_slctd_entdds',
'    where id_dsmbrgo_slctud = :ID_DSMBRGO_SLCTUD;',
'    ',
'    if v_entddes = 0 then',
'        null;',
'    end if;',
'    ',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57851973486104933)
,p_name=>'Al cambiar fecha solicitud'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P115_FECHA_SOLICITUD_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57852095706104934)
,p_event_id=>wwv_flow_api.id(57851973486104933)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P115_FECHA_SOLICITUD_HSTA").datepicker( ''option'' , ''minDate'' , $("#P115_FECHA_SOLICITUD_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(62815361999590306)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(12099812218488327)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Solicitudes de Desembargo: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
