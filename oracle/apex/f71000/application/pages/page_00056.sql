prompt --application/pages/page_00056
begin
wwv_flow_api.create_page(
 p_id=>56
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Informe de Lotes de Facturaci\00F3n Masiva')
,p_step_title=>unistr('Informe de Lotes de Facturaci\00F3n Masiva')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20250801162230'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(185325474993930973)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(185423201089747894)
,p_plug_name=>unistr('Informe de Lotes de Facturaci\00F3n Masiva')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select a.id_dcmnto_lte,',
'       a.nmbre_impsto,',
'       a.nmbre_impsto_sbmpsto,',
'       a.obsrvcion,',
'       a.nmro_dcmnto_gnrdos AS Documentos_procesados,',
'       a.fcha',
'  from v_re_g_documentos_lote a',
' where a.cdgo_clnte         = :F_CDGO_CLNTE',
'   and a.id_usrio           = :F_ID_USRIO',
'   and cdgo_dcmnto_lte_tpo  = ''MSV''*/',
'   ',
'   select DISTINCT (a.id_dcmnto_lte),',
'       a.nmbre_impsto,',
'       a.nmbre_impsto_sbmpsto,',
'       a.obsrvcion,',
'       a.nmro_dcmnto_gnrdos as Documentos_Procesados,',
'       a.fcha,',
'       nvl(b.indcdor_prcsado,''N'')as Generados',
'  from v_re_g_documentos_lote a ',
'  left join re_g_documentos_lote_job b on a.id_dcmnto_lte = b.id_dcmnto_lte',
' where a.cdgo_clnte         = :F_CDGO_CLNTE',
'   and a.id_usrio           = :F_ID_USRIO',
'   and a.cdgo_dcmnto_lte_tpo  = ''MSV'';',
'  '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(13499498537667925)
,p_name=>'DOCUMENTOS_PROCESADOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOCUMENTOS_PROCESADOS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Documentos</br>Procesados'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_03=>'center'
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
 p_id=>wwv_flow_api.id(13499571717667926)
,p_name=>'GENERADOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GENERADOS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Generados'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>1
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
 p_id=>wwv_flow_api.id(185326152143930980)
,p_name=>'ID_DCMNTO_LTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCMNTO_LTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No. Lote'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(185326302085930981)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(185326401562930982)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub-Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(185326440285930983)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(185326686151930985)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha<br> Generaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY HH:MIPM'
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
 p_id=>wwv_flow_api.id(185327021346930988)
,p_name=>'Imprimir'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>unistr('Acci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:green" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton "  title="Imprimir Documentos del Lote">Imprimir/Generar',
'<span class="fa-10x fa fa-print "></span>    ',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:59:&SESSION.::&DEBUG.:RP:P59_ID_DCMNTO_LTE:&ID_DCMNTO_LTE.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(185327091676930989)
,p_name=>'Ver Lote'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton "  title="Ver Detalle Lote" onclick="$(''#Con'').dialog(''open'');">Ver',
'<span class="fa fa-eye"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:57:&SESSION.::&DEBUG.:RP,57:P57_ID_DCMNTO_LTE:&ID_DCMNTO_LTE.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(185326103406930979)
,p_internal_uid=>183147663996332520
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
 p_id=>wwv_flow_api.id(185459416098983043)
,p_interactive_grid_id=>wwv_flow_api.id(185326103406930979)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(185459446676983048)
,p_report_id=>wwv_flow_api.id(185459416098983043)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15227235706251546)
,p_view_id=>wwv_flow_api.id(185459446676983048)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(13499498537667925)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>937.6300000000001
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15227830177251550)
,p_view_id=>wwv_flow_api.id(185459446676983048)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(13499571717667926)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>85.5
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185460015810983065)
,p_view_id=>wwv_flow_api.id(185459446676983048)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(185326152143930980)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185460523211983074)
,p_view_id=>wwv_flow_api.id(185459446676983048)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(185326302085930981)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185461034191983076)
,p_view_id=>wwv_flow_api.id(185459446676983048)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(185326401562930982)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>153
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185461532987983078)
,p_view_id=>wwv_flow_api.id(185459446676983048)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(185326440285930983)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>141
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185462445172983081)
,p_view_id=>wwv_flow_api.id(185459446676983048)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(185326686151930985)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185464012937983086)
,p_view_id=>wwv_flow_api.id(185459446676983048)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(185327021346930988)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>69
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(185485019740135375)
,p_view_id=>wwv_flow_api.id(185459446676983048)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(185327091676930989)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>65
);
wwv_flow_api.create_ig_report_filter(
 p_id=>wwv_flow_api.id(2178681867604897)
,p_report_id=>wwv_flow_api.id(185459416098983043)
,p_type=>'COLUMN'
,p_column_id=>wwv_flow_api.id(185326686151930985)
,p_operator=>'LAST'
,p_is_case_sensitive=>false
,p_expression=>'12~H'
,p_is_enabled=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(186114803605261075)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
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
'<i>Funcionalidad que permite: </i><br><br>',
'',
unistr('<b><i>1.</b> Visualizar la informaci\00F3n de creaci\00F3n del lote de facturaci\00F3n masiva por ventanilla.</i> <br><br>'),
unistr('<b><i>2.</b> Informaci\00F3n de los documentos que pertenece a cada lote. </i><br><br>'),
unistr('<b><i>3.</b> Crear un nuevo lote de facturaci\00F3n masiva por ventanilla. </i><br><br>'),
unistr('<i>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(185325563292930974)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(185325474993930973)
,p_button_name=>'BTN_NUEVO_LOTE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Lote'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:55:&SESSION.:BORRAR_COLECCION:&DEBUG.:RP,55::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(187883554031471191)
,p_branch_name=>unistr('Ir a la P\00E1gina 55')
,p_branch_action=>'f?p=&APP_ID.:55:&SESSION.:BORRAR_COLECCION:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(185325563292930974)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35239225362664802)
,p_name=>'P56_ID_DCMNTO_LTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(185423201089747894)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
