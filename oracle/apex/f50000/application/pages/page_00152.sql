prompt --application/pages/page_00152
begin
wwv_flow_api.create_page(
 p_id=>152
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Esquema Predio Masivo'
,p_page_mode=>'MODAL'
,p_step_title=>'Esquema Predio Masivo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_dialog_width=>'90%'
,p_protection_level=>'C'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250115101230'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(57285152013903023)
,p_plug_name=>'Tarifa'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29551431083068507)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_prdio_esqma,',
'       id_indcdor_ecnmco,',
'       bse_mnma,',
'       bse_mxma,',
'       trfa,',
'       area_trrno_mnma,',
'       area_trrno_mxma,',
'       area_cnsctrda_mnma,',
'       area_cnsctrda_mxma',
'from',
'    gi_d_predios_esquema',
'where 1 = 2;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(57285341306903025)
,p_name=>'ID_PRDIO_ESQMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDIO_ESQMA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(57285484209903026)
,p_name=>'ID_INDCDOR_ECNMCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INDCDOR_ECNMCO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>unistr('Indicador Econ\00F3mico')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select initcap(t.nmbre_indcdor_tpo) ||'' '' || to_char(fcha_dsde, ''dd/mm/yyyy'') || ''-'' || to_char(fcha_hsta, ''dd/mm/yyyy''),',
'       i.id_indcdor_ecnmco',
'  from df_s_indicadores_economico i, df_s_indicadores_tipo t',
' where i.cdgo_indcdor_tpo = t.cdgo_indcdor_tpo',
'   -- and fcha_dsde between :P75_FCHA_INCIAL and :PFCHA_FNAL',
'  order by fcha_hsta desc'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(57285586560903027)
,p_name=>'BSE_MNMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BSE_MNMA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Base M\00EDnima')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990D0000'
,p_item_width=>15
,p_is_required=>true
,p_max_length=>16
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
 p_id=>wwv_flow_api.id(57285650164903028)
,p_name=>'BSE_MXMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BSE_MXMA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Base M\00E1xima')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990D0000'
,p_item_width=>15
,p_is_required=>true
,p_max_length=>16
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
 p_id=>wwv_flow_api.id(57285774928903029)
,p_name=>'TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRFA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tarifa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_item_attributes=>'onkeyup="formatNumber(event,{ precision: 2, thousand: '','',decimal: '','' });"  onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_is_required=>false
,p_max_length=>5
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
 p_id=>wwv_flow_api.id(57285806450903030)
,p_name=>'AREA_TRRNO_MNMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AREA_TRRNO_MNMA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('\00C1rea Terreno M\00EDnima')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_item_width=>15
,p_item_attributes=>'999G999G999G999G990D0000'
,p_is_required=>true
,p_max_length=>16
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
 p_id=>wwv_flow_api.id(57285902316903031)
,p_name=>'AREA_TRRNO_MXMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AREA_TRRNO_MXMA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('\00C1rea Terreno M\00E1xima')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990D0000'
,p_item_width=>15
,p_is_required=>true
,p_max_length=>16
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
 p_id=>wwv_flow_api.id(57286098708903032)
,p_name=>'AREA_CNSCTRDA_MNMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AREA_CNSCTRDA_MNMA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('\00C1rea Construida M\00EDnima')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990D0000'
,p_item_width=>15
,p_is_required=>true
,p_max_length=>16
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
 p_id=>wwv_flow_api.id(57286199302903033)
,p_name=>'AREA_CNSCTRDA_MXMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AREA_CNSCTRDA_MXMA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('\00C1rea Construida M\00E1xima')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990D0000'
,p_item_width=>15
,p_is_required=>true
,p_max_length=>16
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
 p_id=>wwv_flow_api.id(57286521952903037)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(57285243097903024)
,p_internal_uid=>57285243097903024
,p_is_editable=>true
,p_edit_operations=>'i:u'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
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
 p_id=>wwv_flow_api.id(57453246371822319)
