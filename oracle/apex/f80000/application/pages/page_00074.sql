prompt --application/pages/page_00074
begin
wwv_flow_api.create_page(
 p_id=>74
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Gesti\00F3n de Solicitudes de Desembargo')
,p_step_title=>unistr('Gesti\00F3n de Solicitudes de Desembargo')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function validar_sel() {',
'    apex.item("btn_actlzar_slctud").show();',
'    var region = apex.region("solicitudes");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'                             ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "ID_RSP": model.getValue(record, "IDNTFCCION_RSPNSBLE").trim(),',
'                     "ID_DS":  model.getValue(record, "ID_DSMBRGO_SLCTUD").trim(),',
'                     "ID_ER":  model.getValue(record, "ID_EMBRGOS_RSLCION").trim(),',
'                     "ES":     model.getValue(record, "ESTADO_SLCTUD").v',
'                   };',
'        });',
'          ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM ',
'        //$s(''P85_JSON'', json.length > 0 ? JSON.stringify(json) : '''');',
'        ',
'        //HABILITAMOS O DESHABILITAMOS EL BOTOM DEPENDIENDO SI HAY MAS DE UN REGISTRO SELECCIONADO',
'        if (json.length === 1 ){',
'            //apex.item("BTN_RSPNSBLE").show();',
'            $s(''P74_IDNTFCCION_RSPNSBLE'',  json[0]["ID_RSP"] );//SETEAMOS EL VALOR DEL SIMU SUJETO SI SOLO HAY UNO SELECIONADO ',
'            $s(''P74_ID_DSMBRGO_SLCTUD'',  json[0]["ID_DS"] );',
'            $s(''P74_ID_EMBRGOS_RSLCION'',  json[0]["ID_ER"] );',
'            ',
'            if (json[0]["ID_ER"] > 0){',
'                //apex.item("btn_actlzar_slctud").hide();',
'                apex.item("btn_entidades").show();',
'            }else{',
'                //apex.item("btn_actlzar_slctud").show();',
'                apex.item("btn_entidades").hide();',
'            }',
'            ',
'            if (json[0]["ES"] == "F" || json[0]["ES"] == "A" || json[0]["ES"] == "R"){',
'                apex.item("btn_actlzar_slctud").hide();',
'                apex.item("btn_entidades").hide();',
'            }',
'            ',
'        }else {',
'            //apex.item("BTN_RSPNSBLE").hide();',
'            $s(''P74_IDNTFCCION_RSPNSBLE'', '''');',
'            $s(''P74_ID_DSMBRGO_SLCTUD'', '''' );',
'            $s(''P74_ID_EMBRGOS_RSLCION'', '''' );',
'        }',
'        ',
'        return;',
'    }',
'    /*apex.item("BTN_RSPNSBLE").hide();',
'    apex.item("BTN_INCIAR_PRCSO").hide();',
'    apex.item("BTN_ELMNAR_SJTO").hide();*/',
'    apex.item("btn_actlzar_slctud").hide();',
'    apex.item("btn_entidades").hide();',
'',
'}'))
,p_javascript_code_onload=>'validar_sel();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*#solicitudes_ig_report_settings{',
'    display: none !important;',
'}*/'))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(17445683081942948)
,p_last_updated_by=>'JAGUAS'
,p_last_upd_yyyymmddhh24miss=>'20220203134643'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12387358676040446)
,p_plug_name=>'tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(17363723095919377)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12385109625040424)
,p_plug_name=>'Detalle de Solicitud'
,p_parent_plug_id=>wwv_flow_api.id(12387358676040446)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
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
,p_master_region_id=>wwv_flow_api.id(109891158257496790)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12385304980040426)
,p_name=>'ID_DSMBRGO_SLCTUD_ENTDDES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSMBRGO_SLCTUD_ENTDDES'
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
 p_id=>wwv_flow_api.id(12385417708040427)
,p_name=>'ID_DSMBRGO_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSMBRGO_SLCTUD'
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
,p_parent_column_id=>wwv_flow_api.id(109893401558496795)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12385516533040428)
,p_name=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSLCION'
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
 p_id=>wwv_flow_api.id(12385603262040429)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Resoluci\00F3n de Embargo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(12385745756040430)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
 p_id=>wwv_flow_api.id(12385836923040431)
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
 p_id=>wwv_flow_api.id(12385957135040432)
