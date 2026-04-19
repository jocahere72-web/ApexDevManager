prompt --application/pages/page_20240_004
begin
wwv_flow_api.create_page(
 p_id=>2024008
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Informe de Ajustes Masivos'
,p_step_title=>'Informe de Ajustes Masivos'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20241025082640'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(185336146385020342)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
 p_id=>wwv_flow_api.id(185336328533020344)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'',
'<i>',
'    Funcionalidad que permite: <br><br>',
unistr('    <b>1.</b> Visualizar la informaci\00F3n de archivos de Ajustes masivos. <br><br>'),
unistr('    <b>2.</b> Descargar resoluci\00F3n asociada a cada archivo. <br><br>'),
'    <b>3.</b> Crear un nuevo lote de Ajustes.',
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(194629958386186786)
,p_plug_name=>'Informe de Ajustes Masivos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_ajs_crg_lte,',
'        a.nmbre_impsto,',
'        a.nmbre_impsto_sbmpsto,',
'        a.fcha_incio_prcso,',
'        a.fcha_fin_prcso,',
'        regexp_substr((a.drcion), ''[[0-9]{2}:[[0-9]{2}:[[0-9]{2}'', 1 ,  1 ) drcion,',
'        a.nmro_rgstros,',
'        a.nmro_sjtos_vldos,',
'        a.nmro_ajstes_gnrar,',
'        a.nmro_ajstes_gnrdos',
'from    v_gf_g_ajustes_cargue_lote a      ',
'where   a.id_usrio       = :F_ID_USRIO',
'--and a.cdgo_lte_estdo = ''TRM'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(6174210760821705)
,p_name=>'ID_AJS_CRG_LTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_AJS_CRG_LTE'
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
 p_id=>wwv_flow_api.id(6174321866821706)
,p_name=>'FCHA_INCIO_PRCSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_INCIO_PRCSO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Inicio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(6174434066821707)
,p_name=>'FCHA_FIN_PRCSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_FIN_PRCSO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Fin'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(6174559501821708)
,p_name=>'NMRO_RGSTROS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RGSTROS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No. <br>Registros'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(6174636670821709)
,p_name=>'NMRO_SJTOS_VLDOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_SJTOS_VLDOS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Sujetos <br> V\00E1lidos')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(6174707596821710)
,p_name=>'NMRO_AJSTES_GNRAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_AJSTES_GNRAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Ajustes a <br> Generar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(6174835426821711)
,p_name=>'NMRO_AJSTES_GNRDOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_AJSTES_GNRDOS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Ajustes <br> Generados'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(58627020867628899)
,p_name=>'DRCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Duraci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>27
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
 p_id=>wwv_flow_api.id(185336383618020345)
,p_name=>unistr('Resoluci\00F3n')
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>unistr('Resoluci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton "  title="Descargar Resoluci\00F3n" >'),
'<span class="fa fa-cloud-download fa-1x fa-spin"></span>',
'</button>',
''))
,p_link_target=>'f?p=&APP_ID.:2024008:&SESSION.:DESCARGAR_RESOLUCION:&DEBUG.:RP:P2024008_ID_AJS_CRG_LTE:&ID_AJS_CRG_LTE.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(185336521620020346)
,p_name=>'Ver Lote'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton "  title="Ver Detalle Lote" onclick="$(''#Con'').dialog(''open'');">Ver',
'<span class="fa fa-eye"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:2024010:&SESSION.::&DEBUG.:RP,2024010:P2024010_ID_AJS_CRG_LTE:&ID_AJS_CRG_LTE.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(194632309223186801)
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(194632917251186807)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub-Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(194630444432186792)
,p_internal_uid=>194630444432186792
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
 p_id=>wwv_flow_api.id(194630851809186794)
,p_interactive_grid_id=>wwv_flow_api.id(194630444432186792)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(194630952819186795)
,p_report_id=>wwv_flow_api.id(194630851809186794)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6113979278668819)
,p_view_id=>wwv_flow_api.id(194630952819186795)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(58627020867628899)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6201259769317623)
,p_view_id=>wwv_flow_api.id(194630952819186795)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(6174210760821705)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6201737153317626)
,p_view_id=>wwv_flow_api.id(194630952819186795)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(6174321866821706)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6202216602317628)
,p_view_id=>wwv_flow_api.id(194630952819186795)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(6174434066821707)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6202784208317630)
,p_view_id=>wwv_flow_api.id(194630952819186795)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(6174559501821708)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6203244243317631)
,p_view_id=>wwv_flow_api.id(194630952819186795)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(6174636670821709)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6203745970317633)
,p_view_id=>wwv_flow_api.id(194630952819186795)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(6174707596821710)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6204268933317634)
,p_view_id=>wwv_flow_api.id(194630952819186795)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(6174835426821711)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(194632674410186807)
,p_view_id=>wwv_flow_api.id(194630952819186795)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(194632309223186801)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(194633316621186807)
,p_view_id=>wwv_flow_api.id(194630952819186795)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(194632917251186807)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(194643006403231853)
,p_view_id=>wwv_flow_api.id(194630952819186795)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(185336383618020345)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(194643446392240029)
,p_view_id=>wwv_flow_api.id(194630952819186795)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(185336521620020346)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6112335038475373)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(185336146385020342)
,p_button_name=>'BTN_NUEVO_LOTE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Lote'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:2024009:&SESSION.::&DEBUG.:RP,2024009::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6176781910821730)
,p_name=>'P2024008_ID_AJS_CRG_LTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(194629958386186786)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6118396296475396)
,p_name=>'Eliminar_Collecction_RANGO_IMPRESION'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(194629958386186786)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6118888303475398)
,p_event_id=>wwv_flow_api.id(6118396296475396)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if  apex_collection.collection_exists(''RANGO_IMPRESION'') then',
'       APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => ''RANGO_IMPRESION'');',
'    ',
'    end if;    ',
'end;    '))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6176649592821729)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar Resolucion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Consulta',
'declare',
'    v_file_name varchar2(2000);',
'    v_file_blob       blob;',
'    file_blob         blob;',
'    v_file_mimetype   varchar2(1000);',
'    v_tipo_operacion  varchar2(20);',
'    v_id_dcmnto       number;',
'    o_cdgo_rspsta     number;',
'    o_mnsje_rspsta    varchar2(4000);',
'begin ',
'',
'    select file_blob,    ',
'           file_mimetype,     ',
'           file_name',
'    into   v_file_blob,    ',
'           v_file_mimetype,   ',
'           v_file_name',
'    from   gf_g_ajustes_cargue_lote',
'    where  id_ajs_crg_lte  =  :P2024008_ID_AJS_CRG_LTE;',
'',
'    ',
'     htp.init;',
'        owa_util.mime_header(v_file_mimetype, FALSE );',
'        htp.p(''Content-length: '' ||dbms_lob.getlength(v_file_blob));',
'        htp.p(''Content-Disposition: attachment; filename="'' ||v_file_name || ''"'' );',
'        htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'        owa_util.http_header_close;',
'        wpg_docload.download_file(v_file_blob);',
'        apex_application.stop_apex_engine;',
' ',
'    ',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DESCARGAR_RESOLUCION'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
