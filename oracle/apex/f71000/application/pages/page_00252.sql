prompt --application/pages/page_00252
begin
wwv_flow_api.create_page(
 p_id=>252
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Consulta de Solicitudes de T\00EDtulos Judiciales')
,p_step_title=>unistr('Consulta de Solicitudes de T\00EDtulos Judiciales')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(177374633629050691)
,p_last_updated_by=>'ACARABALLO'
,p_last_upd_yyyymmddhh24miss=>'20231104092255'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9786757695771643)
,p_plug_name=>unistr('Consulta de Solicitudes de T\00EDtulos Judiciales')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_slctud,',
'        a.id_instncia_fljo_gnrdo,',
'        a.nmbre_impsto,',
'        a.id_sjto_impsto,',
'        a.idntfccion,',
'        case ',
'            when length(a.idntfccion) = 15 then ',
'                pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => a.idntfccion, p_frmto => ''xx-xx-xxxx-xxxx-xxx'' , p_crcter_dlmtdor => ''-'' ) ',
'            when length(a.idntfccion) = 25 then',
'                pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => a.idntfccion, p_frmto => ''xx-xx-xx-xx-xxxx-xxxx-x-xx-xx-xxxx'' , p_crcter_dlmtdor => ''-'' )',
'        end as idntfccion_sjto_frmtda,',
'        a.nmro_rdcdo_dsplay,',
'        a.fcha_rdcdo,',
'        b.dscrpcion',
'  from v_pq_g_solicitudes           a',
'  join pq_d_motivos                 b on a.id_mtvo = b.id_mtvo',
'  join v_wf_g_instancias_flujo      c on a.id_instncia_fljo_gnrdo = c.id_instncia_fljo',
'  join wf_g_instancias_transicion   d on c.id_instncia_fljo = d.id_instncia_fljo ',
'  join v_pq_g_solicitantes          e on e.id_slctud = a.id_slctud',
' where b.id_prcso = 34',
'   and d.id_estdo_trnscion in (1,2)',
'   and c.id_usrio = :F_ID_USRIO 	',
'   and (a.id_impsto = :P252_ID_IMPSTO or :P252_ID_IMPSTO is null)',
'   and (e.idntfccion = :P252_ID_SLCTNTE or :P252_ID_SLCTNTE is null )',
'   and (a.idntfccion = :P252_IDNTFCCION_SJTO or :P252_IDNTFCCION_SJTO is null)',
'   and (a.id_slctud = :P252_ID_SLCTUD or :P252_ID_SLCTUD is null)',
'   -- and (a.idntfccion_sjto_frmtda = :P252_IDNTFCCION_SJTO or :P252_IDNTFCCION_SJTO is null)',
'   and (a.nmro_rdcdo_dsplay = :P252_NMRO_RDCDO_DSPLAY or :P252_NMRO_RDCDO_DSPLAY is null)',
'   and (a.fcha_rdcdo = :P252_FCHA_RDCDO or :P252_FCHA_RDCDO is null)',
'   and (b.id_mtvo = :P252_ID_MTVO or :P252_ID_MTVO is null)',
'',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9788554941771679)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9789189017771680)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(9789781950771680)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(9790328658771681)
,p_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO_FRMTDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n')
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9790985469771681)
,p_name=>'NMRO_RDCDO_DSPLAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RDCDO_DSPLAY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00B0 Radicado')
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9791545101771681)
,p_name=>'FCHA_RDCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RDCDO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Radicado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_api.id(9792165435771681)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Motivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>400
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
 p_id=>wwv_flow_api.id(9792677010784001)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Id Solicitud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9793500908784010)
,p_name=>'Ver Solicitud'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver Solicitud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_01=>'<span class="fa fa-eye">&EMPLOYEE_STATUS.</span>'
,p_link_target=>'f?p=&APP_ID.:239:&SESSION.::&DEBUG.:RP,239:P239_ID_INSTNCIA_FLJO,P239_BRANCH:&ID_INSTNCIA_FLJO_GNRDO.,&APP_PAGE_ID.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9811798094955701)
,p_name=>'ID_INSTNCIA_FLJO_GNRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO_GNRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(9787284870771645)
,p_internal_uid=>9787284870771645
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
 p_id=>wwv_flow_api.id(9787634071771647)
,p_interactive_grid_id=>wwv_flow_api.id(9787284870771645)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(9787779210771647)
,p_report_id=>wwv_flow_api.id(9787634071771647)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9788929454771680)
,p_view_id=>wwv_flow_api.id(9787779210771647)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(9788554941771679)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9789538021771680)
,p_view_id=>wwv_flow_api.id(9787779210771647)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(9789189017771680)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9790197976771680)
,p_view_id=>wwv_flow_api.id(9787779210771647)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(9789781950771680)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9790773956771681)
,p_view_id=>wwv_flow_api.id(9787779210771647)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(9790328658771681)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9791322122771681)
,p_view_id=>wwv_flow_api.id(9787779210771647)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(9790985469771681)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9791915620771681)
,p_view_id=>wwv_flow_api.id(9787779210771647)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(9791545101771681)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9792543130771682)
,p_view_id=>wwv_flow_api.id(9787779210771647)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(9792165435771681)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9798622666791981)
,p_view_id=>wwv_flow_api.id(9787779210771647)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(9792677010784001)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9807025384927503)
,p_view_id=>wwv_flow_api.id(9787779210771647)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(9793500908784010)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9818024377956800)
,p_view_id=>wwv_flow_api.id(9787779210771647)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(9811798094955701)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9792783849784002)
,p_plug_name=>unistr('Par\00E1metros de Busqueda')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9793447485784009)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(9792783849784002)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column=>11
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9792844869784003)
,p_name=>'P252_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9792783849784002)
,p_prompt=>'<b>Tributo</b>'
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
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9792901493784004)
,p_name=>'P252_IDNTFCCION_SJTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(9792783849784002)
,p_prompt=>'<b>Id. Sujeto Impuesto</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9793027828784005)
,p_name=>'P252_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(9792783849784002)
,p_prompt=>unistr('<b>N\00B0 Radicado</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9793106661784006)
,p_name=>'P252_FCHA_RDCDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(9792783849784002)
,p_prompt=>'<b>Fecha Radicado</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9793282064784007)
,p_name=>'P252_ID_MTVO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(9792783849784002)
,p_prompt=>'<b>Motivo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select dscrpcion, ',
'        id_mtvo ',
'   from pq_d_motivos ',
'  where id_prcso = 34;'))
,p_lov_display_null=>'YES'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(152835495969172808)
,p_name=>'P252_ID_SLCTNTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(9792783849784002)
,p_prompt=>'<b>Id Solicitante</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(152835573101172809)
,p_name=>'P252_ID_SLCTUD'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(9792783849784002)
,p_prompt=>'<b>Id Solicitud</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