,p_name=>'NMRO_ACTO_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO_OFCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Oficio de Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(12386082176040433)
,p_name=>'FCHA_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_OFCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Oficio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
 p_id=>wwv_flow_api.id(12386187008040434)
,p_name=>'ID_ENTDDES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ENTDDES'
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
 p_id=>wwv_flow_api.id(12386234481040435)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Entidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(12387172724040444)
,p_name=>'MODIFICAR'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Modificar <span class="fa fa-external-link"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:121:&SESSION.::&DEBUG.:RP,121:P121_ID_DSMBRGO_SLCTUD_ENTDDES,P121_ID_DSMBRGO_SLCTUD:&ID_DSMBRGO_SLCTUD_ENTDDES.,&ID_DSMBRGO_SLCTUD.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(12385260671040425)
,p_internal_uid=>12385260671040425
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
 p_id=>wwv_flow_api.id(12513659905316706)
,p_interactive_grid_id=>wwv_flow_api.id(12385260671040425)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(12513790976316707)
,p_report_id=>wwv_flow_api.id(12513659905316706)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12514255720316708)
,p_view_id=>wwv_flow_api.id(12513790976316707)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(12385304980040426)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12514739330316711)
,p_view_id=>wwv_flow_api.id(12513790976316707)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(12385417708040427)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12515250455316713)
,p_view_id=>wwv_flow_api.id(12513790976316707)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(12385516533040428)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12515797823316714)
,p_view_id=>wwv_flow_api.id(12513790976316707)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(12385603262040429)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12516205896316715)
,p_view_id=>wwv_flow_api.id(12513790976316707)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(12385745756040430)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12516729179316717)
,p_view_id=>wwv_flow_api.id(12513790976316707)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(12385836923040431)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12517273036316718)
,p_view_id=>wwv_flow_api.id(12513790976316707)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(12385957135040432)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12517767398316719)
,p_view_id=>wwv_flow_api.id(12513790976316707)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(12386082176040433)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12518241661316721)
,p_view_id=>wwv_flow_api.id(12513790976316707)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(12386187008040434)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12518749479316722)
,p_view_id=>wwv_flow_api.id(12513790976316707)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(12386234481040435)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12630804073706948)
,p_view_id=>wwv_flow_api.id(12513790976316707)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(12387172724040444)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(109891158257496790)
,p_plug_name=>'Solicitudes de Desembargo'
,p_region_name=>'solicitudes'
,p_parent_plug_id=>wwv_flow_api.id(12387358676040446)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_dsmbrgo_slctud,',
'       a.cdgo_clnte,',
'       a.idntfccion_rspnsble,',
'       a.nmbre_rspnsble,',
'       a.nmro_cpias,',
'       a.drccion_envio,',
'       a.estado_slctud,',
'       to_char(a.fcha_slctud,''dd/mm/yyyy'') as fcha_slctud,',
'       a.id_csles_dsmbrgo,',
'       a.id_embrgos_rslcion,',
'       b.nmro_acto,',
'       to_char(b.fcha_acto,''dd/mm/yyyy'') as fcha_acto,',
'       a.obsrvcion,',
'       a.tpo_slctud',
'  from mc_g_desembargos_solicitud a',
'  left join mc_g_embargos_resolucion b on b.id_embrgos_rslcion = a.id_embrgos_rslcion',
' where a.cdgo_clnte = :f_cdgo_clnte',
'   and (:P74_FECHA_SOLICITUD_DSDE is null or trunc(A.fcha_slctud) >= trunc(to_date(:P74_FECHA_SOLICITUD_DSDE,''DD/MM/YYYY'')))',
'   and (:P74_FECHA_SOLICITUD_HSTA is null or trunc(A.fcha_slctud) <= trunc(to_date(:P74_FECHA_SOLICITUD_HSTA,''DD/MM/YYYY'')))',
'   and (:P74_ID_RESPONSABLE is null or a.idntfccion_rspnsble = :P74_ID_RESPONSABLE)',
'   and (:P74_NOMBRE_RESPONSABLE is null or a.nmbre_rspnsble like ''%''||:P74_NOMBRE_RESPONSABLE||''%'')',
'   and (:P74_ESTADO_SOLICITUD is null or a.estado_slctud =  :P74_ESTADO_SOLICITUD)',
'   and (:P74_ID_CSLES_DSMBRGO is null or a.id_csles_dsmbrgo = :P74_ID_CSLES_DSMBRGO)'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12384122352040414)
,p_name=>'ID_CSLES_DSMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CSLES_DSMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Causal de desembargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(12384253456040415)
,p_name=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSLCION'
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
 p_id=>wwv_flow_api.id(12384392680040416)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12384463862040417)
