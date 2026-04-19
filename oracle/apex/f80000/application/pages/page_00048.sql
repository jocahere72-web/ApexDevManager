prompt --application/pages/page_00048
begin
wwv_flow_api.create_page(
 p_id=>48
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Lotes de Impresi\00F3n de Actos')
,p_step_title=>'Lotes de Impresion'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function recorrer_grid() { ',
'    ',
'   var region = apex.region("actos");',
'    if (region) {',
'        ',
'       var view = apex.region("actos").widget().interactiveGrid("getViews", "grid");',
'       var model = view.model;  ',
'       var records = view.view$.grid("getSelectedRecords");',
'   ',
'       var json = records.map(function(record){',
'           return { "id_prcso_jrdco_lte_dtlle" : model.getValue(record , "ID_PRCSO_JRDCO_LTE_DTLLE").trim()                    ',
'                  };',
'       });',
'       $(''#P48_JSON_ACTOS'').val(json.length > 0 ? JSON.stringify(json) : '''');',
'       if (json.length > 0 ) {',
'          ',
'          //apex.item( "BTN_ELIMINAR_LOTE" ).show();',
'          apex.item( "BTN_ELIMINAR_ACTO" ).show();',
'       }else{',
'           ',
'         //apex.item( "BTN_ELIMINAR_LOTE" ).hide();',
'         apex.item( "BTN_ELIMINAR_ACTO" ).hide();',
'       } ',
'       return;',
'   }   ',
'   ',
'    //apex.item( "BTN_ELIMINAR_LOTE" ).hide();',
'    apex.item( "BTN_ELIMINAR_ACTO" ).hide();',
'}',
' '))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(17445683081942948)
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20200507123505'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(88664697337226020)
,p_plug_name=>'Lote'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(88665139521226025)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_api.id(90702621347456117)
,p_plug_name=>'actos'
,p_region_name=>'actos'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_prcsos_jrdco,',
'       a.id_prcsos_jrdco_dcmnto,',
'       a.nmro_prcso_jrdco,',
'       to_char(a.fcha,''dd/mm/yyyy'') as Fcha_Prcso_jrdco,',
'       a.idntfccion,',
'       a.nombre_etpa,',
'       a.nmro_acto,',
'       to_char(a.fcha_acto,''dd/mm/yyyy'') as fcha_acto,',
'       b.id_prcso_jrdco_lte_dtlle',
'from v_cb_g_procesos_jrdco_dcmnto a',
'join cb_g_procesos_jrdco_lte_dtlle b ',
'  on b.id_prcsdo = a.id_prcsos_jrdco_dcmnto',
'where b.id_prcso_jrdco_lte = :P48_ID_PRCSO_JRDCO_LTE'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(90704433134456141)
,p_name=>'ID_PRCSOS_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_JRDCO'
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
 p_id=>wwv_flow_api.id(90705021704456142)
,p_name=>'ID_PRCSOS_JRDCO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_JRDCO_DCMNTO'
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
 p_id=>wwv_flow_api.id(90705654233456142)
,p_name=>'NMRO_PRCSO_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_PRCSO_JRDCO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Proceso Jur\00EDdico')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(90706277069456142)
,p_name=>'FCHA_PRCSO_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_PRCSO_JRDCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Fecha Proceso Jur\00EDdico')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(90706843588456143)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(90707434649456143)
,p_name=>'NOMBRE_ETPA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOMBRE_ETPA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(90708079625456143)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero de Acto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(90708612872456143)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(90866707712267301)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(90866824172267302)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(91486221841759413)
,p_name=>'ID_PRCSO_JRDCO_LTE_DTLLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSO_JRDCO_LTE_DTLLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(90703162616456119)
,p_internal_uid=>90703162616456119
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
 p_id=>wwv_flow_api.id(90703578642456120)
,p_interactive_grid_id=>wwv_flow_api.id(90703162616456119)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(90703615211456121)
,p_report_id=>wwv_flow_api.id(90703578642456120)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(90704815798456142)
,p_view_id=>wwv_flow_api.id(90703615211456121)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(90704433134456141)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(90705490233456142)
,p_view_id=>wwv_flow_api.id(90703615211456121)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(90705021704456142)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(90706066021456142)
,p_view_id=>wwv_flow_api.id(90703615211456121)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(90705654233456142)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(90706602518456142)
,p_view_id=>wwv_flow_api.id(90703615211456121)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(90706277069456142)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>149
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(90707284737456143)
,p_view_id=>wwv_flow_api.id(90703615211456121)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(90706843588456143)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>172
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(90707865829456143)
,p_view_id=>wwv_flow_api.id(90703615211456121)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(90707434649456143)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>251
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(90708468665456143)
,p_view_id=>wwv_flow_api.id(90703615211456121)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(90708079625456143)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>153
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(90709040334456144)
,p_view_id=>wwv_flow_api.id(90703615211456121)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(90708612872456143)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>143
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(90872707154268649)
,p_view_id=>wwv_flow_api.id(90703615211456121)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(90866707712267301)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91542532613621734)
,p_view_id=>wwv_flow_api.id(90703615211456121)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(91486221841759413)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(91487723808759428)
,p_plug_name=>'Ayuda'
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
unistr('<b><i></i></b>Esta funcionalidad permite generar lotes de impresi\00F3n de un mismo tipo de acto con la finalidad de agrupar los actos que se van a descargar o imprimir posteriormente, contando con las siguientes opciones:<br><br>'),
'',
unistr('<b><i>1.</i></b>Crear un nuevo lote de impresi\00F3n a partir de una selecci\00F3n de actos nueva.<br><br>'),
'',
'<b><i>2.</i></b>Adicionar actos a un lote existente de manera puntual escogiendo un solo acto o masiva al escoger varios actos.<br><br>',
'',
unistr('<b><i>3.</i></b>Eliminar un lote completo de impresi\00F3n.<br><br>'),
unistr('<b><i>4.</i></b>Eliminar uno o varios actos de un lote de impresi\00F3n.<br><br>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(88665287579226026)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(88665139521226025)
,p_button_name=>'BTN_NUEVO_LOTE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Lote'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:RP,50::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(88665327270226027)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(88665139521226025)
,p_button_name=>'BTN_INCLUIR_ACTOS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Incluir Actos al lote'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:RP,50:P50_ID_PRCSO_JRDCO_LTE,P50_ID_TPO_ACTO:&P48_ID_PRCSO_JRDCO_LTE.,&P48_ID_ACTO_TPO.'
,p_button_condition=>'P48_ID_PRCSO_JRDCO_LTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-file-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(90867174396267305)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(88665139521226025)
,p_button_name=>'BTN_ELIMINAR_LOTE'
,p_button_static_id=>'BTN_ELIMINAR_LOTE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar Lote'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P48_ID_PRCSO_JRDCO_LTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(90867042354267304)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(88665139521226025)
,p_button_name=>'BTN_ELIMINAR_ACTO'
,p_button_static_id=>'BTN_ELIMINAR_ACTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar Acto <br> del lote'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(88665594350226029)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(88664697337226020)
,p_button_name=>'BTN_ACTLZAR_OBSVCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>unistr('Actualizar Observaci\00F3n')
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP,49:P49_ID_PRCSO_JRDCO_LTE:&P48_ID_PRCSO_JRDCO_LTE.'
,p_button_condition=>'P48_ID_PRCSO_JRDCO_LTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-clipboard-edit'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(88665035714226024)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(88664697337226020)
,p_button_name=>'BTN_CONSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BOTTOM'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88664733207226021)
,p_name=>'P48_ID_PRCSO_JRDCO_LTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(88664697337226020)
,p_prompt=>unistr('Lote de Selecci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''*Lote: ''||a.cnsctvo_lte||'' *Fecha: ''||to_char(a.fcha_lte,''dd/mm/yyyy'')||'' *Funcionario: ''||b.nmbre_trcro  as dscrpcion_Lte, ',
'        a.id_prcso_jrdco_lte',
'   from cb_g_procesos_juridico_lote a, v_sg_g_usuarios b',
'   where a.id_fncnrio = b.id_fncnrio',
'   and a.cdgo_clnte = :F_CDGO_CLNTE ',
'   and a.tpo_lte = ''LIM''',
'order by a.id_prcso_jrdco_lte desc'))
,p_lov_display_null=>'YES'
,p_colspan=>9
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el lote para impresi\00F3n de actos')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88664800054226022)
,p_name=>'P48_OBSRVCIONES'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(88664697337226020)
,p_prompt=>unistr('Observaci\00F3n de Lote')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_display_when=>'P48_ID_PRCSO_JRDCO_LTE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Muestra las observaciones realizadas al lote seleccionado.'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91059429940895624)
,p_name=>'P48_TIPO_ACTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(88664697337226020)
,p_prompt=>'Tipo de Acto'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_begin_on_new_line=>'N'
,p_display_when=>'P48_ID_PRCSO_JRDCO_LTE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Muestra el tipo de acto correspondiente al lote seleccionado.'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91059637981895626)
,p_name=>'P48_ID_ACTO_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(88664697337226020)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91486118300759412)
,p_name=>'P48_JSON_ACTOS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(88664697337226020)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(88664989882226023)
,p_computation_sequence=>10
,p_computation_item=>'P48_OBSRVCIONES'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select obsrvcion_lte',
'from cb_g_procesos_juridico_lote',
'where id_prcso_jrdco_lte = :P48_ID_PRCSO_JRDCO_LTE'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(91059764017895627)
,p_computation_sequence=>20
,p_computation_item=>'P48_TIPO_ACTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion',
'from gn_d_actos_tipo a',
'where exists (select 1',
'                from cb_g_procesos_juridico_lote c',
'               where c.id_acto_tpo = a.id_acto_tpo',
'                 and c.id_prcso_jrdco_lte = :P48_ID_PRCSO_JRDCO_LTE)',
'and exists (select 1',
'              from v_cb_g_procesos_jrdco_dcmnto b',
'              where b.id_acto_tpo = a.id_acto_tpo);'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(91059868579895628)
,p_computation_sequence=>30
,p_computation_item=>'P48_ID_ACTO_TPO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_acto_tpo',
'from gn_d_actos_tipo a',
'where exists (select 1',
'                from cb_g_procesos_juridico_lote c',
'               where c.id_acto_tpo = a.id_acto_tpo',
'                 and c.id_prcso_jrdco_lte = :P48_ID_PRCSO_JRDCO_LTE)',
'and exists (select 1',
'              from v_cb_g_procesos_jrdco_dcmnto b',
'              where b.id_acto_tpo = a.id_acto_tpo);'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91486537865759416)
,p_name=>'Al cargar la pagina'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91486655454759417)
,p_event_id=>wwv_flow_api.id(91486537865759416)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).ready(function() {  ',
'    var region = apex.region("actos");',
'    if (region) {',
'        apex.region("actos").widget().interactiveGrid("setSelectedRecords", []);',
'    }',
'    recorrer_grid();      ',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91486755854759418)
,p_name=>'Al hacer clic en los actos del lote'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(90702621347456117)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91486883282759419)
,p_event_id=>wwv_flow_api.id(91486755854759418)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'recorrer_grid();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91486967011759420)
,p_event_id=>wwv_flow_api.id(91486755854759418)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    apex_util.set_session_state(''P48_JSON_ACTOS'', :P48_JSON_ACTOS);',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91487049534759421)
,p_name=>'Antes de enviar pagina'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforepagesubmit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91487192059759422)
,p_event_id=>wwv_flow_api.id(91487049534759421)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'recorrer_grid();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(90866909205267303)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(90702621347456117)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('documentos: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(91486360271759414)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar lote'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
'',
'    pkg_cb_proceso_juridico.prc_el_lote_impresion_pj (p_cdgo_clnte            => :F_CDGO_CLNTE,   ',
'                                                      p_id_prcso_jrdco_lte    => :P48_ID_PRCSO_JRDCO_LTE,                                        ',
'                                                      p_json_actos            => :P48_JSON_ACTOS,',
'                                                      p_tipo_accion           => ''L'');    ',
'',
'    :P48_ID_PRCSO_JRDCO_LTE := NULL;',
'',
'END;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(90867174396267305)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(91486431235759415)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Acto de Lote'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
'',
'    pkg_cb_proceso_juridico.prc_el_lote_impresion_pj (p_cdgo_clnte            => :F_CDGO_CLNTE,   ',
'                                                      p_id_prcso_jrdco_lte    => :P48_ID_PRCSO_JRDCO_LTE,                                        ',
'                                                      p_json_actos            => :P48_JSON_ACTOS,',
'                                                      p_tipo_accion           => ''C'');',
'',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(90867042354267304)
);
end;
/
