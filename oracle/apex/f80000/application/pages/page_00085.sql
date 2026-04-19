prompt --application/pages/page_00085
begin
wwv_flow_api.create_page(
 p_id=>85
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Inicio de Medida de Secuestre'
,p_step_title=>'Inicio de Medida de Secuestre'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function validar_sel() {',
'',
'    var region = apex.region("oficios_emb");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'                             ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "ID_SO": model.getValue(record, "ID_SLCTD_OFCIO").trim(),',
'                     "ID_EC": model.getValue(record, "ID_EMBRGOS_CRTRA").trim(),',
'                     "ID_ER": model.getValue(record, "ID_EMBRGOS_RSLCION").trim()',
'                   };',
'        });',
'               ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM ',
'        $s(''P85_JSON'', json.length > 0 ? JSON.stringify(json) : '''');',
'        ',
'        //HABILITAMOS O DESHABILITAMOS EL BOTOM DEPENDIENDO SI HAY MAS DE UN REGISTRO SELECCIONADO',
'        if (json.length === 1 ){',
'            //apex.item("BTN_RSPNSBLE").show();',
'            $s(''P85_ID_SLCTD_OFCIO'',  json[0]["ID_SO"] );//SETEAMOS EL VALOR DEL SIMU SUJETO SI SOLO HAY UNO SELECIONADO ',
'        }else {',
'            //apex.item("BTN_RSPNSBLE").hide();',
'            $s(''P85_ID_SLCTD_OFCIO'',  '''');',
'        }',
'        ',
'        return;',
'    }',
'    /*apex.item("BTN_RSPNSBLE").hide();',
'    apex.item("BTN_INCIAR_PRCSO").hide();',
'    apex.item("BTN_ELMNAR_SJTO").hide();*/',
'    ',
'',
'}'))
,p_javascript_code_onload=>'validar_sel();'
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(17445683081942948)
,p_last_upd_yyyymmddhh24miss=>'20200725113320'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(111712030446384432)
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
'<p>Funcionalidad que permite iniciar una medida de secuestre contra un embargo.</p>',
'<p><b>1.</b> Permite Asignar el secuestre y el auxiliar de secuestre para iniciar la medida de secuestre</p>',
'<p><b>2.</b> En la parte inferior izquierda muestra los oficios de embargo a bien</p>',
'<p><b>3.</b>En la parte inferior derecha muestra los datos del bien embargado y los datos de los responsables asociados a al embargo</p>',
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(111712176827384433)
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
 p_id=>wwv_flow_api.id(111712289711384434)
,p_plug_name=>'Oficios de Embargo a Bien'
,p_region_name=>'oficios_emb'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>6
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_slctd_ofcio,',
'       a.id_embrgos_crtra,',
'       a.id_embrgos_rslcion,',
'       a.nmro_acto_ofcio,',
'       to_char(a.fcha_ofcio,''dd/mm/yyyy'') as fcha_ofcio,',
'       a.nmro_rslcion_emb,',
'       to_char(a.fcha_rslcion_emb,''dd/mm/yyyy'') as fcha_rslcion_emb',
'from v_mc_g_solicitudes_y_oficios a',
'join v_mc_g_embargos_cartera g on g.id_embrgos_crtra = a.id_embrgos_crtra',
'                              and g.cdgo_estdos_crtra = ''S''',
'join mc_d_tipos_mdda_ctlar b on b.id_tpos_mdda_ctlar = g.id_tpos_embrgo',
'                            and b.cdgo_tpos_mdda_ctlar = ''BIM''',
'where g.cdgo_clnte = :F_CDGO_CLNTE',
'and not exists (select 3',
'                  from v_mc_g_secuestre_gestion f',
'                 where f.id_slctd_ofcio = a.id_slctd_ofcio',
'                   and f.actvo = ''S'')',
'and (:P85_RSLCION_EMBRGO IS NULL or a.nmro_rslcion_emb = :P85_RSLCION_EMBRGO)',
'and (:P85_OFCIO_EMBRGO IS NULL or a.nmro_acto_ofcio = :P85_OFCIO_EMBRGO)',
'and (:P85_SUJETO is null or exists (select 1',
'                                      from v_mc_g_embargos_bienes c',
'                                     inner join mc_g_embargos_bienes_detalle d on d.id_embrgos_bnes = c.id_embrgos_bnes',
'                                     where c.id_slctd_ofcio = a.id_slctd_ofcio',
'                                       and d.vlor_prpdad = :P85_SUJETO))'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_column_width=>'style="padding-top: 40px;"'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111712457253384436)
,p_name=>'ID_SLCTD_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTD_OFCIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(111712529186384437)
,p_name=>'ID_EMBRGOS_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_CRTRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111712656974384438)
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111712778811384439)
,p_name=>'NMRO_ACTO_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO_OFCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Oficio de Embargo'
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
 p_id=>wwv_flow_api.id(111712877489384440)
