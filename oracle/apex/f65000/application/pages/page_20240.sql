prompt --application/pages/page_20240
begin
wwv_flow_api.create_page(
 p_id=>2024001
,p_user_interface_id=>wwv_flow_api.id(30413944355578333)
,p_name=>unistr('Impresi\00F3n De Certificados De Publicaci\00F3n')
,p_step_title=>unistr('Impresi\00F3n De Certificados De Publicaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#descargarTodos").hide();',
'$("#BTN_DSCRGAR_PNTAL").hide();',
'apex.region(''actos'').refresh();'))
,p_step_template=>wwv_flow_api.id(30309424961578275)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20241006210632'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3574906310323719)
,p_plug_name=>unistr('Par\00E1metros De B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30328831919578284)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3575668777323726)
,p_plug_name=>'Actos'
,p_region_name=>'actos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30338884622578288)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_acto,',
'       nmro_acto,',
'       fcha_acto,',
'       tpo_acto,',
'       indcdor_ntfcdo,',
'       fcha_ntfccion,',
'       fcha_pblccion',
'  from (select a.id_acto,',
'       a.nmro_acto,',
'       trunc(a.fcha) as fcha_acto,',
'       Initcap(a.dscrpcion_acto_tpo) as tpo_acto,',
'       case when a.indcdor_ntfcdo = ''S'' and a.fcha_pblccion is null then',
unistr('                ''Notificado sin publicaci\00F3n'''),
'           when a.indcdor_ntfcdo = ''S'' and a.fcha_pblccion is not null then',
'                ''Notificado y publicado''',
'           when a.indcdor_ntfcdo = ''N'' and a.fcha_pblccion is null then',
'                ''Pendiente por Notificar y Publicar''',
'           when a.indcdor_ntfcdo = ''N'' and a.fcha_pblccion is not null then',
unistr('                ''Publicado sin Notificaci\00F3n'''),
'        end as indcdor_ntfcdo,      ',
'       trunc(a.fcha_ntfccion) as fcha_ntfccion,',
'       trunc(a.fcha_pblccion) as fcha_pblccion',
'  from v_gn_g_actos a',
' where a.ntfcdo_pag_web = :P2024001_INDCDOR_NTFCDO_WEB--a.indcdor_ntfcdo = :P2024001_INDCDOR_NTFCDO    ',
'   and a.id_acto_tpo = nvl(:P2024001_ID_ACTO_TPO, a.id_acto_tpo) ',
'   and a.nmro_acto = nvl(:P2024001_NMRO_ACTO, a.nmro_acto)',
'   and (to_char(a.fcha, ''YYYYMMDD'') >=',
'       to_char(to_date(:P2024001_FCHA_INCIAL, ''DD/MM/YYYY''), ''YYYYMMDD'') OR',
'       :P2024001_FCHA_INCIAL IS NULL)',
'   and (to_char(a.fcha, ''YYYYMMDD'') <=',
'       to_char(to_date(:P2024001_FCHA_FNAL, ''DD/MM/YYYY''), ''YYYYMMDD'') OR',
'       :P2024001_FCHA_FNAL IS NULL)  ',
'   and ( to_char(a.fcha_pblccion,''YYYYMMDD'') = to_char(to_date(:P2024001_FCHA_PBLCCION, ''DD/MM/YYYY''), ''YYYYMMDD'') OR',
'       :P2024001_FCHA_PBLCCION IS NULL)     ',
'   order by a.id_acto)',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3575839696323728)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
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
 p_id=>wwv_flow_api.id(3575933096323729)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero De Acto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(3576017081323730)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Del Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(3576102332323731)
,p_name=>'TPO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo De Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(3576233790323732)
,p_name=>'INDCDOR_NTFCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_NTFCDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>34
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
 p_id=>wwv_flow_api.id(3576388530323733)
,p_name=>'FCHA_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_NTFCCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha De<br> Notificaci\00F3n')
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
 p_id=>wwv_flow_api.id(3576440322323734)
,p_name=>'FCHA_PBLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_PBLCCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha De <br>Publicaci\00F3n')
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3576813512323738)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(3575772169323727)
,p_internal_uid=>3575772169323727
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
 p_id=>wwv_flow_api.id(5474511587750161)
