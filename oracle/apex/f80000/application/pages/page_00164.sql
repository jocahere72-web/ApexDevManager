prompt --application/pages/page_00164
begin
wwv_flow_api.create_page(
 p_id=>164
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Finalizaci\00F3n de Desembargo Remanente')
,p_step_title=>unistr('Finalizaci\00F3n de Desembargo Remanente')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20240529094250'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(648920500312952602)
,p_plug_name=>unistr('<b>Finalizaci\00F3n de Desembargo Remanente</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(648921290603952610)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'Esta funcionalidad permite:<br><br>',
unistr('Observar los embargos remanentes del sujeto tributo, Tambi\00E9n podemos observar los embargos asociados a ese embargo remanente.<br><br>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(863684854578328186)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>' <br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(866220818095707306)
,p_plug_name=>'Tab embargos'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(17363723095919377)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(866217862864707276)
,p_plug_name=>'<b>Embargos Asociados a Embargo Remanente</b>'
,p_parent_plug_id=>wwv_flow_api.id(866220818095707306)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_embrgos_rslcion',
'        ,a.cnsctvo_embrgo                              as consecutivo',
'        ,to_char(a.fcha_rgstro_embrgo,''DD/MM/YYYY'')    as Fecha_Embargo',
'        ,t.dscrpcion                                   as Estado_Cartera',
'        , a.vgncias                                    as Vigencias',
'        , a.dscrpcion_tipo_embargo                     as Tipo_Embargo',
'from v_mc_g_embargos_resolucion a',
'    join mc_g_embargos_responsable c on c.id_embrgos_crtra = a.id_embrgos_crtra',
'    join v_sg_g_usuarios b on b.id_fncnrio = a.id_fncnrio',
'    join mc_d_estados_cartera t on t.id_estdos_crtra = a.id_estdos_crtra and t.cdgo_estdos_crtra != ''D''    ',
'where rtrim(ltrim(c.idntfccion)) = rtrim(ltrim(:P164_IDNTFCCION_DMNDTE))',
'  and a.id_embrgos_rslcion  in  (select z.id_embrgos_rslcion',
'                                            from mc_g_embrgo_remnte_dtlle z',
'                                            join mc_g_embargos_remanente y on y.id_embrgos_rmnte = z.id_embrgos_rmnte',
'                                           where y.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                                          )',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(866218086526707278)
,p_name=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(866218140243707279)
,p_name=>'CONSECUTIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CONSECUTIVO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Consecutivo Embargo'
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
 p_id=>wwv_flow_api.id(866218272474707280)
,p_name=>'FECHA_EMBARGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA_EMBARGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(866218389640707281)
,p_name=>'ESTADO_CARTERA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTADO_CARTERA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado Cartera'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(866218487690707282)
,p_name=>'VIGENCIAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VIGENCIAS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Vigencias'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(866218524449707283)
,p_name=>'TIPO_EMBARGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIPO_EMBARGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(866217921937707277)
,p_internal_uid=>866217921937707277
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
 p_id=>wwv_flow_api.id(866232683521734388)
,p_interactive_grid_id=>wwv_flow_api.id(866217921937707277)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(866232751680734395)
,p_report_id=>wwv_flow_api.id(866232683521734388)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866233232233734409)
,p_view_id=>wwv_flow_api.id(866232751680734395)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(866218086526707278)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866233641700734414)
,p_view_id=>wwv_flow_api.id(866232751680734395)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(866218140243707279)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866234178430734416)
,p_view_id=>wwv_flow_api.id(866232751680734395)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(866218272474707280)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866234618944734418)
,p_view_id=>wwv_flow_api.id(866232751680734395)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(866218389640707281)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866235115269734421)
,p_view_id=>wwv_flow_api.id(866232751680734395)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(866218487690707282)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866235611263734423)
,p_view_id=>wwv_flow_api.id(866232751680734395)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(866218524449707283)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(866218723830707285)
,p_plug_name=>'<b>Embargo Remanente a Desembargar</b>'
,p_parent_plug_id=>wwv_flow_api.id(866220818095707306)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   a.id_embrgos_rmnte',
'        ,a.nmro_rslcn',
'        ,a.fcha_rslcn',
'        ,a.nro_oficio',
'        ,a.fcha_ofcio',
'        --,cdgo_entdad_tpo',
'        ,decode(a.id_entdad, a.id_entdad, b.nmbre_rzon_scial , ''-'') as id_entdad',
'        ,a.nro_ofcio_jzgdo',
'        ,a.fcha_ofcio_jzgdo',
'        ,a.rdcdo_jzgdo',
'        --,cdgo_tpo_prcso',
'        ,decode(a.cdgo_tpo_prcso, a.cdgo_tpo_prcso, c.nmbre_prcso , ''-'') as cdgo_tpo_prcso',
'        ,a.idntfccion_dmndte',
'        ,a.nmbre_dmndte',
'        ,a.nro_pqr',
'        ,a.fcha_pqr',
'        ,a.observacion',
'        ,a.id_instncia_fljo',
'        ,a.id_fncnrio',
'        ,a.id_slctud ',
'        ,decode(a.cdgo_tpo_idntfccn_dmndt, a.cdgo_tpo_idntfccn_dmndt, d.dscrpcion_idntfccion_tpo , ''-'') as cdgo_tpo_idntfccn_dmndt',
'        ,decode(a.cdgo_estdo_embrgo, a.cdgo_estdo_embrgo, e.dscrpcion , ''-'') as cdgo_estdo_embrgo',
'from mc_g_dsmbrgs_remanente aa',
'join mc_g_embargos_remanente a on aa.id_embrgo_rmnte = a.id_embrgos_rmnte',
'join df_s_entidades b on b.id_entdad = a.id_entdad',
'join mc_d_procesos_remanente c on c.cdgo_tpo_prcso = a.cdgo_tpo_prcso',
'join df_s_identificaciones_tipo d on d.cdgo_idntfccion_tpo = a.cdgo_tpo_idntfccn_dmndt',
'join mc_d_remanentes_rspsta e on e.cdgo_rspsta = a.cdgo_estdo_embrgo',
'where aa.id_instncia_fljo = :F_ID_INSTNCIA_FLJO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23039601228964401)
,p_name=>'CDGO_TPO_IDNTFCCN_DMNDT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TPO_IDNTFCCN_DMNDT'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Tipo Identificaci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
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
 p_id=>wwv_flow_api.id(23039735359964402)