,p_name=>'FCHA_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_OFCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de Oficio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'dd/mm/yyyy'
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
 p_id=>wwv_flow_api.id(111712956216384441)
,p_name=>'NMRO_RSLCION_EMB'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RSLCION_EMB'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Resoluci\00F3n de Embargo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(111713042133384442)
,p_name=>'FCHA_RSLCION_EMB'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RSLCION_EMB'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha de Resoluci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'dd/mm/yyyy'
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
 p_id=>wwv_flow_api.id(111712317959384435)
,p_internal_uid=>111712317959384435
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(113009780488019592)
,p_interactive_grid_id=>wwv_flow_api.id(111712317959384435)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(113009830108019593)
,p_report_id=>wwv_flow_api.id(113009780488019592)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113010335799019597)
,p_view_id=>wwv_flow_api.id(113009830108019593)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(111712457253384436)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113010827054019606)
,p_view_id=>wwv_flow_api.id(113009830108019593)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(111712529186384437)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113011303338019612)
,p_view_id=>wwv_flow_api.id(113009830108019593)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(111712656974384438)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113011820046019614)
,p_view_id=>wwv_flow_api.id(113009830108019593)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(111712778811384439)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113012365762019615)
,p_view_id=>wwv_flow_api.id(113009830108019593)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(111712877489384440)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113012874497019616)
,p_view_id=>wwv_flow_api.id(113009830108019593)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(111712956216384441)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113013392307019618)
,p_view_id=>wwv_flow_api.id(113009830108019593)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(111713042133384442)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113039516378147704)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(115708773012426509)
,p_plug_name=>'Tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(17363723095919377)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(111713101730384443)
,p_plug_name=>'Bienes Embargados'
,p_parent_plug_id=>wwv_flow_api.id(115708773012426509)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_embrgos_bnes,',
'       a.id_embrgos_bnes_dtlle,',
'       c.id_slctd_ofcio,',
'       b.dscrpcion,',
'       a.vlor_prpdad',
'from mc_g_embargos_bienes_detalle a',
'inner join mc_g_embargos_bienes c on c.id_embrgos_bnes = a.id_embrgos_bnes',
'inner join mc_d_propiedades_bien b on b.id_prpddes_bien = a.id_prpddes_bien;'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(111712289711384434)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111713366048384445)
,p_name=>'ID_EMBRGOS_BNES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_BNES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111713428496384446)
,p_name=>'ID_EMBRGOS_BNES_DTLLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_BNES_DTLLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111713508797384447)
,p_name=>'ID_SLCTD_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTD_OFCIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(111712457253384436)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111713664770384448)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Propiedad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(111713737414384449)
,p_name=>'VLOR_PRPDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_PRPDAD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Valor Propiedad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>150
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
 p_id=>wwv_flow_api.id(111713298055384444)
,p_internal_uid=>111713298055384444
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
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
 p_id=>wwv_flow_api.id(113021953977089941)