,p_interactive_grid_id=>wwv_flow_api.id(3575772169323727)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(5474633372750161)
,p_report_id=>wwv_flow_api.id(5474511587750161)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5475195201750164)
,p_view_id=>wwv_flow_api.id(5474633372750161)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(3575839696323728)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5475655841750166)
,p_view_id=>wwv_flow_api.id(5474633372750161)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(3575933096323729)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5476193147750168)
,p_view_id=>wwv_flow_api.id(5474633372750161)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(3576017081323730)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5476665941750169)
,p_view_id=>wwv_flow_api.id(5474633372750161)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(3576102332323731)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5477155438750170)
,p_view_id=>wwv_flow_api.id(5474633372750161)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(3576233790323732)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5477659835750172)
,p_view_id=>wwv_flow_api.id(5474633372750161)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(3576388530323733)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5478194138750173)
,p_view_id=>wwv_flow_api.id(5474633372750161)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(3576440322323734)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5618722139923008)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
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
 p_id=>wwv_flow_api.id(224759736385142697)
,p_plug_name=>'ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
'<i>Funcionalidad que permite:',
'   Generar el certificado de publicacion de actos<br>',
unistr('   Filtrar los Actos a seleccionar por diferentes criterios de b\00FAsqueda<br>'),
'   *Si va a consultar por rango de fechas debe seleccionar una fecha inicial y una fecha final.<br>',
unistr('   *Si va a consultar una fecha espec\00EDfica debe seleccionar una fecha final. <br>'),
'<br/>',
'<br/>',
'    <p>',
unistr('        Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario'),
'    </p>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5618224207923003)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(3575668777323726)
,p_button_name=>'BTN_SLCCNAR_ALL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Seleccionar Todos'
,p_button_position=>'ABOVE_BOX'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5618840330923009)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5618722139923008)
,p_button_name=>'BTN_DSCRGAR'
,p_button_static_id=>'descargarTodos'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Descargar Certificado'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-download'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5620336247923024)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5618722139923008)
,p_button_name=>'BTN_DSCRGAR_PNTAL'
,p_button_static_id=>'BTN_DSCRGAR_PNTAL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Descargar Certificado'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-download'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3575541374323725)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(3574906310323719)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3575007140323720)
,p_name=>'P2024001_NMRO_ACTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(3574906310323719)
,p_prompt=>unistr('<b>N\00FAmero De Acto</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3575108669323721)
,p_name=>'P2024001_FCHA_INCIAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(3574906310323719)
,p_prompt=>'<b>Fecha Inicial</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3575277106323722)
,p_name=>'P2024001_FCHA_FNAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(3574906310323719)
,p_prompt=>'<b>Fecha Final</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3575357032323723)
,p_name=>'P2024001_ID_ACTO_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(3574906310323719)
,p_prompt=>'<b>Tipo De Acto</b>'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_ACTO_TIPOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_acto_tpo||'' - ''||dscrpcion d , id_acto_tpo r ',
'from gn_d_actos_tipo',
'where cdgo_clnte = :F_CDGO_CLNTE and',
'      indcdor_ntfccion = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3575410282323724)
,p_name=>'P2024001_INDCDOR_NTFCDO_WEB'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(3574906310323719)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3577189841323741)
,p_name=>'P2024001_INDCDOR_NTFCDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(3574906310323719)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5618683783923007)
,p_name=>'P2024001_ID_JSON'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(3574906310323719)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5620007154923021)
,p_name=>'P2024001_ID_JSON_PNTAL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(3574906310323719)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5622535103923046)
,p_name=>'P2024001_FCHA_PBLCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(3574906310323719)
,p_prompt=>unistr('<b>Fecha De Publicaci\00F3n</b>')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5618039140923001)
,p_name=>'Al dar clien en BTN_CNSLTAR'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(3575541374323725)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5618155928923002)
,p_event_id=>wwv_flow_api.id(5618039140923001)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function consulta() {',
'    var id_acto_tpo = apex.item("P2024001_ID_ACTO_TPO").getValue().trim();',
'    var numeroActo = apex.item("P2024001_NMRO_ACTO").getValue().trim();',
'    var fcha_ini = apex.item("P2024001_FCHA_INCIAL").getValue().trim();',
'    var fcha_fin = apex.item("P2024001_FCHA_FNAL").getValue().trim();',
'    var fcha_pub = apex.item("P2024001_FCHA_PBLCCION").getValue().trim();',
'    ',
'    if (numeroActo === "" && id_acto_tpo === "" && fcha_ini ==="" && fcha_fin ==="" && fcha_pub === "") {',
unistr('        apex.message.alert(''Debe diligenciar al menos un criterio de b\00FAsqueda.'');'),
'    } else {',
'        apex.item("P2024001_INDCDOR_NTFCDO").setValue("S");',
'        apex.item("P2024001_INDCDOR_NTFCDO_WEB").setValue("S");',
'        apex.submit();',
'    }',
'}',
'',
'consulta();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5618398247923004)
,p_name=>'Al dar clic en BTN_SLCCNAR_ALL'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(5618224207923003)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5618414226923005)
,p_event_id=>wwv_flow_api.id(5618398247923004)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function seleccionarTodos() {',
'        ',
'    var ig$ = apex.region(''actos'').widget();',
'',
'   var gridView = ig$.interactiveGrid("getViews", "grid");',
'',
'    gridView.view$.grid("selectAll");',
'    ',
'    apex.server.process(''SeleccionActos'', {',
'        pageItems: "#F_CDGO_CLNTE, #F_CDGO_CLNTE, #P2024001_INDCDOR_NTFCDO, #P2024001_INDCDOR_NTFCDO_WEB, #P2024001_ID_ACTO_TPO, #P2024001_NMRO_ACTO, #P2024001_FCHA_INCIAL, #P2024001_FCHA_FNAL, #P2024001_FCHA_PBLCCION"       ',
'    },',
'        {',
'            success: function (data) {',
'                if (data.o_cdgo_rspsta != 0) {',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([{',
'                        type: "error",',
'                        location: "page",',
'                        message: "Error al seleccionar los actos. ",',
'                        unsafe: false',
'                    }]);',
'                    apex.item("P2024001_HBLTDOR").setValue("");',
'                } else {',
'                    apex.message.showPageSuccess(""+data.o_mnsje_rspsta);',
'                    apex.item("P2024001_ID_JSON").setValue(data.o_id_json);                   ',
'                    console.log(''P2024001_ID_JSON: '' + apex.item("P2024001_ID_JSON").getValue());',
'                    ',
'                    apex.item("descargarTodos").show();',
'                    apex.item("BTN_DSCRGAR_PNTAL").hide();',
'                }',
'            }',
'        });',
'}',
'',
'seleccionarTodos();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5620126110923022)
,p_name=>'Al seleccionar una fila del IG'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(3575668777323726)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5620240948923023)
,p_event_id=>wwv_flow_api.id(5620126110923022)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function obtenerActos() {',
'',
'    var v_json;',
'    var region = apex.region(''actos'');',
'    var responsables = [];',
'',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'',
'        if (records.length > 0) {',
'',
'            records.forEach(function (record) {',
'                var idActo = model.getValue(record, "ID_ACTO");',
'                responsables.push({ "ID_ACTO": idActo });',
'            });',
'',
'            v_json = JSON.stringify(responsables);',
'            window.localStorage.setItem(''v_json'', v_json);',
'',
'            console.log(''JSON actos: '', v_json);',
'',
'            try {',
'                apex.server.process("registrarJson", {',
'                    f01: v_json,',
'                    pageItems: "#F_CDGO_CLNTE"',
'                }, {',
'                    success: function (data) {',
'                        if (data.o_cdgo_rspsta != 0) {',
'                            console.log(''RESPUESTA: '' + data.o_cdgo_rspsta);',
'                            apex.message.clearErrors();',
'                            apex.message.showErrors([',
'                                {',
'                                    type: "error",',
'                                    location: "page",',
'                                    message: data.o_mnsje_rspsta,',
'                                    unsafe: false',
'                                }',
'                            ]);',
'',
'                        } else {',
'                            apex.item("P2024001_ID_JSON_PNTAL").setValue(data.o_id_json);',
'                            console.log(''P2024001_ID_JSON_PNTAL: '' + apex.item("P2024001_ID_JSON_PNTAL").getValue());',
'                            apex.item("BTN_DSCRGAR_PNTAL").show();',
'                        }',
'                    }',
'                })',
'            } catch (e) {',
'                apex.message.clearErrors();',
'                apex.message.showErrors([{',
'                    type: "error",',
'                    location: ["page"],',
'                    message: "Error al seleccionar los actos: " + e,',
'                    unsafe: false',
'                }]);',
'            }',
'',
'',
'        } else {',
'            console.log("No hay registros seleccionados.");',
'        }',
'    } else {',
unistr('        console.error("No se encontr\00F3 la regi\00F3n con el nombre ''actos''.");'),
'    }',
'}',
'',
'apex.item("descargarTodos").hide();',
'apex.item("BTN_DSCRGAR_PNTAL").hide();',
'',
'obtenerActos();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3577003920323740)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(3575668777323726)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Actos - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5619126169923012)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'descargarCertificado'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_nmbre_rprte gn_d_reportes.nmbre_rprte%type;',
'  v_object      json_object_t := json_object_t();',
'  v_nmbre_trcro varchar2(500);',
'  v_json        clob;',
'  v_json_temp   clob;',
'  id_reporte    number;',
'  v_error       exception;',
'  v_cdgo_rspsta number := 0;',
'  v_mnsje_rspsta varchar2(4000);',
'  v_cdgo_error  varchar2(4000);',
'  v_fcha_pbccion varchar2(100);',
'begin',
unistr('  -- Obtener informaci\00F3n del reporte'),
'  begin',
'    select nmbre_rprte || ''_'' || to_char(SYSDATE, ''YYYYMMDD''), id_rprte',
'      into v_nmbre_rprte, id_reporte',
'      from gn_d_reportes',
'     where cdgo_rprte_grpo = ''CPA''',
'     and actvo = ''S'';',
'  exception',
'    when others then',
unistr('      v_mnsje_rspsta := ''No se encontr\00F3 la informaci\00F3n del reporte: '' || sqlerrm;'),
'      raise v_error;',
'  end;',
'',
'  -- Obtener nombre del usuario',
'  begin',
'    select a.nmbre_trcro',
'      into v_nmbre_trcro',
'      from v_sg_g_usuarios a',
'     where a.id_usrio = :F_ID_USRIO;',
'  exception',
'    when no_data_found then',
'      v_nmbre_trcro  := null;',
'      v_mnsje_rspsta := ''Error al consultar los datos del usuario: '' || sqlerrm;',
'      raise v_error;',
'  end;    ',
'    ',
'  -- Construir el JSON',
'  begin',
'    DBMS_LOB.CREATETEMPORARY(v_json_temp, TRUE);',
'',
'    DBMS_LOB.WRITEAPPEND(v_json_temp, LENGTH(''{"nmbre_rprte":"'') + LENGTH(v_nmbre_rprte) + LENGTH(''",''), ''{"nmbre_rprte":"'' || v_nmbre_rprte || ''",'');',
'    DBMS_LOB.WRITEAPPEND(v_json_temp, LENGTH(''"id_usrio":"'') + LENGTH(:F_ID_USRIO) + LENGTH(''",''), ''"id_usrio":"'' || :F_ID_USRIO || ''",'');',
'    DBMS_LOB.WRITEAPPEND(v_json_temp, LENGTH(''"nmbre_trcro":"'') + LENGTH(v_nmbre_trcro) + LENGTH(''",''), ''"nmbre_trcro":"'' || v_nmbre_trcro || ''",'');',
'    DBMS_LOB.WRITEAPPEND(v_json_temp, LENGTH(''"id_crtfcdo_json":'') + LENGTH(:P2024001_ID_JSON) + LENGTH(''}''), ''"id_crtfcdo_json":'' || :P2024001_ID_JSON || ''}'');',
'   ',
'    v_json := v_json_temp;',
'',
'    DBMS_LOB.FREETEMPORARY(v_json_temp);',
'',
'      ',
'     apex_session.attach(p_app_id     => 66000,',
'                          p_page_id    => 37,',
'                          p_session_id => :APP_SESSION);',
'    ',
'      apex_util.set_session_state(''P37_NMBRE_RPRTE'', v_nmbre_rprte);',
'      apex_util.set_session_state(''P37_JSON'', v_json);',
'      apex_util.set_session_state(''P37_ID_RPRTE'', id_reporte);            ',
'  ',
'  exception',
'    when others then',
'      v_cdgo_error := sqlerrm;     ',
'      v_cdgo_rspsta := 1;',
'      raise v_error;',
'  end;',
'',
'exception',
'  when v_error then',
'    rollback;',
'    return;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5618840330923009)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5620677549923027)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'certificadosPuntuales'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_nmbre_rprte gn_d_reportes.nmbre_rprte%type;',
'  v_object      json_object_t := json_object_t();',
'  v_nmbre_trcro varchar2(500);',
'  v_json        clob;',
'  v_json_temp   clob;',
'  id_reporte    number;',
'  v_error       exception;',
'  v_cdgo_rspsta number := 0;',
'  v_mnsje_rspsta varchar2(4000);',
'  v_cdgo_error  varchar2(4000);',
'  ',
'begin',
'',
unistr('  -- Obtener informaci\00F3n del reporte'),
'  begin',
'    select nmbre_rprte || ''_'' || to_char(SYSDATE, ''YYYYMMDD''), id_rprte',
'      into v_nmbre_rprte, id_reporte',
'      from gn_d_reportes',
'     where cdgo_rprte_grpo = ''CPA''',
'     and actvo = ''S'';',
'  exception',
'    when others then',
unistr('      v_mnsje_rspsta := ''No se encontr\00F3 la informaci\00F3n del reporte: '' || sqlerrm;'),
'      raise v_error;',
'  end;',
'',
'  -- Obtener nombre del usuario',
'  begin',
'    select a.nmbre_trcro',
'      into v_nmbre_trcro',
'      from v_sg_g_usuarios a',
'     where a.id_usrio = :F_ID_USRIO;',
'  exception',
'    when no_data_found then',
'      v_nmbre_trcro  := null;',
'      v_mnsje_rspsta := ''Error al consultar los datos del usuario: '' || sqlerrm;',
'      raise v_error;',
'  end;',
' ',
'  ',
'  begin',
'    DBMS_LOB.CREATETEMPORARY(v_json_temp, TRUE);',
'',
'    DBMS_LOB.WRITEAPPEND(v_json_temp, LENGTH(''{"nmbre_rprte":"'') + LENGTH(v_nmbre_rprte) + LENGTH(''",''), ''{"nmbre_rprte":"'' || v_nmbre_rprte || ''",'');',
'    DBMS_LOB.WRITEAPPEND(v_json_temp, LENGTH(''"id_usrio":"'') + LENGTH(:F_ID_USRIO) + LENGTH(''",''), ''"id_usrio":"'' || :F_ID_USRIO || ''",'');',
'    DBMS_LOB.WRITEAPPEND(v_json_temp, LENGTH(''"nmbre_trcro":"'') + LENGTH(v_nmbre_trcro) + LENGTH(''",''), ''"nmbre_trcro":"'' || v_nmbre_trcro || ''",'');',
'    DBMS_LOB.WRITEAPPEND(v_json_temp, LENGTH(''"id_crtfcdo_json":'') + LENGTH(:P2024001_ID_JSON_PNTAL) + LENGTH(''}''), ''"id_crtfcdo_json":'' || :P2024001_ID_JSON_PNTAL || ''}'');',
'   ',
'    v_json := v_json_temp;',
'',
'    DBMS_LOB.FREETEMPORARY(v_json_temp);',
'',
'      ',
'     apex_session.attach(p_app_id     => 66000,',
'                          p_page_id    => 37,',
'                          p_session_id => :APP_SESSION);',
'    ',
'      apex_util.set_session_state(''P37_NMBRE_RPRTE'', v_nmbre_rprte);',
'      apex_util.set_session_state(''P37_JSON'', v_json);',
'      apex_util.set_session_state(''P37_ID_RPRTE'', id_reporte);',
'  ',
'  exception',
'    when others then',
'      v_cdgo_error := sqlerrm;     ',
'      v_cdgo_rspsta := 1;',
'      raise v_error;',
'  end;',
'',
'exception',
'  when v_error then',
'    rollback;',
'    return;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5620336247923024)
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5618511456923006)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SeleccionActos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_cdgo_rspsta  number;',
'  v_nmro_actos   number;',
'  v_id_json      number;',
'  v_mnsje_rspsta varchar2(4000);',
'  v_exception    exception;',
'begin',
'',
'  pkg_nt_notificacion.prc_gn_json_actos_crtfcdo(p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                                p_id_usrio           => :F_ID_USRIO,',
'                                                p_indcdor_ntfcdo     => :P2024001_INDCDOR_NTFCDO,',
'                                                p_indcdor_ntfcdo_web => :P2024001_INDCDOR_NTFCDO_WEB,',
'                                                p_id_acto_tpo        => :P2024001_ID_ACTO_TPO,',
'                                                p_nmro_acto          => :P2024001_NMRO_ACTO,',
'                                                p_fcha_incial        => :P2024001_FCHA_INCIAL,',
'                                                p_fcha_fnal          => :P2024001_FCHA_FNAL,',
'                                                p_cdgo_rgstro_tpo    => ''I'',',
'                                                p_fcha_pblccion      => :P2024001_FCHA_PBLCCION,',
'                                                o_id_json            => v_id_json,',
'                                                o_cdgo_rspsta        => v_cdgo_rspsta,',
'                                                o_mnsje_rspsta       => v_mnsje_rspsta);',
'',
'  if (v_cdgo_rspsta = 0) then',
'      commit;',
'  else',
'      raise v_exception;',
'  end if;',
'  ',
'  apex_json.open_object;',
'  apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'  apex_json.write(''o_id_json'', v_id_json);',
'  apex_json.write(''o_nmro_actos'', v_nmro_actos);',
'  apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'  apex_json.close_object;',
'',
'exception',
'  when v_exception then',
'    rollback;',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_id_json'', v_id_json);',
'    apex_json.write(''o_nmro_actos'', v_nmro_actos);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5620736667923028)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'registrarJson'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_nt_crtfcdo_json number;',
'    v_nmro_actos         number;',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(4000);',
'    v_error              exception;',
'    v_json_actos         clob;',
'begin',
'',
'   for i in 1..apex_application.g_f01.count loop',
'        v_json_actos := v_json_actos || apex_application.g_f01(i);',
'   end loop; ',
'   ',
'   pkg_nt_notificacion.prc_rg_certificados_json(p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                               p_json_actos           => v_json_actos,',
'                                               p_cdgo_rgstro_tpo      => ''I'',',
'                                               o_id_nt_crtfcdo_json   => v_id_nt_crtfcdo_json,',
'                                               o_nmro_actos           => v_nmro_actos,',
'                                               o_cdgo_rspsta          => v_cdgo_rspsta,',
'                                               o_mnsje_rspsta         => v_mnsje_rspsta);',
'                                               ',
'     if (v_cdgo_rspsta <> 0) then',
'         raise v_error;     ',
'     else',
'         commit;         ',
'         apex_json.open_object;',
'         apex_json.write(''o_cdgo_rspsta'',  v_cdgo_rspsta);',
'         apex_json.write(''o_id_json'',  v_id_nt_crtfcdo_json);',
'         apex_json.write(''o_nmro_actos'',  v_nmro_actos);',
'         apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'         apex_json.close_object;',
'     end if;',
'     ',
'exception when v_error then',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'',  v_cdgo_rspsta);',
'    apex_json.write(''o_id_json'',  v_id_nt_crtfcdo_json);',
'    apex_json.write(''o_nmro_actos'',  v_nmro_actos);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