,p_name=>'TPO_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_SLCTUD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tipo de Solicitud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Contribuyente;CN,Funcionario;FN'
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
 p_id=>wwv_flow_api.id(12384590084040418)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Resoluci\00F3n de Embargo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(12384689891040419)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha de Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
 p_id=>wwv_flow_api.id(109878294614202204)
,p_name=>'FCHA_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_SLCTUD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Solicitud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
 p_id=>wwv_flow_api.id(109892359495496794)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109892845305496794)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_label=>'Acciones'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109893401558496795)
,p_name=>'ID_DSMBRGO_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSMBRGO_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_enable_filter=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109894031366496796)
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
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109894679844496799)
,p_name=>'IDNTFCCION_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_RSPNSBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Identificaci\00F3n Responsable ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109895208482496799)
,p_name=>'NMBRE_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RSPNSBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Responsable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109895856224496799)
,p_name=>'NMRO_CPIAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CPIAS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(109896449992496800)
,p_name=>'DRCCION_ENVIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCCION_ENVIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109897024875496800)
,p_name=>'ESTADO_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTADO_SLCTUD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Estado Solicitud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Solicitado;S,Rechazado;R,Aprobado;A,Finalizado;F'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(109891652771496792)
,p_internal_uid=>109891652771496792
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
 p_id=>wwv_flow_api.id(109892038208496792)
,p_interactive_grid_id=>wwv_flow_api.id(109891652771496792)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(109892168076496793)
,p_report_id=>wwv_flow_api.id(109892038208496792)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12436785746667138)
,p_view_id=>wwv_flow_api.id(109892168076496793)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(12384122352040414)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>146
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12437212001667141)
,p_view_id=>wwv_flow_api.id(109892168076496793)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(12384253456040415)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12437795442667143)
,p_view_id=>wwv_flow_api.id(109892168076496793)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(12384392680040416)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12438230685667144)
,p_view_id=>wwv_flow_api.id(109892168076496793)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(12384463862040417)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>122
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12443256668728600)
,p_view_id=>wwv_flow_api.id(109892168076496793)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(12384590084040418)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>154
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12443730651728601)
,p_view_id=>wwv_flow_api.id(109892168076496793)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(12384689891040419)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109893234300496795)
,p_view_id=>wwv_flow_api.id(109892168076496793)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(109892845305496794)
,p_is_visible=>false
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109893807970496796)
,p_view_id=>wwv_flow_api.id(109892168076496793)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(109893401558496795)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109894489925496798)
,p_view_id=>wwv_flow_api.id(109892168076496793)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(109894031366496796)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109895044817496799)
,p_view_id=>wwv_flow_api.id(109892168076496793)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(109894679844496799)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>181
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109895615821496799)
,p_view_id=>wwv_flow_api.id(109892168076496793)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(109895208482496799)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>157
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109896240123496799)
,p_view_id=>wwv_flow_api.id(109892168076496793)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(109895856224496799)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>125
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109896844211496800)
,p_view_id=>wwv_flow_api.id(109892168076496793)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(109896449992496800)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>233
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109897445620496800)
,p_view_id=>wwv_flow_api.id(109892168076496793)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(109897024875496800)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>119
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109904265209639525)
,p_view_id=>wwv_flow_api.id(109892168076496793)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(109878294614202204)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>126
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(70050000005)
,p_view_id=>wwv_flow_api.id(109892168076496793)
,p_execution_seq=>5
,p_name=>'Estado Solicitud - Aprovado'
,p_background_color=>'#99FF99'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(109897024875496800)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'Aprobado'
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(909940032161)
,p_view_id=>wwv_flow_api.id(109892168076496793)
,p_execution_seq=>10
,p_name=>'Estado Solicitud - Rechazado'
,p_background_color=>'#FF7755'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(109897024875496800)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'Rechazado'
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(1014762038790)
,p_view_id=>wwv_flow_api.id(109892168076496793)
,p_execution_seq=>15
,p_name=>'Estado Solicitud - Finalizado'
,p_background_color=>'#C4C4C4'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(109897024875496800)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'Finalizado'
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(1079229042918)
,p_view_id=>wwv_flow_api.id(109892168076496793)
,p_execution_seq=>20
,p_name=>'Estado Solicitud - Solicitado'
,p_background_color=>'#FFDD44'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(109897024875496800)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'Solicitado'
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(109878333644202205)
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
 p_id=>wwv_flow_api.id(115709238164426514)
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
 p_id=>wwv_flow_api.id(115709303261426515)
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
unistr('<p>Funcionalidad que permite gestionar las solicitudes de desembargo provenientes de la legitimaci\00F3n. </p>'),
'<p><b>1.</b> Permite ir a la pagina de desembargo manual con la cedula para verificar los embargos asociados al responsable y proceder a realizar el desembargo.</p>',
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(115709471704426516)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(115709238164426514)
,p_button_name=>'btn_actlzar_slctud'
,p_button_static_id=>'btn_actlzar_slctud'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Actualizar Solicitud'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-edit'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12386307090040436)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(115709238164426514)
,p_button_name=>'btn_entidades'
,p_button_static_id=>'btn_entidades'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Agregar Entidades <br>a Solicitud'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-window-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(109878844507202210)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(109878333644202205)
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
 p_id=>wwv_flow_api.id(12385078928040423)