,p_interactive_grid_id=>wwv_flow_api.id(111713298055384444)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(113022082850089941)
,p_report_id=>wwv_flow_api.id(113021953977089941)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113022508936089943)
,p_view_id=>wwv_flow_api.id(113022082850089941)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(111713366048384445)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113023028367089944)
,p_view_id=>wwv_flow_api.id(113022082850089941)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(111713428496384446)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113023575877089945)
,p_view_id=>wwv_flow_api.id(113022082850089941)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(111713508797384447)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113024061824089946)
,p_view_id=>wwv_flow_api.id(113022082850089941)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(111713664770384448)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>178
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113024595358089948)
,p_view_id=>wwv_flow_api.id(113022082850089941)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(111713737414384449)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>226
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(115707965554426501)
,p_plug_name=>'Responsables embargo'
,p_parent_plug_id=>wwv_flow_api.id(115708773012426509)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_embrgos_rspnsble,',
'       a.id_embrgos_crtra,',
'       a.id_embrgos_rslcion,',
'       a.dscrpcion_idntfccion_tpo,',
'       a.idntfccion,',
'       A.nmbre_cmplto',
'from v_mc_g_embargos_rspnsble_emb a'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(111712289711384434)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(115708171953426503)
,p_name=>'ID_EMBRGOS_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSPNSBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(115708239598426504)
,p_name=>'ID_EMBRGOS_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_CRTRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(115708377989426505)
,p_name=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(111712656974384438)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(115708436474426506)
,p_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_IDNTFCCION_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Tipo Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
 p_id=>wwv_flow_api.id(115708504673426507)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
 p_id=>wwv_flow_api.id(115708609301426508)
,p_name=>'NMBRE_CMPLTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_CMPLTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Responsable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(115708002961426502)
,p_internal_uid=>115708002961426502
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
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
 p_id=>wwv_flow_api.id(115713554690439827)
,p_interactive_grid_id=>wwv_flow_api.id(115708002961426502)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(115713662075439828)
,p_report_id=>wwv_flow_api.id(115713554690439827)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115714192627439833)
,p_view_id=>wwv_flow_api.id(115713662075439828)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(115708171953426503)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115714627702439836)
,p_view_id=>wwv_flow_api.id(115713662075439828)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(115708239598426504)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115715150621439837)
,p_view_id=>wwv_flow_api.id(115713662075439828)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(115708377989426505)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115715623022439839)
,p_view_id=>wwv_flow_api.id(115713662075439828)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(115708436474426506)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>148
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115716190417439840)
,p_view_id=>wwv_flow_api.id(115713662075439828)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(115708504673426507)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115716584073439841)
,p_view_id=>wwv_flow_api.id(115713662075439828)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(115708609301426508)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113039319565147702)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(111712176827384433)
,p_button_name=>'Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113039693161147705)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(113039516378147704)
,p_button_name=>'btn_asignar_secuestre'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Asignar Secuestre'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(114030549522954330)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(113039516378147704)
,p_button_name=>'btn_gestion_secuestre'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>unistr('Gesti\00F3n de Medida <br>de Secuestre')
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-box-arrow-in-ne'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(113041191915147720)
,p_branch_name=>unistr('Ir a P\00E1gina 87')
,p_branch_action=>'f?p=&APP_ID.:87:&SESSION.::&DEBUG.:RP,87:P87_ID_SLCTD_OFCIO:&P85_ID_SLCTD_OFCIO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(113039693161147705)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(114030658550954331)
,p_branch_action=>'f?p=&APP_ID.:88:&SESSION.::&DEBUG.:RP,88::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(114030549522954330)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111713859483384450)
,p_name=>'P85_RSLCION_EMBRGO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(111712176827384433)
,p_prompt=>unistr('Resoluci\00F3n de Embargo')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de resoluci\00F3n de embargo para consultar por este par\00E1metro.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113039288497147701)
,p_name=>'P85_OFCIO_EMBRGO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(111712176827384433)
,p_prompt=>'Oficio de Embargo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de oficio de embargo para consultar por este par\00E1metro.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113039430059147703)
,p_name=>'P85_SUJETO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(111712176827384433)
,p_prompt=>'Valor de Propiedad de Bien'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el valor de la propiedad  del bien asociado al embargo para consultar por este par\00E1metro.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113039705015147706)
,p_name=>'P85_JSON'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(111712176827384433)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113039804818147707)
,p_name=>'P85_ID_SLCTD_OFCIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(111712176827384433)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(113039914975147708)
,p_name=>'Al seleccionar registro'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(111712289711384434)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(113040072985147709)
,p_event_id=>wwv_flow_api.id(113039914975147708)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel();'
,p_stop_execution_on_error=>'Y'
);
end;
/