,p_interactive_grid_id=>wwv_flow_api.id(57285243097903024)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(57453381596822319)
,p_report_id=>wwv_flow_api.id(57453246371822319)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(57453838019822322)
,p_view_id=>wwv_flow_api.id(57453381596822319)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(57285341306903025)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(57454386996822327)
,p_view_id=>wwv_flow_api.id(57453381596822319)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(57285484209903026)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(57454810310822345)
,p_view_id=>wwv_flow_api.id(57453381596822319)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(57285586560903027)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(57455319084822347)
,p_view_id=>wwv_flow_api.id(57453381596822319)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(57285650164903028)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(57455852865822348)
,p_view_id=>wwv_flow_api.id(57453381596822319)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(57285774928903029)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>78
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(57456383897822350)
,p_view_id=>wwv_flow_api.id(57453381596822319)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(57285806450903030)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(57456881154822352)
,p_view_id=>wwv_flow_api.id(57453381596822319)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(57285902316903031)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(57457328872822353)
,p_view_id=>wwv_flow_api.id(57453381596822319)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(57286098708903032)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(57457857737822355)
,p_view_id=>wwv_flow_api.id(57453381596822319)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(57286199302903033)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(57471091856854312)
,p_view_id=>wwv_flow_api.id(57453381596822319)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(57286521952903037)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(229761579430186525)
,p_plug_name=>'Esquema Predio'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29530253509068499)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(229762244584186531)
,p_plug_name=>'Botones'
,p_region_template_options=>'#DEFAULT#:margin-top-lg'
,p_plug_template=>wwv_flow_api.id(29532093730068500)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(57412749104700364)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(229762244584186531)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(57413195399700365)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(229762244584186531)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro que desea eliminar el registro?'',''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P152_ID_PRDIO_ESQMA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(57413551448700366)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(229762244584186531)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P152_ID_PRDIO_ESQMA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(57413918693700366)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(229762244584186531)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P152_ID_PRDIO_ESQMA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57395457039700340)
,p_name=>'P152_ID_PRDIO_ESQMA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(229761579430186525)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Prdio Esqma'
,p_source=>'ID_PRDIO_ESQMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57395885624700342)
,p_name=>'P152_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(229761579430186525)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&F_CDGO_CLNTE.'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57396275279700342)
,p_name=>'P152_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(229761579430186525)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tributo'
,p_source=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
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
,p_cHeight=>1
,p_colspan=>3
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tributo.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57397117100700343)
,p_name=>'P152_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(229761579430186525)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sub-Tributo'
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NMBRE_IMPSTO_SBMPSTO  as d,',
'       ID_IMPSTO_SBMPSTO as r',
'  from DF_I_IMPUESTOS_SUBIMPUESTO',
' where  ID_IMPSTO = :P152_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P152_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el subtributo.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57398058217700343)
,p_name=>'P152_FCHA_INCIAL'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(229761579430186525)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Inicial'
,p_source=>'FCHA_INCIAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>255
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione la fecha inicial.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57398927184700344)
,p_name=>'P152_FCHA_FNAL'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(229761579430186525)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Final'
,p_source=>'FCHA_FNAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>255
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione la fecha final.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57399827524700345)
,p_name=>'P152_CDGO_PRDIO_CLSFCCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(229761579430186525)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Clasificaci\00F3n Predio')
,p_source=>'CDGO_PRDIO_CLSFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CLASIFICACION_PREDIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_prdio_clsfccion d,',
'       cdgo_prdio_clsfccion  r   ',
'  from df_s_predios_clasificacion',
'  order by cdgo_prdio_clsfccion'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista la clasificaci\00F3n del predio.')
,p_attribute_01=>'MULTI'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57400716640700345)
,p_name=>'P152_ID_PRDIO_USO_SLO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(229761579430186525)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Uso Suelo Predio'
,p_source=>'ID_PRDIO_USO_SLO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_PREDIO_USO_SUELO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d ,',
'       id_prdio_uso_slo r',
'  from df_c_predios_uso_suelo',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el uso del predio.'
,p_attribute_01=>'MULTI'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57401629983700346)
,p_name=>'P152_ID_PRDIO_DSTNO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(229761579430186525)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Destino Predio'
,p_source=>'ID_PRDIO_DSTNO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select ''[''||a.nmtcnco||''] ''||a.dscrpcion dscrpcion',
'     , a.id_prdio_dstno',
'  from df_i_predios_destino a',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_impsto  = :P152_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P152_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el destino del predio '
,p_attribute_01=>'MULTI'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57402585158700346)
,p_name=>'P152_CDGO_ESTRTO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(229761579430186525)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Estrato'
,p_source=>'CDGO_ESTRTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_ESTRATO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_estrto d,',
'        cdgo_estrto r',
'   from df_s_estratos',
'   order by r;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el estrato del predio.'
,p_attribute_01=>'MULTI'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57403422246700347)
,p_name=>'P152_ID_INDCDOR_ECNMCO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(229761579430186525)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_INDCDOR_ECNMCO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>unistr('Seleccione de la lista el indicador econ\00F3mico.')
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57404300984700347)
,p_name=>'P152_BSE_MNMA'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(229761579430186525)
,p_use_cache_before_default=>'NO'
,p_source=>'BSE_MNMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>unistr('Ingrese la base m\00EDnima.')
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57405253885700347)
,p_name=>'P152_BSE_MXMA'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(229761579430186525)
,p_use_cache_before_default=>'NO'
,p_source=>'BSE_MXMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>unistr('Ingrese la base m\00E1xima.')
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57406119874700350)
,p_name=>'P152_TRFA'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(229761579430186525)
,p_use_cache_before_default=>'NO'
,p_source=>'TRFA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'Ingrese la tarifa.'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57407053905700351)
,p_name=>'P152_TRFA_1'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(229761579430186525)
,p_source=>'P152_TRFA'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'Ingrese la tarifa.'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57407932071700351)
,p_name=>'P152_AREA_TRRNO_MNMA'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(229761579430186525)
,p_use_cache_before_default=>'NO'
,p_source=>'AREA_TRRNO_MNMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>unistr('Ingrese el \00E1rea del terreno m\00EDnima.')
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57408843586700354)
,p_name=>'P152_AREA_TRRNO_MXMA'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(229761579430186525)
,p_use_cache_before_default=>'NO'
,p_source=>'AREA_TRRNO_MXMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>unistr('Ingrese el \00E1rea del terreno m\00E1xima.')
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57409721524700354)
,p_name=>'P152_AREA_CNSCTRDA_MNMA'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(229761579430186525)
,p_use_cache_before_default=>'NO'
,p_source=>'AREA_CNSCTRDA_MNMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>unistr('Ingrese el \00E1rea del construida m\00EDnima.')
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57410635153700355)
,p_name=>'P152_AREA_CNSCTRDA_MXMA'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(229761579430186525)
,p_use_cache_before_default=>'NO'
,p_source=>'AREA_CNSCTRDA_MXMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>unistr('Ingrese el \00E1rea del construida m\00E1xima.')
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57411539978700355)
,p_name=>'P152_TXTO_TRFA'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(229761579430186525)
,p_use_cache_before_default=>'NO'
,p_source=>'TXTO_TRFA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>unistr('Ingrese la observaci\00F3n que corresponda a la tarifa.')
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(57416084259700387)
,p_validation_name=>'P152_FCHA_INCIAL must be timestamp'
,p_validation_sequence=>50
,p_validation=>'P152_FCHA_INCIAL'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(57398058217700343)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(57416401815700388)
,p_validation_name=>'P152_FCHA_FNAL must be timestamp'
,p_validation_sequence=>60
,p_validation=>'P152_FCHA_FNAL'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(57398927184700344)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(57414813448700387)
,p_validation_name=>'Valida_fecha_fin_no_menor_fecha_inicial'
,p_validation_sequence=>70
,p_validation=>'( :P152_FCHA_INCIAL  < :P152_FCHA_FNAL)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La Fecha Final No puede ser Menor que la Fecha Inicial'
,p_associated_item=>wwv_flow_api.id(57398927184700344)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(57415257290700387)
,p_validation_name=>'Area_Const_max_no_menor_Area_Const_min'
,p_validation_sequence=>90
,p_validation=>'to_number(nvl(:P152_AREA_CNSCTRDA_MNMA,0), ''9G999G999G999G999G999'') <= to_number(nvl(:P152_AREA_CNSCTRDA_MXMA,0), ''9G999G999G999G999G999'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('\00C1rea Construida M\00E1xima no puede ser menor Area construida M\00EDnima')
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(57410635153700355)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(57415621484700387)
,p_validation_name=>'base_max_no_menor_base_min'
,p_validation_sequence=>100
,p_validation=>'to_number(nvl(:P152_BSE_MNMA,0), ''9G999G999G999G999G999'') <= to_number(nvl(:P152_BSE_MXMA,0), ''9G999G999G999G999G999'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('Base M\00E1xima no puede ser menor Base M\00EDnima')
,p_associated_item=>wwv_flow_api.id(57405253885700347)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(57414468420700381)
,p_validation_name=>'Area de terreno mayo que la min'
,p_validation_sequence=>110
,p_validation=>'to_number(nvl(:P152_AREA_TRRNO_MNMA,0), ''9G999G999G999G999G999'') <= to_number(nvl(:P152_AREA_TRRNO_MXMA,0), ''9G999G999G999G999G999'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('El \00E1rea de terreno m\00E1xima debe ser mayor al \00E1rea de terreno m\00EDnima.')
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(57408843586700354)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57419221990700391)
,p_name=>'Closed Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(57412749104700364)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57419715184700391)
,p_event_id=>wwv_flow_api.id(57419221990700391)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57420114282700391)
,p_name=>'Set_Texto_Tarifa'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P152_TRFA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57420671103700391)
,p_event_id=>wwv_flow_api.id(57420114282700391)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$s("P152_TXTO_TRFA", $v("P152_TRFA") + '' / 1000'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57418373823700390)
,p_name=>'Al cambiar fecha de inicio'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P152_FCHA_INCIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57418845376700391)
,p_event_id=>wwv_flow_api.id(57418373823700390)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P152_FCHA_FNAL").datepicker( ''option'' , ''minDate'' , $("#P152_FCHA_INCIAL").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(57417129933700389)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from GI_D_PREDIOS_ESQUEMA'
,p_attribute_02=>'GI_D_PREDIOS_ESQUEMA'
,p_attribute_03=>'P152_ID_PRDIO_ESQMA'
,p_attribute_04=>'ID_PRDIO_ESQMA'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(57417543347700389)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of GI_D_PREDIOS_ESQUEMA'
,p_attribute_02=>'GI_D_PREDIOS_ESQUEMA'
,p_attribute_03=>'P152_ID_PRDIO_ESQMA'
,p_attribute_04=>'ID_PRDIO_ESQMA'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>unistr('Acci\00F3n realizada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(57417991033700389)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(57413195399700365)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(57286797613903039)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(57285152013903023)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Tarifa - Save Interactive Grid Data'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_cdgo_prdio_clsfccion    varchar2(5);',
'    v_id_prdio_uso_slo        number;',
'    v_id_prdio_dstno          number;',
'    v_cdgo_estrto             varchar2(5);   ',
'',
'',
'',
'begin',
'    case :APEX$ROW_STATUS',
'    when ''C'' then',
'    ',
'        for c_predio in (select *',
'                             from table (pkg_gn_generalidades.fnc_ca_split_table (p_cdna           => nvl(:P152_CDGO_PRDIO_CLSFCCION, '' ''),',
'                                                                                  p_crcter_dlmtdor => '':''))) loop',
'            for c_suelo in (select *',
'                               from table (pkg_gn_generalidades.fnc_ca_split_table (p_cdna           => nvl(:P152_ID_PRDIO_USO_SLO, '' ''),',
'                                                                                    p_crcter_dlmtdor => '':''))) loop',
'                for c_destino in (select *',
'                                      from table (pkg_gn_generalidades.fnc_ca_split_table (p_cdna           => nvl(:P152_ID_PRDIO_DSTNO, '' ''),',
'                                                                                           p_crcter_dlmtdor => '':''))) loop',
'                    for c_estrato in (select *',
'                                          from table (pkg_gn_generalidades.fnc_ca_split_table (p_cdna           => nvl(:P152_CDGO_ESTRTO, '' ''),',
'                                                                                           p_crcter_dlmtdor => '':''))) loop',
'                    ',
'  ',
'                    ',
'                       insert into gi_d_predios_esquema(cdgo_clnte,			    id_impsto,			    id_impsto_sbmpsto,	        fcha_incial,		    fcha_fnal,',
'								                         cdgo_prdio_clsfccion,	id_prdio_uso_slo,	    id_prdio_dstno,		        cdgo_estrto,		    area_trrno_mnma,',
'								                         area_trrno_mxma,		area_cnsctrda_mnma,	    area_cnsctrda_mxma,	        bse_mnma,                bse_mxma,',
'                                                         trfa,                  txto_trfa,              id_indcdor_ecnmco,		    id_obra)',
'                                                  values(:F_CDGO_CLNTE,         :P152_ID_IMPSTO,        :P152_ID_IMPSTO_SBMPSTO,    :P152_FCHA_INCIAL,      :P152_FCHA_FNAL,',
'                                                         trim(c_predio.cdna),   trim(c_suelo.cdna),     trim(c_destino.cdna),       trim(c_estrato.cdna),   :AREA_TRRNO_MNMA,',
'                                                         :AREA_TRRNO_MXMA,      :AREA_CNSCTRDA_MNMA,    :AREA_CNSCTRDA_MXMA,        :BSE_MNMA,              :BSE_MXMA,',
'                                                         :TRFA,                 :TRFA || ''/1000'',       :ID_INDCDOR_ECNMCO,          null',
'                                                        );',
'                        ',
'                        ',
'                    end loop; --end c_estrato',
'                end loop;  --end c_destino',
'            end loop;  --end c_suelo',
'        end loop;  --end c_predio                                                                                 ',
'    end case;',
'end;'))
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(57413918693700366)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(57416764995700388)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('Acci\00F3n Realizada con \00E9xito.')
);
end;
/