,p_branch_name=>unistr('Ir a P\00E1gina 120')
,p_branch_action=>'f?p=&APP_ID.:120:&SESSION.::&DEBUG.:RP,120:P120_ID_DSMBRGO_SLCTUD,P120_IDNTFCCION_RSPNSBLE,P120_VLDA_PGNA:&P74_ID_DSMBRGO_SLCTUD.,&P74_IDNTFCCION_RSPNSBLE.,120&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(115709471704426516)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(12386677969040439)
,p_branch_name=>unistr('Ir a P\00E1gina 121')
,p_branch_action=>'f?p=&APP_ID.:121:&SESSION.::&DEBUG.:RP,121:P121_ID_DSMBRGO_SLCTUD,P121_ID_EMBRGOS_RSLCION:&P74_ID_DSMBRGO_SLCTUD.,&P74_ID_EMBRGOS_RSLCION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(12386307090040436)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12384990783040422)
,p_name=>'P74_ID_DSMBRGO_SLCTUD'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(109878333644202205)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12386730413040440)
,p_name=>'P74_ID_EMBRGOS_RSLCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(109878333644202205)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12387790110040450)
,p_name=>'P74_ID_CSLES_DSMBRGO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(109878333644202205)
,p_prompt=>'Causal de Desembargo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_csal,id_csles_dsmbrgo',
'from mc_d_causales_desembargo',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and (slctud_rspnsble = ''S'' or slctud_fncnrio = ''S'')'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13013838838732709)
,p_name=>'P74_FECHA_SOLICITUD_HSTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(109878333644202205)
,p_prompt=>'Fecha Solicitud Fin'
,p_format_mask=>'dd/mm/yyyy'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_02=>'&P74_FECHA_SOLICITUD_DSDE.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109878415438202206)
,p_name=>'P74_FECHA_SOLICITUD_DSDE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(109878333644202205)
,p_prompt=>'Fecha Solicitud Inicio'
,p_format_mask=>'dd/mm/yyyy'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109878525756202207)
,p_name=>'P74_ESTADO_SOLICITUD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(109878333644202205)
,p_prompt=>'Estado Solicitud'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Solicitado;S,Rechazado;R,Aprobado;A'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109878633644202208)
,p_name=>'P74_ID_RESPONSABLE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(109878333644202205)
,p_prompt=>unistr('Identificaci\00F3n Responsable ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109878791597202209)
,p_name=>'P74_NOMBRE_RESPONSABLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(109878333644202205)
,p_prompt=>'Nombre Responsable'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(115709554831426517)
,p_name=>'P74_IDNTFCCION_RSPNSBLE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(109878333644202205)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(115709658556426518)
,p_name=>'Al seleccionar solicitud'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(109891158257496790)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(115709720494426519)
,p_event_id=>wwv_flow_api.id(115709658556426518)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57852241965104936)
,p_name=>'Al cambiar fecha solicitud'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P74_FECHA_SOLICITUD_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57852311731104937)
,p_event_id=>wwv_flow_api.id(57852241965104936)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P74_FECHA_SOLICITUD_HSTA").datepicker( ''option'' , ''minDate'' , $("#P74_FECHA_SOLICITUD_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109897692410496801)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(109891158257496790)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr(': Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
