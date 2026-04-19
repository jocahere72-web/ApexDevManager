prompt --application/pages/page_00147
begin
wwv_flow_api.create_page(
 p_id=>147
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Gesti\00F3n de Reversi\00F3n de Acuerdo de Pago')
,p_step_title=>unistr('Gesti\00F3n de Reversi\00F3n de Acuerdo de Pago')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function irFlujo(id_instancia){',
'    apex.server.process("IniciarFlujo", {f01: id_instancia}).then(function(data){',
'        if (data.type === ''OK'') {',
'            window.localStorage.clear();',
'            window.location.href = data.url;',
'        }else{',
'            apex.message.showErrors({',
'                type: apex.message.TYPE.ERROR,',
'                location: ["page"],',
'                message: data.msg,',
'                unsafe: false',
'            });',
'        }',
'    }); ',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''BTN_RCHZAR_RVRSION'').hide();',
'apex.item(''BTN_RVRSAR_ACRDO'').hide();   '))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(177374633629050691)
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20201021164009'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25304838039734602)
,p_plug_name=>'Plantilla'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100990016870842701)
,p_plug_name=>unistr('Reversi\00F3n de Acuerdos de Pago Registrados')
,p_region_name=>'acuerdoReversar'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_cnvnio,',
'          (select min(vgncia) from gf_g_convenios_cartera m where m.id_cnvnio = a.id_cnvnio) vgncia_mmna,',
'          (select max(vgncia) from gf_g_convenios_cartera m where m.id_cnvnio = a.id_cnvnio) vgncia_mxma,',
'          a.nmro_cnvnio,',
'          trunc(a.fcha_rgstro) fcha_rgstro,',
'          (select to_char(ttal_cnvnio, :F_FRMTO_MNDA) from gf_g_convenios where id_cnvnio = a.id_cnvnio)ttal_cnvnio,',
'          nvl(a.idntfccion_sjto_frmtda, idntfccion_sjto) idntfccion_sjto_frmtda,',
'          a.nmbre_slctnte,',
'          a.cdgo_cnvnio_rvrsion_estdo,',
'          initcap(a.dscrpcion_cnvnio_rvrsion_estdo) dscrpcion_cnvnio_rvrsion_estdo,',
'          a.nmbre_impsto,',
'          a.nmbre_impsto_sbmpsto,',
'          a.id_instncia_fljo_hjo,',
'          a.id_acto,',
'          a.nmro_acto',
'     from v_gf_g_convenios_reversion a',
'left join (select id_cnvnio, count (id_cnvnio) cntdad',
'                   from gf_g_convenios_extracto        ',
'               group by id_cnvnio) b on a.id_cnvnio = b.id_cnvnio ',
'left join (select id_cnvnio, count (id_cnvnio) cntdad',
'                   from gf_g_convenios_extracto',
'                   where indcdor_cta_pgda = ''N'' ',
'                   group by id_cnvnio) c on c.id_cnvnio = b.id_cnvnio',
'                                        and b.id_cnvnio is not null and (c.cntdad <> b.cntdad or c.cntdad = b.cntdad )',
'     join wf_g_instancias_flujo d on a.id_instncia_fljo_hjo = d.id_instncia_fljo',
'                                 and d.id_usrio = :F_ID_USRIO',
'left join gf_g_convenios_documentos e on a.id_acto = e.id_acto',
'    where  a.cdgo_clnte = :F_CDGO_CLNTE  ',
'      and (a.id_impsto = :P147_ID_IMPSTO or :P147_ID_IMPSTO is null)',
'      and (a.id_impsto_sbmpsto = :P147_ID_IMPSTO_SBMPSTO or :P147_ID_IMPSTO_SBMPSTO is null)',
'      and (a.cdgo_cnvnio_rvrsion_estdo = :P147_CDGO_CNVNIO_RVRSION_ESTDO or :P147_CDGO_CNVNIO_RVRSION_ESTDO is null)      ',
'      and (a.id_cnvnio_tpo = :P147_ID_CNVNIO_TPO or :P147_ID_CNVNIO_TPO is null)',
'      and (a.nmro_cnvnio = :P147_NMRO_CNVNIO or :P147_NMRO_CNVNIO is null)',
'      and (a.idntfccion_sjto =:P147_IDNTFCCION_SJTO or :P147_IDNTFCCION_SJTO is null) ',
'      and ((trunc(a.fcha_rgstro) between :P147_FCHA_INCIO and :P147_FCHA_FNAL)',
'       or (trunc(a.fcha_rgstro) >= :P147_FCHA_INCIO and :P147_FCHA_FNAL is null) ',
'       or (trunc(a.fcha_rgstro) <= :P147_FCHA_FNAL and :P147_FCHA_INCIO  is null)',
'       or(:P147_FCHA_INCIO is null and :P147_FCHA_FNAL is null )) '))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P147_ID_CNVNIO_TPO,P147_NMRO_CNVNIO,P147_IDNTFCCION_SJTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23957798053187048)
,p_name=>'CDGO_CNVNIO_RVRSION_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNVNIO_RVRSION_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
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
 p_id=>wwv_flow_api.id(23957858919187049)
