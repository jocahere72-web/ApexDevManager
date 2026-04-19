prompt --application/pages/page_00033
begin
wwv_flow_api.create_page(
 p_id=>33
,p_user_interface_id=>wwv_flow_api.id(30413944355578333)
,p_name=>'Evidencia Email'
,p_page_mode=>'MODAL'
,p_step_title=>'Evidencia Email'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(30302372436578271)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'350'
,p_dialog_width=>'80%'
,p_dialog_chained=>'N'
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20240509165110'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(239981838736333593)
,p_plug_name=>'Evidencia'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(238288074386970852)
,p_plug_name=>unistr('Notificaci\00F3n Email')
,p_parent_plug_id=>wwv_flow_api.id(239981838736333593)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30338884622578288)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select cdgo_tpo_mvmnto',
'           ,rspsta',
'           ,status ',
'           ,fcha_rspsta',
'    from ma_g_envios_medio_respuesta',
'    where id_envio_mdio = :P33_ID_ENVIO_MDIO;',
'      '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(224223639355201732)
,p_name=>'CDGO_TPO_MVMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TPO_MVMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo de Movimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
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
 p_id=>wwv_flow_api.id(224223767940201733)
,p_name=>'RSPSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSPSTA'
,p_data_type=>'CLOB'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Respuesta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>32767
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(224223860513201734)
,p_name=>'STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STATUS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
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
 p_id=>wwv_flow_api.id(224224009772201736)
,p_name=>'FCHA_RSPSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RSPSTA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Respuesta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(224223558327201731)
,p_internal_uid=>224223558327201731
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
 p_id=>wwv_flow_api.id(229472470643491240)
,p_interactive_grid_id=>wwv_flow_api.id(224223558327201731)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(229472541732491240)
,p_report_id=>wwv_flow_api.id(229472470643491240)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(229473039325491243)
,p_view_id=>wwv_flow_api.id(229472541732491240)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(224223639355201732)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>135.795
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(229473589761491246)
,p_view_id=>wwv_flow_api.id(229472541732491240)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(224223767940201733)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>931.79
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(229474004629491248)
,p_view_id=>wwv_flow_api.id(229472541732491240)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(224223860513201734)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90.84374549789429
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(229498199457587046)
,p_view_id=>wwv_flow_api.id(229472541732491240)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(224224009772201736)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>155.38363649368287
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(193595899972522924)
,p_branch_name=>'Go To Page 127'
,p_branch_action=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:NT_G_MEDIO_ENTIDAD_EVDNCIA,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,ID_NTFCION_MDIO_EVDNCIA,&P33_ID_NTFCION_MDIO_EVDNCIA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86922401140612301)
,p_name=>'P33_ID_PRCSO_CRGA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(239981838736333593)
,p_prompt=>'Id Prcso Crga'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(30391508947578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86922522778612302)
,p_name=>'P33_INDCDOR_PRCSDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(239981838736333593)
,p_prompt=>'Indcdor Prcsdo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(30391508947578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(224223998999201735)
,p_name=>'P33_ID_ENVIO_MDIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(238288074386970852)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(193595314321522922)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar datos del responsable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select dscrpcion_idntfccion_tpo,',
'       nmro_idntfccion,',
'       prmer_nmbre,',
'       sgndo_nmbre,',
'       prmer_aplldo,',
'       sgndo_aplldo,',
'       drccion_ntfccion,',
'       nmbre_pais,',
'       nmbre_dprtmnto,',
'       nmbre_mncpio,',
'       email,',
'       tlfno',
'  into :P33_IDNTFCCION_TPO_R,',
'       :P33_NMRO_IDNTFCCION_R,',
'       :P33_PRMER_NMBRE_R,',
'       :P33_SGNDO_NMBRE_R,',
'       :P33_PRMER_APLLDO_R,',
'       :P33_SGNDO_APLLDO_R,',
'       :P33_DRCCION_NTFCCION_R,',
'       :P33_NMBRE_PAIS_R,',
'       :P33_NMBRE_DPRTMNTO_R,',
'       :P33_NMBRE_MNCPIO_R,',
'       :P33_EMAIL_R,',
'       :P33_TLFNO_R',
'  from v_nt_g_ntfccnes_rspnsble',
'  where id_ntfccion_rspnsble = :P33_ID_NTFCCION_RSPNSBLE;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