,p_name=>'CDGO_ESTDO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ESTDO_EMBRGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado Remanente'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(217781255161093605)
,p_name=>'ID_ENTDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ENTDAD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Entidad Solicitante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(866218974961707287)
,p_name=>'ID_EMBRGOS_RMNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RMNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(866219006891707288)
,p_name=>'NMRO_RSLCN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RSLCN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Nro. Resoluci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(866219175463707289)
,p_name=>'FCHA_RSLCN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RSLCN'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha Resoluci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
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
 p_id=>wwv_flow_api.id(866219253370707290)
,p_name=>'NRO_OFICIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NRO_OFICIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nro. Oficio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(866219360490707291)
,p_name=>'FCHA_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_OFCIO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Oficio'
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
 p_id=>wwv_flow_api.id(866219553056707293)
,p_name=>'NRO_OFCIO_JZGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NRO_OFCIO_JZGDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nro. Oficio Juzgado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(866219667562707294)
,p_name=>'FCHA_OFCIO_JZGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_OFCIO_JZGDO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Oficio Juzgado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
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
 p_id=>wwv_flow_api.id(866219777687707295)
,p_name=>'RDCDO_JZGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RDCDO_JZGDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Radicado Juzgado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(866219805681707296)
,p_name=>'CDGO_TPO_PRCSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TPO_PRCSO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo Proceso'
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
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(866219992136707297)
,p_name=>'IDNTFCCION_DMNDTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n Demandante')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(866220043733707298)
,p_name=>'NMBRE_DMNDTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Demandante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(866220133241707299)
,p_name=>'NRO_PQR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NRO_PQR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Nro. PQR'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>50
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
 p_id=>wwv_flow_api.id(866220219603707300)