,p_name=>'DSCRPCION_CNVNIO_RVRSION_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNVNIO_RVRSION_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(32846565603497808)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35174913925977601)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
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
 p_id=>wwv_flow_api.id(56880579425055020)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00B0 Acto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
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
 p_id=>wwv_flow_api.id(100990504329842706)
,p_name=>'NMBRE_SLCTNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SLCTNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Solicitante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>404
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
 p_id=>wwv_flow_api.id(100990709129842708)
,p_name=>'NMRO_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNVNIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00FAmero <br> Acuerdo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(101027933738080601)
,p_name=>'ID_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNVNIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(101982058507693902)
,p_name=>'TTAL_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TTAL_CNVNIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total <br> Acuerdo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_api.id(110945864259362711)
,p_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO_FRMTDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(113616184103132320)
,p_name=>'VGNCIA_MMNA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA_MMNA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Desde'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(113616259063132321)
,p_name=>'VGNCIA_MXMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA_MXMA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Hasta'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(117774251045182501)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha <br> Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_api.id(119356304427894515)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(119356453495894516)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub - Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(121688913900353403)
,p_name=>'Ver'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver <br> Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#" onclick="irFlujo(&ID_INSTNCIA_FLJO_HJO.)" style="color:blue" >',
'    <span class="fa fa-eye"></span>',
'</a>'))
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(121689170144353405)
,p_name=>'ID_INSTNCIA_FLJO_HJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO_HJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(100990102117842702)
,p_internal_uid=>100990102117842702
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
 p_id=>wwv_flow_api.id(100996061510851472)
