prompt --application/pages/page_00127
begin
wwv_flow_api.create_page(
 p_id=>127
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Tarifa Esquema Declaraciones'
,p_step_title=>'Tarifa Esquema Declaraciones'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20210129102157'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(62386760606378306)
,p_plug_name=>'Tarifa Esquema Declaraciones'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_dclrcns_esqma_trfa,',
'       a.cdgo_dclrcns_esqma_trfa,',
'       a.id_dclrcns_esqma_trfa_tpo,',
'       a.dscrpcion,',
'       a.trfa,',
'       a.fcha_dsde,',
'       a.fcha_hsta',
'from    gi_d_dclrcns_esqma_trfa a',
'where   exists  (',
'                    select  1',
'                    from    gi_d_dclrcns_esqma_trfa_tpo b',
'                    where   b.cdgo_clnte                    =   :F_CDGO_CLNTE',
'                    and     b.id_impsto                     =   nvl(:P127_ID_IMPSTO, b.id_impsto)',
'                    and     b.id_impsto_sbmpsto             =   nvl(:P127_ID_IMPSTO_SBMPSTO, b.id_impsto_sbmpsto)',
'                    and     b.id_dclrcns_esqma_trfa_tpo     =   nvl(:P127_ID_DCLRCNS_ESQMA_TRFA_TPO, b.id_dclrcns_esqma_trfa_tpo)',
'                    and     b.id_dclrcns_esqma_trfa_tpo     =   a.id_dclrcns_esqma_trfa_tpo',
'                )',
'and     a.id_dclrcns_esqma_trfa   =   nvl(:P127_ID_DCLRCNS_ESQMA_TRFA, a.id_dclrcns_esqma_trfa);'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62395628349394450)
,p_name=>'CDGO_DCLRCNS_ESQMA_TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_DCLRCNS_ESQMA_TRFA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('C\00F3digo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_item_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'')" onkeyup="campoMayuscula(this)" '
,p_is_required=>true
,p_max_length=>5
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
 p_id=>wwv_flow_api.id(62708119253563401)
,p_name=>'ID_DCLRCNS_ESQMA_TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCNS_ESQMA_TRFA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62708207345563402)
,p_name=>'ID_DCLRCNS_ESQMA_TRFA_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCNS_ESQMA_TRFA_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tipo de Esquema'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_dclrcns_esqma_trfa_tpo as d',
'     , a.id_dclrcns_esqma_trfa_tpo    as r',
'from   gi_d_dclrcns_esqma_trfa_tpo  a',
'where  a.cdgo_clnte        = :F_CDGO_CLNTE',
'and    a.id_impsto         = nvl(:P127_ID_IMPSTO, a.id_impsto)',
'and    a.id_impsto_sbmpsto = nvl(:P127_ID_IMPSTO_SBMPSTO, a.id_impsto_sbmpsto)',
'order by    a.nmbre_dclrcns_esqma_trfa_tpo;'))
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
,p_default_type=>'ITEM'
,p_default_expression=>'P127_ID_DCLRCNS_ESQMA_TRFA_TPO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62708337627563403)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_item_attributes=>'onkeyup="campoMayuscula(this)" '
,p_is_required=>true
,p_max_length=>1000
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
 p_id=>wwv_flow_api.id(62708443992563404)
,p_name=>'TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRFA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tarifa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G990D000'
,p_item_attributes=>'onkeyup="formatNumber(event,{ precision: 3, thousand: ''.'',decimal: '','' });"  onkeypress="return validarExpresion(event, ''numeroComa'')"'
,p_is_required=>true
,p_max_length=>11
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
 p_id=>wwv_flow_api.id(62708558149563405)
,p_name=>'FCHA_DSDE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_DSDE'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Desde'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_item_attributes=>'onkeydown="return false"'
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
 p_id=>wwv_flow_api.id(62708642583563406)
,p_name=>'FCHA_HSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_HSTA'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Hasta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_item_attributes=>'onkeydown="return false"'
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
 p_id=>wwv_flow_api.id(62708797775563407)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62708836401563408)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(62395451668394448)
,p_internal_uid=>62395451668394448
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(62714093489563501)
,p_interactive_grid_id=>wwv_flow_api.id(62395451668394448)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(62714155432563501)
,p_report_id=>wwv_flow_api.id(62714093489563501)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62715190486563504)
,p_view_id=>wwv_flow_api.id(62714155432563501)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(62395628349394450)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>65
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62715656332563505)
,p_view_id=>wwv_flow_api.id(62714155432563501)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(62708119253563401)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62716135703563509)
,p_view_id=>wwv_flow_api.id(62714155432563501)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(62708207345563402)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>225
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62716625780563511)
,p_view_id=>wwv_flow_api.id(62714155432563501)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(62708337627563403)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>415
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62717185397563513)
,p_view_id=>wwv_flow_api.id(62714155432563501)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(62708443992563404)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62717677277563514)
,p_view_id=>wwv_flow_api.id(62714155432563501)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(62708558149563405)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62718181551563516)
,p_view_id=>wwv_flow_api.id(62714155432563501)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(62708642583563406)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62723155575577424)
,p_view_id=>wwv_flow_api.id(62714155432563501)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(62708797775563407)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(62391979701394413)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
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
unistr('	Funcionalidad que permite ingresar, consultar, modificar y eliminar descripci\00F3n y tarifa a utilizar en los formularios de declaraci\00F3n.<br><br>	'),
'    <b>Nota:</b> Digite el valor de la tarifa como indica en el estatuto tributario. Ejemplo: 5 x1000 . Ud. debe digitar en la columna tarifa el valor 5. 	',
'<br><br>	',
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(62392038874394414)
,p_plug_name=>unistr('Par\00E1metro de B\00FAsqueda')
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
 p_id=>wwv_flow_api.id(104386108542128433)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(62393695052394430)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(62392038874394414)