,p_name=>'FCHA_PQR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_PQR'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha PQR'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(866220350804707301)
,p_name=>'OBSERVACION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSERVACION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(866220395395707302)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(866220525111707303)
,p_name=>'ID_FNCNRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FNCNRIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(866220654123707304)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(866218813976707286)
,p_internal_uid=>866218813976707286
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
 p_id=>wwv_flow_api.id(866252361188746973)
,p_interactive_grid_id=>wwv_flow_api.id(866218813976707286)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(866252474723746973)
,p_report_id=>wwv_flow_api.id(866252361188746973)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23045611872966979)
,p_view_id=>wwv_flow_api.id(866252474723746973)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(23039601228964401)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23046087989966995)
,p_view_id=>wwv_flow_api.id(866252474723746973)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(23039735359964402)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217796718545105117)
,p_view_id=>wwv_flow_api.id(866252474723746973)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(217781255161093605)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866252934006746975)
,p_view_id=>wwv_flow_api.id(866252474723746973)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(866218974961707287)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866253480147746977)
,p_view_id=>wwv_flow_api.id(866252474723746973)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(866219006891707288)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866253934379746978)
,p_view_id=>wwv_flow_api.id(866252474723746973)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(866219175463707289)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866254443399746980)
,p_view_id=>wwv_flow_api.id(866252474723746973)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(866219253370707290)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866254987335746986)
,p_view_id=>wwv_flow_api.id(866252474723746973)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(866219360490707291)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866255917965746990)
,p_view_id=>wwv_flow_api.id(866252474723746973)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(866219553056707293)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866256396276746992)
,p_view_id=>wwv_flow_api.id(866252474723746973)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(866219667562707294)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866256901937746995)
,p_view_id=>wwv_flow_api.id(866252474723746973)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(866219777687707295)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866257435781746997)
,p_view_id=>wwv_flow_api.id(866252474723746973)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(866219805681707296)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866257904742747000)
,p_view_id=>wwv_flow_api.id(866252474723746973)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(866219992136707297)
,p_is_visible=>true
,p_is_frozen=>false
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866258474624747002)
,p_view_id=>wwv_flow_api.id(866252474723746973)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(866220043733707298)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866258949236747004)
,p_view_id=>wwv_flow_api.id(866252474723746973)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(866220133241707299)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866259397561747006)
,p_view_id=>wwv_flow_api.id(866252474723746973)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(866220219603707300)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866259863022747008)
,p_view_id=>wwv_flow_api.id(866252474723746973)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(866220350804707301)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866260301078747010)
,p_view_id=>wwv_flow_api.id(866252474723746973)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(866220395395707302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866260802811747015)
,p_view_id=>wwv_flow_api.id(866252474723746973)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(866220525111707303)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(866261377163747017)
,p_view_id=>wwv_flow_api.id(866252474723746973)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(866220654123707304)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1442688564362297199)
,p_plug_name=>'Tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(17363723095919377)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1377860763344426819)
,p_plug_name=>'<b>Documentos</b>'
,p_parent_plug_id=>wwv_flow_api.id(1442688564362297199)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>80
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1442673203756778014)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(1377860763344426819)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.id_dcmnto',
'     , d.id_slctud',
'     , d.file_name ',
'     , d.obsrvcion',
'     , md.dscrpcion_dcmnto',
'     , d.fcha',
'     , case when d.actvo = ''S'' then',
'         ''<span style="color:green;"aria-hidden="true" class="fa fa-check-square"></span>''',
'         else',
'         ''<span style="color:red;"class="fa fa-times-square" aria-hidden="true"></span>''',
'         end actvo',
'  from pq_g_documentos d',
'  join v_pq_d_motivos_documento md',
'    on d.id_mtvo_dcmnto = md.id_mtvo_dcmnto',
'    where id_slctud = :P164_ID_SLCTUD '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(1369911444906897519)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>1369911444906897519
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(217304150017174262)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(217304525660174263)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(217304936349174263)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'<p></p>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(217305392141174263)
,p_db_column_name=>'ID_SLCTUD'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Id Slctud'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(217305708808174268)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(217306105350174268)
,p_db_column_name=>'ACTVO'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Aceptado'
,p_column_html_expression=>'#ACTVO#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(217306512785174269)
,p_db_column_name=>'FCHA'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Fecha Subida'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(1369924912192903786)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2173069'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:OBSRVCION:FCHA:FILE_NAME:ID_DCMNTO:ACTVO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1442663962845775492)
,p_plug_name=>'<b>Datos del Gestor</b>'
,p_parent_plug_id=>wwv_flow_api.id(1442688564362297199)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1442668616520776796)
,p_plug_name=>'<b>Datos del Solicitante</b>'
,p_parent_plug_id=>wwv_flow_api.id(1442688564362297199)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1442911323472099678)
,p_plug_name=>'<b>Datos Solicitud</b>'
,p_parent_plug_id=>wwv_flow_api.id(1442688564362297199)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(217307995956174270)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(863684854578328186)
,p_button_name=>'REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:202:&SESSION.::&DEBUG.:RP,202::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(217308352535174270)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(863684854578328186)
,p_button_name=>'BTN_VER_ACTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Ver Acto'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P164_ID_ACTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(217303449160174262)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1377860763344426819)
,p_button_name=>'BTN_ACTLZAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Actualizar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:15:&SESSION.:BORRAR:&DEBUG.:RP,15:P15_ID_SLCTUD:&P164_ID_SLCTUD.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.id_dcmnto ',
'  from pq_g_documentos d ',
' where id_slctud = :P164_ID_SLCTUD ',
'   and indcdor_actlzar = ''S'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-external-link-square'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(217325159878174319)
,p_branch_name=>unistr('Ir a P\00E1gina 127 Ver acto')
,p_branch_action=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR,P127_COLUMNA_FILENAME:v_gn_g_actos,file_blob,file_mimetype,id_acto,&P164_ID_ACTO.,file_name&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(217308352535174270)
,p_branch_sequence=>60
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P164_ID_ACTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217289794187174240)
,p_name=>'P164_ID_PRSNTCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1442911323472099678)
,p_prompt=>unistr('Tipo de Presentaci\00F3n ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_prsntcion_tpo ',
'  from pq_d_presentaciones_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217290139166174240)
,p_name=>'P164_ID_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1442911323472099678)
,p_prompt=>'Tipo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_tpo',
'  from pq_d_tipos',
'  where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217290572272174240)
,p_name=>'P164_ID_MTVO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1442911323472099678)
,p_prompt=>'Motivo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_mtvo ',
'  from pq_d_motivos',
' where cdgo_clnte = :f_cdgo_clnte',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217290976969174241)
,p_name=>'P164_ID_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1442911323472099678)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217291308918174241)
,p_name=>'P164_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1442911323472099678)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P164_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217291725183174241)
,p_name=>'P164_IDNTFCCION_SJTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(1442911323472099678)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217292133603174242)
,p_name=>'P164_ID_SLCTUD'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(1442911323472099678)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217292543046174242)
,p_name=>'P164_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(1442911323472099678)
,p_prompt=>unistr('N\00FAmero Radicado')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217292985729174242)
,p_name=>'P164_FCHA_RDCDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(1442911323472099678)
,p_prompt=>'Fecha Radicado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217293322615174242)
,p_name=>'P164_OBSRVCION_S'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(1442911323472099678)
,p_prompt=>unistr('Observaci\00F3n de la solicitud')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217293776443174243)
,p_name=>'P164_VLDAR_TRBTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(1442911323472099678)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217294496834174243)
,p_name=>'P164_ID_RDCDOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1442663962845775492)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217294899697174243)
,p_name=>'P164_CDGO_IDNTFCCION_TPO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1442663962845775492)
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217295262613174244)
,p_name=>'P164_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1442663962845775492)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217295671262174244)
,p_name=>'P164_PRMER_NMBRE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1442663962845775492)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217296083010174246)
,p_name=>'P164_SGNDO_NMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(1442663962845775492)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217296408490174246)
,p_name=>'P164_PRMER_APLLDO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(1442663962845775492)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217296842014174247)
,p_name=>'P164_SGNDO_APLLDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(1442663962845775492)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217297536170174247)
,p_name=>'P164_CDGO_RSPNSBLE_TPO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1442668616520776796)
,p_prompt=>'Tipo Radicador'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_rspnsble_tpo',
'     , cdgo_rspnsble_tpo ',
'  from df_s_responsables_tipo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217297967497174247)
,p_name=>'P164_CDGO_IDNTFCCION_TPO_S'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1442668616520776796)
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217298310973174248)
,p_name=>'P164_IDNTFCCION_S'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1442668616520776796)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217298772695174248)
,p_name=>'P164_PRMER_NMBRE_S'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1442668616520776796)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217299189095174248)
,p_name=>'P164_SGNDO_NMBRE_S'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1442668616520776796)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217299536808174248)
,p_name=>'P164_PRMER_APLLDO_S'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(1442668616520776796)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217299978354174248)
,p_name=>'P164_SGNDO_APLLDO_S'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(1442668616520776796)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217300369643174249)
,p_name=>'P164_ID_PAIS_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(1442668616520776796)
,p_prompt=>unistr('Pa\00EDs')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217300778096174249)
,p_name=>'P164_ID_DPRTMNTO_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(1442668616520776796)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_dprtmnto',
'     , id_dprtmnto ',
'  from df_s_departamentos ',
' where id_pais = :P164_ID_PAIS_NTFCCION_S;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P164_ID_PAIS_NTFCCION_S'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217301142524174249)
,p_name=>'P164_ID_MNCPIO_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(1442668616520776796)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mncpio',
'     , id_mncpio ',
'  from df_s_municipios ',
' where id_dprtmnto = :P164_ID_DPRTMNTO_NTFCCION_S'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P164_ID_DPRTMNTO_NTFCCION_S'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>10
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217301566388174249)
,p_name=>'P164_DRCCION_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(1442668616520776796)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_colspan=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217301929468174260)
,p_name=>'P164_EMAIL_S'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(1442668616520776796)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217302305901174261)
,p_name=>'P164_TLFNO_S'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(1442668616520776796)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217302713852174261)
,p_name=>'P164_CLLAR_S'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(1442668616520776796)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217309081626174271)
,p_name=>'P164_ID_EMBRGOS_RMNTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(866220818095707306)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217309496403174271)
,p_name=>'P164_ID_DSMBRGO_RMNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(866220818095707306)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217309805529174271)
,p_name=>'P164_ID_DSMBG_RMNTE_DCMNTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(866220818095707306)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217310200760174271)
,p_name=>'P164_IDNTFCCION_DMNDTE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(866220818095707306)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217310603663174288)
,p_name=>'P164_RSPSTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(866220818095707306)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217311036581174288)
,p_name=>'P164_ID_ACTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(866220818095707306)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(217323029478174316)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargar datos solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_tpo',
'     , id_mtvo',
'     , id_impsto',
'     , id_impsto_sbmpsto',
'     , idntfccion',
'     , id_rdcdor',
'     , id_slctud',
'     , nmro_rdcdo_dsplay',
'     , fcha_rdcdo',
'     , id_prsntcion_tpo ',
'  into :P164_ID_TPO',
'     , :P164_ID_MTVO',
'     , :P164_ID_IMPSTO',
'     , :P164_ID_IMPSTO_SBMPSTO',
'     , :P164_IDNTFCCION_SJTO',
'     , :P164_ID_RDCDOR',
'     , :P164_ID_SLCTUD',
'     , :P164_NMRO_RDCDO_DSPLAY',
'     , :P164_FCHA_RDCDO',
'     , :P164_ID_PRSNTCION_TPO ',
'  from v_pq_g_solicitudes',
'  --where id_instncia_fljo = :F_ID_INSTNCIA_FLJO ;',
'   where id_instncia_fljo = (select id_instncia_fljo from v_pq_g_solicitudes where id_instncia_fljo_gnrdo = :F_ID_INSTNCIA_FLJO);',
'  ',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(217323434634174316)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Radicador'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_idntfccion_tpo',
'     , idntfccion ',
'     , prmer_nmbre ',
'     , sgndo_nmbre ',
'     , prmer_aplldo ',
'     , sgndo_aplldo',
'  into :P164_CDGO_IDNTFCCION_TPO',
'     , :P164_IDNTFCCION',
'     , :P164_PRMER_NMBRE',
'     , :P164_SGNDO_NMBRE',
'     , :P164_PRMER_APLLDO',
'     , :P164_SGNDO_APLLDO',
'  from pq_g_radicador',
' where id_rdcdor = :P164_ID_RDCDOR;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(217323830313174316)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del Solicitante'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_rspnsble_tpo',
'     , cdgo_idntfccion_tpo ',
'     , idntfccion ',
'     , prmer_nmbre ',
'     , sgndo_nmbre ',
'     , prmer_aplldo ',
'     , sgndo_aplldo ',
'     , id_pais_ntfccion ',
'     , id_dprtmnto_ntfccion ',
'     , id_mncpio_ntfccion ',
'     , drccion_ntfccion ',
'     , email ',
'     , tlfno ',
'     , cllar',
'  into :P164_CDGO_RSPNSBLE_TPO',
'     , :P164_CDGO_IDNTFCCION_TPO_S ',
'     , :P164_IDNTFCCION_S',
'     , :P164_PRMER_NMBRE_S',
'     , :P164_SGNDO_NMBRE_S ',
'     , :P164_PRMER_APLLDO_S',
'     , :P164_SGNDO_APLLDO_S',
'     , :P164_ID_PAIS_NTFCCION_S',
'     , :P164_ID_DPRTMNTO_NTFCCION_S',
'     , :P164_ID_MNCPIO_NTFCCION_S',
'     , :P164_DRCCION_NTFCCION_S',
'     , :P164_EMAIL_S',
'     , :P164_TLFNO_S',
'     , :P164_CLLAR_S',
'  from pq_g_solicitantes',
' where id_slctud = :P164_ID_SLCTUD;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(217324241742174316)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar datos resoluci\00F3n ')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  select b.id_embrgos_rmnte',
'        ,b.idntfccion_dmndte',
'        ,a.id_dsmbrgos_rmnte',
'    into :P164_ID_EMBRGOS_RMNTE',
'        ,:P164_IDNTFCCION_DMNDTE',
'        ,:P164_ID_DSMBRGO_RMNTE',
'    from mc_g_dsmbrgs_remanente a',
'    join mc_g_embargos_remanente b on a.id_embrgo_rmnte = b.id_embrgos_rmnte',
'   where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'exception ',
'     when no_data_found then',
'      raise_application_error(-20000, ''Remanente no encontrado.'');',
'        :P164_ID_EMBRGOS_RMNTE 	   := null;',
'        :P164_IDNTFCCION_DMNDTE	   := null;',
'        :P164_ID_DSMBRGO_RMNTE	   := null;',
'     when others        then   ',
'       raise_application_error(-20000, ''Problemas al consultar Remanente'');',
'        :P164_ID_EMBRGOS_RMNTE 	   := null; ',
'        :P164_IDNTFCCION_DMNDTE	   := null;',
'        :P164_ID_DSMBRGO_RMNTE	   := null;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(217324699211174319)
,p_process_sequence=>50
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  a.id_acto, a.id_dsmbg_rmnte_dcmnto',
'      into :P164_ID_ACTO, :P164_ID_DSMBG_RMNTE_DCMNTO',
'      from mc_g_dsmbrg_remnte_dcmnto a',
'     where a.id_dsmbrg_rmnte = :P164_ID_DSMBRGO_RMNTE;',
'exception ',
'    when others then',
'        :P164_ID_ACTO:= null;',
'        :P164_ID_DSMBG_RMNTE_DCMNTO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