,p_interactive_grid_id=>wwv_flow_api.id(100990102117842702)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(100996175685851472)
,p_report_id=>wwv_flow_api.id(100996061510851472)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42356318235081)
,p_view_id=>wwv_flow_api.id(100996175685851472)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(23957798053187048)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42947713235086)
,p_view_id=>wwv_flow_api.id(100996175685851472)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(23957858919187049)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35181178588977777)
,p_view_id=>wwv_flow_api.id(100996175685851472)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(35174913925977601)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(56943307852268834)
,p_view_id=>wwv_flow_api.id(100996175685851472)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(56880579425055020)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(100998152647851481)
,p_view_id=>wwv_flow_api.id(100996175685851472)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(100990504329842706)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>180
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(100999102600851484)
,p_view_id=>wwv_flow_api.id(100996175685851472)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(100990709129842708)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101033960617080785)
,p_view_id=>wwv_flow_api.id(100996175685851472)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(101027933738080601)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101989052800696823)
,p_view_id=>wwv_flow_api.id(100996175685851472)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(101982058507693902)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110970383343517079)
,p_view_id=>wwv_flow_api.id(100996175685851472)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(110945864259362711)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>200
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115173793969058417)
,p_view_id=>wwv_flow_api.id(100996175685851472)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(113616184103132320)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115174201200058420)
,p_view_id=>wwv_flow_api.id(100996175685851472)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(113616259063132321)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117780213277182723)
,p_view_id=>wwv_flow_api.id(100996175685851472)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(117774251045182501)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119418492630700812)
,p_view_id=>wwv_flow_api.id(100996175685851472)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(119356304427894515)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119418939491700826)
,p_view_id=>wwv_flow_api.id(100996175685851472)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(119356453495894516)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>100
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(121737531558425625)
,p_view_id=>wwv_flow_api.id(100996175685851472)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(121688913900353403)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>50
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(121741165026469701)
,p_view_id=>wwv_flow_api.id(100996175685851472)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(121689170144353405)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104239145973761003)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'    Esta funcionalidad permite<br><br>',
unistr('        <b>1.</b> Seleccionar una solicitud de reversi\00F3n de acuerdos de pago para dar respuesta al contribuyente despu\00E9s de rechazarla o aplicarla seg\00FAn sea el caso.<br><br>'),
unistr('        <b>2.</b> Consultar el flujo del proceso de reversi\00F3n de acuerdo de pago.<br><br>'),
unistr('        <b>3.</b> Descargar el acto de reversi\00F3n de acuerdo de pago.<br><br>'),
unistr('        <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(371084891958407104)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(374030654607099581)
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
 p_id=>wwv_flow_api.id(101007318838937201)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(374030654607099581)
,p_button_name=>'BTN_RVRSAR_ACRDO'
,p_button_static_id=>'BTN_RVRSAR_ACRDO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Aplicar Reversi\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-window-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(35070192259341601)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(374030654607099581)
,p_button_name=>'BTN_RCHZAR_RVRSION'
,p_button_static_id=>'BTN_RCHZAR_RVRSION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Generar Acto Rechazo'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99133564076875624)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(371084891958407104)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(101381820713331301)
,p_branch_name=>unistr('Ir a P\00E1gina 161')
,p_branch_action=>'f?p=&APP_ID.:161:&SESSION.::&DEBUG.:RP,161::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'BTN_RVRSAR_ACRDO,BTN_RCHZAR_RVRSION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25305151586734605)
,p_name=>'P147_RSPSTA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(371084891958407104)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25316627566758757)
,p_name=>'P147_ID_PLNTLLA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(25304838039734602)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.dscrpcion, ',
'       a.id_plntlla',
'  from gn_d_plantillas a',
'  join gn_d_reportes b',
'    on a.id_rprte = b.id_rprte',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.id_prcso in (select id_prcso',
'                        from df_s_procesos ',
'                       where id_prcso = pkg_gn_generalidades.fnc_cl_defniciones_cliente (:F_CDGO_CLNTE, ''ACP'',''RVR''))'))
,p_lov_display_null=>'YES'
,p_grid_column=>3
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione la plantilla de acto a generar en la aplicaci\00F3n de solicitud de reversi\00F3n de acuerdo de pago.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'60%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35288240772718203)
,p_name=>'P147_CDGO_ACTO_TPO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(25304838039734602)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47154115443556516)
,p_name=>'P147_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(371084891958407104)
,p_prompt=>'Sub Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto d ',
'       ,id_impsto_sbmpsto r       ',
'  from df_i_impuestos_subimpuesto',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and id_impsto = :P147_ID_IMPSTO',
'    and actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P147_ID_IMPSTO'
,p_ajax_items_to_submit=>'P147_ID_IMPSTO,P147_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el sub tributo de acuerdos de pago revertidos o en proceso de reversi\00F3n.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47154201569556517)
,p_name=>'P147_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(371084891958407104)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tributo de acuerdos de pago revertidos o en proceso de reversi\00F3n.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99122185140844090)
,p_name=>'P147_ID_CNVNIO_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(371084891958407104)
,p_prompt=>'Tipo de Acuerdo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CONVENIO_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       ID_CNVNIO_TPO as r',
'  from gf_d_convenios_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tipo de acuerdo de pago con el que registr\00F3 la solicitud de reversi\00F3n de acuerdo de pago.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99136255151875632)
,p_name=>'P147_NMRO_CNVNIO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(371084891958407104)
,p_prompt=>unistr('N\00B0 Acuerdo')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_cMaxlength=>12
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_help_text=>unistr('Ingrese el n\00FAmero de acuerdo de pago al que se le gestion\00F3 solicitud de reversi\00F3n.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99136677854875632)
,p_name=>'P147_IDNTFCCION_SJTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(371084891958407104)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la referencia del sujeto con el que registr\00F3 la solicitud de reversi\00F3n.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99193048513026483)
,p_name=>'P147_ID_CNVNIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(100990016870842701)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118659674507384906)
,p_name=>'P147_FCHA_INCIO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(371084891958407104)
,p_prompt=>'Fecha Inicial - Registro'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>18
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00EDnima del rango, correspondiente  al registro de la solicitud de reversi\00F3n de acuerdo de pago.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118659718834384907)
,p_name=>'P147_FCHA_FNAL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(371084891958407104)
,p_prompt=>'Fecha Final - Registro'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>18
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00E1xima del rango, correspondiente  al registro de la solicitud de reversi\00F3n de acuerdo de pago.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122297406157040302)
,p_name=>'P147_CDGO_CNVNIO_RVRSION_ESTDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(371084891958407104)
,p_prompt=>unistr('Estado Reversi\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CNVNIO_RVRSION_ESTDO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select initcap(dscrpcion) as d,',
'       cdgo_cnvnio_rvrsion_estdo as r',
'  from gf_d_convenios_rvrsion_estdo',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_grid_column=>11
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el estado en que se encuentra la reversi\00F3n del acuerdo de pago.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(35289148693718212)
,p_computation_sequence=>10
,p_computation_item=>'P147_CDGO_ACTO_TPO'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.cdgo_acto_tpo',
'  from gn_d_plantillas a',
'  join gn_d_actos_tipo c on a.id_acto_tpo = c.id_acto_tpo',
' where a.id_plntlla = :P147_ID_PLNTLLA; '))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(107100264500903202)
,p_validation_name=>'Acuerdos Seleccionados'
,p_validation_sequence=>10
,p_validation=>'P147_ID_CNVNIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('\00A1Seleccione Acuerdo(s) de Pago!')
,p_validation_condition=>'BTN_RVRSAR_ACRDO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(99193048513026483)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(25304943805734603)
,p_validation_name=>'Validar Plantilla'
,p_validation_sequence=>20
,p_validation=>'P147_ID_PLNTLLA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('\00A1Seleccione la plantilla de Reversi\00F3n!')
,p_validation_condition=>'BTN_RVRSAR_ACRDO, BTN_RCHZAR_RVRSION'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(25316627566758757)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100205638794535004)
,p_name=>'Cerrar Modal'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101562530692706611)
,p_event_id=>wwv_flow_api.id(100205638794535004)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(100990016870842701)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(101051460858127301)
,p_name=>'Al cambiar acuerdo de pago'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(100990016870842701)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101051535663127302)
,p_event_id=>wwv_flow_api.id(101051460858127301)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var records = this.data.selectedRecords;',
'apex.item(''BTN_RCHZAR_RVRSION'').hide();',
'apex.item(''BTN_RVRSAR_ACRDO'').hide();   ',
'if(records.length > 0){',
'    ',
'    var model = this.data.model;',
'   ',
'    // crea un array de objetos de estados y luego trae otro sin objetos iguales',
'    var estados = records.map(function(record){',
'        return model.getValue(record, ''CDGO_CNVNIO_RVRSION_ESTDO'');',
'    }).filter( function (obj, pos, record){',
'        return (record.indexOf(obj) === pos)',
'    });',
'    ',
'    // valida que exista un solo estado seleccionado',
'    if(estados.length === 1){',
'        ',
'        records = records.filter(function (record){',
'            return (model.getValue(record, ''CDGO_CNVNIO_RVRSION_ESTDO'') == ''RGS'' || (model.getValue(record, ''CDGO_CNVNIO_RVRSION_ESTDO'') == ''RCH'' && !model.getValue(record, ''ID_ACTO'')))',
'        });',
'',
'        var json = records.map(function (record){',
'            return {''ID_CNVNIO'': model.getValue(record, ''ID_CNVNIO'')};',
'        });',
'        ',
'        var registrados = records.filter(function (record){',
'            return (model.getValue(record, ''CDGO_CNVNIO_RVRSION_ESTDO'') == ''RGS'');',
'        });',
'        ',
'        var rechazados = records.filter(function (record){',
'            return (model.getValue(record, ''CDGO_CNVNIO_RVRSION_ESTDO'') == ''RCH'');',
'        });',
'    ',
'        if(json.length > 0){   ',
'            $s(''P147_ID_CNVNIO'', JSON.stringify(json));',
'            if (rechazados.length > 0) {',
'                apex.item(''BTN_RCHZAR_RVRSION'').show();',
'            }',
'            if (registrados.length > 0) {            ',
'                apex.item(''BTN_RVRSAR_ACRDO'').show();',
'            }',
'        }',
'    }',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(25305099002734604)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Aplicar Reversi\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  declare',
'      v_cdgo_rspsta     number;',
'  begin',
'      if (:P147_CDGO_ACTO_TPO = ''RRA'') then',
unistr('          raise_application_error(-20001, ''\00A1Seleccione la plantilla correcta para aplicar la reversi\00F3n!'');'),
'      else',
'          pkg_gf_convenios.prc_ap_rvrsion_acrdo_pgo_msvo(p_cdgo_clnte              =>   :F_CDGO_CLNTE,',
'                                                        p_cdna_cnvnio            =>    :P147_ID_CNVNIO,',
'                                                        p_id_usrio               =>    :F_ID_USRIO,',
'                                                        p_id_plntlla             =>    :P147_ID_PLNTLLA,',
'                                                        o_cdgo_rspsta            =>    v_cdgo_rspsta,',
'                                                        o_mnsje_rspsta           =>    :P147_RSPSTA);',
'      end if;',
'        ',
'  end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(101007318838937201)
,p_process_success_message=>'&P147_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(35070303210341603)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Rechazar Reversi\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;    ',
'begin',
'    if (:P147_CDGO_ACTO_TPO = ''RAC'') then',
unistr('        raise_application_error(-20001, ''\00A1Seleccione la plantilla correcta para rechazar la reversi\00F3n!'');'),
'    else',
'        pkg_gf_convenios.prc_re_rvrsion_acrdo_pgo_msvo(p_cdgo_clnte       =>    :F_CDGO_CLNTE,',
'                                                   p_id_cnvnio            =>    :P147_ID_CNVNIO,',
'                                                   p_mtvo_rchzo_rvrsion   =>    ''Acuerdo Absolutamente Pago'',',
'                                                   p_id_usrio             =>    :F_ID_USRIO,',
'                                                   p_id_plntlla		      =>    :P147_ID_PLNTLLA,',
'                                                   o_cdgo_rspsta		  =>    v_cdgo_rspsta,',
'                                                   o_mnsje_rspsta 		  =>    :P147_RSPSTA);',
'                                                   ',
'        if (v_cdgo_rspsta <> 0) then',
'            raise_application_error(-20001, :P147_RSPSTA);',
'        end if;',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(35070192259341601)
,p_process_success_message=>'&P147_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(121689085707353404)
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
'    exception ',
'        when no_data_found then',
'              ',
'          begin                   ',
'              select distinct first_value(id_fljo_trea_orgen) over(order by id_instncia_trnscion desc) ',
'                into v_id_fljo_trea',
'                from wf_g_instancias_transicion ',
'               where id_instncia_fljo = v_id_instncia_fljo;',
'',
'          exception when no_data_found  then',
'                    v_id_fljo_trea := null;',
'          end;',
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