,p_button_name=>'CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BOTTOM'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(104386267357128434)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(104386108542128433)
,p_button_name=>'REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.:RP,127::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62392189052394415)
,p_name=>'P127_ID_DCLRCNS_ESQMA_TRFA_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(62392038874394414)
,p_prompt=>'Tipo de Esquema'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_dclrcns_esqma_trfa_tpo as d',
'     , a.id_dclrcns_esqma_trfa_tpo    as r',
'from   gi_d_dclrcns_esqma_trfa_tpo  a',
'where  a.cdgo_clnte        = :F_CDGO_CLNTE',
'and    a.id_impsto         = nvl(:P127_ID_IMPSTO, a.id_impsto)',
'and    a.id_impsto_sbmpsto = nvl(:P127_ID_IMPSTO_SBMPSTO, a.id_impsto_sbmpsto)',
'order by    a.nmbre_dclrcns_esqma_trfa_tpo;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P127_ID_IMPSTO,P127_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77987138069673819)
,p_name=>'P127_ID_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(62392038874394414)
,p_prompt=>'Tributo:'
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
,p_lov_null_text=>'-Seleccionar-'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77987224690673820)
,p_name=>'P127_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(62392038874394414)
,p_prompt=>'Sub tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto as d',
'     , id_impsto_sbmpsto    as r ',
'from df_i_impuestos_subimpuesto',
'where id_impsto = :P127_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P127_ID_IMPSTO'
,p_ajax_items_to_submit=>'P127_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83695139163840849)
,p_name=>'P127_ID_DCLRCNS_ESQMA_TRFA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(62392038874394414)
,p_prompt=>'Esquema'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_dclrcns_esqma_trfa',
'from    gi_d_dclrcns_esqma_trfa     a',
'join    gi_d_dclrcns_esqma_trfa_tpo b   on  b.id_dclrcns_esqma_trfa_tpo =   a.id_dclrcns_esqma_trfa_tpo',
'where   b.cdgo_clnte                =   :F_CDGO_CLNTE',
'and     b.id_dclrcns_esqma_trfa_tpo =   nvl(:P127_ID_DCLRCNS_ESQMA_TRFA_TPO, b.id_dclrcns_esqma_trfa_tpo)',
'order by    a.dscrpcion;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P127_ID_DCLRCNS_ESQMA_TRFA_TPO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(62709051267563410)
,p_tabular_form_region_id=>wwv_flow_api.id(62386760606378306)
,p_validation_name=>'Fecha hasta mayor fecha desde'
,p_validation_sequence=>10
,p_validation=>'TO_DATE(:FCHA_DSDE,''DD/MM/YYYY'') <= TO_DATE(:FCHA_HSTA,''DD/MM/YYYY'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La "#COLUMN_HEADER#" debe ser mayor que la "Fecha Desde"'
,p_associated_column=>'FCHA_HSTA'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(62709139939563411)
,p_tabular_form_region_id=>wwv_flow_api.id(62386760606378306)
,p_validation_name=>'Validar Rangos de Fecha'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
' v_gi_d_dclrcns_esqma_trfa gi_d_dclrcns_esqma_trfa.id_dclrcns_esqma_trfa%type;',
'begin     ',
'  ',
'  --Verifica si el rango existe',
'    select  a.id_dclrcns_esqma_trfa',
'    into    v_gi_d_dclrcns_esqma_trfa',
'    from    gi_d_dclrcns_esqma_trfa a',
'    where   a.id_dclrcns_esqma_trfa_tpo =   :ID_DCLRCNS_ESQMA_TRFA_TPO',
'    and     a.cdgo_dclrcns_esqma_trfa   =   :CDGO_DCLRCNS_ESQMA_TRFA',
'    and     (',
'                to_date(:FCHA_DSDE,''DD/MM/YYYY'')    between  a.fcha_dsde                        and  a.fcha_hsta',
'                or',
'                a.fcha_dsde                         between  to_date(:FCHA_DSDE,''DD/MM/YYYY'')   and  to_date(:FCHA_HSTA,''DD/MM/YYYY'')',
'            )',
'    and     (',
'                to_date(:FCHA_HSTA,''DD/MM/YYYY'')    between  a.fcha_dsde                        and  a.fcha_hsta',
'                or',
'                a.fcha_hsta                         between  to_date(:FCHA_DSDE,''DD/MM/YYYY'')   and to_date(:FCHA_HSTA,''DD/MM/YYYY'')',
'            );',
'      ',
'   if( v_gi_d_dclrcns_esqma_trfa = :P127_ID_DCLRCNS_ESQMA_TRFA ) then ',
'       return true;',
'   else',
'       return false;    ',
'   end if;',
'   ',
'exception ',
'     when too_many_rows then ',
'          return false;',
'     when no_data_found then ',
'          return true;',
'          end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El rango de fechas ingresado esta incluido en otro rango o abarca un rango de fechas existente.'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(62708948283563409)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(62386760606378306)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Tarifa Esquema Declaraciones - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CONSULTAR'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_process_success_message=>'Se han guardado los cambios.'
);
end;
/
