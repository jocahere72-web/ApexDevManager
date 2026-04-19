prompt --application/pages/page_00222
begin
wwv_flow_api.create_page(
 p_id=>222
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Estructura de Archivo Ex\00F3gena')
,p_step_title=>unistr('Estructura de Archivo Ex\00F3gena')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20250703085430'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8473299955912017)
,p_plug_name=>'Estructura de Archivo'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 	a.id_exgna_archv_est,',
'		a.id_exgna_archvo_tpo,',
'		a.nmro_hoja,',
'		a.nmro_clmna,',
'		a.tpo_dato,',
'		a.tamano,',
'        a.nmbre_clmna,',
'        a.dscrpcion',
'  from df_i_exogena_archv_estrctra a',
' where a.id_exgna_archvo_tpo = :P222_TPO_ARCHVO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8473421361912019)
,p_name=>'ID_EXGNA_ARCHV_EST'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EXGNA_ARCHV_EST'
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
 p_id=>wwv_flow_api.id(8473569155912020)
,p_name=>'ID_EXGNA_ARCHVO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EXGNA_ARCHVO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P222_TPO_ARCHVO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8473620405912021)
,p_name=>'NMRO_HOJA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_HOJA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Hoja'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbr_hojas d,',
'       a.id_hojas  r ',
'from df_i_exogena_hojas a',
'join df_i_exogena_archv_estr_hja b on b.nmro_hoja = a.id_hojas',
'where b.id_exgna_archvo_tpo = :P222_TPO_ARCHVO',
';'))
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
 p_id=>wwv_flow_api.id(8473700025912022)
,p_name=>'NMRO_CLMNA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CLMNA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Columna'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:A;A,B;B,C;C,D;D,E;E,F;F,G;G,H;H,I;I,J;J,K;K,L;L,M;M,N;N,O;O,P;P,Q;Q,R;R,S;S,T;T,U;U,V;V,W;W,X;X,Y;Y,Z;Z'
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
 p_id=>wwv_flow_api.id(8473876641912023)
,p_name=>'TPO_DATO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_DATO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tipo de Dato'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>unistr('STATIC:Num\00E9rico;N,Num\00E9rico Decimal;D,Correo Electr\00F3nico;E,Alfab\00E9tico;A,Fecha (AAAA-MM-DD);F,Cadena/Otro;C')
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
 p_id=>wwv_flow_api.id(8473957194912024)
,p_name=>'TAMANO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TAMANO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Tama\00F1o')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
,p_max_length=>3
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
 p_id=>wwv_flow_api.id(8474027355912025)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8474197584912026)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8475468325912039)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
 p_id=>wwv_flow_api.id(9183672830986706)
,p_name=>'NMBRE_CLMNA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_CLMNA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Homologaci\00F3n<br>de Columna')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:C001;C001,C002;C002,C003;C003,C004;C004,C005;C005,C006;C006,C007;C007,C008;C008,C009;C009,C010;C010,C011;C011,C012;C012,C013;C013,C014;C014,C015;C015,C016;C016,C017;C017,C018;C018,C019;C019,C020;C020,C021;C021,C022;C022,C023;C023,C024;C024,C02'
||'5;C025,C026;C026'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(8473308927912018)
,p_internal_uid=>8473308927912018
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
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
 p_id=>wwv_flow_api.id(11469729127720117)
,p_interactive_grid_id=>wwv_flow_api.id(8473308927912018)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(11469824784720117)
,p_report_id=>wwv_flow_api.id(11469729127720117)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11470364461720121)
,p_view_id=>wwv_flow_api.id(11469824784720117)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(8473421361912019)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11470858696720124)
,p_view_id=>wwv_flow_api.id(11469824784720117)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(8473569155912020)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11471352058720125)
,p_view_id=>wwv_flow_api.id(11469824784720117)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(8473620405912021)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11471888290720126)
,p_view_id=>wwv_flow_api.id(11469824784720117)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(8473700025912022)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>2
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11472346125720128)
,p_view_id=>wwv_flow_api.id(11469824784720117)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(8473876641912023)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11472885776720129)
,p_view_id=>wwv_flow_api.id(11469824784720117)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(8473957194912024)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11479043273809958)
,p_view_id=>wwv_flow_api.id(11469824784720117)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(8474027355912025)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11639503021911326)
,p_view_id=>wwv_flow_api.id(11469824784720117)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(9183672830986706)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11824619497370670)
,p_view_id=>wwv_flow_api.id(11469824784720117)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(8475468325912039)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(115858176006854698)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(115859196920855533)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
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
unistr('	Funcionalidad que permite ingresar, consultar, modificar y eliminar las fechas de presentaci\00F3n de la declaraci\00F3n ex\00F3gena para una vigencia espec\00EDfica.'),
'    <br><br>',
unistr('    Homologaci\00F3n de columnas:<br>'),
'        A -->  C001<br>',
'        B -->  C002<br>',
'        C -->  C003<br>',
'        D -->  C004<br>',
'        E -->  C005<br>',
'        F -->  C006<br>',
'        G -->  C007<br>',
'        H -->  C008<br>',
'        I -->  C009<br>',
'        J -->  C010<br>',
'        K -->  C011<br>',
'        L -->  C012<br>',
'        M -->  C013<br>',
'        N -->  C014<br>',
'        O -->  C015<br>',
'        P -->  C016<br>',
'        Q -->  C017<br>',
'        R -->  C018<br>',
'        S -->  C019<br>',
'        T -->  C020<br>',
'        U -->  C021<br>',
'        V -->  C022<br>',
'        W -->  C023<br>',
'        X -->  C024<br>',
'        Y -->  C025<br>',
'        Z -->  C026<br>',
'        ',
'<br>	',
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(11473328566726279)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(115858176006854698)
,p_button_name=>'CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11474116089726284)
,p_name=>'P222_TPO_ARCHVO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(115858176006854698)
,p_prompt=>'Tipo de Archivo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.vgncia||'' - ''||a.nmbre||'' - ''||a.dscrpcion as d, ',
'        a.id_exgna_archvo_tpo as r',
'from df_i_exogena_archivo_tipo a ',
'where a.actvo = ''S'''))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8474265177912027)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(8473299955912017)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Estructura de Archivo - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
